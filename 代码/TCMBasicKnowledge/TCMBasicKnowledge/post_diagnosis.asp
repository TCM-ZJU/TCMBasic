<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>�ϴ���Ϸ�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
	dim ID
	ID=request.Form("ID")
	dim NextChoice
	NextChoice=request.Form("NextChoice")
'	response.Write(ID)
'	response.Write(NextChoice)
	dim user
	dim strSQL
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS
	
	if ID="-1" then
		dim colfield
		dim colvalue
		User=Session("UserAccount")
		colfield=" ( ID,LB,MC,FF,YYFW,LEIB,GJBZ,BJZT,LRRY,LRRQ) "
		colvalue=" ( -1,0,'"&request.Form("MC")&"'"
		colvalue=colvalue&",'"&request.Form("FF")&"'"
		colvalue=colvalue&",'"&request.Form("YYFW")&"'"
		colvalue=colvalue&",'"&request.Form("LEIB")&"'"
		colvalue=colvalue&",'"&request.Form("GJBZ")&"',1,'"&user&"','"&SYSDATE&"') "
		strSQL="insert into C_ZDFFLX"&colfield&"values"&colvalue
'		response.Write(strSQL)
		oraDB.BeginTrans
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	
	else
		strSQL="select * from C_ZDFFLX where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("MC").value=request.Form("MC")
		oraRS.fields("FF").value=request.Form("FF")
		oraRS.fields("YYFW").value=request.Form("YYFW")
		oraRS.fields("LEIB").value=request.Form("LEIB")
		oraRS.fields("GJBZ").value=request.Form("GJBZ")
		if NextChoice=3 then
			oraRS.fields("BJZT").value=2
		else
			oraRS.fields("BJZT").value=1
		end if
		oraRS.Update
	end if
	
	if NextChoice=1 then
		response.Redirect("tab_diagnosis.asp?IsNew=1")
	end if
	if NextChoice=2 then
		response.Redirect("selectTable.htm")
	end if
	if NextChoice=3 then
%>
��Уͨ��
<a href="javascript:history.go(-2)">�����б�</a>
<%
	end if
%>
</body>
</html>
