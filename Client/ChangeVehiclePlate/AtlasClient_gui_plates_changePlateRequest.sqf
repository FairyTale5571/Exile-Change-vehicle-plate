/**
 * File: AtlasClient_gui_plates_changePlateRequest
 * Project: Exile Point
 * Discord: FairyTale#5571
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
 */

disableSerialization;
private _display = uiNamespace getVariable ["RscVehiclePlateDialog",displayNull];
private _textCtrl = _display displayCtrl 8048;
private _textPlate = ctrlText _textCtrl;
private _alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");

try
{
	if !(getNumber(missionConfigFile >> "CfgVehiclePlateSettings" >> "enable") isEqualTo 1) throw "Disabled";
	if (isNull ExileClientInteractionObject) throw "Nuuul";
	if !(local ExileClientInteractionObject) throw "Need to be a seat to driver";
	if (_textPlate isEqualTo "") throw "Empty?";
	if (count _textPlate > 15) throw "Maximum 15 characters!";
	_forbiddenCharacter = [_textPlate, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) throw "You used wrong characters...";
	if (getNumber(missionConfigFile >> "CfgVehiclePlateSettings" >> "onlyDonators") isEqualTo 1) then {	if !(getPlayerUID player in getArray(missionConfigFile >> "CfgVehiclePlateSettings" >> "uidDonators")) throw "That only for donators!"; };
	
	["changeVehiclePlate",[netId ExileClientInteractionObject, _textPlate]] call ExileClient_system_network_send;
	
}catch{
	["ErrorTitleAndText", ["Vehicle Plate", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};