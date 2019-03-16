
instance DIA_Bennet_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_HALLO(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_HALLO_Condition;
	information = DIA_Bennet_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_HALLO_Condition()
{
	if((Kapitel < 3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Я не продаю оружие! Халед продает. Он находится в доме Онара.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"Халед торгует оружием.");
};


instance DIA_Bennet_TRADE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 700;
	condition = DIA_Bennet_TRADE_Condition;
	information = DIA_Bennet_TRADE_Info;
	permanent = TRUE;
	description = "А как насчет кузнечного инструмента?";
	trade = TRUE;
};


func int DIA_Bennet_TRADE_Condition()
{
	if(Wld_IsTime(8,0,22,0) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

var int bennetarrowsday;

func void DIA_Bennet_TRADE_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//А как насчет кузнечного инструмента?
	daynow = Wld_GetDay();

	if(BENNETARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (BENNETARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - BENNETARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
			BENNETARROWSDAY = daynow;
		};
	}
	else
	{
		Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	};

	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Что тебе нужно?

	if(BennetLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Беннет продает кузнечные принадлежности.");
		BennetLOG = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
};


instance DIA_Bennet_WhichWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = DIA_Bennet_WhichWeapons_Condition;
	information = DIA_Bennet_WhichWeapons_Info;
	permanent = FALSE;
	description = "Какое оружие ты делаешь?";
};


func int DIA_Bennet_WhichWeapons_Condition()
{
	if(((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)) && (MIS_Bennet_BringOre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Какое оружие ты делаешь?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//Сейчас - обычные мечи. Больше ничего.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Но если бы у меня была магическая руда, я мог бы выковать оружие, превосходящее любой меч из обычной стали.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Ты случайно не знаешь, где можно раздобыть руды? (смеется) Кроме как в Долине Рудников, я имею в виду.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Нет.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Конечно же, не знаешь.
};


instance DIA_Bennet_BauOrSld(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = DIA_Bennet_BauOrSld_Condition;
	information = DIA_Bennet_BauOrSld_Info;
	permanent = FALSE;
	description = "Ты с фермерами или с наемниками?";
};


func int DIA_Bennet_BauOrSld_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Ты с фермерами или с наемниками?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ты смеешься надо мной, да?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Мне просто интересно.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Ты когда-нибудь видел фермера, который ковал бы оружие?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Нет.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Тогда зачем ты задаешь такие тупые вопросы?
};

instance DIA_Bennet_WannaJoin(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 4;
	condition = DIA_Bennet_WannaJoin_Condition;
	information = DIA_Bennet_WannaJoin_Info;
	permanent = TRUE;
	description = "Я хочу присоединиться к наемникам!";
};

func int DIA_Bennet_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_BauOrSld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Тогда прекращай болтать и иди к Торлофу. Пусть он даст тебе испытание.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Я прошел испытание.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Хорошо, тогда я проголосую за тебя.
	};
};


instance DIA_Bennet_WannaSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_WannaSmith_Condition;
	information = DIA_Bennet_WannaSmith_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня ковать мечи?";
};


func int DIA_Bennet_WannaSmith_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Ты можешь научить меня ковать мечи?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Конечно.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//Впрочем, это обойдется тебе в некоторую сумму. Скажем, тридцать золотых!
	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Возможно позже.",DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Хорошо! Вот твои тридцать золотых.",DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Хорошо! Вот твои тридцать золотых.

	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//Должен сказать, это очень хорошая цена! Я готов приступить к обучению, как только ты будешь готов.
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Беннет может обучить меня кузнечному делу.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Не надо держать меня за идиота. Тридцать золотых и ни одной монетой меньше.
	};
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Может быть, позже.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};


instance DIA_Bennet_TeachCOMMON(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 6;
	condition = DIA_Bennet_TeachCOMMON_Condition;
	information = DIA_Bennet_TeachCOMMON_Info;
	permanent = TRUE;
	description = "Научи меня ковать мечи.";
};

func int DIA_Bennet_TeachCOMMON_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Научи меня ковать мечи.
	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
	Info_AddChoice(DIA_Bennet_TeachCOMMON,Dialog_Back,DIA_Bennet_TeachCOMMON_Back);
	Info_AddChoice(DIA_Bennet_TeachCOMMON,b_buildlearnstringforsmithhunt("Выучить кузнечное дело",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_TeachCOMMON_WEAPON);
};

func void DIA_Bennet_TeachCOMMON_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
};

func void DIA_Bennet_TeachCOMMON_WEAPON()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Это довольно просто: берешь кусок сырой стали и держишь его над огнем, пока он не раскалится.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Затем кладешь его на наковальню и придаешь мечу форму.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Самое важное - следи, чтобы сталь не стала слишком холодной. У тебя есть всего несколько минут для обработки оружия...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//А остальному ты научишься сам - это всего лишь вопрос практики.
	};

	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
};

instance DIA_Bennet_WannaSmithORE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 7;
	condition = DIA_Bennet_WannaSmithORE_Condition;
	information = DIA_Bennet_WannaSmithORE_Info;
	permanent = TRUE;
	description = "Научи меня ковать магическое оружие!";
};

func int DIA_Bennet_WannaSmithORE_Condition()
{
	if((Bennet_TeachSmith == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Научи меня ковать магическое оружие!

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Но ты даже не знаешь основ кузнечного дела.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Сначала ты должен научиться ковать обычные мечи. А там посмотрим.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Пока ты не один из нас, будь я проклят, если научу тебя секретам изготовления магического оружия.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Только немногие кузнецы владеют этим искусством, и я думаю, даже кузнецы в городе ничего не знают об этом.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//И это хорошо. Иначе все эти пьяницы из городской стражи потрясали бы магическими мечами.

		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Ничего личного...(ухмыляется) Против тебя я ничего не имею!
		};
	}
	else if(MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Если бы у меня была магическая руда, я бы, возможно, согласился.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ах, да ладно. Я с наемниками, и я знаю кузнечное дело. Что еще тебе нужно?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Скажи мне, как интересно я должен ковать магическое оружие, не имея магической руды?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Нууу...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//Вот что скажу. Мне нужно как минимум пять кусков руды - или ты можешь забыть об этом.

		if(MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_Running;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Отлично, ты принес мне руду, и ты также знаешь, как куется обычный меч.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//Так давай же, обучай меня!
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Самое главное: не важно, целиком сделан твой меч из магической руды, или ты просто покрыл обычный меч ее тонким слоем. Поверхность - только это имеет значение.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//А так как эта чертова руда очень дорогая, просто берешь стальную заготовку и несколько кусков руды.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Естественно, нельзя просто покрыть готовый меч магической рудой. Оружие нужно создавать с нуля.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//А все остальное зависит от оружия, которое ты хочешь получить.
		Bennet_TeachSmith = TRUE;
	};
};

instance DIA_Bennet_WhereOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhereOre_Condition;
	information = DIA_Bennet_WhereOre_Info;
	permanent = FALSE;
	description = "Где мне найти магическую руду?";
};

