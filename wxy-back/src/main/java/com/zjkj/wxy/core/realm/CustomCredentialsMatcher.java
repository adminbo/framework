package com.zjkj.wxy.core.realm;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.atomic.AtomicInteger;

import javax.annotation.Resource;


public class CustomCredentialsMatcher extends SimpleCredentialsMatcher{

	
	
	private Cache<String,AtomicInteger> passwordRetryCache ;
	     @Autowired
	    public CustomCredentialsMatcher(CacheManager cacheManager) {
	    	passwordRetryCache = cacheManager.getCache("passwordRetryCache");  
	     }
	    
	     @Override
	     public boolean doCredentialsMatch(AuthenticationToken token,
	             AuthenticationInfo info) {
	         String loginName = (String) token.getPrincipal();
	        AtomicInteger retryCount = passwordRetryCache.get(loginName);
	        if(retryCount==null){
             retryCount = new AtomicInteger();
	             passwordRetryCache.put(loginName, retryCount);
	         }
	         if(retryCount.incrementAndGet()>5){
	             throw new ExcessiveAttemptsException();
	         }
	         boolean matchs = super.doCredentialsMatch(token, info);
	         if(matchs){
	             passwordRetryCache.remove(loginName);
	        }
	         return super.doCredentialsMatch(token, info);
	     }
	 
	     public Cache<String, AtomicInteger> getPasswordRetryCache() {
	         return passwordRetryCache;
	     }
	 
	     public void setPasswordRetryCache(Cache<String, AtomicInteger> passwordRetryCache) {
	         this.passwordRetryCache = passwordRetryCache;
	     }
	     
}
