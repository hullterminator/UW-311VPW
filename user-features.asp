<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>User Added Features</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=UTF-8"><LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js?v=20261107_02"></SCRIPT>

<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR></HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=1008 align=center 
border=0>
  <TBODY>
  <TR>
    <TD height=1>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=1008 
      background=/img/framelogo.jpg border=0 style="background-repeat:no-repeat;">
<% else %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONTYLOGOSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% else %>
      <TABLE height=117 cellSpacing=0 cellPadding=0 width=1008 
      background=/img/framelogo.jpg border=0 style="background-repeat:no-repeat;">
<% end if %> 
<% end if %>
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
          <TD vAlign=bottom align=right width=358>
            <TABLE id=table8 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD vAlign=bottom align=right><SPAN class=curUserName>&nbsp; 
                  </SPAN></TD>
                <TD class=welcom vAlign=bottom align=middle width=120>Welcome！ </TD>
                <TD vAlign=bottom width=50><A onclick=DoLogout() 
                  href="/cgi-bin/logout.cgi" target=_top><SPAN 
                  class=logout>Logout 
      </SPAN></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE id=table2 height=100 cellSpacing=0 cellPadding=0 width=1008 
border=0>
        <TBODY>
        <TR>
          <TD class=LocationDisplay id=LocationDisplay align=middle width=157 
          bgColor=#ef8218 rowSpan=3></TD>
          <TD width=673 bgColor=#427594 height=33>
            <P align=right><FONT face="Arial" color=#ffffff><B><FONT face="Arial" 
            color=#ffffff size=6><INPUT id=Selected_Menu type=hidden 
            value="User Added Features->DNS & AdBlock" name=Selected_Menu> </FONT></B><SPAN 
            class=GatewayName>CPE Name:
            <SCRIPT 
            language=javascript>
document.write(top.gateWayName);
</SCRIPT>
             </SPAN></FONT></P></TD>
          <TD width=170 bgColor=#ef8218 height=33>
            <P class=GatewayType align=center>Model:
            <SCRIPT language=javascript>
document.write(top.ModelName);
</SCRIPT>
             </P></TD></TR>
        <TR>
          <TD id=MenuArea_L1 vAlign=bottom bgColor=#ef8218 colSpan=2 
          height=43>&nbsp;</TD></TR>
        <TR>
          <TD id=MenuArea_L2 bgColor=#427594 colSpan=2 
      height=24></TD></TR></TBODY></TABLE>
      <SCRIPT 
      language=javascript>
MakeMenu(getElById ('Selected_Menu').value);
</SCRIPT>

      <TABLE id=table3 height=15 cellSpacing=0 cellPadding=0 width=1008 
        border=0><TBODY>
        <TR>
          <TD height=15><IMG height=15 src="/img/panel1.gif" 
            width=164 border=0> </TD>
          <TD><IMG height=15 src="/img/panel2.gif" width=844 
            border=0> </TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top>
      <SCRIPT language=JavaScript type=text/javascript>

		var Nametype = 0;
 		var para = 0;	  
		var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		//get all value
		// num 0
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_WanName = vArrayStr.split(',');
		// num 1
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_WanValue = vArrayStr.split(',');
		// num 2
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 3
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		Wan_Actives = vArrayStr.split(',');
		// num 4		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var WANEnNAT = vArrayStr.split(',');
		// num 5		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IFName = vArrayStr.split(',');
		// num 6		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IPVERSION = vArrayStr.split(',');
		// num 7		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Status4 = vArrayStr.split(',');
		// num 8		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IP4 = vArrayStr.split(',');
		// num 9		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_ENCAP = vArrayStr.split(',');
		// num 10		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_GateWay4 = vArrayStr.split(',');
		// num 11		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_DNS4 = vArrayStr.split(',');
		// num 12		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_SecDNS4 = vArrayStr.split(',');
		// num 13		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Status6 = vArrayStr.split(',');
		// num 14		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IP6 = vArrayStr.split(',');
		// num 15		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_GateWay6 = vArrayStr.split(',');
		// num 16		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_DNS6 = vArrayStr.split(',');
		// num 17		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_SecDNS6 = vArrayStr.split(',');
		// num 18		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_PD6 = vArrayStr.split(',');
		// num 19		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_NetMask4 = vArrayStr.split(',');
		// num 20		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 21		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 22		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Connection = vArrayStr.split(',');
		// num 23		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_VidPRI = vArrayStr.split(',');
		// num 24		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_MAC = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","ConnectionError","s") %>";
		var Wan_ConnectionError = vArrayStr.split(',');
		SortUtil.SetReplaceStrflag(1);
		Wan_WanName = SortUtil.UpdateWanIFName( Wan_WanName, pvc_counts );

		Wan_Actives = SortUtil.SortMyArray( Wan_Actives );
		Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
		Wan_Status4 = SortUtil.SortMyArray( Wan_Status4 );
		Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
		Wan_ENCAP = SortUtil.SortMyArray( Wan_ENCAP );
		Wan_GateWay4 = SortUtil.SortMyArray( Wan_GateWay4 );
		Wan_DNS4 = SortUtil.SortMyArray( Wan_DNS4 );
		Wan_SecDNS4 = SortUtil.SortMyArray( Wan_SecDNS4 );
		Wan_Status6 = SortUtil.SortMyArray( Wan_Status6 );
		Wan_IP6 = SortUtil.SortMyArray( Wan_IP6 );
		Wan_GateWay6 = SortUtil.SortMyArray( Wan_GateWay6 );
		Wan_DNS6 = SortUtil.SortMyArray( Wan_DNS6 );
		Wan_SecDNS6 = SortUtil.SortMyArray( Wan_SecDNS6 );
		Wan_PD6 = SortUtil.SortMyArray( Wan_PD6 );
		Wan_NetMask4 = SortUtil.SortMyArray( Wan_NetMask4 );
		Wan_Connection = SortUtil.SortMyArray( Wan_Connection );
		Wan_VidPRI = SortUtil.SortMyArray( Wan_VidPRI );
		Wan_MAC = SortUtil.SortMyArray( Wan_MAC );
		Wan_ConnectionError = SortUtil.SortMyArray( Wan_ConnectionError );
		Wan_IFName = SortUtil.SortMyArray( Wan_IFName );


