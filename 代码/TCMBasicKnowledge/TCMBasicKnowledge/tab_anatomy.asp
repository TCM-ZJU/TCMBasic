<%@ Language=VBScript %>
<html>
<head>
<title>�������ݼӹ�</title>
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
          <td colspan="4" class="title1">����
		  <input name="NextChoice" type="hidden">
          <input name="ID" type="hidden" value="<%=ID%>">
		  </td>
        </tr>
        <tr> 
          <td width="126"><div align="right">���ƣ�</div></td>
          <td width="191"><input name="MC" type="text" value="<%=oraRS.fields("MC").value%>"></td>
          <td width="198"><div align="right">���ɣ�</div></td>
          <td width="263"><input name="GSSC" type="text" value="<%=oraRS.fields("GSSC").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">��̬��</div></td>
          <td><input name="XT" type="text" value="<%=oraRS.fields("XT").value%>"></td>
          <td><div align="right">��λ��</div></td>
          <td><input name="DW" type="text" value="<%=oraRS.fields("DW").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">���ԣ�</div></td>
          <td><input name="TX" type="text" value="<%=oraRS.fields("TX").value%>"></td>
          <td><div align="right">���ܣ�</div></td>
          <td><input name="GN" type="text" value="<%=oraRS.fields("GN").value%>"></td>
        </tr>
        <tr> 
          <td><div align="right">������</div></td>
          <td><input name="GL" type="text" value="<%=oraRS.fields("GL").value%>"></td>
          <td><div align="right">���ұ�׼��</div></td>
          <td><input name="GJBZ" type="text" value="<%=oraRS.fields("GJBZ").value%>"></td>
        </tr>
        <tr> 
          <td colspan="4"><hr color="#3399FF"></td>
        </tr>
        <tr> 
          <td colspan="2"> <div align="left">
            <input name="FirstCheck" type="button" class="button1" value="������Уͨ��" onClick="return FirstClick()" <%if IsNew=1 then response.Write("disabled") end if%>>
          </div></td>
        <td colspan="2"><div align="right"> 
            <input name="SameWork" type="button" class="button1" value="��ɣ������ӹ��ñ�����" onClick="return SameClick()">
            <input name="OtherWork" type="button" class="button1" value="��ɣ�����ѡ��ӹ���" onClick="return OtherClick()">
            <input name="Cancel" type="reset" class="button1" value="ȡ��">
          </div></td>
        </tr>
      </table>
</form>
</center>
</body>
</html>
