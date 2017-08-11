<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>editGroup</title>
</head>
<body>
<div align="center">
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
	String lid =request.getParameter("lid");
	String type =request.getParameter("type");
	String url="";
	//DELETE FROM 表名称 WHERE 列名称 = 值
	String sSql="";
	if(type!=null){
		 if(type.equals("g")){
			 sSql="delete from rssGroup where gid="+gid;
			 url="manage.jsp";
			}
		 if(type.equals("r")){
			 sSql="delete from rssList where lid="+lid;
			 url="rssListOfGroup.jsp?gid="+gid;
			}	
		}
	System.out.println("rssListOfGroup.Sql:"+sSql);
	JDBConnection JDBC=new JDBConnection();
	if(JDBC.executeUpdate(sSql)){
		out.print("删除成功");
	}
	else{
		out.print("删除失败");
		
	}
%>

</div>
<br>
<div align="center">
<a  href=<%=url %>>返回</a>
</div>
</body>
</html>