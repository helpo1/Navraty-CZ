
instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = "Я принес вино из монастыря.";
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Я принес вино из монастыря.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Превосходно. Это именно то, что мне нужно.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Я уже договорился о цене с мастером Гораксом. Я дам тебе сто золотых монет прямо сейчас.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Хорошо, давай мне это золото.",DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein,"Ты пытаешься надуть меня?",DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//Хорошо, давай мне это золото.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Держи. С тобой приятно иметь дело.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Ты пытаешься надуть меня? Оно стоит двести сорок монет.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Так, Горакс предупредил тебя, да? Ну хорошо, может быть, мы сможем договориться. Послушай, давай поступим так - я дам тебе 100 монет за это вино.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Ты скажешь Гораксу, что я обманул тебя, а я дам тебе в придачу ЧЕТЫРЕ свитка с заклинаниями.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Эй, давай сюда двести сорок монет.",DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein,"Хм, звучит заманчиво. Давай сюда эти свитки.",DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein,"А что это за свитки?",DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Эй, давай сюда двести сорок монет.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Ты не хочешь вести со мной бизнес, да? (вздыхает) Ну хорошо, вот твое золото.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	B_GiveInvItemsManyThings(self,other);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Хм, звучит заманчиво. Давай сюда эти свитки.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Вот твои свитки и золото.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//А что это за свитки?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Понятия не имею - я в этом ничего не понимаю. Они достались мне от гостя, который... э-э... забыл их здесь, да!
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = "Ты кто?";
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Ты кто?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Я Орлан, хозяин этой скромной таверны.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Ты что-нибудь ищешь, чужеземец? Может быть, приличный меч или хорошие доспехи?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Глоток вина, или, может быть, тебе нужна информация?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Я могу дать тебе все это и даже больше, если у тебя есть звонкие монеты.
};


instance DIA_Addon_Orlan_Greg(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_Greg_Condition;
	information = DIA_Addon_Orlan_Greg_Info;
	description = "Ты знаешь человека с повязкой на глазу?";
};


func int DIA_Addon_Orlan_Greg_Condition()
{
	if((SC_SawGregInTaverne == TRUE) && (Kapitel <= 3) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Ты знаешь человека с повязкой на глазу?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//Я видел его здесь раньше. Неприятный тип.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Некоторое время назад он снял у меня верхнюю комнату. При нем был огромный сундук.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//Ему нужно было постоянно напоминать о том, что пора платить за комнату. А он совершенно не обращал на это внимания.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//А в один прекрасный день он просто исчез вместе со своим ящиком. Не люблю таких людей.
};


instance DIA_Addon_Orlan_Ranger(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Ranger_Condition;
	information = DIA_Addon_Orlan_Ranger_Info;
	description = "У меня паранойя, или ты действительно постоянно смотришь на мое кольцо?";
};


func int DIA_Addon_Orlan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (SCIsWearingRangerRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//У меня паранойя, или ты действительно постоянно смотришь на мое кольцо?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Я не совсем уверен, как это понимать...
	Orlan_KnowsSCAsRanger = TRUE;
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Я стал членом Кольца Воды!",DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Это аквамарин. Видел когда-нибудь такой?",DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//Это аквамарин. Видел когда-нибудь такой?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Видел. Добро пожаловать в штаб-квартиру, брат по Кольцу.
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//Хотя, конечно, выглядишь ты не особенно одаренным...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Что я могу для тебя сделать?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//Я стал членом Кольца Воды!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Действительно? Не могу поверить, что такого болвана приняли в общество.
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Итак, что тебе нужно?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};


instance DIA_Addon_Orlan_Teleportstein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Teleportstein_Condition;
	information = DIA_Addon_Orlan_Teleportstein_Info;
	description = "Ты когда-нибудь использовал телепорты?";
};


