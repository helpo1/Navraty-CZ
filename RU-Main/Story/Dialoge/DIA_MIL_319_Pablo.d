
instance DIA_Pablo_EXIT(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 999;
	condition = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Pablo_PICKPOCKET(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 900;
	condition = DIA_Pablo_PICKPOCKET_Condition;
	information = DIA_Pablo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ) ";
};

func int DIA_Pablo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,Dialog_Back,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_City_Tower_01,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
};


var int Pablo_belogen;

instance DIA_Pablo_WANTED(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_WANTED_Condition;
	information = DIA_Pablo_WANTED_Info;
	important = TRUE;
};


func int DIA_Pablo_WANTED_Condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pablo_WANTED_Info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Эй, подожди - мне кажется, что я тебя знаю.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Я где-то уже видел твое лицо...(задумчиво) А, точно!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Вот - мы нашли этот листок у одного из бандитов, на которых наткнулись несколько дней назад - рисунок очень похож на тебя.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//По-видимому, эти парни искали тебя.
	Info_ClearChoices(DIA_Pablo_WANTED);
	Info_AddChoice(DIA_Pablo_WANTED,"Нет, боюсь, что ты ошибаешься.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice(DIA_Pablo_WANTED,"Хм, я сам бы об этом никогда не догадался.",DIA_Pablo_WANTED_IRONY);
};

func void DIA_Pablo_WANTED_NOTHING()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Нет, боюсь, что ты ошибаешься. Со мной все в порядке!
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Как скажешь, чужеземец.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Но если это все же ТВОЯ физиономия - и если у тебя возникнут проблемы - постарайся решать их за городом. Здесь и без того трудностей хватает.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//А чужаки, которые приносят в город проблемы, долго здесь не задерживаются - надеюсь, я ясно выразился.
	Pablo_belogen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Pablo_WANTED_IRONY()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Хм, я сам бы об этом никогда не догадался.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Очень смешно. Что этим парням было нужно от тебя?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Спроси их сам. Они ведь сидят у вас за решеткой, разве нет?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Нет - они мертвы.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//Ну, тогда мы никогда этого не узнаем.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//Если у тебя какие-то проблемы - иди и поговори с лордом Андрэ. Возможно, он сможет помочь. Ты найдешь его в казармах.
	AI_StopProcessInfos(self);
};

instance DIA_PABLO_RUPERT(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_PABLO_RUPERT_condition;
	information = DIA_PABLO_RUPERT_info;
	permanent = FALSE;
	description = "Меня прислал Руперт.";
};

func int DIA_PABLO_RUPERT_condition()
{
	if((CanTeachTownMaster == FALSE) && (RupertSendPablo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_PABLO_RUPERT_info()
{
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_01");	//Меня прислал Руперт.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_02");	//(недовольно) И что с того?
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_03");	//Он сказал, что ты можешь помочь мне завоевать расположение мастеров из этого квартала.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_04");	//Что, никто из них не хочет общаться с тобой, да?
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_05");	//Все они принимают меня за нищего попрошайку.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_06");	//Это и неудивительно. Ты очень похож на подозрительного бродягу, и таким, как ты, здесь не особо рады.
	AI_PlayAni(self,"T_SEARCH");

	if((ComeThrowSea == FALSE) && (LotarTrueCome == TRUE))
	{
		AI_Output(self,other,"DIA_PABLO_RUPERT_01_07");	//Я скажу даже больше. Если бы я своими собственными глазами не видел, как тебя впустила стража...
		AI_Output(self,other,"DIA_PABLO_RUPERT_01_08");	//...и что паладин Лотар говорил с тобой, то я бы приказал схватить тебя и отправить на допрос в казармы ополчения.
		AI_Output(other,self,"DIA_PABLO_RUPERT_01_09");	//Ну, у тебя есть шанс сделать это сейчас.
	};

	AI_Output(self,other,"DIA_PABLO_RUPERT_01_10");	//Да ладно тебе. Не обижайся! Я уже вижу, что ты человек порядочный.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_11");	//Уж у меня на это глаз наметан, поверь.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_12");	//Так что я помогу тебе. (серьезно) Но для начала, тебе надо обзавестись нормальной одеждой.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_13");	//Ибо то тряпье, что на тебе сейчас, никуда не годится!
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_14");	//Где мне ее взять?
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_15");	//Сходи к Ханне, хозяйке гостиницы, что напротив казарм ополчения. И скажи ей, что это я прислал тебя.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_16");	//Пусть она продаст тебе нормальную и чистую одежду.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_17");	//Ну, а после поговорим об остальном. Все, ступай.
	MIS_PathFromDown = LOG_Running;
	Log_CreateTopic(Topic_PathFromDown,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PathFromDown,LOG_Running);
	B_LogEntry(TOPIC_PathFromDown,"Пабло согласился помочь мне, но для начала мне надо раздобыть одежду горожанина. Это можно сделать у Ханны, хозяйки гостиницы в Хоринисе.");
};

