/**
 * File: ExileClient_object_vehicle_network_setPlateNumber
 * Project: Exile Point
 * Discord: FairyTale#5571
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
 */
 
params ["_netID","_plate"];
_vehicle = objectFromNetId _netID;
_vehicle setPlateNumber _plate;