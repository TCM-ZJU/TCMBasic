<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>选择记录</title>
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
	table(0)="中医基础理论"
	table(1)="解剖"
	table(2)="国家经络穴位标准"
	table(3)="疗效"
	table(4)="疾病、证候、症状"
	table(5)="病因病机"
	table(6)="治疗方法"
	table(7)="诊断标准"
	table(8)="诊断方法"
	
%>
<center>
<form name="formCont" action="subList.asp?offset=1" method="post">
   <table width="600" border="0" align="center" class="table2">
        <tr> 
          <td colspan="3" class="title1">选择录入或审校的文题[表：<%=table(TabNum)%>]</td>
        </tr>
        <tr> 
          <td width="117"><div align="right"> 
              <input type="checkbox" name="chkField" value="checkbox">
              字段名称：</div></td>
          <td width="144"><select name="txtField">
<%
	if TabNum=0 then
%>
            <option value="MC" selected>名称</option>
            <option value="TX">特性</option>
            <option value="XT">形态</option>
            <option value="GN">功能</option>
            <option value="GSSC">归属</option>
<%
	end if
%>
<%
	if TabNum=1 then
%>
            <option value="MC" selected>名称</option>
            <option value="TX">特性</option>
            <option value="XT">形态</option>
            <option value="GN">功能</option>
            <option value="GSSC">生成</option>
			<option value="DW">定位</option>
			<option value="GL">关联</option>
			<option value="GJBZ">国家标准</option>
<%
	end if
%>
<%
	if TabNum=2 then
%>
            <option value="BZMC" selected>标准名称</option>
            <option value="BZJBFL">标准级别分类</option>
            <option value="BZDM">标准代码</option>
            <option value="BZQCDW">标准起草单位</option>
            <option value="BZRDJSWYH">标准认定技术委员会</option>
			<option value="BZJZDW">标准监制单位</option>
<%
	end if
%>
<%
	if TabNum=3 then
%>
            <option value="MC" selected>名称</option>
            <option value="FF">方法</option>
            <option value="YYFW">应用范围</option>
            <option value="LEIB">类别</option>
            <option value="GJBZ">国家标准</option>
			<option value="BZMC">病证名称</option>
<%
	end if
%>
<%
	if TabNum=4 then
%>
            <option value="MC" selected>名称</option>
            <option value="LX">类型</option>
            <option value="BW">病位</option>
            <option value="YF">预防</option>
            <option value="XZ">性质</option>
			<option value="QD">强度</option>
			<option value="ZL">治疗</option>
<%
	end if
%>
<%
	if TabNum=5 then
%>
            <option value="MC" selected>名称</option>
			<option value="BZMC">病证名称</option>
            <option value="LX">类型</option>
            <option value="BW">病位</option>
            <option value="TJ">途径</option>
            <option value="XZ">性质</option>
			<option value="TD">特点</option>
			<option value="ZZ">症状</option>
			<option value="YS">因素</option>
			<option value="ZH">转化</option>
<%
	end if
%>
<%
	if TabNum=6 then
%>
            <option value="MC" selected>名称</option>
			<option value="BZMC">病证名称</option>
            <option value="FF">方法</option>
            <option value="YYFW">应用范围</option>
            <option value="ZLLX">治疗类型</option>
            <option value="GJBZ">国家标准</option>
<%
	end if
%>
<%
	if TabNum=7 then
%>
            <option value="BZMC" selected>标准名称</option>
			<option value="JBMC">疾病名称</option>
            <option value="BZJBFL">标准级别分类</option>
            <option value="BZDM">标准代码</option>
            <option value="BZQCDW">标准起草单位</option>
            <option value="BZRDJSWYH">标准认定技术委员会</option>
			<option value="BZJZDW">标准监制单位</option>
			<option value="BLXZBZ">病例选择标准</option>
			<option value="BYXFXBZ">病原学分型标准</option>
			<option value="LCFXBZ">临床分型标准</option>
			<option value="BZ">辩证</option>
<%
	end if
%>
<%
	if TabNum=8 then
%>
            <option value="MC" selected>名称</option>
            <option value="FF">方法</option>
            <option value="YYFW">应用范围</option>
            <option value="LEIB">类别</option>
            <option value="GJBZ">国家标准</option>
<%
	end if
%>
          </select></td>
          <td width="321"><div align="left"> 内容： 
            <input name="FieldCont" type="text" size="32">
          </div></td>
        </tr>
        <tr> 
          <td><div align="right"> 
              <input type="checkbox" name="chkPerson" value="checkbox">
              录入人员：</div></td>
          <td colspan="2"><input type="text" name="txtPerson"></td>
        </tr>
        <tr> 
          <td height="21"> <div align="right"> 
              <input type="checkbox" name="chkDate" value="checkbox">
              录入日期：</div></td>
          <td colspan="2"><input type="text" name="txtDate"></td>
        </tr>
        <tr> 
          <td height="21"><div align="right"> 
              <input type="checkbox" name="chkLabel" value="checkbox">
              状态标志：</div></td>
          <td colspan="2"><input type="text" name="txtLabel"></td>
        </tr>
        <tr> 
          <td height="21"> <div align="right"> 
              <input type="checkbox" name="chkState" value="checkbox">
              加工状态：</div></td>
          <td colspan="2"><select name="txtState">
              <option value="1">未审校</option>
              <option value="2">已初审</option>
            </select></td>
        </tr>
        <tr> 
          <td colspan="3"><div align="center"> 
              <input name="OK" type="button" class="button1" value="审校" onClick="return OKOnclick()">
              <input name="Cancel" type="reset" class="button1" value="取消">
			  <input name="Condition" type="hidden" value="">
			  <input name="TabNum" type="hidden" value="<%=TabNum%>">
            </div></td>
        </tr>
      </table>
</form>
</center>
</body>
</html>
