
instance DIA_Addon_Merdarion_ADW_EXIT(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 999;
	condition = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_ADWHello(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADWHello_Condition;
	information = DIA_Addon_Merdarion_ADWHello_Info;
	description = "Как дела?";
};


func int DIA_Addon_Merdarion_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Я услышал достаточно.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//Слушай...(прислушиваясь) Любопытно, да?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Хммм...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Эти телепортационные камни, видимо, не работают, но все еще слышно, как они гудят.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//Хотя они неактивны, в них еще осталась какая-то энергия.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Где эти телепорты черпают энергию?",DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Как ты думаешь, как их можно активировать?",DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Как ты думаешь, как их можно активировать?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//У меня есть одна идея. Только мне нужно убедиться, что мое подозрение верно.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//У меня несколько дней назад было ощущение, что я уже видел похожую штуку.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Я полагаю, что нам нужно передать им внушительное количество магической энергии, чтобы заставить их снова работать.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Где ты видел такие телепортационные камни раньше?",DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Что может дать достаточное количество магической энергии?..",DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Что может дать достаточное количество магической энергии?..
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Мне приходит в голову только одна идея. Магическая фокусировка.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Я имею в виду один из пяти фокусирующих камней, которые были использованы при создании магического Барьера в Долине Рудников.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Насколько я знаю, некоторое время назад ты вернул их нам.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Да, я помню.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Ты сказал, что тебе нужно убедиться, что твое подозрение верно.",DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"И где фокусирующие камни сейчас?",DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//И где фокусирующие камни сейчас?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Они были доверены мне. Я должен хранить их, пока им не найдется другое использование.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Похоже, что время пришло.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Я услышал достаточно.",DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//Ты сказал, что тебе нужно убедиться, что твое подозрение верно.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//Магический фокус может быть связан с этими камнями.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Но я не знаю где.
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Где ты видел такие телепортационные камни раньше?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Ты тоже был в исправительной колонии. Неужели ты никогда их не замечал?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Я совершенно уверен, что их все еще можно там найти.
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Что эти камни делают?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Зодчие были очень развитой нацией.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Они использовали такие свойства магии, которых мы никогда не видели.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//Сеть телепортационных камней была построена, чтобы Зодчие могли быстро перемещаться из одного города в другой.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//ЭТОТ камень, очевидно, является центральным.
};

instance DIA_Addon_Merdarion_ADW_Portal(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_Portal_Condition;
	information = DIA_Addon_Merdarion_ADW_Portal_Info;
	description = "Есть здесь еще что-нибудь интересное?";
};


func int DIA_Addon_Merdarion_ADW_Portal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_Portal_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_Portal_01_00");	//Есть здесь еще что-нибудь интересное?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_Portal_01_01");	//В пустынном каньоне на севере этой долины есть небольшая каменная постройка, по всей видимости, оставленная Зодчими.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_Portal_01_02");	//С виду она напоминает храм, но на мой взгляд, это остатки какого-то магического портала.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_Portal_01_03");	//Так что если вдруг случайно сможешь это выяснить, дай мне знать.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_Portal_01_04");	//Хорошо, я учту это.
	MIS_MerdarionPortal = LOG_Running;
	Log_CreateTopic(TOPIC_MerdarionPortal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MerdarionPortal,LOG_Running);
	B_LogEntry(TOPIC_MerdarionPortal,"По словам Мердариона, в каньоне находятся развалины какого-то древнего строения. Он думает, что это магический портал. Мердарион попросил меня сообщить ему, если мне удастся что-нибудь выяснить об этом.");
};

instance DIA_Addon_Merdarion_ADW_PortalDone(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PortalDone_Condition;
	information = DIA_Addon_Merdarion_ADW_PortalDone_Info;
	description = "Ты был прав насчет портала.";
};

func int DIA_Addon_Merdarion_ADW_PortalDone_Condition()
{
	if((MIS_MerdarionPortal == LOG_Running) && (AV_ENTER == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PortalDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_00");	//Ты был прав насчет портала.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_01");	//Даже так... (с интересом) И куда он ведет?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_02");	//Судя по всему, это место когда-то называлось плато Древних.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_03");	//В записях Зодчих сказано, что оно является священной вотчиной самого Аданоса.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_04");	//Именно там он впервые ступил в мир людей и обратился к ним.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_05");	//О боги! (изумленно) Поверить не могу! Это... Это просто не укладывается в моей голове.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_06");	//Тогда сам пойди и взгляни на него.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_07");	//Мне, безусловно, хотелось бы этого, но меня почему-то терзают какие-то нехорошие предчувствия. 
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_08");	//Если Зодчие сокрыли это место, то, пожалуй, наше вмешательство может повлечь за собой крайне непредсказуемые последствия.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_09");	//Поэтому пусть эти знания останутся сокрытыми для остальных. Так будет лучше для всех!
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_10");	//Ладно, как скажешь.
	MIS_MerdarionPortal = LOG_Success;
	Log_SetTopicStatus(TOPIC_MerdarionPortal,LOG_Success);
	B_LogEntry(TOPIC_MerdarionPortal,"Я рассказал Мердариону про портал на плато Древних. Он был впечатлен услышанным. Однако маги Воды вряд ли предпримут попытку пройти через него. По их мнению, некоторые тайны Древних должны оставаться тайными.");
};

