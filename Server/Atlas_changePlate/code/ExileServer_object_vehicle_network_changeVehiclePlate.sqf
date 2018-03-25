/**
 * File: ExileServer_object_vehicle_network_changeVehiclePlate
 * Project: Exile Point
 * Discord: FairyTale#5571
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
 */

params ["_sessionID","_params"];
_params params ["_netIDVeh","_plateText"];
_vehicle = objectFromNetId _netIDVeh;
 
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if !(getNumber(missionConfigFile >> "CfgVehiclePlateSettings" >> "enable") isEqualTo 1) throw "Disabled";
	if (isNull _vehicle) throw "Nuuul";
	if (count _textPlate > 15) throw "Maximum 15 characters!";
	_forbiddenCharacter = [_textPlate, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) throw "You used wrong haracters...";
	if (getNumber(missionConfigFile >> "CfgVehiclePlateSettings" >> "onlyDonators") isEqualTo 1) then {	if !(getPlayerUID player in getArray(missionConfigFile >> "CfgVehiclePlateSettings" >> "uidDonators")) throw "That only for donators!"; };
	_playerMoney = _playerObject getVariable ["ExileMoney",0];
	_sales = getNumber(missionConfigFile >> "CfgVehiclePlateSettings" >> "cost");
	if(_playerMoney < _sales) throw "Not enough money";
	
	_playerMoney = _playerMoney - _sales;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format ["Plate = %1",_plateText] call ExileServer_util_log;
	
	_vehicle setPlateNumber _plateText;
	_plateText remoteExec ["setPlateNumber",_vehicle];
	format ["updateVehiclePlate:%1:%2",_vehicle getVariable ["ExileDatabaseID",-1],_plateText] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Success!","New vehicle plate updated on your vehicle!"]]] call ExileServer_system_network_send_to;
	[_sessionID,"setPlateNumber",[netId _vehicle,_plateText]] call ExileServer_system_network_send_to;
}catch{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};