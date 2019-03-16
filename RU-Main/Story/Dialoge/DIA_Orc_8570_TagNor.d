const int Bonus_TagNor = 10;
const int Bonus_TagNor_HP = 100;

instance DIA_Orc_8570_TagNor_EXIT(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_exit_condition;
	information = DIA_Orc_8570_TagNor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_8570_TagNor_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8570_TagNor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_PreHello(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_PreHello_condition;
	information = DIA_Orc_8570_TagNor_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8570_TagNor_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_PreHello_info()
{
	AI_Output(self,other,"DIA_Orc_8570_TagNor_PreHello_01_01");	//МОРА КАР ТУК...(недовольно) ГРАК ДУР КАН?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_PreHello_01_02");	//Что ты сказал?!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_PreHello_01_03");	//БЕШ МОРА! ХАД КУД САД...
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_PreHelloOk(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_PreHelloOk_condition;
	information = DIA_Orc_8570_TagNor_PreHelloOk_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8570_TagNor_PreHelloOk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_PreHelloOk_info()
{
	AI_Output(self,other,"DIA_Orc_8570_TagNor_PreHelloOk_01_01");	//Что тебе нужно, морра?
};

instance DIA_Orc_8570_TagNor_Hello(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Hello_condition;
	information = DIA_Orc_8570_TagNor_Hello_info;
	important = FALSE;
	permanent = FALSE;
	description = "Я слышал, что ты лучший охотник среди орков.";
};

func int DIA_Orc_8570_TagNor_Hello_condition()
{
	if((TagNorTell == TRUE) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Hello_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Hello_Info_18_01");	//Я слышал, что ты лучший охотник среди орков.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_02");	//Аргххх...(пренебрежительно) И какое человек быть до этого дело?!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Hello_Info_18_03");	//Просто подумал, что ты бы мог научить меня своему ремеслу.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_04");	//Нет! Таг-Нор не будет ничему учить человек.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Hello_Info_18_05");	//Это еще почему?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_06");	//Потому что Таг-Нор не знать и не уважать его!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_07");	//Сначала тот должен показать, на что способен, и может быть, потом Таг-Нор учить человек, как стать великим охотник.
	MIS_TagNorRespect = LOG_Running;
	Log_CreateTopic(TOPIC_TagNorRespect,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_Running);
	B_LogEntry(TOPIC_TagNorRespect,"Я повстречал Таг-Нора. По словам орков, он является лучшим охотником клана и, думаю, мне стоит у него поучиться. Однако для начала мне придется доказать Таг-Нору, что я чего-то стою, принеся ему какой-нибудь редкий и особенный трофей.");
};

instance DIA_Orc_8570_TagNor_Muritan(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Muritan_condition;
	information = DIA_Orc_8570_TagNor_Muritan_info;
	permanent = FALSE;
	description = "У меня кое-что есть для тебя.";
};

func int DIA_Orc_8570_TagNor_Muritan_condition()
{
	if((MIS_TagNorRespect == LOG_Running) && ((Npc_HasItems(hero,ItAt_BuritanTooth) >= 1) || (Npc_HasItems(hero,ItAt_TrollBlackFur) >= 1) || (Npc_HasItems(hero,ItAt_CurratIshi) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Muritan_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Info_18_01");	//У меня тут кое-что есть для тебя.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Info_18_02");	//И что именно человек приносить Таг-Нор?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Info_18_03");	//Один очень редкий охотничий трофей. Вот, взгляни на него.
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);

	if(Npc_HasItems(other,ItAt_BuritanTooth) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan,"(отдать клык муритана)",DIA_Orc_8570_TagNor_Muritan_Claw);
	};
	if(Npc_HasItems(other,ItAt_TrollBlackFur) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan,"(отдать шкуру черного тролля)",DIA_Orc_8570_TagNor_Muritan_Fur);
	};
	if(Npc_HasItems(other,ItAt_CurratIshi) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan,"(отдать шип Иши-Куррата)",DIA_Orc_8570_TagNor_Muritan_Ishi);
	};
};

func void DIA_Orc_8570_TagNor_Muritan_Claw()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ItAt_BuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_BuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_01");	//Аргххх...(удивленно) То быть ядовитый зуб Муритана! Где человек взять его?!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Claw_01_02");	//Я смог выследить одну из этих тварей и убить ее.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_03");	//Человек быть очень умелым охотник, раз смочь убить его. Таг-Нор быть впечатлен!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Claw_01_04");	//Вижу, мой подарок произвел на тебя впечатление. Теперь ты научишь меня охотиться?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_06");	//Хорошо, Таг-Нор станет обучать человек. 
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_07");	//Хотя я думать, если человек убить Муритана, тот не сильно нуждаться в этом.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 10");
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect,"Я принес Таг-Нору редкий охотничий трофей - ядовитый клык Муритана. Это сильно впечатлило старого охотника орков, и он согласился обучить меня своему ремеслу.");
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);
};

