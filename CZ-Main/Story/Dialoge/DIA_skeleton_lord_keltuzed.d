
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
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_00");	//(mrtvolný řev) KDO JSI, ŽE SI DOVOLUJEŠ RUŠIT MĚ?! KDO MĚ TO PROBUDIL?!
	AI_Output(other,self,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_01");	//Byl jsem to já.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_02");	//Člověk?! (zlověstně) Myslím, že tě zničím, ty ubohý červe!
	AI_Output(other,self,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_03");	//Děláš velký omyl!
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_04");	//Aargggg!... (mrtvolný řev) A ty už jsi ho udělal, ale teď ti nic nepomůže.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_05");	//Rozsekám tě na kousky a zůstaneš zde navždy!
	AI_Output(other,self,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_06");	//Dobrá - zkus to, jestli to dokážeš.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_07");	//Aargggg!... (mrtvolný řev)
	Info_ClearChoices(dia_skeleton_lord_keltuzed_soul_hallo);
	Info_AddChoice(dia_skeleton_lord_keltuzed_soul_hallo,"... (KONEC)",dia_skeleton_lord_keltuzed_soul_hallo_ex1);
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

