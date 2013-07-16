<%@ Language=VBScript %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>记录列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function checkOnclick(id)
{
	document.forms("formData").ID.value=id;
	formData.submit();
}
//-->
</script>
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
	
	dim tablecode(9)
	tablecode(0)="C_ZYJCLUJP"
	tablecode(1)="C_ZYJCLUJP"
	tablecode(2)="C_GJJLXWBZ"
	tablecode(3)="C_ZDFFLX"
	tablecode(4)="C_BZZZ"
	tablecode(5)="C_BYBJ"
	tablecode(6)="C_ZLFF"
	tablecode(7)="C_ZDBZ"
	tablecode(8)="C_ZDFFLX"
	
	dim pagename(9)
	pagename(0)="tab_theory.asp"
	pagename(1)="tab_anatomy.asp"
	pagename(2)="tab_point.asp"
	pagename(3)="tab_effect.asp"
	pagename(4)="tab_sickness.asp"
	pagename(5)="tab_pathogeny.asp"
	pagename(6)="tab_treatment.asp"
	pagename(7)="tab_dgsStd.asp"
	pagename(8)="tab_diagnosis.asp"
	
	dim MC
	if TabNum=2 or TabNum=7 then
		MC="BZMC"
	else 
		MC="MC"
	end if
	
	dim condition
	condition=request.Form("Condition")
	dim strSQL
	strSQL="select ID , "&MC&" from "&tablecode(TabNum)
	
	if TabNum=0 or TabNum=8 then
		condition="LB=0 and "
	end if
	if TabNum=1 or TabNum=3 then
		condition="LB=1 and "
	end if
	
	if condition<>"" then 
		dim num
		num=Len(condition)-4
		condition=Left(condition,num)
		strSQL=strSQL+" where "&condition
	end if
	
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	dim recordnum
	recordnum=oraRS.recordcount
	dim row
	dim intPage
	dim intoffset
	dim intUBound
	dim pagenum
	dim sum

	intPage=10
	intOffset=Cint(Request("offset"))
	pagenum=Cint(recordnum/intPage)
	sum =pagenum*intPage
	if recordnum>sum then
		pagenum=pagenum+1
	end if
%>
<center>
	<table width="800" border="0" class="table2">
        <tr> 
          <td colspan="2" class="title1">符合条件的<%=table(TabNum)%>数据记录</td>
        </tr>
<%
	if intOffset+intPage> recordnum then
		intUBound=recordnum-intOffset
	else
		intUBound=intPage-1
	end if
	on error resume next
	oraRS.MoveTo intOffset
	for row = 0 to intUBound
%>
        <tr> 
          <td width="527"><%=oraRS.fields(1).value%></td>
          <td width="259"><div align="center"> 
          <input name="Check" type="button" class="button1" value="审校记录" onClick="return checkOnclick(<%=oraRS.fields(0).value%>)">
            </div></td>
        </tr>
		<tr>
			<td colspan="2"><hr color="#99CCFF"/></td>
		</tr>
<%
 	oraRS.movenext
	next
	response.write  errinformation
%>
		<tr>
			
      <td height="24" colspan="2">
        <div align="center">
<form name="formPrePage" action="subList.asp?offset=<%=(intOffset-intPage)%>" method="post">
		<input type="hidden" name="Conditon" value="<%=condition%>">
		<input name="TabNum" type="hidden" value="<%=TabNum%>">
          <input name="PrePage" type="submit" class="button1" value="上一页" 
<%
	if intOffset-intPage<=0 then
		Response.Write "disabled"
	end if
%>>
</form>
<form name="formNextPage" action="subList.asp?offset=<%=(intOffset+intPage)%>" method="post">
		<input type="hidden" name="Conditon" value="<%=condition%>">
		<input name="TabNum" type="hidden" value="<%=TabNum%>">
		  <input name="NextPage" type="submit" class="button1" value="下一页" 
<%
	if intOffset+intPage>recordnum then
		Response.Write "disabled"
	end if
%>>
</form>
        </div></td>
		</tr>
      </table>
</center>
<form name="formData" action="<%=pagename(TabNum)%>?IsNew=0" method="post">
  <input type="hidden" name="ID">
</form>
</body>
</html>
