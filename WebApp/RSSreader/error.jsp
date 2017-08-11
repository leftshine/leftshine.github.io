<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>error</title>
</head>
<%
	String str	= request.getParameter("str");
	if(str!=null)
		str =new String(str.getBytes("ISO8859_1"), "utf-8");
	else 
		str="未知错误";
%>

<body>
<div align="center">
<br>
<h4><%=str %></h4>
<p><input type="button" name="back" value="返回" onclick="javascript:history.go(-1);"/>
</div>
</body>
</html>