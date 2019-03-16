
instance DIA_VIPER_EXIT(C_Info)
{
	npc = vlk_986_viper;
	nr = 999;
	condition = dia_viper_exit_condition;
	information = dia_viper_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_viper_exit_condition()
{
	return TRUE;
};

func void dia_viper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VIPER_HALLO(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_hallo_condition;
	information = dia_viper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_viper_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_viper_hallo_info()
{
	AI_Output(self,other,"DIA_Viper_HALLO_01_00");	//Эй, парень! Погоди ка... Да ведь я тебя знаю!
	AI_Output(self,other,"DIA_Viper_HALLO_01_01");	//Ты ведь тот ненормальный, что носился по всем пещерам в нашей шахте, а потом каким-то образом прикончил королеву ползунов.
	AI_Output(self,other,"DIA_Viper_HALLO_01_02");	//Ну точно, это ты!
	AI_Output(other,self,"DIA_Viper_HALLO_01_03");	//Ты бывший рудокоп? Что-то я тебя не припомню...
	AI_Output(self,other,"DIA_Viper_HALLO_01_04");	//Короткая же у тебя память, как я погляжу. Я же Вайпер - бывший плавильщик руды в Старой шахте.
	AI_Output(other,self,"DIA_Viper_HALLO_01_05");	//Точно! Но подожди... Ведь там... там все погибли. Как же тебе удалось выжить?
	AI_Output(self,other,"DIA_Viper_HALLO_01_06");	//Ну... присаживайся, выпьем и поговорим.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Viper_HALLO_01_07");	//Ты прав, в шахте действительно погибли все. Ну, почти все...
	AI_Output(self,other,"DIA_Viper_HALLO_01_08");	//Снайпсу и Алефу, так же, как и мне, просто сказочно повезло! Ты наверняка должен помнить этих парней.
	AI_Output(self,other,"DIA_Viper_HALLO_01_09");	//Первый постоянно стремился напакостить стражникам, а второй старался как можно меньше работать...(смеется)
	AI_Output(self,other,"DIA_Viper_HALLO_01_10");	//Так вот, в тот день Яну, начальнику шахты, приспичило вывезти руду на поверхность, чтобы переправить ее в старый лагерь.
	AI_Output(self,other,"DIA_Viper_HALLO_01_11");	//Меня назначили старшим...
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Viper_HALLO_01_13");	//... и я взял в помощь этих двух клоунов. Ну и пару стражников, конечно. Куда же без них.
	AI_Output(self,other,"DIA_Viper_HALLO_01_14");	//Мы поднялись наверх вместе с рудой и уже почти оказались у выхода из шахты.
	AI_Output(self,other,"DIA_Viper_HALLO_01_15");	//Тут все началось... Никто даже ничего и не понял.
	AI_Output(self,other,"DIA_Viper_HALLO_01_16");	//Раздался сильный грохот ломающихся подпорок и вода хлынула, как из старого корыта. Начался обвал нижних уровней!
	AI_Output(self,other,"DIA_Viper_HALLO_01_17");	//Мы с ребятами рванули к выходу, что есть сил. Стражники за нами не поспели - они были в шагах десяти от нас, когда на них обрушилась каменная плита.
	AI_Output(self,other,"DIA_Viper_HALLO_01_18");	//В общем, все было кончено в считанные секунды. А мы остались с рудой на поверхности.
	AI_Output(self,other,"DIA_Viper_HALLO_01_21");	//Ну... поначалу мы прятались в лесу - в Старый лагерь нам возвращаться было немного страшновато, поэтому мы с ребятами решили податься к людям Лареса.
	AI_Output(self,other,"DIA_Viper_HALLO_01_22");	//Но, решив, что появляться там с такой кучей руды - дело достаточно опасное, мы решили ее просто-напросто спрятать на время.
	AI_Output(self,other,"DIA_Viper_HALLO_01_25");	//Я остался стоять на часах, чтобы проследить за тем, что никто не следует за нами.
	AI_Output(self,other,"DIA_Viper_HALLO_01_26");	//Снайпс же и Алеф отправились закапывать руду. А через пару минут рухнул барьер!
	AI_Output(self,other,"DIA_Viper_HALLO_01_27");	//Дальше - все как в тумане. Когда я очнулся, кругом были орки. Много орков!
	AI_Output(self,other,"DIA_Viper_HALLO_01_28");	//Я спрятался в ближайшей пещере. А потом, дождавшись удобного момента, стал выбираться из долины.
	AI_Output(self,other,"DIA_Viper_HALLO_01_29");	//И вот я здесь.
	AI_Output(other,self,"DIA_Viper_HALLO_01_30");	//А что стало со Снайпсом и Алефом?
	AI_Output(self,other,"DIA_Viper_HALLO_01_31");	//Я бы и сам хотел это выяснить. И особенно - что стало с нашей рудой.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Viper_HALLO_01_34");	//Можно, конечно, было бы поискать в округе, но ведь и в долину не сунешься - там орки!
	AI_Output(other,self,"DIA_Viper_HALLO_01_35");	//А где это место?
	AI_Output(self,other,"DIA_Viper_HALLO_01_36");	//Ха! Вот так я тебе и сказал - нашел дурака!
};


instance DIA_VIPER_HELP(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_help_condition;
	information = dia_viper_help_info;
	permanent = FALSE;
	description = "Я могу помочь тебе отыскать руду.";
};


func int dia_viper_help_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_hallo))
	{
		return TRUE;
	};
};

