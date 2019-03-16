
instance INFO_TPL_9_EXIT(C_Info)
{
	nr = 999;
	condition = INFO_TPL_9_exit_condition;
	information = INFO_TPL_9_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};

func int INFO_TPL_9_exit_condition()
{
	return TRUE;
};

func void INFO_TPL_9_exit_info()
{
	AI_StopProcessInfos(self);
};

instance INFO_TPL_9_DIELAGE(C_Info)
{
	nr = 1;
	condition = INFO_TPL_9_dielage_condition;
	information = INFO_TPL_9_dielage_info;
	permanent = TRUE;
	important = TRUE;
};

func int INFO_TPL_9_dielage_condition()
{
	if((CountDownAssInvasion == FALSE) && (Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void INFO_TPL_9_dielage_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

instance INFO_TPL_9_HOW(C_Info)
{
	nr = 1;
	condition = INFO_TPL_9_HOW_condition;
	information = INFO_TPL_9_HOW_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};

func int INFO_TPL_9_HOW_condition()
{
	if((CountDownAssInvasion == TRUE) && (AssasinAttackCamp == FALSE))
	{
		return TRUE;
	};
};

func void INFO_TPL_9_HOW_info()
{
	var int question;

	question = Hlp_Random(3);

	AI_Output(other,self,"INFO_TPL_9_HOW_01_00");	//Jaká je situace?

	if(question == 0)
	{
		AI_Output(self,other,"INFO_TPL_9_HOW_01_01");	//Zatím je vše v klidu, příteli.
		AI_StopProcessInfos(self);
	}
	else if(question == 1)
	{
		AI_Output(self,other,"INFO_TPL_9_HOW_01_02");	//Vše je pod kontrolou! Nemohou se dostat do tábora.
		AI_StopProcessInfos(self);
	}
	else if(question == 2)
	{
		AI_Output(self,other,"INFO_TPL_9_HOW_01_03");	//Zatímco jsme tady, je nepravděpodobné, že by tábor napadli.
		AI_StopProcessInfos(self);
	}
	else if(question == 3)
	{
		AI_Output(self,other,"INFO_TPL_9_HOW_01_04");	//Nemusíš se bát, člověče. Máme vše pod kontrolou!
		AI_StopProcessInfos(self);
	};
};


func void b_assignambientinfos_tpl_9(var C_Npc slf)
{
	INFO_TPL_9_exit.npc = Hlp_GetInstanceID(slf);
	INFO_TPL_9_DIELAGE.npc = Hlp_GetInstanceID(slf);
	INFO_TPL_9_HOW.npc = Hlp_GetInstanceID(slf);
};