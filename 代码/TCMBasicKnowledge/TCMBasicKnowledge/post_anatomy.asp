<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>上传解剖数据</title>
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
		colfield=" ( ID,LB,MC,TX,XT,GN,GSSC,DW,GL,GJBZ,BJZT,LRRY,LRRQ) "
		colvalue=" ( -1,1,'"&request.Form("MC")&"'"
		colvalue=colvalue&",'"&request.Form("TX")&"'"
		colvalue=colvalue&",'"&request.Form("XT")&"'"
		colvalue=colvalue&",'"&request.Form("GN")&"'"
		colvalue=colvalue&",'"&request.Form("GSSC")&"'"
		colvalue=colvalue&",'"&request.Form("DW")&"'"
		colvalue=colvalue&",'"&request.Form("GL")&"'"
		colvalue=colvalue&",'"&request.Form("GJBZ")&"',1,'"&user&"','"&SYSDATE&"') "
		strSQL="insert into C_ZYJCLUJP"&colfield&"values"&colvalue
'		response.Write(strSQL)
		oraDB.BeginTrans
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	
	else
		strSQL="select * from C_ZYJCLUJP where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("MC").value=request.Form("MC")
		oraRS.fields("TX").value=request.Form("TX")
		oraRS.fields("XT").value=request.Form("XT")
		oraRS.fields("GN").value=request.Form("GN")
		oraRS.fields("GSSC").value=request.Form("GSSC")
		oraRS.fields("DW").value=request.Form("DW")
		oraRS.fields("GL").value=request.Form("GL")
		oraRS.fields("GJBZ").value=request.Form("GJBZ")
		if NextChoice=3 then
			oraRS.fields("BJZT").value=2
		else
			oraRS.fields("BJZT").value=1
		end if
		oraRS.Update
	end if
	
	if NextChoice=1 then
		response.Redirect("tab_anatomy.asp?IsNew=1")
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
