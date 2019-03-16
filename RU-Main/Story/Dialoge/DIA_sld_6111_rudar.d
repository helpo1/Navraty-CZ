
instance DIA_RUDAR_EXIT(C_Info)
{
	npc = sld_6111_rudar;
	nr = 999;
	condition = dia_rudar_exit_condition;
	information = dia_rudar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_rudar_exit_condition()
{
	return TRUE;
};

func void dia_rudar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUDAR_PICKPOCKET(C_Info)
{
	npc = sld_6111_rudar;
	nr = 900;
	condition = dia_rudar_pickpocket_condition;
	information = dia_rudar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_rudar_pickpocket_condition()
{
	return C_Beklauen(92,320);
};

func void dia_rudar_pickpocket_info()
{
	Info_ClearChoices(dia_rudar_pickpocket);
	Info_AddChoice(dia_rudar_pickpocket,Dialog_Back,dia_rudar_pickpocket_back);
	Info_AddChoice(dia_rudar_pickpocket,DIALOG_PICKPOCKET,dia_rudar_pickpocket_doit);
};

func void dia_rudar_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_rudar_pickpocket);
};

func void dia_rudar_pickpocket_back()
{
	Info_ClearChoices(dia_rudar_pickpocket);
};


instance DIA_RUDAR_HALLO(C_Info)
{
	npc = sld_6111_rudar;
	nr = 2;
	condition = dia_rudar_hallo_condition;
	information = dia_rudar_hallo_info;
	permanent = FALSE;
	description = "Ты здесь один?";
};


func int dia_rudar_hallo_condition()
{
	if((MIS_KILLTARGET5 == LOG_Running) && Wld_IsTime(22,0,8,0))
	{
		return TRUE;
	};
};

func void dia_rudar_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Rudar_Hallo_01_00");	//Ты здесь один?
	AI_Output(self,other,"DIA_Rudar_Hallo_01_01");	//Как видишь, да. Ночью тут редко кто бывает. Ну а что тебя привело сюда?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_02");	//Что же, это хорошо. А привело меня сюда... скажем, одно неулаженное дельце.
	AI_Output(self,other,"DIA_Rudar_Hallo_01_03");	//Да? И что же у тебя за проблема?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_04");	//Моя проблема - это ты!
	AI_Output(self,other,"DIA_Rudar_Hallo_01_05");	//(удивленно) ЧТО?
	AI_Output(self,other,"DIA_Rudar_Hallo_01_06");	//Парень, по-моему, мы с тобой даже не знакомы. Какие между нами могут быть проблемы?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_07");	//Между нами их нет. Но у тебя проблема с другим человеком, а я лишь решаю их за него.
	AI_Output(self,other,"DIA_Rudar_Hallo_01_08");	//И кто же этот человек, чьи проблемы ты решаешь?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_09");	//Асмал! Тебе что-нибудь говорит это имя?
	AI_Output(self,other,"DIA_Rudar_Hallo_01_10");	//Хммм... Теперь ясно. Значит, ты работаешь на него, и раз ты пришел сюда, это может означать только одно.
	AI_Output(other,self,"DIA_Rudar_Hallo_01_11");	//Ты правильно понимаешь суть проблемы.
	AI_Output(self,other,"DIA_Rudar_Hallo_01_12");	//А что же он сам не пришел сюда? Или побоялся, что я надеру ему задницу?!
	AI_Output(other,self,"DIA_Rudar_Hallo_01_13");	//Это ты сможешь спросить у него самого, если, конечно, тебе представится такой случай. В чем я очень сомневаюсь!
	AI_Output(self,other,"DIA_Rudar_Hallo_01_14");	//Что же, ладно, не будем терять времени! Посмотрим, так же ты хорошо владеешь клинком, как и языком.
	AI_Output(other,self,"DIA_Rudar_Hallo_01_15");	//Я тебя не разочарую!
	AI_StopProcessInfos(self);
	AI_Standup(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};


instance DIA_RUDAR_HAI(C_Info)
{
	npc = sld_6111_rudar;
	nr = 2;
	condition = dia_rudar_hai_condition;
	information = dia_rudar_hai_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_rudar_hai_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void dia_rudar_hai_info()
{
	AI_Output(self,other,"DIA_Rudar_Hai_01_00");	//Хей! Не видишь - я занят.
	AI_Output(self,other,"DIA_Rudar_Hai_01_01");	//Поговорим после того, как я закончу работу.
	AI_StopProcessInfos(self);
};

