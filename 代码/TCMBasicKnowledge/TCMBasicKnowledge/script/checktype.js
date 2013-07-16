var typeString=1
var typeNumber=2
var typeDate=3

function checkType()
{
	var i,j,t;
	var intYear,intMonth,intDay;
	var a[13]={0,31,29,31,30,31,30,31,31,30,31,30,31};
	var s[13]={"","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

	for (i=0; i<intFieldCount; i++)
	{
		t=document.forms(0).elements(i).value;
		switch (strType.charAt(i))
		{
			case '2':
				for (j=0; j<t.length; j++)
					if ((t.charAt(j)>'9') || (t.charAt(j)<'0'))
						return false;
				break;
			case '3':
				if ((t.length!=10) || (t.charAt(4)!='-') || (t.charAt(7)!='-'))
					return false;
				for (j=0; j<t.length; j++)
					if ((j!=4) && (j!=7))
						if ((t.charAt(j)>'9') || (t.charAt(j)<'0'))
							return false;
				intYear=t.substr(0,4);
				intMonth=t.substr(5,2);
				intDay=t.substr(8,2);
				if ((intYear%4!=0) || ((intYear%100=0) && (intYear%400!=0)))
					a[2]=28;
				
				break;
		}
	}
	return true;
}