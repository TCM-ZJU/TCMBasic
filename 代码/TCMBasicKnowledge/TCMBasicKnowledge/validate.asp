<%@ Language=VBScript %>
<HTML>
<HEAD>
<TITLE>�û�У��</TITLE>
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
<center><h1>������Ϣ</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=red>�û���/�������</font><br><br><br>
<INPUT type="button" value=" ���� " id=button1 name=button1 onclick ="history.go(-1)"><br><br><br>
<hr color=fuchsia border="2"><br><br>
</center>
<%		 
	else
		if OraDynaset.fields("EDATE").value<date() then
		 
%>
<center><h1>������Ϣ</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=red>���ʺ��ѹ���</font><br><br><br>
<INPUT type="button" value=" ���� " id=button1 name=button1 onclick ="history.go(-1)"><br><br><br>
<hr color=fuchsia border="2"><br><br>
</center>
<%	 
		else
			if oradynaset.fields("ENABLED").value=0 then
%>
<center><h1>������Ϣ</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=red>���ʺ�ͣ��</font><br><br><br>
<INPUT type="button" value=" ���� " id=button1 name=button1 onclick ="history.go(-1)"><br><br><br>
<hr color=fuchsia border="2"><br><br>
</center>
<%
			else
				'��¼��Ϣ��ȷ
				Session("UserAccount")=UserName
				OraDatabase.ExecuteSQL "Update Cuser set Locked=1 where Cuser='" & UserName &"'"
					  
				if CINT(Request.Form("Type"))=0 then '¼������
					Response.Redirect "selectTable.htm"							
				else   '����
				if OraDynaset.fields("CLEVEL").value=1 then          '����Ա��������
					Response.Redirect "userList.asp"	
				else
%>
<center><h1>������Ϣ</h1><BR><BR>
<hr color=fuchsia border="2"><br><br>
<font color=blue>�����ʺŲ��߱�����Ȩ�ޣ��뷵�أ�</font></center>
<br><A HREF="Login.htm">��������½</A><br><br>
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