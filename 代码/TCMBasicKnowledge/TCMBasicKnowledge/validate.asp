<%@ Language=VBScript %>
<HTML>
<HEAD>
<TITLE>用户校验</TITLE>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK href="script/table.css" rel="stylesheet" type="text/css">
<link href="common.css" rel="stylesheet" type="text/css">
</HEAD>
<body class="body">
<% 
	dim UserName
	UserName=Request.Form("txtName") 
	dim Passwd
	Passwd=Request.Form("txtPwd")  
	dim OraDatabase
	set OraDatabase=OraSession.GetDatabaseFromPool(60)
	dim strSQL
	strSQL="select CUSER,PASSWD,EDATE,ENABLED,CLEVEL,locked from CUser where CUSER='" &  UserName &"'" &" and Passwd='" & Passwd & "'"
	dim OraDynaset 
	Set OraDynaset = OraDatabase.CreateDynaset(strSQL,0)
   
	if Oradynaset.recordcount=0 then
%>    
<center><h1>错误信息</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=red>用户名/密码错误</font><br><br><br>
<INPUT type="button" value=" 返回 " id=button1 name=button1 onclick ="history.go(-1)"><br><br><br>
<hr color=fuchsia border="2"><br><br>
</center>
<%		 
	else
		if OraDynaset.fields("EDATE").value<date() then
		 
%>
<center><h1>错误信息</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=red>改帐号已过期</font><br><br><br>
<INPUT type="button" value=" 返回 " id=button1 name=button1 onclick ="history.go(-1)"><br><br><br>
<hr color=fuchsia border="2"><br><br>
</center>
<%	 
		else
			if oradynaset.fields("ENABLED").value=0 then
%>
<center><h1>错误信息</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=red>该帐号停用</font><br><br><br>
<INPUT type="button" value=" 返回 " id=button1 name=button1 onclick ="history.go(-1)"><br><br><br>
<hr color=fuchsia border="2"><br><br>
</center>
<%
			else
				'登录信息正确
				Session("UserAccount")=UserName
				OraDatabase.ExecuteSQL "Update Cuser set Locked=1 where Cuser='" & UserName &"'"
					  
				if CINT(Request.Form("Type"))=0 then '录入数据
					Response.Redirect "selectTable.htm"							
				else   '管理
				if OraDynaset.fields("CLEVEL").value=1 then          '管理员无需锁定
					Response.Redirect "userList.asp"	
				else
%>
<center><h1>错误信息</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=blue>您的帐号不具备管理权限，请返回！</font></center>
<br><A HREF="Login.htm">返回至登陆</A><br><br>
<hr color=fuchsia border="2"><br><br>
<%
					end if
				end if
			end if
		end if
	end if
%>
<CENTER><BR><FONT size=2>TCM Online Co. Ltd.</FONT></CENTER></BODY>
</HTML>