func void DIA_Orc_8570_TagNor_Muritan_Fur()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Fur_01_01");	//Аргххх...(одобрительно) Быть шкура большой черный тролль!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Fur_01_02");	//Таг-Нор видеть, что человек быть очень умелый охотник.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Fur_01_03");	//Теперь ты научишь меня охотиться?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Fur_01_04");	//Хорошо, Таг-Нор станет обучать человек. 
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 5");
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect,"Я принес Таг-Нору редкий охотничий трофей - шкуру черного тролля, и он согласился обучить меня своему ремеслу.");
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);
};

func void DIA_Orc_8570_TagNor_Muritan_Ishi()
{
	B_GivePlayerXP(1500);
	B_GiveInvItems(other,self,ItAt_CurratIshi,1);
	Npc_RemoveInvItems(self,ItAt_CurratIshi,1);

	if(Trophy_IshiCurrat == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_IshiCurrat,Npc_HasItems(other,ItUt_IshiCurrat));
		Trophy_IshiCurrat = FALSE;
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_01");	//Хммм... Таг-Нор никогда не видеть такое! Он быть сильно удивленный.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_02");	//Он думать, что человек быть очень умелый охотник, если смог добыть такое.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_03");	//Значит, теперь ты научишь меня охотиться?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_04");	//Хорошо, Таг-Нор станет обучать человек! 
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_05");	//Но думать, что раз человек смог принести такой трофей Таг-Нор, ему это уже не быть нужно.
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 15");
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect,"Я принес Таг-Нору редкий трофей - спинной шип Иши-Куррата. Это очень впечатлило старого орка-охотника, и он согласился обучить меня своему ремеслу.");
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);
};

instance DIA_Orc_8570_TagNor_Bow(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Bow_condition;
	information = DIA_Orc_8570_TagNor_Bow_info;
	important = FALSE;
	permanent = FALSE;
	description = "А почему вы, орки, не пользуетесь луками?";
};

func int DIA_Orc_8570_TagNor_Bow_condition()
{
	if(TagNorTeach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Bow_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Bow_Info_18_01");	//А почему вы, орки, не пользуетесь луками?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Bow_Info_18_02");	//Лук быть оружием люди. Браты не уметь воевать из него!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Bow_Info_18_03");	//А что насчет арбалетов?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Bow_Info_18_04");	//Их тоже придумать люди, но мы суметь научиться использовать их в бою.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Bow_Info_18_05");	//Если человек иметь немного опыт, Таг-Нор может показать ему, как еще лучше стрелять из арбалет.
	TagNorTeachCrossBow = TRUE;
};

instance DIA_Orc_8570_TagNor_FindCrBow(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBow_condition;
	information = DIA_Orc_8570_TagNor_FindCrBow_info;
	permanent = FALSE;
	description = "Где мне достать хороший арбалет для охоты?";
};

func int DIA_Orc_8570_TagNor_FindCrBow_condition()
{
	if(TagNorTeachCrossBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBow_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_01");	//Где мне достать хороший арбалет для охоты?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_02");	//(задумчиво) Обычно для простой охотник подходить любой из арбалеты.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_03");	//Силы простого арбалета вполне хватать, чтобы рано или поздно убивать любой зверь.

	if((KELIOSFIRETEST == FALSE) && (SBMODE == TRUE))
	{
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_04");	//Но если человек хочет иметь оружие, достойное только великого охотника, то...
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_05");	//То что?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_06");	//...то, возможно, Таг-Нор сможет помогать ему. Но это быть очень непросто!
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_07");	//Я не боюсь трудностей! Рассказывай, где мне найти такое оружие.
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_08");	//Ну хорошо... Но тогда ты сначала приносить мне кое-какие вещи.
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_09");	//Ну, конечно, куда же без этого! Ладно, говори - что именно тебе нужно?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_10");	//Во-первых, Таг-Нору будет необходима руда магия! Очень много руда магия...
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_11");	//Сколько руды тебе нужно?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_12");	//Сто кусок руда ему вполне должно хватить.
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_13");	//Но это же целая гора руды!
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_14");	//А разве Таг-Нор говорить, что ему быть легко?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_15");	//Если тот считать это слишком сложно для него, то мы можем закончить этот разговор.
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBow);
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBow,"Да, это все не для меня.",DIA_Orc_8570_TagNor_FindCrBow_Back);
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBow,"Ладно, попробую достать для тебя эту руду.",DIA_Orc_8570_TagNor_FindCrBow_Forward);
	};
};