<% if tcWebApi_get("WebCustom_Entry", "isCT2PORTSSupported", "h") = "Yes"  then %>
    var portNumber = "2";
<% elseif tcWebApi_get("WebCustom_Entry", "is3PORTSSupported", "h") = "Yes"  then %>
    var portNumber = "3";
<% else %>
    var portNumber = "4";
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isWLanSupported", "h") = "Yes"  then %>
    var isWifiSupported = "AP";
<% else %>
    var isWifiSupported = "NoAP";
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %> 
		var deviceType = "E8C 1 "+isWifiSupported;
<% else %>   
    var deviceType = "E8C "+portNumber+"+1 "+isWifiSupported;
<% end if%>



function stDeviceInfo(domain,ProductClass,SerialNumber,HardwareVersion,SoftwareVersion,ManufacturerOUI)
{
this.domain = domain;
this.ProductClass = ProductClass;
this.ManufacturerOUI = ManufacturerOUI;
this.SerialNumber = SerialNumber;
this.HardwareVersion = HardwareVersion;
this.SoftwareVersion = SoftwareVersion;
}
temp = new Array(new stDeviceInfo("InternetGatewayDevice.DeviceInfo",top.ModelName,"19191900AABB818180","HG530RRA.VER.C","V100R001C01B010","00AABB"),null);
var DeviceInfo = temp[0];

var BatchNumber = "RWC30P0.010.84725";

