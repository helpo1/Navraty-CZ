
instance DIA_DUSTY_EXIT(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 999;
	condition = dia_dusty_exit_condition;
	information = dia_dusty_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dusty_exit_condition()
{
	return TRUE;
};

func void dia_dusty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_PICKPOCKET(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 900;
	condition = dia_dusty_pickpocket_condition;
	information = dia_dusty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_dusty_pickpocket_condition()
{
	return C_Beklauen(25,30);
};

func void dia_dusty_pickpocket_info()
{
	Info_ClearChoices(dia_dusty_pickpocket);
	Info_AddChoice(dia_dusty_pickpocket,Dialog_Back,dia_dusty_pickpocket_back);
	Info_AddChoice(dia_dusty_pickpocket,DIALOG_PICKPOCKET,dia_dusty_pickpocket_doit);
};

func void dia_dusty_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_dusty_pickpocket);
};

func void dia_dusty_pickpocket_back()
{
	Info_ClearChoices(dia_dusty_pickpocket);
};


instance DIA_DUSTY_HALLO(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 2;
	condition = dia_dusty_hallo_condition;
	information = dia_dusty_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dusty_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_dusty_hallo_info()
{
	AI_Output(self,other,"DIA_Dusty_Hallo_01_00");	//Кажется, я тебя знаю.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_01");	//Это ты привел меня в Болотный лагерь. Помнишь?
	AI_Output(other,self,"DIA_Dusty_Hallo_15_00");	//Ммм...
	AI_Output(self,other,"DIA_Dusty_Hallo_01_02");	//Мое имя - Дасти! Я тогда еще был рудокопом в Старом лагере.
	AI_Output(other,self,"DIA_Dusty_Hallo_15_01");	//Кажется, вспоминаю. Надеюсь, ты не в обиде, что я тебя втравил в это дело?
	AI_Output(self,other,"DIA_Dusty_Hallo_01_03");	//Нет. Я сам виноват - влез в дело, ничего о нем не разузнав.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_04");	//Правда, я не особо в их глупости и вникал.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_05");	//Я больше спал, чем слушал. После шахты не до высоких материй, знаешь ли.
	b_heroknowforestbase();
	AI_StopProcessInfos(self);
};

