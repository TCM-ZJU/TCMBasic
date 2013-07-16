<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>在线人数</TITLE>
<link href="common.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onblur="window.close();" class="body">
<CENTER>
<%
	dim OraDatabase
	set OraDatabase = OraSession.GetDatabaseFromPool(10)

	dim OraDynaset
	set OraDynaset = OraDatabase.CreateDynaset("select CUSER from CUSER where LOCKED=1",0)
	
	if OraDynaset.RecordCount=0 then
		Response.Write "没有用户登陆！"
	else
		Response.Write "<H3>在线用户" & OraDynaset.RecordCount & "人</H3><HR color=fuchsia>"
		Response.Write "<TABLE>"
		
		while not OraDynaset.EOF
			Response.Write "<TR><TD>" & OraDynaset.Fields("CUSER").Value & "</TD></TR>"
			OraDynaset.MoveNext
		wend
		
		Response.Write "</TABLE>"
	end if
%>
</BODY>
</HTML>