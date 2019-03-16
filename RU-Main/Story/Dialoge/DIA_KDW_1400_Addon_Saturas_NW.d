
instance DIA_Addon_Saturas_EXIT(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 999;
	condition = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if((MIS_Addon_Saturas_BringRiordian2Me == FALSE) && (KAPITELORCATC == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Ну, раз никаким другим образом тебя нельзя уговорить оставить в покое других магов, придется дать тебе задание.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Доложи Риордиану, что я его жду.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Ты найдешь его в задней части хранилища.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
		B_LogEntry(TOPIC_Addon_HolRiordian,"Сатурас хочет, чтобы я прислал к нему мага Риордиана. Он должен быть в дальней части здания.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarius_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = "Я взялся помочь Нефариусу и найти потерянные части орнамента. ";
};


func int DIA_Addon_Saturas_Nefarius_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//Я взялся помочь Нефариусу и найти потерянные части орнамента.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Что? Быть того не может! Ты опять вмешиваешься?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Не надо беспокоиться. Все доставлю как есть.

	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,itwr_map_newworld_ornaments_addon_1))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//Ты хоть знаешь, что ты ищешь?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Ну, Нефариус дал мне эту карту...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Покажи ее мне!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Хм. В большом лесу чрезвычайно опасно. Не следует направляться туда одному.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Найди кого-нибудь в Хоринисе, кто бы мог пойти с тобой.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Не то чтобы я о тебе волнуюсь, но монстры могут съесть орнамент вместе с тобой.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Вот твоя карта...
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Сатурас посоветовал мне не отправляться на поиски части орнамента, которая находится в лесу, в одиночку. Я должен найти в Хоринисе кого-нибудь, кто пойдет со мной.");
	};
};


instance DIA_Addon_Saturas_Hallo(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Hallo_Condition;
	information = DIA_Addon_Saturas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);

	if(Wld_DetectNpc(self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		if(KAPITELORCATC == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Saturas_Hallo_WEISSTDU()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_00");	//Ты хоть имеешь представление о том, что ты наделал?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_01");	//Ты настолько сильно пошатнул базовую структуру магического естества, что в Хоринисе все чуть не оглохли.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_02");	//Скажи спасибо, что Барьера больше нет.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_WEISSTDU_15_03");	//Что же ты жалуешься, старче? Все ведь сработало как надо.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_04");	//Следите за языком, юноша!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_05");	//Что, во имя всех стихий, тебе здесь нужно?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Ты спятил? Вон!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//Под сводами этого места слишком опасно для начинающего искателя приключений.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//Но постой, разве я тебя не знаю? Ну, конечно! Проклятый ублюдок...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//Не думаешь ли ты, что я забыл, как ты предал нас тогда в Новом Лагере?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"(смущенно) Я...",DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("RET2_Oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//Ты каким-то образом высосал всю магическую энергию из нашей горы руды, а потом просто исчез!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//И зачем только тебе это понадобилось!
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);

	if(RhetorikSkillValue[1] >= 15)
	{	
		Info_AddChoice(DIA_Addon_Saturas_Hallo,"Ваш план все равно не сработал бы.",DIA_Addon_Saturas_Hallo_Spott);
	}; 

	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Мне правда очень жаль.",DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Такова жизнь!",DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Такова жизнь! Без мощи накопленной вами руды, я бы не смог одолеть Спящего.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//Что за бред ты несешь?! Спящий? Одолеть Спящего?!
	DIA_Addon_Saturas_Hallo_WEISSTDU();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Ваш план не сработал бы, как ни крути. Хе-хе, взорвать гору руды, чтобы убрать Барьер... Смех, да и только.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Все, на что бы вас хватило тогда, так это взлететь на воздух вместе с вашим лагерем и его жителями в придачу.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//Это заходит уже слишком далеко! Кто дал тебе право судить нас и наши намерения?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Если бы я не исповедовал путь ненасилия, мой мальчик... Считай, тебе повезло.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	DIA_Addon_Saturas_Hallo_WEISSTDU();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Мне правда очень жаль. Я не ведал, что творил.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//О, и ты, наивный, полагаешь, что теперь об этом можно забыть?
	DIA_Addon_Saturas_Hallo_WEISSTDU();
};


instance DIA_Addon_Saturas_keineAhnung(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturas_keineAhnung_Info;
	description = "Совершенно не представляю.";
};


