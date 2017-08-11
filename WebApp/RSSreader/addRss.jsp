<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet,com.dataHelper,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加RSS源</title>
<link href="css/tab.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<% 
 String lastAdd = request.getParameter("lastAdd");
 String title ="";
 String url ="";
 String tip=""; 
 String Sgid=""; 
 
 if(request.getParameter("title")!=null)
 {
	 title=new String(request.getParameter("title").getBytes("ISO8859_1"), "utf-8");
 }
 if(request.getParameter("url")!=null)
 {
	 url=request.getParameter("url");
 }
 if(request.getParameter("group")!=null)
 {
	 Sgid=request.getParameter("group");
 }
 if(lastAdd!=null){
	 String name =new String(request.getParameter("name").getBytes("ISO8859_1"), "utf-8");
	 if(lastAdd.equals("ture")){
			tip="成功添加RSS源："+name;	
		}
	 if(lastAdd.equals("false")){
			tip="添加RSS源失败";	
		}	
	}
 %>

<body onload="document.all.group.value = <%=Sgid%>" onunload="javascript:;window.opener.location.reload()">
<div id="wrapper">
<div align="center">
<div>添加源&nbsp;|&nbsp;<a href="addGroup.jsp">添加分组</a></div>
<form name="form_addRss" method="post" action="dealAddRss">
		<input type="hidden" name="from" value="addRss">
		<table border="0" align="center">
      	<tr>
        	<td height="30">Feed地址：</td>
        	<td height="30"><input type="text" size="40"  name="url" value=<%=url %>></td>
      	</tr>
      	<tr>
        	<td height="30">标题：</td>
        	<td height="30">
        		<input type="text" name="title" value=<%=title%>>&nbsp;&nbsp;&nbsp;&nbsp;
        		<input align="right" type=button name="getTitle" value=" 从feed中提取" onclick="form_addRss.action='getFeedTitle';form_addRss.submit()">
        	</td>
      	</tr>
      	<tr>
			<td>分组:</td>
			<td>
			<select name="group">
			<%
			
				int gid;
				String gname;
				int uid;
				Object memo;
				int i;
			
			dataHelper dhp=new dataHelper();
			ArrayList<dataHelper.Group> groupList =dhp.getGroup((Integer)session.getAttribute("uid"));
			for(i=0;i<groupList.size();i++)
			{
				dataHelper.Group group=groupList.get(i);
			%>
			
			<option value="<%=group.getGid()%>"><%=group.getGname()%></option>
			
			<%
			}
			%>
			</select>
			</td>
      	</tr>
      	<tr>
      	<td>&nbsp;</td>
      	<td><%=tip %></td>
      	</tr>
      	<tr>
        	<td height="30">&nbsp;</td>
        	<td height="30" align="right"><input type="submit" name="Submit" value="添加" onclick="form_addRss.action='dealAddRss'"></td>
      	</tr>
    	</table>
	 </form>
</div> 
<div align="center">
 
 	</div>
 	</div>
</body>
</html>