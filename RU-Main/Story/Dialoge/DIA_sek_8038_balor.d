
instance DIA_BALOR_EXIT(C_Info)
{
	npc = sek_8038_balor;
	nr = 999;
	condition = dia_balor_exit_condition;
	information = dia_balor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_balor_exit_condition()
{
	return TRUE;
};

func void dia_balor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_balor_PICKPOCKET(C_Info)
{
	npc = sek_8038_balor;
	nr = 900;
	condition = dia_balor_PICKPOCKET_Condition;
	information = dia_balor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_balor_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_balor_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_balor_PICKPOCKET);
	Info_AddChoice(dia_balor_PICKPOCKET,Dialog_Back,dia_balor_PICKPOCKET_BACK);
	Info_AddChoice(dia_balor_PICKPOCKET,DIALOG_PICKPOCKET,dia_balor_PICKPOCKET_DoIt);
};

func void dia_balor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_balor_PICKPOCKET);
};

func void dia_balor_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_balor_PICKPOCKET);
};

instance DIA_BALOR_HALLO(C_Info)
{
	npc = sek_8038_balor;
	nr = 1;
	condition = dia_balor_hallo_condition;
	information = dia_balor_hallo_info;
	permanent = FALSE;
	description = "Привет! Я здесь новенький.";
};


func int dia_balor_hallo_condition()
{
	return TRUE;
};

func void dia_balor_hallo_info()
{
	AI_Output(other,self,"DIA_Balor_Hallo_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_Balor_Hallo_13_01");	//Я... я... я Балор, ученик Идола Тиона. Ты ведь слышал о нем, да?
	Info_ClearChoices(dia_balor_hallo);
	Info_AddChoice(dia_balor_hallo,"Нет.",dia_balor_hallo_nein);
	Info_AddChoice(dia_balor_hallo,"Да.",dia_balor_hallo_ja);
};

func void dia_balor_hallo_ja()
{
	AI_Output(other,self,"DIA_Balor_Hallo_Ja_15_00");	//А-га.
	AI_Output(self,other,"DIA_Balor_Hallo_Ja_13_01");	//Тогда ты знаешь, что он второй человек в этом Лагере... п-после Идола Орана.
	Info_ClearChoices(dia_balor_hallo);
};

func void dia_balor_hallo_nein()
{
	AI_Output(other,self,"DIA_Balor_Hallo_Nein_15_00");	//Нет.
	AI_Output(self,other,"DIA_Balor_Hallo_Nein_13_01");	//Нет?! Ты здесь недавно, не так ли?
	AI_Output(self,other,"DIA_Balor_Hallo_Nein_13_02");	//Идол Тион в этом Лагере - второй человек после Идола Орана.
	AI_Output(self,other,"DIA_Balor_Hallo_Nein_13_03");	//Его голос многое решает, особенно в вопросах - кого принимать к нам, а кого нет.
	Info_ClearChoices(dia_balor_hallo);
};


instance DIA_BALOR_JOB(C_Info)
{
	npc = sek_8038_balor;
	nr = 2;
	condition = dia_balor_job_condition;
	information = dia_balor_job_info;
	permanent = FALSE;
	description = "А ты чем занимаешься?";
};


func int dia_balor_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_hallo))
	{
		return TRUE;
	};
};

func void dia_balor_job_info()
{
	AI_Output(other,self,"DIA_Balor_Job_15_00");	//А чем ты занимаешься?
	AI_Output(self,other,"DIA_Balor_Job_13_01");	//Я... я... я помогаю ему готовить снадобья.
	AI_Output(self,other,"DIA_Balor_Job_13_02");	//В основном б-болотник.
};


instance DIA_BALOR_ADDINFOKALOM(C_Info)
{
	npc = sek_8038_balor;
	nr = 2;
	condition = dia_balor_addinfokalom_condition;
	information = dia_balor_addinfokalom_info;
	permanent = TRUE;
	description = "Что еще ты можешь рассказать о своем господине?";
};


func int dia_balor_addinfokalom_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_job))
	{
		return TRUE;
	};
};

func void dia_balor_addinfokalom_info()
{
	AI_Output(other,self,"DIA_Balor_AddInfoKalom_15_00");	//Что еще ты можешь рассказать о своем господине?
	AI_Output(self,other,"DIA_Balor_AddInfoKalom_13_01");	//Он... он не такой, как... как все Гуру. НИКОМУ не позволено попусту тратить его драгоценное время.
};


instance DIA_BALOR_SEKTEHEILEN(C_Info)
{
	npc = sek_8038_balor;
	nr = 1;
	condition = dia_balor_sekteheilen_condition;
	information = dia_balor_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int dia_balor_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_balor_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Balor_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Balor_SekteHeilen_01_01");	//М-моя голова п-прошла!
	AI_Output(self,other,"DIA_Balor_SekteHeilen_01_02");	//О, как я тебе б-благодарен!
};

