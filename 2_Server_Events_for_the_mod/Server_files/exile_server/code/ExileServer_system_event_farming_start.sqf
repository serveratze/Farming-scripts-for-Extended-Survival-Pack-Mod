/**
 * ExileServer_system_event_supplyBox_start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * modify by Serveratze
 * 
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 private ["_marker","_markerTime", "_config", "_position", "_anchor"];
 
_config = configFile >> "CfgSettings" >> "Events" >> "Farming";
_markerTime = getNumber (_config >> "markerTime");
_anchor = [worldSize/2, worldSize/2, 0];
_position = [_anchor, 1, _anchor select 0, 3, 0, 20, 0] call BIS_fnc_findSafePos;

if (_position isEqualTo []) exitWith {

	"Can not find possition for farming event." call ExileServer_util_log;
};

if (random 1 < 0.50) then {
 
    ["toastRequest", ["InfoTitleAndText", ["Mining", "Old mine spotted! <br/>Don't forget to bring a Pickaxe! <br/>Check the marker on your map for the location!"]]] call ExileServer_system_network_send_broadcast;
 
    // Create marker
    _marker = createMarker [ format["OreRock%1", diag_tickTime], _position];
    _marker setMarkerType "ExileRocksIcon";
    _rock1 = createVehicle ["DDR_Ore_Rock",_position, [], 0, "NONE"];

} else {
 
    ["toastRequest", ["InfoTitleAndText", ["Mining", "Old mine spotted! <br/>Don't forget to bring a Pickaxe! <br/>Check the marker on your map for the location!"]]] call ExileServer_system_network_send_broadcast;
 
    // Create marker
    _marker = createMarker [ format["CrystalRock%1", diag_tickTime], _position];
    _marker setMarkerType "ExileRocksIcon";
    _rock2 = createVehicle ["DDR_Crystal_Rock",_position, [], 0, "NONE"];

};

[_marker, _markerTime] spawn {
	
		params ["_mkr","_mkrt"];
		sleep (60 * _mkrt);
		deleteMarker _mkr;
};