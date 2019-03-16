
var int APP_CONSTANTINO_TR;

instance DIA_Constantino_EXIT(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 999;
	condition = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Constantino_PICKPOCKET(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 900;
	condition = DIA_Constantino_PICKPOCKET_Condition;
	information = DIA_Constantino_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Constantino_PICKPOCKET_Condition()
{
	return C_Beklauen(59,90);
};

func void DIA_Constantino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,Dialog_Back,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

var int FirstTalkConstantino;

instance DIA_Constantino_NoTalkAtAll(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_NoTalkAtAll_Condition;
	information = DIA_Constantino_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Constantino_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NoTalkAtAll_Info()
{
	if(FirstTalkConstantino == FALSE)
	{
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_00");	//Эй, тебе здесь нечего делать.
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_01");	//Убирайся!
		FirstTalkConstantino = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_02");	//Я сказал, вон!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Constantino_Hallo(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Constantino_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Что тебе нужно? Я не подаю милостыню.
};


instance DIA_Constantino_AboutLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent = FALSE;
	description = "Я хочу поступить в ученики.";
};

func int DIA_Constantino_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Constantino_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Я хочу поступить в ученики.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Правда? И чьим учеником ты хочешь стать?
};

instance DIA_Constantino_Heilung(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent = FALSE;
	description = "Мне нужно лечение.";
};

func int DIA_Constantino_Heilung_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Мне нужно лечение.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(коротко) Зачем, ты ранен?
	Info_ClearChoices(DIA_Constantino_Heilung);
	Info_AddChoice(DIA_Constantino_Heilung,"В общем-то, нет.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice(DIA_Constantino_Heilung,"Да.",DIA_Constantino_Heilung_Ja);
};

func void DIA_Constantino_Heilung_Ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Да.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Тогда иди к Ватрасу, он подлечит тебя. И перестань капать кровью на мой пол!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//У тебя всего лишь пустяковая царапина, а у меня есть дела поважнее, чем болтать с тобой.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Constantino_Heilung_Nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//В общем-то, нет.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Тогда проваливай, а то тебе действительно понадобится медицинская помощь.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Constantino_LestersKraeuter(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Addon_Constantino_LestersKraeuter_Condition;
	information = DIA_Addon_Constantino_LestersKraeuter_Info;
	description = "Ты покупаешь травы?";
};


func int DIA_Addon_Constantino_LestersKraeuter_Condition()
{
	if((MIS_Constantino_BringHerbs == 0) && (MIS_Addon_Lester_PickForConstantino != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Ты покупаешь травы?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Ну, если тебе есть, что предложить...
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Constantino_Trade(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 700;
	condition = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};

func int DIA_Constantino_Trade_Condition()
{
	if(Wld_IsTime(8,0,13,0) || Wld_IsTime(16,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Покажи мне свои товары.

	if(Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Константино продает алхимические товары.");
		Constantino_Logpatch1 = TRUE;
	};
	if((Player_IsApprentice == APP_Constantino) && (APP_CONSTANTINO_TR == FALSE))
	{
		CreateInvItems(self,ItPl_Dex_Herb_01,1);
		CreateInvItems(self,ItPl_Strength_Herb_01,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,10);
		CreateInvItems(self,ItPl_Blueplant,15);
		CreateInvItems(self,ItPl_Perm_Herb,1);
		APP_CONSTANTINO_TR = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) >= 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	CreateInvItems(self,ItMi_Flask,5);
	B_GiveTradeInv(self);
};


instance DIA_Constantino_BeiDir(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent = FALSE;
	description = "Я хочу стать твоим учеником.";
};


func int DIA_Constantino_BeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BeiDir_Info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Я хочу стать твоим учеником.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//МОИМ? Нет! Я уже как-то имел сомнительное удовольствие взять ученика. С меня достаточно.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Я потратил несколько лет на его обучение, а потом этот идиот взял и отравился.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Иди лучше попросись в ученики к другому мастеру!
};


instance DIA_Constantino_ZUSTIMMUNG(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Я хочу стать учеником одного из других мастеров.";
};


func int DIA_Constantino_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Я хочу стать учеником одного из других мастеров.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Ты пришел получить мое одобрение?

	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Хм - что касается моего мнения, ты можешь стать учеником любого мастера.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//Ты его не получишь! То, что я слышал о тебе, говорит не в твою пользу.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Я не проголосую за то, чтобы преступник вроде тебя занял уважаемое положение в этом городе.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Пока ты не уладишь этот вопрос с командующим городской стражей, мой ответ будет - нет!
	};
	if(Constantino_Logpatch2 == FALSE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling,"Константино даст мне свое одобрение, если я не обвиняюсь ни в одном преступлении в городе.");
		Constantino_Logpatch2 = TRUE;
		B_GivePlayerXP(50);
	};
};


instance DIA_Constantino_BringHerbs(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent = FALSE;
	description = "Что мне нужно сделать, чтобы стать ТВОИМ учеником?";
};


func int DIA_Constantino_BringHerbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_BeiDir) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BringHerbs_Info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Что мне нужно сделать, чтобы стать ТВОИМ учеником?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(вздыхает) Я не вынесу, если ЕЩЕ ОДИН дилетант окажется на моей совести.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//В алхимии используется множество трав. В различных комбинациях они дают самые различные эффекты.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Вероятно, о половине этих трав ты даже не слышал.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(вздыхает) Вот - это список самых важных растений.
	B_GiveInvItems(self,other,ItWr_Kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Принеси мне одно растение каждого вида, и, возможно, я переменю свое мнение насчет ученика.
	MIS_Constantino_BringHerbs = LOG_Running;
	Log_CreateTopic(TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ConstantinoPlants,LOG_Running);
	B_LogEntry(TOPIC_ConstantinoPlants,"Константино хочет получить по одному экземпляру каждого растения, иначе он не примет меня в ученики.");
};

instance DIA_Constantino_LostKey(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LostKey_Condition;
	information = DIA_Constantino_LostKey_Info;
	permanent = FALSE;
	description = "Ты выглядишь немного расстроенным.";
};

func int DIA_Constantino_LostKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Constantino_LestersKraeuter) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_LostKey_Info()
{
	AI_Output(other,self,"DIA_Constantino_LostKey_01_01");	//Ты выглядишь немного расстроенным.
	AI_Output(self,other,"DIA_Constantino_LostKey_01_02");	//Еще бы...(ворчливо) Есть от чего!
	AI_Output(other,self,"DIA_Constantino_LostKey_01_03");	//А что у случилось?
	AI_Output(self,other,"DIA_Constantino_LostKey_01_04");	//Эх...(чешет затылок) Во время своей последней прогулки за город я как-то умудрился потерять свой ключ от сундука. И теперь вот даже не знаю, что делать.
	AI_Output(other,self,"DIA_Constantino_LostKey_01_06");	//Ну, может быть, тебе поможет Торбен? Он вроде как разбирается замках.
	AI_Output(self,other,"DIA_Constantino_LostKey_01_07");	//Я его уже спрашивал об этом. Но он только покачал головой и сказал, что вряд ли мне сможет помочь.
	AI_Output(other,self,"DIA_Constantino_LostKey_01_08");	//А где ты прогуливался в последний раз?
	AI_Output(self,other,"DIA_Constantino_LostKey_01_09");	//Это не твое дело, мальчик...(ворчливо) Тем более я уже там искал! Но ключа все равно не нашел.
	MIS_Constantino_LostKey = LOG_Running;
	Log_CreateTopic(TOPIC_Constantino_LostKey,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Constantino_LostKey,LOG_Running);
	B_LogEntry(TOPIC_Constantino_LostKey,"Во время своей прогулки за город Константино потерял ключ от сундука. Правда он не сказал, где был тогда.");
};

instance DIA_Constantino_LostKeyDone(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LostKeyDone_Condition;
	information = DIA_Constantino_LostKeyDone_Info;
	permanent = FALSE;
	description = "Я нашел твой ключ.";
};