func void dia_viper_help_info()
{
	AI_Output(other,self,"DIA_Viper_Help_01_00");	//Я могу помочь тебе отыскать руду. Если, конечно, ты поделишься со мной.
	AI_Output(self,other,"DIA_Viper_Help_01_01");	//Ты?! Ты точно чокнутый! (смеется) Там же орки! А то и похуже твари, как я слышал...
	AI_Output(other,self,"DIA_Viper_Help_01_02");	//С орками я как-нибудь разберусь.
	AI_Output(self,other,"DIA_Viper_Help_01_03");	//Ну, допустим. Но доверить тебе такую тайну...(недоверчиво) Что-то гложут меня сомнения!
	AI_Output(self,other,"DIA_Viper_Help_01_07");	//Ладно, если ты действительно хочешь помочь мне в этом деле, то...
	AI_Output(self,other,"DIA_Viper_Help_01_08");	//...скажем, можешь рассчитывать на...
	AI_Output(self,other,"DIA_Viper_Help_01_09");	//...сто кусков руды! Соглашайся - это ведь приличный кусок! Что скажешь?
	Info_AddChoice(dia_viper_help,"Да, по рукам!",dia_viper_help_ok);
	Info_AddChoice(dia_viper_help,"Нет. Это слишком мало!",dia_viper_help_no);
};

func void dia_viper_help_ok()
{
	AI_Output(other,self,"DIA_Viper_Help_Ok_00");	//Да, по рукам!
	AI_Output(self,other,"DIA_Viper_Help_Ok_01");	//Ну, значит, договорились! Эх... надеюсь, я не пожалею о том, что доверился тебе.
	AI_Output(other,self,"DIA_Viper_Help_Ok_03");	//Тогда скажи, где ты в последний раз видел парней?
	AI_Output(self,other,"DIA_Viper_Help_Ok_04");	//Мы расстались недалеко от моста, ведущего в Новый лагерь по пути из Старой шахты.
	AI_Output(self,other,"DIA_Viper_Help_Ok_07");	//А, вот еще что... Может, это как-то поможет тебе.
	AI_Output(self,other,"DIA_Viper_Help_Ok_09");	//Я слышал, что на ферме у Лобарта появился новый работник. Его, кажется, зовут так же, как звали одного из моих приятелей - Снайпс.
	AI_Output(self,other,"DIA_Viper_Help_Ok_10");	//Я не думаю, конечно, что это может быть он, но... чем Белиар не шутит, когда Иннос спит! В общем, проверить стоит.
	Info_ClearChoices(dia_viper_help);
	Wld_InsertNpc(bau_987_snipes,"NW_FARM1_FIELD_05");
	MIS_VIPERNUGGETS = LOG_Running;
	Log_CreateTopic(TOPIC_VIPERNUGGETS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_Running);
	B_LogEntry(TOPIC_VIPERNUGGETS,"В таверне Кардифа я встретил старого знакомого - Вайпера, плавильщика из Старой шахты. Он поведал мне о том, что там случилось и рассказал про его чудесное спасение со своими товарищами - Алефом и Снайпсом. Эти счастливчики еще успели прихватить с собой и кучу магической руды! Правда, им так и не удалось воспользоваться этой рудой. Что стало с теми парнями и с их рудой, Вайпер не знает.");
	B_LogEntry(TOPIC_VIPERNUGGETS,"Я предложил Вайперу помочь найти его руду, если он поделится со мной. Вайпер согласился. Последний раз он видел ребят недалеко от моста, ведущего в Новый лагерь. Еще он сказал, что недавно на ферме Лобарта появился работник, которого зовут Снайпс. Если это тот самый приятель Вайпера, то, возможно, он подскажет, где именно искать руду.");
};