function PonInfoClass()
{
	this.LinkSta				= '<% tcWebApi_get("XPON_LinkCfg","LinkSta","s") %>';
	this.trafficstate			= '<% tcWebApi_get("XPON_Common","trafficStatus","s") %>';
	this.fecState				= '<% tcWebApi_get("Info_PonPhy","FecStatus","s") %>';
	this.PonState				= 'down';
	this.FECEnable				= 'disabled';
	this.WarnInfo				= 'disconnect';
	this.PonSendPkt				= '<% tcWebApi_get("Info_PonWanStats","TxFrameCnt","s") %>';
	this.PonRecvPkt				= '<% tcWebApi_get("Info_PonWanStats","RxFrameCnt","s") %>';
	this.SendPower				= '-';
	this.RecvPower				= '-';
	this.WorkVoltage			= '-';
	this.WorkElectric			= '-';
	this.WorkTemperature		= '-';
			
	if ( 'up' == this.trafficstate )
	{
		this.PonState 			= 'up';
		this.WarnInfo 			= 'no info';
	}
			
	if( '0' != this.LinkSta)
	{
		this.SendPower			= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
		this.RecvPower			= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
	}

	if ( '1' == this.fecState )
	{
		this.FECEnable			= 'enabled';
	}
}
var PonInfo = new PonInfoClass();
<% if tcWebApi_get("WebCustom_Entry", "isShowCPUMemTime", "h") = "Yes"  then %>
function disCpuStatus()
{
	var xmlhttp;
		
	if (window.XMLHttpRequest)
	{
	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
	// IE6, IE5 浏览器执行代码
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.onreadystatechange=function()
	{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				//alert("xmlhttp.responseText="+xmlhttp.responseText);
				var retStr=String(xmlhttp.responseText);	
				//alert(retStr);	
								//getElementByName("tcpu").innerHTML=fix(retStr,3) + '%';
				if (2 == retStr.length)
					getElementByName("tcpu").innerHTML='&nbsp;' + retStr + '&nbsp;%';
				else
					getElementByName("tcpu").innerHTML=retStr + '%';
			 
			}
	}

	xmlhttp.open("GET","/cgi-bin/getCPUStatus.cgi",true);
	xmlhttp.send();
	setTimeout("disCpuStatus()",3000);
}
<% end if%>
function LoadFrame()
{
<% if tcWebApi_get("WebCustom_Entry", "isCTPONCYJXSupported", "h") = "Yes"  then %>	
	writelisttable();
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isShowCPUMemTime", "h") = "Yes"  then %>
	disCpuStatus();
<% end if%>
}
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
function ListCreate_info1()
{
	var ITV_name = '<% tcWebApi_get("WanInfo_Common","ITVInfo","s") %>';

	for(var i=0;i<pvc_counts;i++)
	{
		if(Wan_Actives[i] != "N/A")
		{
			if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
			{
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
				if(Wan_IP4[i] == '-')
				{
						Wan_IP4[i] = '/';
				}
<%end if%>
				document.write('<tr align="middle">');
					
				if(Wan_WanName[i].indexOf('TR069') >= 0)
				{
					document.write('<td>' + 'ITMS Management Channel Status' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							document.write('<td align="center">Normal&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">Abnormal&nbsp;</td>');
					}
					document.write('<td align="center">' + 'NAT（DHCP AUTO）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('INTERNET') >= 0)
				{
					document.write('<td>' + 'INTERNET（Internet Service）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							document.write('<td align="center">Normal&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">Abnormal&nbsp;</td>');
					}

					if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
					{
						document.write('<td align="center">' + 'NAT（Built-in Dial-up）' + '&nbsp;</td>');
					}
					else
					{
						document.write('<td align="center">' + 'Brigde（Computer Dial-up）' + '&nbsp;</td>');
					}
					document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
					if((PonInfo.PonState == "up")&&('up' == Wan_Status4[i]))
						document.write('<td>' + '/' + '&nbsp;</td>');
					else{
						var ErrCode=Wan_ConnectionError[i];
						var ErrDes;
						if ( ErrCode == 'ERROR_AUTHENTICATION_FAILURE' )
							ErrDes='691(Authentication Failed)';
						else if ( ErrCode == 'ERROR_IDLE_DISCONNECT' )
							ErrDes='Idle Disconnect';
						else if ( ErrCode == 'ERROR_ISP_TIME_OUT' )
							ErrDes='678(Response Timeout)';
						else if ( ErrCode == 'ERROR_USER_DISCONNECT' )
							ErrDes='User Disconnects';
						else if ( ErrCode == 'ERROR_NO_ANSWER' )
							ErrDes='No Response';
						else if ( ErrCode == 'ERROR_NOT_ENABLED_FOR_INTERNET' )
							ErrDes='Invalid Links';
						else
							ErrDes='Other Abnormal';								
						document.write('<td>' + ErrDes + '&nbsp;</td>');					
					}
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('VOICE') >= 0)
				{
					document.write('<td>' + 'VOIP（VOIP Service）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							document.write('<td align="center">Normal&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">Abnormal&nbsp;</td>');
					}
					document.write('<td align="center">' + 'NAT（DHCP AUTO）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					VoipInfo.showRegisterState(1);
				}

				document.write('</tr>');
				
				if(ITV_name != '')
				{
					document.write('<tr align="middle">');

					if(Wan_WanValue[i].indexOf(ITV_name) >= 0)
					{
						document.write('<TD align=middle>' + 'ITV Service' + '&nbsp;</TD>');	

						if(PonInfo.PonState == "up")
						{
							if('up' == Wan_Status4[i])
							{
								document.write('<td align="center">Normal&nbsp;</td>');
							}
							else
							{
								document.write('<td align="center">Abnormal&nbsp;</td>');
							}
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}

						document.write('<TD align="center">' + 'Brigde（ITV Device AUTO）'+ '&nbsp;</TD>');
						document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
					}
					document.write('</tr>');				
				}
			}
			else if(Wan_IPVERSION[i] == "IPv6")
			{
				document.write('<tr align="middle">');
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
				if(Wan_IP6[i] == '-')
				{
						Wan_IP6[i] = '/';
				}
<%end if%>
				if(Wan_WanName[i].indexOf('TR069') >= 0)
				{
					document.write('<td>' + 'ITMS Management Channel Status' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							document.write('<td align="center">Normal&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">Abnormal&nbsp;</td>');
					}
					document.write('<td align="center">' + 'NAT（DHCP AUTO）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('INTERNET') >= 0)
				{
					document.write('<td>' + 'INTERNET（Internet Service）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							document.write('<td align="center">Normal&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">Abnormal&nbsp;</td>');
					}

					if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
					{
						document.write('<td align="center">' + 'NAT（Built-in Dial-up）' + '&nbsp;</td>');
					}
					else
					{
						document.write('<td align="center">' + 'Brigde（Compyter Dial-up）' + '&nbsp;</td>');
					}
					document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
					if((PonInfo.PonState == "up")&&('up' == Wan_Status6[i]))
						document.write('<td>' + '/' + '&nbsp;</td>');
					else{
						var ErrCode=Wan_ConnectionError[i];
						var ErrDes;
						if ( ErrCode == 'ERROR_AUTHENTICATION_FAILURE' )
							ErrDes='691(Authentication Failed)';
						else if ( ErrCode == 'ERROR_IDLE_DISCONNECT' )
							ErrDes='Idle Disconnect';
						else if ( ErrCode == 'ERROR_ISP_TIME_OUT' )
							ErrDes='678(Response Timeout)';
						else if ( ErrCode == 'ERROR_USER_DISCONNECT' )
							ErrDes='User Disconnects';
						else if ( ErrCode == 'ERROR_NO_ANSWER' )
							ErrDes='No Response';
						else if ( ErrCode == 'ERROR_NOT_ENABLED_FOR_INTERNET' )
							ErrDes='Invalid Links';
						else
							ErrDes='Other Aberrant';								
						document.write('<td>' + ErrDes + '&nbsp;</td>');					
					}
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('VOICE') >= 0)
				{
					document.write('<td>' + 'VOIP（VOIP Service）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							document.write('<td align="center">Normal&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">Abnormal&nbsp;</td>');
					}
					document.write('<td align="center">' + 'NAT（DHCP AUTO）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					VoipInfo.showRegisterState(1);
				}

				document.write('</tr>');
				
				if(ITV_name != '')
				{				
					document.write('<tr align="middle">');

					if(Wan_WanValue[i].indexOf(ITV_name) >= 0)
					{
						document.write('<TD align=middle>' + 'ITV Service' + '&nbsp;</TD>');	

						if(PonInfo.PonState == "up")
						{
							if('up' == Wan_Status6[i])
							{
								document.write('<td align="center">Normal&nbsp;</td>');
							}
							else
							{
								document.write('<td align="center">Abnormal&nbsp;</td>');
							}
						}
						else
						{
							document.write('<td align="center">Abnormal&nbsp;</td>');
						}

						document.write('<TD align="center">' + 'Brigde（ITV Device AUTO）'+ '&nbsp;</TD>');
						document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
					}
					document.write('</tr>');
				}
			}
		}
	}
}

function PrintRecvPower()
{
	if(PonInfo.RecvPower == '-')
	{
		document.write('<TD width="250">' + '<font color="#ff0000">' +'Optical fiber connector is not normal, check the light path or if there is a wrong ODF'+ '&nbsp;</font></TD>');
	}
	else if(PonInfo.RecvPower < -24)
	{
		document.write('<TD width="250">' + '<font color="#ff0000">' +'Optical power is too low, check the light path or if there is a wrong ODF(' + PonInfo.RecvPower + 'dbm)'+ '&nbsp;</font></TD>');
	}
	else
	{
    	document.write('<TD width="250">' + PonInfo.RecvPower + 'dBm' + '&nbsp;</TD>');
	}
}

function VoipInfoClass()
{
  this.Reg1Status  = '<%if tcWebAPI_get("InfoVoIP_Entry0", "Status", "h") <> "N/A" then tcWebAPI_get("InfoVoIP_Entry0", "Status", "s") else asp_Write("") end if %>';
  this.Reg2Status  = '<%if tcWebAPI_get("InfoVoIP_Entry1", "Status", "h") <> "N/A" then tcWebAPI_get("InfoVoIP_Entry1", "Status", "s") else asp_Write("") end if %>';
  this.Line1Number = '<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "s") else asp_Write("") end if %>';
  this.Line2Number = '<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "s") else asp_Write("") end if %>';
  this.showRegisterState = showRegisterState;
}
var VoipInfo = new VoipInfoClass();

function showRegisterState(port)
{
	var Status = '';

	if ( 1 == port )
	{
		Status = this.Reg1Status;
	}
	else if ( 2 == port )
	{
		Status = this.Reg2Status;
	}
	else
	{
		return;
	}

	if ( Status == 'Up' )
		document.write('<td>' +'Normal Registered'+ '&nbsp;</td>');
	else if ( Status == 'Initializing' )
		document.write('<td>' +'Initializing'+ '&nbsp;</td>');
	else if ( Status == 'Registering' )
		document.write('<td>' +'Registering'+ '&nbsp;</td>');
	else if ( Status == 'Unregistering' )
		document.write('<td>' +'Unregistering'+ '&nbsp;</td>');
	else if ( Status == 'Quiescent' )
		document.write('<td>' +'Quiescent'+ '&nbsp;</td>');
	else if ( Status == 'Disabled' )
		document.write('<td>' +'Disabled'+ '&nbsp;</td>');
	else if ( Status == 'Error' )
		document.write('<td>' +'Error'+ '&nbsp;</td>');
	else if ( Status == 'Testing' )
		document.write('<td>' +'Testing'+ '&nbsp;</td>');
	else
		document.write('<td>' +'Other Abnormal'+ '&nbsp;</td>');
}
<% end if%>
function usable_port(index)
{
	var pvcindex = Wan_IFName[index].indexOf('_')-1;
	var interface = parseInt(Wan_IFName[index].substr(pvcindex,1));
	var tempbuf = '';
	var usable_port='';
	switch(interface)
	{
		case 0:
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "LAN1", "h") = "Yes" then%>
				tempbuf += ',LAN1';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "LAN2", "h") = "Yes" then%>
				tempbuf += ',LAN2';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "LAN3", "h") = "Yes" then%>
				tempbuf += ',LAN3';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "LAN4", "h") = "Yes" then%>
				tempbuf += ',LAN4';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "SSID1", "h") = "Yes" then%>
				tempbuf += ',SSID1';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "SSID2", "h") = "Yes" then%>
				tempbuf += ',SSID2';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "SSID3", "h") = "Yes" then%>
				tempbuf += ',SSID3';
			<%end if%>
			<%if tcWebAPI_get("Wan_PVC0_Entry0", "SSID4", "h") = "Yes" then%>
				tempbuf += ',SSID4';
			<%end if%>
			break;
		case 1:
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC1_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
			break;
		case 2:
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC2_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
			break;
		case 3:
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC3_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
			break;
		case 4:
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC4_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
				break;
			case 5:
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC5_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
				break;
			case 6:
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC6_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
				break;
			case 7:
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "LAN1", "h") = "Yes" then%>
					tempbuf += ',LAN1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "LAN2", "h") = "Yes" then%>
					tempbuf += ',LAN2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "LAN3", "h") = "Yes" then%>
					tempbuf += ',LAN3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "LAN4", "h") = "Yes" then%>
					tempbuf += ',LAN4';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "SSID1", "h") = "Yes" then%>
					tempbuf += ',SSID1';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "SSID2", "h") = "Yes" then%>
					tempbuf += ',SSID2';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "SSID3", "h") = "Yes" then%>
					tempbuf += ',SSID3';
				<%end if%>
				<%if tcWebAPI_get("Wan_PVC7_Entry0", "SSID4", "h") = "Yes" then%>
					tempbuf += ',SSID4';
				<%end if%>
				break;
	}
	for(var i= 1 ;i<tempbuf.length;i++)
	{
		usable_port += tempbuf.charAt(i);
	}
	return usable_port;
}

