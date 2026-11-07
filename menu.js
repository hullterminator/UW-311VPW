// JavaScript Document
var curUserName = parent.curUser;
if (typeof(curUserName) == "undefined")
	curUserName = '0';
var vPageMap = parent.pageMap;
if(parent.voipType!= null)
	var VoipType = parent.voipType;
else
	var VoipType = "SIP";
if (typeof(vPageMap) == "undefined")
	top.window.location.href="/cgi-bin/content.asp";
var sysUserName = '1';
var sptUserName = '0';
var ctcqdUserName = 'ctcqd';
var bandRegName = 'regAcc';
var usrUserName = 0;
var iCount = 0;
var IsIPv6Support = parent.IPv6Support;
if (typeof(IsIPv6Support) == "undefined")
	IsIPv6Support = 'No';
var IsVOIPSupport = parent.VOIPSupport;
if (typeof(IsVOIPSupport) == "undefined")
	IsVOIPSupport = 'No';

var aclSupport = parent.isACLSupport;
if (typeof(aclSupport) == "undefined")
	aclSupport = 'No';
var keywordFilterSupport = parent.isKeywordFilterSupported;
if (typeof(keywordFilterSupport) == "undefined")
	keywordFilterSupport = 'No';
var parentalCtlSupport = parent.isParentalControlSupported;
if (typeof(parentalCtlSupport) == "undefined")
	parentalCtlSupport = 'No';
var parentIsUpgradePageShow = parent.isUpgradePageShow;
if (typeof(parentIsUpgradePageShow) == "undefined")
	parentIsUpgradePageShow = 'No';

var MenuArray = new Array();

