
instance DIA_SKELETON_LORD_KADAR_EXIT(C_Info)
{
	npc = skeleton_lord_kadar;
	nr = 999;
	condition = dia_skeleton_lord_kadar_exit_condition;
	information = dia_skeleton_lord_kadar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_skeleton_lord_kadar_exit_condition()
{
	return TRUE;
};

func void dia_skeleton_lord_kadar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKELETON_LORD_KADAR_HELLO(C_Info)
{
	npc = skeleton_lord_kadar;
	nr = 1;
	condition = dia_skeleton_lord_kadar_hello_condition;
	information = dia_skeleton_lord_kadar_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_skeleton_lord_kadar_hello_condition()
{
	return TRUE;
};

func void dia_skeleton_lord_kadar_hello_info()
{
	Wld_SendTrigger("HROMANIN_GATE");
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_00");	//СМЕЕЕЕЕЕЕРТНЫЫЫЙ!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_01");	//КАК ОСМЕЕЕЛИЛСЯ ТЫ ПОТРЕВОЖИТЬ МЕНЯ???!!!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_02");	//БУДЬ ЖЕ ПРОКЛЯТ!
	AI_Output(other,self,"DIA_Skeleton_Lord_Kadar_Hello_01_03");	//Проклинай САМ СЕБЯ!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_04");	//ТВОООЙ ДОООЛГИЙ ПУУУТЬ БУУУДЕТ ОКОООНЧЕН ЗДЕЕЕЕСЬ!!!
	AI_Output(other,self,"DIA_Skeleton_Lord_Kadar_Hello_01_05");	//Признаться, эта идея мне не слишком по душе!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_06");	//ГОТОВЬСЯ УМЕРЕТЬ!
	Info_ClearChoices(dia_skeleton_lord_kadar_hello);
	Info_AddChoice(dia_skeleton_lord_kadar_hello,"(закончить разговор)",dia_skeleton_lord_kadar_hello_ex1);
};

func void dia_skeleton_lord_kadar_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = ZS_MM_AllScheduler;
};