func int DIA_Bennet_WhereOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Где мне найти магическую руду?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//Эх, если бы я только знал это. Я думаю, в горнодобывающей колонии ты наверняка найдешь что-нибудь.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Но, может быть, тебе повезет и ты найдешь несколько мелких обломков где-нибудь здесь и сможешь слепить из них приличный кусок руды.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Насколько я знаю, в горах к югу отсюда есть заброшенные шахты. Попробуй попытать счастья там.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Но будь осторожен: я слышал, там устроили логово бандиты.
};

instance DIA_Bennet_BringOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_BringOre_Condition;
	information = DIA_Bennet_BringOre_Info;
	permanent = FALSE;
	description = "Вот, держи руду.";
};

func int DIA_Bennet_BringOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Вот, держи.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(смеется) Покажи!
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItMi_Nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Да ты что! Я потрясен!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Оставь себе два куска. Они тебе понадобятся, чтобы сделать твое собственное оружие.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

func void B_SayBennetLATER()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Этого недостаточно. Заходи попозже.
};


instance DIA_Bennet_TeachSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 30;
	condition = DIA_Bennet_TeachSmith_Condition;
	information = DIA_Bennet_TeachSmith_Info;
	permanent = TRUE;
	description = "Научи меня ковать оружие. ";
};

func int DIA_Bennet_TeachSmith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Я хочу больше узнать о магическом оружии.

	if(Wld_IsTime(8,0,22,0))
	{
		if((Kapitel == 1) && (Bennet_Kap2Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Я могу научить тебя ковать магические мечи и даже двуручные клинки.
			Bennet_Kap2Smith = TRUE;
		}
		else if((Kapitel == 2) && (Bennet_Kap3Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Я немного потренировался, и теперь я могу научить тебя, как ковать полуторные и тяжелые двуручные магические мечи.
			Bennet_Kap3Smith = TRUE;
		}
		else if((Kapitel == 3) && (Bennet_Kap4Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Пока мне нечему учить тебя. Это лучшее, что я умею ковать сейчас.
			Bennet_Kap4Smith = TRUE;
		}
		else if((Kapitel == 4) && (Bennet_Kap5Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Послушай! На меня только что снизошло вдохновение! Магическое оружие, покрытое кровью дракона! Я точно знаю, как изготовить его.
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//Хмм, а ты хочешь узнать?
			Bennet_Kap5Smith = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Какое оружие ты хотел бы научиться делать?
		};

		Info_ClearChoices(DIA_Bennet_TeachSmith);
		Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);

		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 4))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 4))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_02");	//На сегодня я уже закончил работать в кузне. Приходи завтра утром.
	};
};

func void DIA_Bennet_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_04);
};

instance DIA_Bennet_KAP3_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP3_EXIT_Condition;
	information = DIA_Bennet_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP3_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_WhyPrison(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhyPrison_Condition;
	information = DIA_Bennet_WhyPrison_Info;
	permanent = FALSE;
	description = "Как ты попал за решетку?";
};

func int DIA_Bennet_WhyPrison_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (DarkPathStart == FALSE) && (MeetDarkRavenSpeaker == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Как ты попал за решетку?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Эти свиньи схватили меня и бросили сюда. Говорят, что я убил паладина.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Но я не делал этого, они хотят оклеветать меня.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Зачем бы им это?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Откуда мне знать? Ты должен вытащить меня отсюда.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Поговори с лордом Хагеном, проломи стену...ну, я не знаю...сделай же что-нибудь!
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet,"У Беннета серьезные проблемы. Он на все готов, чтобы только вырваться из тюрьмы.");
};

instance DIA_Bennet_Victim(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Victim_Condition;
	information = DIA_Bennet_Victim_Info;
	permanent = FALSE;
	description = "Кто был убит?";
};


func int DIA_Bennet_Victim_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Кто был убит?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Понятия не имею - один из паладинов, я не знаю, кто.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Ты знаешь имя?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Какой-то Лотар, по-моему. Ну, я не знаю, я не уверен.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Тебе лучше спросить лорда Хагена, ему известны все детали.
	B_LogEntry(TOPIC_RescueBennet,"Лотар, один из паладинов, был убит. Лорд Хаген, возможно, сможет рассказать мне подробнее об этом деле, ведь именно он ведет расследование.");
};


instance DIA_Bennet_Evidence(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Evidence_Condition;
	information = DIA_Bennet_Evidence_Info;
	permanent = FALSE;
	description = "У них есть доказательства против тебя?";
};


func int DIA_Bennet_Evidence_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//У них есть доказательства против тебя?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//Говорят, есть свидетель, который опознал меня.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Ты знаешь, кто этот свидетель?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Нет. Я знаю только, что он лжет.
	B_LogEntry(TOPIC_RescueBennet,"Есть свидетель, утверждающий, что видел, как это сделал Беннет. Я должен найти этого свидетеля, если я хочу выяснить правду.");
	RescueBennet_KnowsWitness = TRUE;
};


instance DIA_Bennet_Investigation(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Investigation_Condition;
	information = DIA_Bennet_Investigation_Info;
	permanent = FALSE;
	description = "Кто ведет расследование?";
};


func int DIA_Bennet_Investigation_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Кто ведет расследование?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Сам лорд Хаген. Так как был убит один из паладинов, это дело подпадает под закон о военном положении.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Что это означает?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//Это легко предположить. Если меня не вытащить отсюда, то я буду повешен без долгих разговоров.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Ты должен помочь мне, или начнется война. Ли не отставит это просто так.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Ты сам понимаешь, что это значит.
};


instance DIA_Bennet_ThankYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ThankYou_Condition;
	information = DIA_Bennet_ThankYou_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_ThankYou_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	if(hero.guild == GIL_SLD)
	{
		hero.guild = GIL_DJG;
		CheckHeroGuild[0] = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Ох, а я уж думал, что меня наверняка повесят!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//Что ж, в конце концов, все окончилось хорошо.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//Да уж! Ты бы видел выражение лица солдата, который выпускал меня!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(смеется) Он был так напуган, что чуть не наложил в штаны.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Да, чуть не забыл. У меня есть кое-что для тебя.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(ухмыляется) Презент.
};

var int BennetNeedSteel;

instance DIA_Bennet_Present(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Present_Condition;
	information = DIA_Bennet_Present_Info;
	permanent = FALSE;
	description = "Какой презент?";
};

