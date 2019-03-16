
instance DIA_MIGUEL_NW_EXIT(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 999;
	condition = dia_miguel_nw_exit_condition;
	information = dia_miguel_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_miguel_nw_exit_condition()
{
	return TRUE;
};

func void dia_miguel_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIGUEL_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 900;
	condition = dia_miguel_nw_pickpocket_condition;
	information = dia_miguel_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_miguel_nw_pickpocket_condition()
{
	return C_Beklauen(40,48);
};

func void dia_miguel_nw_pickpocket_info()
{
	Info_ClearChoices(dia_miguel_nw_pickpocket);
	Info_AddChoice(dia_miguel_nw_pickpocket,Dialog_Back,dia_miguel_nw_pickpocket_back);
	Info_AddChoice(dia_miguel_nw_pickpocket,DIALOG_PICKPOCKET,dia_miguel_nw_pickpocket_doit);
};

func void dia_miguel_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_miguel_nw_pickpocket);
};

func void dia_miguel_nw_pickpocket_back()
{
	Info_ClearChoices(dia_miguel_nw_pickpocket);
};


instance DIA_MIGUEL_NW_HI(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 1;
	condition = dia_miguel_nw_hi_condition;
	information = dia_miguel_nw_hi_info;
	permanent = FALSE;
	description = "ЧТО ТЫ ЗДЕСЬ делаешь?";
};


func int dia_miguel_nw_hi_condition()
{
	return TRUE;
};

func void dia_miguel_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Miguel_NW_Hi_01_00");	//Что ТЫ здесь делаешь?
	AI_Output(self,other,"DIA_Miguel_NW_Hi_01_01");	//Хочу спросить тебя о том же. То он - бандит на болоте...

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_02");	//... то почтенный Маг Инноса, перед которым все раскланиваются.
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_03");	//... то паладин Короля, вышагивающий по городу, как по своему дому.
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_04");	//... то наемник.
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_0A");	//... то почтенный Маг Аданоса, перед которым все раскланиваются.
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_0B");	//... то заклинатель демонов!...(с опаской)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_0C");	//... то болотник!
	};
	AI_Output(other,self,"DIA_Miguel_NW_Hi_01_05");	//У меня были кое-какие дела на болотах.
	AI_Output(other,self,"DIA_Miguel_NW_Hi_01_06");	//А вот как тут оказался ты? Как вообще охрана пустила тебя?
	AI_Output(self,other,"DIA_Miguel_NW_Hi_01_07");	//Все просто, парень. Договорился с пиратами и спокойно доплыл до города, прихватив пару тюков с травками, которые собрал на болоте.

	if(KILLHAPPENSMADE == FALSE)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_08");	//Теперь продаю их тут Игнацу и Константино. Они за меня и вступились. Закон - законом, а товар им где-то брать надо.
		AI_Output(other,self,"DIA_Miguel_NW_Hi_01_09");	//Понятно. Так ты только им продаешь свои травки?
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_10");	//Могу и тебе по старой памяти...(смеется)
	};
};

instance DIA_MIGUEL_NW_CITY(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 2;
	condition = dia_miguel_nw_city_condition;
	information = dia_miguel_nw_city_info;
	permanent = TRUE;
	description = "Ну и как тебе город?";
};


func int dia_miguel_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_miguel_nw_hi))
	{
		return TRUE;
	};
};

func void dia_miguel_nw_city_info()
{
	AI_Output(other,self,"DIA_Miguel_NW_City_15_00");	//Ну, и как тебе город? Ты же жил тут раньше?
	AI_Output(self,other,"DIA_Miguel_NW_City_11_01");	//Да, но теперь Хоринис совсем уже не тот.
	AI_Output(self,other,"DIA_Miguel_NW_City_11_02");	//Ты представляешь себе шумную гавань, моряков со всех сторон света?
	AI_Output(self,other,"DIA_Miguel_NW_City_11_03");	//Купцы, товары, блеск золота. Контрабанда руды творила тут чудеса.
	AI_Output(self,other,"DIA_Miguel_NW_City_11_04");	//Эээх... какая жизнь здесь крутилась.
};


instance DIA_MIGUEL_NW_TRADE(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 775;
	condition = dia_miguel_nw_trade_condition;
	information = dia_miguel_nw_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Давай займемся делом!";
};


func int dia_miguel_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_miguel_nw_hi))
	{
		return TRUE;
	};
};

func void dia_miguel_nw_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};