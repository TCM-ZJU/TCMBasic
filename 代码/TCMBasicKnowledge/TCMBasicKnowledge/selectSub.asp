<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>ѡ���¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" type="text/JavaScript">
<!--
function OKOnclick()
{
	var len,condition="";
	if(document.forms("formCont").chkField.checked)
		condition=document.forms("formCont").txtField.value+"='"+document.forms("formCont").FieldCont.value+"' and ";
	if(document.forms("formCont").chkPerson.checked)
		condition=condition+"LRRY='"+document.forms("formCont").txtPerson.value+"' and ";
	if(document.forms("formCont").chkDate.checked)
		condition=condition+"LRRQ='"+document.forms("formCont").txtDate.value+"' and ";
	if(document.forms("formCont").chkLabel.checked)
		condition=condition+"ZTBZ='"+document.forms("formCont").txtLabel.value+"' and ";
	if(document.forms("formCont").chkState.checked)
		condition=condition+"BJZT='"+document.forms("formCont").txtState.value+"' and ";

	document.forms("formCont").Condition.value=condition;
	formCont.submit();
}
//-->
</script>
<link href="common.css" rel="stylesheet" type="text/css">
</head>

<body class="body">
<%
	dim TabNum
	TabNum=request.Form("TabNum")
	
	dim table(9)
	table(0)="��ҽ��������"
	table(1)="����"
	table(2)="���Ҿ���Ѩλ��׼"
	table(3)="��Ч"
	table(4)="������֤��֢״"
	table(5)="���򲡻�"
	table(6)="���Ʒ���"
	table(7)="��ϱ�׼"
	table(8)="��Ϸ���"
	
%>
<center>
<form name="formCont" action="subList.asp?offset=1" method="post">
   <table width="600" border="0" align="center" class="table2">
        <tr> 
          <td colspan="3" class="title1">ѡ��¼�����У������[��<%=table(TabNum)%>]</td>
        </tr>
        <tr> 
          <td width="117"><div align="right"> 
              <input type="checkbox" name="chkField" value="checkbox">
              �ֶ����ƣ�</div></td>
          <td width="144"><select name="txtField">
<%
	if TabNum=0 then
%>
            <option value="MC" selected>����</option>
            <option value="TX">����</option>
            <option value="XT">��̬</option>
            <option value="GN">����</option>
            <option value="GSSC">����</option>
<%
	end if
%>
<%
	if TabNum=1 then
%>
            <option value="MC" selected>����</option>
            <option value="TX">����</option>
            <option value="XT">��̬</option>
            <option value="GN">����</option>
            <option value="GSSC">����</option>
			<option value="DW">��λ</option>
			<option value="GL">����</option>
			<option value="GJBZ">���ұ�׼</option>
<%
	end if
%>
<%
	if TabNum=2 then
%>
            <option value="BZMC" selected>��׼����</option>
            <option value="BZJBFL">��׼�������</option>
            <option value="BZDM">��׼����</option>
            <option value="BZQCDW">��׼��ݵ�λ</option>
            <option value="BZRDJSWYH">��׼�϶�����ίԱ��</option>
			<option value="BZJZDW">��׼���Ƶ�λ</option>
<%
	end if
%>
<%
	if TabNum=3 then
%>
            <option value="MC" selected>����</option>
            <option value="FF">����</option>
            <option value="YYFW">Ӧ�÷�Χ</option>
            <option value="LEIB">���</option>
            <option value="GJBZ">���ұ�׼</option>
			<option value="BZMC">��֤����</option>
<%
	end if
%>
<%
	if TabNum=4 then
%>
            <option value="MC" selected>����</option>
            <option value="LX">����</option>
            <option value="BW">��λ</option>
            <option value="YF">Ԥ��</option>
            <option value="XZ">����</option>
			<option value="QD">ǿ��</option>
			<option value="ZL">����</option>
<%
	end if
%>
<%
	if TabNum=5 then
%>
            <option value="MC" selected>����</option>
			<option value="BZMC">��֤����</option>
            <option value="LX">����</option>
            <option value="BW">��λ</option>
            <option value="TJ">;��</option>
            <option value="XZ">����</option>
			<option value="TD">�ص�</option>
			<option value="ZZ">֢״</option>
			<option value="YS">����</option>
			<option value="ZH">ת��</option>
<%
	end if
%>
<%
	if TabNum=6 then
%>
            <option value="MC" selected>����</option>
			<option value="BZMC">��֤����</option>
            <option value="FF">����</option>
            <option value="YYFW">Ӧ�÷�Χ</option>
            <option value="ZLLX">��������</option>
            <option value="GJBZ">���ұ�׼</option>
<%
	end if
%>
<%
	if TabNum=7 then
%>
            <option value="BZMC" selected>��׼����</option>
			<option value="JBMC">��������</option>
            <option value="BZJBFL">��׼�������</option>
            <option value="BZDM">��׼����</option>
            <option value="BZQCDW">��׼��ݵ�λ</option>
            <option value="BZRDJSWYH">��׼�϶�����ίԱ��</option>
			<option value="BZJZDW">��׼���Ƶ�λ</option>
			<option value="BLXZBZ">����ѡ���׼</option>
			<option value="BYXFXBZ">��ԭѧ���ͱ�׼</option>
			<option value="LCFXBZ">�ٴ����ͱ�׼</option>
			<option value="BZ">��֤</option>
<%
	end if
%>
<%
	if TabNum=8 then
%>
            <option value="MC" selected>����</option>
            <option value="FF">����</option>
            <option value="YYFW">Ӧ�÷�Χ</option>
            <option value="LEIB">���</option>
            <option value="GJBZ">���ұ�׼</option>
<%
	end if
%>
          </select></td>
          <td width="321"><div align="left"> ���ݣ� 
            <input name="FieldCont" type="text" size="32">
          </div></td>
        </tr>
        <tr> 
          <td><div align="right"> 
              <input type="checkbox" name="chkPerson" value="checkbox">
              ¼����Ա��</div></td>
          <td colspan="2"><input type="text" name="txtPerson"></td>
        </tr>
        <tr> 
          <td height="21"> <div align="right"> 
              <input type="checkbox" name="chkDate" value="checkbox">
              ¼�����ڣ�</div></td>
          <td colspan="2"><input type="text" name="txtDate"></td>
        </tr>
        <tr> 
          <td height="21"><div align="right"> 
              <input type="checkbox" name="chkLabel" value="checkbox">
              ״̬��־��</div></td>
          <td colspan="2"><input type="text" name="txtLabel"></td>
        </tr>
        <tr> 
          <td height="21"> <div align="right"> 
              <input type="checkbox" name="chkState" value="checkbox">
              �ӹ�״̬��</div></td>
          <td colspan="2"><select name="txtState">
              <option value="1">δ��У</option>
              <option value="2">�ѳ���</option>
            </select></td>
        </tr>
        <tr> 
          <td colspan="3"><div align="center"> 
              <input name="OK" type="button" class="button1" value="��У" onClick="return OKOnclick()">
              <input name="Cancel" type="reset" class="button1" value="ȡ��">
			  <input name="Condition" type="hidden" value="">
			  <input name="TabNum" type="hidden" value="<%=TabNum%>">
            </div></td>
        </tr>
      </table>
</form>
</center>
</body>
</html>