func int DIA_Bennet_Present_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Какой презент?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Мы все слышали о драконах, которые вроде бы появились в Долине.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Они действительно там!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Хорошо, я верю тебе.

	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//Как бы там ни было, некоторые из парней решили отправиться в Долину.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//Они собираются навести там порядок.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//А какое это имеет отношение ко мне?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//Я разработал новый тип доспехов. Доспехи охотника на драконов!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Они прочнее и легче, чем традиционные доспехи.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//Так как ты спас меня, я хочу, чтобы ты получил первый экземпляр. Это подарок!
		CreateInvItems(self,itar_djg_l,1);
		B_GiveInvItems(self,other,itar_djg_l,1);
		SHOW_DJG_ARMOR_L = TRUE;
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Я подумал, что, возможно, тебе тоже захочется позабавиться там. Тебе понадобится хорошее снаряжение, когда ты отправишься в эту долину.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Также мне интересны драконьи чешуйки. Настоящие драконьи чешуйки. Я хорошо заплачу тебе за них!
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Сколько я получу за чешуйку?
		B_Say_Gold(self,other,Value_DragonScale);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Ладно, я думаю, ты наверняка захочешь поучаствовать в готовящейся охоте на драконов.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//И?
		AI_Output(self,other,"DIA_Bennet_Present_06_95");	//Вот, возьми это золото! Оно тебе понадобится, чтобы хорошенько подготовиться к предстоящей битве.
		B_GiveInvItems(self,other,ItMi_Gold,1000);
	};

	BennetNeedSteel = TRUE;
};


var int Bennet_DragonScale_Counter;

instance DIA_Bennet_DragonScale(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DragonScale_Condition;
	information = DIA_Bennet_DragonScale_Info;
	permanent = TRUE;
	description = "Я принес тебе несколько драконьих чешуек.";
};


func int DIA_Bennet_DragonScale_Condition()
{
	if((Npc_HasItems(other,ItAt_DragonScale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Я принес тебе несколько драконьих чешуек.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Настоящая чешуя дракона!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Вот твое золото!
	Bennet_DragonScale_Counter = Bennet_DragonScale_Counter + Npc_HasItems(other,ItAt_DragonScale);
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_DragonScale) * Value_DragonScale);
	B_GiveInvItems(other,self,ItAt_DragonScale,Npc_HasItems(other,ItAt_DragonScale));

	if((Bennet_DragonScale_Counter >= 20) && (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Хорошо, этого должно быть достаточно. Я могу продать тебе новые, улучшенные доспехи, если, конечно, тебе это интересно.
		Show_DJG_Armor_M = TRUE;
	};
};


var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;

instance DIA_Bennet_DJG_ARMOR_M(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_M_Condition;
	information = DIA_Bennet_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "Купить доспех драконоборца. (Цена: 12000 монет)";
};

func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (Show_DJG_Armor_M == TRUE) && (Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Я хочу купить доспехи.

	if(Npc_HasItems(other,ItMi_Gold) >= 12000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,12000);
		Npc_RemoveInvItems(self,ItMi_Gold,12000);
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Очень хорошо. Уверен, они тебя не разочаруют.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Да уж, за такую-то цену...
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Ты поймешь, что они стоят этих денег.
		CreateInvItems(self,itar_djg_m,1);
		B_GiveInvItems(self,other,itar_djg_m,1);
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//У тебя недостаточно золота.
	};
};


instance DIA_Bennet_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Condition;
	information = DIA_Bennet_BetterArmor_Info;
	permanent = FALSE;
	description = "Я знаю, как можно еще улучшить доспехи.";
};

func int DIA_Bennet_BetterArmor_Condition()
{
	if((DragonHigh == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Я знаю, как можно еще улучшить доспехи.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//Ну расскажи мне.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Можно покрыть драконьи чешуйки магической рудой.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//Эта мысль приходила и ко мне! Да, ты прав.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Мои новые доспехи превосходят все, что ты когда-либо видел. Они очень легкие и очень прочные.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Они СОВЕРШЕННЫ!
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Ты можешь купить их, если хочешь. Я не предложил бы их абы кому, а цена только-только покрывает стоимость производства.
};


var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;

instance DIA_Bennet_DJG_ARMOR_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_H_Condition;
	information = DIA_Bennet_DJG_ARMOR_H_Info;
	permanent = TRUE;
	description = "Купить тяжелый доспех драконоборца. (Цена: 15000 монет)";
};

func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Дай мне доспехи.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Это лучшие доспехи из того, что я когда-либо делал.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Настоящее произведение искусства!
		CreateInvItems(self,itar_djg_h,1);
		B_GiveInvItems(self,other,itar_djg_h,1);
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
		SHOW_DJG_ARMOR_H = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//У тебя недостаточно золота.
	};
};

var int Bennet_DIA_Bennet_DJG_HELM_H_permanent;

instance DIA_Bennet_DJG_HELM_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_DJG_HELM_H_Condition;
	information = DIA_Bennet_DJG_HELM_H_Info;
	permanent = TRUE;
	description = "Купить шлем драконоборца. (Цена: 6000 монет)";
};

func int DIA_Bennet_DJG_HELM_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_HELM_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor) && (hero.guild == GIL_DJG))

	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_HELM_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_HELM_H_15_00");	//Дай мне шлем драконоборца.

	if(Npc_HasItems(other,ItMi_Gold) >= 6000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,6000);
		Npc_RemoveInvItems(self,ItMi_Gold,6000);
		AI_Output(self,other,"DIA_Bennet_DJG_HELM_H_06_01");	//Отличный выбор, приятель!
		CreateInvItems(self,itar_djg_helm,1);
		B_GiveInvItems(self,other,itar_djg_helm,1);
		Bennet_DIA_Bennet_DJG_HELM_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_HELM_H_06_03");	//У тебя недостаточно золота.
	};
};

instance DIA_Bennet_RepairNecklace(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_RepairNecklace_Condition;
	information = DIA_Bennet_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};

func int DIA_Bennet_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Ты можешь ремонтировать ювелирные изделия?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Может быть. Ты должен сначала показать мне их.
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Также мне сначала нужно выбраться отсюда.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Без этого я не смогу ничего сделать, это очевидно.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_ShowInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ShowInnosEye_Condition;
	information = DIA_Bennet_ShowInnosEye_Info;
	permanent = FALSE;
	description = "Ты можешь взглянуть на этот амулет?";
};


