<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>提示</title>
</head>
<body >
<div align="center">
<h4>
<%

String type = request.getParameter("type");
String str	= request.getParameter("str");
int time=3;
String gourl="";
	if(type==null){
		out.println("未知错误");
		gourl="index.jsp";	
	}
	else
	{	
		//log
		if(type.equals("logout")){
			session.invalidate();
			out.println("退出成功！");
			gourl="index.jsp";	
		}
		if(type.equals("logfail")){
			out.println("登录失败！请检查用户名和密码是否正确。");
			gourl="login.jsp";	
		}
		if(type.equals("notlog")){
			out.println("您未登录！");
			gourl="login.jsp";	
		}
		if(type.equals("unknow")){
			out.println("未知错误！");
			gourl="login.jsp";	
		}
		if(type.equals("blacklist")){
			out.println("你是黑名单用户不能登录！");
			gourl="login.jsp";	
		}
		//signup
		if(type.equals("signupwithwrongpwd")){
			out.println("两次输入密码不一致");
			gourl="signup.jsp";			
		}
		if(type.equals("signupsuccess")){
			out.println("注册成功！<p>您的登录用户名为："+str+"<br>请牢记！");
			time=10;
			gourl="login.jsp";
		}
		if(type.equals("usernamevalid")){
			out.println("用户名已经被使用，请重新注册！");
			gourl="signup.jsp";
		}
		if(type.equals("sinupfail")){
			out.println("注册失败，请重试！");
			gourl="signup.jsp";
		}
		if(type.equals("rssContentfail")){
			out.println("未能获取到阅读列表<p>请检查网络与feed源是否正常<p>");
			gourl="main.jsp";
			time=10;
		}				
	}
%>
</h4>
<p>
<br>
正在跳转到相应页面，<a href="<% out.print(gourl); %>">点此</a>直接跳转……
</div>
</body>
<% 
out.print("<meta http-equiv='refresh' content='"+time+"; url="+gourl+"; charset=utf-8'>");
%>
</html>