func int DIA_Constantino_LostKeyDone_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (Npc_HasItems(other,ItKe_Constantino) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LostKeyDone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_01");	//Я нашел твой ключ.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_02");	//Неужели?!
	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_03");	//Вот, смотри.
	B_GiveInvItems(other,self,ItKe_Constantino,1);
	Npc_RemoveInvItems(self,ItKe_Constantino,1);
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_04");	//Да, это он...(подозрительно) И где же ты его нашел?
	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_05");	//На опушке неподалеку от восточных ворот города.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_06");	//(посмеиваясь) Да, там ты его вполне мог найти. Что ж, тогда мне стоит тебя отблагодарить за помощь.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_08");	//Вот, держи этот напиток. Подобные вещи ценятся куда дороже золота. Надеюсь, что ты понимаешь это.

	if((Player_IsApprentice == APP_Constantino) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
	{
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		if(other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH])
		{
			B_GiveInvItems(self,other,ItPo_Perm_Dex,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItPo_Perm_Str,1);
		};
	};

	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_11");	//Конечно.
	MIS_Constantino_LostKey = LOG_Success;
	Log_SetTopicStatus(TOPIC_Constantino_LostKey,LOG_Success);
	B_LogEntry(TOPIC_Constantino_LostKey,"Я вернул Константино его ключ.");
};

instance DIA_Constantino_HerbsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent = TRUE;
	description = "Насчет растений...";
};

func int DIA_Constantino_HerbsRunning_Condition()
{
	if(MIS_Constantino_BringHerbs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_HerbsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Насчет растений...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Если ты не можешь выполнить это задание самостоятельно, из тебя не получится хорошего алхимика!
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
	Info_AddChoice(DIA_Constantino_HerbsRunning,"Понимаю.",DIA_Constantino_HerbsRunning_Running);
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Temp_Herb) > 0) && (Npc_HasItems(other,ItPl_Perm_Herb) > 0))
	{
		Info_AddChoice(DIA_Constantino_HerbsRunning,"Я принес все растения, что ты просил!",DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Я принес все растения, что ты просил!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Что? Ты пытаешься обмануть меня, да?
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Npc_RemoveInvItems(other,ItWr_Kraeuterliste,1);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//Клянусь Аданосом! Они все здесь, у меня перед глазами!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Кто знает, может, когда-нибудь из тебя действительно получится приличный алхимик.
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Constantino_Herbs);
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Константино примет меня в ученики, если другие мастера будут не против.");
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Понимаю.
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};


var int Constantino_StartGuild;

instance DIA_Constantino_LEHRLING(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent = TRUE;
	description = "Могу я теперь стать твоим учеником?";
};

func int DIA_Constantino_LEHRLING_Condition()
{
	if((MIS_Constantino_BringHerbs == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Могу я теперь стать твоим учеником?

	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Что касается моего мнения - да.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Хараду важно только, чтобы ты был способен защищать город в случае нападения орков.
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//И, похоже, ты смог убедить его в этом.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Но он считает, что ты трус.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Но Харад утверждает, что никогда тебя не видел.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Боспер очень неохотно отзывался о твоих способностях.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Я полагаю, что он хотел бы взять тебя в ученики сам.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Но все же, в конце концов, он согласился.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Отказывать кому-либо в одобрении по этой причине, определенно, недостойно настоящего мастера!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Но если все другие мастера согласятся, тебе не понадобится его голос.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//И Боспер пока тебя не видел.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Торбен - очень религиозный человек.
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Он дал тебе свое благословение. Это хороший знак.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Он даст свое одобрение только с благословения богов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Торбен не знает, кто ты такой.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//Что касается Маттео - он расхваливает тебя на каждом углу.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Маттео говорит, что ты что-то должен ему. Если ты хочешь получить его голос, тебе лучше решить с ним эту мелкую проблему.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Маттео говорит, что еще не разговаривал с тобой по этому поводу.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Маттео говорит, что никогда не видел тебя в своей лавке.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Теперь у тебя есть одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Ты готов приступить к обучению у меня?
			Info_ClearChoices(DIA_Constantino_LEHRLING);
			Info_AddChoice(DIA_Constantino_LEHRLING,"Мне нужно сначала подумать.",DIA_Constantino_LEHRLING_Later);
			Info_AddChoice(DIA_Constantino_LEHRLING,"Да, мастер.",DIA_Constantino_LEHRLING_Yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Чтобы стать учеником в нижней части города, тебе нужно получить одобрение, по крайней мере, четырех мастеров.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Это означает, что ты должен поговорить со всеми, кто еще не отдал за тебя свой голос.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(сердито) Ни за что! До меня дошли слухи, что ты обвиняешься в преступлении здесь, в Хоринисе!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Я не возьму тебя в ученики, пока ты не уладишь этот вопрос с командующим городской стражи.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	B_GivePlayerXP(XP_Lehrling);
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Да, мастер.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(вздыхает) Хорошо! Надеюсь, я не пожалею об этом решении.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//С этого момента можешь считать себя моим учеником.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_05");	//Вот, возьми эту одежду - мой подмастерье должен выглядеть опрятно.
	B_GiveInvItems(self,other,itar_alchemy_nov,1);
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_06");	//Получше, чем те лохмотья, что на тебе одеты.
	Player_IsApprentice = APP_Constantino;
	TalentCount_Alchemy[0] += 5;
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,10);
	Npc_ExchangeRoutine(Lothar,"START");
	Constantino_StartGuild = other.guild;
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry_Quiet(Topic_Bonus,"Константино взял меня к себе в ученики. Теперь я смогу попасть в верхний район города.");
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_03");	//И вот еще что. В знак того, что теперь ты мой ученик, я могу тебя бесплатно обучить приготовлению некоторых зелий. Но только одному.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_04");	//Итак, выбор за тобой. Приготовлению какого зелья тебя обучить?
	Info_ClearChoices(DIA_Constantino_LEHRLING);

	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING,"Лечебная эссенция.",dia_constantino_lehrling_heal);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING,"Эссенция маны.",dia_constantino_lehrling_mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING,"Напиток ускорения.",dia_constantino_lehrling_speed);
	};
};

