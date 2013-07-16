<%@ Language=VBScript %>
<HTML>
<HEAD>
<TITLE>用户信息</TITLE>
<LINK href="script/table.css" rel="stylesheet" type="text/css">
<link href="common.css" rel="stylesheet" type="text/css">
</HEAD>
<body class="body">
<%
	'intStatus=0  浏览
	'intStatus=1  添加
	
	dim intStatus
	intStatus=CInt(Request.QueryString("Status"))
	 
	set OraDatabase=OraSession.GetDatabaseFromPool(60)
	set OraDynaset = OraDatabase.CreateDynaset("select CUSER,PASSWD,CLEVEL,CNAME,DESCRIPTION,TO_CHAR(CDATE,'YYYY-MM-DD') as CCDATE,EDATE,ENABLED,LOCKED from CUSER where CUSER='" & Request("Name") & "'",0)
%>
<CENTER><h1>用户信息</h1><BR>
<hr color=fuchsia border="2"><br>
<FORM action="UserOperate.asp" method=post name="formUser">
<TABLE WIDTH=* BORDER=1 CELLPADDING=3 CELLSPACING=0 class="itable">
<%
	if intStatus=0 then '浏览，从数据库中读取
%>
<SCRIPT LANGUAGE=JavaScript>
<!--
function buttonUpdate_onclick()
{
	formUser.buttonSubmit.disabled=false;
	formUser.buttonPrivilege.disabled=true;
	formUser.buttonUpdate.disabled=true;
	formUser.buttonDelete.disabled=true;
	formUser.buttonCancel.disabled=false;
	formUser.action.value ="0";

	for(i=0; i<=8; i++)
		formUser(i).disabled=false;

	formUser.CUSER.readOnly=true;
	formUser.CDATE.readOnly=true;
}

function buttonDelete_onclick()
{
	if (window.confirm("你真的要删除这条记录吗？"))
	{
		formUser.CUSER.disabled=false;
		formUser.action.value="1";
		return true;
	}
	else
		return false;
}

function buttonBack_onclick()
{
	window.location="UserList.asp";
}

function buttonSubmit_onclick()
{
	if (formUser.CUSER.value=="")
	{
		alert("请输入用户帐号");
		return false;
	}
	else
		return true;
}

function buttonCancel_onclick()
{
	formUser.buttonSubmit.disabled=true;
	formUser.buttonPrivilege.disabled=false;
	formUser.buttonUpdate.disabled=false;
	formUser.buttonDelete.disabled=false;
	formUser.buttonCancel.disabled=true;
	formUser.reset();
	return true;
}

//-->
</SCRIPT>
<TR><TD class="itd">用户帐号</TD><TD class="itd"><INPUT disabled type=text name=CUSER size=30 value="<% =OraDynaset.Fields("CUSER") %>"></TD></TR>
<TR><TD class="itd">用户密码</TD><TD class="itd"><INPUT disabled type=text name=PASSWD size=30 value="<% =OraDynaset.Fields("PASSWD") %>"></TD></TR>
<TR><TD class="itd">用户级别</TD><TD class="itd"><INPUT disabled type=text name=CLEVEL size=30 value="<% =OraDynaset.Fields("CLEVEL") %>"></TD></TR>
<TR><TD class="itd">中文名字</TD><TD class="itd"><INPUT disabled type=text name=CNAME size=30 value="<% =OraDynaset.Fields("CNAME") %>"></TD></TR>
<TR><TD class="itd">用户描述</TD><TD class="itd"><INPUT disabled type=text name=DESCRIPTION size=30 value="<% =OraDynaset.Fields("DESCRIPTION") %>"></TD></TR>
<TR><TD class="itd">创建日期</TD><TD class="itd"><INPUT disabled type=text name=CDATE size=18 value="<% =OraDynaset.Fields("CCDATE") %>"><FONT size=2 color=red>(YYYY-MM-DD)</FONT></TD></TR>
<TR><TD class="itd">失效日期</TD><TD class="itd"><INPUT disabled type=text name=EDATE size=18 value="<% =OraDynaset.Fields("EDATE") %>"><FONT size=2 color=red>(YYYY-MM-DD)</FONT></TD></TR>
<TR><TD class="itd">帐户有效</TD><TD class="itd"><SELECT disabled name=ENABLED style="width:220px"><OPTION value='1' <% if OraDynaset.Fields("ENABLED").Value=1 then Response.Write "selected" %>>是</OPTION><OPTION value='0' <% if OraDynaset.Fields("ENABLED").Value=0 then Response.Write "selected" %>>否</OPTION></SELECT></TD></TR>
<TR><TD class="itd">用户在线</TD><TD class="itd"><SELECT disabled name=LOCKED style="width:220px"><OPTION value='1'<% if OraDynaset.Fields("LOCKED").Value=1 then Response.Write "selected" %>>是</OPTION><OPTION value='0' <% if OraDynaset.Fields("LOCKED").Value=0 then Response.Write "selected" %>>否</OPTION></SELECT></TD></TR>
<%
	else  '添加数据
