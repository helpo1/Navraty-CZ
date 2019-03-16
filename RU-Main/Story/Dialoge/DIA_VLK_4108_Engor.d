
instance DIA_Engor_EXIT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 999;
	condition = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Engor_HALLO(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_HALLO_Condition;
	information = DIA_Engor_HALLO_Info;
	important = TRUE;
};


func int DIA_Engor_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Engor_HALLO_Info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//А, ты тот парень, которому удалось пройти через Проход?
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Да.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Отлично! Я Энгор - я обеспечиваю эту экспедицию.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Только не думай, что можешь получить от меня что-нибудь бесплатно!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Но если в твоих карманах позванивает золото, мы всегда договоримся.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Энгор заведует припасами замка и ведет небольшой бизнес на стороне.");
};


instance DIA_Engor_HANDELN(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 10;
	condition = DIA_Engor_HANDELN_Condition;
	information = DIA_Engor_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Engor_HANDELN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_HALLO))
	{
		return TRUE;
	};
};


var int engorarrowsday;

func void DIA_Engor_HANDELN_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	daynow = Wld_GetDay();

	if(ENGORARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (ENGORARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - ENGORARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			ENGORARROWSDAY = daynow;
		};
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};
	if(Npc_HasItems(self,itpo_stamina) != 5)
	{
		Npc_RemoveInvItems(self,itpo_stamina,Npc_HasItems(self,itpo_stamina));
		CreateInvItems(self,itpo_stamina,5);
	};

	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};


instance DIA_Engor_ABOUTPARLAF(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_ABOUTPARLAF_Condition;
	information = DIA_Engor_ABOUTPARLAF_Info;
	description = "Ты распределяешь пайки, как я слышал?";
};


func int DIA_Engor_ABOUTPARLAF_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_ENGOR))
	{
		return TRUE;
	};
};

func void DIA_Engor_ABOUTPARLAF_Info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Ты распределяешь пайки, как я слышал?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//Это так. А что? Мне теперь и тебя кормить придется?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Если тебе что-то нужно, тебе придется платить за это - как и всем остальным.
};

instance DIA_Engor_HELP(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 3;
	condition = DIA_Engor_HELP_Condition;
	information = DIA_Engor_HELP_Info;
	description = "Может, я смогу помочь тебе в твоей работе?";
};

func int DIA_Engor_HELP_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_ABOUTPARLAF))
	{
		return TRUE;
	};
};

func void DIA_Engor_HELP_Info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Может, я смогу помочь тебе в твоей работе?
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Хмм... Конечно, почему нет? Мне не помешала бы помощь.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Так что нужно сделать?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Наши запасы продовольствия на исходе. Хуже всего, что у нас почти не осталось мяса.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Так что если сможешь раздобыть мясо, сырое или приготовленное, окорока или колбасу, я был бы очень благодарен. Ну, как? Ты поможешь нам?
	Info_ClearChoices(DIA_Engor_HELP);
	Info_AddChoice(DIA_Engor_HELP,"У меня нет времени на это.",DIA_Engor_HELP_NO);
	Info_AddChoice(DIA_Engor_HELP,"Не волнуйся, я принесу тебе мясо.",DIA_Engor_HELP_YES);
};

func void DIA_Engor_HELP_NO()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Тогда зачем ты тратишь мое время попусту?
	MIS_Engor_BringMeat = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void DIA_Engor_HELP_YES()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Не волнуйся, я принесу тебе мясо.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Две дюжины кусков хватило бы, чтобы накормить все эти голодные рты. Возвращайся, когда у тебя будет это мясо. А мне нужно работать.
	Log_CreateTopic(TOPIC_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_BringMeat,"Энгору нужно две дюжины кусков мяса, чтобы накормить людей в замке. Неважно, что это будет - колбаса, окорок, сырое или жареное мясо. Что угодно, лишь бы это можно было жевать.");
	MIS_Engor_BringMeat = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Engor_BRINGMEAT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 4;
	condition = DIA_Engor_BRINGMEAT_Condition;
	information = DIA_Engor_BRINGMEAT_Info;
	permanent = TRUE;
	description = "Вот, я принес тебе кое-что.";
};


