

class CfgVehiclePlateSettings
{
	enable = true;
	cost = 1000;
	onlyDonators = false;
	uidDonators[] = {""};
};

class CfgExileCustomCode
{
	ExileServer_object_vehicle_database_load = "\Atlas_changePlate\overwrites\ExileServer_object_vehicle_database_load.sqf";
};

class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			class vehPlate: ExileAbstractAction
			{
				title = "Change plate";
				condition = "true";
				action = "_this call AtlasClient_gui_plates_loadDialog";
			};
		};
	};
};