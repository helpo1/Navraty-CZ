
instance DIA_Gerbrandt_EXIT(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 999;
	condition = DIA_Gerbrandt_EXIT_Condition;
	information = DIA_Gerbrandt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerbrandt_EXIT_Info()
{
	if(DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc(PC_Thief_NW);

		if(Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine(DiegoNW,"GERBRANDT");
		};

		Npc_ExchangeRoutine(self,"NEWLIFE");
		B_StartOtherRoutine(GerbrandtsFrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
	AI_SetWalkMode(self,NPC_RUN);
};

instance DIA_Gerbrandt_Hello(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 5;
	condition = DIA_Gerbrandt_Hello_Condition;
	information = DIA_Gerbrandt_Hello_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Gerbrandt_Hello_Condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Hello_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//А ты кто такой? Похоже, ты недавно здесь и понятия не имеешь, с кем имеешь дело.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Меня зовут Гербрандт. А для тебя я мистер Гербрандт. Понял?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Я понял, Гербрандт.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Я понял, мистер Гербрандт.",DIA_Gerbrandt_Hello_Yes);
};

func void DIA_Gerbrandt_Hello_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Я понял, Гербрандт.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Попридержи язык! Тебе лучше проявлять уважение ко мне, иначе у тебя будут большие проблемы...
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//Здесь я вершу закон. Тому, кто создает проблемы, придется держать ответ передо мной. И лучше ему сразу бежать из города со всех ног, потому что после того, как я разберусь с ним, он пожалеет, что попался мне на глаза!
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Большинство людей в порту работает на меня. И если ты ищешь работу, тебе лучше побеспокоиться, чтобы мои воспоминания о тебе были приятными.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Я понял, мистер Гербрандт.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Ну, по крайней мере, тебе не потребовалось много времени, чтобы понять, куда здесь ветер дует.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Как только бизнес опять пойдет в гору, у меня наверняка найдется работа для такого смышленого паренька, как ты.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//Из тебя бы получился отличный кладовщик.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Ты умеешь читать?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Нет.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Мне не нужна работа.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Конечно.",DIA_Gerbrandt_Hello_Yes_Yes);
};

func void DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Ничего, по крайне мере, ты сможешь переложить несколько мешков с места на место.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//И если я буду доволен тобой, возможно, я даже предложу тебе постоянное место. Здесь всегда много работы.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Что ж, тогда я жду тебя у себя, как только к пристани пришвартуется первый торговый корабль.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_NoJob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Мне не нужна работа.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Ты думаешь, ты ужасно крут. Смотри, никто не может получить работу здесь без моего одобрения.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//И если ты продолжишь оскорблять меня, ты можешь сразу искать себе соломенный тюфяк с клопами, потому что это будет все, что ты сможешь себе позволить.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Еще придет время, когда ты будешь умолять меня дать тебе работу.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Отлично. В наши времена тяжело найти обученных работников.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Как насчет твоих рекомендаций?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Рекомендаций?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//Хорошо, я запомню твое лицо. Когда торговля возобновится опять, приходи ко мне. Тогда я дам тебе работу.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void B_GErbrandt_PissOff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//Что это все значит - ты издеваешься надо мной?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ты и твой приятель Диего уже и так дел натворили.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Оставь меня в покое!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
	if(MIS_GERBRANDTHELP == LOG_Running)
	{
		MIS_GERBRANDTHELP = LOG_FAILED;
		GERBRANDTPISSOFF = TRUE;
		B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
	};
};


instance DIA_Gerbrandt_Perm(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 800;
	condition = DIA_Gerbrandt_Perm_Condition;
	information = DIA_Gerbrandt_Perm_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Gerbrandt_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Есть новости?
	if(Kapitel <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
		{
			if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (GERBRANDTPISSOFF == FALSE))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_20");	//Нет. Ничего такого последнее время не происходило.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_21");	//Хорошо, что заглянул! Был рад увидеть тебя.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Людям, вроде тебя, нечего делать здесь. Здесь живут порядочные члены общества, а не какие-нибудь бродяги и проходимцы.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Если тебе когда-нибудь удастся стать богатым и уважаемым, возможно, тебе будут более рады здесь.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Мне не на что жаловаться, о, благородный рыцарь.
		};
	}
	else if(Kapitel >= 3)
	{
		if(MIS_DiegosResidence != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
			{
				if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (GERBRANDTPISSOFF == FALSE))
				{
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_22");	//Нет. Ничего такого последнее время не происходило.
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_23");	//Хорошо, что заглянул! Был рад увидеть тебя.
				}
				else
				{
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Много я видел таких людей, как ты. Вы просто не знаете своего места!
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Мне стоит поговорить с губернатором об усилении мер безопасности в верхнем квартале.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//Это никого не касается кроме меня. Я занят!
			};
		}
		else
		{
			B_GErbrandt_PissOff();
		};
	};
};


