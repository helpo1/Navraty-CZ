
var int SC_IsObsessed;
var int SC_ObsessionCounter;

func void B_ClearSCObsession(var C_Npc heiler)
{
	if(Hlp_GetInstanceID(heiler) != Hlp_GetInstanceID(hero))
	{
		AI_StopProcessInfos(heiler);
	};
	SC_IsObsessed = FALSE;
	SC_ObsessionCounter = 0;
	AI_Print(PRINT_ClearSCObsession);
};

func void B_SCIsObsessed(var C_Npc dementor)
{
	if(Hlp_GetInstanceID(dementor) != Hlp_GetInstanceID(hero))
	{
		AI_StopProcessInfos(dementor);
	};
	if(Npc_HasItems(hero,ItAm_Prot_BlackEye_Mis) == FALSE)
	{
		if(SC_ObsessionCounter >= 2)
		{
			SC_IsObsessed = TRUE;
			AI_Print(PRINT_SCIsObsessed);
		};
		SC_ObsessionCounter = SC_ObsessionCounter + 1;
	};
};

