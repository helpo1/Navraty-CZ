
instance INFO_TPL_8_EXIT(C_Info)
{
	nr = 999;
	condition = info_tpl_8_exit_condition;
	information = info_tpl_8_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_tpl_8_exit_condition()
{
	return TRUE;
};

func void info_tpl_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_8_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_tpl_8_einervoneuchwerden_condition;
	information = info_tpl_8_einervoneuchwerden_info;
	permanent = 1;
	description = "Нужны ли вам верные люди?";
};


func int info_tpl_8_einervoneuchwerden_condition()
{
	if((other.guild != GIL_TPL) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//Нужны ли вам верные люди?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Верные люди нужны всегда. Но тебе придется серьезно поработать над собой. Только лучшие из лучших могут стать Стражами.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//Это высочайшая честь для любого последователя Братства Спящего.
};


instance INFO_TPL_8_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_tpl_8_wichtigepersonen_condition;
	information = info_tpl_8_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_tpl_8_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_tpl_8_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Мы подчиняемся Гуру. Служить им - наш почетный долг.
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//Кто они, эти Гуру?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Главный Гуру - Идол Оран. Ему помогают остальные Гуру и Гор На Кош - старший из Стражей.
};


instance INFO_TPL_8_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_tpl_8_daslager_condition;
	information = info_tpl_8_daslager_info;
	permanent = 1;
	description = "Расскажи мне об этом Лагере.";
};


func int info_tpl_8_daslager_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_8_daslager_info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Расскажи мне об этом Лагере.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Ты новичок и можешь ходить где тебе вздумается. Драки и все прочее тут запрещены.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//Постарайся не нарушать эти правила. И не беспокой наших наставников во время медитации.
};


instance INFO_TPL_8_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_8_dielage_condition;
	information = info_tpl_8_dielage_info;
	permanent = 1;
	description = "Как идут дела?";
};


func int info_tpl_8_dielage_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return 1;
	};
};

func void info_tpl_8_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Предупреждаю тебя: я не потерплю неуважения. Ты разговариваешь с одним из избранных стражей пророков.
};

func void b_assignambientinfos_tpl_8(var C_Npc slf)
{
	info_tpl_8_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_dielage.npc = Hlp_GetInstanceID(slf);
};

