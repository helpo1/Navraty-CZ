
instance DIA_SEK_8048_FORTUNO_EXIT(C_Info)
{
	npc = sek_8048_fortuno;
	nr = 999;
	condition = dia_sek_8048_fortuno_exit_condition;
	information = dia_sek_8048_fortuno_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_sek_8048_fortuno_exit_condition()
{
	return TRUE;
};

func void dia_sek_8048_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEK_8048_FORTUNO_PICKPOCKET(C_Info)
{
	npc = sek_8048_fortuno;
	nr = 900;
	condition = dia_sek_8048_fortuno_pickpocket_condition;
	information = dia_sek_8048_fortuno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_sek_8048_fortuno_pickpocket_condition()
{
	return C_Beklauen(10,25);
};

func void dia_sek_8048_fortuno_pickpocket_info()
{
	Info_ClearChoices(dia_sek_8048_fortuno_pickpocket);
	Info_AddChoice(dia_sek_8048_fortuno_pickpocket,Dialog_Back,dia_sek_8048_fortuno_pickpocket_back);
	Info_AddChoice(dia_sek_8048_fortuno_pickpocket,DIALOG_PICKPOCKET,dia_sek_8048_fortuno_pickpocket_doit);
};

func void dia_sek_8048_fortuno_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_sek_8048_fortuno_pickpocket);
};

func void dia_sek_8048_fortuno_pickpocket_back()
{
	Info_ClearChoices(dia_sek_8048_fortuno_pickpocket);
};


instance DIA_SEK_8048_FORTUNO_HI(C_Info)
{
	npc = sek_8048_fortuno;
	nr = 2;
	condition = dia_sek_8048_fortuno_hi_condition;
	information = dia_sek_8048_fortuno_hi_info;
	permanent = FALSE;
	description = "Ну и как тебе здесь?";
};


func int dia_sek_8048_fortuno_hi_condition()
{
	if((FORTUNOBACK == TRUE) && ((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_sek_8048_fortuno_hi_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_SEK_8048_Fortuno_Hi_13_00");	//Ну и как тебе здесь?
	AI_Output(self,other,"DIA_SEK_8048_Fortuno_Hi_13_01");	//Намного лучше, чем там - в лагере Ворона!
	AI_Output(self,other,"DIA_SEK_8048_Fortuno_Hi_13_02");	//Я даже и мечтать не мог о таком месте.
	AI_Output(self,other,"DIA_SEK_8048_Fortuno_Hi_13_03");	//Но благодаря тебе... Эх, теперь я твой вечный должник!
};


instance DIA_FORTUNO_SEKTEHEILEN(C_Info)
{
	npc = sek_8048_fortuno;
	nr = 1;
	condition = dia_fortuno_sekteheilen_condition;
	information = dia_fortuno_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int dia_fortuno_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_fortuno_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Fortuno_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Fortuno_SekteHeilen_01_01");	//М-моя голова п-прошла!
	AI_Output(self,other,"DIA_Fortuno_SekteHeilen_01_02");	//О, как я тебе б-благодарен!
};

