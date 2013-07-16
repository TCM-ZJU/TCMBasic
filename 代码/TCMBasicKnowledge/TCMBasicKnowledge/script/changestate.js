function clickUpdate()
{	
	for (i=0; i<intFieldCount; i++)
	{
		document.forms("detail").elements(i).readOnly=false;
	}
	if (blnUpdate)
	{
		document.forms("detail").elements("submit").disabled=false;
		document.forms("detail").elements("update").disabled=true;
	}
	if (blnDelete)
		document.forms("detail").elements("delete").disabled=true;
	document.forms("detail").elements("action").value="update";
}

function clickCancel()
{	
	for (i=0; i<intFieldCount; i++)
	{
		document.forms("detail").elements(i).readOnly=true;
	}
	if (blnUpdate)
	{
		document.forms("detail").elements("submit").disabled=true;
		document.forms("detail").elements("update").disabled=false;
	}
	if (blnDelete)
		document.forms("detail").elements("delete").disabled=false;
	document.forms("detail").elements("action").value="null";
}

function clickDelete()
{
	document.forms("detail").elements("action").value="delete";
}

function setField(i,v)
{
	document.forms("detail").elements(i).value=v;
}

var standard;

function showStandard(strTable,strPos,txtTarget)
{
	var left;
	
	if (strPos=="left")
		left=screen.width-280;
	else
		left=0;

	document.forms(0).pastefield.value=txtTarget;

	if (standard=='[object]')
		standard.close();
			
	standard=window.open("/starch/wizard.asp?table="+strTable,"standard","width=270,height=500,left="+left+",top=25,toolbar=no,scrollbars=yes");
	
	if ((document.forms(0).window!=null) && (!standard.opener))
		standard.opener=document.forms(0).window;
		
	standard.focus();
}