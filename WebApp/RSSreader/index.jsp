<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RSS阅读器</title>
</head>

<frameset rows="50,*" cols="*" frameborder="yes" border="2" framespacing="2">
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="200,*" frameborder="yes" border="2" framespacing="2">
    <frame src="left.jsp" name="leftFrame" scrolling="auto" id="leftFrame" title="leftFrame" />
    <frame src="main.jsp" name="mainFrame" scrolling="auto" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