func void dia_constantino_lehrling_heal()
{
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Хорошо. Сначала основы.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Все зелья делаются из растений - они обладают различной силой.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Растения пускают всю свою силу в рост, а алхимия занимается изменением этой силы и направлением ее в нужное русло.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка и спирт.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Ты должен знать правильную формулу и иметь соответствующие ингредиенты.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Я могу научить тебя многим таким формулам.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Готовить зелья, восстанавливающие твою потерянную силу, и даже зелья, которые воздействуют на твою силу перманентно.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Но нельзя выучить все сразу.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Константино может научить меня искусству алхимии.");

	if(b_teachplayertalentalchemy_free(self,other,POTION_Health_01))
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_00");	//Эссенция лечения - простейший из магических напитков.
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_01");	//Составляющие для эссенции лечения - это лечебное растение и серафис.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void dia_constantino_lehrling_mana()
{
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Хорошо. Сначала основы.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Все зелья делаются из растений - они обладают различной силой.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Растения пускают всю свою силу в рост, а алхимия занимается изменением этой силы и направлением ее в нужное русло.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Ты должен знать правильную формулу и иметь соответствующие ингредиенты.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Я могу научить тебя многим таким формулам.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Готовить зелья, восстанавливающие твою потерянную силу, и даже зелья, которые воздействуют на твою силу перманентно.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Но нельзя выучить все сразу.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Константино может научить меня искусству алхимии.");

	if(b_teachplayertalentalchemy_free(self,other,POTION_Mana_01))
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_02");	//Волшебная эссенция - простейший из магических напитков.
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_03");	//Составляющие для волшебной эссенции - это огненная крапива и луговой горец.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void dia_constantino_lehrling_speed()
{
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Хорошо. Сначала основы.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Все зелья делаются из растений - они обладают различной силой.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Растения пускают всю свою силу в рост, а алхимия занимается изменением этой силы и направлением ее в нужное русло.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Ты должен знать правильную формулу и иметь соответствующие ингредиенты.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Я могу научить тебя многим таким формулам.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Готовить зелья, восстанавливающие твою потерянную силу, и даже зелья, которые воздействуют на твою силу перманентно.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Но нельзя выучить все сразу.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Константино может научить меня искусству алхимии.");

	if(b_teachplayertalentalchemy_free(self,other,POTION_Speed))
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_04");	//Напиток ускорения - простейший из магических напитков.
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_05");	//Составляющие для напитка ускорения - это трава снеппера и луговой горец.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Мне нужно сначала подумать.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//Хорошо! Если ты не сможешь отдать этому делу свое сердце, тебе лучше выбрать другую профессию.
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

var int Constantino_MILKommentar;
var int Constantino_INNOSKommentar;
var int Constantino_KDWKommentar;
var int Constantino_SEKKommentar;
var int Constantino_KDMKommentar;

instance DIA_Constantino_AlsLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Constantino_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Constantino) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Constantino_AlsLehrling_Info()
{
	if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(сердито) Я отказываюсь обучать тебя, пока ты обвиняешься в преступлении в городе.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Иди к лорду Андрэ и уладь этот вопрос с ним.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (Constantino_StartGuild != GIL_MIL) && (Constantino_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Так ты поступил в ополчение? Я уже слышал об этом.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Ты так торопился стать учеником, а затем вот так просто взял и поступил в ополчение? Но я не стану делать тебе скидку на это.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Я ожидаю, что ты будешь строго придерживаться нашего соглашения, и будешь регулярно приносить мне растения и грибы.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//Если это слишком тяжело для тебя - работать на двух работах одновременно, тебе просто придется меньше спать!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (Constantino_StartGuild != GIL_NOV) && (Constantino_StartGuild != GIL_KDF) && (Constantino_StartGuild != GIL_PAL) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Я вижу, ты поступил в услужение к Инносу. Я полагаю, это значит, что с этого времени ты не сможешь уделять много внимания сбору трав для старика.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Но все же, я сочту за большую честь поддерживать тебя на твоем пути.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//И если, несмотря на твои новые обязанности, ты найдешь время заниматься алхимией, ты всегда можешь рассчитывать на теплый прием здесь.
		Constantino_INNOSKommentar = TRUE;
	}
	else if((other.guild == GIL_KDW) && (Constantino_KDWKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_13");	//Круг последователей Аданоса очень узок, по крайней мере, на Хоринисе. Думаю, вхожие в него маги обладают редкими и ценными знаниями, в том числе, и в области алхимии (задумчиво).
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_14");	//(почерствев) Но не забывай, что ты все равно остаешься МОИМ учеником. Пусть теперь ты и повелитель водной стихии, но чураться поисков грибов не должен. 
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_15");	//И да, лесные кочки и торчащие корни, по слухам, легко преодолеваются магом, стоит лишь приподнять полы мантии.

		Constantino_KDWKommentar = TRUE;
	}
	else if((Constantino_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_16");	//Ты вступил в эту секту. Поверить не могу! Я считал, что мой ученик - это образчик здравомыслия. Считал...

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_17");	//Говорят, что сектанты строго тренируют своих стражей. Смотри, чтоб голову не отбили. Хотя, мозгов тебе должно хватать всего на две вещи: на то, чтоб таскать сюда грибы, и на то, чтоб не таскать сюда болотную траву! 
		};

		Constantino_SEKKommentar = TRUE;
	}
	else if((Constantino_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_18");	//Каждый алхимик когда-то баловался некромантией. Баловался, ты слышишь? Не заходи слишком далеко. И лучше не разгуливай в мантии, а то мало ли. Общество таких не чтит.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_19");	//Мне же, как и прежде, нужны грибы и мне не важно, кто их будет приносить, некромант или портовая куртизанка. Так что продолжай поиски.
		Constantino_KDMKommentar = TRUE;
	}
	else if((Constantino_Lehrling_Day <= (Wld_GetDay() - 4)) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Где ты пропадал?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Я ожидаю от моего ученика большего усердия. Это никуда не годится, что ты появляешься здесь раз в месяц!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Ты хотя бы принес мне грибы?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Опять ты...
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Constantino_Aufgaben(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent = FALSE;
	description = "Каковы мои задачи?";
};


func int DIA_Constantino_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Каковы мои задачи?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Я понимаю, что не могу ожидать от молодого человека, что он будет проводить дни напролет вместе со мной в этой каморке.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Время от времени ты должен приносить растения, которые мне необходимы. Взамен, я буду обучать тебя искусству алхимии.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Ты можешь покупать у меня пробирки. Но большинство ингредиентов, впрочем, тебе придется добывать самому.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//И я ожидаю, что ты будешь вести себя, как добропорядочный гражданин этого города.
};


instance DIA_Constantino_Mushrooms(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent = FALSE;
	description = "Какие растения я должен приносить?";
};


func int DIA_Constantino_Mushrooms_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Mushrooms_Info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Какие растения я должен приносить?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Я буду покупать все, что ты принесешь мне - и буду платить обычную цену.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Но что касается грибов, трав и некоторых охотничьих трофеев, то для них у меня особая цена.
	MIS_Constantino_Mushrooms = LOG_Running;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Я могу продавать грибы, травы, крылья, жало, клешни и мандибулы Константино по очень хорошей цене.");
};


instance DIA_Constantino_MushroomsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent = TRUE;
	description = "По поводу интересующих тебя вещей...";
};

func int DIA_Constantino_MushroomsRunning_Condition()
{
	if(MIS_Constantino_Mushrooms == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//По поводу интересующих тебя вещей...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Позже...",DIA_Constantino_MushroomsRunning_Later);

	if(Player_IsApprentice == APP_Constantino)
	{
		if((Npc_HasItems(other,ItPo_Perm_Stamina) > 0) || (Npc_HasItems(other,ItPo_Perm_Mana) > 0) || (Npc_HasItems(other,ItPo_Perm_Health) > 0) || (Npc_HasItems(other,ItPo_Perm_Dex) > 0) || (Npc_HasItems(other,ItPo_Perm_STR) > 0))
		{
			Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес магические эликсиры.",dia_constantino_mushroomsrunning_sell_perm_potion);
		};
		if((Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Temp_Herb) > 0) || (Npc_HasItems(other,ItPl_Perm_Herb) > 0) || (Npc_HasItems(other,ITPL_SUPER_HERB) > 0))
		{
			Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес редкие травы.",dia_constantino_mushroomsrunning_sell_rare_plants);
		};
	};
	if((Npc_HasItems(other,ItPl_Health_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес лечебные травы и растения.",dia_constantino_mushroomsrunning_sell_herb);
	};
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес огненную траву и крапиву.",dia_constantino_mushroomsrunning_sell_mana);
	};
	if((Npc_HasItems(other,ItAt_BugMandibles) > 0) || (Npc_HasItems(other,ItAt_CrawlerMandibles) > 0) || (Npc_HasItems(other,ItAt_SpiderMandibles) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес мандибулы.",dia_constantino_mushroomsrunning_sell_mand);
	};
	if(Npc_HasItems(other,ItAt_OreBugClaw) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес клешни.",dia_constantino_mushroomsrunning_sell_claz);
	};
	if(Npc_HasItems(other,ItAt_Wing) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес крылья шершней.",dia_constantino_mushroomsrunning_sell_w);
	};
	if(Npc_HasItems(other,ItAt_Sting) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес жала шершней.",dia_constantino_mushroomsrunning_sell_st);
	};
	if((Npc_HasItems(other,ItPl_Mushroom_01) > 0) || (Npc_HasItems(other,ItPl_Mushroom_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес несколько грибов.",dia_constantino_mushroomsrunning_sell_1);
	};
	if((Npc_HasItems(other,ItAt_StoneGolemHeart) > 0) || (Npc_HasItems(other,ItAt_FireGolemHeart) > 0) || (Npc_HasItems(other,ItAt_IceGolemHeart) > 0) || (Npc_HasItems(other,ITAT_SWAMPGOLEMHEART) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес несколько сердец големов.",dia_constantino_mushroomsrunning_sell_heart);
	};
	if(Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Почему эти грибы так важны?",DIA_Constantino_MushroomsRunning_Why);
	};
};

func void dia_constantino_mushroomsrunning_sell_perm_potion()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я собираюсь принести тебе их...",DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPo_Perm_STR) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Эликсир силы (Цена: 750 золота)",dia_constantino_mushroomsrunning_sell_STR);
	};
	if(Npc_HasItems(other,ItPo_Perm_Dex) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Эликсир ловкости (Цена: 750 золота)",dia_constantino_mushroomsrunning_sell_DEX);
	};
	if(Npc_HasItems(other,ItPo_Perm_Health) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Эликсир жизни (Цена: 1000 золота)",dia_constantino_mushroomsrunning_sell_Health);
	};
	if(Npc_HasItems(other,ItPo_Perm_Mana) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Эликсир духа (Цена: 1000 золота)",dia_constantino_mushroomsrunning_sell_Mans);
	};
	if(Npc_HasItems(other,ItPo_Perm_Stamina) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Эликсир выносливости (Цена: 500 золота)",dia_constantino_mushroomsrunning_sell_STA);
	};
};

func void dia_constantino_mushroomsrunning_sell_STR()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_DEX()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPo_Perm_Dex,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_Health()
{
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	Npc_RemoveInvItems(other,ItPo_Perm_Health,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_Mans()
{
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	Npc_RemoveInvItems(other,ItPo_Perm_Mana,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_STA()
{
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(other,ItPo_Perm_Stamina,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_rare_plants()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я собираюсь принести тебе их...",DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPl_Mana_Herb_03) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненный корень (Цена: 20 золота)",dia_constantino_mushroomsrunning_sell_ManaRoot);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_03) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебный корень (Цена: 30 золота)",dia_constantino_mushroomsrunning_sell_HealthRoot);
	};
	if(Npc_HasItems(other,ItPl_Dex_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ягода гоблина (Цена: 125 золота)",dia_constantino_mushroomsrunning_sell_DexHerb);
	};
	if(Npc_HasItems(other,ItPl_Strength_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Драконий корень (Цена: 250 золота)",dia_constantino_mushroomsrunning_sell_StrHerb);
	};
	if(Npc_HasItems(other,ItPl_Speed_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Трава глорха (Цена: 50 золота)",dia_constantino_mushroomsrunning_sell_SpeedHerb);
	};
	if(Npc_HasItems(other,ItPl_Temp_Herb) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Луговой горец (Цена: 10 золота)",dia_constantino_mushroomsrunning_sell_TempHerb);
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Царский щавель (Цена: 250 золота)",dia_constantino_mushroomsrunning_sell_PermHerb);
	};
	if(Npc_HasItems(other,ITPL_SUPER_HERB) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Вишня троллей (Цена: 250 золота)",dia_constantino_mushroomsrunning_sell_StaHerb);
	};
};

func void dia_constantino_mushroomsrunning_sell_ManaRoot()
{
	B_GiveInvItems(self,other,ItMi_Gold,20);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_HealthRoot()
{
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_DexHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,125);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_StrHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_SpeedHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_TempHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,10);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_PermHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_StaHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ITPL_SUPER_HERB,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я собираюсь принести тебе их...",DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPl_Health_Herb_02) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебную траву - 1 шт. (Цена: 30 золота)",dia_constantino_mushroomsrunning_sell_herb_2);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебную траву - 10 шт (Цена: 300 золота)",dia_constantino_mushroomsrunning_sell_herb_20);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебную траву - 50 шт (Цена: 1500 золота)",dia_constantino_mushroomsrunning_sell_herb_50);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебные растения - 1 шт.(Цена: 15 золота)",dia_constantino_mushroomsrunning_sell_herb_1);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебные растения - 10 шт. (Цена: 150 золота)",dia_constantino_mushroomsrunning_sell_herb_10);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Лечебные растения - 50 шт (Цена: 750 золота)",dia_constantino_mushroomsrunning_sell_herb_150);
	};
};

func void dia_constantino_mushroomsrunning_sell_herb_1()
{
	B_GiveInvItems(self,other,ItMi_Gold,15);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_10()
{
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_150()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_2()
{
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_20()
{
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_50()
{
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_heart()
{
	var int mand;

	mand = (Value_StoneGolemHeart * Npc_HasItems(other,ItAt_StoneGolemHeart)) + (VALUE_SWAMPGOLEMHEART * Npc_HasItems(other,ITAT_SWAMPGOLEMHEART)) + (Value_IceGolemHeart * Npc_HasItems(other,ItAt_IceGolemHeart)) + (Value_FireGolemHeart * Npc_HasItems(other,ItAt_FireGolemHeart));
	B_GiveInvItems(self,other,ItMi_Gold,mand);
	Npc_RemoveInvItems(other,ItAt_StoneGolemHeart,Npc_HasItems(other,ItAt_StoneGolemHeart));
	Npc_RemoveInvItems(other,ITAT_SWAMPGOLEMHEART,Npc_HasItems(other,ITAT_SWAMPGOLEMHEART));
	Npc_RemoveInvItems(other,ItAt_IceGolemHeart,Npc_HasItems(other,ItAt_IceGolemHeart));
	Npc_RemoveInvItems(other,ItAt_FireGolemHeart,Npc_HasItems(other,ItAt_FireGolemHeart));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mand()
{
	var int mand;
	var int mandsp;
	var int summmand;

	mand = Npc_HasItems(other,ItAt_BugMandibles) + Npc_HasItems(other,ItAt_CrawlerMandibles);
	mandsp = Npc_HasItems(other,ItAt_SpiderMandibles);
	summmand = (mand * 12) + (mandsp * 25);
	B_GiveInvItems(self,other,ItMi_Gold,summmand);
	Npc_RemoveInvItems(other,ItAt_BugMandibles,Npc_HasItems(other,ItAt_BugMandibles));
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,Npc_HasItems(other,ItAt_CrawlerMandibles));
	Npc_RemoveInvItems(other,ItAt_SpiderMandibles,Npc_HasItems(other,ItAt_SpiderMandibles));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_w()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Wing) * 15);
	Npc_RemoveInvItems(other,ItAt_Wing,Npc_HasItems(other,ItAt_Wing));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_claz()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_OreBugClaw) * 10);
	Npc_RemoveInvItems(other,ItAt_OreBugClaw,Npc_HasItems(other,ItAt_OreBugClaw));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_st()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Sting) * 20);
	Npc_RemoveInvItems(other,ItAt_Sting,Npc_HasItems(other,ItAt_Sting));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я собираюсь принести тебе их...",DIA_Constantino_MushroomsRunning_Later);
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненная трава - 1 шт (Цена: 15 золота)",dia_constantino_mushroomsrunning_sell_mana_2);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненная трава - 10 шт (Цена: 150 золота)",dia_constantino_mushroomsrunning_sell_mana_20);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненная трава - 50 шт (Цена: 750 золота)",dia_constantino_mushroomsrunning_sell_mana_60);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненная крапива - 1 шт (Цена: 7 золота)",dia_constantino_mushroomsrunning_sell_mana_1);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненная крапива - 10 шт (Цена: 70 золота)",dia_constantino_mushroomsrunning_sell_mana_10);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Огненная крапива - 50 шт (Цена: 350 золота)",dia_constantino_mushroomsrunning_sell_mana_50);
	};
};

