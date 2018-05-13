# Farming-scripts-for-Extended-Survival-Pack-Mod
Weed Farm, Magic Mushrooms Farm, Mining ore and crystal install

/////////////////////////////// ////////// Exile mod 1.0.4 'Pineapple' Compatible ////////// ///////////////////////////////

Client files!!!!!!!

Step 1

Copy the folder custom to you Exile.YourMap Folder

Step 2

Add that in your initPlayerLocal.sqf at the end

DDR_fnc_Mushrooms = compileFinal preprocessFileLineNumbers "custom\drugs\mushrooms.sqf";
DDR_fnc_Weed = compileFinal preprocessFileLineNumbers "custom\drugs\weed.sqf";
DDR_fnc_Ore_Mining = compileFinal preprocessFileLineNumbers "custom\mining\ore_mining.sqf";
DDR_fnc_Crystal_Mining = compileFinal preprocessFileLineNumbers "custom\mining\crystal_mining.sqf";

Step 3

Add that in your config.cpp in the class CfgInteractionMenus

class CfgInteractionMenus
{
    class Weed
    {
        targetType = 2;
        target = "DDR_Weed_Plant";

        class Actions 
        {
            class HarvestWeed: ExileAbstractAction
            {
                title = "Harvest the Weed";
                condition = "('Exile_Item_Knife' in (magazines player) && !ExilePlayerInSafezone)";
                action = "_this call DDR_fnc_Weed";
            };
        };
    };
    class Mushrooms
    {
        targetType = 2;
        target = "DDR_Mushrooms";

        class Actions 
        {
            class HarvestMushrooms: ExileAbstractAction
            {
                title = "Harvest the Mushrooms";
                condition = "('Exile_Item_Knife' in (magazines player) && !ExilePlayerInSafezone)";
                action = "_this call DDR_fnc_Mushrooms";
            };
        };
    };
    class Ore_Mining
    {
        targetType = 2;
        target = "DDR_Ore_Rock";

        class Actions 
        {
            class materials1: ExileAbstractAction
            {
                title = "Reduce raw materials";
                condition = "('DDR_Item_Pickaxe' in (magazines player) && !ExilePlayerInSafezone)";
                action = "_this call DDR_fnc_Ore_Mining";
            };
        };
    };
    class Crystal_Mining
    {
        targetType = 2;
        target = "DDR_Crystal_Rock";

        class Actions 
        {
            class materials2: ExileAbstractAction
            {
                title = "Reduce raw materials";
                condition = "('DDR_Item_Pickaxe' in (magazines player) && !ExilePlayerInSafezone)";
                action = "_this call DDR_fnc_Crystal_Mining";
            };
        };
    };
};

Server files!!!!!!!

Step 4

Copy the files in your exile_server\code

ExileServer_system_event_drugs_start.sqf
ExileServer_system_event_farming_start.sqf

Step 5

Add that code in your exile_server\bootstrap folder in the fn_preInit.sqf 

['ExileServer_system_event_drugs_start', 'exile_server\code\ExileServer_system_event_drugs_start.sqf', false],
['ExileServer_system_event_farming_start', 'exile_server\code\ExileServer_system_event_farming_start.sqf', false]

Step 6

open your exile_server_config.pbo and add that in your config.cpp in the class Events

	class Events 
	{
		/*
			A list of events that are active
		*/
		enabledEvents[] = {"Drugs","Farming"}; 

		
		class Drugs
		{
			type = "spawn";
			function = "ExileServer_system_event_drugs_start";
			minTime = 80; // minutes
			maxTime = 160; // minutes
			minimumPlayersOnline = 4;
			markerTime = 10; // minutes
		};
		
		class Farming
		{
			type = "spawn";
			function = "ExileServer_system_event_farming_start";
			minTime = 60; // minutes
			maxTime = 120; // minutes
			minimumPlayersOnline = 2;
			markerTime = 10; // minutes
		};
};