func int DIA_Bennet_ShowInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Ты можешь взглянуть на этот амулет?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Конечно, давай посмотрим.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Хммм, превосходная работа. Оправа сломана. Но, думаю, впрочем, я смогу починить ее.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Сколько это займет времени?
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//Ну, я застрял здесь пока. Или ты где-то здесь видишь кузницу?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Если бы я был в своей кузнице, я мог бы сделать это за один день. Но, конечно же, сначала мне нужно выбраться отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Если ты оставишь его мне, к завтрашнему утру он будет как новенький.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//И я даже не возьму с тебя денег за эту работу. Ведь это ты вытащил меня из тюрьмы.
	};
	B_LogEntry(TOPIC_INNOSEYE,"Беннет - кузнец, который нужен мне, чтобы починить амулет.");
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_GiveInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GiveInnosEye_Condition;
	information = DIA_Bennet_GiveInnosEye_Info;
	permanent = FALSE;
	description = "Вот амулет, пожалуйста, почини его.";
};


func int DIA_Bennet_GiveInnosEye_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) >= 1) && (MIS_SCKnowsInnosEyeIsBroken == TRUE) && (MIS_RescueBennet == LOG_SUCCESS) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Вот амулет, пожалуйста, почини его.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Хорошо. Я закончу работу к завтрашнему утру.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Заходи завтра, и заберешь его.
	Npc_RemoveInvItems(other,ItMi_InnosEye_Broken_Mis,1);
	AI_Print(Print_InnoseyeGiven);
	Bennet_RepairDay = Wld_GetDay();
};


instance DIA_Bennet_GetInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GetInnosEye_Condition;
	information = DIA_Bennet_GetInnosEye_Info;
	permanent = TRUE;
	description = "Амулет готов?";
};


func int DIA_Bennet_GetInnosEye_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Амулет готов?
	if(Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Да, держи.
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other,ItMi_InnosEye_Broken_Mis,1);
		AI_Print(Print_InnosEyeGet);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Мне пришлось сделать новую оправу для камня.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Я работал всю ночь, и теперь он как новенький.
		B_LogEntry(TOPIC_INNOSEYE,"Амулет опять как новенький. Беннет проделал отличную работу.");
		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;
		B_GivePlayerXP(XP_InnosEyeIsRepaired);
	}
	else
	{
		B_SayBennetLATER();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Если ты будешь продолжать мешать мне, это только задержит работу.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bennet_KAP4_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP4_EXIT_Condition;
	information = DIA_Bennet_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP4_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DRACHENEIER(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_DRACHENEIER_Condition;
	information = DIA_Bennet_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Ты можешь что-нибудь сделать с драконьими яйцами?";
};


func int DIA_Bennet_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && (BennetsDragonEggOffer == 0) && (Npc_HasItems(other,ItAt_DragonEgg_MIS) >= 1))
	{
		return TRUE;
	};
};


var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;

func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Ты можешь что-нибудь сделать с драконьими яйцами?

	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Драконьи яйца? Где, черт возьми, тебе удалось добыть их?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Я забрал их у людей-ящеров.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Давай посмотрим.
	};

	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);

	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Ммм. Очень твердый материал. Идеально подходит для доспехов. Если только удастся открыть их.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Ну и как? Они нужны тебе?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Конечно! Давай сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Ну и сколько еще ты собираешься вертеть их у меня перед носом? Ты продашь их или нет?
	};

	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Я заплачу тебе, ммм, скажем, триста золотых за каждое яйцо, что ты принесешь мне.
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Тогда можешь оставить золото себе. Я пока попридержу эти яйца.",DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Это яйца дракона, а не какие-нибудь куриные!",DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Договорились!",DIA_Bennet_DRACHENEIER_ok);

	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_DRACHENEIER,"Беннет готов дать за драконьи яйца, которые найду, хорошую цену.");
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Договорились!
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Отлично.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Если найдешь еще, неси их сюда.

	if(BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};

	B_GiveInvItems(self,other,ItMi_Gold,BennetsDragonEggOffer);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Эээ. Ты сказал, что забрал их у людей-ящеров?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Точно.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Насколько я знаю, люди-ящеры обычно обитают в пещерах.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Я не удивлюсь, если тебе удастся найти еще яйца в пещерах неподалеку.
	B_LogEntry(TOPIC_DRACHENEIER,"Беннет полагает, что мне стоит поискать яйца в пещерах Хориниса. Во многих из них, по слухам, видели человекоящеров.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Вот! Возьми эту карту. Она поможет тебе найти пещеры.
	B_GiveInvItems(self,other,itwr_map_caves_mis_1,1);
	B_LogEntry(TOPIC_DRACHENEIER,"Беннет дал мне карту пещер, возможно, она поможет мне.");
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Это яйца дракона, а не какие-нибудь куриные.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//Хорошо! Триста пятьдесят и точка! Я не могу дать тебе больше - иначе это дело не окупится.
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Тогда можешь оставить золото себе. Я пока попридержу эти яйца.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Дай мне знать, если передумаешь.
	B_GiveInvItems(self,other,ItAt_DragonEgg_MIS,1);
	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};


instance DIA_Bennet_EierBringen(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_EierBringen_Condition;
	information = DIA_Bennet_EierBringen_Info;
	permanent = TRUE;
	description = "Нужны еще драконьи яйца?";
};

func int DIA_Bennet_EierBringen_Condition()
{
	if((BennetsDragonEggOffer > 0) && (Kapitel >= 4) && (Npc_HasItems(other,ItAt_DragonEgg_MIS) >= 1))
	{
		return TRUE;
	};
};


var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;

	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Нужны еще драконьи яйца?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Конечно!
	DragonEggCount = Npc_HasItems(other,ItAt_DragonEgg_MIS);

	if(DragonEggCount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Вот! Я принес еще одно.
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);
		DragonEggCounter = DragonEggCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//Я принес еще несколько.
		B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,DragonEggCount);
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,DragonEggCount);
		XP_DJG_BringDragonEggs = DragonEggCount * XP_DJG_BringDragonEgg;
		DragonEggCounter = DragonEggCounter + DragonEggCount;
		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};
	if(DragonEggCounter <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Отлично. Давай сюда. Ты везде посмотрел, а? Наверняка где-то должны быть еще.
	}
	else if(DragonEggCounter <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Где ты раскопал их? Вряд ли где-нибудь еще остались эти яйца.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Я не думаю, что ты найдешь еще яйца. К тому же мне и этих достаточно. Я даже не знаю, что я буду делать со всеми ними.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Ох, хорошо. Вот твои деньги.
	DragonEggGeld = DragonEggCount * BennetsDragonEggOffer;
	B_GiveInvItems(self,other,ItMi_Gold,DragonEggGeld);
};