func void dia_constantino_mushroomsrunning_sell_mana_1()
{
	B_GiveInvItems(self,other,ItMi_Gold,7);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_10()
{
	B_GiveInvItems(self,other,ItMi_Gold,70);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_50()
{
	B_GiveInvItems(self,other,ItMi_Gold,350);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_2()
{
	B_GiveInvItems(self,other,ItMi_Gold,15);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_20()
{
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_60()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_1()
{
	var int Dunkelpilz_dabei;
	Dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Я принес несколько черных грибов...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Ах! Это лучшие грибы! Отлично! Вот твое золото!
		Dunkelpilz_dabei = TRUE;
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_01) * 5);
		B_GiveInvItems(other,self,ItPl_Mushroom_01,Npc_HasItems(other,ItPl_Mushroom_01));
		Npc_RemoveInvItems(self,ItPl_Mushroom_01,Npc_HasItems(self,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if(Dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//А вот еще другие...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//У меня здесь несколько грибов!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Эти не так хороши, как черные грибы, но я все равно возьму их.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_02) * 10);
		B_GiveInvItems(other,self,ItPl_Mushroom_02,Npc_HasItems(other,ItPl_Mushroom_02));
		Npc_RemoveInvItems(self,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
	};
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Почему эти грибы так важны?

	if(Constantino_DunkelpilzCounter == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//Даже несмотря на то, что ты мой ученик, я не могу сказать тебе все.
	}
	else if(Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//Хорошо, я все же скажу тебе. Но ты должен сохранить это в тайне!
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Черные грибы полны магической энергии. И каждый раз, когда ты съедаешь такой гриб, немного этой энергии аккумулируется твоим телом.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//А когда ты съешь достаточное количество этих грибов, твоя магическая энергия возрастет.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//И если бы я сказал тебе это ранее, ты бы слопал все эти грибы сам. Разве нет?
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_06");	//Именно из-за этого, эти грибы представляют собой такую большую ценность для меня. Ты доволен ответом?!
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_08");   //Ты у меня уже это спрашивал!
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Я собираюсь принести тебе их...
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Отлично! Принеси мне все, что только найдешь...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

instance DIA_Constantino_Alchemy(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent = FALSE;
	description = "Обучи меня искусству алхимии!";
};

func int DIA_Constantino_Alchemy_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		if(Constantino_TeachAlchemy == TRUE)
		{
			return FALSE;
		};

		return TRUE;
	};
};

func void DIA_Constantino_Alchemy_Info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Обучи меня искусству алхимии!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Хорошо. Сначала основы.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Все зелья делаются из растений - они обладают различной силой.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Они не делают ничего, кроме того, что растут во всю силу, а искусство алхимии - изменить эту силу.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Ты должен знать правильную рецептуру и какие ингредиенты нужны.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Есть целый ряд рецептур, которым я тебя могу обучить.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Источники, которые вернут тебе утраченную силу и навсегда изменят твою теперешнюю мощь.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Ты не можешь выучить все сразу. Так что хорошенько подумай, чему хочешь научиться.

	if((MIS_MyBrew == FALSE) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_09");	//Однако прежде чем мы приступим к обучению, я хочу, чтобы ты кое-что для меня сделал.
		AI_Output(other,self,"DIA_Constantino_Alchemy_10_10");	//Что именно?
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_11");	//Ты должен будешь самостоятельно приготовить для меня одно несложное магическое зелье.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_12");	//Его состав довольно прост. Но сам эликсир имеет один очень интересный эффект. Вот, возьми этот рецепт.
		B_GiveInvItems(self,other,ItWr_ConstRecept,1);
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_14");	//Ну а как сваришь его, возвращайся ко мне, и мы сразу же начнем твое обучение искусству алхимии.
		MIS_MyBrew = LOG_Running;
		Log_CreateTopic(TOPIC_MyBrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyBrew,LOG_Running);
		B_LogEntry(TOPIC_MyBrew,"Константино обучит меня искусству алхимии, но прежде он хочет, чтобы я сам попробовал сварить одно зелье. Он дал мне рецепт с подробным описанием.");
	}
	else
	{
		Constantino_TeachAlchemy = TRUE;
	};
};

instance DIA_Constantino_NewRecipes(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent = FALSE;
	description = "Я хочу узнать новые рецепты зелий.";
};

func int DIA_Constantino_NewRecipes_Condition()
{
	if((Player_IsApprentice != APP_Constantino) && (Player_IsApprentice > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NewRecipes_Info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Я хочу узнать новые рецепты зелий.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//У тебя есть какой-нибудь опыт в алхимии?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Да, есть.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//И ты все еще жив... это неплохой знак.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Я думаю, что могу показать тебе несколько рецептов. Но это зависит, конечно же, от того, что ты хочешь узнать.

	if((MIS_MyBrew == FALSE) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_05");	//Однако прежде чем мы приступим к обучению, я хочу, чтобы ты кое-что для меня сделал.
		AI_Output(other,self,"DIA_Constantino_NewRecipes_10_06");	//Что именно?
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_07");	//Ты должен будешь самостоятельно приготовить для меня одно несложное магическое зелье.
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_08");	//Его состав довольно прост. Но сам эликсир имеет один очень интересный эффект. Вот, возьми этот рецепт.
		B_GiveInvItems(self,other,ItWr_ConstRecept,1);
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_10");	//Ну а как сваришь его, возвращайся ко мне, и мы сразу же начнем твое обучение искусству алхимии.
		MIS_MyBrew = LOG_Running;
		Log_CreateTopic(TOPIC_MyBrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyBrew,LOG_Running);
		B_LogEntry(TOPIC_MyBrew,"Константино обучит меня искусству алхимии, но прежде он хочет, чтобы я сам попробовал сварить одно зелье. Он дал мне рецепт с подробным описанием.");
	}
	else
	{
		Constantino_TeachAlchemy = TRUE;
	};
};

instance DIA_Constantino_TEACH(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent = TRUE;
	description = "Каким рецептам ты можешь обучить меня?";
};

func int DIA_Constantino_TEACH_Condition()
{
	if(Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_TEACH_Info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//Каким рецептам ты можешь обучить меня?

	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE) && (PLAYER_TALENT_ALCHEMY[18] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Извини! Я больше ничему не могу научить тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Есть несколько - выбирай.
		Info_ClearChoices(DIA_Constantino_TEACH);
		Info_AddChoice(DIA_Constantino_TEACH,Dialog_Back,DIA_Constantino_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Constantino_TEACH_Health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Constantino_TEACH_Health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Constantino_TEACH_Health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Constantino_TEACH_PermHealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Constantino_TEACH_Mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Constantino_TEACH_Mana02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир силы ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Constantino_TEACH_PermSTR);
	};
	if(PLAYER_TALENT_ALCHEMY[17] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Напиток выносливости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_STAMINA)),dia_constantino_teach_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир выносливости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),dia_constantino_teach_perm_stamina);
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Ингредиенты для лечебной эссенции - лечебные растения и серафис.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//Чтобы приготовить лечебный экстракт, тебе понадобятся лечебные травы и серафис.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//Кипятить этот экстракт нужно очень осторожно.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health03()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//Для создания лечебного эликсира требуется чуть больше опыта.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Тебе понадобятся лечебные корни и серафис. При кипячении этого зелья нужно быть особенно внимательным.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermHealth()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Эликсир жизни! Редкое варево. Но не из-за сложности приготовления - это зелье не так уж сложно сделать.
	};

	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Волшебная эссенция - простейший из магических напитков.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Возьми огненную крапиву и серафис и вскипяти их на медленном огне.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_speed()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Speed))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Speed_10_00");	//Напиток ускорения простейший из магических напитков.
		AI_Output(self,other,"DIA_Constantino_TEACH_Speed_10_01");	//Возьми траву снеппера и медленно ее нагрей.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Так как ты уже умеешь готовить эссенцию маны, если немного потренируешься, то сможешь готовить также и экстракт.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Единственно, нужно уделить особое внимание процессу выпаривания этого зелья. В качестве ингредиентов для него используются огненная трава и серафис.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermSTR()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Эликсир силы! Превосходное зелье. Для него тебе понадобятся редкий драконий корень и царский щавель.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//При кипячении этого зелья следи, чтобы пузырьки не стали слишком большими, иначе тебя будет ждать неприятный сюрприз!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_stamina()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_STAMINA))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Stamina_10_00");	//Напиток выносливости! Он поможет тебе снять твою усталость и восстановить силы.
		AI_Output(self,other,"DIA_Constantino_TEACH_Stamina_10_02");	//Доведи полученный тобою состав до кипения и охлади его до нужной температуры. Вот и весь секрет!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_perm_stamina()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Perm_Stamina_10_00");	//Эликсир выносливости - очень полезное зелье. Однако приготовить его будет не совсем просто.
		AI_Output(self,other,"DIA_Constantino_TEACH_Perm_Stamina_10_02");	//Основной секрет создания этого эликсира - это нужный момент, когда требуется снять раствор с огня.
		AI_Output(self,other,"DIA_Constantino_TEACH_Perm_Stamina_10_03");	//Упустишь его - и можешь начинать все сначала.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};


instance DIA_CONSTANTINO_RECEPTFORTYON(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_receptfortyon_condition;
	information = dia_constantino_receptfortyon_info;
	permanent = FALSE;
	description = "Я ищу рецепт одного зелья.";
};


func int dia_constantino_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_constantino_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_00");	//Я слышал, что существует зелье, способное воздействовать некоторым образом на сознание человека.
	AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_03");	//Ты что-нибудь знаешь о нем?
	if(Player_IsApprentice == APP_Constantino)
	{
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_04");	//А почему мой ученик интересуется вещами подобного рода?
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_06");	//Как начинающего алхимика, меня очень интересуют необычные эликсиры.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_07");	//(смеется) Что ж, твоя страсть к познанию секретов алхимии меня не может не радовать.
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_08");	//Расскажешь мне об этом зелье?
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_09");	//Хорошо. Да, я слышал про этот эликсир, и он действительно обладает рядом поистине необычных алхимических свойств.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_10");	//Воздействие на сознание - лишь одно из них. При этом каждое из этих свойств способно время от времени меняться непредсказуемым образом.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_11");	//Также еще надо отметить, что приготовление этого зелья - процесс довольно сложный, и справиться с этим сможет только очень опытный алхимик.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_12");	//Ко всему прочему, его состав включает в себя очень редкие ингредиенты.
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_13");	//А у тебя есть этот состав?
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_14");	//Нет. Я говорил, что слышал про этот эликсир, но не говорил, что обладаю его секретом.
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_15");	//А кто может знать, как приготовить это зелье?
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_16");	//Ходят слухи, что секретом приготовления этого эликсира владеют маги Огня.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_17");	//Однако, как ты сам понимаешь, это всего лишь слухи. Да и вряд ли маги согласятся поделиться с тобой этой тайной.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_20");	//Если вдруг ты все-таки сможешь достать рецепт этого эликсира - дай мне взглянуть на него.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_21");	//Естественно, за это я не останусь у тебя в долгу. Ну, в общем, сам понимаешь.
		KNOWABOUTRECEPTFORTYON = TRUE;
		CONSTANTINOWANTSRECEPTFORTYON = TRUE;
		B_LogEntry(TOPIC_RECEPTFORTYON,"Алхимик Константино рассказал мне, что рецепт этого эликсира может находиться у магов Огня. Ко всему прочему, он и сам был бы не прочь взглянуть на этот рецепт.");
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_23");	//Понятия не имею, о чем ты.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_24");	//Вместо того, чтобы приставать ко мне со странными вопросами, шел бы лучше и сделал что-нибудь полезное!
	};
};


