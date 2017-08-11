<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.JDBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>list</title>
<link rel="StyleSheet" href="dtree.css" type="text/css"/>
<script type="text/javascript" src="dtree/dtree.js"></script>
</head>
<body>
<%
int uid=10000;
if(session.getAttribute("uid")!=null)
	uid=(Integer)session.getAttribute("uid");
else
	out.println("你未登录，推荐阅读：");
%>
<div class="dtree"  >
 <p><a href="javascript: d.openAll();">展开</a> | <a href="javascript: d.closeAll();">收缩</a></p>
 <script type="text/javascript" >
 
  d = new dTree('d');
  d.add(0,-1,'阅读列表');
  <%
  String sSql1="select * from RSSreader.dbo.rssGroup where uid="+uid;
  System.out.println(sSql1);
  JDBConnection JDBC1=new JDBConnection();
  ResultSet rs1	=JDBC1.executeQuery(sSql1);
  int i=0;
  while(rs1.next())
  {
	  i++;
	  int gid=rs1.getInt(1);
	  String gname=rs1.getString(2);
	  

  %>
	  d.add(<%=i%>,0,'<%=gname%>');
  <%
	  String sSql2="select * from RSSreader.dbo.rssList where gid="+gid;
      JDBConnection JDBC2=new JDBConnection();
      ResultSet rs2	=JDBC2.executeQuery(sSql2);
      int j=0;
      while(rs2.next())
      {
    	j++;
  		int lid=rs2.getInt("lid");
  		String title=rs2.getString("title");
  		String url="rsscontent.jsp?feed="+rs2.getString("url");
  %>
  		d.add(<%=i*10000+j%>,<%=i%>,'<%=title%>','<%=url%>','','mainFrame');
  		 <%
      }
	JDBC2.closeConnection();
  }
  JDBC1.closeConnection();
 %>
  //d.add(33,0,'安全退出系统','index.jsp','','_parent');

  document.write(d);  
 </script>
 </div>
 
 <div>
 <script LANGUAGE="JavaScript">
　　<!--
  	function openwin(url,height) {
		var attribute="dialogWidth:640px;dialogHeight:"+height+"px;center:yes;help:no;resizable:yes;status:no";
		showModalDialog(url,'传递的参数',attribute);
	}
	function refresh() {
		window.location.reload();
	}
	//-->
	</script>
<p>
<%
if(session.getAttribute("uid")!=null)
{
%>
<a href="#" onClick="refresh()">刷新</a> |
<a href="#" onClick="openwin('addRss.jsp',180)">添加</a> |
<a href="#" onClick="openwin('manage.jsp',360)">管理</a>
<%
}
%>
 </div>
</body>
</html>