instance DIA_Pablo_PathFromDown(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_PathFromDown_condition;
	information = DIA_Pablo_PathFromDown_info;
	permanent = TRUE;
	description = "Как тебе моя одежда?";
};

func int DIA_Pablo_PathFromDown_condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (Hanna_LeatherBought == TRUE) && (PabloQuestsUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PathFromDown_info()
{
	AI_Output(other,self,"DIA_Pablo_PathFromDown_01_01");	//Как тебе моя одежда?

	if(VlkL_ArmorUp == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_02");	//Да, так намного лучше. Теперь ты похож на простого обывателя этого города.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_03");	//Что дальше?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_04");	//Теперь тебе надо позаботиться о своей репутации. Без нее ты тут ничего не добьешься.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_05");	//И как мне это сделать?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_06");	//Для таких, как ты, есть только лишь один способ завоевать ее.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_07");	//И он обязательно тебя приведет в портовый район города.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_08");	//Несмотря на то, что там в основном околачивается всякий сброд...
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_09");	//...в нем живет и много тех людей, чье мнение далеко не последнее в этом квартале.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_10");	//Попробуй завоевать их уважение.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_11");	//И тогда я позабочусь о том, чтобы мастера стали относиться к тебе с доверием.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_12");	//А кто эти люди?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_13");	//Один из них - Кардиф, хозяин таверны в порту. Потом Карл, портовый кузнец.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_14");	//Кроме этого, также есть Ибрагим, Гарвелл, Эдда и Халвор. С ними тебе тоже лучше переговорить.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_15");	//Ну и, конечно, ростовщик Лемар! Куда же без него.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_16");	//По моему мнению, это вообще самый влиятельный человек в городе.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_17");	//(замявшись) Ну, если говорить неофициально, конечно.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_18");	//В общем, пообщайся с ними, произведи на них впечатление, помоги, чем сможешь. 
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_19");	//А там, глядишь, ты уже и вхож в квартал ремесленников. 
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_20");	//Ну как, все запомнил?
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_21");	//Да. Только у меня один вопрос.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_22");	//А побыстрее это сделать никак нельзя?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_23");	//Ну почему нельзя? Можно!
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_24");	//Если ты присоединишься к одной из крупных фракций на этом острове, ремесленные мастера не откажут тебе в разговоре.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_25");	//Но для этого тебе придется изрядно попотеть. Даже в ополчение берут не всех!
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_26");	//Понимаю.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_27");	//Ну а раз понимаешь, тогда давай принимайся за дело.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_28");	//Да и мне тут с тобой стоять трепаться особо некогда.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_29");	//А то лишний раз отвлекаться на посту... В общем, сам понимаешь.
		PabloQuestsUp = TRUE;
		B_LogEntry(TOPIC_PathFromDown,"Теперь мне надо завоевать уважение людей в портовом квартале города - таких, как Кардиф, Лемар, Карл и прочие. Тогда Пабло позаботится, чтобы ремесленные мастера стали относиться ко мне с доверием.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_30");	//Что-то я ее не вижу на тебе...(ехидно) Ты по-прежнему выглядишь как бродяга.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_31");	//Оденься поприличнее, тогда и приходи.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Pablo_PathFromDown_Rumors(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_PathFromDown_Rumors_condition;
	information = DIA_Pablo_PathFromDown_Rumors_info;
	permanent = TRUE;
	description = "Что обо мне говорят в городе?";
};

