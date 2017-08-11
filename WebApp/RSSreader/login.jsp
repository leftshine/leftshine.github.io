<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>

<link type="text/css" rel="stylesheet" href="CSS/style.css">
<title>登录</title>
</head>

<script type="text/javascript">
	function formCheck() {
		if (document.form1.account.value == "") {
			window.alert("请输入用户名");
			return false;
		}
		if (document.form1.password.value == "") {
			window.alert("请输入密码");
			return false;
		}
		return true;
	}
	function checkUsername(oField){
		re2= /^[0-9a-zA-Z]*$/g;
		if(!re2.test(oField.value)){
			alert("用户名只能为字母与数字的组合");
			oField.focus();
			return false;
		}	
	}
	function IsValid( oField )
	{
		re= /select|update|delete|exec|count|'|"|=|;|>|<|%/i;
		switch(oField.name)
		{
		case "account":
			str="用户名"
		  break;
		case "nickname":
			str="昵称"
		  break;
		case "password":
			str="密码"
		  break;
		case "ensurepassword":
			str="确认密码"
		  break;
		default:
			str="输入中"
		}
		$sMsg = str+"包含非法内容，请重新输入"
		if ( re.test(oField.value) )
		{
			alert( $sMsg );
			oField.value = '';
			oField.focus();
			return false;
		}
	}
</script>

<body>
<%
if(session.getAttribute("name")!=null)
	response.sendRedirect("index.jsp");
%>

<br>

<table width="307" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="78A3D3">
  <tr>
    <td  valign="top" align="center" bgcolor="#FFFFFF">
	<br>
	<font size="4pt">登录</font>
	<hr width="90%" color="#999999">
	<form name="form1" method="post" action="login" onsubmit="return formCheck()">
	<table width="244" border="0" align="center">
      <tr>
        <td height="30">用户名：</td>
        <td height="30"><input type="text" name="account" style="ime-mode:disabled" onblur="checkUsername(this)"></td>
      </tr>
      <tr>
        <td height="30">密码：</td>
        <td height="30"><input type="password" name="password" onblur="IsValid(this);"></td>
      </tr>
	  <!--      <tr>
        <td height="30">性别：          </td>
        <td height="30">
          <input name="sex" type="radio" class="cannleLine" value="男" checked="checked">
           &nbsp;男&nbsp;&nbsp;&nbsp;
          <input name="sex" type="radio" class="cannleLine" value="女">
         &nbsp;女
       </td>
          </tr> -->
	  
      <tr>
        <td width="82" height="30">&nbsp;</td>
        <td width="152" align="right"><input  type="submit" name="Submit" value=" 登录 "></td>
      </tr>
    </table>
	 </form>
	
	</td>
  </tr>
</table>
<br>
<div align="center">
还没有账号？<u></u><b><u></u></b><a href="signup.jsp"><b><u>点击这里</u></b></a>注册！</div>
</body>
</html>
