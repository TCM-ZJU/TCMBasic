<%@ Language=VBScript %>
<html>
<head>
<title>解剖数据加工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
	function SameClick()
	{
		document.forms("formCont").NextChoice.value=1;
		formCont.submit()
	}
	function OtherClick()
	{
		document.forms("formCont").NextChoice.value=2;
		formCont.submit()
	}
	function FirstClick()
	{
		document.forms("formCont").NextChoice.value=3;
		formCont.submit()
	}
//-->
</script>
</head>

<body class="body">
<%
	dim IsNew
	IsNew=request.QueryString("IsNew")
	dim ID
	if IsNew=1 then
		ID=-1
	else
		ID=request.Form("ID")
	end if
	
	dim strSQL
	strSQL="select * from C_ZYJCLUJP where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<center>
<form name="formCont" action="post_anatomy.asp" method="post">
	<table width="800" border="0" class="table2">
        <tr> 
          <td colspan="4" class="title1">解剖
		  <input name="NextChoice" type="hidden">
          <input name="ID" type="hidden" value="<%=ID%>">
		  </td>
        </tr>
        <tr> 
          <td width="126"><div align="right">名称：</div></td>
          <td width="191"><input name="MC" type="text" value="<%=oraRS.fields("MC").value%>"></td>
          <td width="198"><div align="right">生成：</div></td>
          <td width="263"><input name="GSSC" type="text" value="<%=oraRS.fields("GSSC").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">形态：</div></td>
          <td><input name="XT" type="text" value="<%=oraRS.fields("XT").value%>"></td>
          <td><div align="right">定位：</div></td>
          <td><input name="DW" type="text" value="<%=oraRS.fields("DW").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">特性：</div></td>
          <td><input name="TX" type="text" value="<%=oraRS.fields("TX").value%>"></td>
          <td><div align="right">功能：</div></td>
          <td><input name="GN" type="text" value="<%=oraRS.fields("GN").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">关联：</div></td>
          <td><input name="GL" type="text" value="<%=oraRS.fields("GL").value%>"></td>
          <td><div align="right">国家标准：</div></td>
          <td><input name="GJBZ" type="text" value="<%=oraRS.fields("GJBZ").value%>"></td>
        </tr>
        <tr> 
          <td colspan="4"><hr color="#3399FF"></td>
        </tr>
        <tr> 
          <td colspan="2"> <div align="left">
            <input name="FirstCheck" type="button" class="button1" value="数据审校通过" onClick="return FirstClick()" <%if IsNew=1 then response.Write("disabled") end if%>>
          </div></td>
        <td colspan="2"><div align="right"> 
            <input name="SameWork" type="button" class="button1" value="完成，继续加工该表数据" onClick="return SameClick()">
            <input name="OtherWork" type="button" class="button1" value="完成，重新选择加工表" onClick="return OtherClick()">
            <input name="Cancel" type="reset" class="button1" value="取消">
          </div></td>
        </tr>
      </table>
</form>
</center>
</body>
</html>