instance DIA_Bennet_KAP5_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP5_EXIT_Condition;
	information = DIA_Bennet_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP5_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_KnowWhereEnemy(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_KnowWhereEnemy_Condition;
	information = DIA_Bennet_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Мне нужно плыть на другой остров. Мне бы пригодился кузнец.";
};


func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Bennet_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Мне нужно плыть на другой остров. Мне бы пригодился кузнец.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//И ты подумал обо мне?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Да. Что скажешь? По крайней мере, ты сможешь выбраться отсюда.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Это лучше, чем работать на ферме Онара. Парень, даже ад ЛУЧШЕ, чем здесь. Ты можешь рассчитывать на меня.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Беннет готов отправляться немедленно. Кузнец он непревзойденный. Я уверен, что смогу многому научиться у него.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Моя команда сейчас полностью укомплектована.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Тогда уволь кого-нибудь из нее.
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Я дам тебе знать, когда ты мне понадобишься.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Будь моим кузнецом. Увидимся в гавани. ",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Будь моим кузнецом. Увидимся в гавани.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Хорошо. Увидимся позже.
	B_GivePlayerXP(XP_Crewmember_Success);
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда ты мне понадобишься.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Отлично. Я буду здесь.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};


instance DIA_Bennet_LeaveMyShip(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_LeaveMyShip_Condition;
	information = DIA_Bennet_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я хочу найти себе другого кузнеца.";
};


func int DIA_Bennet_LeaveMyShip_Condition()
{
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Я хочу найти себе другого кузнеца.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Сейчас ты думаешь одно, через минуту - другое. Ты не мог бы определиться, а? Когда будешь твердо уверен в том, чего ты хочешь, дай мне знать.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bennet_StillNeedYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_StillNeedYou_Condition;
	information = DIA_Bennet_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся, я не могу найти другого кузнеца.";
};


func int DIA_Bennet_StillNeedYou_Condition()
{
	if(((Bennet_IsOnBoard == LOG_OBSOLETE) || (Bennet_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Возвращайся, я не могу найти другого кузнеца.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(озлобленно) Хорошо! Всякий может издеваться над простым кузнецом! Увидимся в гавани.
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Bennet_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 900;
	condition = DIA_Bennet_PICKPOCKET_Condition;
	information = DIA_Bennet_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bennet_PICKPOCKET_Condition()
{
	return C_Beklauen(35,45);
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,Dialog_Back,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};


instance DIA_BENNET_ARMORCANTEACH(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = dia_bennet_armorcanteach_condition;
	information = dia_bennet_armorcanteach_info;
	permanent = TRUE;
	description = "Ты умеешь ковать доспехи?";
};

func int dia_bennet_armorcanteach_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((BENNET_TEACHARMOR == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			return TRUE;
		};
	};
};

func void dia_bennet_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_00");	//Ты умеешь ковать доспехи?
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_01");	//Да, я кую доспехи для наемников. Причем достаточно неплохие, как ты мог заметить.
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_02");	//А ты можешь продать мне доспехи получше?
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_03");	//Нет, парень, не могу. Только Ли решает, кому выдавать их и за что. Так что без его разрешения я не стану этого делать.
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_05");	//Жаль, а я на тебя рассчитывал.
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_06");	//Ну, если тебе так приспичило достать себе доспех получше, то, возможно, я смогу тебе помочь.
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_07");	//Каким образом?
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_08");	//Ну, поскольку ты один из нас, я бы мог показать тебе несколько способов, как улучшить твою броню.
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_09");	//Но для этого ты должен немного разбираться в ковке.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_10");	//Я довольно сносно разбираюсь в ковке.
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_11");	//Ну-ка, поглядим... Да, действительно. Ну, что ж, это все немного упрощает.
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_12");	//Я научу тебя тому, что сам знаю. И учти одну вещь: за твое обучение тебе придется заплатить. Благотворительностью я не занимаюсь!
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_13");	//А так, приходи в любой момент, когда захочешь что-нибудь узнать о ковке доспехов.
		AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_14");	//Хорошо, я все понял.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_15");	//А ты, как я погляжу, даже понятия не имеешь, что это такое!
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_16");	//Вот что, парень. Сначала научись основам кузнечного дела. А после мы поговорим о твоем обучении.
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_17");	//И учти одну вещь - за твое обучение тебе придется заплатить. Благотворительностью я не занимаюсь!
	};
	BENNET_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Беннет может научить меня улучшать доспехи наемников.");
};

func void b_bennet_teacharmor_1()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_01");	//Хорошо, смотри внимательно, как это делается. Берешь нужные материалы и...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_02");	//...на наковальне добавляешь их в нужной последовательности к разогретой стальной заготовке...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_03");	//...после чего придаешь ей необходимую форму и скрепляешь с имеющимся доспехом...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_04");	//...вот так, как это делаю я сейчас...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_05");	//...вот и все!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_06");	//Теперь ты можешь попробовать сделать это сам.
	};
};

func void b_bennet_teacharmor_2()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_01");	//Отлично, тщательно запоминай все, что я тебе сейчас буду показывать. Прежде всего, тебе необходимо иметь под рукой все материалы для ковки...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_02");	//...берешь раскаленную стальную заготовку и разбиваешь ее на несколько составных частей...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_03");	//...в определенной последовательности смешивая каждую часть с очередным материалом...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_04");	//...потом вковываешь их в каркас имеющейся брони, особенно тщательно проковывая места схода. Вот так, видишь?
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_05");	//...и всего-то делов!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_06");	//Ничего сложного, поверь мне. Главное соблюсти правильную последовательность действий.
	};
};

func void b_bennet_teacharmor_3()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_01");	//Смотри и запоминай все, что я тебе сейчас покажу. На самом деле ничего сложного тут нет...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_02");	//...обрабатываешь раскаленную стальную заготовку на наковальне, добавляешь поочередно железную руду нужной пропорции...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_03");	//...доводишь сплав до однородной субстанции, после чего смешиваешь его с остальными компонентами...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_04");	//...далее придаешь ей законченную форму и проковываешь с контуром доспеха... Вот так, смотри - видишь, как я делаю?
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_05");	//...вот и готово!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_06");	//Сам видишь, все просто. Теперь иди, сам пробуй.
	};
};

func void b_bennet_teacharmor_4()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_01");	//Итак, приступим. Проверь, чтобы все необходимые материалы были у тебя под рукой. Берешь разогретую стальную заготовку...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_02");	//...на наковальне придаешь ей форму пластины и вковываешь в нее куски железной руды....
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_03");	//...далее делаешь крепления и соединяешь пластину с ними, тщательно проковывая места схода...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_04");	//...после этого тщательно крепишь полученный элемент на корпус доспеха - вот таким образом... смотри...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_06");	//Это все, что тебе следует знать, чтобы улучшить этот доспех.
	};
};

