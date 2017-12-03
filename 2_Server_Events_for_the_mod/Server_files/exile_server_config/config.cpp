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