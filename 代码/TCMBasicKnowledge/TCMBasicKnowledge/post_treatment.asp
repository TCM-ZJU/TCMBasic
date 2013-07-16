<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>上传中医基础理论数据</title>
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
		colfield=" ( ID,MC,BZMC,FF,YYFW,ZLLX,GJBZ,BJZT,LRRY,LRRQ) "
		colvalue=" ( -1,'"&request.Form("MC")&"'"
		colvalue=colvalue&",'"&request.Form("BZMC")&"'"
		colvalue=colvalue&",'"&request.Form("FF")&"'"
		colvalue=colvalue&",'"&request.Form("YYFW")&"'"
		colvalue=colvalue&",'"&request.Form("ZLLX")&"'"
		colvalue=colvalue&",'"&request.Form("GJBZ")&"',1,'"&user&"','"&SYSDATE&"') "
		strSQL="insert into C_ZLFF"&colfield&"values"&colvalue
'		response.Write(strSQL)
		oraDB.BeginTrans
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	
	else
		strSQL="select * from C_ZLFF where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("MC").value=request.Form("MC")
		oraRS.fields("BZMC").value=request.Form("BZMC")
		oraRS.fields("FF").value=request.Form("FF")
		oraRS.fields("YYFW").value=request.Form("YYFW")
		oraRS.fields("ZLLX").value=request.Form("ZLLX")
		oraRS.fields("GJBZ").value=request.Form("GJBZ")
		if NextChoice=3 then
			oraRS.fields("BJZT").value=2
		else
			oraRS.fields("BJZT").value=1
		end if
		oraRS.Update
	end if
	
	if NextChoice=1 then
		response.Redirect("tab_treatment.asp?IsNew=1")
	end if
	if NextChoice=2 then
		response.Redirect("selectTable.htm")
	end if
	if NextChoice=3 then
%>
审校通过
<a href="javascript:history.go(-2)">返回列表</a>
<%
	end if
%>
</body>
</html>
