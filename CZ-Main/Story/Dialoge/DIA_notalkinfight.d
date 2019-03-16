
instance DIA_NOTALKINFIGHT(C_Info)
{
	nr = 1;
	condition = dia_notalkinfight_condition;
	information = dia_notalkinfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_notalkinfight_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_notalkinfight_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

func void b_assignnotalk(var C_Npc slf)
{
	dia_notalkinfight.npc = Hlp_GetInstanceID(slf);
};