func void dia_viper_help_no()
{
	AI_Output(other,self,"DIA_Viper_Help_No_00");	//Нет. Это слишком мало!
	AI_Output(self,other,"DIA_Viper_Help_No_01");	//Мало? Ну и запросы у тебя парень, я скажу.
	AI_Output(self,other,"DIA_Viper_Help_No_02");	//Извини, но больше сотни я не могу тебе предложить.
};


instance DIA_VIPER_HOW(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_how_condition;
	information = dia_viper_how_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_viper_how_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_help) && (MIS_VIPERNUGGETS == FALSE) && (VIPERRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_how_info()
{
	AI_Output(other,self,"DIA_Viper_How_01_00");	//Как дела, Вайпер? Все мечтаешь о кладе?
	AI_Output(self,other,"DIA_Viper_How_01_01");	//А ты все слоняешься без дела? Ступай своей дорогой.
};


instance DIA_VIPER_GETTREASURE(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_gettreasure_condition;
	information = dia_viper_gettreasure_info;
	permanent = FALSE;
	description = "Эй, Вайпер! Все сидишь без дела?";
};

func int dia_viper_gettreasure_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (VIPERGETNUGGETS == FALSE) && (TALKTOALEF == TRUE))
	{
		if((Npc_HasItems(other,ItMi_Nugget) >= 250) && (MEETSNIPS == FALSE))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItMi_Nugget) >= 200) && (MEETSNIPS == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_viper_gettreasure_info()
{
	AI_Output(other,self,"DIA_Viper_GetTreasure_01_00");	//Вайпер! Все сидишь без дела?
	AI_Output(self,other,"DIA_Viper_GetTreasure_01_01");	//Приходится... А что еще делать?
	AI_Output(self,other,"DIA_Viper_GetTreasure_01_02");	//Ну, а ты что скажешь? (взволнованно) Ты нашел руду?
	AI_Output(other,self,"DIA_Viper_GetTreasure_01_03");	//Не стоит так волноваться!

	if(MEETSNIPS == TRUE)
	{
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_04");	//Вот, держи. Здесь твои двести кусков. Можешь теперь наслаждаться жизнью!
		B_GiveInvItems(other,self,ItMi_Nugget,200);
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_05");	//Я не верю своим глазам! Какое счастье! Наконец-то я смогу зажить, как человек. Спасибо тебе, парень!
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_07");	//А что с остальными?
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_08");	//Алефу повезло намного меньше, чем тебе со Снайпсом.
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_09");	//Он так и не смог выбраться из долины - орки прикончили его раньше.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_10");	//Бедный, бедный Алеф...(печально) Кто бы мог подумать.
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_11");	//Я забрал его долю себе.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_12");	//Ну, раз Алеф мертв, - то, в общем, я не против. В конце концов, ты это честно заслужил!

		if(SNIPSGETNUGGETS == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(self,other,"DIA_Viper_GetTreasure_01_13");	//А что со Снайпсом?
			AI_Output(other,self,"DIA_Viper_GetTreasure_01_14");	//Снайпс также получил свою долю. И ему не нужно будет целыми днями гнуть спину на ферме Лобарта.
			MIS_VIPERNUGGETS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
			B_LogEntry(TOPIC_VIPERNUGGETS,"Я отдал Вайперу его долю. Он был так счастлив, что словами не передать!");
		}
		else
		{
			B_GivePlayerXP(100);
			AI_Output(self,other,"DIA_Viper_GetTreasure_01_15");	//Скажи мне, а что со Снайпсом?
			AI_Output(other,self,"DIA_Viper_GetTreasure_01_16");	//Я как раз хотел отдать ему его долю. И ему не нужно будет целыми днями гнуть спину на ферме Лобарта.
			B_LogEntry(TOPIC_VIPERNUGGETS,"Я отдал Вайперу его долю. Он был так счастлив, что словами просто не передать!");
		};
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_17");	//Вот, держи. Здесь твои двести пятьдесят кусков. Можешь теперь наслаждаться жизнью!
		B_GiveInvItems(other,self,ItMi_Nugget,250);
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_18");	//Я не верю своим глазам! Какое счастье! Наконец-то я смогу зажить, как человек. Спасибо тебе, парень!
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_19");	//Но постой! А почему двести пятьдесят кусков?
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_20");	//Снайпса я так и не нашел, а Алефу руда уже точно не понадобится.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_21");	//Что ты хочешь этим сказать?
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_22");	//Алефу повезло намного меньше, чем тебе.
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_23");	//Он так и не смог выбраться из долины. Орки прикончили его раньше.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_24");	//Бедный, бедный Алеф...(печально) Кто бы мог подумать.
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_25");	//Я забрал его долю себе. А долю Снайпса поделил между нами поровну.
		MIS_VIPERNUGGETS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
		B_LogEntry(TOPIC_VIPERNUGGETS,"Я отдал Вайперу его долю. Он был так счастлив, что словами не передать!");
	};
	AI_Output(self,other,"DIA_Viper_GetTreasure_01_27");	//Да, ты парень что надо! Я в тебе не сомневался! Спасибо.
	VIPERGETNUGGETS = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VIPER_HELLO(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_hello_condition;
	information = dia_viper_hello_info;
	permanent = TRUE;
	description = "Эй, Вайпер! Как дела?";
};