instance DIA_CONSTANTINO_GOTRECEPTFORTYON(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_gotreceptfortyon_condition;
	information = dia_constantino_gotreceptfortyon_info;
	permanent = FALSE;
	description = "У меня есть тот самый рецепт.";
};


func int dia_constantino_gotreceptfortyon_condition()
{
	if((Npc_HasItems(other,itwr_tyonrecept) >= 1) && (CONSTANTINOWANTSRECEPTFORTYON == TRUE))
	{
		return TRUE;
	};
};

func void dia_constantino_gotreceptfortyon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Constantino_GotReceptForTyon_01_01");	//У меня есть тот самый рецепт.
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_02");	//Неужели? Покажи.
	B_GiveInvItems(other,self,itwr_tyonrecept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_03");	//Потрясающе! Никогда не думал, что я когда-либо смогу заполучить его!
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_07");	//Вот - возьми это в качестве награды за твои труды. Думаю, этого вполне хватит.
	B_GiveInvItems(self,other,ItPl_Perm_Herb,2);
	AI_Output(other,self,"DIA_Constantino_GotReceptForTyon_01_08");	//А мой рецепт?
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_09");	//Извини, но лучше он останется у меня. Ты все равно не сможешь воспользоваться теми знаниями, которые находятся в нем.
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_10");	//Тем более свою награду ты уже получил. (нервно) Так чего же тебе еще надо?
	AI_Output(other,self,"DIA_Constantino_GotReceptForTyon_01_11");	//Отдай мой рецепт!
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_12");	//Забудь об этом. Иди вари лечебные эссенции!
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_POISONNEED(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_poisonneed_condition;
	information = dia_constantino_poisonneed_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_constantino_poisonneed_condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void dia_constantino_poisonneed_info()
{
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_01");	//Эй, ты, постой. (деловито) У меня есть к тебе разговор.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_03");	//Я вижу, ты человек бывалый, и любишь путешествовать в различных местах.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_04");	//Наверняка никогда не прочь заработать несколько лишних золотых монет. Я прав?
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_01_05");	//Конечно. Лишнее золото мне никогда не помешает.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_06");	//Вот и отлично. Тогда я хотел бы предложить тебе одно весьма интересное дельце.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_07");	//И будь уверен - в долгу я не останусь.
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_01_08");	//Давай ближе к делу. Что тебе нужно?
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_09");	//Понимаешь, для моих экспериментов требуется один довольно редкий ингредиент.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_10");	//Настолько редкий, что достать его порой крайне проблематично.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_13");	//Это звучит несколько необычно, но мне необходима эссенция какого-нибудь очень сильного яда.
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_01_14");	//Ты хочешь кого-то отравить?
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_15");	//О, Иннос. Нет, что ты! (нервно) У меня и в мыслях такого не было!
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_16");	//Просто так уж получилось, что у меня на руках случайно оказался некий рецепт, для изготовления которого требуется именно этот предмет.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_17");	//Сам я и понятия не имею, где его искать. Но уверен, что у тебя это получится.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_18");	//Ну как, ты согласен достать его для меня?
	Info_ClearChoices(dia_constantino_poisonneed);
	Info_AddChoice(dia_constantino_poisonneed,"Нет, не согласен!",dia_constantino_poisonneed_no);
	Info_AddChoice(dia_constantino_poisonneed,"Хорошо, по рукам.",dia_constantino_poisonneed_ok);
};