func int DIA_Pablo_PathFromDown_Rumors_condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (PabloQuestsUp == TRUE) && (PabloSpeakUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PathFromDown_Rumors_info()
{
	var int CountXPS;
	var int CountXPALL;

	CountXPS = 0;

	AI_Output(other,self,"DIA_Pablo_PathFromDown_Rumors_01_01");	//Что говорят обо мне в городе?
	AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_02");	//Хммм. Ну, давай посмотрим.

	if((MIS_MOEBORED == LOG_SUCCESS) && (MOEBORED == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_03");	//Кардиф говорит, что ты помог ему разобраться с Мо.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_04");	//Теперь этот ублюдок больше не отпугивает его посетителей.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		MOEBORED = TRUE;
	};
	if((MIS_EddaStatue == LOG_SUCCESS) && (EddaStatue == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_05");	//Эдда рассказала мне, что ты помог ей вернуть статуэтку Инноса.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_06");	//Это благородный поступок с твоей стороны.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		EddaStatue = TRUE;
	};
	if((MIS_CarlCoal == LOG_SUCCESS) && (CarlCoal == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_07");	//Кузнец Карл довольно лестно отзывается о тебе.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_08");	//Уж не знаю, с чего бы это вдруг. Но факт остается фактом.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		CarlCoal = TRUE;
	};
	if((MIS_GarvellTools == LOG_SUCCESS) && (GarvellTools == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_09");	//Ты помог Гарвеллу с постройкой его лодки.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_10");	//По мне, так он сумасшедший! Но все-таки помощь есть помощь.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		GarvellTools = TRUE;
	};
	if((MIS_BrahimWax == LOG_SUCCESS) && (BrahimWax == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_11");	//Ибрагим сказал, что ты помог ему в одном очень важном для него деле.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_12");	//Теперь он у тебя в долгу. Неплохо.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		BrahimWax = TRUE;
	};
	if((MIS_HalvorShells == LOG_SUCCESS) && (HalvorShells == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_13");	//Халвор говорит, что ты работал на него, и хорошо справился с его поручением.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_14");	//Этот парень хоть и торговец рыбой, но по сути один из самых уважаемых людей в портовом квартале.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_15");	//Так что его хорошие рекомендации - только большой плюс тебе.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		HalvorShells = TRUE;
	};
	if((MIS_LehmarDebt == LOG_SUCCESS) && (LehmarDebt == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_16");	//Лемар. Не думал, что ты сможешь произвести на него впечатление.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_17");	//Но, по всей видимости, он считает тебя довольно толковым парнем.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_18");	//Это очень важно, поскольку к его голосу прислушиваются практически все в этом городе.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		LehmarDebt = TRUE;
	};
	if(CountXPS >= 1)
	{
		CountXPALL = CountXPS * 100;
		B_GivePlayerXP(CountXPALL);
		CountXPS = 0;
	};
	if(CountRumors >= 6)
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_19");	//Да. Ты завоевал уважение многих людей тут!
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_20");	//Думаю, что теперь я смогу уговорить мастеров относится к тебе с доверием.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_21");	//Ну, или хотя бы выслушать тебя.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_22");	//Правда, на это у меня уйдет некоторое время. Сам понимаешь, такие вопросы быстро не решаются.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_23");	//Так что ступай. А с завтрашнего утра можешь попробовать поговорить с кем-нибудь из них. 
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_24");	//Все понял?
		AI_Output(other,self,"DIA_Pablo_PathFromDown_Rumors_01_25");	//Да, конечно.
		PabloSpeakUp = TRUE;
		PabloSpeakUpDay = Wld_GetDay();
		B_LogEntry(TOPIC_PathFromDown,"Пабло считает, что я завоевал уважение достаточного количества людей, чтобы он мог поговорить с мастерами. Он сказал, что завтра утром я могу попробовать поговорить с кем-нибудь из них.");
		AI_StopProcessInfos(self);
	}
	else if(CountRumors == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_26");	//Да ничего не говорят! Ты еще толком никому не помог, а уже спрашиваешь об этом.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_27");	//Так что лучше иди и займись делом, нежели отвлекать меня пустыми вопросами.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_28");	//В общем и целом - хорошо.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_29");	//Но еще мало для того, чтобы произвести впечатление на мастеров.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_30");	//Попробуй пообщаться с другими людьми. 
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_31");	//Уверен, что ты еще сможешь показать себя с более лучшей стороны.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_Rumors_01_32");	//Постараюсь.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Pablo_Banditen(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent = FALSE;
	description = "Что ты знаешь об этих бандитах?";
};

func int DIA_Pablo_Banditen_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Banditen_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Что ты знаешь об этих бандитах?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Все они пришли из этой чертовой колонии. Но затем разделились на несколько групп.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Часть из них устроила себе логово в горах, а другие присоединились к Онару.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Но больше всего проблем доставляют бандиты около города.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//Вот почему ни один из торговцев даже носа не высовывает за городские ворота.
};

instance DIA_PABLO_BANDITEN_IGN(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 5;
	condition = dia_pablo_banditen_ign_condition;
	information = dia_pablo_banditen_ign_info;
	permanent = FALSE;
	description = "Заметил что-нибудь подозрительное?";
};