func int dia_viper_hello_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (VIPERGETNUGGETS == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_hello_info()
{
	AI_Output(other,self,"DIA_Viper_Hello_01_00");	//Эй, Вайпер! Как дела?
	AI_Output(self,other,"DIA_Viper_Hello_01_01");	//Займись каким-нибудь полезным делом.
	AI_Output(self,other,"DIA_Viper_Hello_01_02");	//(раздраженно) Например, поисками нашей руды!
};


instance DIA_VIPER_HELLOAFTER(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_helloafter_condition;
	information = dia_viper_helloafter_info;
	permanent = TRUE;
	description = "Эй, Вайпер! Как дела?";
};


func int dia_viper_helloafter_condition()
{
	if((MIS_VIPERNUGGETS == LOG_SUCCESS) && (VIPERRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_helloafter_info()
{
	AI_Output(other,self,"DIA_Viper_HelloAfter_01_00");	//Эй, Вайпер! Как дела?
	AI_Output(self,other,"DIA_Viper_HelloAfter_01_01");	//Все здорово! Лучше не придумаешь!
};


instance DIA_VIPER_MEETSNIPS(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_meetsnips_condition;
	information = dia_viper_meetsnips_info;
	permanent = FALSE;
	description = "У меня есть новости.";
};


func int dia_viper_meetsnips_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo))
	{
		return TRUE;
	};
};

func void dia_viper_meetsnips_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Viper_MeetSnips_01_00");	//У меня есть новости.
	if(MEETSNIPS == TRUE)
	{
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_04");	//Тот парень, что недавно устроился работать на ферме Лобарта, - как раз и есть твой бывший приятель Снайпс.
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_06");	//Но он так же, как и ты не знает, где находится руда.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_07");	//КАК?
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_08");	//Они с Алефом нашли одну пещеру, в которой и решили закопать руду. Снайпс остался снаружи, а Алеф пошел внутрь.
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_09");	//Когда Барьер рухнул, вход в пещеру завалило камнями, а Снайпса шарахнуло по голове камнем и он отключился на некоторое время.
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_10");	//Он быстренько смылся из долины. А что стало с Алефом и рудой, он не знает.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_11");	//М-да... И что же теперь делать?
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_12");	//Снайпс указал мне приблизительное место той пещеры, в которой они хотели закопать руду.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_14");	//Хорошо, наведайся туда и разыщи Алефа.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_15");	//Держи меня в курсе событий.
		B_LogEntry(TOPIC_VIPERNUGGETS,"Вайпер был рад услышать, что Снайпс жив, но был сильно огорчен, что тот не знает, где руда. Видимо, только Алеф сможет точно сказать, где зарыта руда. Поиски следует начать с того места, где Снайпс последний раз разговаривал с Алефом.");
	}
	else
	{
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_18");	//Тот парень, что недавно устроился работать на ферме Лобарта, - не тот Снайпс, которого мы ищем.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_20");	//И что же теперь делать?
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_23");	//Думаю, мне придется посетить Долину Рудников.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_24");	//Хорошо, наведайся туда и разыщи Алефа.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_25");	//Держи меня в курсе событий.
		B_LogEntry(TOPIC_VIPERNUGGETS,"Я сказал Вайперу, что мы, видимо, ошиблись, полагая, что парень на ферме Лобарта - тот самый Снайпс, что причастен к руде. Похоже, только Алеф сможет точно сказать, где зарыта руда. Вот только где его искать?..");
	};
};