func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_keineAhnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Понятия не имею. Просто заглянул. Нельзя?
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Ты тратишь мое драгоценное время. Уходи прочь с моих глаз!
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//Я разберусь с тобой позже.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Я нашел магов Воды на месте раскопок. Мне нужно выяснить, чем они там занимаются. Сатурас пока ничего мне не говорит. Он все никак не может забыть ту историю в колонии.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Saturas_raus(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_raus_Condition;
	information = DIA_Addon_Saturas_raus_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Saturas_raus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_keineAhnung) && (MIS_Addon_Lares_Ornament2Saturas == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Прочь, пока с тобой ничего не случилось.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = "Я пришел сюда с Ларесом.";
};


func int DIA_Addon_Saturas_Lares_Condition()
{
	if(Lares_Angekommen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//Я пришел сюда с Ларесом.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//Ларес? Правда? Где он?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Я один. Ларес вернулся в город.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//Что? И он отправил тебя к нам одного? О чем он думал?
};


instance DIA_Addon_Saturas_Ornament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = "Вот то, что вам нужно! Орнамент.";
};

func int DIA_Addon_Saturas_Ornament_Condition()
{
	if((Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE)) || ((Lares_Angekommen == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_Lares) && Npc_HasItems(other,ItMi_Ornament_Addon_Vatras)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//Вот то, что вам нужно. Орнамент.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Во имя сути всего сущего, что это все должно значить?
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Кто дал тебе это? Только не говори, что Ларес просто вручил это тебе.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Ну, хватит уже, старче. Я ведь принес это вам, чего уж боле?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Конечно. Меня просто волнует, что ты опять приложил к этому свои подлые руки.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Почему ты все еще так кипятишься из-за той руды?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//Ведь я тогда уже работал на вас. На меня можно было положиться.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//И к чему это нас привело, ответь?...(вздыхает) Даже не думай, что я тебе доверяю!
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;
	Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Black,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
};

instance DIA_Addon_Saturas_HowYouHere(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_HowYouHere_Condition;
	information = DIA_Addon_Saturas_HowYouHere_Info;
	description = "Как вы здесь оказались?";
};

func int DIA_Addon_Saturas_HowYouHere_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_HowYouHere_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_HowYouHere_01_00");	//Как вы здесь оказались?
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_01");	//После падения Барьера нам пришлось немного задержаться в Новом лагере.
	AI_Output(other,self,"DIA_Addon_Saturas_HowYouHere_01_02");	//Зачем?
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_03");	//Мы должны были забрать с собой многие ценные вещи. В основном наши труды и знания, накопленные за годы, проведенные за Барьером.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_04");	//Правда, часть из них нам все равно пришлось оставить там до лучших времен.
	AI_Output(other,self,"DIA_Addon_Saturas_HowYouHere_01_05");	//А что было потом?
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_06");	//Когда мы оказались в Хоринисе, паника уже практически охватила всю эту часть острова. Многие даже полагали тогда, что каторжники возьмут город приступом.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_07");	//Но их опасения оказались напрасными. С прибытием паладинов в Хоринис ситуация полностью стабилизировалась, и самому городу больше ничто не угрожает.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_08");	//Ватрас, единственный маг Воды в этой части острова, радушно принял нас, снабдив всем необходимым.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_09");	//А после мы решили отправиться сюда, дабы изучить останки древней цивилизации, которая, по мнению Ватраса, поклонялась самому Аданосу.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_10");	//Теперь нам предстоит разгадать тайны, которые таят в себе эти древние залы.
};

instance DIA_Addon_Saturas_geheimbund(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_geheimbund_Condition;
	information = DIA_Addon_Saturas_geheimbund_Info;
	description = "Я желаю стать членом 'Кольца Воды'.";
};


func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Я желаю стать членом 'Кольца Воды'.
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(яростно) ЧТО? Как ты узнал об этом? Кто?.. ЛАРЕС... Я убью его!
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//Он нарушил наше главное правило. О Кольце Воды говорить запрещено!
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(совершенно разбито) Не знаю, что мне следовало бы сказать. Просто я доверяю тебе, пока ты у меня на глазах.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//О Кольце мне сказал Ватрас.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(смиренно) Что? Ватрас? (саркастически) Отлично! Из всех магов воды, которые есть на острове, ты встречаешься именно с тем, который тебя НЕ ЗНАЕТ.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//Предупреждаю, в этот раз не делай глупостей.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(сухо) Постараюсь...
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Сатурас не готов приять меня в Кольцо Воды. Он сказал, что это принять решение должен Ватрас.");
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//В этих чертогах сокрыты древние тайны. Загадочные тайны.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//По надписям и фрескам видно, что это очень древняя культура.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Все надписи, которые ты видишь сделаны на совершенно неизвестном нам языке.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Мы только начинаем изучать его и расшифровали лишь малую часть.
};


