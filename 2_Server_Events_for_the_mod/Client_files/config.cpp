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
                title = "text here!!!!!!!!!!!!!!!";
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
                title = "text here!!!!!!!!!!!!!!!";
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
                title = "text here!!!!!!!!!!!!!!!";
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
                title = "text here!!!!!!!!!!!!!!!";
                condition = "('DDR_Item_Pickaxe' in (magazines player) && !ExilePlayerInSafezone)";
                action = "_this call DDR_fnc_Crystal_Mining";
            };
        };
    };
};