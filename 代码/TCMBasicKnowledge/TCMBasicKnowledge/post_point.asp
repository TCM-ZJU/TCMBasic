<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>上传国家经络穴位标准数据</title>
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
		colfield=" ( ID,BZMC,BZJBFL,BZDM,BZZDRQ,BZQCDW,BZRDJSWYH,BZJZDW,BJZT,LRRY,LRRQ) "
		colvalue=" ( -1,'"&request.Form("BZMC")&"'"
		colvalue=colvalue&",'"&request.Form("BZJBFL")&"'"
		colvalue=colvalue&",'"&request.Form("BZDM")&"'"
		colvalue=colvalue&",'"&request.Form("BZZDRQ")&"'"
		colvalue=colvalue&",'"&request.Form("BZQCDW")&"'"
		colvalue=colvalue&",'"&request.Form("BZRDJSWYH")&"'"
		colvalue=colvalue&",'"&request.Form("BZJZDW")&"',1,'"&user&"','"&SYSDATE&"') "
		strSQL="insert into C_GJJLXWBZ"&colfield&"values"&colvalue
'		response.Write(strSQL)
		oraDB.BeginTrans
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	
	else
		strSQL="select * from C_GJJLXWBZ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("BZMC").value=request.Form("BZMC")
		oraRS.fields("BZJBFL").value=request.Form("BZJBFL")
		oraRS.fields("BZDM").value=request.Form("BZDM")
		oraRS.fields("BZZDRQ").value=request.Form("BZZDRQ")
		oraRS.fields("BZQCDW").value=request.Form("BZQCDW")
		oraRS.fields("BZRDJSWYH").value=request.Form("BZRDJSWYH")
		oraRS.fields("BZJZDW").value=request.Form("BZJZDW")
		if NextChoice=3 then
			oraRS.fields("BJZT").value=2
		else
			oraRS.fields("BJZT").value=1
		end if
		oraRS.Update
	end if
	
	if NextChoice=1 then
		response.Redirect("tab_point.asp?IsNew=1")
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