instance DIA_Addon_Merdarion_FokusGeben(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FokusGeben_Condition;
	information = DIA_Addon_Merdarion_FokusGeben_Info;
	description = "Дай мне фокусирующий камень.";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FokusGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Дай мне фокусирующий камень. Я попробую заставить телепортеры работать.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//Хорошо. Но будь осторожен, слышишь меня?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Сатурас снимет с меня голову, если мы их потеряем.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Маг воды Мердарион дал мне один из старых камней фокусировки, которые использовались для создания Барьера вокруг Долины Рудников. С его помощью я могу попробовать активировать какой-нибудь телепорт.");
};


instance DIA_Addon_Merdarion_FirstFocus(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FirstFocus_Condition;
	information = DIA_Addon_Merdarion_FirstFocus_Info;
	description = "Я активировал один из телепортационных камней.";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition()
{
	if(TriggeredTeleporterADW != 0)
	{
		return TRUE;
	};
	return FALSE;
};


var int Merdarion_GotFocusCount;

func void DIA_Addon_Merdarion_FirstFocus_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Я активировал один из телепортационных камней.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//Да, я вижу. Значит, я был прав.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//Я поговорил с другими об этом.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Мы хотим, чтобы ты попытался активировать все остальные телепортационные камни.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//Если мы сможем быстро перемещаться из одной части города в другую, нам это очень поможет исследованиях.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Вот еще один фокусирующий камень.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Merdarion_GotFocusCount = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Активируй их все, если сумеешь.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Я постараюсь.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Мердарион дал мне еще один камень фокусировки. Я должен постараться активировать все телепорты. Мердарион будет снабжать меня новыми камнями по мере включения телепортов.");
};


instance DIA_Addon_Merdarion_ActivateTeleports(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information = DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent = TRUE;
	description = "Я активировал еще один телепортационный камень.";
};


func int DIA_Addon_Merdarion_ActivateTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_FirstFocus) && (TriggeredTeleporterADW > Merdarion_GotFocusCount) && (Merdarion_GotFocusCount < 6))
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Я активировал еще один телепортационный камень.
	if(SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Дай мне следующий фокусирующий камень.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Конечно, пожалуйста.
		CreateInvItems(self,ItMi_Focus,1);
		B_GiveInvItems(self,other,ItMi_Focus,1);
	};
	if(DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Это было сложно?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Как посмотреть. Я бы не отказался от помощи.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//Я могу дать тебе немного золота, это поможет?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//Явно не помешает.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Посмотрим...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Ты проделал отличную работу. Мне остается только поздравить тебя.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Теперь они все работают. Впечатляющее зрелище, правда?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Вот несколько золотых монет.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Merdarion_GotFocusCount = Merdarion_GotFocusCount + 1;
	if((Merdarion_GotFocusCount >= 1) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (MIS_Saturas_LookingForHousesOfRulers == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//Да, и кстати, пока я не забыл - Сатурас хотел поговорить с тобой.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//Ты должен найти его как можно скорее.
	};
};


instance DIA_Addon_Merdarion_ADW_PreTeachMana(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information = DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description = "Ты можешь повысить мои магические способности?";
};


func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello) && (hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Ты можешь повысить мои магические способности?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//Я могу увеличить количество твоей магической энергии.
	Merdarion_Addon_TeachMana = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,"Мердарион может увеличить мою магическую энергию.");
};


instance DIA_Addon_Merdarion_ADW_TEACH_MANA(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 99;
	condition = DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information = DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Я хочу повысить свои магические способности.";
};


var int Merdarion_ADW_Empty;

func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition()
{
	if((Merdarion_ADW_Empty == FALSE) && (Merdarion_Addon_TeachMana == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Я хочу увеличить мою магическую энергию.
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//То, что ты просишь, выходит за рамки моих способностей.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//Ты уже знаешь все, чему бы я тебя мог научить.
		Merdarion_ADW_Empty = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};


instance DIA_ADDON_MERDARION_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 1;
	condition = dia_addon_merdarion_adw_prayforgomez_condition;
	information = dia_addon_merdarion_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословление Аданоса.";
};


func int dia_addon_merdarion_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_01");	//Мне нужно благословление Аданоса.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_04");	//Спасибо за совет.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_MERDARION_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 1;
	condition = dia_addon_merdarion_adw_duringritual_condition;
	information = dia_addon_merdarion_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_merdarion_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