func int DIA_Engor_BRINGMEAT_Condition()
{
	if((MIS_Engor_BringMeat == LOG_Running) && (Meat_Counter < Meat_Amount) && ((Npc_HasItems(hero,ItFo_Bacon) >= 1) || (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) || (Npc_HasItems(hero,ItFoMutton) >= 1) || (Npc_HasItems(hero,ItFo_Sausage) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Engor_BRINGMEAT_Info()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	var string GesamtFleisch;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Вот, я принес тебе кое-что.
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMuttonRaw) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMuttonRaw,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMuttonRaw) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMuttonRaw);
			ConcatRaw = IntToString(Npc_HasItems(other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings(ConcatRaw,"Сырое мясо передано");
			AI_Print(ConcatRaw);
			Npc_RemoveInvItems(other,ItFoMuttonRaw,Npc_HasItems(other,ItFoMuttonRaw));
		};
	};
	if(Npc_HasItems(hero,ItFoMutton) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMutton) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMutton,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMutton) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMutton);
			ConcatMutton = IntToString(Npc_HasItems(other,ItFoMutton));
			ConcatMutton = ConcatStrings(ConcatMutton,"Поджаренное мясо дано");
			AI_Print(ConcatMutton);
			Npc_RemoveInvItems(other,ItFoMutton,Npc_HasItems(other,ItFoMutton));
		};
	};
	if(Npc_HasItems(hero,ItFo_Bacon) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Bacon) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Bacon,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Bacon) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Bacon);
			ConcatBacon = IntToString(Npc_HasItems(other,ItFo_Bacon));
			ConcatBacon = ConcatStrings(ConcatBacon,"Ветчина дана");
			AI_Print(ConcatBacon);
			Npc_RemoveInvItems(other,ItFo_Bacon,Npc_HasItems(other,ItFo_Bacon));
		};
	};
	if(Npc_HasItems(hero,ItFo_Sausage) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Sausage) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Sausage,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Sausage) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Sausage);
			ConcatSausage = IntToString(Npc_HasItems(other,ItFo_Sausage));
			ConcatSausage = ConcatStrings(ConcatSausage,"отдать Колбасу");
			AI_Print(ConcatSausage);
			Npc_RemoveInvItems(other,ItFo_Sausage,Npc_HasItems(other,ItFo_Sausage));
		};
	};
	if(Meat_Amount > Meat_Counter)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Для начала и это неплохо, но мне нужно больше.
		GesamtFleisch = IntToString(Meat_Counter);
		GesamtFleisch = ConcatStrings("всего мяса отдано:",GesamtFleisch);
		AI_Print(GesamtFleisch);
	};
	if(Meat_Counter >= Meat_Amount)
	{
		B_GivePlayerXP(XP_BringMeat);
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Отлично, ты принес достаточно мяса. Этого хватит на некоторое время.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Но даже не надейся, что я теперь буду давать тебе что-нибудь бесплатно!
		MIS_Engor_BringMeat = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BringMeat,LOG_SUCCESS);
		B_LogEntry(TOPIC_BringMeat,"Энгор получил свое мясо. Он разделит его между защитниками замка.");
	};
};


instance DIA_Engor_Business(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_Business_Condition;
	information = DIA_Engor_Business_Info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int DIA_Engor_Business_Condition()
{
	if((Kapitel >= 4) && (MIS_Engor_BringMeat == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Engor_Business_Info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//Как бизнес?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//Неважно. Я надеюсь, что хотя бы у этих охотников на драконов есть какое-нибудь золото.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Паршиво! Паладины ничего не покупают.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//А как насчет тебя? Ты хочешь что-нибудь купить?
};

instance DIA_Engor_StoreKey(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_StoreKey_Condition;
	information = DIA_Engor_StoreKey_Info;
	permanent = FALSE;
	description = "У меня тут твой ключ.";
};

func int DIA_Engor_StoreKey_Condition()
{
	if(Npc_HasItems(hero,ItKe_OC_Store) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Engor_StoreKey_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Engor_StoreKey_01_00");	//У меня тут твой ключ.
	AI_Output(self,other,"DIA_Engor_StoreKey_01_01");	//Тебе что, удалось найти его?!
	AI_Output(other,self,"DIA_Engor_StoreKey_01_02");	//Угадал! Вот, возьми его и постарайся больше не терять.
	B_GiveInvItems(other,self,ItKe_OC_Store,1);
	Npc_RemoveInvItems(self,ItKe_OC_Store,1);
	AI_Output(self,other,"DIA_Engor_StoreKey_01_03");	//Спасибо тебе, приятель! Ты и представить себе не можешь, как сильно меня выручил.
	AI_Output(self,other,"DIA_Engor_StoreKey_01_04");	//А то Гаронд мне уже всю плешь проел из-за этого ключа.
	AI_Output(self,other,"DIA_Engor_StoreKey_01_05");	//Ну да ладно, прими эти напитки в благодарность за оказанную помощь. Нехитрая награда, но не отпускать же тебя с пустыми руками.
	B_GiveInvItems(self,other,ItPo_Health_02,3);
};

instance DIA_Engor_Ruestung(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_Ruestung_Condition;
	information = DIA_Engor_Ruestung_Info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь интересное для меня?";
};

func int DIA_Engor_Ruestung_Condition()
{
	if((other.guild == GIL_MIL) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Engor_Ruestung_Info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//У тебя есть что-нибудь интересное для меня?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//Я могу продать тебе хорошие доспехи оруженосца паладинов. Если, конечно, тебе это интересно.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Они недешевы, конечно же. Но если у тебя есть золото, ты получишь их.
};

instance DIA_Engor_RSkaufen(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_RSkaufen_Condition;
	information = DIA_Engor_RSkaufen_Info;
	permanent = TRUE;
	description = "Купить доспехи оруженосца паладинов. (Цена: 4000 монет)";
};

var int DIA_Engor_RSkaufen_perm;

func int DIA_Engor_RSkaufen_Condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,DIA_Engor_Ruestung) && (DIA_Engor_RSkaufen_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Engor_RSkaufen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,4000))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Дай мне доспехи.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Вот, держи, они надежно защитят тебя - это чертовски хорошие доспехи.
		B_GiveInvItems(self,other,ItAr_PAL_L,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Сначала принеси золото.
	};
};