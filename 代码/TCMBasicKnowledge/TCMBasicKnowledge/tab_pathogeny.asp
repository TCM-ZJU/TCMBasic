<%@ Language=VBScript %>
<html>
<head>
<title>���򲡻����ݼӹ�</title>
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
	strSQL="select * from C_BYBJ where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<center>
<form name="formCont" action="post_pathogeny.asp" method="post">
  <table width="800" border="0" class="table2">
    <tr> 
      <td colspan="4" class="title1">���򲡻�
	  <input name="NextChoice" type="hidden">
        <input name="ID" type="hidden" value="<%=ID%>">
	  </td>
    </tr>
    <tr> 
      <td colspan="4"><div align="center">��� 
          <select name="LX">
            <option value="0" selected>����</option>
            <option value="1">����</option>
          </select>
        </div></td>
    </tr>
    <tr>
      <td><div align="right">���ƣ�</div></td>
      <td><input name="MC" type="text" value="<%=oraRS.fields("MC").value%>"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td width="126"><div align="right">��֤���ƣ�</div></td>
      <td width="177"><input name="BZMC" type="text" value="<%=oraRS.fields("BZMC").value%>"></td>
      <td width="212"><div align="right">;����</div></td>
      <td width="263"><input name="TJ" type="text" value="<%=oraRS.fields("TJ").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">��λ��</div></td>
      <td><input name="BW" type="text" value="<%=oraRS.fields("BW").value%>"></td>
      <td><div align="right">���ʣ�</div></td>
      <td><input name="XZ" type="text" value="<%=oraRS.fields("XZ").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">�ص㣺</div></td>
      <td><input name="TD" type="text" value="<%=oraRS.fields("TD").value%>"></td>
      <td><div align="right">֢״��</div></td>
      <td><input name="ZZ" type="text" value="<%=oraRS.fields("ZZ").value%>"></td>
    </tr>
    <tr> 
      <td><div align="right">���أ�</div></td>
      <td><input name="YS" type="text" value="<%=oraRS.fields("YS").value%>"></td>
      <td><div align="right">ת����</div></td>
      <td><input name="ZH" type="text" value="<%=oraRS.fields("ZH").value%>"></td>
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
