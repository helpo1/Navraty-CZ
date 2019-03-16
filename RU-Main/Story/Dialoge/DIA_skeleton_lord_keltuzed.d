
instance DIA_SKELETON_LORD_KELTUZED_SOUL_EXIT(C_Info)
{
	npc = skeleton_lord_keltuzed;
	nr = 999;
	condition = dia_skeleton_lord_keltuzed_soul_exit_condition;
	information = dia_skeleton_lord_keltuzed_soul_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_skeleton_lord_keltuzed_soul_exit_condition()
{
	return TRUE;
};

func void dia_skeleton_lord_keltuzed_soul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKELETON_LORD_KELTUZED_SOUL_HALLO(C_Info)
{
	npc = skeleton_lord_keltuzed;
	nr = 1;
	condition = dia_skeleton_lord_keltuzed_soul_hallo_condition;
	information = dia_skeleton_lord_keltuzed_soul_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_skeleton_lord_keltuzed_soul_hallo_condition()
{
	return TRUE;
};

func void dia_skeleton_lord_keltuzed_soul_hallo_info()
{
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_00");	//(мертвым голосом) Кто посмел побеспокоить меня?! Кто меня вызвал?!
	AI_Output(other,self,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_01");	//Это был я.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_02");	//Человек?! А я-то думал, что уничтожил вас всех, жалкие черви!
	AI_Output(other,self,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_03");	//Ты ошибся.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_04");	//Аарггг... А ты дерзок, смертный. Но тебе это все равно не поможет.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_05");	//Поскольку сейчас я убью тебя, и твоя никчемная жизнь оборвется навеки!
	AI_Output(other,self,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_06");	//Попробуй, если сможешь.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_07");	//Ааргггг...
	Info_ClearChoices(dia_skeleton_lord_keltuzed_soul_hallo);
	Info_AddChoice(dia_skeleton_lord_keltuzed_soul_hallo,"(закончить разговор)",dia_skeleton_lord_keltuzed_soul_hallo_ex1);
};

func void dia_skeleton_lord_keltuzed_soul_hallo_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = ZS_MM_AllScheduler;
	skeleton_knight_death_01.aivar[AIV_EnemyOverride] = FALSE;
	skeleton_knight_death_02.aivar[AIV_EnemyOverride] = FALSE;
	skeleton_knight_death_03.aivar[AIV_EnemyOverride] = FALSE;
	skeleton_knight_death_04.aivar[AIV_EnemyOverride] = FALSE;
	Wld_SendTrigger("EVT_DAKKAT_GATE");
};

