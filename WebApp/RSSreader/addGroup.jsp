<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet,com.dataHelper,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加分组</title>
<link href="css/tab.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<% 
String lastAdd = request.getParameter("lastAdd");
String from = request.getParameter("from");
String tip="";
String backurl="";
String backname="";
 if(lastAdd!=null){
	 String name =new String(request.getParameter("name").getBytes("ISO8859_1"), "utf-8");
	 if(lastAdd.equals("ture")){
			tip="成功添加分组："+name;	
		}
	 if(lastAdd.equals("false")){
			tip="添加分组失败";	
		}	
	}
	 
 %>
<body onunload="javascript:;window.opener.location.reload()">
<div id="wrapper">
<div align="center">
<div><a href="addRss.jsp">添加源</a>&nbsp;|&nbsp;添加分组</div>
<form name="form_addGroup" method="post" action="dealAddGroup">
		<table border="0" align="center">
      	<tr>
        	<td height="30">组名：</td>
        	<td height="30">
        	<input type="text" size="40"  name="gname">
        	<input type="hidden" name="uid" value="<%=session.getAttribute("uid")%>">
        	</td>
      	</tr>
      	<tr>
      	<td>&nbsp;</td>
      	<td><%=tip %></td>
      	</tr>
        <tr>
        	<td height="30">&nbsp;</td>
        	<td height="30" align="right"><input type="submit" name="Submit" value="添加"></td>
      	</tr>
    	</table>
	 </form>
</div>
</div>
</body>
</html>