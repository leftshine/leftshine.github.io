<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="ReStable.jsp" flush="true"/> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分组管理</title>
</head>
<body onunload="javascript:;window.opener.location.reload()">
<%
String name=(String)session.getAttribute("name");
String nickname="";
if(name==null)
{
	 response.sendRedirect("index.jsp");
} 
%>
<div align="center">
<p>分组管理
<table>
<thead>
<tr>
<th>分组</th>
<th>操作</th>
</tr>
</thead>
<%	
	int uid=10000;
	if(session.getAttribute("uid")!=null)
		uid=(Integer)session.getAttribute("uid");
	System.out.println("manage.uid:"+uid);
	String sSql1="select * from rssGroup where uid="+uid;
	System.out.println("manage.Sql:"+sSql1);
	JDBConnection JDBC=new JDBConnection();
	ResultSet rs=JDBC.executeQuery(sSql1);
	while(rs.next())
	{
		int gid=rs.getInt("gid");
		String gname=rs.getString("gname");
%>
		<tr>
		<td><a href=rssListOfGroup.jsp?gid=<%=gid%>><%=gname%></a></td>
		<td>
		<a href=rssListOfGroup.jsp?gid=<%=gid%>>展开</a>|
		<a href=editGroup.jsp?gid=<%=gid%>>修改</a> |
		<%-- <a href=delete.jsp?type=g&gid=<%=gid%>>删除</a> --%>
		<a href="javascript:if(confirm('删除组将会删除该组内所有RSS源，确定删除该组?'))location='delete.jsp?type=g&gid=<%=gid%>'">删除</a>
		</td>
		</tr>
<%
	}
	JDBC.closeConnection();
%>
<script LANGUAGE="JavaScript">
　　<!--
  function openwin(url) {
	showModalDialog(url,'传递的参数','dialogWidth:640px;dialogHeight:320px;center:yes;help:no;resizable:yes;status:no') 
}
	//-->
	</script>
<p>

</table>
</div>
<!-- <div align="center"><a href="addGroup.jsp?from=manage">添加分组</a></div> -->
</body>
</html>