func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if((Orlan_KnowsSCAsRanger == TRUE) && (SCUsed_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//Ты когда-нибудь использовал телепорты?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Ты рехнулся? Пока маги воды не убедят меня, что это безопасно, я и близко подходить к ним не буду.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Меня попросили спрятать один из телепортов. Больше я не хочу иметь с этими штуками ничего общего.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"А я могу посмотреть на этот телепорт?",DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"Где находится телепорт?",DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_Teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//А я могу посмотреть на этот телепорт?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Смотри, если хочешь. Вот ключ - я запер вход.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	B_GiveInvItems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Орлан запер камень-телепорт в пещере к юго-западу от своей таверны.");
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Где находится телепорт?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Недалеко от моей таверны, на юге, есть пещера. В ней маги воды его и обнаружили.
};


instance DIA_Addon_Orlan_NoMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_NoMeeting_Condition;
	information = DIA_Addon_Orlan_NoMeeting_Info;
	description = "Я хочу присоединиться к Кольцу Воды!";
};


func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && !Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger) && (SCIsWearingRangerRing == FALSE) && (MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//Я хочу присоединиться к Кольцу Воды!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//Здесь нет никаких колец. Налить тебе выпить?
};


instance DIA_Addon_Orlan_WhenRangerMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information = DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description = "Мне сказали, что в твоей таверне будет встреча членов этого общества.";
};


func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	B_Addon_Orlan_RangersReadyForComing();
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Мне сказали, что в твоей таверне будет встреча членов этого общества.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//Верно! Она вот-вот должна начаться.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Остальные почему-то задерживаются.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Остальные должны вот-вот появиться.",DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Встреча будет сегодня?",DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	B_MakeRangerReadyForMeetingALL();
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Встреча будет сегодня?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Да, насколько я помню.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Надеюсь, мы начнем не слишком поздно.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"(далее)",DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	B_MakeRangerReadyForMeetingALL();
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Остальные должны вот-вот появиться.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Посмотрим...
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_Ende,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = "Что за доспехи ты можешь предложить?";
};


var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (DIA_Orlan_RUESTUNG_noPerm == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Что за доспехи ты можешь предложить?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//У меня есть очень хороший экземпляр, я уверен, это заинтересует тебя.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG,"Одежда крестьянина (Цена: 250 монет)",DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Я хочу купить кожаные доспехи.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//Хорошее решение.
		CreateInvItems(self,ITAR_Bau_M,1);
		B_GiveInvItems(self,other,ITAR_Bau_L,1);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Извини. Заходи, когда у тебя появятся деньги.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Как хочешь. Только не думай слишком долго.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Orlan_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Покажи мне свои товары.

	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || (SCIsWearingRangerRing == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Конечно, брат по Кольцу.
		Orlan_KnowsSCAsRanger = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Конечно. Для меня большая честь услужить такому важному гостю.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Конечно, сэр.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Если ты сможешь заплатить.
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));
};


