
instance DIA_LEMARGUARD_EXIT(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 999;
	condition = dia_lemarguard_exit_condition;
	information = dia_lemarguard_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lemarguard_exit_condition()
{
	return TRUE;
};

func void dia_lemarguard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEMARGUARD_PICKPOCKET(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 900;
	condition = dia_lemarguard_pickpocket_condition;
	information = dia_lemarguard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_lemarguard_pickpocket_condition()
{
	return C_Beklauen(93,320);
};

func void dia_lemarguard_pickpocket_info()
{
	Info_ClearChoices(dia_lemarguard_pickpocket);
	Info_AddChoice(dia_lemarguard_pickpocket,Dialog_Back,dia_lemarguard_pickpocket_back);
	Info_AddChoice(dia_lemarguard_pickpocket,DIALOG_PICKPOCKET,dia_lemarguard_pickpocket_doit);
};

func void dia_lemarguard_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_lemarguard_pickpocket);
};

func void dia_lemarguard_pickpocket_back()
{
	Info_ClearChoices(dia_lemarguard_pickpocket);
};


instance DIA_LEMARGUARD_HALLO(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 1;
	condition = dia_lemarguard_hallo_condition;
	information = dia_lemarguard_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lemarguard_hallo_condition()
{
	return TRUE;
};

func void dia_lemarguard_hallo_info()
{
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_00");	//Эй, что ты тут все вертишься? Какого тебе тут нужно?!
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_01");	//Хотя постой...(внимательно вглядывается) Я, кажется, тебя знаю!
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_02");	//Ну, точно! Ты тот парень, что постоянно мелькал в Старом лагере и всех беспокоил.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_03");	//Хе-хе! Думаю, и ты меня наверняка должен помнить.
	Info_ClearChoices(dia_lemarguard_hallo);
	Info_AddChoice(dia_lemarguard_hallo,"Сожалею, я не знаю тебя.",dia_lemarguard_hallo_no);
	Info_AddChoice(dia_lemarguard_hallo,"Как я мог забыть твое лицо!",dia_lemarguard_hallo_yes);
};

func void dia_lemarguard_hallo_no()
{
	AI_Output(other,self,"DIA_LemarGuard_Hallo_No_01_00");	//Нет, я не знаю тебя.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_No_01_01");	//Хммм...(удивленно) Странно! У меня хорошая память, да и тебя ни с кем спутаешь.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_No_01_03");	//Ладно, неважно! Просто хочу дать тебе совет - держись от Лемара подальше. Он не любит, когда к нему пристают по пустякам.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_No_01_04");	//Усек? Только попробуй доставить ему проблем - и тогда уже я поговорю с тобой по душам! Хе-хе...
	AI_Output(other,self,"DIA_LemarGuard_Hallo_No_01_05");	//Хорошо.
	AI_StopProcessInfos(self);
};

func void dia_lemarguard_hallo_yes()
{
	self.name[0] = "Шрам, телохранитель Лемара";
	SCARKNOWS = TRUE;
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_00");	//Как я мог забыть твое лицо! Шрам!
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_01");	//Хе-хе... Вижу, и ты узнал меня.
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_02");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_03");	//Лемар нанял меня в телохранители.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_04");	//Хочу дать тебе совет - держись от него подальше. Он не любит, когда к нему пристают по пустякам.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_05");	//Усек? Только попробуй доставить ему проблем - и тогда уже я поговорю с тобой по душам! Хе-хе. Понял?
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_06");	//Хорошо.
	AI_StopProcessInfos(self);
};


instance DIA_LEMARGUARD_HALLOEN(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 1;
	condition = dia_lemarguard_halloen_condition;
	information = dia_lemarguard_halloen_info;
	permanent = TRUE;
	description = "Ну как тебе работенка?";
};

func int dia_lemarguard_halloen_condition()
{
	return TRUE;
};

func void dia_lemarguard_halloen_info()
{
	AI_Output(other,self,"DIA_LemarGuard_HalloEN_01_00");	//Ну и как тебе работенка?
	AI_Output(self,other,"DIA_LemarGuard_HalloEN_01_01");	//Проваливай, пока цел! Хе-хе...
	AI_StopProcessInfos(self);
};