func void DIA_Orc_8570_TagNor_FindCrBow_Back()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Back_01_01");	//Да, это все не для меня.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Back_01_02");	//Как скажешь, человек.
	AI_StopProcessInfos(self);
};


func void DIA_Orc_8570_TagNor_FindCrBow_Forward()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_01");	//Ладно, попробую достать для тебя эту руду.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_02");	//Хорошо... И еще, если человек вдруг найти черная руда, то тоже может приносить ее Таг-Нору!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_03");	//Он обязательно найти применение и ей.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_04");	//Я учту это. Что еще тебе нужно?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_05");	//Второе, что ты должен будешь достать для Таг-Нор - это брусок дерева... буковый дерева!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_06");	//Слышать, что на юг острова расти такие деревья. Человек лучше искать там!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_07");	//Надеюсь, это все?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_08");	//Нет. Рог черного пещерного тролля! Ты должен приносить его Таг-Нор!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_09");	//Ага, это уже становится интересней...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_10");	//Почему человек так смотреть? Неужели он испугаться?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_11");	//Таг Нор думать, что такому охотнику, как ты это не быть трудно.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_12");	//Мне бы твою уверенность. Ну, что там дальше по списку?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_13");	//Потом мне понадобится... сухожилия огромный черный пума! Таг-Нор слышать, что они обитают в горах на юго-запад острова.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_14");	//Но быть осторожен, не порви их, когда будешь потрошить зверь. Иначе они становиться бесполезными!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_15");	//Постараюсь быть поаккуратней.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_16");	//И последняя, самая важная вещь, которую тебе нужно будет находить для меня - это редкий символ, что когда-то принадлежать великому охотнику орков!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_17");	//И где же мне искать этот редкий символ?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_18");	//Таг-Нор слышать, на старое кладбище орков похоронен один такой герой.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_22");	//Ну что же, работа предстоит не из легких. Не буду терять времени!
	MIS_TagNorGrHunWeap = LOG_Running;
	Log_CreateTopic(TOPIC_TagNorGrHunWeap,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_Running);
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Таг-Нор сказал, что может помочь мне достать оружие, достойное великих охотников. Однако после того как он рассказал мне, что для этого будет нужно, я почти пожалел о том, что ввязался во все это. Итак, мне необходимо принести Таг-Нору сто кусков магической руды, цельный брусок букового дерева, рог черного пещерного тролля, сухожилия гигантской черной пумы и, наконец - символ, который когда-то принадлежал великому охотнику орков. Искать последний Таг-Нор мне посоветовал на старом кладбище орков. По его словам, там должен быть похоронен один из таких героев.");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_BlackOre(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_BlackOre_condition;
	information = DIA_Orc_8570_TagNor_BlackOre_info;
	important = FALSE;
	permanent = FALSE;
	description = "А чем обычная магическая руда отличается от черной?";
};

func int DIA_Orc_8570_TagNor_BlackOre_condition()
{
	if(MIS_TagNorGrHunWeap == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_BlackOre_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_BlackOre_01_01");	//А чем обычная магическая руда отличается от черной?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BlackOre_01_02");	//Таг-Нор не может ответить человек на этот вопрос.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BlackOre_01_03");	//Но он точно знать, что черная руда иметь больше магия, чем обычная.
};

instance DIA_Orc_8570_TagNor_TeachHunting(C_Info)
{
	npc = Orc_8570_TagNor;
	nr = 5;
	condition = DIA_Orc_8570_TagNor_TeachHunting_Condition;
	information = DIA_Orc_8570_TagNor_TeachHunting_Info;
	permanent = TRUE;
	description = "Я хочу научиться разделывать добычу.";
};