instance DIA_GERBRANDT_FUCKOFF(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_fuckoff_condition;
	information = dia_gerbrandt_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gerbrandt_fuckoff_condition()
{
	if((GERBRANDTPISSOFF == TRUE) && (MIS_DiegosResidence != LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_Gerbrandt_GreetingsFromDiego(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information = DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent = FALSE;
	description = "Диего передает тебе привет.";
};


func int DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	if((MIS_DiegosResidence == LOG_Running) && (Npc_HasItems(other,ItWr_DiegosLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Диего передает тебе привет.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(испуганно) Что? Кто? Какой Диего?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//Он попросил меня вручить тебе это письмо.
	B_GiveInvItems(other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(возбужденно) Этого не может быть. Нет. Мне конец!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(в страхе) Он что, уже в городе?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Кто?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Диего, конечно же!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Да, я должен скоро встретиться с ним.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(в отчаянии, про себя) Это конец! Все пропало!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//У меня нет времени, мне нужно уходить отсюда. Быстро. Если он найдет меня здесь, мне конец!
	MIS_DiegosResidence = LOG_SUCCESS;
	B_GivePlayerXP(XP_DiegosResidence);
	DIEGO_COMING = TRUE;
};

instance DIA_GERBRANDT_WORKSFOR(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_worksfor_condition;
	information = dia_gerbrandt_worksfor_info;
	permanent = FALSE;
	description = "У тебя не найдется для меня какой-нибудь работы?";
};

func int dia_gerbrandt_worksfor_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_DiegosResidence != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_worksfor_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_01_00");	//У тебя не найдется для меня какой-нибудь работы?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_01_01");	//И почему же ты решил, что я нуждаюсь в твоих услугах?
	Info_ClearChoices(dia_gerbrandt_worksfor);
	Info_AddChoice(dia_gerbrandt_worksfor,"Я просто поинтересовался.",dia_gerbrandt_worksfor_interes);
	Info_AddChoice(dia_gerbrandt_worksfor,"Думаю, это именно так.",dia_gerbrandt_worksfor_think);
	Info_AddChoice(dia_gerbrandt_worksfor,"Понятия не имею. А разве нет?",dia_gerbrandt_worksfor_dontknow);
	Info_AddChoice(dia_gerbrandt_worksfor,"Мне очень нужна эта работа.",dia_gerbrandt_worksfor_needwork);
};

func void dia_gerbrandt_worksfor_interes()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Interes_01_00");	//Я просто спросил.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Interes_01_02");	//Тогда я тебе просто отвечу: у меня нет для тебя никакой работы.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Interes_01_03");	//Поищи ее где-нибудь в другом месте. Например, в портовом квартале.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Interes_01_04");	//Здесь же такому болвану, как ты, никогда ее не заполучить.
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_dontknow()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_DontKnow_01_00");	//Понятия не имею. А разве нет?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_DontKnow_01_01");	//Что? Ты предлагаешь свои услуги и при этом сам не знаешь, что ты можешь предложить?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_DontKnow_01_02");	//В таком случае я тоже не знаю, что за работу предложить такому идиоту, как ты.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_DontKnow_01_03");	//А теперь будь так добр, исчезни с глаз моих.
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_needwork()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_NeedWork_01_00");	//Мне очень нужна эта работа.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_NeedWork_01_01");	//Всем нужна работа. Но я не вижу ни одной причины, почему я должен предлагать ее именно тебе.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_NeedWork_01_02");	//Кругом одни болваны, которые только и делают, что пытаются одурачить меня.
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_think()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_00");	//Думаю, это именно так.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_02");	//Я подумал, что у такого делового человека, как вы, господин Гербрандт, всегда найдется пара каких-нибудь срочных поручений.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_07");	//А я посмотрю, ты парень не промах!
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_08");	//Может быть, твоя помощь действительно будет к месту...
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_10");	//Хммм... Есть у меня тут одно дельце. Думаю, как раз для тебя.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_11");	//И в чем оно заключается?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_12");	//Ничего особенного. Надо встретиться с одним человеком и просто кое-что ему передать.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_13");	//Что именно я должен ему передать, и кто этот человек?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_14");	//У меня сегодня назначена с ним встреча. Ровно в полночь в таверне 'Мертвая Гарпия'.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_15");	//Ты должен будешь отдать ему этот кошелек с деньгами и это письмо.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_16");	//Как я его узнаю?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_17");	//Поверь мне, это будет не так сложно, как кажется. Кроме этого, есть еще одно условие.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_19");	//Этот человек, с кем ты встретишься, ни при каких обстоятельствах не должен знать о том, что это я послал тебя.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_1A");	//То есть я должен действовать от своего имени?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_1B");	//Да. Он не должен ничего заподозрить.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_22");	//Вот, возьми кошелек...
	B_GiveInvItems(self,other,itse_gerbrandpocket,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_23");	//...и письмо.
	B_GiveInvItems(self,other,itwr_gerbrandseclet,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_24");	//Не вздумай читать его! И оставь все мысли о том, чтобы присвоить себе мои деньги.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_26");	//Теперь поговорим о твоем гонораре. Думаю, пятиста золотых монет будет вполне достаточно.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_27");	//Деньги меня не интересуют.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_30");	//Тогда чего же ты хочешь?
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_31");	//Мне нужно, чтобы, в свою очередь, ты написал письмо Лариусу, главе города.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_33");	//В нем ты должен хорошо отозваться об одном человеке - Галлахаде.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_36");	//Галлахад? Да, я его хорошо знаю. Не скажу, чтобы мы были с ним друзьями, но и врагами нас назвать трудно.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_37");	//(задумчиво) Значит, ему нужна моя помощь. Видимо, он хочет восстановить свое былое положение в городе...
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_40");	//Хорошо! Выполни все то, что я тебе поручил, - и ты получишь нужное тебе рекомендательное письмо.
	MIS_GERBRANDT_MEETINTAVERNE_DAY = Wld_GetDay();
	MIS_GERBRANDTHELP = LOG_Running;
	Log_CreateTopic(TOPIC_GERBRANDTHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_Running);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Гербрандт напишет рекомендательное письмо для Галлахада, если я выполню для него небольшое дельце. Мне необходимо встретиться с одним человеком. Он будет ждать меня после полуночи в таверне 'Мертвая Гарпия'. При встрече мне необходимо передать ему письмо и кошелек с деньгами.");
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_WORKSFORDONE(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_worksfordone_condition;
	information = dia_gerbrandt_worksfordone_info;
	permanent = FALSE;
	description = "По поводу встречи...";
};