instance DIA_Addon_Saturas_Erdbeben(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = "Что это за странные подземные толчки?";
};


func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Saturas_wasmachstdu) && Npc_KnowsInfo(other,DIA_Addon_Merdarion_Bedrohung))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//Что это за странные подземные толчки?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//Это одна из загадок, которую я сам пытаюсь разрешить.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Что-то тревожит структуру магии где-то под этими горами.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Очевидно, кто-то пытается всеми своими силами разрушить могучую магию.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Боюсь, это произойдет до того, как весь остров будет содрогаться от этих толчков.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = "Почему для тебя так важен этот орнамент?";
};


func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsOrnament == FALSE) && (RitualRingRuns == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Почему для тебя так важен этот орнамент?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//Это ключ к порталу.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Больше я ничего тебе не скажу.
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "Теперь я принадлежу к 'Кольцу Воды'.";
};


func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if((SaturasKnows_SC_IsRanger == FALSE) && (SC_IsRanger == TRUE) && (other.guild != GIL_NDW) && (other.guild != GIL_KDW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Теперь я принадлежу к 'Кольцу Воды'.
	itm = Npc_GetEquippedArmor(other);
	if(((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE)) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v1) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v2) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v3) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v4) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v5) == TRUE))
	{
		if((Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v1) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v2) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v3) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v4) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v5) == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Я вижу, ты носишь доспехи наших детей.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Я вижу, на тебе наш тайный знак. Аквамариновое кольцо.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//А еще по твоим глазам я вижу, что ты говоришь правду.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(бормоча) Хорошо. Я приму тебя в наши ряды.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Но помни, что это налагает на тебя большую ответственность.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//И я надеюсь, что ты будешь поступать по справедливости. Ради собственного же блага.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater,"Сатурас согласился с моим вступлением в 'Кольцо Воды'.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//А как я могу сказать, что теперь ты один из нас?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Аквамариновое кольцо, которое ты носишь, принадлежит Ларесу. Я вижу.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Ты пытаешься меня провести? Я не ожидал ничего другого.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Saturas_OpenPortal(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_OpenPortal_Condition;
	information = DIA_Addon_Saturas_OpenPortal_Info;
	permanent = TRUE;
	description = "Дай мне кольцо! Я открою портал.";
};