func int DIA_Orc_8570_TagNor_TeachHunting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_8570_TagNor_Hello) && (TagNorTeach == TRUE) && (TagNorTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachHunting_Info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_TeachHunting_01_00");	//Я хочу научиться разделывать добычу.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_TeachHunting_01_01");	//Что человек хотеть знать?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
		Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,Dialog_Back,DIA_Orc_8570_TagNor_TeachHunting_Back);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Ломать когти.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Orc_8570_TagNor_TeachHunting_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Сдирать шкуру.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Orc_8570_TagNor_TeachHunting_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Вырывать клыки.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Orc_8570_TagNor_TeachHunting_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Вырезать огненный язык.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Orc_8570_TagNor_TeachHunting_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Отламывать рог драконьего снеппера.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Orc_8570_TagNor_TeachHunting_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8570_TagNor_TeachHunting_01_04");	//Больше мне нечему учить человек.
		TagNorTeachAll = TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachHunting_Back()
{
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Claws))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Fur))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Teeth))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_FireTongue))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_DrgSnapperHorn))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};


instance DIA_Orc_8570_TagNor_TeachCrossBow(C_Info)
{
	npc = Orc_8570_TagNor;
	nr = 6;
	condition = DIA_Orc_8570_TagNor_TeachCrossBow_Condition;
	information = DIA_Orc_8570_TagNor_TeachCrossBow_Info;
	permanent = TRUE;
	description = "Научи меня стрелять из арбалета.";
};

func int DIA_Orc_8570_TagNor_TeachCrossBow_Condition()
{
	if(TagNorTeachCrossBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_Info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_TeachCrossBow_15_00");	//Научи меня стрелять из арбалета.
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};


func void DIA_Orc_8570_TagNor_TeachCrossBow_Back()
{
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1()
{
	if(B_TeachFightTalentPercentOrc(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
	};
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5()
{
	if(B_TeachFightTalentPercentOrc(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
	};
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};

instance DIA_Orc_8570_TagNor_FindCrBowIng(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBowIng_condition;
	information = DIA_Orc_8570_TagNor_FindCrBowIng_info;
	permanent = TRUE;
	description = "Насчет тех вещей, которые тебе были нужны.";
};

func int DIA_Orc_8570_TagNor_FindCrBowIng_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (AllIngCrBow_All == FALSE) && ((AllIngCrBow_Ore == FALSE) || (AllIngCrBow_Tree == FALSE) || (AllIngCrBow_Horn == FALSE) || (AllIngCrBow_Puma == FALSE) || (AllIngCrBow_Sign == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_01");	//Насчет тех вещей, которые тебе были нужны.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_02");	//У человек есть, что показать Таг-Нор?

	Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
	Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,Dialog_Back,DIA_Orc_8570_TagNor_FindCrBowIng_Back);

	if((Npc_HasItems(other,ItMi_Nugget) >= 100) && (AllIngCrBow_Ore == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"Отдать магическую руду",DIA_Orc_8570_TagNor_FindCrBowIng_Ore);
	};

	if((Npc_HasItems(other,ItMi_BukTree) >= 1) && (AllIngCrBow_Tree == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"Отдать брусок бука",DIA_Orc_8570_TagNor_FindCrBowIng_Tree);
	};

	if((Npc_HasItems(other,ItAt_BlackTrollHorn) >= 1) && (AllIngCrBow_Horn == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"Отдать рог черного тролля",DIA_Orc_8570_TagNor_FindCrBowIng_Horn);
	};

	if((Npc_HasItems(other,ItAt_PumaMuscle) >= 1) && (AllIngCrBow_Puma == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"Отдать сухожилия пумы",DIA_Orc_8570_TagNor_FindCrBowIng_Puma);
	};

	if((Npc_HasItems(other,ItMi_HuntSign) >= 1) && (AllIngCrBow_Sign == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"Отдать символ охотника",DIA_Orc_8570_TagNor_FindCrBowIng_Sign);
	};

	if((Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 1) && (AllIngCrBow_BlackOre == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"Отдать черную магическую руду",DIA_Orc_8570_TagNor_FindCrBowIng_BlackOre);
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Ore()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_03");	//Тут сто кусков магической руды, как ты и просил.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_04");	//Хммм... быть хорошо! Можешь отдать ее Таг-Нору.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_05");	//Держи.
	B_GiveInvItems(other,self,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
	AllIngCrBow_Ore = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору все вещи, о которых он просил. Посмотрим, что будет дальше...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору сто кусков магической руды.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Tree()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_06");	//У меня есть цельный брусок тропического бука.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_07");	//Тогда давай его Таг-Нору!
	B_GiveInvItems(other,self,ItMi_BukTree,1);
	Npc_RemoveInvItems(self,ItMi_BukTree,Npc_HasItems(self,ItMi_BukTree));
	AllIngCrBow_Tree = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору все вещи, о которых он просил. Посмотрим, что будет дальше...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору цельный брусок тропического бука.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Horn()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_09");	//Вот рог пещерного черного тролля.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_10");	//Отлично, человек! Теперь отдай его Таг-Нору.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_11");	//Конечно.
	B_GiveInvItems(other,self,ItAt_BlackTrollHorn,1);
	Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,Npc_HasItems(self,ItAt_BlackTrollHorn));
	AllIngCrBow_Horn = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору все вещи, о которых он просил. Посмотрим, что будет дальше...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору рог пещерного черного тролля.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Puma()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_12");	//Здесь сухожилия черной пумы, как ты и просил.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_13");	//Если так, то Таг-Нор с радостью забрать их у человек.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_14");	//Вот они.
	B_GiveInvItems(other,self,ItAt_PumaMuscle,1);
	Npc_RemoveInvItems(self,ItAt_PumaMuscle,Npc_HasItems(self,ItAt_PumaMuscle));
	AllIngCrBow_Puma = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору все вещи, о которых он просил! Теперь посмотрим, что будет дальше...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору сухожилия черной пумы.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Sign()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_15");	//У меня есть символ великого охотника орков.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_16");	//Так тебе удалось его достать? Таг-Нор быть сильно удивлен! Скорей покажи мне его!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_17");	//Вот.
	B_GiveInvItems(other,self,ItMi_HuntSign,1);
	Npc_RemoveInvItems(self,ItMi_HuntSign,Npc_HasItems(self,ItMi_HuntSign));
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_18");	//Да, это он! Человек сделать все как надо... Таг-Нор быть очень довольный!
	AllIngCrBow_Sign = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору все вещи, о которых он просил. Посмотрим, что будет дальше...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Я принес Таг-Нору символ великого охотника орков.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_BlackOre()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_19");	//У меня есть черная руда.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_20");	//Быть очень хорошо! Но пока оставь ее, она еще пригодится человек.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_21");	//Как скажешь.
	AllIngCrBow_BlackOre = TRUE;
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Back()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_22");	//Пока ничего.
	Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
};