func int dia_gerbrandt_worksfordone_condition()
{
	if((MIS_GERBRANDTHELP == LOG_Running) && (MIS_DiegosResidence != LOG_SUCCESS) && ((MEETCHIEFKILLERS == TRUE) || (MEETCHIEFKILLERSLAIT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_worksfordone_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_00");	//По поводу встречи...
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_01");	//Да?
	if(MEETCHIEFKILLERSLAIT == TRUE)
	{
		AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_02");	//К сожалению, я опоздал на нее.
		AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_03");	//(разгневанно) ЧТО?! Никчемный идиот! И как я только мог поручить это дело тебе!..
		AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_07");	//Надеюсь, хоть сейчас мои деньги и письмо при тебе?
		if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
		{
			if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_08");	//Да, вот они.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_09");	//Давай сюда!
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_10");	//У тебя хотя бы хватило ума принести мне их обратно.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_13");	//А теперь пошел прочь с глаз моих, недоносок!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_14");	//Убирайся!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_15");	//Да, вот они.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_16");	//Давай сюда!
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_17");	//У тебя хотя бы хватило ума принести мне их обратно. (темнеет лицом) Постой...
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_18");	//Ты что, читал мое письмо?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_20");	//Ах ты ублюдок!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_21");	//Кажется, я предупреждал тебя, чтобы ты не смел этого делать.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_22");	//Теперь ты горько пожалеешь об этом!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
		{
			if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_23");	//У меня осталось только письмо. Вот, возьми его.
				B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_24");	//ЧТО?! А где мой кошелек?
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_26");	//Ах ты ублюдок!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_27");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_28");	//Сейчас я тебе покажу, что бывает с теми, кто ворует у меня!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			}
			else
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_29");	//У меня осталось только письмо. Вот, возьми его.
				B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_30");	//ЧТО?! А где мой кошелек?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_32");	//Ах ты ублюдок!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_33");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_34");	//Постой...(темнеет лицом) Ты что, еще и читал мое письмо?
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_36");	//Кажется, я предупреждал тебя, чтобы ты не смел этого делать.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_37");	//Теперь ты горько пожалеешь об этом!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_38");	//У меня остались только деньги. Вот, возьми их.
			B_GiveInvItems(other,self,itse_gerbrandpocket,1);
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_39");	//ЧТО?! А где мое письмо?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_41");	//Ах ты ублюдок!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_42");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_43");	//Как бы не так! Сейчас я тебе покажу, что значит воровать у меня!
			MIS_GERBRANDTHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			GERBRANDTPISSOFF = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_ReactToWeapon,0);
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_44");	//У меня их нет.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_45");	//ЧТО?! Ах ты ублюдок!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_46");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_47");	//Как бы не так! Сейчас я тебе покажу, что значит воровать у меня!
			MIS_GERBRANDTHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			GERBRANDTPISSOFF = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_ReactToWeapon,0);
		};
	};
	if(MEETCHIEFKILLERS == TRUE)
	{
		if(MEETCHIEFKILLERSMISSTIME == TRUE)
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_48");	//Я встретился с тем, с кем ты просил.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_49");	//И как прошла встреча? Ты передал ему мое письмо и кошелек?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_50");	//К сожалению нет. У меня их не оказалось при себе.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_52");	//ЧТО?! Что ты сказал?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_53");	//Никчемный идиот! Что ты наделал? Ты запорол все дело!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_54");	//(вне себя) И как я только мог поручить его тебе?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_59");	//Надеюсь, хоть сейчас мои деньги и письмо при тебе?
			if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
			{
				if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_60");	//Да, вот они.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_61");	//Давай сюда!
					B_GiveInvItems(other,self,itse_gerbrandpocket,1);
					B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_62");	//У тебя хотя бы хватило ума принести мне их обратно!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_65");	//А теперь пошел прочь с глаз моих, недоносок!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_66");	//Убирайся!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
				}
				else
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_67");	//Да, вот они.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_68");	//Давай сюда!
					B_GiveInvItems(other,self,itse_gerbrandpocket,1);
					B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_69");	//У тебя хотя бы хватило ума принести мне их обратно! (темнеет лицом) Постой...
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_70");	//Ты что, читал мое письмо?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_72");	//Ах ты ублюдок!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_73");	//Кажется, я предупреждал тебя, чтобы ты не смел этого делать.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_74");	//Теперь ты горько пожалеешь об этом!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				};
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
			{
				if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_75");	//У меня осталось только письмо. Вот, возьми его.
					B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_76");	//ЧТО?! А где мой кошелек?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_78");	//Ах ты ублюдок!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_79");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_80");	//Как бы не так! Сейчас я тебе покажу, что бывает с теми, кто ворует у меня!
					MIS_GERBRANDTHELP = LOG_FAILED;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					GERBRANDTPISSOFF = TRUE;
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				}
				else
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_81");	//У меня осталось только письмо. Вот, возьми его.
					B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_82");	//ЧТО?! А где мой кошелек?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_84");	//Ах ты ублюдок!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_85");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_86");	//Постой...(темнеет лицом) Ты что, еще и читал мое письмо?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_88");	//Кажется, я предупреждал тебя, чтобы ты не смел этого делать.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_89");	//Теперь ты горько пожалеешь об этом!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				};
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_90");	//У меня остались только деньги. Вот, возьми их.
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_91");	//ЧТО?! А где мое письмо?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_93");	//Ах ты ублюдок!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_94");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_95");	//Как бы не так! Сейчас я тебе покажу, что значит воровать у меня!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_96");	//У меня их нет.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_97");	//ЧТО?! Ах ты ублюдок!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_98");	//Ты, значит, решил, что можешь вот так просто присвоить себе то, что принадлежит мне?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_99");	//Как бы не так! Сейчас я тебе покажу, что значит воровать у меня!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == TRUE) && (MEETCHIEFKILLERSTELLSGER == FALSE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_00");	//Я встретился с тем, с кем ты просил.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_01");	//И как прошла встреча? Ты передал ему мое письмо и кошелек?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_02");	//Да, я передал ему все, о чем ты просил.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_03");	//Отлично! Были проблемы?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_06");	//Кажется, он понял, что я подставное лицо. Мне не удалось обмануть его.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_08");	//ЧТО?! Ты идиот!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_09");	//Надеюсь, ты не назвал моего имени?!
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_10");	//Не беспокойся! Этого он не узнал.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_11");	//(с облегчением) Ну, хоть на это у тебя ума хватило!
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_14");	//Что насчет письма для Галлахада?
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_15");	//Хммм...(задумался)
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_16");	//Хорошо, так уж и быть. Ты получишь его.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_17");	//Хотя бы за то, что все-таки умеешь держать свой язык за зубами.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_18");	//Вот, возьми - оно тут.
			B_GiveInvItems(self,other,itwr_gerbrantletter,1);
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_19");	//Но на будущее учти, что больше от меня работы ты никогда не получишь!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_21");	//А теперь проваливай!
			MIS_GERBRANDTHELP = LOG_SUCCESS;
			GERBRANDTPISSOFF = TRUE;
			Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
			B_LogEntry(TOPIC_GERBRANDTHELP,"Гербрандт был вне себя от того, что мне не удалось выполнить часть порученного мне задания. Хотя его немного успокоил тот факт, что его имя осталось загадкой для человека в таверне. Скрепя сердце, он дал мне рекомендательное письмо для Галлахада.");
			AI_StopProcessInfos(self);
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == TRUE) && (MEETCHIEFKILLERSTELLSGER == TRUE))
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_00");	//Я встретился с тем, с кем ты просил.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_01");	//И как прошла встреча? Ты передал ему мое письмо и кошелек?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_02");	//Да, я передал ему все, о чем ты просил.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_03");	//Отлично! Были проблемы?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_06");	//Кажется, он понял, что я подставное лицо. Мне не удалось обмануть его.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_08");	//ЧТО?! Ты идиот!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_09");	//Надеюсь, ты не назвал моего имени?!
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_10");	//Извини, но он заставил меня сказать это.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_12");	//ЧТО?! (темнеет лицом) Ты заложил меня! О, Иннос!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_13");	//Никчемный идиот! (в панике) Что ты наделал?! О, Иннос.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_14");	//И как я только мог поручить тебе это дело?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_15");	//Надо было найти кого-нибудь другого - и о чем я только думал?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_18");	//А что насчет письма для Галлахада?
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_19");	//(разгневанно) ЧТО?! И у тебя хватает еще наглости спрашивать меня про это?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_20");	//Пошел прочь с глаз моих, недоносок!
			MIS_GERBRANDTHELP = LOG_FAILED;
			GERBRANDTPISSOFF = TRUE;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			AI_StopProcessInfos(self);
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == FALSE) && (MEETCHIEFKILLERSTELLSGER == FALSE))
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_01");	//Я встретился с тем, с кем ты просил.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_02");	//И как прошла встреча? Ты передал ему мое письмо и кошелек?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_03_01");	//Да, я передал ему их.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_03");	//Отлично! Были проблемы?
			if(MEETCHIEFKILLERSDANGER == TRUE)
			{
				Info_ClearChoices(dia_gerbrandt_worksfordone);
				Info_AddChoice(dia_gerbrandt_worksfordone,"К сожалению да.",dia_gerbrandt_worksfordone_ok);
			}
			else
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_05");	//Никаких! Все прошло как по маслу.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_06");	//Ты молодец! Я знал, что на тебя было можно положиться в этом нелегком деле.
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_08");	//Что насчет письма для Галлахада?
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_09");	//Ах да, конечно. Я его уже написал, как мы и договаривались.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_10");	//Вот, возьми.
				B_GiveInvItems(self,other,itwr_gerbrantletter,1);
				B_UseItem(other,itwr_gerbrantletter);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_13");	//Да, и хочу сказать еще одну вещь...
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_14");	//Если тебе вдруг вновь понадобится работа - то ты всегда можешь смело обращаться ко мне.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_15");	//Ведь такие люди, как ты - на вес золота в наше-то время.
				MIS_GERBRANDTHELP = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
				B_LogEntry(TOPIC_GERBRANDTHELP,"Гербрандт был доволен тем, как я справился с его поручением. Он передал мне рекомендательное письмо для Галлахада и также добавил, что он будет рад воспользоваться моими услугами вновь, если представится такое дело.");

				if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (CHIEFKILLERISDEAD == FALSE) && (STARTKILLERWAY == FALSE) && (STARTKILLERWAY_ANDRE == FALSE))
				{
					STARTKILLERWAY = TRUE;
				};

				AI_StopProcessInfos(self);
			};
		};
	};
};

