<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>上传病证症数据</title>
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
		colfield=" ( ID,MC,LX,BW,YF,XZ,QD,ZL,CC,ZZXX,BJZT,LRRY,LRRQ) "
		colvalue=" ( -1,'"&request.Form("MC")&"'"
		colvalue=colvalue&",'"&request.Form("LX")&"'"
		colvalue=colvalue&",'"&request.Form("BW")&"'"
		colvalue=colvalue&",'"&request.Form("YF")&"'"
		colvalue=colvalue&",'"&request.Form("XZ")&"'"
		colvalue=colvalue&",'"&request.Form("QD")&"'"
		colvalue=colvalue&",'"&request.Form("ZL")&"'"
		colvalue=colvalue&",'"&request.Form("CC")&"'"
		colvalue=colvalue&",'"&request.Form("ZZXX")&"',1,'"&user&"','"&SYSDATE&"') "
		strSQL="insert into C_BZZZ"&colfield&"values"&colvalue
'		response.Write(strSQL)
		oraDB.BeginTrans
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	
	else
		strSQL="select * from C_BZZZ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("MC").value=request.Form("MC")
		oraRS.fields("LX").value=request.Form("LX")
		oraRS.fields("BW").value=request.Form("BW")
		oraRS.fields("YF").value=request.Form("YF")
		oraRS.fields("XZ").value=request.Form("XZ")
		oraRS.fields("QD").value=request.Form("QD")
		oraRS.fields("ZL").value=request.Form("ZL")
		oraRS.fields("CC").value=request.Form("CC")
		oraRS.fields("ZZXX").value=request.Form("ZZXX")
		if NextChoice=3 then
			oraRS.fields("BJZT").value=2
		else
			oraRS.fields("BJZT").value=1
		end if
		oraRS.Update
	end if
	
	if NextChoice=1 then
		response.Redirect("tab_sickness.asp?IsNew=1")
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
