<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>上传病因病机数据</title>
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
		colfield=" ( ID,MC,BZMC,LX,TJ,BW,XZ,TD,ZZ,YS,ZH,BJZT,LRRY,LRRQ) "
		colvalue=" ( -1,'"&request.Form("MC")&"'"
		colvalue=colvalue&",'"&request.Form("BZMC")&"'"
		colvalue=colvalue&",'"&request.Form("LX")&"'"
		colvalue=colvalue&",'"&request.Form("TJ")&"'"
		colvalue=colvalue&",'"&request.Form("BW")&"'"
		colvalue=colvalue&",'"&request.Form("XZ")&"'"
		colvalue=colvalue&",'"&request.Form("TD")&"'"
		colvalue=colvalue&",'"&request.Form("ZZ")&"'"
		colvalue=colvalue&",'"&request.Form("YS")&"'"
		colvalue=colvalue&",'"&request.Form("ZH")&"',1,'"&user&"','"&SYSDATE&"') "
		strSQL="insert into C_BYBJ"&colfield&"values"&colvalue
		
		oraDB.BeginTrans
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	
	else
		strSQL="select * from C_BYBJ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("MC").value=request.Form("MC")
		oraRS.fields("BZMC").value=request.Form("BZMC")
		oraRS.fields("LX").value=request.Form("LX")
		oraRS.fields("BW").value=request.Form("BW")
		oraRS.fields("TJ").value=request.Form("TJ")
		oraRS.fields("XZ").value=request.Form("XZ")
		oraRS.fields("TD").value=request.Form("TD")
		oraRS.fields("ZZ").value=request.Form("ZZ")
		oraRS.fields("YS").value=request.Form("YS")
		oraRS.fields("ZH").value=request.Form("ZH")
		if NextChoice=3 then
			oraRS.fields("BJZT").value=2
		else
			oraRS.fields("BJZT").value=1
		end if
		oraRS.Update
	end if
	
	if NextChoice=1 then
		response.Redirect("tab_pathogeny.asp?IsNew=1")
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
