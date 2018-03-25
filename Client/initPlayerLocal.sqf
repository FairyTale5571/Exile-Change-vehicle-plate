
{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
}
forEach
[
	['ExileClient_object_vehicle_network_setPlateNumber', 'ChangeVehiclePlate\ExileClient_object_vehicle_network_setPlateNumber.sqf'],
	['AtlasClient_gui_changePlateRequest', 'ChangeVehiclePlate\AtlasClient_gui_changePlateRequest.sqf'],
	['AtlasClient_gui_loadDialog', 'ChangeVehiclePlate\AtlasClient_gui_loadDialog.sqf']
];