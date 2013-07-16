<%@ Language=VBScript %>
<html>
<head>
<title>疗效数据加工</title>
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
	strSQL="select * from C_ZDFFLX where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<center>
<form name="formCont" action="post_effect.asp" method="post">
    <table width="800" border="0" class="table2">
      <tr> 
      <td colspan="4" class="title1">疗效
	  <input name="NextChoice" type="hidden">
        <input name="ID" type="hidden" value="<%=ID%>">
	  </td>
    </tr>
    <tr> 
      <td width="126"><div align="right">名称：</div></td>
      <td width="176"><input name="MC" type="text" value="<%=oraRS.fields("MC").value%>"></td>
      <td width="213"><div align="right">方法：</div></td>
      <td width="263"><input name="FF" type="text" value="<%=oraRS.fields("FF").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">应用范围：</div></td>
      <td><input name="YYFW" type="text" value="<%=oraRS.fields("YYFW").value%>"></td>
      <td><div align="right">类别：</div></td>
      <td><input name="LEIB" type="text" value="<%=oraRS.fields("LEIB").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">国家标准：</div></td>
      <td><input name="GJBZ" type="text" value="<%=oraRS.fields("GJBZ").value%>"></td>
      <td><div align="right">病证名称：</div></td>
      <td><input name="BZMC" type="text" value="<%=oraRS.fields("BZMC").value%>"></td>
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
