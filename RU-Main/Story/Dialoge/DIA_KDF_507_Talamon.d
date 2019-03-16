
instance DIA_Talamon_KAP1_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP1_EXIT_Condition;
	information = DIA_Talamon_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Talamon_NoEnter_PissOff(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_NoEnter_PissOff_Condition;
	information = DIA_Talamon_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Talamon_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_Talamon_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Talamon_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

const string KDF_507_Checkpoint = "NW_MONASTERY_SEALROOM_01";
var int TalamonFM;

instance DIA_KDF_507_Talamon_FirstWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_KDF_507_Talamon_FirstWarn_Condition;
	information = DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (CanEnterKloster == TRUE) && (Kapitel < 6) && (Npc_RefuseTalk(self) == FALSE) && (hero.guild != GIL_KDF) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_TurnToNPC(hero,Garwig);
	AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_00");	//Тебе нельзя идти дальше. Поворачивай назад!

	if(TalamonFM == FALSE)
	{
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_00");	//Признайся, мастер, тяжко стоять здесь без перерывов и отдыха?
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_01");	//Жаловаться на порученную Инносом миссию - не удел настоящего мага Огня.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_02");	//На порученную Инносом или Высшим советом?
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_03");	//С уст членов Высшего совета сходит воля Инноса.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_04");	//Да-да, глас Бога - оправдание всему. Но, по-моему, из тебя наглым образом сделали козла отпущения.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_05");	//Я не уполномочен обсуждать с тобой эту тему.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_06");	//Твои братья сидят наверху, в церкви, и отпускают благословения. Ты же - стоишь здесь и обрастаешь паутиной, а ведь ты тоже высший маг.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_07");	//(вне себя) Да, черт возьми! Но ты немного ошибся: не я обрастаю паутиной и увядаю здесь, а эти сидни, которые только и могут, что делать умный вид - врастают в свои троны.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_08");	//Я же стою, как нерушимая скала, и рано или поздно выйду, чтоб посмотреть в их бесстыжие, молящие лица, когда они поймут, что ничего не могут без меня.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_09");	//Ничего не могут? В каком смысле?
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_10");	//...(опомнившись) О чем это ты, сын мой?
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_11");	//Ну, о высших магах, которые рано или поздно поймут...
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_12");	//Ты здоров? Если нет, то советую обратиться к мастеру Неорасу, алхимику. Он в противоположной части подземелья.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_13");	//В эту его часть проход закрыт. Уходи!
		TalamonFM = TRUE;
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_SecondWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 2;
	condition = DIA_KDF_507_Talamon_SecondWarn_Condition;
	information = DIA_KDF_507_Talamon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (Kapitel < 6) && (Npc_RefuseTalk(self) == FALSE) && (hero.guild != GIL_KDF) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_TurnToNPC(hero,Garwig);
	AI_Output(self,other,"DIA_KDF_507_Talamon_SecondWarn_04_00");	//Иннос обратит свой гнев против тебя, если ты не повернешь назад!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_Attack(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 3;
	condition = DIA_KDF_507_Talamon_Attack_Condition;
	information = DIA_KDF_507_Talamon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_Attack_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (Kapitel < 6) && (Npc_RefuseTalk(self) == FALSE) && (hero.guild != GIL_KDF) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	AI_TurnToNPC(hero,Garwig);
	self.aivar[AIV_EnemyOverride] = FALSE;
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Talamon_IgaranzNew(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_IgaranzNew_condition;
	information = DIA_Talamon_IgaranzNew_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь.";
};