func void b_bennet_teacharmor_5()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_01");	//Ну, что ж, начнем. Для создания этого доспеха тебе потребуется много времени и усилий, но оно того стоит...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_02");	//...возьми раскаленную стальную заготовку и раздели ее на несколько равных частей...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_03");	//...затем бери каждую часть и последовательно обработай их с помощью рудной крошки. Скрепи две части и прокуй места схода...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_04");	//...а после полученный элемент скрепляешь с доспехом по бокам с помощью металлической пластины...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_05");	//...усиливаешь крепление металлическими болтами, и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_06");	//...готово!
	};
};

func void b_bennet_teacharmor_6()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_01");	//Овладев эти знанием, ты сможешь сделать такой доспех, с которым по своей прочности и надежности не сравнится никакой другой...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_02");	//...берешь раскаленную стальную заготовку и на наковальне придаешь ей форму пластины...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_03");	//...после этого покрываешь полученный элемент рудной крошкой и поверху наносишь слой железной руды...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_04");	//...скрепляешь две таких пластины стальными болтами и крепишь на каркас брони...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_05");	//...это добавит прочности в местах крепления всех элементов доспеха... Еще немного подбиваем контур брони, и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_06");	//...все, доспех готов!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_07");	//Мне больше нечему тебя учить. Все, что я знал, я тебе поведал. Теперь иди и опробуй свои знания.
	};
};

func void b_bennetarmorchoices()
{
	Info_ClearChoices(dia_bennet_armorteach);
	Info_AddChoice(dia_bennet_armorteach,Dialog_Back,dia_bennet_armorteach_back);

	if(PLAYER_TALENT_SMITH[17] == FALSE)
	{
		Info_AddChoice(dia_bennet_armorteach,"Легкие доспехи наемника (Цена: 500 монет)",dia_bennet_armorteach_itar_sld_l_v1);
	};
	if((PLAYER_TALENT_SMITH[18] == FALSE) && (Lee_SldMGiven == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,"Доспехи наемника (Цена: 1000 монет)",dia_bennet_armorteach_itar_sld_m_v1);
	};
	if((PLAYER_TALENT_SMITH[19] == FALSE) && (Lee_SldHGiven == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,"Тяжелые доспехи наемника (Цена: 2000 монет)",dia_bennet_armorteach_itar_sld_h_v1);
	};
	if((PLAYER_TALENT_SMITH[20] == FALSE) && (SHOW_DJG_ARMOR_L == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx("Легкие доспехи драконоборца (Цена: 3000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_L_V1)),dia_bennet_armorteach_itar_djg_l_v1);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (Show_DJG_Armor_M == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx("Доспехи драконоборца (Цена: 4000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_M_V1)),dia_bennet_armorteach_itar_djg_m_v1);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (SHOW_DJG_ARMOR_H == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx("Тяжелые доспехи драконоборца (Цена: 5000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_H_V1)),dia_bennet_armorteach_itar_djg_h_v1);
	};
};


instance DIA_BENNET_ARMORTEACH(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = dia_bennet_armorteach_condition;
	information = dia_bennet_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};

func int dia_bennet_armorteach_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (BENNET_TEACHARMOR == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			if((PLAYER_TALENT_SMITH[17] == FALSE) || (PLAYER_TALENT_SMITH[18] == FALSE) || (PLAYER_TALENT_SMITH[19] == FALSE) || (PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE))
			{
				return TRUE;
			};
		};
	};
};

func void dia_bennet_armorteach_info()
{
	AI_Output(other,self,"DIA_Bennet_ArmorTeach_01_00");	//Научи меня улучшать доспехи.

	if(Wld_IsTime(8,0,22,0))
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_01");	//И что же ты хочешь узнать?
		b_bennetarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_02");	//На сегодня я уже закончил работать в кузне. Приходи завтра утром.
	};
};

func void dia_bennet_armorteach_back()
{
	Info_ClearChoices(dia_bennet_armorteach);
};

func void dia_bennet_armorteach_itar_sld_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_bennet_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Я же сказал тебе, что не занимаюсь благотворительностью. Приходи, когда у тебя будет достаточно золота.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_sld_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			b_bennet_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Я же сказал тебе, что не занимаюсь благотворительностью. Приходи, когда у тебя будет достаточно золота.
	};

	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_sld_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,2000);
			b_bennet_teacharmor_3();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Я же сказал тебе, что не занимаюсь благотворительностью. Приходи, когда у тебя будет достаточно золота.
	};

	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_bennet_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Я же сказал тебе, что не занимаюсь благотворительностью. Приходи, когда у тебя будет достаточно золота.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 4000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,4000);
			b_bennet_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Я же сказал тебе, что не занимаюсь благотворительностью. Приходи, когда у тебя будет достаточно золота.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_bennet_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Я же сказал тебе, что не занимаюсь благотворительностью. Приходи, когда у тебя будет достаточно золота.
	};
	b_bennetarmorchoices();
};


instance DIA_BENNET_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_bennet_nw_kapitelorcattack_condition;
	information = dia_bennet_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Город захвачен орками!";
};


func int dia_bennet_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BENNETBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_01_00");	//Город захвачен орками!
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_01_01");	//Да?! (испуганно) Черт, похоже, мы серьезно влипли! И что нам теперь делать?
	Info_ClearChoices(dia_bennet_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_bennet_nw_kapitelorcattack,"Предложить руну телепортации на ферму Онара.",dia_bennet_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_bennet_nw_kapitelorcattack,"Пока и сам не знаю.",dia_bennet_nw_kapitelorcattack_nogiverune);
};

