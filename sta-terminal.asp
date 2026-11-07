<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Root Web Terminal</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=UTF-8"><LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>

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
            value="Status->Terminal" name=Selected_Menu> </FONT></B><SPAN 
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
            <P>Root Terminal</P></TD>
          <TD width=7 bgColor=#ef8218>&nbsp;</TD>
          <TD width=674 valign="top" style="padding:10px;background:#141414;">

            <!-- Embedded Linux Terminal Window -->
            <div id="termWindow" style="width:100%;height:520px;background:#0c0c0c;border:1px solid #333333;border-radius:6px;display:flex;flex-direction:column;font-family:'Cascadia Code',Consolas,monospace;font-size:13px;overflow:hidden;box-shadow:0 4px 15px rgba(0,0,0,0.6);" onclick="focusTermInput(event)">
              
              <!-- Terminal Header Bar -->
              <div style="background:#1f1f1f;border-bottom:1px solid #333333;padding:6px 12px;display:flex;justify-content:space-between;align-items:center;user-select:none;flex-shrink:0;">
                <div style="display:flex;align-items:center;gap:8px;font-size:12px;color:#f0f0f0;font-weight:600;">
                  <span style="display:inline-block;width:9px;height:9px;background:#39d353;border-radius:50%;box-shadow:0 0 6px #39d353;"></span>
                  <span>root@UW-311VPW: <span id="headerPath" style="color:#58a6ff;">~</span></span>
                  <span style="background:#2b2b2b;color:#39d353;border:1px solid #3d3d3d;border-radius:3px;padding:1px 6px;font-size:11px;font-weight:normal;">Root (UID 0)</span>
                </div>
                <div style="display:flex;gap:6px;">
                  <button type="button" onclick="clearTermScreen()" style="background:#2d2d2d;color:#cccccc;border:1px solid #3d3d3d;border-radius:3px;padding:2px 8px;font-size:11px;cursor:pointer;">Clear</button>
                  <button type="button" onclick="resetTermDir()" style="background:#2d2d2d;color:#cccccc;border:1px solid #3d3d3d;border-radius:3px;padding:2px 8px;font-size:11px;cursor:pointer;">Reset Dir</button>
                  <button type="button" onclick="showTermHelp()" style="background:#2d2d2d;color:#cccccc;border:1px solid #3d3d3d;border-radius:3px;padding:2px 8px;font-size:11px;cursor:pointer;">Help</button>
                </div>
              </div>

              <!-- Quick Command Pills -->
              <div style="background:#141414;border-bottom:1px solid #222222;padding:4px 10px;display:flex;gap:5px;flex-wrap:wrap;align-items:center;flex-shrink:0;">
                <span style="color:#666666;font-size:10px;">Quick:</span>
                <button type="button" onclick="execDirect('uname -a')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">uname -a</button>
                <button type="button" onclick="execDirect('cat /proc/mtd')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">cat /proc/mtd</button>
                <button type="button" onclick="execDirect('cat /proc/cpuinfo')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">cpuinfo</button>
                <button type="button" onclick="execDirect('free')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">free</button>
                <button type="button" onclick="execDirect('ifconfig')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">ifconfig</button>
                <button type="button" onclick="execDirect('ps')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">ps</button>
                <button type="button" onclick="execDirect('ls -la')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">ls -la</button>
                <button type="button" onclick="execDirect('dmesg | tail -n 20')" style="background:#1d1d1d;color:#79c0ff;border:1px solid #333333;border-radius:3px;padding:1px 6px;font-size:10px;cursor:pointer;">dmesg</button>
              </div>

              <!-- Terminal Scrollable Viewport -->
              <div id="termViewport" style="flex:1;padding:10px 12px;overflow-y:auto;overflow-x:hidden;cursor:text;color:#cccccc;font-size:12px;line-height:1.45;">
                <div style="color:#777777;margin-bottom:10px;line-height:1.4;">
                  <div>================================================================</div>
                  <div><b style="color:#58a6ff;">Uniway UW-311VPW Linux Gateway</b> (EcoNet EN751221 MIPS 34Kc @ 900MHz)</div>
                  <div>Kernel: Linux 2.6.36 SMP | BusyBox v1.00 | <span style="color:#39d353;">Root Shell (UID 0)</span></div>
                  <div>Interactive console stays directly within the web management page.</div>
                  <div>Type <span style="color:#e3b341;">'help'</span> for commands, or run any Linux shell syntax.</div>
                  <div>================================================================</div>
                </div>

                <!-- Past rows appended here -->
                <div id="termHistory"></div>

                <!-- Active Line -->
                <div id="termActiveLine" style="display:flex;align-items:center;flex-wrap:wrap;margin-top:4px;">
                  <span id="promptUser" style="color:#39d353;font-weight:bold;">root@UW-311VPW</span><span style="color:#ffffff;">:</span><span id="promptCwd" style="color:#58a6ff;font-weight:bold;">~/cgi-bin</span><span style="color:#e3b341;font-weight:bold;margin-right:6px;">#</span>
                  <div style="flex:1;min-width:180px;display:flex;align-items:center;">
                    <input type="text" id="termInput" autocomplete="off" autofocus spellcheck="false" style="width:100%;background:transparent;border:none;outline:none;color:#f0f6fc;font-family:inherit;font-size:12px;caret-color:#39d353;padding:0;margin:0;" onkeydown="handleTermKey(event)">
                    <span id="termSpinner" style="display:none;width:10px;height:10px;border:2px solid #58a6ff;border-radius:50%;border-top-color:transparent;animation:spin 0.6s linear infinite;margin-left:6px;"></span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Terminal JavaScript Engine -->
            <script type="text/javascript">
            var currentCwd = "/boaroot/cgi-bin";
            var cmdHist = [];
            var histIdx = -1;
            var isRunning = false;

            var autoList = [
              "cat", "cd", "cp", "chmod", "chown", "clear", "cls", "cpuinfo",
              "date", "dd", "df", "dmesg", "echo", "exit", "free", "grep",
              "head", "help", "history", "ifconfig", "iptables", "kill", "killall",
              "ln", "ls", "mkdir", "mount", "mv", "netstat", "nslookup", "ping",
              "ps", "pwd", "reboot", "rm", "rmdir", "route", "sed", "sh", "sleep",
              "tar", "top", "traceroute", "umount", "uname", "uptime", "vi", "zcat",
              "/boaroot", "/tmp", "/etc", "/userfs", "/bin", "/sbin", "/proc", "/sys"
            ];

            function updatePrompt() {
              var p = currentCwd;
              if (p === "/boaroot/cgi-bin") p = "~/cgi-bin";
              else if (p === "/root") p = "~";
              document.getElementById("promptCwd").innerText = p;
              document.getElementById("headerPath").innerText = p;
            }

            function focusTermInput(e) {
              var s = window.getSelection();
              if (s && s.toString().length > 0) return;
              var inp = document.getElementById("termInput");
              if (inp) inp.focus();
            }

            function clearTermScreen() {
              document.getElementById("termHistory").innerHTML = "";
              focusTermInput();
            }

            function resetTermDir() {
              currentCwd = "/boaroot/cgi-bin";
              updatePrompt();
              focusTermInput();
            }

            function showTermHelp() {
              var h = "Available commands: cd <dir>, ls, pwd, cat, ps, free, ifconfig, uname, dmesg, reboot\n" +
                      "Shortcuts: Up/Down for command history, Tab to autocomplete, Ctrl+L or 'clear' to wipe terminal.";
              appendTermRow("help", h);
            }

            function handleTermKey(e) {
              if (isRunning) return;

              if (e.keyCode === 13) { // Enter
                var val = document.getElementById("termInput").value.trim();
                if (val) executeTerm(val);
                else appendBlankRow();
              } else if (e.keyCode === 38) { // Up
                e.preventDefault();
                if (cmdHist.length > 0) {
                  if (histIdx === -1) histIdx = cmdHist.length - 1;
                  else if (histIdx > 0) histIdx--;
                  document.getElementById("termInput").value = cmdHist[histIdx];
                }
              } else if (e.keyCode === 40) { // Down
                e.preventDefault();
                if (histIdx !== -1) {
                  if (histIdx < cmdHist.length - 1) {
                    histIdx++;
                    document.getElementById("termInput").value = cmdHist[histIdx];
                  } else {
                    histIdx = -1;
                    document.getElementById("termInput").value = "";
                  }
                }
              } else if (e.keyCode === 9) { // Tab
                e.preventDefault();
                tabComplete();
              } else if (e.ctrlKey && e.keyCode === 76) { // Ctrl+L
                e.preventDefault();
                clearTermScreen();
              } else if (e.ctrlKey && e.keyCode === 67) { // Ctrl+C
                e.preventDefault();
                appendCancelRow();
              }
            }

            function tabComplete() {
              var inp = document.getElementById("termInput");
              var tokens = inp.value.split(" ");
              var last = tokens[tokens.length - 1];
              if (!last) return;
              var m = autoList.filter(function(x) { return x.indexOf(last) === 0; });
              if (m.length === 1) {
                tokens[tokens.length - 1] = m[0];
                inp.value = tokens.join(" ") + (m[0].slice(-1) === "/" ? "" : " ");
              }
            }

            function appendBlankRow() {
              var h = document.getElementById("termHistory");
              var d = document.createElement("div");
              d.style.marginBottom = "4px";
              d.innerHTML = '<span style="color:#39d353;font-weight:bold;">root@UW-311VPW</span>:<span style="color:#58a6ff;font-weight:bold;">' + esc(document.getElementById("promptCwd").innerText) + '</span><span style="color:#e3b341;font-weight:bold;"># </span>';
              h.appendChild(d);
              scrollTerm();
            }

            function appendCancelRow() {
              var inp = document.getElementById("termInput");
              var v = inp.value;
              inp.value = "";
              histIdx = -1;
              var h = document.getElementById("termHistory");
              var d = document.createElement("div");
              d.style.marginBottom = "4px";
              d.innerHTML = '<span style="color:#39d353;font-weight:bold;">root@UW-311VPW</span>:<span style="color:#58a6ff;font-weight:bold;">' + esc(document.getElementById("promptCwd").innerText) + '</span><span style="color:#e3b341;font-weight:bold;"># </span>' + esc(v) + ' <span style="color:#f85149;">^C</span>';
              h.appendChild(d);
              scrollTerm();
            }

            function appendTermRow(cmd, output) {
              var h = document.getElementById("termHistory");
              var d = document.createElement("div");
              d.style.marginBottom = "8px";
              var p = '<span style="color:#39d353;font-weight:bold;">root@UW-311VPW</span>:<span style="color:#58a6ff;font-weight:bold;">' + esc(document.getElementById("promptCwd").innerText) + '</span><span style="color:#e3b341;font-weight:bold;"># </span><span style="color:#f0f6fc;font-weight:500;">' + esc(cmd) + '</span>';
              var o = '<div style="color:#d1d5db;margin-top:2px;white-space:pre-wrap;word-break:break-all;">' + esc(output) + '</div>';
              d.innerHTML = p + o;
              h.appendChild(d);
              scrollTerm();
            }

            function execDirect(cmd) {
              document.getElementById("termInput").value = cmd;
              executeTerm(cmd);
            }

            function executeTerm(cmd) {
              if (!cmd) return;
              var low = cmd.toLowerCase().trim();
              if (low === "clear" || low === "cls") {
                document.getElementById("termInput").value = "";
                clearTermScreen();
                return;
              }
              if (low === "help") {
                document.getElementById("termInput").value = "";
                showTermHelp();
                return;
              }
              if (low === "history") {
                document.getElementById("termInput").value = "";
                appendTermRow("history", cmdHist.map(function(c, i){ return "  " + (i+1) + "  " + c; }).join("\n") || "No history");
                return;
              }

              cmdHist.push(cmd);
              histIdx = -1;
              document.getElementById("termInput").value = "";

              isRunning = true;
              document.getElementById("termSpinner").style.display = "inline-block";

              var xhr = new XMLHttpRequest();
              xhr.open("POST", "/cgi-bin/exec.cgi", true);
              xhr.setRequestHeader("Content-Type", "text/plain");
              xhr.setRequestHeader("X-CWD", currentCwd);

              xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                  isRunning = false;
                  document.getElementById("termSpinner").style.display = "none";

                  var raw = xhr.responseText || "";
                  var marker = "___PWD_END___:";
                  var pIdx = raw.lastIndexOf(marker);
                  var out = raw;

                  if (pIdx !== -1) {
                    var np = raw.substring(pIdx + marker.length).trim();
                    out = raw.substring(0, pIdx).trimRight();
                    if (np) {
                      currentCwd = np;
                      updatePrompt();
                    }
                  }

                  if (xhr.status === 200) {
                    appendTermRow(cmd, out);
                  } else {
                    appendTermRow(cmd, "[HTTP Error " + xhr.status + "]: Execution failed");
                  }
                  focusTermInput();
                }
              };
              xhr.send(cmd);
            }

            function scrollTerm() {
              var v = document.getElementById("termViewport");
              v.scrollTop = v.scrollHeight;
            }

            function esc(t) {
              if (!t) return "";
              return t.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            }

            setTimeout(function() { focusTermInput(); updatePrompt(); }, 150);
            </script>
          </TD>

          <!-- Right HELP Panel -->
          <TD vAlign=top width=170 background=/img/panel4.gif>
            <TABLE cellSpacing=0 cellPadding=15 width="100%" border=0>
              <TBODY>
              <TR>
                <TD valign='top'>
                  <IMG height=34 src="/img/help.gif" width=40 border=0>
                  <div style="font-family:Arial,sans-serif;font-size:11px;color:#ffffff;line-height:1.45;margin-top:12px;">
                    <b style="color:#ef8218;font-size:12px;">ROOT TERMINAL</b><br><br>
                    Direct shell on the EcoNet EN751221 MIPS processor.<br><br>
                    <b style="color:#79c0ff;">Features:</b><br>
                    • Full UID 0 root privileges.<br>
                    • Persistent <code style="color:#39d353;">cd</code> working dir.<br>
                    • Command history (<code style="color:#39d353;">&uarr;/&darr;</code>).<br>
                    • Tab autocompletion.<br>
                    • Instant AJAX execution.<br><br>
                    <b style="color:#79c0ff;">Flash Layout:</b><br>
                    • <code style="color:#e3b341;">mtd0</code>: Bootloader<br>
                    • <code style="color:#e3b341;">mtd1</code>: Romfile XML<br>
                    • <code style="color:#e3b341;">mtd2</code>: Kernel<br>
                    • <code style="color:#e3b341;">mtd3</code>: RootFS (Squash)<br>
                    • <code style="color:#e3b341;">/tmp</code>: Writable RAM
                  </div>
                </TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
          <TD width=164 bgColor=#ef8218 align=center valign=middle style="padding:4px;">
            <a href="/cgi-bin/sta-device.asp" style="text-decoration:none;">
              <button type="button" style="background:#090d13;color:#79c0ff;border:2px solid #58a6ff;border-radius:4px;padding:6px 12px;font-family:Consolas,monospace;font-size:11px;font-weight:bold;cursor:pointer;" onmouseover="this.style.background='#161b22';this.style.color='#ffffff';" onmouseout="this.style.background='#090d13';this.style.color='#79c0ff';">
                &larr; DEVICE INFO
              </button>
            </a>
          </TD>
          <TD width=280 bgColor=#427594>&nbsp;</TD>
          <TD width=393 bgColor=#427594>
            <P align=center>&nbsp;</P></TD>
          <TD width=169 
background=/img/panel4.gif>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
# 