instance DIA_Orc_8570_TagNor_FindCrBowSmithTeacher(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_condition;
	information = DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_info;
	important = FALSE;
	permanent = FALSE;
	description = "Теперь у тебя все есть.";
};

func int DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (AllIngCrBow_All == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_01");	//Теперь у тебя все есть. Что дальше?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_02");	//Человек хорошо поработал... Достал все, что просил Таг-Нор.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_03");	//Но чтобы его труды не пропасть зря, он должен найти тот, кто сможет научить человек делать его оружие.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_04");	//Ты хочешь сказать, что я сам должен буду сделать этот арбалет?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_05");	//Быть именно так. Или человек думать, что за него это сделать Таг-Нор?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_06");	//Ну, я думал, что...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_07");	//Таг-Нор быть простым охотником и делать оружие он не уметь!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_08");	//Человек искать того, кто покажет человек, как можно сделать его.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_09");	//Кто бы это мог быть?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_10");	//Человек спросить это у таких же людей, как он. Возможно, тех, кто уметь ковать оружие.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_11");	//То есть у кузнецов. Что ж, я тебя понял.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_12");	//Хорошо. Когда человек будет уметь делать оружие, то он снова приходить к Таг-Нор.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_13");	//Тогда тот скажет, что человеку делать дальше.
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Таг-Нор хочет, чтобы я нашел того, кто научил бы меня делать арбалеты. Полагаю, надо поспрашивать об этом кузнецов.");
	FindSmithTeacherCrBow = TRUE;
};