func int DIA_Addon_Saturas_OpenPortal_Condition()
{
	if((RitualRingRuns == LOG_SUCCESS) && (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_OpenPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Дай мне кольцо! Я открою портал.
	if((SaturasKnows_SC_IsRanger == TRUE) || (other.guild == GIL_NDW) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//Хорошо! Как один из наших новых детей, ты должен быть удостоен этой чести.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Однако я по-прежнему жду вестей от Ватраса. Мы никуда не пойдем, пока не дождемся их.
		if(Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//У МЕНЯ есть для тебя послание от Ватраса.
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven));
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened));
			B_UseFakeScroll();
			if(Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//Вижу! И, конечно же, ты не удержался и наверняка вскрыл его?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//Ну...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//Надеюсь...(грозно) Мое и так хрупкое доверие к тебе не пошатнется окончательно! Ради твоего же блага.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(удивленно) Интересно. Хорошо.
				B_GivePlayerXP(XP_Ambient);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Вот, возьми кольцо! Мы встретимся у портала и подождем тебя.
			CreateInvItems(self,ItMi_PortalRing_Addon,1);
			B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Если Нефариус прав, портал откроется, как только в него вставят кольцо.
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас дал мне украшенное кольцо. Я должен открыть портал, вставив кольцо в механизм, а затем пройти через портал.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			if(SATURASWAITSVATRASMESSAGE != TRUE)
			{
				SATURASWAITSVATRASMESSAGE = TRUE;
				B_LogEntry(TOPIC_Addon_KDW,"Стаурас ждет вестей от Ватраса. Мне необходимо отправиться в Хоринис и поговорить с ним.");
			};
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Пока Ватрас не дал мне знать, что тебе можно доверять полностью, кольцо побудет у меня.
		if(Saturas_WillVertrauensBeweis == FALSE)
		{
			Saturas_WillVertrauensBeweis = TRUE;
			SATURASWAITSVATRASMESSAGE = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас не хочет давать мне кольцо с орнаментом, пока он не получит знак от Ватраса, что мне можно доверять.");
		};
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Saturas_PERM(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 99;
	condition = DIA_Addon_Saturas_PERM_Condition;
	information = DIA_Addon_Saturas_PERM_Info;
	permanent = FALSE;
	description = "Ты можешь немного поучить меня магии?";
};

func int DIA_Addon_Saturas_PERM_Condition()
{
	if((MIS_Addon_Saturas_BringRiordian2Me != 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Ты можешь немного поучить меня магии?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Чтобы ты опять натворил дел?!
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Нет! У меня нет времени в бирюльки играть.
};


instance DIA_ADDON_SATURAS_HOWCANBEKDW(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = dia_addon_saturas_howcanbekdw_condition;
	information = dia_addon_saturas_howcanbekdw_info;
	permanent = FALSE;
	description = "А могу я стать магом Воды?";
};

func int dia_addon_saturas_howcanbekdw_condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_howcanbekdw_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_HowCanBeKDW_15_00");	//А могу я стать магом Воды?
	AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_01");	//С чего ты взял, что это возможно?

	if(VATRASSAYABOUTKDW == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_HowCanBeKDW_15_02");	//Ватрас сказал мне об этом.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_HowCanBeKDW_15_03");	//Я просто поинтересовался.
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_05");	//Хммм. Мы и в самом деле иногда делаем исключения...
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_06");	//Но для этого твои поступки должны быть ОЧЕНЬ убедительны.
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_07");	//Мы поговорим об этом позже, если ты сумеешь меня по-настоящему удивить.
		if(VATRASSAYABOUTKDW == FALSE)
		{
			MIS_BECOMEKDW = LOG_Running;
			Log_CreateTopic(TOPIC_BECOMEKDW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_Running);
			B_LogEntry(TOPIC_BECOMEKDW,"Сатурас примет меня в маги Воды, если мне удастся убедить его в том, что я этого достоин.");
		}
		else
		{
			B_LogEntry(TOPIC_BECOMEKDW,"Сатурас хочет убедиться, что я достоин стать магом Воды. Мне надо доказать это делами.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_04");	//В любом случае ты уже сделал свой выбор. Поэтому следуй тому пути, что выбрал - путь мага Воды не для тебя.
		if(MIS_BECOMEKDW == LOG_Running)
		{
			MIS_BECOMEKDW = LOG_FAILED;
		};
	};
};

instance DIA_ADDON_SATURAS_CANBEKDW(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = dia_addon_saturas_canbekdw_condition;
	information = dia_addon_saturas_canbekdw_info;
	permanent = TRUE;
	description = "По поводу вступления...";
};

func int dia_addon_saturas_canbekdw_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_howcanbekdw) && (other.guild == GIL_NONE) && (MIS_BECOMEKDW == LOG_Running) && (SATURASTELLWISHJOIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_canbekdw_info()
{
	var int countsaturas;
	countsaturas = 0;
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_00");	//По поводу вступления...
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_01");	//Да? Слушаю тебя.
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_02");	//Могу ли я теперь вступить в Круг магов Воды?
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_03");	//Назови мне хотя бы несколько причин, почему я должен принять тебя в наши ряды?
	if((MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) || (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		if(MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_06");	//Я помог Мартину найти торговца, который продавал оружие бандитам.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_07");	//Неплохо. Я думаю, что ты на правильном пути.
			countsaturas = countsaturas + 1;
		};
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_08");	//Я принес Нефариусу все недостающие части орнамента для портала.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_09");	//Это так! Ты действительно оказал нам неоценимую услугу. Маги Воды очень благодарны тебе!
			countsaturas = countsaturas + 1;
		};
		if(countsaturas == 2)
		{
			B_GivePlayerXP(150);
			B_LogEntry(TOPIC_BECOMEKDW,"Сатурас считает, что я достоин носить одеяние послушника Воды. Теперь выбор за мной.");
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_15_10");	//Этого достаточно?
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_11");	//Безусловно, ты доказал, что достоин того, чтобы присоединиться к нам. Твои деяния и твои поступки говорят сами за себя.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_12");	//Однако...
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_14");	//Стать магом Воды - как великий дар, так и большая ответственность! Только избранные Аданоса удостаиваются этой чести.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_15");	//Лишь тот, кто готов всецело и безраздельно следовать священному пути Аданоса может рассчитывать на посвящение в маги Воды.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_16");	//Стать магом Воды - это не просто овладеть той силой и знаниями, что дарует нам Аданос. Это намного больше...
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_17");	//...больше для тех, чье служение Аданосу - это знак, это судьба!
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_18");	//Поэтому не проси меня сейчас посвятить тебя в маги Воды. Ты еще не готов для этого.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_20");	//Я могу принять тебя только в послушники нашего ордена. Но этим самым ты сможешь начать свой путь в качестве слуги Аданоса.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_23");	//И запомни: если ты решишь посвятить свою жизнь служению Аданосу, то уже не сможешь просто так отказаться от этого выбора.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_24");	//Поэтому подумай хорошенько, прежде чем дать мне окончательный ответ.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_25");	//Итак, сын мой, готов ли ты принять обет послушника Воды?
			SATURASTELLWISHJOIN = TRUE;
			Info_ClearChoices(dia_addon_saturas_canbekdw);
			Info_AddChoice(dia_addon_saturas_canbekdw,"Я еще подумаю над этим.",dia_addon_saturas_canbekdw_no);
			Info_AddChoice(dia_addon_saturas_canbekdw,"Да, я хочу посвятить свою жизнь служению Аданосу!",dia_addon_saturas_canbekdw_yes);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_26");	//Этого достаточно?
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_27");	//Своими поступками ты неплохо зарекомендовал себя, но, к сожалению, этого недостаточно.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_29");	//Я должен быть полностью уверен в том, что не совершаю ошибку, принимая тебя в наши ряды.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_30");	//Возращайся позже, когда твои причины будут более убедительными.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_32");	//Боюсь, что мне нечего тебе сказать.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_33");	//Тогда не трать понапрасну мое время!
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_34");	//Лучше иди и займись чем-нибудь полезным.
	};
};

