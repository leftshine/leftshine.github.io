<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.text.SimpleDateFormat"%>
<html>
<jsp:include page="ReStable.jsp" flush="true"/> 
<script language=javascript> 
function setCheck(){ 
	var newWindow=document.getElementById("newWindow").value;
	if(newWindow==0)
	{
		document.getElementById("check").checked=true;
	}
	else
	{
	document.getElementById("check").checked=false;
	}
}

function check(){ 
var check=document.getElementById("check").checked; 
var feed=document.getElementById("feed").value;
var url="rsscontent.jsp?feed="+feed;
if(check)
	{
	document.cookie="newWindow=0";
	}
else
	{
	document.cookie="newWindow=1";
	}
self.location=url;
} 
</script> 

<body onload="setCheck()">

<%
String pageTitle="";
String urlStr = request.getParameter("feed");
String target="";

Cookie cookies[]=request.getCookies(); //读出用户硬盘上的Cookie，并将所有的Cookie放到一个cookie对象数组里面
Cookie sCookie=null; 
for(int i=0;i<cookies.length;i++){    //用一个循环语句遍历刚才建立的Cookie对象数组
sCookie=cookies[i];   //取出数组中的一个Cookie对象
if(sCookie!=null){
	 
      if(("newWindow").equals(sCookie.getName())){      
    	  pageContext.setAttribute("newWindow",sCookie.getValue());
    	  System.out.println(pageContext.getAttribute("newWindow"));
    	  }
      }
}
if(pageContext.getAttribute("newWindow")!=null)
{
if(pageContext.getAttribute("newWindow").equals("0")){
	target="_blank";
}
else{
	target="_self";
}
}

try{
/*java.util.Properties systemSettings = System.getProperties();
systemSettings.put("http.proxyHost", "mywebcache.com");
systemSettings.put("http.proxyPort", "8080");
System.setProperties(systemSettings);  */
if (!urlStr.startsWith("http://"))
		urlStr = "http://"+request.getParameter("feed");
//String urlStr = "http://feed.cnblogs.com/blog/u/249598/rss";
//System.out.println(urlStr);
java.net.URLConnection feedUrl = new java.net.URL(urlStr).openConnection();
feedUrl.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
com.sun.syndication.io.SyndFeedInput input = new com.sun.syndication.io.SyndFeedInput();
com.sun.syndication.feed.synd.SyndFeed feed = input.build(new com.sun.syndication.io.XmlReader(feedUrl));
pageTitle=feed.getTitle();

%>
<div align="center">
<h1><%=pageTitle%></h1>

<input type="hidden" id="feed" value=<%=urlStr %>>
<input type="hidden" id="newWindow" value=<%=pageContext.getAttribute("newWindow")%>> 
<input type=checkbox name="check" id="check"  onclick="check()">在新窗口中打开(部分网页不支持在框架中显示，请尝试勾选此项)</input>
<table >
<thead>
<tr>
<th>序号</th>
<th>标题</th>
<th>发布时间</th>
</tr>
</thead>
<% 
String date=":( 获取失败";
java.util.List list = feed.getEntries();
for (int i=0; i< list.size(); i++) {
com.sun.syndication.feed.synd.SyndEntry entry = (com.sun.syndication.feed.synd.SyndEntry)list.get(i);
SimpleDateFormat sdf = new SimpleDateFormat();
sdf.applyPattern("yyyy.MM.dd HH:mm");
if(entry.getPublishedDate()!=null)
{
	date=sdf.format(entry.getPublishedDate());
}
%>
<tr>
<td><%=i+1%></td>
<td><a id="entry" href="<%=entry.getLink()%>" target=<%=target %>><%=entry.getTitle()%></a></td>
<td><%=date %></td>
</tr>
<%
}
} catch (Exception e) {
	// TODO Auto-generated catch block
	response.sendRedirect("tips.jsp?type=rssContentfail");
	e.printStackTrace();
} 
%>
</table>
</div> 
<br>
<div align="center">
<b>By <a href="http://easyrss.tk/" target="_parent">RSS Reader</a> 你的云上RSS阅读器</b>
</div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript">
var jiathis_config = {data_track_clickback:'true'};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?move=0&amp;uid=2108236" charset="utf-8"></script>
<!-- JiaThis Button END -->

</body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=pageTitle%></title>
</head>
</html>