instance DIA_VIPER_PICKPOCKET(C_Info)
{
	npc = vlk_986_viper;
	nr = 900;
	condition = dia_viper_pickpocket_condition;
	information = dia_viper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_viper_pickpocket_condition()
{
	return C_Beklauen(15,25);
};

func void dia_viper_pickpocket_info()
{
	Info_ClearChoices(dia_viper_pickpocket);
	Info_AddChoice(dia_viper_pickpocket,Dialog_Back,dia_viper_pickpocket_back);
	Info_AddChoice(dia_viper_pickpocket,DIALOG_PICKPOCKET,dia_viper_pickpocket_doit);
};

func void dia_viper_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_viper_pickpocket);
};

func void dia_viper_pickpocket_back()
{
	Info_ClearChoices(dia_viper_pickpocket);
};

instance DIA_VIPER_HOWORELIQ(C_Info)
{
	npc = vlk_986_viper;
	nr = 4;
	condition = dia_viper_howoreliq_condition;
	information = dia_viper_howoreliq_info;
	permanent = FALSE;
	description = "Ты знаешь, кто может научить добывать руду?";
};

func int dia_viper_howoreliq_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_help) && (ABOUTSWBL == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_howoreliq_info()
{
	AI_Output(other,self,"DIA_Viper_HOWORELIQ_01_00");	//Ты знаешь, кто может научить добывать руду?
	AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_01");	//Снайпс неплохо разбирался в этом...

	if(Npc_KnowsInfo(other,dia_snipes_hallo))
	{
		AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_02");	//Да ты и сам уже знаешь...
	};

	AI_Output(other,self,"DIA_Viper_HOWORELIQ_01_03");	//А кто умеет плавить руду?
	AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_04");	//Хммм...(самодовольно) Я в Долине Рудников считался самым лучшим плавильщиком руды!
	AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_05");	//И мог бы научить тебя. Не задаром, конечно!
	B_LogEntry(TOPIC_STEELDRAW,"Вайпер может научить меня плавке руды, а Снайпс - ее добыче.");
};

instance DIA_VIPER_HOWORELIQ2(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_howoreliq2_condition;
	information = dia_viper_howoreliq2_info;
	permanent = TRUE;
	description = "Научи меня плавить железную руду. (Очки обучения: 3, Цена: 800 монет)";
};

func int dia_viper_howoreliq2_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_howoreliq) && (KNOWHOWTOOREFUS != TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_howoreliq2_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Viper_HOWORELIQ2_01_00");	//Научи меня плавить железную руду.
	kosten = 3;
	money = 800;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
		AI_StopProcessInfos(self);
	};

	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_01_01");	//В плавильной печи все проще, но подойдет и простой кузнечный горн.
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_01_04");	//Тебе нужно как минимум пятьдесят кусков руды. Топишь их в печи, а потом сливаешь в форму.
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_01_05");	//Вот и весь секрет плавки.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучено: плавка руды");
		KNOWHOWTOOREFUS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_STEELDRAW,"Теперь я умею переплавлять железную руду в слитки. Для этого нужен кузнечный горн и пятьдесят кусков руды.");
	};
};

