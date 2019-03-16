
instance DIA_PAL_204_TORWACHE_EXIT(C_Info)
{
	npc = Pal_204_Torwache;
	nr = 999;
	condition = DIA_PAL_204_TORWACHE_EXIT_Condition;
	information = DIA_PAL_204_TORWACHE_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_204_TORWACHE_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_204_TORWACHE_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_PAL_204_TORWACHE_TOARMSCITYGATE(C_Info)
{
	npc = Pal_204_Torwache;
	nr = 1;
	condition = dia_pal_204_torwache_toarmscitygate_condition;
	information = dia_pal_204_torwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_204_torwache_toarmscitygate_condition()
{
	if((TOARMSCITYHALL == TRUE) && (CITYHALLACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_204_torwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSCITYHALL = FALSE;
};


instance DIA_Mil_359_Miliz_EXIT(C_Info)
{
	npc = Mil_359_Miliz;
	nr = 999;
	condition = DIA_Mil_359_Miliz_EXIT_Condition;
	information = DIA_Mil_359_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_359_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_359_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_359_Miliz_TOARMSCITYGATE(C_Info)
{
	npc = Mil_359_Miliz;
	nr = 1;
	condition = DIA_Mil_359_Miliz_TOARMSCITYGATE_condition;
	information = DIA_Mil_359_Miliz_TOARMSCITYGATE_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_359_Miliz_TOARMSCITYGATE_condition()
{
	if((TOARMSKASERN == TRUE) && (hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW))
	{
		return TRUE;
	};
};

func void DIA_Mil_359_Miliz_TOARMSCITYGATE_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSKASERN = FALSE;
};