func void dia_addon_saturas_canbekdw_yes()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_Yes_01_00");	//Да, я хочу посвятить свою жизнь служению Аданосу!
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_01");	//Тогда добро пожаловать. С благословления Аданоса я принимаю тебя в ряды последователей его священного пути.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_02");	//Теперь ты послушник. Носи эту одежду в знак того, что ты теперь принадлежишь к нашей общине.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_03");	//Благослови Аданос этого мужчину, который отдает свою жизнь тебе в услужение и освободи его от грехов!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_NDW;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("LEVELUP");
	B_GiveInvItems(self,other,itar_ndw_l,1);
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_04");	//Твердо следуй выбранному тобой пути, и пусть мудрость Аданоса никогда не покидает тебя!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_SUCCESS;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_SUCCESS);
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_BECOMEKDW,"Теперь, я послушник Магов Воды.");
	Info_ClearChoices(dia_addon_saturas_canbekdw);
};

func void dia_addon_saturas_canbekdw_no()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_No_01_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_No_01_01");	//Тогда приходи, когда будешь готов. Да пребудет с тобой Аданос, сын мой!
	Info_ClearChoices(dia_addon_saturas_canbekdw);
};


instance DIA_ADDON_SATURAS_JOINWATERMAGE(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_joinwatermage_condition;
	information = dia_addon_saturas_joinwatermage_info;
	permanent = TRUE;
	description = "Я хочу стать послушником магов Воды.";
};


func int dia_addon_saturas_joinwatermage_condition()
{
	if((hero.guild == GIL_NONE) && (SATURASTELLWISHJOIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_joinwatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_01_01");	//Я хочу стать послушником магов Воды.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_01_02");	//Это действительно твое желание? Помни, что обратного пути у тебя нет.
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
	Info_AddChoice(dia_addon_saturas_joinwatermage,"Я подумаю над этим.",dia_addon_saturas_joinwatermage_no);
	Info_AddChoice(dia_addon_saturas_joinwatermage,"Да, я хочу посвятить свою жизнь служению Аданосу.",dia_addon_saturas_joinwatermage_yes);
};

func void dia_addon_saturas_joinwatermage_yes()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_00");	//Да, я хочу посвятить свою жизнь служению Аданосу.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_01");	//Тогда добро пожаловать. С благословения Аданоса я принимаю тебя в ряды последователей его священного пути.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_02");	//Теперь ты послушник. Носи эту одежду в знак того, что ты теперь принадлежишь к нашей общине.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_03");	//Благослови Аданос этого мужчину, который отдает свою жизнь тебе в услужение и освободи его от грехов!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_NDW;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("LEVELUP");
	B_GiveInvItems(self,other,itar_ndw_l,1);
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_04");	//Твердо следуй выбранному тобой пути, и пусть мудрость Аданоса никогда не покидает тебя!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_SUCCESS;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_SUCCESS);
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_BECOMEKDW,"Теперь, я послушник Магов Воды.");
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
};