func void dia_constantino_poisonneed_ok()
{
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_Ok_01_01");	//Хорошо, считай, что мы договорились.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_Ok_01_02");	//Отлично! Это как раз то, что я и хотел услышать.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_Ok_01_03");	//Просто принеси мне этот яд - и ты увидишь, как твои карманы быстро наполнятся звонкими монетами.
	MIS_POISONNEED = LOG_Running;
	Log_CreateTopic(TOPIC_POISONNEED,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_POISONNEED,LOG_Running);
	B_LogEntry(TOPIC_POISONNEED,"Алхимик Константино попросил достать для него эссенцию сильного яда, и я согласился ему в этом помочь.");
	Info_ClearChoices(dia_constantino_poisonneed);
};

func void dia_constantino_poisonneed_no()
{
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_No_01_01");	//Я не согласен.
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_No_01_02");	//Поищи кого-нибудь другого для подобного рода дельца.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_No_01_03");	//Ну ладно, как скажешь.
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_POISONNEEDOK(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_poisonneedok_condition;
	information = dia_constantino_poisonneedok_info;
	permanent = FALSE;
	description = "У меня есть нужный тебе яд.";
};


func int dia_constantino_poisonneedok_condition()
{
	if((Npc_HasItems(hero,itpo_bloodflypoison) >= 1) && (MIS_POISONNEED == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_constantino_poisonneedok_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Constantino_PoisonNeedOk_01_01");	//У меня есть нужный тебе яд.
	AI_Output(self,other,"DIA_Constantino_PoisonNeedOk_01_02");	//Правда? (с интересом) Дай мне взглянуть на него.
	AI_Output(other,self,"DIA_Constantino_PoisonNeedOk_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,itpo_bloodflypoison,1);
	Npc_RemoveInvItems(self,itpo_bloodflypoison,1);
	AI_Output(self,other,"DIA_Constantino_PoisonNeedOk_01_04");	//Ну что же, отлично! Думаю, это мне как раз подойдет, чтобы закончить тот... так скажем, эксперимент.
	AI_Output(self,other,"DIA_Constantino_PoisonNeedOk_01_06");	//Вот, держи. Уверен, этого должно хватить, чтобы компенсировать твои хлопоты в этом деле.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_POISONNEED = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_POISONNEED,LOG_SUCCESS);
	B_LogEntry(TOPIC_POISONNEED,"Я принес Константино нужный ему яд. Он остался доволен.");
	AI_StopProcessInfos(self);
	KILLHAPPENS = Wld_GetDay();
};


instance DIA_CONSTANTINO_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_aboutkillignaz_condition;
	information = dia_constantino_aboutkillignaz_info;
	permanent = FALSE;
	description = "Тебе что-нибудь известно об убийстве алхимика Игнаца?";
};


func int dia_constantino_aboutkillignaz_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_constantino_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_00");	//Тебе что-нибудь известно об убийстве алхимика Игнаца?
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_01");	//Боюсь, что нет. (с сожалением) Я и понятия не имею, кто это мог сделать. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_02");	//Лорд Андрэ сказал мне, что беднягу отравили.
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_03");	//И все это наводит меня на определенные мысли.
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_04");	//На что это ты намекаешь?
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_05");	//На то, что недавно ты просил меня достать тебе сильнодействующий яд для каких-то твоих экспериментов.
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_07");	//О, клянусь Инносом - это не я. (нервно) У меня и в мыслях никогда такого не было!
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_08");	//Мы всегда были достаточно дружны с Игнацем, и я сильно расстроен всем случившимся.
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_11");	//Я тут не при чем!
	B_LogEntry(TOPIC_KILLIGNAZ,"Константино ничего не знает об этом убийстве. Хотя тот факт, что я несколько дней назад принес ему яд для его экспериментов - не может не вызывать подозрений...");
	ASKKILLFIRST = TRUE;
};