func int DIA_Talamon_IgaranzNew_condition()
{
	if((Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && (IS_PYROKAR_IGORANZINFO == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_IgaranzNew_info()
{
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_01");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_02");	//В чем дело, брат?
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_03");	//Послушник Игарац полон решимости стать магом Огня, и я уверен, что он достоин получить еще один шанс.
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_04");	//Пирокар сказал мне, что это должен решать ты.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_05");	//Хммм...(задумчиво) Очень давно никто не пользовался этим законом.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_06");	//Тут надо подумать. С одной стороны, Игарац уже однажды не справился с испытанием.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_07");	//С другой стороны, я его очень давно знаю, как способного ученика и верного слугу Инноса.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_09");	//Ну хорошо. Пускай у него будет еще один шанс, но на этот раз - последний!
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_10");	//Я тебя понял. А какое задание ты ему дашь?
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_11");	//Непростое. Пусть послушник Игарац принесет мне сердце демона.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_12");	//И только пройдя это испытание, он сможет вступить в круг Огня.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_13");	//Я буду весьма признателен, если ты передашь ему эти условия.
	IS_TALAMON_IGORANZCONDITION = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Таламон приказал Игарацу добыть сердце демона. Мне надо передать ему эти условия.");
};

instance DIA_Talamon_IgaranzNew_DemonHeart(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_IgaranzNew_DemonHeart_condition;
	information = DIA_Talamon_IgaranzNew_DemonHeart_info;
	permanent = FALSE;
	description = "Послушник Игарац просил передать тебе это сердце.";
};


func int DIA_Talamon_IgaranzNew_DemonHeart_condition()
{
	if((Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && Npc_HasItems(hero,ItAt_DemonHeart) && ((IgaranzMakeHappyGold == TRUE) || (IgaranzMakeHappyMagic == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Talamon_IgaranzNew_DemonHeart_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_DemonHeart_01_01");	//Послушник Игарац просил передать тебе это сердце.
	B_GiveInvItems(other,self,ItAt_DemonHeart,1);
	Npc_RemoveInvItem(self,ItAt_DemonHeart);
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_02");	//(удивленно) Надеюсь, ты ему не помогал достать его?
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_DemonHeart_01_03");	//Нет. Я лишь согласился передать это сердце тебе.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_04");	//Ну хорошо. Раз он прошел мое испытание, то может с этого момента носить робу мага Огня.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_05");	//Вот, передай ему это.
	B_GiveInvItems(self,other,itar_kdf_m_new,1);
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_06");	//Все остальное он должен выяснить у мастера Парлана.
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я занес Таламону сердце демона. Теперь можно сообщить радостную новость Игарацу и, наконец, отдать ему робу мага Огня.");
	IgaranzMakeHappyOk = TRUE;
};


instance DIA_Talamon_KAP5_Stop(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 50;
	condition = DIA_Talamon_KAP5_Stop_Condition;
	information = DIA_Talamon_KAP5_Stop_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Talamon_KAP5_Stop_Condition()
{
	if(Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_00");	//Тебе нельзя идти дальше - поворачивай назад!
	AI_Output(other,self,"DIA_Talamon_KAP5_Stop_15_01");	//Пирокар сказал, что мне можно взять книгу Ксардаса.
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_02");	//Ну, если он это сказал. Хорошо, ты можешь войти. Книга, которую ты ищешь, находится вон там, на алхимическом столе.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Таламон хранит книгу Ксардаса на алхимическом столе в подвале. ");
	self.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_Talamon_FoundSecretDoor(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_FoundSecretDoor_Condition;
	information = DIA_Talamon_FoundSecretDoor_Info;
	permanent = FALSE;
	description = "Я нашел секретную дверь.";
};


func int DIA_Talamon_FoundSecretDoor_Condition()
{
	if(SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_00");	//Я нашел секретную дверь.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_01");	//(удивленно) Что? Где?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_02");	//За книжной полкой.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_03");	//А что за дверью?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_04");	//Похоже, там старый подвал.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_05");	//Это важная новость, я должен немедленно сообщить об этом Пирокару.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_06");	//А пока ты должен выяснить, что там в этом подвале.
	MIS_ScoutLibrary = LOG_Running;
};


instance DIA_Talamon_ScoutSecretLibrary(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_ScoutSecretLibrary_Condition;
	information = DIA_Talamon_ScoutSecretLibrary_Info;
	permanent = TRUE;
	description = "Я был в этом подвале.";
};


func int DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if((MIS_ScoutLibrary == LOG_Running) && (HeroWasInLibrary == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_00");	//Я был в этом подвале.
	AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_01");	//И что ты там нашел?
	if(Npc_IsDead(SecretLibrarySkeleton))
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_02");	//Там был скелет воина, охраняющий дверь. Я убил его.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_03");	//Отлично.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_04");	//Мы разберемся с этим подвалом, когда победим Зло.
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP(XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_05");	//Там, внизу, толпы монстров.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_06");	//Там должно что-то быть, продолжай искать. И уничтожай этих монстров без всякой жалости.
	};
};


instance DIA_Talamon_PICKPOCKET(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 900;
	condition = DIA_Talamon_PICKPOCKET_Condition;
	information = DIA_Talamon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Talamon_PICKPOCKET_Condition()
{
	return C_Beklauen(87,140);
};

func void DIA_Talamon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,Dialog_Back,DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,130);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};


instance DIA_TALAMON_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = dia_talamon_runemagicnotwork_condition;
	information = dia_talamon_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_talamon_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_talamon_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Talamon_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Talamon_RuneMagicNotWork_01_01");	//Пока я стоял на страже в подземелье монастыря и редко ими пользовался, они работали. Теперь же, когда появилась острая нужда в них, - они вдруг отказали!
	AI_Output(other,self,"DIA_Talamon_RuneMagicNotWork_01_02");	//А что насчет остальных?
	AI_Output(self,other,"DIA_Talamon_RuneMagicNotWork_01_03");	//Этот проблемный вопрос глобален и стоит он перед всеми. Обессилеть в этом плане довелось каждому.
	AI_Output(other,self,"DIA_Talamon_RuneMagicNotWork_01_04");	//Понятно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};


var int talamon_teach_d_1;

instance DIA_TALAMON_TEACHBLROBS(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 5;
	condition = dia_talamon_teachblrobs_condition;
	information = dia_talamon_teachblrobs_info;
	permanent = TRUE;
	description = "Ты можешь чему-нибудь меня научить?";
};

func int dia_talamon_teachblrobs_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_HasItems(hero,ItAr_KDF_H) >= 1))
	{
		return TRUE;
	};
};

func void dia_talamon_teachblrobs_info()
{
	TALAMON_TEACH_D_1 = TRUE;
	AI_Output(other,self,"DIA_Talamon_TeachBlRobs_01_01");	//Ты можешь чему-нибудь меня научить?
	AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_02");	//Если ты имеешь в виду магию, то нет, брат.
	AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_03");	//Я не обучаю новичков нашего ордена. Однако я могу рассказать тебе о старинном обряде освящения робы мага Огня.
	AI_Output(other,self,"DIA_Talamon_TeachBlRobs_01_04");	//Интересно...
};


instance DIA_TALAMON_TEACHBLROBS2(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 800;
	condition = dia_talamon_teachblrobs2_condition;
	information = dia_talamon_teachblrobs2_info;
	permanent = TRUE;
	description = "Научи меня освящать робу мага Огня. (Очки обучения: 5, Цена: 2000 монет)";
};


func int dia_talamon_teachblrobs2_condition()
{
	if((hero.guild == GIL_KDF) && (TALAMON_TEACH_D_1 == TRUE) && (HEROKNOWS_BLESSED_ROBS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talamon_teachblrobs2_info()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 2000) && (hero.lp >= 5))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_05");	//Издавна высшие маги Огня освящали свои робы, кропя их святой водой.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_06");	//Для того, чтобы провести обряд, тебе необходимо только найти статую нашего господина - Инноса.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_07");	//Если Иннос будет достаточно благосклонен к тебе, твоя роба станет крепче и будет лучше тебя защищать.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_08");	//Помни, ты можешь освятить одну робу только один раз, но попытаться никогда не поздно.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_09");	//Это все, что тебе следует знать. Теперь ступай, брат, и да пребудет с тобой священный огонь Инноса!
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Теперь я знаю, что мне понадобится для освящения робы: тридцать пять бутылей святой воды.");
		hero.lp = hero.lp - 5;
		RankPoints = RankPoints + 5;
		B_GiveInvItems(hero,self,ItMi_Gold,2000);
		Npc_RemoveInvItems(self,ItMi_Gold,2000);
		Snd_Play("LevelUP");
		HEROKNOWS_BLESSED_ROBS = 1;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) <= 2000)
	{
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_10");	//Сначала принеси мне небольшое пожертвование.
		AI_StopProcessInfos(self);
	}
	else if(hero.lp < 5)
	{
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_11");	//Сначала ты должен набраться опыта.
		AI_StopProcessInfos(self);
	};
};