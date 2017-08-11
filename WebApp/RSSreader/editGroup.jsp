<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>editGroup</title>
</head>
<body>
<%
String name=(String)session.getAttribute("name");
String nickname="";
if(name==null)
{
	 response.sendRedirect("index.jsp");
} 
%>
<%
	String gid =request.getParameter("gid");
	System.out.println("rssListOfGroup.gid:"+gid);
	String sSql1="select * from rssGroup where gid="+gid;
	System.out.println("rssListOfGroup.Sql:"+sSql1);
	JDBConnection JDBC=new JDBConnection();
	ResultSet rs=JDBC.executeQuery(sSql1);
	String gname="";
	if(rs.next())
	{
		 gname=rs.getString("gname");
	}
%>
<div align="center">
	<form name="form_editGroup" method="post" action="dealeditGroup">
	<br>
	<br>
	<br>
	<p>修改组名
	<input type="hidden" name="gid" value=<%=gid %>>
	<input type="text" name="gname" value=<%=gname %>>
	<input  type="submit" name="Submit" value="保存 ">
	</form>
</div>
<br>
<div align="center">
 <% 
 String lastEdit = request.getParameter("lastEdit");
 System.out.println("lastEdit:"+lastEdit);
 if(lastEdit!=null){
	 if(lastEdit.equals("ture")){
			out.println("修改成功");	
		}
	 if(lastEdit.equals("false")){
			out.println("修改失败");	
		}	
	}
 %>
 	</div>
<br>
<div align="center">
<a  href=manage.jsp>返回</a>
</div>
</body>
</html>