instance DIA_Orlan_HotelZimmer(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelZimmer_Condition;
	information = DIA_Orlan_HotelZimmer_Info;
	permanent = TRUE;
	description = "Сколько ты берешь за комнату?";
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelZimmer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Сколько ты берешь за комнату?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if((SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Братья по Кольцу живут у меня бесплатно.
			Orlan_RangerHelpZimmer = TRUE;
			Orlan_KnowsSCAsRanger = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Для рыцаря короля у меня всегда найдется свободная комната. Совершенно бесплатно, естественно.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Я бы никогда не посмел взять деньги за свои услуги с представителя Инноса на земле.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Вот ключ от верхних комнат. Выбирай, которая больше понравится.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Ты платишь пятьдесят золотых монет в неделю и комната твоя.
		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Черт побери, как дорого-то!",DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Хорошо. Вот золото.",DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//Хорошо. Вот золото.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//А вот ключ. Комнаты находятся вверх по лестнице. Но не загадь ее и не забывай платить ренту вовремя, понятно?
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Orlan_SCGotHotelZimmer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//У тебя нет пятидесяти! Сначала деньги, потом удовольствие.
	};
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Черт побери, как дорого-то!
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Тогда попробуй поискать ночлег в другом месте, дружок.
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};


var int Orlan_AngriffWegenMiete;

instance DIA_Orlan_MieteFaellig(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};
	if((Orlan_AngriffWegenMiete == TRUE) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	if((Orlan_SCGotHotelZimmer == TRUE) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7)) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(неискренне) Я очень рад визиту такого гостя. Оставайся здесь, сколько пожелаешь. Это честь для меня.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Когда я, наконец, получу мою ренту?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Забудь об этом. Я больше не буду платить тебе. ",DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Вот твои пятьдесят золотых монет.",DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Вот твои пятьдесят золотых монет.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Как раз вовремя.
		if(DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Где ты шлялся весь день?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Тебе лучше не знать.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Мммм. Ну, да. Это, в общем-то, не мое дело.
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Ты что, пытаешься надуть меня? У даже тебя нет денег, чтобы заплатить за еду. Я проучу тебя, ах ты...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Забудь об этом. Я больше не буду платить тебе.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Тогда мне придется проучить тебя. Презренный жулик!
	Orlan_AngriffWegenMiete = TRUE;
	Info_ClearChoices(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//Вот ты где, наконец. Я ждал тебя.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Что случилось?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Состязание 'кто кого перепьет' наконец-то закончилось.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Кто победил?

	if((Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",ItFo_Water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//На этот раз Рендольф. Рухару нынче не повезло.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Как всегда Рухар напоил Рендольфа в стельку. Этого следовало ожидать.
		Rukhar_Won_Wettkampf = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Я надеюсь, это было в последний раз. Я не хочу, чтобы подобное повторялось в моем доме. Заруби это у себя на носу.
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(Randolph,"Start");

	if(Hlp_IsValidNpc(Rukhar))
	{
		if(Rukhar_Won_Wettkampf == TRUE)
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharWon");
		}
		else
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharLost");
		};
	};

	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
};


instance DIA_Orlan_EINGEBROCKT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Да уж, доставил ты мне проблем. Теперь мне нужно быть поосторожнее с Рухаром.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Почему?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Пока он устраивает здесь это свое состязание, лучше, чтобы никто посторонний не знал о нем. Это плохо для бизнеса, понимаешь?
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = "Как дела в таверне?";
};


func int DIA_Orlan_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Как дела в таверне?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Бывало и лучше.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Люди нынче не так охотно развязывают свои кошельки, как это было раньше.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Надеюсь, эти черные маги скоро уйдут, иначе, боюсь, мне придется закрыть таверну.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Почти никто не осмеливается больше заглядывать сюда.
	};
};