func void dia_addon_saturas_joinwatermage_no()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_No_01_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_No_01_01");	//Тогда приходи, когда будешь готов. Да пребудет с тобой Аданос, сын мой!
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
};

instance DIA_Addon_Saturas_PowerMagic(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_PowerMagic_Condition;
	information = DIA_Addon_Saturas_PowerMagic_Info;
	description = "Расскажи мне о магии Воды.";
};

func int DIA_Addon_Saturas_PowerMagic_Condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PowerMagic_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PowerMagic_01_00");	//Расскажи мне о магии Воды.
	AI_Output(self,other,"DIA_Addon_Saturas_PowerMagic_01_01");	//В отличии от остальных школ магии, наша построена на применении различных свойств воды и ее проявлениях.
	AI_Output(self,other,"DIA_Addon_Saturas_PowerMagic_01_02");	//Кроме этого, мы частично используем магическую энергию, содержащуюся в природе.
	AI_Output(self,other,"DIA_Addon_Saturas_PowerMagic_01_03");	//Поэтому наша магия имеет ряд преимуществ перед другими магическими школами, ибо с ее помощью можно порой одолеть даже самых сильных врагов.
};

instance DIA_ADDON_SATURAS_FirstRune(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = DIA_ADDON_SATURAS_FirstRune_condition;
	information = DIA_ADDON_SATURAS_FirstRune_info;
	permanent = FALSE;
	description = "Смогу ли я изучить вашу магию?";
};

func int DIA_ADDON_SATURAS_FirstRune_condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void DIA_ADDON_SATURAS_FirstRune_info()
{
	AI_Output(other,self,"DIA_ADDON_SATURAS_FirstRune_01_01");	//Смогу ли я изучить вашу магию?
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_02");	//Магия нашего Круга доступна только магам. А почему ты спрашиваешь об этом?
	AI_Output(other,self,"DIA_ADDON_SATURAS_FirstRune_01_03");	//Сейчас кругом много опасных монстров и бандитов. Я не смогу защитить себя в случае их нападения. 
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_04");	//Знаешь, в твоих словах есть доля правды.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_05");	//Обычно маги Воды никогда не делятся своими знаниями с непосвященными.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_06");	//Однако, учитывая, что ты помог нам в Долине Рудников и уже успел хорошо зарекомендовать себя тут, я сделаю исключение.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_07");	//Вот, возьми эту руну. Она поможет тебе защитить себя в случае опасности.
	B_GiveInvItems(self,other,ItRu_Zap,1);
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_08");	//Правда, чтобы воспользоваться ею, ты должен быть посвящен в первый Круг магии.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_09");	//К сожалению, я не могу обучить тебя этому, ибо нарушу правила нашего ордена.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_10");	//Поэтому тебе придется решить эту проблему самому.
};

instance DIA_ADDON_SATURAS_MEETHAGEN(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_meethagen_condition;
	information = dia_addon_saturas_meethagen_info;
	permanent = FALSE;
	description = "У меня есть проблема.";
};