function ListCreate_info2()
{
	var index = -1;
	var index1 = -1;
	var loc = new Array();
	var usable = new Array();
	var disusable = new Array();
	for(var i=0; i<pvc_counts; i++)
	{
			loc[i] = '<TABLE cellSpacing=0 cellPadding=3 width=440 border=1>';
			loc[i] += '<tr>';
      loc[i] += '<TD class=table_title align=middle width="15%">Service Type</TD>';
      loc[i] += '<TD class=table_title align=middle width="15%">Status</TD>';
      loc[i] += '<TD class=table_title align=middle width="15%">IP Protocol</TD>';
      loc[i] += '<TD class=table_title align=middle width="15%">Connection Mode</TD>';
      loc[i] += '<TD class=table_title align=middle width="15%">Available Ports</TD>';
      loc[i] += '<TD class=table_title align=middle width="15%">Connection Name</TD>';
      loc[i] += '</tr>';
      loc[i] += '<tr>';
			if(Wan_WanName[i].indexOf('INTERNET') >= 0)
			{
				var port = usable_port(i);
				loc[i] += '<td width="15">' + 'Network' + '</td>';
				if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
				else if(Wan_IPVERSION[i] == "IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
			}
			else
			{
				loc[i] += '<td width="15">' + 'Network' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="25">' + 'Not Configured' + '</td>';
			}
			loc[i] += '</tr>';
	}
	if(index != -1)
		 return loc[usable[0]];
	else {
		 if(index1 != -1)
				return loc[disusable[0]];	
	}
	return loc[0];	
}
function ListCreate_info3()
{
	var index = -1;
	var index1 = -1;
	var loc = new Array();
	var ITV_name = '<% tcWebApi_get("WanInfo_Common","ITVInfo","s") %>';
	var usable = new Array();
	var disusable = new Array();
	for(var i=0; i<pvc_counts; i++)
	{
      loc[i] = '<tr>';
			if(Wan_WanName[i].indexOf(ITV_name) >= 0)
			{
				var port = usable_port(i);
				loc[i] += '<td width="15">' + 'iTV' + '</td>';
				if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
				else if(Wan_IPVERSION[i] == "IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							usable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						usable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
			}
			else
			{
				loc[i] += '<td width="15">' + 'iTV' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="25">' + 'Not Configured' + '</td>';
			}
			loc[i] += '</tr>';
			
	}
	if(index != -1)
		 return loc[usable[0]];
	else {
		 if(index1 != -1)
				return loc[disusable[0]];	
	}
		return loc[0];	
}
function ListCreate_info4()
{
	var index = -1;
	var index1 = -1;
	var loc = new Array();
	var usable = new Array();
	var disusable = new Array();
	for(var i=0; i<pvc_counts; i++)
	{
		var port = usable_port(i);
      loc[i] = '<tr>';
			if(Wan_WanName[i].indexOf('VOICE') >= 0)
			{
				loc[i] += '<td width="15">' + 'VOIP' + '</td>';
				if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
				else if(Wan_IPVERSION[i] == "IPv6" || Wan_IPVERSION[i] == "IPv4/IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
			}
			else
			{
				loc[i] += '<td width="15">' + 'VOIP' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="25">' + 'Not Configured' + '</td>';
			}
			loc[i] += '</tr>';
	}
	
	if(index != -1)
		return loc[usable[0]];	
	else 
	{
		if(index1 != -1)
			return loc[disusable[0]];	
		else
			return loc[0];	
	}
}
function ListCreate_info5()
{
	var index = -1;
	var index1 = -1;
	var loc = new Array();
	var usable = new Array();
	var disusable = new Array();
	for(var i=0; i<pvc_counts; i++)
	{
			var port = usable_port(i);
			loc[i] = '<tr>';
			if(Wan_WanName[i].indexOf('TR069') >= 0)
			{
				loc[i] += '<td width="15">' + 'Management' + '</td>';
				if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
				else if(Wan_IPVERSION[i] == "IPv6")
				{
					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							loc[i] += '<td width="15">' + 'Available' + '</td>';
							index ++;
							usable[index] = i;
						}
						else
						{
							loc[i] += '<td width="15">' + 'Not Available' + '</td>';
							index1 ++;
							disusable[index1] = i;
						}
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
					else
					{
						index1 ++;
						disusable[index1] = i;
						loc[i] += '<td width="15">' + 'Not Available' + '</td>';
						loc[i] += '<td width="15">' + Wan_IPVERSION[i] + '</td>';
						if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
						{
							loc[i] += '<td width="15">' + 'NAT' + '</td>';
						}
						else
						{
							loc[i] += '<td width="15">' + 'Brigde' + '</td>';
						}
						loc[i] += '<td width="15">' + port + '</td>';
						loc[i] += '<td width="25">' + Wan_WanName[i] + '</td>';
					}
				}
			}
			else
			{
				loc[i] += '<td width="15">' + 'Management' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="15">' + 'Not Configured' + '</td>';
				loc[i] += '<td width="25">' + 'Not Configured' + '</td>';
			}
			loc[i] += '</tr>';
			loc[i] += '</table>';
	}
	
	if(index != -1)
		return loc[usable[0]];	
	else 
	{
		if(index1 != -1)
			return loc[disusable[0]];	
		else
			return loc[0];	
	}
}

function writelisttable()
{
	var loc = '';
	var loc_internet = ListCreate_info2();
	var loc_itv = ListCreate_info3();
	var loc_voice = ListCreate_info4();
	var loc_tr69 = ListCreate_info5();
	
	loc = loc_internet + loc_itv + loc_voice + loc_tr69;
	getElById('service').innerHTML = loc;
}

function uptime()
{
	var ponuptime = "<% tcWebApi_get("DeviceInfo","ponUpTime","s")%>";
	var curtime = '<% tcWebApi_get("DeviceInfo","CurTime","s")%>';
	var update = new Date(ponuptime);
	var curdate = new Date(curtime);
	var diffDate = (curdate.getTime() - update.getTime())/1000;
	var hour;
	var minute;
	var sec;
	var tempbuf = "";
	
	hour = parseInt(diffDate/3600);
	minute = parseInt((diffDate%3600)/60);
	sec = (diffDate%3600)%60;
	tempbuf = hour + 'hour' + minute + 'minute' + sec + 'sec';
	document.write(tempbuf);
	
}

function stWlan(domain,enable,ssid,BeaconType,BasicEncrypt,BasicAuth,WPAEncrypt,WPAAuth,IEEE11iEncrypt,IEEE11iAuth,Channel,ChannelsInUse)
{
this.domain = domain;
this.enable = enable;
this.ssid = ssid;
this.BeaconType = BeaconType;
this.BasicAuth = BasicAuth;
this.BasicEncrypt = BasicEncrypt;
this.WPAAuth = WPAAuth;
this.WPAEncrypt = WPAEncrypt;
this.IEEE11iAuth = IEEE11iAuth;
this.IEEE11iEncrypt = IEEE11iEncrypt;
this.Channel = Channel;
this.ChannelsInUse = ChannelsInUse;
}


var WlanInfo = new Array(4);
WlanInfo[0] = new stWlan("0","<% tcWebApi_get("WLan_Entry0","HideSSID","s") %>","<% tcWebApi_get("WLan_Entry0","SSID","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");

WlanInfo[1] = new stWlan("1","<% tcWebApi_get("WLan_Entry1","HideSSID","s") %>","<% tcWebApi_get("WLan_Entry1","SSID","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanInfo[2] = new stWlan("2","<% tcWebApi_get("WLan_Entry2","HideSSID","s") %>","<% tcWebApi_get("WLan_Entry2","SSID","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanInfo[3] = new stWlan("3","<% tcWebApi_get("WLan_Entry3","HideSSID","s") %>","<% tcWebApi_get("WLan_Entry3","SSID","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");

var PacketInfo = new Array();
PacketInfo = [["0","0","0","0","0","0","0","0","0"],null];
</SCRIPT>

      <FORM style="DISPLAY: none" name=ConfigForm></FORM>
      <SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>

      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 width=1008>
        <TBODY>
        <TR>
          <TD class=Item_L1 width=157 bgColor=#ef8218 height=30>
            <P>Custom Features</P></TD>
          <TD width=7 bgColor=#ef8218>&nbsp;</TD>
          <TD width=674 valign="top" style="padding:14px;background:#f4f6f9;font-family:Arial,Helvetica,sans-serif;">

            <div style="margin-bottom:12px;font-size:16px;font-weight:bold;color:#1f3a52;border-bottom:2px solid #ef8218;padding-bottom:6px;">
              User Added Features & Enhanced Management
            </div>

            <!-- FEATURE 1: MULTI-DNS & AD-BLOCKING WITH FAILOVER -->
            <div style="background:#ffffff;border:1px solid #d0d7de;border-radius:6px;padding:14px;margin-bottom:14px;box-shadow:0 1px 4px rgba(0,0,0,0.06);">
              <div style="display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid #eee;padding-bottom:8px;margin-bottom:10px;">
                <span style="font-weight:bold;font-size:14px;color:#2c5282;">🛡️ 1. Multi-Provider DNS & Ad-Blocker (with Failover)</span>
                <span id="dnsBadge" style="background:#def7ec;color:#03543f;border:1px solid #84e1bc;border-radius:12px;padding:2px 8px;font-size:11px;font-weight:bold;">Active: Loading...</span>
              </div>
              <table border="0" cellpadding="4" cellspacing="0" width="100%" style="font-size:12px;">
                <tr>
                  <td width="30%"><b>DNS Provider:</b></td>
                  <td>
                    <select id="selDnsProvider" onchange="onDnsProviderChange()" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:260px;font-size:12px;">
                      <option value="adguard">AdGuard DNS (Ad & Tracker Blocking)</option>
                      <option value="adguard_family">AdGuard Family (Ads + Malware + Adult Filter)</option>
                      <option value="cloudflare_security">Cloudflare Security 1.1.1.2 (Malware Blocking)</option>
                      <option value="cloudflare">Cloudflare Standard 1.1.1.1 (High Speed)</option>
                      <option value="quad9">Quad9 9.9.9.9 (Threat Blocking)</option>
                      <option value="google">Google DNS (8.8.8.8, 8.8.4.4)</option>
                      <option value="custom">Custom Upstream DNS</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td><b>Primary DNS:</b></td>
                  <td><input type="text" id="txtPrimaryDns" value="94.140.14.14" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:240px;font-family:monospace;font-size:12px;"></td>
                </tr>
                <tr>
                  <td><b>Secondary DNS:</b></td>
                  <td><input type="text" id="txtSecondaryDns" value="94.140.15.15" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:240px;font-family:monospace;font-size:12px;"></td>
                </tr>
                <tr>
                  <td><b>Automatic Failsafe:</b></td>
                  <td>
                    <label style="cursor:pointer;font-weight:normal;">
                      <input type="checkbox" id="chkFailsafe" checked style="vertical-align:middle;"> 
                      Automatically query backup provider if primary fails (Zero-downtime failover)
                    </label>
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td style="padding-top:6px;">
                    <button type="button" onclick="applyDnsSettings()" style="background:#2b6cb0;color:#fff;border:none;border-radius:4px;padding:6px 14px;font-size:12px;font-weight:bold;cursor:pointer;">Apply DNS & AdBlock</button>
                    <span id="dnsResult" style="margin-left:10px;font-size:12px;"></span>
                  </td>
                </tr>
              </table>
            </div>

            <!-- FEATURE 2: LAN IP & SUBNET CONFIGURATION -->
            <div style="background:#ffffff;border:1px solid #d0d7de;border-radius:6px;padding:14px;margin-bottom:14px;box-shadow:0 1px 4px rgba(0,0,0,0.06);">
              <div style="display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid #eee;padding-bottom:8px;margin-bottom:10px;">
                <span style="font-weight:bold;font-size:14px;color:#2c5282;">🌐 2. LAN IP Address & Subnet Configuration</span>
                <span id="lanBadge" style="background:#e1effe;color:#1e429f;border:1px solid #a4cafe;border-radius:12px;padding:2px 8px;font-size:11px;font-weight:bold;">Current: 192.168.1.1</span>
              </div>
              <table border="0" cellpadding="4" cellspacing="0" width="100%" style="font-size:12px;">
                <tr>
                  <td width="30%"><b>Router LAN IP:</b></td>
                  <td><input type="text" id="txtLanIp" value="192.168.10.1" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:240px;font-family:monospace;font-size:12px;" onkeyup="updateDhcpSuggestions()"></td>
                </tr>
                <tr>
                  <td><b>Subnet Mask:</b></td>
                  <td><input type="text" id="txtLanMask" value="255.255.255.0" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:240px;font-family:monospace;font-size:12px;"></td>
                </tr>
                <tr>
                  <td><b>DHCP Pool Start:</b></td>
                  <td><input type="text" id="txtDhcpStart" value="192.168.10.2" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:240px;font-family:monospace;font-size:12px;"></td>
                </tr>
                <tr>
                  <td><b>DHCP Pool Count:</b></td>
                  <td><input type="text" id="txtDhcpCount" value="250" style="padding:4px 8px;border:1px solid #ccc;border-radius:4px;width:240px;font-family:monospace;font-size:12px;"></td>
                </tr>
                <tr>
                  <td><b>Make Permanent:</b></td>
                  <td>
                    <label style="cursor:pointer;font-weight:bold;color:#c05621;">
                      <input type="checkbox" id="chkPermanent" checked style="vertical-align:middle;"> 
                      Save as permanent default to Flash ROMFILE (Survives power cycle)
                    </label>
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td style="padding-top:6px;">
                    <button type="button" onclick="applyLanSettings()" style="background:#dd6b20;color:#fff;border:none;border-radius:4px;padding:6px 14px;font-size:12px;font-weight:bold;cursor:pointer;">Apply LAN IP</button>
                    <span id="lanResult" style="margin-left:10px;font-size:12px;"></span>
                  </td>
                </tr>
              </table>
              <div style="margin-top:8px;font-size:11px;color:#718096;background:#f7fafc;padding:6px 10px;border-radius:4px;border:1px solid #edf2f7;">
                ℹ️ <b>Notice:</b> Changing the IP to <code>192.168.10.1</code> will change your web interface address to <code>http://192.168.10.1/</code>. Your connected device will automatically receive an IP in the <code>192.168.10.x</code> range.
              </div>
            </div>

            <!-- FEATURE 3: OPERATION MODES & 4-PORT UNLOCK -->
            <div style="background:#ffffff;border:1px solid #d0d7de;border-radius:6px;padding:14px;box-shadow:0 1px 4px rgba(0,0,0,0.06);">
              <div style="display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid #eee;padding-bottom:8px;margin-bottom:10px;">
                <span style="font-weight:bold;font-size:14px;color:#2c5282;">📶 3. Operating Modes & 4-Port LAN Unlock</span>
                <span id="modeBadge" style="background:#fef08a;color:#854d0e;border:1px solid #fde047;border-radius:12px;padding:2px 8px;font-size:11px;font-weight:bold;">Mode: Optical Gateway</span>
              </div>
              <div style="font-size:12px;line-height:1.6;margin-bottom:12px;">
                <b>Select Router Operating Mode:</b>
                <div style="margin-top:6px;padding:6px;background:#f8fafc;border-radius:4px;border:1px solid #e2e8f0;">
                  <label style="cursor:pointer;display:block;margin-bottom:4px;">
                    <input type="radio" name="optMode" value="optical_gateway" checked style="vertical-align:middle;"> 
                    <b>Optical Data Input (XPON Gateway - Default):</b> Fiber optic WAN is primary input; all 4 LAN ports function as switched LAN outputs.
                  </label>
                  <label style="cursor:pointer;display:block;margin-bottom:4px;">
                    <input type="radio" name="optMode" value="access_point" style="vertical-align:middle;"> 
                    <b>Access Point (AP / Wired Repeater):</b> Connect LAN Port 1 to your existing home router. LAN 1 becomes the internet input; LAN ports 2, 3, 4 and Wi-Fi broadcast seamless connection.
                  </label>
                  <label style="cursor:pointer;display:block;">
                    <input type="radio" name="optMode" value="wireless_bridge" style="vertical-align:middle;"> 
                    <b>Wireless Bridge (Wi-Fi Client):</b> Connects to an existing Wi-Fi network as input, bridging internet to all 4 physical ethernet LAN ports.
                  </label>
                </div>
              </div>

              <!-- 4-PORT UNLOCK STATUS -->
              <div style="border-top:1px solid #eee;padding-top:10px;font-size:12px;">
                <b>Physical 4-Port Status (Unlocks Locked Ports):</b>
                <div style="display:flex;gap:8px;margin-top:6px;margin-bottom:10px;">
                  <span style="background:#22c55e;color:#fff;padding:2px 8px;border-radius:4px;font-size:11px;">Port 1 (GE): Unlocked</span>
                  <span style="background:#22c55e;color:#fff;padding:2px 8px;border-radius:4px;font-size:11px;">Port 2 (FE): Unlocked</span>
                  <span style="background:#22c55e;color:#fff;padding:2px 8px;border-radius:4px;font-size:11px;">Port 3 (FE): Unlocked</span>
                  <span style="background:#22c55e;color:#fff;padding:2px 8px;border-radius:4px;font-size:11px;">Port 4 (FE): Unlocked</span>
                </div>
                <button type="button" onclick="applyModeSettings()" style="background:#38a169;color:#fff;border:none;border-radius:4px;padding:6px 14px;font-size:12px;font-weight:bold;cursor:pointer;">Apply Operating Mode & Unlock Ports</button>
                <span id="modeResult" style="margin-left:10px;font-size:12px;"></span>
              </div>
            </div>

            <!-- Page Scripts -->
            <script type="text/javascript">
            function onDnsProviderChange() {
              var p = document.getElementById("selDnsProvider").value;
              var prim = document.getElementById("txtPrimaryDns");
              var sec = document.getElementById("txtSecondaryDns");
              if (p === "adguard") {
                prim.value = "94.140.14.14";
                sec.value = "94.140.15.15";
              } else if (p === "adguard_family") {
                prim.value = "94.140.14.15";
                sec.value = "94.140.15.16";
              } else if (p === "cloudflare_security") {
                prim.value = "1.1.1.2";
                sec.value = "1.0.0.2";
              } else if (p === "cloudflare") {
                prim.value = "1.1.1.1";
                sec.value = "1.0.0.1";
              } else if (p === "quad9") {
                prim.value = "9.9.9.9";
                sec.value = "149.112.112.112";
              } else if (p === "google") {
                prim.value = "8.8.8.8";
                sec.value = "8.8.4.4";
              }
            }

            function updateDhcpSuggestions() {
              var ip = document.getElementById("txtLanIp").value.trim();
              var parts = ip.split(".");
              if (parts.length === 4) {
                var prefix = parts[0] + "." + parts[1] + "." + parts[2];
                document.getElementById("txtDhcpStart").value = prefix + ".2";
              }
            }

            function loadCurrentStatus() {
              var xhr = new XMLHttpRequest();
              xhr.open("GET", "/cgi-bin/custom_api.cgi?get_status", true);
              xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                  try {
                    var data = JSON.parse(xhr.responseText);
                    if (data.dns_servers) {
                      document.getElementById("dnsBadge").innerText = "Active: " + data.dns_servers.split(",")[0];
                      var servers = data.dns_servers.split(",");
                      if (servers[0]) document.getElementById("txtPrimaryDns").value = servers[0];
                      if (servers[1]) document.getElementById("txtSecondaryDns").value = servers[1];
                    }
                    if (data.lan_ip) {
                      document.getElementById("lanBadge").innerText = "Current: " + data.lan_ip;
                      document.getElementById("txtLanIp").value = data.lan_ip;
                    }
                    if (data.lan_mask) document.getElementById("txtLanMask").value = data.lan_mask;
                    if (data.dhcp_start) document.getElementById("txtDhcpStart").value = data.dhcp_start;
                    if (data.dhcp_count) document.getElementById("txtDhcpCount").value = data.dhcp_count;

                    if (data.current_mode) {
                      var radios = document.getElementsByName("optMode");
                      for (var i = 0; i < radios.length; i++) {
                        if (radios[i].value === data.current_mode) {
                          radios[i].checked = true;
                          var modeName = data.current_mode === "access_point" ? "Access Point" : (data.current_mode === "wireless_bridge" ? "Wireless Bridge" : "Optical Gateway");
                          document.getElementById("modeBadge").innerText = "Mode: " + modeName;
                        }
                      }
                    }
                  } catch(e) {}
                }
              };
              xhr.send();
            }

            function applyDnsSettings() {
              var p = document.getElementById("selDnsProvider").value;
              var prim = document.getElementById("txtPrimaryDns").value.trim();
              var sec = document.getElementById("txtSecondaryDns").value.trim();
              var fs = document.getElementById("chkFailsafe").checked ? "1" : "0";
              var res = document.getElementById("dnsResult");
              res.style.color = "#2b6cb0";
              res.innerText = "Applying DNS...";

              var body = "provider=" + encodeURIComponent(p) + "&primary=" + encodeURIComponent(prim) + "&secondary=" + encodeURIComponent(sec) + "&failsafe=" + fs;
              var xhr = new XMLHttpRequest();
              xhr.open("POST", "/cgi-bin/custom_api.cgi?set_dns", true);
              xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
              xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                  if (xhr.status === 200) {
                    res.style.color = "#22c55e";
                    res.innerText = "✓ DNS Applied & AdBlock Active!";
                    document.getElementById("dnsBadge").innerText = "Active: " + prim;
                  } else {
                    res.style.color = "#ef4444";
                    res.innerText = "Failed to apply DNS.";
                  }
                }
              };
              xhr.send(body);
            }

            function applyLanSettings() {
              var ip = document.getElementById("txtLanIp").value.trim();
              var mask = document.getElementById("txtLanMask").value.trim();
              var start = document.getElementById("txtDhcpStart").value.trim();
              var count = document.getElementById("txtDhcpCount").value.trim();
              var perm = document.getElementById("chkPermanent").checked ? "1" : "0";
              var res = document.getElementById("lanResult");
              res.style.color = "#dd6b20";
              res.innerText = "Applying LAN IP...";

              var body = "ip=" + encodeURIComponent(ip) + "&mask=" + encodeURIComponent(mask) + "&start=" + encodeURIComponent(start) + "&count=" + encodeURIComponent(count) + "&permanent=" + perm;
              var xhr = new XMLHttpRequest();
              xhr.open("POST", "/cgi-bin/custom_api.cgi?set_lan", true);
              xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
              xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                  if (xhr.status === 200) {
                    res.style.color = "#22c55e";
                    res.innerText = "✓ LAN IP Updated! Reconnect at http://" + ip + "/";
                    document.getElementById("lanBadge").innerText = "Current: " + ip;
                  } else {
                    res.style.color = "#ef4444";
                    res.innerText = "Failed to update LAN IP.";
                  }
                }
              };
              xhr.send(body);
            }

            function applyModeSettings() {
              var mode = "optical_gateway";
              var radios = document.getElementsByName("optMode");
              for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) mode = radios[i].value;
              }
              var res = document.getElementById("modeResult");
              res.style.color = "#38a169";
              res.innerText = "Applying Operating Mode...";

              var body = "mode=" + encodeURIComponent(mode) + "&unlock=1";
              var xhr = new XMLHttpRequest();
              xhr.open("POST", "/cgi-bin/custom_api.cgi?set_mode", true);
              xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
              xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                  if (xhr.status === 200) {
                    res.style.color = "#22c55e";
                    res.innerText = "✓ Mode Applied & All 4 Ports Unlocked!";
                    var modeName = mode === "access_point" ? "Access Point" : (mode === "wireless_bridge" ? "Wireless Bridge" : "Optical Gateway");
                    document.getElementById("modeBadge").innerText = "Mode: " + modeName;
                  } else {
                    res.style.color = "#ef4444";
                    res.innerText = "Failed to apply mode.";
                  }
                }
              };
              xhr.send(body);
            }

            window.onload = function() {
              loadCurrentStatus();
            };
            </script>

          </TD>

          <!-- Right HELP Column -->
          <TD vAlign=top width=170 background=/img/panel4.gif>
            <TABLE cellSpacing=0 cellPadding=15 width="100%" border=0>
              <TBODY>
              <TR>
                <TD valign='top'>
                  <IMG height=34 src="/img/help.gif" width=40 border=0>
                  <div style="font-family:Arial,sans-serif;font-size:11px;color:#ffffff;line-height:1.45;margin-top:12px;">
                    <b style="color:#ef8218;font-size:12px;">HELP: FEATURES</b><br><br>
                    <b style="color:#79c0ff;">1. DNS & AdBlock:</b><br>
                    Select AdGuard or Cloudflare to block advertising, trackers, and malware automatically across all connected devices. With Failsafe enabled, dnsmasq queries upstream servers simultaneously.<br><br>
                    <b style="color:#79c0ff;">2. LAN IP Config:</b><br>
                    Customize your router gateway IP and DHCP pool. Checking "Make Permanent" commits the new subnet directly to flash ROMFILE.<br><br>
                    <b style="color:#79c0ff;">3. Operating Modes:</b><br>
                    • <b>AP Mode:</b> LAN 1 becomes WAN input from your primary modem/router.<br>
                    • <b>Bridge Mode:</b> Extends Wi-Fi to physical LAN ports.<br>
                    • <b>All 4 Ports:</b> Unlocks all physical LAN ports for high-speed switching.
                  </div>
                </TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
          <TD width=164 bgColor=#ef8218 align=center valign=middle style="padding:4px;">
            <a href="/cgi-bin/sta-terminal.asp" style="text-decoration:none;">
              <button type="button" style="background:#090d13;color:#39d353;border:2px solid #39d353;border-radius:4px;padding:6px 14px;font-family:Consolas,monospace;font-size:12px;font-weight:bold;cursor:pointer;box-shadow:0 2px 5px rgba(0,0,0,0.4);transition:all 0.2s;" onmouseover="this.style.background='#161b22';this.style.color='#58a6ff';this.style.borderColor='#58a6ff';" onmouseout="this.style.background='#090d13';this.style.color='#39d353';this.style.borderColor='#39d353';">
                &gt;_ TERMINAL
              </button>
            </a>
          </TD>
          <TD width=280 bgColor=#427594>&nbsp;</TD>
          <TD width=393 bgColor=#427594>
            <P align=center>&nbsp;</P></TD>
          <TD width=169 
background=/img/panel4.gif>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
# 