//QS->0
//Sta->1
if(vPageMap[1][0] == '1'){
	if(vPageMap[1][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-device.asp", "");
	else if(vPageMap[1][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-network.asp", "");
	else if(vPageMap[1][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-user.asp", "");
	else if(vPageMap[1][4] == '1' && IsVOIPSupport == 'Yes')
		if(VoipType == 'H.248')
			MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-VoIP248.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-VoIP.asp", "");
	else if(vPageMap[1][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-acs.asp", "");							
	else if(vPageMap[1][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-BUCPEInfo.asp", "");		

	if(vPageMap[1][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Device", "/cgi-bin/sta-device.asp", "");
	if(vPageMap[1][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "WAN", "/cgi-bin/sta-network.asp", "");
	if(vPageMap[1][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "LAN", "/cgi-bin/sta-user.asp", "");
	if (IsVOIPSupport == 'Yes') {
	if(vPageMap[1][4] == '1')
		if(VoipType == 'H.248')
			MenuArray[iCount++] = new MenuNodeConstruction(2, "VoIP", "/cgi-bin/sta-VoIP248.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(2, "VoIP", "/cgi-bin/sta-VoIP.asp", "");
	}
	if(vPageMap[1][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "TR069", "/cgi-bin/sta-acs.asp", "");
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Terminal", "/cgi-bin/sta-terminal.asp", "");
	/*if(vPageMap[1][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "General broadband service information", "/cgi-bin/sta-BUCPEInfo.asp", "");*/
}


//Net->2
if(vPageMap[2][0] == '1'){
	if(vPageMap[2][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-wanset.asp", "");
	else if(vPageMap[2][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-binding.asp", "");
	else if(vPageMap[2][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-dhcp.asp", "");
	else if(vPageMap[2][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-wlan.asp", "");
	else if(vPageMap[2][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-wlan11ac.asp", "");								
	else if(vPageMap[2][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-tr069.asp", "");
	else if(vPageMap[2][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-phoneapp.asp", "");
	else if(vPageMap[2][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-qos.asp", "");
	else if(vPageMap[2][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-time.asp", "");
	else if(vPageMap[2][8] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-routeset.asp", "");	
	else if(vPageMap[2][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/qos-dslimit.asp", "");		


	if(vPageMap[2][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "WAN", "/cgi-bin/net-wanset.asp", "");
	if(vPageMap[2][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Binding", "/cgi-bin/net-binding.asp", "");

	if(vPageMap[2][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "LAN", "/cgi-bin/net-dhcp.asp", "");
	if(vPageMap[2][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN 2.4G", "/cgi-bin/net-wlan.asp", "");

	if(vPageMap[2][11] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN 5G", "/cgi-bin/net-wlan11ac.asp", "");
	if(vPageMap[2][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "TR069", "/cgi-bin/net-tr069.asp", "");
	if(vPageMap[2][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Phone connection management", "/cgi-bin/net-phoneapp.asp", "");
	if(vPageMap[2][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "QoS", "/cgi-bin/net-qos.asp", "");
	if(vPageMap[2][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "SNTP", "/cgi-bin/net-time.asp", "");

	if(vPageMap[2][8] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Routing", "/cgi-bin/net-routeset.asp", "");
	if(vPageMap[2][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "QoS Bandwidth", "/cgi-bin/qos-dslimit.asp", "");
}


//Sec->3
if(vPageMap[3][0] == '1'){
	if(vPageMap[3][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-urlfilter.asp", "");
	else if(vPageMap[3][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-firewall.asp", "");
	else if(vPageMap[3][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-macfilter.asp", "");
	else if(vPageMap[3][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-portfilter.asp", "");				
	else if(vPageMap[3][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-parentalctrl.asp", "");		
	else if(vPageMap[3][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-keywordfilter.asp", "");	
	else if(vPageMap[3][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-addacl.asp", "");	
	
	if(vPageMap[3][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "URL Filter", "/cgi-bin/sec-urlfilter.asp", "");
	if(vPageMap[3][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Firewall", "/cgi-bin/sec-firewall.asp", "");
	if(vPageMap[3][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Mac Filter", "/cgi-bin/sec-macfilter.asp", "");
	if(vPageMap[3][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "IP/Port Filter", "/cgi-bin/sec-portfilter.asp", "");
	
	if(vPageMap[3][5] == '1' && parentalCtlSupport == "Yes")
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Parental Control", "/cgi-bin/sec-parentalctrl.asp", "");
	
	if(vPageMap[3][6] == '1' && keywordFilterSupport == "Yes")
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Keyword Filter", "/cgi-bin/sec-keywordfilter.asp", "");
	
	if(vPageMap[3][7] == '1' && aclSupport == "Yes")
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Access Control", "/cgi-bin/sec-addacl.asp", "");

}

//App->4
if(vPageMap[4][0] == '1'){
	if(vPageMap[4][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-ddns.asp", "");
	else if(vPageMap[4][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-natset.asp", "");
	else if(vPageMap[4][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-upnp.asp", "");
	else if(vPageMap[4][4] == '1')
		if(VoipType == 'H.248')
			MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-VoIP248.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-VoIP.asp", "");
	else if(vPageMap[4][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-igmpset.asp", "");
	else if(vPageMap[4][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-daily.asp", "");		
	
	if(vPageMap[4][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "DDNS", "/cgi-bin/app-ddns.asp", "");
	if(vPageMap[4][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Advance NAT", "/cgi-bin/app-natset.asp", "");
	if(vPageMap[4][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "UPnP", "/cgi-bin/app-upnp.asp", "");
	if(vPageMap[4][4] == '1' && IsVOIPSupport == 'Yes') 
		if(VoipType == 'H.248')
			MenuArray[iCount++] = new MenuNodeConstruction(2, "VoIP", "/cgi-bin/app-VoIP248.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(2, "VoIP", "/cgi-bin/app-VoIP.asp", "");
	if(vPageMap[4][5] == '1')
	{
		if(IsIPv6Support == 'Yes')
			MenuArray[iCount++] = new MenuNodeConstruction(2, "IGMP/MLD", "/cgi-bin/app-igmpset.asp", "");
		else
			MenuArray[iCount++] = new MenuNodeConstruction(2, "IGMP Setting", "/cgi-bin/app-igmpset.asp", "");
	}
	if(vPageMap[4][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Daily Application", "/cgi-bin/app-daily.asp", "");
}

//Mag->5
if(vPageMap[5][0] == '1'){
	if(vPageMap[5][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Maintenance", "/cgi-bin/mag-account.asp", "");
	else if(vPageMap[5][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Maintenance", "/cgi-bin/mag-reset.asp", "");
	else if(vPageMap[5][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Maintenance", "/cgi-bin/mag-syslogmanage.asp", "");
	
	if(vPageMap[5][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Account", "/cgi-bin/mag-account.asp", "");
	if(vPageMap[5][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Device", "/cgi-bin/mag-reset.asp", "");
	if(vPageMap[5][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Log File", "/cgi-bin/mag-syslogmanage.asp", "");
	if(vPageMap[5][4] == '1' && parentIsUpgradePageShow == "Yes")
		MenuArray[iCount++] = new MenuNodeConstruction(2, "FW Upgrade", "/cgi-bin/upgrade.asp", "");
}

//Diag->6
if(vPageMap[6][0] == '1')
{
	if(vPageMap[6][0] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Diagnosis", "/cgi-bin/diag-quickdiagnose.asp", "");
	if(vPageMap[6][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(2, "Network Diagnosis", "/cgi-bin/diag-quickdiagnose.asp", "");
}
//Help->7
//if(vPageMap[7][0] == '1')
	//MenuArray[iCount++] = new MenuNodeConstruction(1, "help", "/cgi-bin/help.asp", "");
//if(vPageMap[7][1] == '1')
	//MenuArray[iCount++] = new MenuNodeConstruction(2, "using help", "/cgi-bin/help.asp", "");

MenuArray[iCount++] = new MenuNodeConstruction(0, "", "", "");

function MenuNodeConstruction(Level, Text, Link, Target)
{
    this.Level = Level;
    this.Text = Text;
    this.Link = Link;
    this.Target = Target;
}

function MakeMenu(Selected_Menu)
{

	var Menu = Selected_Menu.split("->");
	MakeMenu_L2(Menu[1], MakeMenu_L1(Menu[0]));
}

function MakeMenu_L1(Menu_Text)
{
	var Menu_L2_Start;
	var Code = '<table border="0" cellpadding="0" cellspacing="0" height="43px" width=851>';//width=1008-157
	
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
				Code += '<td height="15px" style="background-image:url(/img/back_button.jpg);background-repeat:repeat-x;"></td>';
			}
			else
			{
				Menu_L2_Start = iCount + 1;
				Code += '<td height="15px" style="background-image:url(/img/selected_button.jpg);background-repeat:repeat-x;"></td>';
			}
		}
	}
	Code += '</tr><tr>';
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
				Code += '<td bgcolor="#EF8218" height="30px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L1_Link"><p align="center">' + MenuArray[iCount].Text + '</p></a></td>';
			}
			else
			{
				Code += '<td bgcolor="#427594" height="30px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L1_Active"><p align="center">' + MenuArray[iCount].Text + '</p></a></td>';
			}
		}
	}
	Code += '</tr></table>';
	getElement('MenuArea_L1').innerHTML = Code;
	return Menu_L2_Start;
}

function LoadPage(strIndex)
{
	var index = parseInt(strIndex);
	location = MenuArray[index].Link;
}

function MakeMenu_L2(Menu_Text, Start)
{
	var Code = '<table border="0" cellpadding="0" cellspacing="0" height="15px"><tr><td width="10px"><td width="7px" class="Menu_L2_Link"><p>|</p></td>';
	for (var iCount = Start; (MenuArray[iCount].Level != 0) && (MenuArray[iCount].Level != 1); iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 2)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{				
				Code += '<td height="30px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L2_Link"><p> ' + MenuArray[iCount].Text + ' </p></a></td>';
			}
			else
			{
				Code += '<td height="30px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L2_Active"><p> ' + MenuArray[iCount].Text + ' </p></a></td>';
			}
			Code += '<td width="7px" class="Menu_L2_Link"><p>|</p></td>';
		}
	}
	Code += '</tr></table>';
	getElement('MenuArea_L2').innerHTML = Code;
}
 
function DisplayLocation(Selected_Menu)
{
	var Menu = Selected_Menu.split("->");
	getElement('LocationDisplay').innerHTML = Menu[0];
}

___PWD_END___:/boaroot/cgi-bin