%>
<SCRIPT language=JavaScript>
<!--
function buttonBack_onclick()
{
	window.location="UserList.asp";
}

function buttonSubmit_onclick()
{
	if (formUser.CUSER.value=="")
	{
		alert("请输入用户帐号");
		return false;
	}
	else
		return true;
}
-->
</SCRIPT>
<TR><TD class="itd">用户帐号</TD><TD class="itd"><INPUT type=text name=CUSER size=30 value=""></TD></TR>
<TR><TD class="itd">用户密码</TD><TD class="itd"><INPUT type=text name=PASSWD size=30 value=""></TD></TR>
<TR><TD class="itd">用户级别</TD><TD class="itd"><INPUT type=text name=CLEVEL size=30 value=""></TD></TR>
<TR><TD class="itd">中文名字</TD><TD class="itd"><INPUT type=text name=CNAME size=30 value=""></TD></TR>
<TR><TD class="itd">用户描述</TD><TD class="itd"><INPUT type=text name=DESCRIPTION size=30 value=""></TD></TR>
<TR><TD class="itd">创建日期</TD><TD class="itd"><INPUT type=text name=CDATE size=18 value="<% =Date() %>" readonly><FONT size=2 color=red>(YYYY-MM-DD)</FONT></TD></TR>
<TR><TD class="itd">失效日期</TD><TD class="itd"><INPUT type=text name=EDATE size=18 value=""><FONT size=2 color=red>(YYYY-MM-DD)</FONT></TD></TR>
<TR><TD class="itd">帐户有效</TD><TD class="itd"><SELECT name=ENABLED style="width:220px"><OPTION value='1' selected>是</OPTION><OPTION value='0'>否</OPTION></SELECT></TD></TR>
<TR><TD class="itd">用户在线</TD><TD class="itd"><SELECT name=LOCKED style="width:220px"><OPTION value='1'>是</OPTION><OPTION value='0' selected>否</OPTION></SELECT></TD></TR>
<%
 	end if
%>
</TABLE><BR>
</CENTER>
<A HREF="login.htm">返回至登陆</A><BR>
<CENTER>
<%
	if intStatus=0 then '浏览
%>
<INPUT type=button value=" 返回 " name=buttonBack onclick="return buttonBack_onclick();">
<INPUT type=button value=" 修改 " name=buttonUpdate onclick="return buttonUpdate_onclick();">
<INPUT type=submit value=" 删除 " name=buttonDelete onclick="return buttonDelete_onclick();">
<INPUT type=submit value=" 提交 " name=buttonSubmit disabled onclick="return buttonSubmit_onclick();">
<INPUT type=reset  value=" 取消 " name=buttonCancel disabled onclick="return buttonCancel_onclick();">
<INPUT type=hidden name=action value="0">
<%
	else '添加 
%>
<INPUT type=button value=" 返回 " name=buttonBack onclick="return buttonBack_onclick();">	    
<INPUT type=submit value=" 提交 " name=buttonSubmit onclick="return buttonSubmit_onclick();">			 
<INPUT type=hidden name=action value="2">
<%
	end if
%>
</CENTER>
</FORM>
<FORM action="UserDetail.asp?Name=<%=Request.QueryString("Name")%>"  method=post name=formReload>
</FORM>
<hr color=fuchsia border="2"><BR>
<CENTER><BR><FONT size=2>TCM Online Co. Ltd.</FONT></CENTER></BODY>
</HTML>