instance DIA_CONSTANTINO_FOUNDBOTTLE(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_foundbottle_condition;
	information = dia_constantino_foundbottle_info;
	permanent = FALSE;
	description = "Вот, взгляни что я нашел.";
};

func int dia_constantino_foundbottle_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && Npc_HasItems(hero,itmi_poisonbottle))
	{
		return TRUE;
	};
};

func void dia_constantino_foundbottle_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_00");	//Вот, взгляни что я нашел.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_01");	//Эээ...(непонимающе) И что это?
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_02");	//Уверен, ты и сам догадываешься об этом. И, как мне кажется, раньше эта вещица принадлежала именно тебе!
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_03");	//Что? (нервно) О нет! Этого просто не может быть!
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_04");	//А вот мне кажется, что все обстоит как раз наоборот. Так что отпираться теперь бесполезно.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_05");	//(нервно) Но... Неужели ты полагаешь, что это именно я отравил Игнаца?
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_06");	//Уверен, что это был именно ты! И при первой же возможности я сообщу об этом ополчению.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_07");	//Нет! Прошу тебя, не делай этого! (в панике) Я тут абсолютно не при чем!
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle,"Это ты будешь объяснять уже самому лорду Андрэ.",dia_constantino_foundbottle_prison);
	Info_AddChoice(dia_constantino_foundbottle,"И чем ты это можешь доказать?",dia_constantino_foundbottle_tellme);
};

func void dia_constantino_foundbottle_prison()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_Prison_01_01");	//Это ты будешь объяснять уже самому лорду Андрэ.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Prison_01_02");	//Ну, хорошо...(обреченно) Поступай, как хочешь! Но знай, что ты совершаешь большую ошибку.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Судя по всему, Константино и есть тот человек, который отравил алхимика Игнаца. Думаю, теперь стоит доложить об этом лорду Андрэ.");
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_tellme()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_TellMe_01_01");	//И чем ты это можешь доказать?
	AI_Output(other,self,"DIA_Constantino_FoundBottle_TellMe_01_02");	//Каким образом эта вещь оказалось в доме алхимика?
	AI_Output(self,other,"DIA_Constantino_FoundBottle_TellMe_01_03");	//Поверь, я понятия не имею, как. По всей видимости, этот пузырек у меня просто украли!
	AI_Output(self,other,"DIA_Constantino_FoundBottle_TellMe_01_04");	//А потом подбросили его в дом Игнаца.
	AI_Output(other,self,"DIA_Constantino_FoundBottle_TellMe_01_07");	//Твои оправдания звучат не слишком убедительно.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_TellMe_01_08");	//Но мне действительно больше нечего тебе сказать! Я не знаю, как это могло произойти.
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle,"Тогда ты не оставляешь мне выбора.",dia_constantino_foundbottle_no);
	Info_AddChoice(dia_constantino_foundbottle,"Думай лучше!",dia_constantino_foundbottle_yes);
};

func void dia_constantino_foundbottle_no()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_No_01_01");	//Тогда ты не оставляешь мне выбора! Придется тебя сдать городскому ополчению.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_No_01_02");	//Ну, хорошо...(обреченно) Поступай, как хочешь! Но знай, что ты совершаешь большую ошибку.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Судя по всему, Константино и есть тот человек, который отравил алхимика Игнаца. Думаю, теперь стоит доложить об этом лорду Андрэ.");
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_yes()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_Yes_01_01");	//Думай лучше! От этого зависит твоя дальнейшая судьба.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_02");	//Поверь, я стараюсь...(замешкался) Но мне ничего больше не приходит в голову.
	AI_Output(other,self,"DIA_Constantino_FoundBottle_Yes_01_03");	//Может быть, за последние дни произошло что-нибудь странное?
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_04");	//Да нет. Ничего подобного я, кажется, не замечал. Хотя, если только...
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_06");	//Да...(задумчиво) Тут на днях ко мне действительно заходил один довольно странный тип.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_10");	//Его заинтересовало одно из моих редких зелий, и, естественно, он захотел его у меня купить.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_12");	//Подобного рода напитки я обычно не храню в своей лаборатории.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_13");	//Это слишком опасно, поскольку некоторые из них очень дорогие. И это зелье было как раз из их числа.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_14");	//Поэтому я отошел на склад, чтобы принести его, а когда вернулся - этого парня уже не было!
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle,"Не думаю, что это действительно мне интересно.",dia_constantino_foundbottle_nohelp);
	Info_AddChoice(dia_constantino_foundbottle,"Я попробую помочь тебе.",dia_constantino_foundbottle_yeshelp);
};

func void dia_constantino_foundbottle_nohelp()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_NoHelp_01_01");	//Не думаю, что это действительно мне интересно.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_NoHelp_01_02");	//Ну, хорошо...(обреченно) Поступай, как хочешь! Но знай, что ты совершаешь большую ошибку.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Судя по всему, Константино и есть тот человек, который отравил алхимика Игнаца. Думаю, теперь стоит доложить об этом лорду Андрэ.");
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_yeshelp()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_YesHelp_01_01");	//Я попробую помочь тебе.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_YesHelp_01_02");	//О, Аданос. Я очень надеюсь, что тебе это удастся.
	HELPKILLIGNAZ = TRUE;
	Info_ClearChoices(dia_constantino_foundbottle);
	B_LogEntry(TOPIC_KILLIGNAZ,"Я решил помочь Константино в этом запутанном деле. Полагаю, мне стоит заняться поисками того загадочного человека, о котором говорил алхимик. Возможно, кто-нибудь из городской стражи запомнил его...");
};

instance DIA_CONSTANTINO_MakePoison(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoison_condition;
	information = dia_constantino_MakePoison_info;
	permanent = FALSE;
	description = "Так значит, ты умеешь изготавливать яды?";
};

func int dia_constantino_MakePoison_condition()
{
	if(HELPKILLIGNAZ == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoison_info()
{
	AI_Output(other,self,"DIA_Constantino_MakePoison_01_01");	//Так значит, ты умеешь изготавливать яды?
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_02");	//Ммм...(с неохотой) Да. Это, так скажем, мое побочное занятие, кроме приготовления магических зелий.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_03");	//Но я никому об этом не рассказываю, и тебе советую поменьше трепаться.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_04");	//Если городское ополчение об этом узнает, то немедленно прикроет эту лавочку!
	AI_Output(other,self,"DIA_Constantino_MakePoison_01_05");	//Понимаю. А ты не боишься, что когда-нибудь отравишь самого себя?
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_06");	//Не волнуйся...(посмеивается) На такой случай у меня всегда есть с собой противоядие.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_07");	//Их я тоже делаю, ибо без них моя практика была бы невозможна.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_08");	//К тому же, за долгие годы своих экспериментов я научился переносить некоторые виды ядов.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_09");	//Теперь они вызывают лишь небольшие побочные эффекты в виде сыпи на коже или лице.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_10");	//Но отравления как такового уже нет.
};

