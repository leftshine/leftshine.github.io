<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet,com.dataHelper,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>editGroup</title>
</head>

<%
String lastEdit = request.getParameter("lastEdit");

String lastAdd = request.getParameter("lastAdd");
String title ="";
String url ="";
String tip=""; 
String Sgid=""; 
String Lastgid =request.getParameter("Lastgid");
String lid =request.getParameter("lid");
String select=Lastgid;
String sSql="select * from rssList where lid="+lid;
System.out.println("editGroup.Sql:"+sSql);
JDBConnection JDBC=new JDBConnection();
ResultSet rs=JDBC.executeQuery(sSql);
if(rs.next())
{
	 title=rs.getString("title");
	 url=rs.getString("url");
}

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
if(lastEdit!=null){
	 if(lastEdit.equals("ture")){
			tip="修改成功";	
		}
	 if(lastEdit.equals("false")){
			tip="修改失败";	
		}
	 select=Sgid;
	}
	
%>
<body onload="document.all.group.value = <%=select%>">
<div align="center" >
	<form name="form_editGroup" method="post" action="dealeditRss">
	<input type="hidden" name="lid" value=<%=lid %>>
	<input type="hidden" name="Lastgid" value=<%=Lastgid %>>
	<input type="hidden" name="from" value="editRss">
	<table border="0" align="center">
      	<tr>
        	<td height="30">Feed地址：</td>
        	
        	<td height="30"><input width="20" type="text" size="50" name="url" value=<%=url%>></td>
      	</tr>
      	<tr>
        	<td height="30">标题：</td>
        	<td height="30">
        		<input type="text" name="title" value=<%=title %>>&nbsp;&nbsp;
        		<input align="right" type=button name="getTitle" value=" 从feed中提取" onclick="form_editGroup.action='getFeedTitle';form_editGroup.submit()">
        	</td>
      	</tr>
      	<tr>
			<td>分组:</td>
			<td>
			<select name="group">
			<%
			
				//int gid;
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
        	<td height="30" align="right"><input type=button name="btn_editRss" value="保存" onclick="form_editGroup.action='dealeditRss';form_editGroup.submit()"></td>
      	</tr>
    	</table>
	
	</form>
</div>
<br>
<br>
<div align="center">
<a  href=rssListOfGroup.jsp?gid=<%=Lastgid %>>返回</a>
</div>
</body>
</html>