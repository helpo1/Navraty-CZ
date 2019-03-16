
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
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_00");	//SMRRRRRRTTTTEEEEEEEEELLLLLLNNNNNÍÍÍÍÍÍÍÍÍÍÍKKKK!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_01");	//Jak si dovoluješ mě rušit červe?!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_02");	//Buď PROKLET!
	AI_Output(other,self,"DIA_Skeleton_Lord_Kadar_Hello_01_03");	//Proklej SEBE!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_04");	//TVŮJ PSÍ KSICHT TED NAPOSLEDY VIDÍ SVĚT!
	AI_Output(other,self,"DIA_Skeleton_Lord_Kadar_Hello_01_05");	//Tahle myšlenka se mi moc nelibí!
	AI_Output(self,other,"DIA_Skeleton_Lord_Kadar_Hello_01_06");	//Připrav se na smrt!
	Info_ClearChoices(dia_skeleton_lord_kadar_hello);
	Info_AddChoice(dia_skeleton_lord_kadar_hello,"... (KONEC)",dia_skeleton_lord_kadar_hello_ex1);
};

func void dia_skeleton_lord_kadar_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = ZS_MM_AllScheduler;
};

