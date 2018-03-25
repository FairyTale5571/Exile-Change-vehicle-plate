/**
 * File: fn_preInit
 * Project: Exile Point
 * Discord: FairyTale#5571
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
 */

{
	private _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
    if (_x select 2 isEqualTo 1) then { publicVariable (_x select 0); };
	
}
forEach
[
	['ExileServer_object_vehicle_network_changeVehiclePlate','Atlas_changePlate\code\ExileServer_object_vehicle_network_changeVehiclePlate.sqf',0]
];

true