func int dia_addon_saturas_meethagen_condition()
{
	if(other.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_meethagen_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_01");	//У меня есть проблема.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_02");	//Что тебе нужно, послушник?
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_03");	//Мне необходимо срочно попасть на прием к главе паладинов лорду Хагену.
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_05");	//У меня есть для него одно очень важное сообщение!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_09");	//Вряд ли паладины просто так пропустят тебя к нему.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_12");	//Но у меня есть одна идея.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_14");	//Как ты уже знаешь, совсем недавно нам удалось обнаружить портал, ведущий в неизвестную доселе часть острова.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_15");	//И рано или поздно мы наверняка найдем возможность открыть его.
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_16");	//И как это связано с моей проблемой?
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_18");	//Как только мы раскроем загадку этого таинственного портала, мы планируем проследовать внутрь него.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_19");	//Мы даже не представляем, что там нас ожидает.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_22");	//Покинув это место, мы оставим этот портал без присмотра. Чего, по моему мнению, никак нельзя будет допустить!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_23");	//И вот тут наверняка бы пригодилась помощь паладинов лорда Хагена.
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_24");	//Что ты задумал?
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_25");	//Я отправлю лорду Хагену послание с просьбой позаботиться о сохранности портала в наше отсутствие.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_26");	//Думаю, лорд Хаген вряд ли откажет нам в этой просьбе. Но это не главное.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_27");	//Главное, что именно ты понесешь ему это послание.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_33");	//Подожди минутку...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_34");	//Ммм... думаю, этого достаточно. Вот, возьми письмо.
	B_GiveInvItems(self,other,itwr_watermageletter,1);
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_35");	//Только не вздумай открывать или читать его, послушник!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_36");	//А теперь ступай к лорду Хагену.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_38");	//Да пребудет с тобой Аданос, сын мой!
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_CITY_TO_FOREST_04_05_4");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_CITY_TO_FOREST_04_05_7");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_CITY_TO_FOREST_04_05_8");
	MIS_WATERMAGELETTER = LOG_Running;
	Log_CreateTopic(TOPIC_WATERMAGELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WATERMAGELETTER,LOG_Running);
	B_LogEntry(TOPIC_WATERMAGELETTER,"Сатурас дал мне письмо, которое я должен отнести паладинам в Хоринисе. Теперь-то я точно смогу попасть в ратушу и встретиться с лордом Хагеном.");
};

instance DIA_ADDON_SATURAS_MEETHAGENOK(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_meethagenok_condition;
	information = dia_addon_saturas_meethagenok_info;
	permanent = FALSE;
	description = "Я передал письмо лорду Хагену.";
};

func int dia_addon_saturas_meethagenok_condition()
{
	if(HAGENTAKELETTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_meethagenok_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagenOk_01_01");	//Я передал письмо лорду Хагену.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagenOk_01_02");	//И что сказал лорд Хаген?
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagenOk_01_03");	//Он пришлет несколько паладинов для охраны портала.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagenOk_01_04");	//Хорошо! Теперь я могу не беспокоиться за сохранность портала.
	Wld_InsertNpc(pal_188_ritter,"NW_GUARDPORTAL_01");
	Wld_InsertNpc(pal_189_ritter,"NW_GUARDPORTAL_02");
	MIS_WATERMAGELETTER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WATERMAGELETTER,LOG_SUCCESS);
};


instance DIA_ADDON_SATURAS_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_prayforgomez_condition;
	information = dia_addon_saturas_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_saturas_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_prayforgomez_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_02");	//(удивленно) Тебе нужно благословение Воды? Зачем?
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_04");	//Это нужно не мне, а одной неупокоенной душе.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_07");	//Похоже, при жизни тот человек сделал очень много плохого, раз так вышло.
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_08");	//Достаточно много. Однако благословение Аданоса поможет простить эту грешную душу.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_09");	//И чья это душа?
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_10");	//Это душа бывшего рудного барона Гомеза.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_11");	//ГОМЕЗА?! Этого убийцы и палача?
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_12");	//(вне себя) Да как ты вообще посмел обратиться ко мне с ТАКОЙ просьбой?!
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_14");	//Этот ублюдок заслужил своей участи!
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_18");	//Так что ты напрасно теряешь свое время.
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Сатурас и другие маги Воды отказались помогать мне.");
	SATURASREFUSEHELPGOMEZ = TRUE;
};


instance DIA_ADDON_SATURAS_UNITOR(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_unitor_condition;
	information = dia_addon_saturas_unitor_info;
	permanent = FALSE;
	description = "Мне нужен еще один юнитор.";
};