func void dia_bennet_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_01");	//У меня есть руна телепортации на ферму Онара.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_02");	//Если хочешь, можешь ею воспользоваться.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_03");	//Руна?! Хммм...(задумчиво) Ну, даже не знаю, надо подумать.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_04");	//Да чего тут думать, бери - и дело с концом!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_05");	//Все равно остальные парни, скорее всего, от нее откажутся. Так что бери и не спорь.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_06");	//Да уж...(скептически посматривая) Умеешь ты все-таки уговаривать. Ладно, давай ее сюда.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_07");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_08");	//Эх! Надеюсь, после нее меня не будет опять неделю мутить, как после неправильного похмелья.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_09");	//А то обычно я с этими штуками не в ладах!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_11");	//Как бы то ни было, это лучше, нежели чем ты бы познакомился с топорами орков.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_12");	//Это уж точно...(смеется) Ладно, приятель - тогда я отправляюсь обратно на ферму. Там и встретимся!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_13");	//Конечно.
	BENNETNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Беннету руну телепортации на ферму Онара. Теперь я спокоен за его судьбу.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_bennet_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Пока и сам не знаю.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Но, по всей видимости, вам придется пробиваться из города с боем. Другого выхода нет.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Да уж...(печально) Хороша идейка! Я, конечно, не трус, но солдат из меня тоже никудышный.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Не думаю, что у меня будет много шансов выжить во всей этой заварухе.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_05");	//Надеюсь, тебе повезет.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_06");	//Посмотрим. В любом случае ждать осталось недолго.
	B_LogEntry(TOPIC_HELPCREW,"Беннет будет участвовать в прорыве через город. По его же собственному признанию, солдат из него никудышный, поэтому не думаю, что у него есть много шансов выйти из этой передряги живым.");
	BENNETBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_809_BENNET_FUCKOFF(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = dia_sld_809_bennet_fuckoff_condition;
	information = dia_sld_809_bennet_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_809_bennet_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_809_BENNET_YOURFREE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_sld_809_bennet_yourfree_condition;
	information = dia_sld_809_bennet_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_809_bennet_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_yourfree_info()
{
	AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_08");	//Чего тебе еще надо?
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_00");	//Просто хочу сказать, что ты свободен!
	AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_01");	//Хммм...(удивленно) Ты что, перебил всех орков в городе?
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_02");	//Да, именно так.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_03");	//Что же, отлично приятель! А то мы уж думали, что нам всем пришел конец.
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_04");	//Только открой сначала решетки, чтобы мы смогли выйти отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_05");	//Что же, отлично приятель! А то я уж думал, что мне пришел конец.
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_06");	//Только открой сначала решетку, чтобы я смог выйти отсюда.
	};
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_07");	//Сейчас.
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_809_BENNET_OPENGATENOW(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_sld_809_bennet_opengatenow_condition;
	information = dia_sld_809_bennet_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_809_bennet_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (BENNETISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_opengatenow_info()
{
	AI_Output(self,other,"DIA_SLD_809_Bennet_OpenGateNow_01_00");	//Ну открой же наконец эту решетку!
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_ABOUTSWBL(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = dia_bennet_aboutswbl_condition;
	information = dia_bennet_aboutswbl_info;
	permanent = FALSE;
	description = "Где ты берешь стальные заготовки?";
};


func int dia_bennet_aboutswbl_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ABOUTSWBL == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_bennet_aboutswbl_info()
{
	AI_Output(other,self,"DIA_BENNET_aboutswbl_15_00");	//Где ты берешь стальные заготовки?
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_01");	//В последнее время их тяжело найти. В Долине Рудников становится все труднее добывать руду и плавить слитки.
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_02");	//Ты можешь поискать заготовки у торговцев, а можешь выплавить их сам из руды.
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_03");	//Правда, тебе придется сначала добыть руду, а потом найти того, кто разбирается в плавке.
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_04");	//Можешь попробовать поискать учителей среди бывших заключенных из Долины - их сейчас много в Хоринисе после падения Барьера.
	AI_Output(other,self,"DIA_BENNET_TellsMarduk_01_04");	//Спасибо за совет.
	ABOUTSWBL = TRUE;
	Log_CreateTopic(TOPIC_STEELDRAW,LOG_NOTE);
	Log_SetTopicStatus(TOPIC_STEELDRAW,LOG_Running);
	B_LogEntry(TOPIC_STEELDRAW,"Беннет рассказал мне, что стальные заготовки можно найти у торговцев, а можно попробовать выплавить самому. Правда, мне придется вначале добыть руду и найти среди бывших заключенных того, кто научит меня ее плавить. Да и как добывать руду, я уже забыл.");
};

instance DIA_Bennet_PrioratBlade(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_PrioratBlade_condition;
	information = DIA_Bennet_PrioratBlade_info;
	permanent = FALSE;
	description = "Ты хорошо разбираешься в оружии?";
};

func int DIA_Bennet_PrioratBlade_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_01");	//Ты хорошо разбираешься в оружии?
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_02");	//Довольно неплохо. А почему ты интересуешься?
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_03");	//У меня есть один очень интересный экземпляр.
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_04");	//И мне бы хотелось понять, где и кем он выкован.
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_05");	//Оно у тебя с собой?
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_06");	//Да, вот.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_07");	//(серьезно) Сразу видно, что это оружие ковал не новичок. Тот, кто его сделал, мог бы гордиться своей работой!
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_08");	//Баланс самого клинка выдержан идеально, а, насколько мне известно, здешние кузнецы на такое не способны.
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_09");	//А ты?
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_10");	//Ну, если говорить начистоту, в том числе и я...(ехидно) Так что, скорее всего, этот клинок попал к нам из Миртаны, парень.
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_11");	//Только там живут настоящие мастера-оружейники, способные делать подобные вещи.
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_12");	//Вот, возьми его обратно и береги хорошенько. Подобное оружие ценится куда дороже золота!
	B_LogEntry(TOPIC_PrioratStart,"Осмотрев клинок, Беннет сказал, что он был выкован кузнецами Миртаны. Но больше ничего не добавил.");
};

instance DIA_Bennet_NeedSteel(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_NeedSteel_condition;
	information = DIA_Bennet_NeedSteel_info;
	permanent = FALSE;
	description = "Ты выглядишь немного расстроеным.";
};

func int DIA_Bennet_NeedSteel_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if(BennetNeedSteel == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_NeedSteel_info()
{
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_01");	//Ты выглядишь немного расстроенным.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_02");	//Да есть от чего. Ли сделал мне большой заказ на новые доспехи.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_03");	//Но мне не хватает стали для его выполнения. И где ее взять, я просто ума не приложу!
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_04");	//А если сталь просто купить в городе?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_05");	//Вряд ли там кто-то станет торговать со мной. И, как я слышал, им самим ее порой не хватает.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_06");	//И много ли стали тебе нужно?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_07");	//Полагаю, что для первой партии доспехов сотни болванок вполне должно хватить.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_08");	//Ну, а там уже будет видно, что к чему. Кстати, а тебе-то до этого какой интерес?
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_09");	//Вероятно, я смогу достать ее для тебя.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_10");	//(удивленно) Знаешь, где можно раздобыть кучу стали? 
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_11");	//Возможно.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_12");	//Ну ты хитрец, приятель. Ладно. Вижу, чего ты хочешь, чай, не дурак.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_13");	//Поэтому скажу тебе так:
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_14");	//Если поможешь мне выполнить этот заказ, то можешь рассчитывать на мою безмерную благодарность!
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_15");	//А уж ты меня знаешь, я в долгу не останусь. Ну что, по рукам?
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_16");	//Хорошо, договорились.
	MIS_NeedSteel = LOG_Running;
	Log_CreateTopic(TOPIC_NeedSteel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Running);
	B_LogEntry(TOPIC_NeedSteel,"Беннету нужно очень много стали. Порядка сотни болванок для изготовления новых доспехов наемникам. Если я помогу ему выполнить этот заказ и принесу ему сталь, он щедро отблагодарит меня.");
};

