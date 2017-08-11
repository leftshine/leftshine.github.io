<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="ReStable.jsp" flush="true"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>RSS源管理</title>
</head>
<body>
<div align="center">
<p>RSS源管理
<table>
<thead>
<tr>
<th>RSS源</th>
<th>操作</th>
</tr>
</thead>
<%
	String gid =request.getParameter("gid");
	System.out.println("rssListOfGroup.gid:"+gid);
	String sSql1="select * from rssList where gid="+gid;
	System.out.println("rssListOfGroup.Sql:"+sSql1);
	JDBConnection JDBC=new JDBConnection();
	ResultSet rs=JDBC.executeQuery(sSql1);
	if(!rs.isBeforeFirst())
		out.print("<div align='center'>该组无内容，请重新选择</div> ");
	while(rs.next())
	{
		int lid=rs.getInt("lid");
		String title=rs.getString("title");
		String url=rs.getString("url");
		
%>
		<tr>
		<td><%=title%><br><%=url%></td>
		<td>
		<a href=editRss.jsp?Lastgid=<%=gid%>&lid=<%=lid%>>修改</a> |
		<a href="javascript:if(confirm('删除不可恢复，确定删除?'))location='delete.jsp?type=r&gid=<%=gid%>&lid=<%=lid%>'">删除</a>
		
		</td>
		</tr>
<%
	}
	JDBC.closeConnection();
%>
</table>
<br>
<br>
<!-- <div align="center"><a href="addRss.jsp">添加源</a></div> -->
<div align="center"><a  href=manage.jsp>返回</a></div> 
</div>
</body>
</html>