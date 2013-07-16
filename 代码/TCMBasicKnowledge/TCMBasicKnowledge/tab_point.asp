<%@ Language=VBScript %>
<html>
<head>
<title>国家经络穴位标准数据加工</title>
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
	strSQL="select * from C_GJJLXWBZ where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<center>
<form name="formCont" action="post_point.asp" method="post">
	<table width="800" border="0" class="table2">
        <tr> 
          <td colspan="4" class="title1">国家经络穴位标准
		  <input name="NextChoice" type="hidden">
        <input name="ID" type="hidden" value="<%=ID%>">
		  </td>
        </tr>
        <tr> 
          <td width="125"><div align="right">标准名称：</div></td>
          <td width="173"><input name="BZMC" type="text" value="<%=oraRS.fields("BZMC").value%>"></td>
          <td width="231"><div align="right">标准级别分类：</div></td>
          <td width="249"><input name="BZJBFL" type="text" value="<%=oraRS.fields("BZJBFL").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">标准代码：</div></td>
          <td><input name="BZDM" type="text" value="<%=oraRS.fields("BZDM").value%>"></td>
          <td><div align="right">标准制定日期：</div></td>
          <td><input name="BZZDRQ" type="text" value="<%=oraRS.fields("BZZDRQ").value%>"></td>
        </tr>
        <tr>
          <td><div align="right">标准起草单位：</div></td>
          <td><input name="BZQCDW" type="text" value="<%=oraRS.fields("BZQCDW").value%>"></td>
          <td><div align="right">标准认定技术委员会：</div></td>
          <td><input name="BZRDJSWYH" type="text" value="<%=oraRS.fields("BZRDJSWYH").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">标准监制单位：</div></td>
          <td><input name="BZJZDW" type="text" value="<%=oraRS.fields("BZJZDW").value%>"></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
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