instance DIA_VIPER_MAGICOREMAKE(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_MAGICOREMAKE_condition;
	information = dia_viper_MAGICOREMAKE_info;
	permanent = TRUE;
	description = "А что насчет плавки магической руды?";
};

func int dia_viper_MAGICOREMAKE_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_howoreliq) && (KNOWHOWTOOREFUS == TRUE) && (ViperTeachMagicOre == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_MAGICOREMAKE_info()
{
	AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_01_01");	//А что насчет плавки магической руды?

 	if((MIS_VIPERNUGGETS == LOG_SUCCESS) || (VIPERGETNUGGETS == TRUE))
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_02");	//Хммм...(задумчиво) С этим дело обстоит уже куда более серьезней.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_03");	//Насколько мне известно, секрет изготовления болванок из магической руды знают только кузнецы Нордмара!
		AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_01_04");	//Этим ты меня успокоил.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_05");	//Но тебе повезло. За долгие годы, проведенные в колонии, я тоже смог кое-чему научиться.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_06");	//Недаром все меня считали лучшим плавильщиком в Долине Рудников!
		AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_01_07");	//А меня ты можешь этому научить?
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_08");	//Конечно.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_09");	//Золота я с тебя за это не возьму. Так научу, по старой дружбе.
		B_LogEntry(TOPIC_STEELDRAW,"Вайпер сможет научить меня плавить магическую руду.");
		ViperTeachMagicOre = TRUE;
	}
	else if((MIS_VIPERNUGGETS == LOG_RUNNING) && (VIPERGETNUGGETS == FALSE))
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_10");	//Сначала разберись с нашей рудой! 
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_11");	//А потом мы уже обсудим и это.
	}
	else
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_12");	//(ехидно) Боюсь, тут я пока ничем тебе помочь не смогу. 
	};
};

instance DIA_VIPER_MAGICOREMAKE_TEACH(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_MAGICOREMAKE_TEACH_condition;
	information = dia_viper_MAGICOREMAKE_TEACH_info;
	permanent = TRUE;
	description = "Научи меня плавить магическую руду. (Очки обучения: 10)";
};

func int dia_viper_MAGICOREMAKE_TEACH_condition()
{
	if((ViperTeachMagicOre == TRUE) && (PlayerRudoplav == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_MAGICOREMAKE_TEACH_info()
{
	var int kosten;

	kosten = 10;

	AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_TEACH_01_00");	//Научи меня плавить магическую руду.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_01");	//Процесс плавки магической руды довольно сложен...
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_02");	//В простом кузнечном горне можно изготовить только обычный рудный слиток.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_03");	//Полагаю, что для этих целей тебе понадобится не меньше пятидесяти кусков.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_04");	//Что же касается самого процесса изготовления, то тут все делается поэтапно.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_05");	//Вначале медленно плавишь магическую руду. Но только не слишком медленно!
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_06");	//Далее не спеша выпариваешь из нее различные примеси. Чем дольше, тем лучше...
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_07");	//Потом сливаешь полученный сплав в литейную форму и медленно охлаждаешь ее.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_08");	//Вот, собственно, и все! Надеюсь, что ты запомнил мой урок.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Изучено: плавка магической руды");
		PlayerRudoplav = TRUE;
		Snd_Play("LevelUP");

		if(ORE_TOPIC_EXIST != TRUE)
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			ORE_TOPIC_EXIST = TRUE;
		};

		B_LogEntry(TOPIC_MAGICORE,"Теперь я умею переплавлять магическую руду в слитки. Для изготовления одного слитка необходим кузнечный горн и около пятидесяти кусков магической руды.");
	};
};

instance DIA_VIPER_CLEARMAGICOREMAKE(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_CLEARMAGICOREMAKE_condition;
	information = dia_viper_CLEARMAGICOREMAKE_info;
	permanent = FALSE;
	description = "А как мне получить ЧИСТУЮ болванку из магической руды?";
};

