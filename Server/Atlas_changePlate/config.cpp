class CfgPatches 
{
    class Atlas_changePlate 
	{
        requiredVersion = 0.1;
        requiredAddons[]={};
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions 
{
    class Atlas_changePlateServer 
	{
        class main 
		{
            file="Atlas_changePlate\bootstrap";
            class postInit {postInit = 1;};
            class preInit {preInit = 1;};
        };
    };
};
