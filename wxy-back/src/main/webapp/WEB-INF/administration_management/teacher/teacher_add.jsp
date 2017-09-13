<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教师信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"/>
    <script src="http://cdn.bootcss.com/html5shiv/r29/html5.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script src="${pageContext.request.contextPath }/js/My97DatePicker/WdatePicker.js"></script>
    <script type='text/javascript'>
   
$(function(){
    $(".link > a").click(function(){
        $(this).next().slideToggle(200,function(){
            //TODO
        });
    });
});
</script>
</head>
<body>

<main>
    <div class="main_left">
        <h2>用户名<span>${loginUser.name }</span></h2>
        <ul>
            <li><a href="${pageContext.request.contextPath }/grade/toGrade.do" class="grade" target="leftFrame">年级结构</a></li>
            <li><a href="${pageContext.request.contextPath }/subject/toSubject.do" class="subject" target="leftFrame">学科管理</a></li>
            <li><a href="${pageContext.request.contextPath }/teacher/listTeacher.do" class="teachers" target="leftFrame">教师信息</a></li>
            <li><a href="${pageContext.request.contextPath }/student/listStudent.do" class="students" target="leftFrame">学生管理</a></li>
            <li><a href="${pageContext.request.contextPath }/album/toAlbum.do" class="album" target="leftFrame">班级相册</a></li>
        </ul>
    </div>
    <div class="detail">
        <article class="info_add">
            <section class="top">
                <a href="${pageContext.request.contextPath }/toAddwechar.do" target="leftFrame">首页 ></a>
                <a href="${pageContext.request.contextPath }/grade/toGrade.do" target="leftFrame">教务管理 ></a>
                <a href="${pageContext.request.contextPath }/teacher/listTeacher.do" target="leftFrame">教师信息</a>
            </section>
           
            <div class="add_con">
                <h2>教师信息</h2>
                <div class="info_con">
                 <form action="${pageContext.request.contextPath }/teacher/addTeacher.do?sid=${requestScope.schoolid}" method="post" enctype="multipart/form-data">
                 <div  class="add_left">
                        <figure>
                            <img src="${pageContext.request.contextPath }/images/portrait.jpg">
                            <figcaption>头像预览</figcaption>
                            <div class="clear"></div>
                        </figure>  
                        <p>更换头像照片
                            <input type="file" class="file" name="fileName" accept="image/png,image/gif,image/jpg">  
                        </p>       
                        <div>
                            <label><span>*</span>教师姓名：</label>
                            <input name="name" type="text" class="text" />
                            <span></span>
                        </div>
                        <div>
                            <label><span>*</span>教师职务：</label>
                            <select name="station">
                                <option value="">请选择教师职务</option>
                                <c:forEach items="${roles }" var="role">
					            <option value="${role.name}">${role.name}</option>
					            </c:forEach>
                            </select>
                            <span></span>
                        </div>
                        <div>
                            <label>个人简介：</label>
                            <textarea name="introduce" placeholder="请输入简介，不超过80个字..."></textarea>
                            <span></span>
                        </div>
                    </div>
                    <div class="add_right">
                        <div class="info">
                            <div>
                                <label><span>*</span>性别：</label>
                                <select name="sex">
                                    <option value="">请选择性别</option>
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                                <p></p>
                            </div>
                            <div>
                                <label>年龄：</label>
                                <input name="age" type="text" />
                            </div>
                            <div>
                                <label>邮箱：</label>
                                <input name="email" type="text" />
                            </div>
                            <div>
                                <label>微信号：</label>
                                <input name="wechatnum" type="text" />
                            </div>
                            <div>
                                <label><span>*</span>手机号码：</label>
                                <input name="phonenum" type="text" />
                                <p></p>
                            </div>
                            <div>
                                <label>毕业院校：</label>
                                <input name="gardschool" type="text" />
                            </div>
                            <div>
                                <label>工龄：</label>
                                <input name="jobtime" type="text" />
                            </div>
                            <div>
                                <label>入职时间：</label>
                                <input name="entrytime" class="Wdate" type="text" onClick="WdatePicker()">
                            </div>
                            <div>
                                <label>工号：</label>
                                <input name="num" type="text" />
                            </div>
                            <div>
                                <label>学科：</label>
                                <select name="subjectname">
                                    <option value="">请选择学科</option>
                                    <c:forEach items="${subject }" var="sub">
					                 <option value="${sub.name }">${sub.name }</option>
					                </c:forEach>
                                </select>
                            </div>
                            <div>
                                <label>年级：</label>
                                <select name="gradeid">
                                    <option value="">请选择年级</option>
                                    <c:forEach items="${grades }" var="grade">
					                 <option value="${grade.id }">${grade.name }</option>
					                </c:forEach>					                
                                </select>
                                 
                            </div>
                            <div>
                                <label>班级：</label>
                                <select name="classid">
                                    <option value="">请选择班级</option>
                                    <c:forEach items="${classes }" var="cls">
					                 <option value="${cls.id }">${cls.name }</option>
					                </c:forEach>
                                </select>
                            </div>
                        </div>
                        </div>
                        <div class="clear"></div>
                        <div class="btn">

                    <button class="save" type="submit">保存</button>
                    <a href="${pageContext.request.contextPath }/teacher/listTeacher.do"><button class="close" type="button">关闭</button></a>   
                </div>
                    </form>
                    <div class="clear"></div>
                </div>
                
                
            </div>       
        </article>      
    </div>
    
</main>
<!--系统提示-->
<div class="tip">
    <h2>系统提示</h2>
    <p>上传图片大小超过1M，请重新上传！</p>
    <button type="button">关闭</button>
</div>
</body>
</html>