func int dia_viper_CLEARMAGICOREMAKE_condition()
{
	if((KNOW_NIMROD_MAKE == TRUE) && (PlayerRudoplav == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_CLEARMAGICOREMAKE_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_01");	//А как мне получить ЧИСТУЮ болванку из магической руды?
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_02");	//Изготовление такой болванки требует куда более сложного подхода.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_03");	//Тебе понадобится особенная печь, где тебе не придется постоянно отслеживать уровень нагрева руды.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_04");	//Ибо самое главное в этом процессе - поддерживать очень высокую температуру и обязательно на определенном уровне!
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_05");	//Я не знаю, остались ли на этом острове подобные плавильни. 
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_06");	//Но, думаю, что с этим вопросом ты разберешься как-нибудь сам.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_07");	//Кроме того, для изготовления подобной болванки нужно иметь куда больше руды.
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_08");	//Сколько?
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_09");	//Примерно сто кусков руды - не меньше...
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_10");	//И лучше всего работать с инструментом, сделанным из того же материала, что и сама болванка.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_11");	//Иначе ее магические свойства могут ослабнуть, или вовсе исчезнуть.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_12");	//В остальном процесс изготовления схож. Главное - внимательность и аккуратность!
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_13");	//Понимаю.
	ClearPlayerRudoplav = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Для изготовления ЧИСТОЙ рудной болванки потребуется около сотни кусков руды, особенная магическая печь и такой же инструмент.");
};

instance DIA_VIPER_ASKMINEDATA(C_Info)
{
	npc = vlk_986_viper;
	nr = 7;
	condition = dia_viper_askminedata_condition;
	information = dia_viper_askminedata_info;
	permanent = FALSE;
	description = "В шахте недалеко от фермы Онара еще имеется руда.";
};

func int dia_viper_askminedata_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_askminedata_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_VIPER_AskMineData_01_01");	//Я обнаружил, что в заброшенной шахте недалеко от фермы Онара еще имеется магическая руда.
	AI_Output(other,self,"DIA_VIPER_AskMineData_01_02");	//Ты не мог бы сходить туда и посмотреть, действительно ли там можно что-то добыть?
	AI_Output(self,other,"DIA_VIPER_AskMineData_01_03");	//Руда? Здесь, в Хоринисе?
	AI_Output(other,self,"DIA_VIPER_AskMineData_01_04");	//Вот именно. Мне нужно знать, стоит ли мне наладить добычу руды, или лучше оставить эту затею.
	AI_Output(self,other,"DIA_VIPER_AskMineData_01_05");	//Хорошо, мне все равно сейчас нечем заняться. Пойдем к твоей шахте.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_VIPER_GETMINEDATA(C_Info)
{
	npc = vlk_986_viper;
	nr = 7;
	condition = dia_viper_getminedata_condition;
	information = dia_viper_getminedata_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_viper_getminedata_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (Npc_KnowsInfo(other,dia_viper_askminedata) == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_13") < 500) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_getminedata_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_01");	//Мы на месте.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_02");	//Эта та самая шахта? И... это все?
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_03");	//А на что ты рассчитывал?
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_05");	//Ну, конечно, не на подобие Старой шахты, но все же...
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_06");	//Кхм-кхм.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_07");	//Ах да...(оценивающе) Ну, как минимум ящиков десять ты точно сможешь отсюда добыть.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_08");	//А если жилы уходят вглубь, - а, судя по их виду, это вполне вероятно, - то и больше.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_09");	//По качеству же руда здесь, пожалуй, не хуже, чем в самой Долине Рудников.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_10");	//В общем, мне кажется, что тебе стоит попробовать.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_11");	//Только мне интересно, где ты сейчас найдешь желающих работать в шахте.
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_02");	//А что насчет тебя? Добыча руды, конечно, не твоя специализация, но ты не хочешь немного помахать киркой?
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_03");	//Никаких ползунов здесь нет, охрана не докучает, работать целыми сутками никто заставлять не будет.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	SearchOreMine = TRUE;
	B_LogEntry(TOPIC_DTOLDNEWMINE,"Вайпер считает, что из этого места вполне реально выкачать немало руды. А это значит, что теперь мне нужны опытные рудокопы...");

	if(MIS_VIPERNUGGETS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_VIPER_GetMineData_01_14");	//А зачем мне все это? Теперь, когда ты вернул мне руду, я могу еще долго не работать.
		Info_ClearChoices(DIA_VIPER_GetMineData);

		if(RhetorikSkillValue[1] >= 45)
		{
			Info_AddChoice(DIA_VIPER_GetMineData,"(попытаться убедить)",DIA_VIPER_GetMineData_Yes);
		};

		Info_AddChoice(DIA_VIPER_GetMineData,"Хорошо, постараюсь найти кого-нибудь другого.",DIA_VIPER_GetMineData_No);
	}
	else
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_VIPER_GetMineData_01_15");	//(задумчиво) А сколько будешь платить? И что насчет еды и жилья?
		AI_Output(other,self,"DIA_VIPER_GetMineData_15_16");	//В качестве оплаты можешь забирать себе треть добываемой тобой руды.
		AI_Output(other,self,"DIA_VIPER_GetMineData_15_17");	//Жить и есть будешь здесь, в моей башне. Так что скажешь?
		AI_Output(self,other,"DIA_VIPER_GetMineData_01_18");	//Звучит неплохо. Хорошо, я согласен.
		self.npcType = NPCTYPE_FRIEND;
		self.aivar[AIV_ToughGuy] = TRUE;
		self.aivar[AIV_IGNORE_Theft] = TRUE;
		self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
		self.aivar[AIV_IgnoresArmor] = TRUE;
		VIPERRECRUITEDDT = TRUE;
	
		if(DT_OREGATHER_START == FALSE)
		{
			DT_OREGATHER_START = TRUE;
			EVERYDAYDTORE = Wld_GetDay();
		};
		
		B_LogEntry(TOPIC_PPL_FOR_TOWER,"Мне удалось уговорить Вайпера поработать у меня в шахте.");
		B_LogEntry(TOPIC_DTOLDNEWMINE,"Вайпер согласился работать в шахте, но один он много руды не добудет. Необходимо найти еще людей.");
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"InTower");
	};
};