instance DIA_Orc_8570_TagNor_BeginMakeNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_BeginMakeNimrod_condition;
	information = DIA_Orc_8570_TagNor_BeginMakeNimrod_info;
	important = FALSE;
	permanent = FALSE;
	description = "Я умею делать упоры для арбалетов.";
};

func int DIA_Orc_8570_TagNor_BeginMakeNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerTeachCrBowMade == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_BeginMakeNimrod_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_01");	//Я умею делать упоры для арбалетов.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_02");	//Если так, тогда человек быть готов к тому, чтобы создать великое оружие охотников орков!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_03");	//Что мне для этого нужно?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_04");	//Вот, он взять эти древний письмена орков. В них человек найдет все, что ему понадобиться.
	B_GiveInvItems(self,other,ItWr_DragNimrod,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_05");	//Таг-Нор также возвращать человеку все то, что он раньше приносить ему.
	CreateInvItems(other,ItMi_Nugget,100);
	CreateInvItems(other,ItMi_BukTree,1);
	CreateInvItems(other,ItAt_BlackTrollHorn,1);
	CreateInvItems(other,ItMi_HuntSign,1);
	CreateInvItems(other,ItAt_PumaMuscle,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_06");	//Теперь человек ступать и возвращаться к Таг-Нор, когда уже сделать великое оружие!
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Таг-Нор дал мне древние орочьи письмена, в которых описано создание великого оружия орков. Теперь мне остается только изготовить его.");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_GetNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_GetNimrod_condition;
	information = DIA_Orc_8570_TagNor_GetNimrod_info;
	permanent = FALSE;
	description = "Я создал арбалет великих охотников!";
};

func int DIA_Orc_8570_TagNor_GetNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && ((Npc_HasItems(hero,ITRW_GREATARBALET_ORC_01) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_02) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_03) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_04) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_05) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_GetNimrod_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_01");	//Я создал арбалет великих охотников орков!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_02");	//ХРОК НАКАР!!! (восхищенно) Неужели человек удалось это сделать? Создать великое оружие... 
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_03");	//...оружие, достойный только великих воинов.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_04");	//Как видишь, Таг-Нор! Я не стал бы тебя обманывать.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_05");	//Ну, раз так... Тогда человек может считать себя великим воином. И он по праву заслужить носить его!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_06");	//Собственно, это я и собирался сделать.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_07");	//Таг-Нор не удивляться тому, что человек захотеть оставить себе этот арбалет. С таким оружием он будет почти непобедимый!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_08");	//Однако Таг-Нор все-таки хотеть спросить человек об одной вещи.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_09");	//О какой?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_10");	//(вкрадчиво) Не хочет ли тот отдать это великое оружие Таг-Нору?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_11");	//Что?!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_12");	//Таг-Нор всегда мечтать иметь такое оружие, как Драг Нимрод! С такой арбалет Таг-Нор мог бы заслужить еще больше уважение своих братьев.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_13");	//А взамен человек смог бы попросить у Таг-Нора абсолютно все, чего бы он захотеть!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_14");	//Очень неожиданное предложение! Мне нужно хорошенько подумать об этом.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_15");	//Таг-Нор не торопить человек. Пусть тот думает столько, сколько захочет. А Таг-Нор будет ждать его ответа.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_16");	//Договорились. Но пока что я оставлю этот арбалет себе. Ты не возражаешь?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_17");	//Конечно, носи его! Ведь он быть по праву твой.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 10");
	};

	MIS_TagNorGrHunWeap = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Я сообщил Таг-Нору, что мне удалось сделать Драг Нимрод - арбалет великих охотников орков. Он по достоинству оценил мои труды и предложил отдать ему это оружие за соответствующее вознаграждение. Я должен подумать над его предложением.");};

instance DIA_Orc_8570_TagNor_GiveNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_GiveNimrod_condition;
	information = DIA_Orc_8570_TagNor_GiveNimrod_info;
	permanent = FALSE;
	description = "Тебе еще нужен тот арбалет?";
};