instance DIA_Bennet_NeedSteel_Done(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_NeedSteel_Done_condition;
	information = DIA_Bennet_NeedSteel_Done_info;
	permanent = FALSE;
	description = "Я достал для тебя сталь.";
};

func int DIA_Bennet_NeedSteel_Done_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_NeedSteel == LOG_Running) && (Npc_HasItems(hero,ItMiSwordraw) >= 100))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_NeedSteel_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_01");	//Я достал для тебя сталь.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_02");	//(недоверчиво) Неужели? Тогда давай ее сюда!
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ItMiSwordraw,100);
	Npc_RemoveInvItems(self,ItMiSwordraw,100);
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_04");	//Эй, эй... Не все сразу! Она же весит черт знает сколько.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_05");	//Ну как, этого будет достаточно?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_06");	//(переводя дыхание) Вполне! Мне кажется, что ты принес даже слишком много.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_07");	//Как ты и просил. Сотня болванок стали.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_08");	//Ладно. Сталь - такой товар, что всегда пригодится.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_09");	//А что там насчет твоей благодарности?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_10");	//Хех, думаешь я забыл об этом? Обижаешь, приятель!

	if((hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY]) && (hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_MANA_MAX]))
	{
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_11");	//Вот, держи этот меч в качестве своей награды.
		B_GiveInvItems(self,other,ItMw_Drachen_Sword_02,1);
		AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_12");	//Что? Просто обычный меч?
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_13");	//(возмущенно) Это не просто меч! Такого ты не сыщешь на всем белом свете!
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_14");	//Я ковал его около года по особенному чертежу, купленному у одного торговца в Монтере за бешеные деньги.
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_15");	//(гордо) Но поверь, оно того стоило! Меч получился легким, прочным и смертоносным.
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_16");	//Правда, я ни разу так и не достал его из ножен. Уж не представился случай.
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_17");	//Но ты, я думаю, по достоинству оценишь все его качества.
		AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_18");	//Ладно, поглядим.
		MIS_NeedSteel = LOG_Success;
		Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Success);
		B_LogEntry(TOPIC_NeedSteel,"Я принес Беннету сталь, а он за это дал мне лучший из своих мечей.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_19");	//Вот, держи это золото в качестве своей награды.
		B_GiveInvItems(self,other,ItMi_Gold,2000);
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_20");	//Думаю, ты наверняка найдешь ему применение.
		MIS_NeedSteel = LOG_Success;
		Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Success);
		B_LogEntry(TOPIC_NeedSteel,"Я принес Беннету сталь.");
	};
};

instance DIA_Bennet_DoCrossBow(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_DoCrossBow_condition;
	information = DIA_Bennet_DoCrossBow_info;
	permanent = FALSE;
	description = "Ты умеешь делать арбалеты?";
};

func int DIA_Bennet_DoCrossBow_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bennet_DoCrossBow_01_01");	//Ты умеешь делать арбалеты?
	AI_Output(self,other,"DIA_Bennet_DoCrossBow_01_02");	//Арбалеты? Нет, приятель.
	AI_Output(self,other,"DIA_Bennet_DoCrossBow_01_03");	//Хороший плотник или столяр - вот кто тебе нужен.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Делать арбалеты меня может научить только плотник или столяр. Где же мне найти такого?");
};

instance DIA_Bennet_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Done_Condition;
	information = DIA_Bennet_BetterArmor_Done_Info;
	permanent = FALSE;
	description = "У меня есть все, что ты просил.";
};

func int DIA_Bennet_BetterArmor_Done_Condition()
{
	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 50) && (Npc_HasItems(other,ItAt_XragonSkull) >= 4) && (Npc_HasItems(other,ItMi_Nugget) >= 20) && (Npc_HasItems(other,ItMi_Sulfur) >= 10) && (Npc_HasItems(other,ItMi_Pitch) >= 2) && (Npc_HasItems(other,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_00");	//У меня есть все, что ты просил.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItAt_DragonScale,50);
	Npc_RemoveInvItems(hero,ItAt_XragonSkull,4);
	Npc_RemoveInvItems(hero,ItMi_Nugget,20);
	Npc_RemoveInvItems(hero,ItMi_Pitch,2);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);

	if(Trophy_DragonSkull  == TRUE)
	{
		if(Npc_HasItems(other,ItAt_XragonSkull) == FALSE)
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_DragonSkull,Npc_HasItems(other,ItUt_DragonSkull));
			Trophy_DragonSkull  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_01");	//Хорошо. Тогда я немедленно принимаюсь за работу.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_02");	//Сколько времени тебе надо, чтобы их изготовить?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_03");	//Трудно сказать. Но я дам тебе знать, как только они будут готовы.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Хорошо.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor,"Я отдал Беннету все необходимые материалы для доспехов и он немедленно принялся за работу. Правда, он не знает, сколько времени займет их изготовление.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Finish_Condition;
	information = DIA_Bennet_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_BetterArmor_Finish_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_00");	//Насчет твоих доспехов...(устало) Они готовы!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_01");	//Вот, возьми их. Они надежно защитят тебя от любого врага.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor,"Беннет выковал доспехи и отдал их мне.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_DarkWeb(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_DarkWeb_Condition;
	information = DIA_Bennet_DarkWeb_Info;
	permanent = FALSE;
	description = "У меня есть к тебе один вопрос.";
};

func int DIA_Bennet_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(other,DIA_Bennet_ThankYou) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DarkWeb_Info()
{
	AI_Output(other,self,"DIA_Bennet_DarkWeb_01_00");	//У меня есть к тебе один вопрос.
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_01");	//Спрашивай, если есть.
	AI_Output(other,self,"DIA_Bennet_DarkWeb_01_02");	//С кем ты был в городе, когда тебя арестовали?
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_03");	//С Ходжесом, моим помощником.
	AI_Output(other,self,"DIA_Bennet_DarkWeb_01_04");	//А где был Ходжес на момент твоего задержания?
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_05");	//Этого я не знаю. Когда мы закончили свои дела, он сказал, что хочет промочить горло в таверне Корагона.
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_06");	//Туда он и отправился, как я понимаю. Об остальном мне не известно.
	B_LogEntry(TOPIC_DarkWeb,"Человеком, с которым Беннет ходил в город, оказался Ходжес, его помощник. Надо будет расспросить того о случившемся.");
	HodjesTalk = TRUE;
};