var int MerdarionDoUnitors;

instance DIA_Addon_Merdarion_AncientAltar(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_AncientAltar_Condition;
	information = DIA_Addon_Merdarion_AncientAltar_Info;
	permanent = FALSE;
	description = "Я по поводу юниторов.";
};

func int DIA_Addon_Merdarion_AncientAltar_Condition()
{
	if(AltarToMerdarion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_AncientAltar_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_00");	//Я по поводу юниторов. Мне нужно еще несколько штук.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_01");	//К сожалению, я ничем не смогу тебе помочь.

	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_02");	//Все юниторы, которые у меня были, мы уже использовали для активации магических порталов.
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_03");	//Других же у меня просто нет. Кстати, а зачем они тебе вдруг так понадобились?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_04");	//С теми юниторами, которые дал мне Сатурас, я расстанусь только в случае крайней необходимости.
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_05");	//А ты даже не объяснил, зачем они тебе вдруг понадобились.
	};

	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_06");	//Сатурас сказал, что с их помощью можно вернуть магию древним алтарям.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_07");	//(задумчиво) В таком случае они тебе точно не понадобятся.
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_08");	//Это еще почему?
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_09");	//Потому что эти юниторы совершенно не годятся для подобных целей.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_10");	//Скорее всего, тут нужны какие-то особенные кристаллы, которые сами хранят в себе магическую энергию.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_11");	//Но таких я пока здесь не встречал.
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_12");	//А если я найду тебе такие кристаллы, ты сможешь сделать из них фокусирующие камни?
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_13");	//(задумчиво) Почему бы и нет. Им необходимо будет лишь придать правильную форму и закрепить в оправе.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_14");	//Ибо нестабильная структура кристалла может запросто разрушить сама себя.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_15");	//Так что, если вдруг встретишь подобные экземпляры, приноси их мне. 
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_16");	//И я помогу тебе с твоей проблемой.
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_17");	//Хорошо, я все понял.
	MerdarionDoUnitors = TRUE;
};

instance DIA_Addon_Merdarion_MakeUnitor(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_MakeUnitor_Condition;
	information = DIA_Addon_Merdarion_MakeUnitor_Info;
	permanent = FALSE;
	description = "У меня есть для тебя кусок магического кристалла.";
};

func int DIA_Addon_Merdarion_MakeUnitor_Condition()
{
	if((MerdarionDoUnitors == TRUE) && (Npc_HasItems(hero,ItMi_UnSharp_MagicCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_MakeUnitor_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_00");	//У меня есть для тебя кусок магического кристалла.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_01");	//Правда? Покажи мне его.
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_02");	//Вот он.
	B_GiveInvItems(other,self,ItMi_UnSharp_MagicCrystal,1);
	Npc_RemoveInvItems(self,ItMi_UnSharp_MagicCrystal,1);
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_03");	//Похоже, ты действительно прав.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_04");	//И из него получится вполне подходящий для твоих целей фокусирующий камень. Где ты его нашел?
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_05");	//Тебе лучше не знать.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_06");	//Ну, раз так... Подожди минутку. Это не займет много времени.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_07");	//Вот, твой магический юнитор готов. Можешь его использовать.
	B_GiveInvItems(self,other,ItMi_MagicCrystal,1);
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_08");	//Спасибо. А если мне понадобятся еще юниторы?
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_09");	//Все очень просто, друг мой. Главное, приноси мне кристаллы.
};

instance DIA_Addon_Merdarion_MakeUnitor_Done(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_MakeUnitor_Done_Condition;
	information = DIA_Addon_Merdarion_MakeUnitor_Done_Info;
	permanent = TRUE;
	description = "Сделай для меня еще несколько юниторов.";
};

func int DIA_Addon_Merdarion_MakeUnitor_Done_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Merdarion_MakeUnitor) && (Npc_HasItems(hero,ItMi_UnSharp_MagicCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_MakeUnitor_Done_Info()
{
	var int anzahl_common;

	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_Done_01_00");	//Сделай для меня еще несколько юниторов.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_Done_01_01");	//А кристаллы у тебя есть?
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_Done_01_02");	//Конечно, вот они.
	b_giveinvitemsmanythings(other,self);
	anzahl_common = Npc_HasItems(other,ItMi_UnSharp_MagicCrystal);
	Npc_RemoveInvItems(other,ItMi_UnSharp_MagicCrystal,anzahl_common);
	CreateInvItems(other,ItMi_MagicCrystal,anzahl_common);
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_Done_01_03");	//Хорошо. Подожди минутку.
	B_UseFakeUnitor();
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_Done_01_04");	//Все, готово. Можешь забрать свои фокусирующие камни.
	b_giveinvitemsmanythings(self,other);
};