instance DIA_Orlan_Minenanteil(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_Minenanteil_Info;
	description = "Ты продаешь акции?";
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Ты продаешь акции?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Конечно. Ты тоже можешь купить, если цена тебя устраивает.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_PICKPOCKET(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_Orlan_PICKPOCKET_Condition;
	information = DIA_Orlan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Orlan_PICKPOCKET_Condition()
{
	return C_Beklauen(89,260);
};

func void DIA_Orlan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,Dialog_Back,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

instance DIA_ORLAN_MEETKILL(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_meetkill_condition;
	information = dia_orlan_meetkill_info;
	permanent = FALSE;
	description = "У меня здесь назначена встреча с одним человеком.";
};

func int dia_orlan_meetkill_condition()
{
	if((APEARKILLER == TRUE) && (MEETCHIEFKILLERSLAIT == FALSE) && (MEETCHIEFKILLERS == FALSE) && (MIS_GERBRANDTHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_meetkill_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Orlan_MeetKill_01_00");	//У меня здесь назначена встреча с одним человеком.
	AI_Output(self,other,"DIA_Orlan_MeetKill_01_02");	//Ах да. Тут один парень мне что-то говорил про это. Странный тип, я тебе скажу.
	AI_Output(self,other,"DIA_Orlan_MeetKill_01_03");	//Кажется, он поднялся на верхний этаж - посмотри в дальней комнате.
};

instance DIA_ORLAN_MEETKILLLAIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_meetkilllait_condition;
	information = dia_orlan_meetkilllait_info;
	permanent = FALSE;
	description = "У меня здесь назначена встреча с одним человеком.";
};

func int dia_orlan_meetkilllait_condition()
{
	if((MEETCHIEFKILLERSLAIT == TRUE) && (MIS_GERBRANDTHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_meetkilllait_info()
{
	AI_Output(other,self,"DIA_Orlan_MeetKillLait_01_00");	//У меня здесь назначена встреча с одним человеком.
	AI_Output(self,other,"DIA_Orlan_MeetKillLait_01_02");	//Ах да. Тут один парень что-то говорил мне про это. Странный тип, я тебе скажу.
	AI_Output(self,other,"DIA_Orlan_MeetKillLait_01_03");	//Но, кажется, он уже ушел.
};

instance DIA_ORLAN_MISSBRENDI(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_missbrendi_condition;
	information = dia_orlan_missbrendi_info;
	permanent = FALSE;
	description = "Ты не видел тут человека по имени Бенчел?";
};

func int dia_orlan_missbrendi_condition()
{
	if((BENCHELSEE == FALSE) && (MIS_BLACKBRENDI == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_missbrendi_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Orlan_MissBrendi_Info_01_00");	//Ты не видел тут человека по имени Бенчел?
	AI_Output(self,other,"DIA_Orlan_MissBrendi_Info_01_03");	//Уже ушел - буквально несколько минут назад.
	AI_Output(self,other,"DIA_Orlan_MissBrendi_Info_01_04");	//Пробыл тут пару дней, набивая свое брюхо дешевым пивом, а потом забрал у меня партию черного брэнди и отправился в город.
	AI_Output(self,other,"DIA_Orlan_MissBrendi_Info_01_05");	//Так что, если поторопишся, можешь его еще догнать. Не думаю, что он далеко смог уйти.
	B_LogEntry(TOPIC_BLACKBRENDI,"Орлан сказал, что я совсем чуть-чуть разминулся с Бенчелом. Несколько минут назад он вышел из таверны, и, по его словам, отправился в город, естественно, не забыв прихватить с собой партию черного брэнди.");
};

instance DIA_Orlan_Werewolf(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Werewolf_Condition;
	information = DIA_Orlan_Werewolf_Info;
	permanent = FALSE;
	description = "Ты ничего не знаешь о нападении зверя?";
};

func int DIA_Orlan_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Akil_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orlan_Werewolf_01_00");	//Ты слышал что-нибудь о нападении зверя?
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_01");	//(нервно) О каком нападении?
	AI_Output(other,self,"DIA_Orlan_Werewolf_01_02");	//Недавно какая-то тварь загрызла человека недалеко от твоей таверны. Под мостом.
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_03");	//А, ты об этом...(вздыхая) Нет, лично я ничего не знаю.
	AI_Output(other,self,"DIA_Orlan_Werewolf_01_04");	//И что, даже никаких слухов на этот счет?
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_05");	//Хммм... Вроде кто-то упоминал о том, что видел большого мракориса недалеко от фермы Секоба.
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_06");	//Но мало ли, что тут бродит в лесах. Там же весь лес кишит монстрами.
	B_LogEntry(TOPIC_WolfAndMan,"Орлан ничего не знает о нападении зверя. Но, по слухам, недалеко от фермы Секоба видели большого мракориса.");
};


//----------------------------кости-----------------------------

instance DIA_BAU_970_Orlan_Game(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_BAU_970_Orlan_Game_condition;
	information = DIA_BAU_970_Orlan_Game_info;
	description = "Я слышал, что ты играешь в кости.";
};

func int DIA_BAU_970_Orlan_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (GameOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_Game_info()
{
	AI_Output(other,self,"DIA_BAU_970_Orlan_Game_01_00");	//Я слышал, что ты играешь в кости.
	AI_Output(self,other,"DIA_BAU_970_Orlan_Game_01_01");	//Ну, если слышал, значит так оно и есть.
	AI_Output(other,self,"DIA_BAU_970_Orlan_Game_01_02");	//Тогда, может быть, сыграем?
	AI_Output(self,other,"DIA_BAU_970_Orlan_Game_01_03");	//Почему бы нет. Скажи, когда будешь готов - и мы сразу начнем.
	OrlanPlayResult = 150;
	Menu_WriteInt("AST","SysTimer03",0);
};

instance DIA_BAU_970_Orlan_GamePlay(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_BAU_970_Orlan_GamePlay_condition;
	information = DIA_BAU_970_Orlan_GamePlay_info;
	permanent = TRUE;
	description = "Сыграем в кости!";
};

func int DIA_BAU_970_Orlan_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_BAU_970_Orlan_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer03");

	if(CheckLastGame >= OrlanPlayResult)
	{
		CheckLastSum = CheckLastGame - OrlanPlayResult;
	};

	AI_Output(other,self,"DIA_BAU_970_Orlan_GamePlay_01_00");	//Сыграем в кости!

	if(OrlanPlayResult >= CheckLastGame)
	{
		if((OrlanPlayResult > 0) && (OrlanDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_01");	//Хорошо! Ты уже попрощался со своим золотом?
			PlayPocker(1,self);
		}
		else
		{
			if(OrlanDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_02");	//И не подумаю! Ты и так меня сегодня ободрал, как старую липу.
				OrlanDayPlay = Wld_GetDay();
				OrlanDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_03");	//Даже не проси.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_04");	//А где золото, которое ты мне задолжал за последнюю игру?
		AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_05");	//Пока я его не увижу, никакой игры не будет.
		Info_ClearChoices(DIA_BAU_970_Orlan_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_BAU_970_Orlan_GamePlay,"Вот твои деньги.",DIA_BAU_970_Orlan_GamePlay_Here);
		};

		Info_AddChoice(DIA_BAU_970_Orlan_GamePlay,"У меня нет столько денег.",DIA_BAU_970_Orlan_GamePlay_No);
	};
};

func void DIA_BAU_970_Orlan_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	OrlanPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_BAU_970_Orlan_GamePlay_Here_01_01");	//Вот твои деньги.
	AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_Here_01_02");	//Можешь же, когда захочешь. Теперь начнем!
	PlayPocker(1,self);
};

func void DIA_BAU_970_Orlan_GamePlay_No()
{
	AI_Output(other,self,"DIA_BAU_970_Orlan_GamePlay_No_01_01");	//У меня нет столько денег.
	AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_No_01_02");	//И что ты тогда хочешь от меня?
	Info_ClearChoices(DIA_BAU_970_Orlan_GamePlay);
};

instance DIA_BAU_970_Orlan_GameEnd(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_BAU_970_Orlan_GameEnd_condition;
	information = DIA_BAU_970_Orlan_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_BAU_970_Orlan_GameEnd_condition()
{
	if((MustTellResult_Orlan == TRUE) && ((OrlanLost == TRUE) || (OrlanWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_GameEnd_info()
{
	if(OrlanLost == TRUE)
	{
		AI_Output(self,other,"DIA_BAU_970_Orlan_GameEnd_00");	//Никогда бы не подумал, что ты так хорошо играешь.
		OrlanLost = FALSE;
	}
	else if(OrlanWon == TRUE)
	{
		AI_Output(self,other,"DIA_BAU_970_Orlan_GameEnd_01");	//Теперь твое золото в надежных руках. Будь уверен!
		OrlanWon = FALSE;
	};

	MustTellResult_Orlan = FALSE;
};