func int DIA_Orc_8570_TagNor_GiveNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_SUCCESS) && ((Npc_HasItems(hero,ITRW_GREATARBALET_ORC_01) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_02) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_03) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_04) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_05) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_GiveNimrod_info()
{
	B_GivePlayerXP(3000);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_01");	//Тебе еще нужен тот арбалет?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_02");	//Драг-Нимрод?! (оживленно) Таг-Нор уже говорить человек о том, что очень хотеть владеть им. Но почему он спрашивать?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_03");	//Я все-таки решил отдать его тебе.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_04");	//Человек говорить серьезно? Он действительно хотеть отдать ему Драг Нимрод?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_05");	//Да, но хотелось бы знать, что я получу взамен.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_06");	//Таг-Нор ожидать этих слов! Поэтому он хотеть предложить человек только то, что больше никто ему не сможет дать.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_07");	//И что же?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_08");	//Настоящее мастерство охотника - это всегда оставаться незаметным, когда подкрадываешься к своей добыча.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_09");	//Таг-Нор может показать человек, как на время становиться невидимым!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_10");	//Ты шутишь?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_11");	//Таг-Нор совсем не шутить. (серьезно) Он поделиться с человек этим секретом, если тот отдаст ему Драг-Нимрод!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_12");	//Но если ему это быть неинтересно, он может узнать, как увеличить свой сила, ловкость или жизненная энергия! Таг-Нор сможет обучить его и этому.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_14");	//Ну так что человек выбирать?
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 5");
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_GiveNimrod);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Покажи мне, как становиться невидимым.",DIA_Orc_8570_TagNor_GiveNimrod_Hide);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Покажи мне, как стать сильней.",DIA_Orc_8570_TagNor_GiveNimrod_Str);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Покажи мне, как стать ловчей.",DIA_Orc_8570_TagNor_GiveNimrod_Dex);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Покажи мне, как стать более живучим.",DIA_Orc_8570_TagNor_GiveNimrod_Hlth);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Hide()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_01");	//Покажи мне, как становиться невидимым.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_02");	//Ты выбрать самую ценную награду! Теперь человек слушать внимательно.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_03");	//Сперва возьми этот магический эликсир.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_04");	//Выпив его, ты становиться призраком, и ни одна живая душа не смочь увидеть тебя!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_05");	//И как долго я смогу оставаться невидимым?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_06");	//Таг-Нор быть это неизвестно. Но оно длиться до тех пор, пока ты сам не дашь себя обнаружить.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_07");	//Но нужно остерегаться созданий, порожденных сильная магия! Некоторые из них могут почувствовать присутствие человек поблизости!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_08");	//И тогда их магия разрушать действия чар эликсира.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_09");	//Хорошо, Таг-Нор. Я все понял. Держи свой арбалет, как мы и договаривались.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_10");	//ХРОТАК НАК!!!...(радостно) Наконец-то теперь самое великое оружие охотников орков у Таг-Нора! Он очень сильно благодарить человек за это.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_11");	//Ну да, само собой.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Str()
{
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,Bonus_TagNor);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_01");	//Покажи мне, как стать сильней.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_02");	//Как скажешь, человек. Теперь слушать меня внимательно.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_03");	//...(рассказывает)...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_04");	//Теперь ты стать куда более сильный, чем раньше.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_05");	//А вот твой арбалет, Таг-Нор. Как мы и договаривались.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_06");	//ХРОТАК НАК!!! (радостно) Наконец-то теперь самое великое оружие охотников орков у Таг-Нора! Он очень сильно благодарить человек за это.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_07");	//Ну да, само собой.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Dex()
{
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,Bonus_TagNor);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_01");	//Покажи мне, как стать более ловким.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_02");	//Как скажешь, человек. Теперь слушать меня внимательно.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_03");	//...(рассказывает)...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_04");	//Вот и все! Теперь ты стать куда более ловкий, чем раньше.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_05");	//А вот твой арбалет, Таг-Нор. Как мы и договаривались.


	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_06");	//ХРОТАК НАК!!! (радостно) Наконец-то теперь самое великое оружие охотников орков у Таг-Нора! Он очень сильно благодарить человек за это.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_07");	//Ну да, само собой.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Hlth()
{
	B_RaiseAttribute(other,ATR_HITPOINTS_MAX,Bonus_TagNor_HP);
	Npc_ChangeAttribute(other,ATR_HITPOINTS,Bonus_TagNor_HP);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_01");	//Покажи мне, как стать более живучим.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_02");	//Как скажешь, человек. Теперь слушать меня внимательно.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_03");	//...(рассказывает)...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_04");	//Вот и все! Теперь ты сможешь выдержать намного больше удары, чем раньше.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_05");	//А вот твой арбалет, Таг-Нор. Как мы и договаривались.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_06");	//ХРОТАК НАК!!! (радостно) Наконец-то теперь самое великое оружие охотников орков у Таг-Нора! Он очень сильно благодарить человек за это.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_07");	//Ну да, само собой.
	AI_StopProcessInfos(self);
};

