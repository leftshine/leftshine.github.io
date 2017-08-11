<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>
</head>
<body>

<div style="float:left;">
<img src="img/logo.png" alt="logo" height="30" /><font size="5" >RSS Reader</font>
</div>
<div style="float:right">
<% 
String name=(String)session.getAttribute("name");
String nickname="";
if(name==null)
{
%>
	你还未登录，<a href="login.jsp"target="_parent">登录</a>	或 <a href="signup.jsp"target="_parent">注册</a>	
<%
}
else
{	String sSql="select nickname from users where uname='"+name+"'";
	JDBConnection JDBC=new JDBConnection();
	ResultSet rs	=JDBC.executeQuery(sSql);
	if(rs.next()){
		nickname=rs.getString(1);
		JDBC.closeConnection();
	}
	System.out.println("nick："+nickname+"-"+name);
	if (nickname==null||nickname==""){
		nickname=name;
	}
	out.print("欢迎你，"+nickname);
%>
&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="tips.jsp?type=logout"target="_parent">退出</a>	
<%
}
%>
</div>
</body>
</html>