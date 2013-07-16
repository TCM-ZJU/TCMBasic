<%@ Language=VBScript %>
<html>
<head>
<title>病证症数据加工</title>
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
	strSQL="select * from C_BZZZ where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<center>
<form name="formCont" action="post_sickness.asp" method="post">
  <table width="800" border="0" class="table2">
    <tr> 
      <td colspan="4" class="title1">疾病证候症状
	  <input name="NextChoice" type="hidden">
        <input name="ID" type="hidden" value="<%=ID%>">
	  </td>
    </tr>
    <tr> 
      <td colspan="4"><div align="center">
		<select name="LX">
            <option value="0" selected>疾病</option>
            <option value="1">证候</option>
          </select>
        </div></td>
    </tr>
    <tr> 
      <td width="126"><div align="right">名称：</div></td>
        <td width="177"><input name="MC" type="text" value="<%=oraRS.fields("MC").value%>"></td>
      <td width="212"><div align="right">预防：</div></td>
      <td width="263"><input name="YF" type="text" value="<%=oraRS.fields("YF").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">病位：</div></td>
      <td><input name="BW" type="text" value="<%=oraRS.fields("BW").value%>"></td>
      <td><div align="right">性质：</div></td>
      <td><input name="XZ" type="text" value="<%=oraRS.fields("XZ").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">强度：</div></td>
      <td><input name="QD" type="text" value="<%=oraRS.fields("QD").value%>"></td>
      <td><div align="right">相关症状：</div></td>
      <td><input name="ZZXX" type="text" value="<%=oraRS.fields("ZZXX").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">治疗：</div></td>
      <td><input name="ZL" type="text" value="<%=oraRS.fields("ZL").value%>"></td>
      <td><div align="right">出处：</div></td>
      <td><input name="CC" type="text" value="<%=oraRS.fields("CC").value%>"></td>
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