instance DIA_CONSTANTINO_MakePoisonTeachMe(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoisonTeachMe_condition;
	information = dia_constantino_MakePoisonTeachMe_info;
	permanent = FALSE;
	description = "Покажешь мне, как обращаться с ядами?";
};

func int dia_constantino_MakePoisonTeachMe_condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_MakePoison) == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoisonTeachMe_info()
{
	AI_Output(other,self,"DIA_Constantino_MakePoisonTeachMe_01_01");	//Может быть, покажешь мне, как обращаться с ядами?

	if(ConstForgiven == TRUE)
	{
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_02");	//Хммм...(задумчиво) Ну, хорошо. Все-таки ты помог мне разобраться с проблемой Игнаца.
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_03");	//И я был бы неблагодарной свиньей, если бы не отблагодарил тебя за это.
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_04");	//Однако мои знания потребуют от тебя определенного опыта.
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_05");	//Ну и небольшая сумма золота не помешает - в качестве компенсации расходов на твое обучение.
		ConsTeachPoison = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_07");	//(резко) Нет. Тебе я этого рассказывать не стану! Даже не думай.
		AI_Output(other,self,"DIA_Constantino_MakePoisonTeachMe_01_08");	//Ну ладно, как знаешь.
	};
};

instance DIA_CONSTANTINO_MakePoisonTeachMeAgain(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoisonTeachMeAgain_condition;
	information = dia_constantino_MakePoisonTeachMeAgain_info;
	permanent = FALSE;
	description = "Может, все-таки покажешь мне, как обращаться с ядами?";
};

func int dia_constantino_MakePoisonTeachMeAgain_condition()
{
	if((Npc_KnowsInfo(other,DIA_Constantino_MakePoisonTeachMe) == TRUE) && (ConstForgiven == TRUE) && (ConsTeachPoison == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoisonTeachMeAgain_info()
{
	AI_Output(other,self,"DIA_Constantino_MakePoisonTeachMeAgain_01_01");	//Может, все-таки покажешь мне, как обращаться с ядами?
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_02");	//Хммм...(задумчиво) Ну, хорошо. Все-таки ты помог мне разобраться с проблемой Игнаца.
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_03");	//И я был бы неблагодарной свиньей, если бы не отблагодарил тебя за это.
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_04");	//Однако мои знания потребуют от тебя определенного опыта.
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_05");	//Ну и небольшая сумма золота не помешает - в качестве компенсации расходов на твое обучение.
	ConsTeachPoison = TRUE;
};

instance DIA_CONSTANTINO_TeachPoison(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 800;
	condition = dia_constantino_TeachPoison_condition;
	information = dia_constantino_TeachPoison_info;
	permanent = TRUE;
	description = "Научи меня обращаться с ядами.";
};

func int dia_constantino_TeachPoison_condition()
{
	if((ConsTeachPoison == TRUE) && ((AnPoisonKnow == FALSE) || (ResistPoisonKnow == FALSE)))
	{
		return TRUE;
	};
};

func void dia_constantino_TeachPoison_info()
{
	AI_Output(other,self,"DIA_Constantino_TeachPoison_01_01");	//Научи меня обращаться с ядами.
	AI_Output(self,other,"DIA_Constantino_TeachPoison_01_02");	//Что ты хочешь узнать?
	Info_ClearChoices(DIA_Constantino_TeachPoison);
	Info_AddChoice(DIA_Constantino_TeachPoison,Dialog_Back,DIA_Constantino_TeachPoison_BACK);
	
	if(AnPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TeachPoison,"Научи меня делать противоядие (Очки обучения: 1, Цена: 500 монет)",DIA_Constantino_TeachPoison_AnPoison);
	};

	if(ResistPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TeachPoison,"Научи меня сопротивлению яду (Очки обучения: 10, Цена: 3000 монет)",DIA_Constantino_TeachPoison_Resist);
	};
};

func void DIA_Constantino_TeachPoison_BACK()
{
	Info_ClearChoices(DIA_Constantino_TeachPoison);
};

func void DIA_Constantino_TeachPoison_AnPoison()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Constantino_TeachPoison_AnPoison_01_00");	//Научи меня делать противоядие.

	kosten = 1;
	money = 500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_01");	//Извини, но для этого у тебя еще не хватает опыта!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_02");	//Извини, но бесплатно я этого делать не стану!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_03");	//Хорошо. Слушай внимательно.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_04");	//Тебе понадобится бутылка с водой, сера и уголь.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_05");	//Разотри серу и уголь до состояния порошка. Потом добавь полученную тобой смесь в кипящую воду.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_06");	//Вари ее примерно пару минут, а потом остуди. Вот и весь фокус!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Изучено: изготовление противоядия");
		AnPoisonKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для противоядия: бутылка воды, сера, соль и уголь.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};

func void DIA_Constantino_TeachPoison_Resist()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Constantino_TeachPoison_Resist_01_00");	//Научи меня сопротивлению яду.

	kosten = 10;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_01");	//Извини, но для этого у тебя еще не хватает опыта!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_02");	//Извини, но бесплатно я этого делать не стану!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_03");	//Яд - дело плохое. Особенно если он попал в твой организм.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_04");	//Ты должен позаботиться о том, чтобы твой организм как можно быстрее разложил яд.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_05");	//Непрерывно двигайся и больше потей! Тогда отравление ядом не причинит тебе вреда.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Изучено: сопротивление яду");
		ResistPoisonKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_CONSTANTINO_FUCKOFF(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 10;
	condition = dia_constantino_fuckoff_condition;
	information = dia_constantino_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_constantino_fuckoff_condition()
{
	if((CONSTANTINOFUCKOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_constantino_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

instance DIA_Constantino_LOKIPOTION(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_LOKIPOTION_Condition;
	information = DIA_Constantino_LOKIPOTION_Info;
	permanent = FALSE;
	description = "Мне понадобилось одно очень редкое растение.";
};


func int DIA_Constantino_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LOKIPOTION_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Constantino_LOKIPOTION_01_00");	//Мне понадобилось одно очень редкое растение.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_01");	//Какое именно?
	AI_Output(other,self,"DIA_Constantino_LOKIPOTION_01_02");	//Его называют цветком кактуса.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_03");	//Хммм...(с интересом) Ну да, я немного слышал о нем. Действительно очень редкий экземпляр для здешних краев.
	AI_Output(other,self,"DIA_Constantino_LOKIPOTION_01_04");	//Ты случайно не знаешь, где его можно найти?
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_05");	//Боюсь, в Хоринисе ты его точно не найдешь.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_06");	//Насколько мне известно, это растение любит сухой климат и большое обилие солнечного тепла. А здесь для него слишком холодно!
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_07");	//На твоем месте я бы лучше поспрашивал местных торговцев.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_08");	//Если это растение и есть у кого-нибудь на острове, то только у них.
	TradeCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Алхимик Константино посоветовал мне поговорить с торговцами. Если на острове и есть это растение, то только у них.");
};

instance DIA_Constantino_MyBrew(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MyBrew_Condition;
	information = DIA_Constantino_MyBrew_Info;
	permanent = FALSE;
	description = "Я по поводу твоего зелья.";
};

func int DIA_Constantino_MyBrew_Condition()
{
	if((MIS_MyBrew == LOG_Running) && (KnowFakeRecept == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_MyBrew_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_00");	//Я по поводу твоего зелья.
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_01");	//(с интересом) Ты его уже сварил?
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_02");	//Нет! И вряд ли из этой затеи получится что-то толковое.
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_03");	//Все ингредиенты в твоем рецепте абсолютно не совместимы с друг другом.
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_04");	//А некоторые и вовсе не используются в алхимии!
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_05");	//(с уважением) Вот уж не думал, что ты сможешь разгадать этот секрет.
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_06");	//Пожалуй, из тебя действительно получится неплохой алхимик.
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_07");	//Хорошо. Я помогу тебе познать истинное величие этого искусства!
	MIS_MyBrew = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyBrew,LOG_Success);
	B_LogEntry(TOPIC_MyBrew,"Я пересказал Константино все то, о чем мне поведал Саландрил. Он был удивлен моей прозорливости и, кажется, даже проникся ко мне уважением. Но главное - теперь он будет учить меня искусству алхимии.");
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTeacher,"Константино может обучить меня искусству алхимии.");
};
