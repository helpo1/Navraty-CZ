
instance DIA_GILLIMOR_EXIT(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 999;
	condition = dia_gillimor_exit_condition;
	information = dia_gillimor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gillimor_exit_condition()
{
	return TRUE;
};

func void dia_gillimor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GILLIMOR_HELLO(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 1;
	condition = dia_gillimor_hello_condition;
	information = dia_gillimor_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Привет.";
};


func int dia_gillimor_hello_condition()
{
	if(MEETGILLIMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_gillimor_hello_info()
{
	AI_Output(other,self,"DIA_Gillimor_Hello_01_01");	//Привет.
	AI_Output(self,other,"DIA_Gillimor_Hello_01_02");	//Приветствую тебя, чужеземец. Весьма смело с твоей стороны было заявиться в эту долину.
	AI_Output(self,other,"DIA_Gillimor_Hello_01_03");	//Что же привело тебя в это место?
	AI_Output(other,self,"DIA_Gillimor_Hello_01_04");	//Я ищу черного дракона. Слышал, что он бы обитает именно здесь.
	AI_Output(other,self,"DIA_Gillimor_Hello_01_05");	//А ты случаем не встречал его в долине?
	AI_Output(self,other,"DIA_Gillimor_Hello_01_06");	//Хмм... я крайне редко покидаю лагерь. И мало что знаю.
	AI_Output(other,self,"DIA_Gillimor_Hello_01_07");	//А ты разве не ходишь на охоту, как другие парни?
	AI_Output(self,other,"DIA_Gillimor_Hello_01_08");	//Нет, не хожу. Видишь ли, охотник из меня вышел никудышный.
	AI_Output(self,other,"DIA_Gillimor_Hello_01_09");	//Если я и покидаю лагерь, то только для того, чтобы пополнить свой запас лекарственных трав.
	AI_Output(other,self,"DIA_Gillimor_Hello_01_10");	//Ты разбираешься в травах?
	AI_Output(self,other,"DIA_Gillimor_Hello_01_11");	//Ну, более или менее кое-что я в них смыслю.
	MEETGILLIMOR = TRUE;
};


instance DIA_GILLIMOR_HELLO_TEACH(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 1;
	condition = dia_gillimor_hello_teach_condition;
	information = dia_gillimor_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Я слышал, ты хорошо разибраешься в алхимии.";
};


func int dia_gillimor_hello_teach_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORTEACHER == TRUE) && (GILLIMORREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gillimor_hello_teach_info()
{
	AI_Output(other,self,"DIA_Gillimor_Hello_Teach_01_01");	//Я слышал, ты хорошо разибраешься в алхимии.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_02");	//Да, неплохо. Приготовление различных зелий или снадобий - это мой конек.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_03");	//К сожалению, в этих местах непросто отыскать ингредиенты для некоторых из них.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_04");	//Так что, в основном, я практикуюсь в приготовлении лечебных эликсиров и эссенций.
	AI_Output(other,self,"DIA_Gillimor_Hello_Teach_01_05");	//А ты можешь для меня сварить несколько таких зелий?
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_06");	//Что ж, я вполне бы мог сварить для тебя парочку эликсиров, с условием, если ты мне принесешь для них нужные ингредиенты.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_07");	//Я бы мог и научить тебя варить их самому, если тебе, конечно, это интересно.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_09");	//Просто скажи, если тебе будет что-то нужно.
	GILLIMORREADYTEACH = TRUE;
};


instance DIA_GILLIMOR_BREWFORME(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 39;
	condition = dia_gillimor_brewforme_condition;
	information = dia_gillimor_brewforme_info;
	permanent = TRUE;
	description = "Приготовь мне...";
};


func int dia_gillimor_brewforme_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gillimor_brewforme_info()
{
	Info_ClearChoices(dia_gillimor_brewforme);
	Info_AddChoice(dia_gillimor_brewforme,Dialog_Back,dia_gillimor_brewforme_back);
	Info_AddChoice(dia_gillimor_brewforme,"...лечебный экстракт.",dia_gillimor_brewforme_health);
};

func void dia_gillimor_brewforme_back()
{
	Info_ClearChoices(dia_gillimor_brewforme);
};

func void dia_gillimor_brewforme_health()
{
	AI_Output(other,self,"DIA_Gillimor_BrewForMe_Health_01_01");	//Приготовь мне эликсир лечения.
	AI_Output(self,other,"DIA_Gillimor_BrewForMe_Health_01_02");	//А у тебя есть компоненты?
	if((Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1))
	{
		AI_Output(other,self,"DIA_Gillimor_BrewForMe_Health_01_03");	//Держи.
		B_GiveInvItems(other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems(other,self,ItPl_Temp_Herb,1);
		AI_Output(self,other,"DIA_Gillimor_BrewForMe_Health_01_04");	//Хорошо, уже даю, тебе не придется долго ждать.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Gillimor_BrewForMe_Health_01_05");	//У тебя нет нужных компонентов. Приходи, когда их найдешь.
	};
	Info_ClearChoices(dia_gillimor_brewforme);
	Info_AddChoice(dia_gillimor_brewforme,Dialog_Back,dia_gillimor_brewforme_back);
	Info_AddChoice(dia_gillimor_brewforme,"Приготовь мне лечебный экстракт.",dia_gillimor_brewforme_health);
};


instance DIA_GILLIMOR_TEACH(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 10;
	condition = dia_gillimor_teach_condition;
	information = dia_gillimor_teach_info;
	permanent = TRUE;
	description = "Научи меня варить зелья...";
};


func int dia_gillimor_teach_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gillimor_teach_info()
{
	AI_Output(other,self,"DIA_Gillimor_Teach_01_01");	//Научи меня варить зелья.
	AI_Output(self,other,"DIA_Gillimor_Teach_01_02");	//Я открою тебе все тайны алхимии.
	Info_ClearChoices(dia_gillimor_teach);
	Info_AddChoice(dia_gillimor_teach,Dialog_Back,dia_gillimor_teach_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_gillimor_teach_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_gillimor_teach_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_gillimor_teach_health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_gillimor_teach_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_gillimor_teach_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_gillimor_teach_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_gillimor_teach_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_gillimor_teach_perm_mana);
	};
};

func void dia_gillimor_teach_back()
{
	Info_ClearChoices(dia_gillimor_teach);
};

func void dia_gillimor_teach_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_gillimor_teach_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_gillimor_teach_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_gillimor_teach_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_gillimor_teach_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_gillimor_teach_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_gillimor_teach_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_gillimor_teach_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