func int dia_addon_saturas_unitor_condition()
{
	if((HOWCANMAKERUNE == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_unitor_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_Unitor_01_01");	//Мне нужен еще один юнитор.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_02");	//Извини, но мы уже использовали все юниторы, которые у нас были.
	AI_Output(other,self,"DIA_Addon_Saturas_Unitor_01_03");	//Тогда, может быть, ты знаешь, где мне найти еще один такой?
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_04");	//Боюсь, это невозможно. Те магические камни были созданы специально для того, чтобы мы смогли тогда сфокусировать всю нашу энергию и возвести Барьер.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_05");	//А при создании Барьера их было шесть. Да, точно. Ксардас был тринадцатым магом - средоточием наших магических сил. Мы же, двенадцать остальных разбились на пары. То есть всего было шесть пар.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_07");	//Я в тот момент работал с юнитором на вершине скалы, высившейся над будущим Болотным лагерем. А Нефариус стоял чуть позади и следил, чтобы мои жизненные силы не были подорваны мощью накапливающейся энергии. 
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_08");	//Если бы со мной что-то случилось, то работу с камнем продолжил бы он.
	AI_Output(other,self,"DIA_Addon_Saturas_Unitor_01_09");	//Никто никогда мне об этом не рассказывал. А где сейчас этот шестой юнитор?
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_10");	//Хмм. Я даже не могу сказать, где располагалась эта шестая позиция. Насколько я помню, на карте, которую я тебе давал в качестве ориентира, было пять точек. Они образовывали собой пентаграмму.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_11");	//Но шестой камень был, и заряжал его Корристо. Я вспомнил. После ритуала он пришел в замок без напарника, тот мистическим образом исчез.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_12");	//Позднее Корристо принял к себе в ученики Милтена, и многие прибывший после ошибочно считали его одним из создателей купола.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_13");	//Вся загадочность этой истории и факт того, что шестая позиция, шестой камень и все данные о напарнике Корристо были стерты из оставшихся у нас документов, толкают меня на мысль о том, что здесь не обошлось без Ксардаса.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_14");	//Да. Шестой юнитор у него!
 	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_15"); //И ты можешь попробовать наведаться в его старую башню, что в Долине Рудников.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_16");	//Есть вероятность того, что Ксардас оставил юнитор там.
	B_LogEntry(TOPIC_GUARDIANS,"По словам Сатураса, всего существовало шесть фокусирующих камней, и последний из них мог находится у Ксардаса, поскольку тот также принимал участие в возведении Барьера. Сатурас посоветовал мне поискать в старой башне некроманта в Долине Рудников.");
};


instance DIA_ADDON_SATURAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_runemagicnotwork_condition;
	information = dia_addon_saturas_runemagicnotwork_info;
	permanent = FALSE;
	description = "Ты все еще можешь использовать свою рунную магию?";
};


func int dia_addon_saturas_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Saturas_RuneMagicNotWork_01_00");	//Ты все еще можешь использовать свою рунную магию?
	AI_Output(self,other,"DIA_Addon_Saturas_RuneMagicNotWork_01_01");	//(гневно) Ты же не стал бы спрашивать об этом из любопытства! Ты знаешь об этом! И спрашиваешь, чтобы...
	AI_Output(self,other,"DIA_Addon_Saturas_RuneMagicNotWork_01_02");	//...посмеяться надо мной, да?! Позлорадствовать?! Ты смотришь теми же бесстыжими глазами, какими смотрел после кражи энергии из нашей руды!
	AI_Output(self,other,"DIA_Addon_Saturas_RuneMagicNotWork_01_03");	//Ох... извини. Да, руны отказали. С таким мы еще никогда не сталкивались. Ну, что ж теперь? Будем искать пути выхода из этой ситуации.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, маги Воды также потеряли свою способность использовать рунную магию.");
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_ADDON_SATURAS_WaterMageDocumentsDone(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = DIA_ADDON_SATURAS_WaterMageDocumentsDone_condition;
	information = DIA_ADDON_SATURAS_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = "Кажется, это принадлежит вам.";
};

func int DIA_ADDON_SATURAS_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_SATURAS_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_01");	//Кажется, это принадлежит вам.
	B_GiveInvItems(other,self,ItWr_WaterMageDoc,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_02");	//(удивленно) Довольно неожиданно, что Ли дал это поручение именно тебе.
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_03");	//А разве имеет большое значение, кто принес вам эти записи?
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_04");	//Нет, просто я рассчитывал на то, что он пошлет в Долину Рудников большой отряд наемников.
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_05");	//А ты, выходит, справился с этим в одиночку.
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_06");	//И тебя это удивляет?
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_07");	//Немного. Но в любом случае мы все очень благодарны тебе за помощь.
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_08");	//Думаю, ты найдешь достойное применение этим свиткам.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceWave,2);
	CreateInvItems(other,ItSc_LightningFlash,1);
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_09");	//Благодарю.
	MIS_WaterMageDocuments = LOG_Success;
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Success);
	B_LogEntry(TOPIC_WaterMageDocuments,"Я принес Сатурасу записи магов Воды, оставленные ими в Долине Рудников.");	
};