func void DIA_VIPER_GetMineData_yes()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_00");	//Но рано или поздно тебе все равно придется вернуться к работе.
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_01");	//И где ты тогда будешь работать? Вышибалой у Кардифа? Корячиться на ферме?
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_02");	//Или вернешься в Долину Рудников?
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_03");	//Свою руду ты всегда успеешь потратить, я же тебе предлагаю вполне сносную работу, бесплатное жилье и еду.
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_04");	//Кроме того, треть добытой тобой руды ты сможешь оставлять себе.
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_05");	//Ты точно уверен, что хочешь отказаться? Второго шанса не будет.
	AI_Output(self,other,"DIA_VIPER_GetMineData_yes_01_06");	//Погоди, дай подумать…
	AI_Output(self,other,"DIA_VIPER_GetMineData_yes_01_10");	//Ааа, хорошо. Будь по-твоему. Но треть руды - моя!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	VIPERRECRUITEDDT = TRUE;

	if(DT_OREGATHER_START == FALSE)
	{
		DT_OREGATHER_START = TRUE;
		EVERYDAYDTORE = Wld_GetDay();
	};

	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Мне удалось уговорить Вайпера поработать у меня в шахте");
	B_LogEntry(TOPIC_DTOLDNEWMINE,"Вайпер согласился работать в шахте, но один он много руды не добудет. Необходимо найти еще людей.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

func void DIA_VIPER_GetMineData_no()
{
	AI_Output(other,self,"DIA_VIPER_GetMineData_no_15_00");	//Хорошо, постараюсь найти кого-нибудь другого.
	AI_Output(self,other,"DIA_VIPER_GetMineData_no_01_01");	//Ага, бывай. Удачи в поисках.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_VIPER_INTOWER(C_Info)
{
	npc = vlk_986_viper;
	nr = 22;
	condition = dia_viper_intower_condition;
	information = dia_viper_intower_info;
	permanent = TRUE;
	description = "Эй, Вайпер! Как дела?";
};

func int dia_viper_intower_condition()
{
	if((VIPERRECRUITEDDT == TRUE) && (MIS_VIPERNUGGETS != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_viper_intower_info()
{
	AI_Output(other,self,"DIA_Viper_HelloAfter_01_00");	//Эй, Вайпер! Как дела?
	AI_Output(self,other,"DIA_Viper_HelloAfter_01_01");	//Все здорово! Лучше не придумаешь!
};