/**
 * File: AtlasClient_gui_plates_loadDialog
 * Project: Exile Point
 * Discord: FairyTale#5571
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
 */
 
disableSerialization;
createDialog "RscVehiclePlateDialog";
private _display = uiNamespace getVariable ["RscVehiclePlateDialog",displayNull];
private _costCtrl = _display displayCtrl 8045;
private _cost = getNumber(missionConfigFile >> "CfgVehiclePlateSettings" >> "cost");
_costCtrl ctrlSetStructuredText parseText (format ["<t size='1.4'>%1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>", _cost]);

if ((player getVariable ["ExileMoney", 0]) > _cost) then
{
	_purchaseButton = _display displayCtrl 8047;
	_purchaseButton ctrlEnable true;
};