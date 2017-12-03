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
 
_config = configFile >> "CfgSettings" >> "Events" >> "Drugs";
_markerTime = getNumber (_config >> "markerTime");
_anchor = [worldSize/2, worldSize/2, 0];
_position = [_anchor, 1, _anchor select 0, 3, 0, 20, 0] call BIS_fnc_findSafePos;

if (_position isEqualTo []) exitWith {

	"Can not find possition for drugs event." call ExileServer_util_log;
};

if (random 1 < 0.50) then {
 
    ["toastRequest", ["InfoTitleAndText", ["Weed Farm", "Some weed plants managed to grow in the battlefield. <br/>Go harvest them! <br/>Don't forget to bring a knife! <br/>Check the marker on your map for the location!"]]] call ExileServer_system_network_send_broadcast;
 
    // Create marker
    _marker = createMarker [ format["CannabisPlantation%1", diag_tickTime], _position];
    _marker setMarkerType "ExileHempIcon";
	private _offset = [
	
		[(_position select 0)+2,(_position select 1)+2],
		[(_position select 0)-2,(_position select 1)+2],
		[(_position select 0)+2,(_position select 1)-2],
		[(_position select 0)-2,(_position select 1)-2]
	];
	{
	
		0 = createVehicle ["DDR_Weed_Plant",[_x select 0,_x select 1,0], [], 0, "NONE"];

	}	foreach _offset;
	

} else {
 
    ["toastRequest", ["InfoTitleAndText", ["Magic Mushrooms", "Magic mushrooms no way. <br/>Go harvest them! <br/>Don't forget to bring a knife! <br/>Check the marker on your map for the location!"]]] call ExileServer_system_network_send_broadcast;
 
    // Create marker
    _marker = createMarker [ format["MagicMushrooms%1", diag_tickTime], _position];
    _marker setMarkerType "ExileMagicMushroomsIcon";
	private _offset =[ 
	
		[(_position select 0)+2,(_position select 1)+2],
		[(_position select 0)-2,(_position select 1)+2],
		[(_position select 0)+2,(_position select 1)-2],
		[(_position select 0)-2,(_position select 1)-2]
	];
	
	{
	
		0 = createVehicle ["DDR_Mushrooms",[_x select 0,_x select 1,0], [], 0, "NONE"];

	}	foreach _offset;

};

[_marker, _markerTime] spawn {
	
		params ["_mkr","_mkrt"];
		sleep (60 * _mkrt);
		deleteMarker _mkr;
};