func void dia_gerbrandt_worksfordone_ok()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 500;
	AI_NoticePrint(3000,4098,NAME_ADDON_BRAVEBONUS);
	BRAVEBONUS = TRUE;
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_00");	//К сожалению, да.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_01");	//(встревоженно) Какие?
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_02");	//Кажется, он понял, что я подставное лицо. Мне не удалось обмануть его.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_03");	//Он даже угрожал мне расправой, чтобы я назвал твое имя.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_04");	//Но, в конце концов, мы сумели договориться.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_06");	//Так что можешь не волноваться.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_07");	//М-да...(хватаясь за сердце) Ты... ты удивил даже меня!
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_08");	//Если все, что ты рассказал, - правда, то мне действительно не о чем переживать.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_09");	//Ха! А ты молодец! Я знал, что на тебя было можно положиться в этом нелегком деле.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_11");	//Что насчет письма для Галлахада?
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_12");	//Ах да, конечно. Я его уже написал, как мы и договаривались.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_13");	//Вот, возьми, - оно твое.
	B_GiveInvItems(self,other,itwr_gerbrantletter,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_16");	//Да, и хочу сказать еще одну вещь...
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_17");	//Если тебе вдруг вновь понадобится работа, то ты всегда можешь смело обращаться ко мне.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_18");	//Ведь такие люди, как ты, на вес золота в наше-то время.
	MIS_GERBRANDTHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Гербрандт был доволен тем, как я справился с его поручением. Особенно его удивило то, что я произвел хорошее впечатление на человека в таверне. Он передал мне рекомендательное письмо для Галлахада и также добавил, что он будет рад воспользоваться моими услугами вновь, если представится такое дело.");

	if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (CHIEFKILLERISDEAD == FALSE) && (STARTKILLERWAY == FALSE) && (STARTKILLERWAY_ANDRE == FALSE))
	{
		STARTKILLERWAY = TRUE;
	};

	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_HEARKILL(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_hearkill_condition;
	information = dia_gerbrandt_hearkill_info;
	permanent = FALSE;
	description = "А что это был за человек, с которым я встречался в таверне?";
};


func int dia_gerbrandt_hearkill_condition()
{
	if((STARTKILLERWAY == TRUE) && (MEETSTIDGERBRANT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hearkill_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_HearKill_01_00");	//А что это был за человек, с которым я встречался в таверне?
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_01");	//Поверь, тебе лучше не знать.
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_03");	//Не понимаю, что он тебя так заинтересовал?
	AI_Output(other,self,"DIA_Gerbrandt_HearKill_01_04");	//Может, все-таки скажешь?
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_05");	//Хех...(явно нервничает) Ладно! Но никому не слова об этом. Понял?!
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_07");	//В общем...
	AI_Standup(self);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_08");	//Если хочешь еще раз встретиться с этим человеком, не ложись сегодня ночью спать - погуляй в верхнем квартале города до полуночи. Может быть, и встретишь его.
	ASMALCANAPPEAR = TRUE;
	AsmalDayMeet = Wld_GetDay();
	AI_StopProcessInfos(self);
};