func int dia_pablo_banditen_ign_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE) && (HELPKILLIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_pablo_banditen_ign_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_Ign_15_03");	//Заметил что-нибудь подозрительное?
	AI_Output(self,other,"DIA_Pablo_Add_Ign_12_04");	//Шляются тут всякие, вот и Игнаца кто-то убил.
	AI_Output(self,other,"DIA_Pablo_Add_Ign_12_05");	//Лично я никого не видел, но парни говорили о какой-то подозрительной личности.
	AI_Output(self,other,"DIA_Pablo_Add_Ign_12_06");	//Поспрашивай у горожан и охраны у восточных ворот, последний раз его вроде там видели.
};

instance DIA_Pablo_HakonBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent = FALSE;
	description = "Что ты знаешь о бандитах, ограбивших торговца Хакона?";
};

func int DIA_Pablo_HakonBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Miliz) && Npc_KnowsInfo(other,DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};

func void DIA_Pablo_HakonBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Что ты знаешь о бандитах, ограбивших торговца Хакона?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Ох, ЭТО дело! Не напоминай мне...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Насколько я знаю, именно они ответственны за большинство нападений на торговцев.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Эти крысы уползли в свою нору и больше не высовываются оттуда.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Как-то нам даже удалось выследить их и погнаться за ними. Но нам пришлось прервать погоню в лесу у города.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//Там бродит слишком много всяких зверей, и это слишком опасно.
	B_LogEntry(TOPIC_HakonBanditen,"Бандиты, ограбившие Хакона, скрываются где-то в лесу неподалеку от города.");
	if(Pablo_AndreMelden == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Но есть еще кое-что...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//Часть украденных товаров всплыла в Хоринисе.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//Это означает, что они имеют возможность контрабандой доставлять товары в город и продавать их.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Да, мы подозреваем, что у них есть свой человек в городе. Но нам пока не удалось поймать его.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Если тебе удастся выяснить что-нибудь об этом деле, помни, что лорд Андрэ назначил награду за голову этого скупщика краденного.
		B_LogEntry(TOPIC_HakonBanditen,"Эти бандиты, вероятно, состоят в сговоре с кем-то из городских дельцов. Лорд Андрэ назначил награду за голову этого дельца.");
	};
};

instance DIA_Pablo_MyBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 4;
	condition = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent = FALSE;
	description = "А откуда пришли бандиты, у которых нашли листок с моим изображением?";
};

func int DIA_Pablo_MyBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pablo_Banditen) && Npc_KnowsInfo(other,DIA_Pablo_WANTED))
	{
		return TRUE;
	};
};

func void DIA_Pablo_MyBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//А откуда пришли бандиты, у которых нашли листок с моим изображением?

	if(Pablo_belogen == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//А-ГА! Так это все же ТВОЯ физиономия там. А почему ты сразу это не признал, а?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(требовательно) За что тебя разыскивают?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Я не знаю - честно!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Да, да. Конечно. Я хочу, чтобы ты кое-что понял. Если бы я думал, что ты был сообщником этих бандитов, ты бы уже отдыхал за решеткой.
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//Но все же мне лучше доложить об этом инциденте лорду Андрэ.
		Pablo_AndreMelden = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Но, отвечая на твой вопрос...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Мы нашли их неподалеку от поместья Онара.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Но они были не похожи на его людей.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Я думаю, они были частью банды, которая засела в горах.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Но если ты захочешь отправиться туда, позволь мне тебя предупредить. Эти головорезы могут сделать котлету из кого угодно!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Я запомню это.
};


instance DIA_Pablo_Perm(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent = TRUE;
	description = "Как обстановка?";
};

func int DIA_Pablo_Perm_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Perm_Info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Как обстановка?

	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Я всегда говорил, что этим наемникам нельзя доверять.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Пришло время преподать этому сброду урок! Беннет не мог провернуть все это в одиночку.
			}
			else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Я глубоко потрясен убийством достопочтенного паладина Лотара.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Но я знаю, что церковь подберет справедливое наказание для этого злодея.
			}
			else if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_04A");	//Что ты тут шляешься, болотник?
			}
			else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Что ты тут ошиваешься? Если ты собираешься освободить своего дружка-наемника, лучше тебе забыть об этом!
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05A");	//Прошу тебя, не отвлекай меня от службы. У меня много дел.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//Это тревожит меня. Теперь они пытаются стравить нас друг с другом.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Если бы тебе не удалось найти настоящего убийцу, оркам даже не пришлось бы ничего делать.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Я не знаю, что будет с нами, если паладины уйдут отсюда.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Ты можешь рассчитывать на нас, мы сделаем все возможное, чтобы этот город не превратился в притон для бандитов.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Постарайся вести себя как подобает. Мы глаз не спускаем с таких как ты.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//Пока все спокойно. Только бандиты у города доставляют нам небольшие проблемы.
	};
};