//--------------------------------------орк торговец--------------------------------

var int OrcTradeDone_01;
var int OrcTradeDone_02;
var int OrcTradeDone_03;
var int OrcTradeDone_04;
var int OrcTradeDone_05;

instance DIA_Orc_8549_TradeOrc_EXIT(C_Info)
{
	npc = Orc_8549_TradeOrc;
	condition = DIA_Orc_8549_TradeOrc_exit_condition;
	information = DIA_Orc_8549_TradeOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8549_TradeOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8549_TradeOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8549_TradeOrc_Trade(C_Info)
{
	npc = Orc_8549_TradeOrc;
	condition = DIA_Orc_8549_TradeOrc_Trade_condition;
	information = DIA_Orc_8549_TradeOrc_Trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои товары.";
};

func int DIA_Orc_8549_TradeOrc_Trade_condition()
{
	return TRUE;
};

func void DIA_Orc_8549_TradeOrc_Trade_info()
{
	AI_Output(other,self,"DIA_Camper01_TRADE_15_00");	//Покажи свои товары.

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_03");	//ДАБАР КАРАД ГОР ТАК НИР ВАК.
		AI_StopProcessInfos(self);
	}
	else
	{
		if((OrcTradeDone_05 == FALSE) && (ORCRESPECT >= 90) && (other.guild != GIL_KDF) && (other.guild != GIL_KDM) && (other.guild != GIL_KDW) && (other.guild != GIL_GUR) && (other.guild != GIL_NOV) && (other.guild != GIL_NDW) && (other.guild != GIL_NDM) && (other.guild != GIL_DMT))
		{
			CreateInvItems(self,ItRu_ShadowMount,1);
			CreateInvItems(self,ItMw_Halleberde_Orc,1);
			OrcTradeDone_05 = TRUE;
		};
		if((OrcTradeDone_04 == FALSE) && (ORCRESPECT >= 70) && (ORCRESPECT < 90))
		{
			CreateInvItems(self,ITMI_QUICKSILVER,2);
			CreateInvItems(self,ItPl_Strength_Herb_01,1);
			CreateInvItems(self,ItMi_Sulfur,4);
			CreateInvItems(self,ITPO_XORCPOTION,1);
			CreateInvItems(self,ItAt_TrollFur,1);
			OrcTradeDone_04 = TRUE;
		};
		if((OrcTradeDone_03 == FALSE) && (ORCRESPECT >= 50) && (ORCRESPECT < 70))
		{
			CreateInvItems(self,ITRW_CROSSBOW_ORC,1);
			CreateInvItems(self,ItPl_Health_Herb_03,2);
			CreateInvItems(self,ItPl_Mushroom_01,5);
			CreateInvItems(self,ItMw_2H_OrcAxe_02,3);
			CreateInvItems(self,ITFO_ADDON_ORCRUM,1);
			CreateInvItems(self,ItAt_ShadowFur,2);
			OrcTradeDone_03 = TRUE;
		};
		if((OrcTradeDone_02 == FALSE) && (ORCRESPECT >= 30) && (ORCRESPECT < 50))
		{
			CreateInvItems(self,ITRW_CROSSBOW_ORC_LIGHT,1);
			CreateInvItems(self,ItMw_2H_OrcAxe_01,5);
			CreateInvItems(self,ITMI_NUGGET,2);
			CreateInvItems(self,ItMi_Coal,10);
			CreateInvItems(self,ItMi_Pitch,3);
			CreateInvItems(self,ItAt_ShadowHorn,2);
			OrcTradeDone_02 = TRUE;
		};
		if((OrcTradeDone_01 == FALSE) && (ORCRESPECT >= 10) && (ORCRESPECT < 30))
		{
			CreateInvItems(self,ItAt_WargFur,3);
			CreateInvItems(self,ItRw_Bolt,50);
			CreateInvItems(self,ItLsTorch,5);
			CreateInvItems(self,ITMI_SNUGGET,15);
			CreateInvItems(self,ItPl_Blueplant,3);
			CreateInvItems(self,ItFoMuttonRaw,10);
			OrcTradeDone_01 = TRUE;
		};
	};
};