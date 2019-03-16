
var int taliasanteachmagicagree;
var int taliasan_trade;

instance DIA_TALIASAN_EXIT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 999;
	condition = dia_taliasan_exit_condition;
	information = dia_taliasan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_taliasan_exit_condition()
{
	return TRUE;
};

func void dia_taliasan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_taliasan_PICKPOCKET(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 998;
	condition = DIA_taliasan_PICKPOCKET_Condition;
	information = DIA_taliasan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_taliasan_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_taliasan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
	Info_AddChoice(DIA_taliasan_PICKPOCKET,Dialog_Back,DIA_taliasan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_taliasan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_taliasan_PICKPOCKET_DoIt);
};

func void DIA_taliasan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
};

func void DIA_taliasan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
};

instance DIA_TALIASAN_HI(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_hi_condition;
	information = dia_taliasan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_taliasan_hi_info()
{
	AI_Output(self,other,"DIA_Taliasan_Hi_01_00");	//(раздраженно) Что тебе здесь нужно? Что ты хочешь?
	AI_Output(other,self,"DIA_Taliasan_Hi_01_01");	//Ничего.
	AI_Output(self,other,"DIA_Taliasan_Hi_01_02");	//Тогда убирайся отсюда - тебе нечего здесь делать!
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_WASIST(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_wasist_condition;
	information = dia_taliasan_wasist_info;
	permanent = FALSE;
	description = "Это ты - Галлахад?";
};


func int dia_taliasan_wasist_condition()
{
	if((KNOWSABOUTTALIASAN == TRUE) && (MEETTALIASAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_wasist_info()
{
	AI_Output(other,self,"DIA_Taliasan_WasIst_01_00");	//Это ты Галлахад?
	AI_Output(self,other,"DIA_Taliasan_WasIst_01_01");	//Откуда ты меня знаешь? Что тебе нужно?
	AI_Output(other,self,"DIA_Taliasan_WasIst_01_02");	//Я слышал, у тебя неприятности.
	AI_Output(self,other,"DIA_Taliasan_WasIst_01_03");	//Мало ли что ты слышал! Люди много чего болтают...
	MEETTALIASAN = TRUE;
};


instance DIA_TALIASAN_WASISTNO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_wasistno_condition;
	information = dia_taliasan_wasistno_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_taliasan_wasistno_condition()
{
	if((KNOWSABOUTTALIASAN == FALSE) && (MEETTALIASAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_wasistno_info()
{
	AI_Output(other,self,"DIA_Taliasan_WasIstNo_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_Taliasan_WasIstNo_01_02");	//Мое имя Галлахад. Остальное тебя не касается.
	AI_Output(other,self,"DIA_Taliasan_WasIstNo_01_03");	//А что ты тут делаешь?
	AI_Output(self,other,"DIA_Taliasan_WasIstNo_01_06");	//(раздраженно) Оставь меня!
	MEETTALIASAN = TRUE;
};


instance DIA_TALIASAN_PROBLEM(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_problem_condition;
	information = dia_taliasan_problem_info;
	permanent = FALSE;
	description = "В чем твоя проблема?";
};


func int dia_taliasan_problem_condition()
{
	if(MEETTALIASAN == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_problem_info()
{
	AI_Output(other,self,"DIA_Taliasan_Problem_01_00");	//В чем твоя проблема?
	AI_Output(self,other,"DIA_Taliasan_Problem_01_02");	//В людях, что лезут в дела, которые их не касаются...(раздраженно) Таких, как ты!
	if((Kapitel <= 2) || ((TALIASANTELLWHOMAGE == FALSE) && (MIS_XARDASNDMTASKSTWO == LOG_Running)))
	{
		AI_Output(other,self,"DIA_Taliasan_Problem_01_06");	//Может, все-таки расскажешь?
		AI_Output(self,other,"DIA_Taliasan_Problem_01_07");	//Да что тут рассказывать - это грустная история...
		AI_Output(self,other,"DIA_Taliasan_Problem_01_08");	//...когда-то я имел все - почет, деньги, уважение... Не то что сейчас...(печально)
		AI_Output(self,other,"DIA_Taliasan_Problem_01_11");	//В свои лучшие годы я был главой городской гильдии магов Хориниса и первым советником главы нашего города.
		AI_Output(other,self,"DIA_Taliasan_Problem_01_12");	//Ты - бывший маг?!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_13");	//Да, черт возьми, я был лучшим магом в Хоринисе! А что, тебя это удивляет?
		AI_Output(self,other,"DIA_Taliasan_Problem_01_17");	//Это все из-за этого проклятого Ристера! Пропади он пропадом!
		if(Npc_KnowsInfo(other,DIA_Richter_Hello))
		{
			AI_Output(other,self,"DIA_Taliasan_Problem_01_18");	//Ристер? Это тот надменный идиот, что нацепил на себя мантию судьи?
			AI_Output(self,other,"DIA_Taliasan_Problem_01_19");	//Да, это он. Вижу, ты успел познакомиться с этой жирной свиньей.
		}
		else
		{
			AI_Output(other,self,"DIA_Taliasan_Problem_01_20");	//Ристер? А кто это?
			AI_Output(self,other,"DIA_Taliasan_Problem_01_21");	//Ты не знаешь этого ублюдка? Тебе повезло! (смеется)
			AI_Output(self,other,"DIA_Taliasan_Problem_01_22");	//Этот недоносок нацепил мантию судьи и возомнил себя невесть кем!
			AI_Output(self,other,"DIA_Taliasan_Problem_01_23");	//Болван!
		};
		AI_Output(other,self,"DIA_Taliasan_Problem_01_25");	//Объясни, что произошло?
		AI_Output(self,other,"DIA_Taliasan_Problem_01_26");	//Я ввязался в одну темную историю. Как тогда чувствовал - не стоило мне этого делать.
		AI_Output(self,other,"DIA_Taliasan_Problem_01_27");	//'Никто ничего не узнает... Все будет в лучшем виде... Я твой друг...', - говорил он.
		AI_Output(self,other,"DIA_Taliasan_Problem_01_28");	//А когда дело прогорело - взял да свалил всю вину на меня!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_31");	//Лариус, глава города, был так взбешен произошедшим, что даже слушать меня не стал!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_32");	//И я потерял свое место, а с ним и все остальное.
		AI_Output(self,other,"DIA_Taliasan_Problem_01_35");	//Эх! Я бы все отдал, чтобы поквитаться с этой сволочью. Он-то, небось, там как всегда - весь в шоколаде!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_36");	//Да вот только одна проблема - в верхний квартал города меня не пустят.
		TALIASANTELLWHOMAGE = TRUE;
		if(MIS_XARDASNDMTASKSTWO == LOG_Running)
		{
			B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Наверное, Галлахад и есть тот маг, у которого была нужная Ксардасу книга.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_Problem_01_38");	//Оставь меня в покое со своими вопросами! Ясно?!
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_HELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_help_condition;
	information = dia_taliasan_help_info;
	permanent = FALSE;
	description = "Может, все-таки есть способ решить твою проблему?";
};


func int dia_taliasan_help_condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,dia_taliasan_problem))
	{
		return TRUE;
	};
};

func void dia_taliasan_help_info()
{
	AI_Output(other,self,"DIA_Taliasan_Help_01_00");	//Может, все-таки есть способ решить твою проблему?
	AI_Output(self,other,"DIA_Taliasan_Help_01_01");	//Скорее всего, нет... Хотя, разве что...
	AI_Output(self,other,"DIA_Taliasan_Help_01_03");	//...если только кто-нибудь убедит Лариуса, что я нужен ему.
	AI_Output(other,self,"DIA_Taliasan_Help_01_04");	//Ты знаешь того, кто мог бы замолвить за тебя словечко?
	AI_Output(self,other,"DIA_Taliasan_Help_01_05");	//Ну... В Хоринисе есть несколько человек, к чьему мнению он обычно прислушивается.
	AI_Output(self,other,"DIA_Taliasan_Help_01_07");	//Это крупные торговцы из верхнего квартала.
	AI_Output(self,other,"DIA_Taliasan_Help_01_08");	//Возможно, кто-нибудь смог бы уговорить их сделать это.
	AI_Output(self,other,"DIA_Taliasan_Help_01_09");	//Как насчет тебя?
	AI_Output(other,self,"DIA_Taliasan_Help_01_12");	//Я? И каким же образом я смогу их уговорить заступиться за тебя?
	AI_Output(self,other,"DIA_Taliasan_Help_01_13");	//Попробуй предложить им свою помощь.
	AI_Output(self,other,"DIA_Taliasan_Help_01_21");	//В любом случае мне важно лишь, чтобы в качестве награды каждый из них написал письмо, в котором он положительно отзывается о моих способностях.
	AI_Output(self,other,"DIA_Taliasan_Help_01_22");	//Ну, так что скажешь? Поможешь мне?
	Info_ClearChoices(dia_taliasan_help);
	Info_AddChoice(dia_taliasan_help,"Думаю, тебе стоит поискать кого-нибудь другого.",dia_taliasan_help_no);
	Info_AddChoice(dia_taliasan_help,"Да, это рискованное дело, но я помогу тебе.",dia_taliasan_help_ok);
	Info_AddChoice(dia_taliasan_help,"А что я получу за свою помощь?",dia_taliasan_help_howmuch);
};

func void dia_taliasan_help_no()
{
	AI_Output(other,self,"DIA_Taliasan_Help_No_01_00");	//По-моему, ты хочешь впутать меня в какое-то темное дело. Я не буду на тебя работать.
	AI_Output(self,other,"DIA_Taliasan_Help_No_01_03");	//Тогда уходи. И держи свой язык за зубами!
	Info_ClearChoices(dia_taliasan_help);
};

func void dia_taliasan_help_ok()
{
	AI_Output(other,self,"DIA_Taliasan_Help_Ok_01_00");	//Да, это рискованное дело, но я помогу тебе.
	AI_Output(self,other,"DIA_Taliasan_Help_Ok_01_01");	//Я знал, что ты согласишься мне помочь.
	AI_Output(self,other,"DIA_Taliasan_Help_Ok_01_04");	//Я обещаю тебе, что ты не пожалеешь о своем решении.
	Log_CreateTopic(TOPIC_TALIASANHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALIASANHELP,LOG_Running);
	B_LogEntry(TOPIC_TALIASANHELP,"В портовом районе я встретил человека по имени Галлахад. Когда-то он был уважаемым человеком в Хоринисе, пока не ввязался в одну авантюру. Его подставил судья Ристер, свалив всю вину на мага, хотя и сам был замешан в деле. После инцидента Галлахад потерял все - почет, уважение, работу...");
	B_LogEntry_Quiet(TOPIC_TALIASANHELP,"Я согласился помочь Галлахаду вернуть былое положение городского мага. Ему помогут рекомендательные письма от влиятельных людей города, написанные к мэру Хориниса - Лариусу. Возможно, после этого к Галлахаду отнесутся со снисхождением и закроют глаза на прошлые недоразумения.");
	MIS_TALIASANHELP = LOG_Running;
	Info_ClearChoices(dia_taliasan_help);
};

func void dia_taliasan_help_howmuch()
{
	AI_Output(other,self,"DIA_Taliasan_Help_HowMuch_01_00");	//А что я получу за свою помощь?
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_04");	//Если ты сумеешь мне помочь - я заплачу тебе.
	AI_Output(other,self,"DIA_Taliasan_Help_HowMuch_01_06");	//Деньги меня не интересуют.
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_07");	//У меня еще есть магические зелья, которые смогут повысить твои способности!
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_08");	//Я бы мог дать тебе парочку таких снадобий.
	AI_Output(other,self,"DIA_Taliasan_Help_HowMuch_01_09");	//А нет ли у тебя чего-то особенного? Возможно, ты сможешь обучить меня магии?
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_15");	//Это самое лучшее, что ты мог попросить.
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_16");	//Знания гораздо важнее серебра и богатства, а богатство - неизбежное приложение к выдающимся способностям.
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_17");	//Хорошо! Если ты сможешь мне помочь, то я... я буду учить тебя магии.
};

instance DIA_TALIASAN_FineFood(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_TALIASAN_FineFood_condition;
	information = DIA_TALIASAN_FineFood_info;
	permanent = FALSE;
	description = "Я могу еще чем-то помочь тебе?";
};

func int DIA_TALIASAN_FineFood_condition()
{
	if(MIS_TALIASANHELP != FALSE)
	{
		return TRUE;
	};
};

func void DIA_TALIASAN_FineFood_info()
{
	AI_Output(other,self,"DIA_Taliasan_FineFood_01_00");	//Я могу еще чем-то помочь тебе?
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_01");	//(небрежно) Да, можешь. Принести мне чего-нибудь поесть.
	AI_Output(other,self,"DIA_Taliasan_FineFood_01_02");	//Ты голодаешь?
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_03");	//Нет, болван! Просто мне уже порядком надоела грубая пища.
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_04");	//Я привык питаться изысканно! А в этой дыре очень трудно достать приличную еду.
	AI_Output(other,self,"DIA_Taliasan_FineFood_01_05");	//Хорошо, что тебе принести?
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_06");	//Ну... Думаю, будет достаточно, если ты принесешь мне три бутылки вина, окорок, кусок сыра, горшочек меда и гроздь винограда. 
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_07");	//Но не вздумай просить у меня деньги на эти продукты. Сам что-нибудь придумай!
	MIS_TaliasanFineFood = LOG_Running;
	Log_CreateTopic(TOPIC_TaliasanFineFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TaliasanFineFood,LOG_Running);
	B_LogEntry(TOPIC_TaliasanFineFood,"Галлахаду надоела грубая пища портового района. Он попросил принести ему три бутылки вина, окорок, кусок сыра, горшочек меда и гроздь винограда.");
};

instance DIA_TALIASAN_FineFood_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_TALIASAN_FineFood_Done_condition;
	information = DIA_TALIASAN_FineFood_Done_info;
	permanent = FALSE;
	description = "Вот еда, которую ты просил.";
};

func int DIA_TALIASAN_FineFood_Done_condition()
{
	if((MIS_TaliasanFineFood == LOG_Running) && (Npc_HasItems(other,ItFo_Honey) >= 1) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItFo_Bacon) >= 1) && (Npc_HasItems(other,ITFO_WINEBERRYS) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 3)) 
	{
		return TRUE;
	};
};

func void DIA_TALIASAN_FineFood_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Taliasan_FineFood_Done_01_00");	//Вот еда, которую ты просил.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItFo_Honey,1);
	Npc_RemoveInvItems(hero,ItFo_Cheese,1);
	Npc_RemoveInvItems(hero,ItFo_Bacon,1);
	Npc_RemoveInvItems(hero,ITFO_WINEBERRYS,1);
	Npc_RemoveInvItems(hero,ItFo_Wine,3);
	AI_Output(self,other,"DIA_Taliasan_FineFood_Done_01_01");	//Отлично! Давай ее сюда...(жадно) Наконец-то мой желудок отведает нечто иное, нежели протухшая рыбная похлебка.
	AI_Output(self,other,"DIA_Taliasan_FineFood_Done_01_02");	//Ты хорошо поработал. Теперь можешь идти!
	AI_Output(other,self,"DIA_Taliasan_FineFood_Done_01_03");	//Что, даже спасибо не скажешь?
	AI_Output(self,other,"DIA_Taliasan_FineFood_Done_01_04");	//(небрежно) Спасибо.
	CreateInvItems(hero,ItSc_HarmUndead,1);
	MIS_TaliasanFineFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_TaliasanFineFood,LOG_Success);
	B_LogEntry(TOPIC_TaliasanFineFood,"Я принес Галлахаду продукты, а этот напыщенный индюк в робе даже спасибо не сказал... Неудивительно, что его тут никто не любит.");
	AI_StopProcessInfos(self);
};

instance DIA_TALIASAN_GIVEMEGIFT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegift_condition;
	information = dia_taliasan_givemegift_info;
	permanent = FALSE;
	description = "Я хочу получить свою награду.";
};


func int dia_taliasan_givemegift_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegift_info()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGift_01_00");	//Я хочу получить свою награду.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGift_01_01");	//Какую награду? Ты еще ничего не сделал!
};

instance DIA_TALIASAN_LETTERFROMFERNANDO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromfernando_condition;
	information = dia_taliasan_letterfromfernando_info;
	permanent = FALSE;
	description = "Я получил письмо от торговца Фернандо.";
};

func int dia_taliasan_letterfromfernando_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_fernandoletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromfernando_info()
{
	AI_Output(other,self,"DIA_Taliasan_LetterFromFernando_01_00");	//Я получил рекомендательное письмо от торговца Фернандо.
	if(Fernando_ImKnast == FALSE)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_01");	//Дай мне взглянуть!
		B_GiveInvItems(other,self,itwr_fernandoletter,1);
		Npc_RemoveInvItems(self,itwr_fernandoletter,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_03");	//Отличная работа!
		B_LogEntry(TOPIC_TALIASANHELP,"Я отдал Галлахаду письмо Фернандо.");
		RECOMENDLETTER = RECOMENDLETTER + 1;
		if(RECOMENDLETTER >= 4)
		{
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_04");	//Думаю, тех писем, что ты смог принести мне, вполне хватит, чтобы произвести впечатление на Лариуса.
			TALIASANHELP_STEP1 = TRUE;
		}
		else if(RECOMENDLETTER >= 3)
		{
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_06");	//Но не думаю, что этого будет достаточно для того, чтобы решить мою проблему.
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_07");	//Возможно, еще одно рекомендательное письмо нам бы не помешало!
		}
		else if(RECOMENDLETTER >= 1)
		{
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_08");	//Но мне нужно больше рекомендательных писем!
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_09");	//Нам нужно хотя бы еще парочку таких рекомендаций.
		};
	}
	else if((Fernando_ImKnast == TRUE) && (RECOMENDLETTER == 3))
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_10");	//(раздраженно) И зачем мне оно?! Весь город уже знает о том, что Фернандо поставлял оружие бандитам. А ты приносишь мне от него это письмо!
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_12");	//Хотя... Учитывая, что это ты раскрыл это преступление, - к твоей просьбе могут прислушаться.
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_04");	//Думаю, тех писем, что ты смог принести мне, вполне хватит, чтобы произвести впечатление на Лариуса.
		TALIASANHELP_STEP1 = TRUE;
		B_LogEntry(TOPIC_TALIASANHELP,"Галлахад не захотел брать рекомендательное письмо Фернандо, полагая, что к мнению преступника вряд ли кто-то прислушается. Но мое участие в раскрытии преступления Фернандо может быть полезным.");
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_10");	//(раздраженно) И зачем мне оно?! Весь город уже знает о том, что Фернандо поставлял оружие бандитам. А ты приносишь мне от него это письмо!
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_11");	//Лучше оставь его себе - мне оно точно ни к чему.
		B_LogEntry(TOPIC_TALIASANHELP,"Галлахад не захотел брать рекомендательное письмо Фернандо, полагая, что к мнению преступника вряд ли кто-то прислушается.");
	};
};


instance DIA_TALIASAN_LETTERFROMLUTERO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromlutero_condition;
	information = dia_taliasan_letterfromlutero_info;
	permanent = FALSE;
	description = "Вот тебе рекомендательное письмо от торговца Лютеро.";
};


func int dia_taliasan_letterfromlutero_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_luteroletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromlutero_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Taliasan_LetterFromLutero_01_00");	//Вот тебе рекомендательное письмо от торговца Лютеро.
	B_GiveInvItems(other,self,itwr_luteroletter,1);
	Npc_RemoveInvItems(self,itwr_luteroletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_03");	//Прекрасно! Я знаю Лютеро - он очень влиятельный человек в этом городе. Его мнение - очень важная деталь в нашем деле.
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry(TOPIC_TALIASANHELP,"Я отдал Галлахаду письмо от Лютеро.");
	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_04");	//Думаю, тех писем, что ты смог принести мне, вполне хватит, чтобы произвести впечатление на Лариуса.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_06");	//Но не думаю, что этого будет достаточно для того, чтобы решить мою проблему.
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_07");	//Возможно, еще одно рекомендательное письмо нам бы не помешало!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_08");	//Но мне нужно больше рекомендательных писем!
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_09");	//Нам нужно еще хотя бы парочку таких рекомендаций.
	};
};


instance DIA_TALIASAN_LETTERFROMGERBRANT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromgerbrant_condition;
	information = dia_taliasan_letterfromgerbrant_info;
	permanent = FALSE;
	description = "Вот, я принес тебе письмо от Гербрандта.";
};


func int dia_taliasan_letterfromgerbrant_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_gerbrantletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromgerbrant_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Taliasan_LetterFromGerbrant_01_00");	//Вот, я принес тебе письмо от Гербрандта.
	B_GiveInvItems(other,self,itwr_gerbrantletter,1);
	Npc_RemoveInvItems(self,itwr_gerbrantletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_03");	//Хммм... Интересно! Я думал, что от него ты не сможешь получить письмо.
	AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_04");	//Видимо, своей работой ты произвел на него впечатление.
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry(TOPIC_TALIASANHELP,"Я отдал Галлахаду рекомендательное письмо Гербрандта. Он был очень удивлен тем, что я смог его заполучить!");
	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_05");	//Думаю, тех писем, что ты смог мне принести, вполне хватит, чтобы произвести впечатление на Лариуса.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_07");	//Но не думаю, что этого будет достаточно, чтобы решить мою проблему.
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_08");	//Возможно, еще одно рекомендательное письмо нам бы не помешало!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_09");	//Но мне нужно больше рекомендательных писем!
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_10");	//Нам нужно еще хотя бы парочку таких рекомендаций.
	};
};

instance DIA_TALIASAN_LETTERFROMSALANDRIL(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromsalandril_condition;
	information = dia_taliasan_letterfromsalandril_info;
	permanent = FALSE;
	description = "Алхимик Саландрил написал для тебя рекомендацию.";
};

func int dia_taliasan_letterfromsalandril_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_salandrilletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromsalandril_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_LetterFromSalandril_01_00");	//Алхимик Саландрил написал для тебя рекомендацию.
	AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_01");	//Саландрил? Хммм. На его голос я не рассчитывал.
	B_GiveInvItems(other,self,itwr_salandrilletter,1);
	Npc_RemoveInvItems(self,itwr_salandrilletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_03");	//Хммм, неплохо! Хотя к его мнению в Хоринисе мало кто прислушивается.
	AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_04");	//Однако оно тоже может нам пригодиться.
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry(TOPIC_TALIASANHELP,"Я отдал Галлахаду рекомендательное письмо Саландрила. Судя по всему, это письмо не возымеет того действия, на которое рассчитывает Галлахад. Но все-таки он оставил его себе.");

	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_05");	//Думаю, тех писем, что ты смог принести мне, вполне хватит, чтобы произвести впечатление на Лариуса.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_07");	//Но не думаю, что этого будет достаточно для того, чтобы решить мою проблему.
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_08");	//Возможно, еще одно рекомендательное письмо нам бы не помешало!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_09");	//Но мне нужно больше рекомендательных писем!
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_10");	//Нам нужно еще хотя бы парочку таких рекомендаций.
	};
};


instance DIA_TALIASAN_LETTERFROMVALENTINO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromvalentino_condition;
	information = dia_taliasan_letterfromvalentino_info;
	permanent = FALSE;
	description = "У меня есть для тебя рекомендательное письмо от Валентино.";
};


func int dia_taliasan_letterfromvalentino_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_valentinoletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromvalentino_info()
{
	AI_Output(other,self,"DIA_Taliasan_LetterFromValentino_01_00");	//У меня есть для тебя рекомендательное письмо от Валентино.
	AI_Output(self,other,"DIA_Taliasan_LetterFromValentino_01_01");	//ЧТО?! От этого безмозглого болвана?
	AI_Output(self,other,"DIA_Taliasan_LetterFromValentino_01_03");	//Да его мнение в городе никто в грош не ставит!
	AI_Output(self,other,"DIA_Taliasan_LetterFromValentino_01_04");	//Лучше оставь его себе.
	B_LogEntry(TOPIC_TALIASANHELP,"Галлахад даже и брать не захотел рекомендательное письмо от Валентино. Судя по всему, его мнение в городе никого не интересует.");
};


instance DIA_TALIASAN_GIVEMEGIFTOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftok_condition;
	information = dia_taliasan_givemegiftok_info;
	permanent = FALSE;
	description = "Я хочу получить свою награду.";
};


func int dia_taliasan_givemegiftok_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftok_info()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftOK_01_00");	//Я хочу получить свою награду.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftOK_01_03");	//Проделано лишь полдела.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftOK_01_04");	//Поэтому поговорим о твоем вознаграждении позже.
};


instance DIA_TALIASAN_SENDTOLARIUS(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_sendtolarius_condition;
	information = dia_taliasan_sendtolarius_info;
	permanent = FALSE;
	description = "И что теперь?";
};


func int dia_taliasan_sendtolarius_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_sendtolarius_info()
{
	AI_Output(other,self,"DIA_Taliasan_SendToLarius_01_00");	//И что теперь?
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_01");	//Теперь надо отнести эти письма самому Лариусу.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_03");	//Стража не пустит меня в ратушу, но у тебя наверняка будет шанс попасть к нему на прием.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_05");	//Покажи ему эти письма, и будем надеяться, что Лариус будет в хорошем расположении духа.
	B_GiveInvItems(self,other,itwr_taliasanrecomendedletters,1);
	AI_Output(other,self,"DIA_Taliasan_SendToLarius_01_06");	//И что мне ему сказать?
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_07");	//Скажи, что я очень сожалею о случившемся и прошу забыть о том ужасном инциденте.
	AI_Output(other,self,"DIA_Taliasan_SendToLarius_01_10");	//Ну хорошо, я попробую поговорить с Лариусом.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_11");	//Да, еще одна вещь. Лариус - человек своеобразный, и к нему нужен особый подход.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_12");	//Судьба большинства решений зависит от его настроения.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_14");	//Как мне помнится, самое лучшее время, когда к нему стоит обратиться с такой просьбой, - это послеполуденный перерыв.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_15");	//Запомни это хорошенько. Теперь ступай!
	B_LogEntry(TOPIC_TALIASANHELP,"Теперь мне нужно отнести все рекомендательные письма Лариусу, главе Хориниса, с просьбой о проявлении снисхождения к Галлахаду в деле, которое сломало всю его жизнь. По словам Галлахада, Лариус - своеобразный человек: большинство решений он принимает в зависимости от настроения. Галлахад посоветовал обратиться к нему в послеполуденный перерыв, когда тот в наилучшем расположении духа.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_400_Larius,"Dinner");
};


instance DIA_TALIASAN_STOLENBOOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 9;
	condition = dia_taliasan_stolenbook_condition;
	information = dia_taliasan_stolenbook_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_stolenbook_condition()
{
	if((Npc_HasItems(hero,itwr_rhetorikbook) >= 1) && (TALIASANAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_stolenbook_info()
{
	AI_Output(self,other,"DIA_Taliasan_StolenBook_00");	//Не трогай!
	AI_Output(self,other,"DIA_Taliasan_StolenBook_01");	//На этой полке лежат мои личные книги, только попробуй что-нибудь взять!
	AI_Output(self,other,"DIA_Taliasan_StolenBook_02");	//Если у меня пропадет хоть одна книга, я сразу это замечу.
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,1);
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_STOLENBOOKTWO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 9;
	condition = dia_taliasan_stolenbooktwo_condition;
	information = dia_taliasan_stolenbooktwo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_taliasan_stolenbooktwo_condition()
{
	if((Npc_HasItems(hero,itwr_rhetorikbook) >= 1) && (TALIASANAWAY == FALSE) && Npc_KnowsInfo(hero,dia_taliasan_stolenbook))
	{
		return TRUE;
	};
};

func void dia_taliasan_stolenbooktwo_info()
{
	AI_Output(self,other,"DIA_Taliasan_StolenBookTwo_00");	//Эй, это моя книга. Руки прочь!
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,1);
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_NEEDBOOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_needbook_condition;
	information = dia_taliasan_needbook_info;
	permanent = FALSE;
	description = "Торговцу Фернандо нужна книга...";
};


func int dia_taliasan_needbook_condition()
{
	if(MIS_FERNANDOHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_taliasan_needbook_info()
{
	AI_Output(other,self,"DIA_Taliasan_NeedBook_01_00");	//Торговцу Фернандо нужна книга под названием 'Основы риторики'. Он напишет письмо только тогда, когда я принесу ему эту книгу.
	AI_Output(self,other,"DIA_Taliasan_NeedBook_01_01");	//Ха! Так она все еще ему нужна? Упрямец!
	AI_Output(self,other,"DIA_Taliasan_NeedBook_01_06");	//Найди другой способ получить от него письмо!
	B_LogEntry(TOPIC_FERNANDOHELP,"Галлахад не хочет расставаться со своей книгой. Он так недоверчив, что даже близко не подпускает меня к своей полке с книгами.");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_IGNAZHELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_ignazhelp_condition;
	information = dia_taliasan_ignazhelp_info;
	permanent = FALSE;
	description = "Игнац попросил меня напомнить тебе...";
};


func int dia_taliasan_ignazhelp_condition()
{
	if(MIS_IGNAZHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_taliasan_ignazhelp_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_IgnazHelp_01_00");	//Игнац попросил меня напомнить тебе...
	AI_Output(other,self,"DIA_Taliasan_IgnazHelp_01_02");	//...что ты обещал ему новую партию трав для его экспериментов.
	AI_Output(self,other,"DIA_Taliasan_IgnazHelp_01_03");	//Ах, да! Я совсем забыл о нем. Сейчас зайду к нему.
	TALIASANAWAY = TRUE;
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	Npc_ExchangeRoutine(self,"GoIgnaz");
	Log_SetTopicStatus(TOPIC_IGNAZHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERNANDOHELP,"Галлахад вышел, чтобы встретиться с Игнацем. Надо использовать этот момент!");
	MIS_IGNAZHELP = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_CANCELHELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_cancelhelp_condition;
	information = dia_taliasan_cancelhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_cancelhelp_condition()
{
	var int counthelpmiss;
	counthelpmiss = 0;
	if(MIS_GERBRANDTHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if(MIS_FERNANDOHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if(MIS_SALANDRILHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if((counthelpmiss >= 2) && (MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_cancelhelp_info()
{
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_00");	//Подожди минутку...
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_02");	//В городе ходит множество слухов про тебя. Причем не очень-то лестных!
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_03");	//Я слышал, что ты как-то умудрился поссориться с некоторыми влиятельными людьми этого города.
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_06");	//Я очень рассчитывал на их поддержку.
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_07");	//Так что забудь о нашем уговоре.
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_14");	//А теперь убирайся с глаз моих, идиот!
	TALIASANPISSOFF = TRUE;
	MIS_TALIASANHELP = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_TALIASANHELP);
	AI_StopProcessInfos(self);

	if(MIS_GERBRANDTHELP == LOG_Running)
	{
		MIS_GERBRANDTHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_OBSOLETE);
	};
	if(MIS_FERNANDOHELP == LOG_Running)
	{
		MIS_FERNANDOHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_OBSOLETE);
	};
	if(MIS_SALANDRILHELP == LOG_Running)
	{
		MIS_SALANDRILHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_OBSOLETE);
	};
	if(MIS_LUTEROHELP == LOG_Running)
	{
		MIS_LUTEROHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_OBSOLETE);
	};
	if(MIS_VALENTINOHELP == LOG_Running)
	{
		MIS_VALENTINOHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_OBSOLETE);
	};
};


instance DIA_TALIASAN_FUCKOFF(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 10;
	condition = dia_taliasan_fuckoff_condition;
	information = dia_taliasan_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_taliasan_fuckoff_condition()
{
	if((TALIASANPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_taliasan_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_TALIASAN_SENDTOLARIUSOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_sendtolariusok_condition;
	information = dia_taliasan_sendtolariusok_info;
	permanent = FALSE;
	description = "Я разговаривал с Лариусом.";
};

func int dia_taliasan_sendtolariusok_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALKLARIUSABOUTTALIASAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_sendtolariusok_info()
{
	AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_00");	//Я разговаривал с Лариусом.
	AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_01");	//(взволнованно) И что он сказал?

	if(LARIUSPISSOFF == TRUE)
	{
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_02");	//Он даже не стал меня слушать, а сразу указал мне на дверь!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_06");	//Черт! Видимо, ты сделал что-то не так, раз Лариус отреагировал на твою просьбу столь резким образом.
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_08");	//О Иннос! Это был мой последний шанс!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_09");	//Видимо, ты просто не умеешь общаться с людьми!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_17");	//А теперь убирайся с глаз моих!
		TALIASANPISSOFF = TRUE;
		MIS_TALIASANHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_TALIASANHELP);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_18");	//Он прощает тебя. Дело сделано.
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_19");	//Во многом помогли рекомендательные письма, которые произвели неизгладимое на Лариуса впечатление.
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_20");	//Он сказал, что ты можешь немедленно приступить к работе.
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_21");	//Это отличные новости! Наконец-то!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_22");	//Мне больше не придется торчать в этой вонючей клоаке до конца своей жизни. Я просто не верю в это!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_29");	//Не буду терять ни минуты и сейчас же отправлюсь к Лариусу.
		self.guild = GIL_NONE;
		MIS_TALIASANHELP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TALIASANHELP,LOG_SUCCESS);
		B_LogEntry(TOPIC_TALIASANHELP,"Я рассказал Галлахаду о встрече с Лариусом. Он был в восторге от того, что мне удалось убедить Лариуса простить его.");
		AI_StopProcessInfos(self);
		Npc_SetTrueGuild(self,GIL_NONE);
		Npc_ExchangeRoutine(self,"GoInTownHall");
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
		TaliasanNextQuest = Wld_GetDay();
	};
};


instance DIA_TALIASAN_GIVEMEGIFTNEXT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftnext_condition;
	information = dia_taliasan_givemegiftnext_info;
	permanent = FALSE;
	description = "Я хочу получить свою награду.";
};


func int dia_taliasan_givemegiftnext_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftnext_info()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNext_01_00");	//Я хочу получить свою награду.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNext_01_03");	//Извини, но сейчас я очень сильно спешу.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNext_01_04");	//Поэтому давай лучше поговорим о твоей награде завтра.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNext_01_05");	//Приходи после полудня в ратушу, и мы обсудим твое вознаградждение.
	MIS_TALIASAN_GIFT_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_HOUSE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_house_condition;
	information = dia_taliasan_house_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_house_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_taliasan_house_info()
{
	AI_Output(self,other,"DIA_Taliasan_House_01_00");	//Да, и еще кое-что...
	AI_Output(self,other,"DIA_Taliasan_House_01_02");	//Мне теперь навряд ли пригодится эта хибара.
	AI_Output(self,other,"DIA_Taliasan_House_01_04");	//Можешь жить тут, если захочешь.
	TaliasanHomeIsMine = TRUE;
	TALIASANAWAY = TRUE;
	AI_StopProcessInfos(self);

	if(Npc_HasItems(self,itar_mage) == 0)
	{
		CreateInvItem(self,itar_mage);
	};

	AI_EquipBestArmor(self);
	Wld_AssignRoomToGuild("hafen06",GIL_NONE);
};

instance DIA_TALIASAN_GIVEMEGIFTNOW(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftnow_condition;
	information = dia_taliasan_givemegiftnow_info;
	permanent = FALSE;
	description = "Я хочу получить свою награду.";
};


func int dia_taliasan_givemegiftnow_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_taliasan_givemegiftnext) && ((MIS_TALIASAN_GIFT_DAY < (Wld_GetDay() - 1)) || ((MIS_TALIASAN_GIFT_DAY < Wld_GetDay()) && Wld_IsTime(12,0,23,59))))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftnow_info()
{
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_01_00");	//Я хочу получить свою награду.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_01_01");	//Хорошо! Что ты выбираешь?
	Info_AddChoice(dia_taliasan_givemegiftnow,"Мне нужны деньги.",dia_taliasan_givemegiftnow_money);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Дай мне парочку твоих зелий.",dia_taliasan_givemegiftnow_zelia);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Научи меня использовать магию.",dia_taliasan_givemegiftnow_magic);
};

func void dia_taliasan_givemegiftnow_money()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Money_01_00");	//Мне нужны деньги.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_01");	//Я могу дать тебе за твои труды пятьсот золотых монет.
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Money_01_03");	//Как, так мало?
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_04");	//Хммм...(задумался) Наверно, ты прав.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_05");	//Хорошо. Как насчет тысячи золотых монет?
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_06");	//Больше у меня нет.
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Я согласен.",dia_taliasan_givemegiftnow_thousand);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Нет, этого все равно слишком мало.",dia_taliasan_givemegiftnow_nomoney);
};

func void dia_taliasan_givemegiftnow_thousand()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Thousand_01_00");	//Ладно, давай сюда деньги.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Thousand_01_01");	//Вот, возьми этот кошелек - тут ровно тысяча монет.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Thousand_01_02");	//Теперь извини - я должен работать.
	B_GiveInvItems(self,other,itse_taliasanpocket,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_nomoney()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_NoMoney_01_00");	//Нет, этого все равно слишком мало.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_NoMoney_01_02");	//Если тебя не устраивает и это - то мне больше нечего тебе предложить.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_NoMoney_01_03");	//Теперь извини - я должен работать.
	TALIASANDOLG = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_zelia()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Zelia_01_00");	//Дай мне парочку твоих зелий.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Zelia_01_01");	//Какое зелье ты хотел бы получить?
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Я хочу взять зелье силы.",dia_taliasan_givemegiftnow_str);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Я хочу взять зелье ловкости.",dia_taliasan_givemegiftnow_dex);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Я возьму зелье маны.",dia_taliasan_givemegiftnow_mana);
};

func void dia_taliasan_givemegiftnow_str()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Str_01_00");	//Я хочу взять зелье силы.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Str_01_01");	//Вот, возьми.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Str_01_02");	//Теперь извини! Я должен работать.
	B_GiveInvItems(self,other,ItPo_Perm_STR_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_dex()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Dex_01_00");	//Я выбираю зелье ловкости.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Dex_01_01");	//Вот, возьми.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Dex_01_02");	//Теперь извини! Я должен работать.
	B_GiveInvItems(self,other,ItPo_Perm_Dex_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_mana()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Mana_01_00");	//Я возьму зелье маны.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Mana_01_01");	//Вот, возьми.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Mana_01_02");	//Теперь извини! Я должен работать.
	B_GiveInvItems(self,other,ItPo_Perm_Mana_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_magic()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Magic_01_00");	//Научи меня использовать магию.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_01");	//Ты выбрал самую ценную награду.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_03");	//Однако я должен тебя предупредить, что я не смогу обучить тебя магии Огня или Воды. Не говоря уже о магии некромантов!
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_04");	//Эти виды магии доступны только лишь последователям тех богов, которые даруют им эти знания.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_05");	//Я же занимаюсь истинной магией!
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_06");	//Я научу тебя создавать руны, для этого тебе понадобятся магические свитки.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_08");	//Их ты сможешь купить у меня.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_09");	//Кроме этого, я посвящу тебя в тайны магических Кругов. Круги помогут тебе получить власть над созданными тобой рунами.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_10");	//Также я могу увеличить твою магическую силу.
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	TALIASANTEACHMAGIC = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TRMAGICTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_TRMAGICTEACHER,"Галлахад научит меня создавать руны истинной магии, поможет освоить магические Круги и покажет, как увеличить свою магическую силу.");
	B_LogEntry_Quiet(TOPIC_ADDON_TRMAGICTEACHER,"Кроме того, у Галлахада я могу купить свитки с заклинаниями.");
};


instance DIA_TALIASAN_EXPLAINCIRCLES(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_explaincircles_condition;
	information = dia_taliasan_explaincircles_info;
	important = FALSE;
	permanent = FALSE;
	description = "Пожалуйста, объясни мне, в чем смысл магических Кругов?";
};


func int dia_taliasan_explaincircles_condition()
{
	if(TALIASANTEACHMAGIC == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_explaincircles_info()
{
	AI_Output(other,self,"DIA_Taliasan_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_02");	//С удовольствием. Круги символизируют твое понимание магии.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_03");	//Они обозначают уровень твоих знаний и навыков, способность обучаться новым заклинаниям.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_04");	//Ты должен пройти каждый Круг до конца, прежде чем сможешь вступить в следующий.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_05");	//Потребуются долгие часы обучения и намного больше опыта, чтобы достичь высших Кругов.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_06");	//Твои старания каждый раз будут вознаграждаться новыми могущественными заклинаниями. Но в любом случае магические Круги значат куда больше.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_07");	//Они - часть твоей жизни. Они всегда будут с тобой. Сделай их частью себя.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_08");	//Для того чтобы понять их силу, ты должен познать себя.
	EXPLAINCIRCLEMEAN = TRUE;
};

instance DIA_TALIASAN_RUNEN(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_runen_condition;
	information = dia_taliasan_runen_info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};

func int dia_taliasan_runen_condition()
{
	if((TALIASANTEACHMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_taliasan_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_taliasan_runen,"3 круг магии",dia_taliasan_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_taliasan_runen,"2 круг магии",dia_taliasan_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_taliasan_runen,"1 круг магии",dia_taliasan_runen_1);
	};
};

func void dia_taliasan_runen_back()
{
	Info_ClearChoices(dia_taliasan_runen);
};

func void dia_taliasan_runen_1()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),dia_taliasan_runen_circle_1_spl_light);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),dia_taliasan_runen_circle_1_spl_lightheal);
	};
	if((PLAYER_TALENT_RUNES[SPL_UnlockChest] == FALSE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_UnlockChest,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_UnlockChest)),dia_taliasan_runen_circle_1_spl_unlock);
	};
};

func void dia_taliasan_runen_2()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),dia_taliasan_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),dia_taliasan_runen_circle_2_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),dia_taliasan_runen_circle_2_spl_destroyundead);
	};
};

func void dia_taliasan_runen_3()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),dia_taliasan_runen_circle_3_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),dia_taliasan_runen_circle_3_spl_fullheal);
	};
};

func void dia_taliasan_runen_circle_1_spl_light()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void dia_taliasan_runen_circle_1_spl_lightheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void dia_taliasan_runen_circle_1_spl_unlock()
{
	B_TeachPlayerTalentRunes(self,other,SPL_UnlockChest);
};

func void dia_taliasan_runen_circle_2_spl_summonwolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void dia_taliasan_runen_circle_2_spl_mediumheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void dia_taliasan_runen_circle_2_spl_destroyundead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void dia_taliasan_runen_circle_3_spl_fullheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void dia_taliasan_runen_circle_3_spl_summongolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};


instance DIA_TALIASAN_TRADE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_trade_condition;
	information = dia_taliasan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои магические свитки.";
};


func int dia_taliasan_trade_condition()
{
	if(TALIASANTEACHMAGIC == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Taliasan_Trade_01_01");	//Покажи мне свои магические свитки.

	if(TALIASAN_TRADE == 0)
	{
		CreateInvItems(self,ItSc_Zap,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		TALIASAN_TRADE += 1;
	};

	B_GiveTradeInv(self);
};


instance DIA_TALIASAN_TEACH_MANA(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 10;
	condition = dia_taliasan_teach_mana_condition;
	information = dia_taliasan_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};

func int dia_taliasan_teach_mana_condition()
{
	if((TALIASANTEACHMAGIC == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MED) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_taliasan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Taliasan_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	AI_Output(self,other,"DIA_Taliasan_TEACH_MANA_15_01");	//Я могу помочь тебе в этом. Как ты ее используешь, зависит только от тебя.
	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA,"Регенерация маны (Очки обучения: 20, Цена: 15000 монет)",DIA_Taliasan_TEACH_MANA_Regen);
	};
};

func void dia_taliasan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Taliasan_TEACH_MANA_05_00");	//Я больше не в силах помочь тебе в этом.
		AI_Output(self,other,"DIA_Taliasan_TEACH_MANA_05_01");	//Ты на пределе своих возможностей!
	};

	Info_ClearChoices(dia_taliasan_teach_mana);
};

func void DIA_Taliasan_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Научи меня регенерации маны.

	kosten = 20;
	money = 15000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Обучение: Регенерация маны");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);
};

func void dia_taliasan_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA,"Регенерация маны (Очки обучения: 30, Цена: 15000 монет)",DIA_Taliasan_TEACH_MANA_Regen);
	};
};

func void dia_taliasan_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA,"Регенерация маны (Очки обучения: 30, Цена: 15000 монет)",DIA_Taliasan_TEACH_MANA_Regen);
	};
};

instance DIA_TALIASAN_CIRCLE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_circle_condition;
	information = dia_taliasan_circle_info;
	permanent = TRUE;
	description = "Я хочу постигать суть магии.";
};

func int dia_taliasan_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3) && (TALIASANTEACHMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_circle_info()
{
	AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_00");	//Я хочу постигать суть магии.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == FALSE) && (Kapitel >= 1))
	{
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE,"1 Круг магии (Очков обучения: 20, Цена: 500 монет)",DIA_Taliasan_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE,"2 Круг магии (Очков обучения: 30, Цена: 1000 монет)",DIA_Taliasan_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{	
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE,"3 Круг магии (Очков обучения: 40, Цена: 2000 монет)",DIA_Taliasan_CIRCLE_3);
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_31");	//Еще не время! Возвращайся позже.
	};
};

func void DIA_Taliasan_CIRCLE_back()
{
	Info_ClearChoices(DIA_Taliasan_CIRCLE);
};

func void DIA_Taliasan_CIRCLE_1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		if(B_TeachMagicCircle(self,other,1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
			AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_01");	//Я готов вступить в Первый Круг.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_01");	//Вступив в Первый Круг, ты научишься использовать магические руны.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_02");	//Каждая руна содержит структуру особого магического заклинания.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_03");	//Использовав свою собственную магическую силу, ты сможешь высвободить магию руны.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_04");	//Но в отличие от свитков, которые по сути являются магическими формулами, магия рун поддерживает структуру заклинания всегда.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_05");	//Каждая руна таит в себе магическую силу, которую ты можешь забрать в любой момент.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_06");	//Так же, как и со свитком, в момент, когда ты используешь руну, расходуется твоя собственная магическая сила.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_07");	//С каждым новым Кругом ты будешь узнавать о рунах все больше и больше.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_08");	//Используй их силу для того, чтобы познать себя.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};

func void DIA_Taliasan_CIRCLE_2()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_0B");	//Готов ли ты вступить в следующий Круг магии?
			AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_02");	//Я готов вступить во Второй Круг.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_09");	//Ты уже научился понимать руны. Пришло время углубить твои познания.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_10");	//Вступив во Второй Круг, ты постигнешь основы мощных боевых заклятий.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_11");	//Но для того чтобы познать истинные секреты магии, тебе предстоит многому научиться.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_12");	//Ты уже знаешь о том, что можешь использовать любую руну бессчетное число раз, но лишь до тех пор, пока не израсходуешь собственную магическую силу.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_13");	//Но прежде чем сделать что-либо, подумай о том, есть ли в этом смысл. Ты обладаешь силой, которая позволяет с легкостью сеять смерть и разрушения.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_14");	//Но истинный маг использует ее лишь по необходимости.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_15");	//Научись оценивать ситуацию, и ты познаешь истинную силу рун.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};


func void DIA_Taliasan_CIRCLE_3()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,2000);
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_0C");	//Готов ли ты вступить в следующий Круг магии?
			AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_03");	//Какие знания сопутствуют Третьему Кругу?
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_16");	//Третий Круг является одним из важнейших этапов в жизни каждого мага. Достигнув его, ты завершаешь свой поиск.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_17");	//Ты уже преодолел значительный этап на пути магии. Ты научился использовать руны.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_18");	//Это знание послужит основой для следующего этапа. Используй руны осмотрительно.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_19");	//Ты можешь использовать их или нет. Но ты должен определиться с выбором.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_20");	//Сделав выбор, используй свою силу без колебаний.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_21");	//Найди свой путь, и тогда ты познаешь силу решения.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};

instance DIA_TALIASAN_BOOKSEEKXARDAS(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardas_condition;
	information = dia_taliasan_bookseekxardas_info;
	permanent = FALSE;
	description = "Я ищу одну очень редкую книгу.";
};


func int dia_taliasan_bookseekxardas_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (TALIASANTELLWHOMAGE == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardas_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_01_01");	//Я ищу одну очень редкую книгу.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_01_03");	//Кажется, она называется 'Напрасный путь'. Ты что-нибудь слышал о ней?
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_01_05");	//Скажи, а почему тебя она заинтересовала?
	Info_ClearChoices(dia_taliasan_bookseekxardas);
	Info_AddChoice(dia_taliasan_bookseekxardas,"Она нужна Ксардасу!",dia_taliasan_bookseekxardas_xardas);
	Info_AddChoice(dia_taliasan_bookseekxardas,"Меня просто интересуют редкие вещи.",dia_taliasan_bookseekxardas_nothng);
};

func void dia_taliasan_bookseekxardas_xardas()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Xardas_01_01");	//Она нужна Ксардасу.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_02");	//(ухмыляется) Я так и думал...
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_03");	//Видимо, он никогда не успокоится, пока не получит ее в свои руки.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_05");	//Боюсь, я огорчу тебя, но ее у меня нет.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_07");	//Я продал ее одному странствующему торговцу.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_09");	//Только не спрашивай о нем. Я не помню - это было давно...
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_10");	//Так что не трать время - здесь ты ее точно не найдешь.
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад сказал, что давным-давно продал эту книгу странствующему торговцу, имя которого он не помнит. Мне кажется, Галлахад что-то не договаривает. Думаю, стоит поговорить об этом с Ксардасом.");
	XARDASMISSBOOKFOREVER = TRUE;
};

func void dia_taliasan_bookseekxardas_nothng()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_01");	//Меня просто интересуют редкие вещи.
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_02");	//Да?! Хммм...(удивленно) Очень интересно!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_03");	//Так ты можешь сказать мне, где я смогу найти эту книгу?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_05");	//Мне удалось достать один ее экземпляр. Хотя это большая редкость.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_09");	//Но тебе я его не отдам - даже и не надейся!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_12");	//Может, я смогу что-нибудь сделать, чтобы ты поменял свое решение?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_15");	//(думает) Ты помог мне с Лариусом... И я согласен отдать тебе эту книгу, но лишь в обмен на такую же ценную вещь.
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_16");	//Что тебя конкретно интересует?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_18");	//Подойдет все что угодно - эликсиры, растения, магические свитки. Главное, чтобы эта вещь была редкой.
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_19");	//Хорошо, я посмотрю что можно сделать.
		B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на другую редкую вещь. Это может быть что угодно: эликсир, растение или магический свиток.");
		XARDASBRIGBOOKSPECIAL = TRUE;
		Info_ClearChoices(dia_taliasan_bookseekxardas);
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_20");	//Да?! Хммм...(удивленно) Ты не похож на человека, которого бы интересовало подобное.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_26");	//Хммм... Ладно, допустим, у меня есть один такой экземпляр.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_27");	//Но тебе я его не отдам - даже и не надейся!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_28");	//Может, я смогу что-нибудь сделать, чтобы ты поменял свое решение?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_29");	//Я не вижу ни одной причины, почему бы мне следовало отдать эту книгу тебе.
		B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад пока не видит причин отдать мне эту книгу. Интересно, что могло бы заставить его изменить свое решение?");
		XARDASMISSBOOK = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_BOOKSEEKXARDASAFTER(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardasafter_condition;
	information = dia_taliasan_bookseekxardasafter_info;
	permanent = TRUE;
	description = "Насчет той книги...";
};


func int dia_taliasan_bookseekxardasafter_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (XARDASMISSBOOK == TRUE) && (XARDASBRIGBOOKSPECIAL == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardasafter_info()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasAfter_01_00");	//Насчет той книги...
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_01");	//Хммм... Ну хорошо.
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardasAfter_01_04");	//Что тебя конкретно интересует?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_06");	//Подойдет все что угодно - эликсиры, растения, магические свитки. Главное, чтобы эта вещь была редкой.
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardasAfter_01_07");	//Хорошо, я посмотрю что можно сделать.
		B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на другую редкую вещь. Это может быть что угодно: эликсир, растение или магический свиток.");
		XARDASBRIGBOOKSPECIAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_08");	//Я же тебе сказал, что не вижу пока ни одной причины, почему бы мне следовало сделать это.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_09");	//Так что оставь меня в покое!
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_BOOKSEEKXARDASGIFT(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardasgift_condition;
	information = dia_taliasan_bookseekxardasgift_info;
	permanent = TRUE;
	description = "Насчет интересующей тебя редкой вещи...";
};


func int dia_taliasan_bookseekxardasgift_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (XARDASBRIGBOOKSPECIAL == TRUE) && (GIVEXARDASSEEKBOOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardasgift_info()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_01_00");	//Насчет интересующей тебя редкой вещи...
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_01_01");	//Да? У тебя есть что-то особенное?
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
	if(Npc_HasItems(other,ItPo_Perm_STR) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Предложить эликсир силы.",dia_taliasan_bookseekxardasgift_potionstr);
	};
	if(Npc_HasItems(other,ItPo_Perm_DEX) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Предложить эликсир ловкости.",dia_taliasan_bookseekxardasgift_potiondex);
	};
	if(Npc_HasItems(other,ItPo_Perm_Mana) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Предложить эликсир маны.",dia_taliasan_bookseekxardasgift_potionmana);
	};
	if(Npc_HasItems(other,ItPo_Perm_Health) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Предложить эликсир жизни.",dia_taliasan_bookseekxardasgift_potionlife);
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Предложить царский щавель.",dia_taliasan_bookseekxardasgift_plantperm);
	};
	if(Npc_HasItems(other,itwr_xardasgoblinscroll) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Предложить свиток изгнания.",dia_taliasan_bookseekxardasgift_scroll);
	};
	Info_AddChoice(dia_taliasan_bookseekxardasgift,"Пока нет.",dia_taliasan_bookseekxardasgift_not);
};

func void dia_taliasan_bookseekxardasgift_not()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Not_01_00");	//Пока нет.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Not_01_01");	//В таком случае, нам с тобой тоже пока нечего обсуждать.
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionstr()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_00");	//Этот эликсир силы.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_01");	//Хммм... Это действительно редкая вещица.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_04");	//Вот, держи. А моя книга?
	B_GiveInvItems(other,self,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_05");	//Конечно! Как и договаривались - вот она.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_06");	//И смотри, будь с ней осторожен - такой больше нигде не найти!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на эликсир силы. Теперь ее необходимо отнести Ксардасу.");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potiondex()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_00");	//Этот эликсир ловкости.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_01");	//Хммм... Это действительно редкая вещица.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_04");	//Вот, держи. А моя книга?
	B_GiveInvItems(other,self,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_05");	//Конечно! Как и договаривались - вот она.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_06");	//И смотри, будь с ней осторожен - такой больше нигде не найти!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на эликсир ловкости. Теперь ее необходимо отнести Ксардасу.");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionmana()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_00");	//Этот эликсир магической энергии.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_01");	//Хммм... Это действительно редкая вещица.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_04");	//Вот, держи. А моя книга?
	B_GiveInvItems(other,self,ItPo_Perm_Mana,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_05");	//Конечно! Как и договаривались - вот она.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_06");	//И смотри, будь с ней осторожен - такой больше нигде не найти!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на эликсир маны. Теперь ее необходимо отнести Ксардасу.");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionlife()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_00");	//Этот эликсир жизни.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_01");	//Хммм... Это действительно редкая вещица.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_04");	//Вот, держи. А моя книга?
	B_GiveInvItems(other,self,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_05");	//Конечно! Как и договаривались - вот она.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_06");	//И смотри, будь с ней осторожен - такой больше нигде не найти!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на эликсир жизни. Теперь ее необходимо отнести Ксардасу.");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_plantperm()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_00");	//Это царский щавель.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_01");	//Хммм... Это действительно редкая вещица.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_04");	//Вот, держи. А моя книга?
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_05");	//Конечно! Как и договаривались - вот она.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_06");	//И смотри, будь с ней осторожен - такой больше нигде не найти!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на царский щавель. Теперь ее необходимо отнести Ксардасу.");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_scroll()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_00");	//Этот свиток изгнания.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_01");	//Невероятно! Это действительно очень редкая вещица.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_04");	//Вот, держи. А моя книга?
	B_GiveInvItems(other,self,itwr_xardasgoblinscroll,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_05");	//Конечно! Как и договаривались - вот она.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_06");	//И смотри, будь с ней осторожен - такой больше нигде не найти!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад согласился отдать мне эту книгу в обмен на свиток изгнания. Теперь ее необходимо отнести Ксардасу.");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};


instance DIA_TALIASAN_TEACHDOITSC1(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_teachdoitsc1_condition;
	information = dia_taliasan_teachdoitsc1_info;
	permanent = TRUE;
	description = "А ты можешь научить меня чему-нибудь еще?";
};

func int dia_taliasan_teachdoitsc1_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && (TALIASANTEACHMAGIC == TRUE) && (HOWCANMAKERUNE_ITSC == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_teachdoitsc1_info()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Scroll_55_01");	//А ты можешь научить меня чему-нибудь еще?
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_55_02");	//Я могу научить тебя делать некоторые магические свитки.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_55_16");	//Но не бесплатно, разумеется.
	HOWCANMAKERUNE_ITSC = TRUE;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Галлахад согласился учить меня делать магические свитки. Впрочем, он обучит меня только написанию специальных формул, благодаря которым и получаются сами свитки. Кроме знания конкретной формулы, мне понадобятся: стол для письма, перо и рунная бумага.");
};

var int taliasan_counter;

instance DIA_TALIASAN_TEACHDOITSC2(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_teachdoitsc2_condition;
	information = dia_taliasan_teachdoitsc2_info;
	permanent = TRUE;
	description = "Научи меня создавать свитки.";
};

func int dia_taliasan_teachdoitsc2_condition()
{
	if((HOWCANMAKERUNE_ITSC == 1) && (TALIASAN_COUNTER < 7))
	{
		return TRUE;
	};
};

func void dia_taliasan_teachdoitsc2_info()
{
	Info_ClearChoices(dia_taliasan_teachdoitsc2);
	Info_AddChoice(dia_taliasan_teachdoitsc2,"Отмена",dia_taliasan_teachdoitsc2_Back);

	if(HOWCANMAKERUNE_ITSC4 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Свиток 'Ледяная глыба' (Очки обучения: 2, Цена: 500 монет)",dia_taliasan_teachdoitsc2_icecube);
	};
	if(HOWCANMAKERUNE_ITSC2 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Свиток 'Уничтожение нежити' (Очки обучения: 4, Цена: 750 монет)",dia_taliasan_teachdoitsc2_hurmundead);
	};
	if(HOWCANMAKERUNE_ITSC5 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Свиток 'Ледяная волна' (Очки обучения: 6, Цена: 1000 монет)",dia_taliasan_teachdoitsc2_icewave);
	};
	if(HOWCANMAKERUNE_ITSC6 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Свиток 'Смерч' (Очки обучения: 8, Цена: 1250 монет)",dia_taliasan_teachdoitsc2_tornado);
	};
	if(HOWCANMAKERUNE_ITSC7 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Магический взлом' (Очки обучения: 10, Цена: 1500 монет)",dia_taliasan_teachdoitsc2_unlock);
	};
	if(HOWCANMAKERUNE_ITSC1 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Свиток 'Огненный дождь' (Очки обучения: 10, Цена: 2000 монет)",dia_taliasan_teachdoitsc2_firerain);
	};
};

func void dia_taliasan_teachdoitsc2_Back()
{
	Info_ClearChoices(dia_taliasan_teachdoitsc2);
};

func void dia_taliasan_teachdoitsc2_unlock()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1500) && (hero.lp >= 10))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1500);
		Npc_RemoveInvItems(self,ItMi_Gold,1500);
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		HOWCANMAKERUNE_ITSC7 = TRUE;
		AI_Print("Обучен изготовлению магического свитка - 'Магический взлом'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1500)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает золота.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 10)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_firerain()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 2000) && (hero.lp >= 10))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,2000);
		Npc_RemoveInvItems(self,ItMi_Gold,2000);
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		HOWCANMAKERUNE_ITSC1 = TRUE;
		AI_Print("Обучен изготовлению магического свитка - 'Огненный дождь'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 2000)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает золота.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 10)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_hurmundead()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 750) && (hero.lp >= 4))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,750);
		Npc_RemoveInvItems(self,ItMi_Gold,750);
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		HOWCANMAKERUNE_ITSC2 = TRUE;
		AI_Print("Обучен изготовлению магического свитка - 'Уничтожение нежити'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 750)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает золота.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 4)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_icecube()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 500) && (hero.lp >= 2))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,500);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		HOWCANMAKERUNE_ITSC4 = TRUE;
		AI_Print("Обучен изготовлению магического свитка - 'Ледяная глыба'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 500)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает золота.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 2)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_icewave()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1000) && (hero.lp >= 6))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1000);
		Npc_RemoveInvItems(self,ItMi_Gold,1000);
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		HOWCANMAKERUNE_ITSC5 = TRUE;
		AI_Print("Обучен изготовлению магического свитка - 'Ледяная волна'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1000)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает золота.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 6)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_tornado()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1250) && (hero.lp >= 8))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1250);
		Npc_RemoveInvItems(self,ItMi_Gold,1250);
		hero.lp = hero.lp - 8;
		RankPoints = RankPoints + 8;
		HOWCANMAKERUNE_ITSC6 = TRUE;
		AI_Print("Обучен изготовлению магического свитка - 'Смерч'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1250)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//У тебя не хватает золота.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 8)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

instance DIA_Taliasan_BuyBooks(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_BuyBooks_condition;
	information = DIA_Taliasan_BuyBooks_info;
	permanent = FALSE;
	description = "Тебя интересуют редкие книги?";
};

func int DIA_Taliasan_BuyBooks_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Taliasan_BuyBooks_info()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_01");	//Тебя интересуют редкие книги?
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_02");	//Конечно. Это единственное, что меня по-настоящему интересует.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_03");	//Ибо некоторые знания не купишь даже за все золото мира.
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_04");	//А что я получу взамен, если принесу тебе некоторые из них?
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_05");	//Хммм... Денег у меня сейчас мало, и мне нечем будет с тобой расплатиться.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_06");	//Однако в качестве награды я могу помочь тебе увеличить магические знания и опыт.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Галлахад также собирает редкие книги. Я могу приносить ему некоторые из их, а взамен он повысит мои магические способности и опыт.");
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_07");	//Однако в качестве награды я помогу увеличить твою жизненную энергию.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Галлахад также собирает редкие книги. Я могу приносить ему некоторые из их, а взамен он повысит мою жизненную энергию и опыт.");
	};

	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_08");	//Если ты, конечно, заинтересован в этом.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_09");	//Или же можешь просто продать их любому торговцу на рыночной площади.
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_10");	//Я подумаю над твоим предложением.
	TalBuyBooks = TRUE;
};

var int BookTalCount;

instance DIA_Taliasan_BuyBooks_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_BuyBooks_Done_condition;
	information = DIA_Taliasan_BuyBooks_Done_info;
	permanent = TRUE;
	description = "По поводу редких книг...";
};

func int DIA_Taliasan_BuyBooks_Done_condition()
{
	if(TalBuyBooks == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Taliasan_BuyBooks_Done_info()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_01_01");	//По поводу редких книг...
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_02");	//(с интересом) Да? Что ты можешь мне предложить?
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_01_03");	//Вот, взгляни сам.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_04");	//Хорошо. Подожди минутку.
	B_UseFakeScroll();
	
	BookTalCount = FALSE;

	if((Npc_HasItems(hero,ITWR_CBOW_T1) >= 1) && (BookTalBonus_01 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_CBOW_T2) >= 1) && (BookTalBonus_02 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_EinhandBuch) >= 1) && (BookTalBonus_03 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_ZweihandBuch) >= 1) && (BookTalBonus_04 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ASTRONOMIE) >= 1) && (BookTalBonus_05 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEMONLANG) >= 1) && (BookTalBonus_06 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER1) >= 1) && (BookTalBonus_07 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER2) >= 1) && (BookTalBonus_08 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER3) >= 1) && (BookTalBonus_09 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,DAS_MAGISCHE_ERZ) >= 1) && (BookTalBonus_10 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT1) >= 1) && (BookTalBonus_11 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT2) >= 1) && (BookTalBonus_12 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_SOULRIVER) >= 1) && (BookTalBonus_13 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,ITWR_AZGOLOR) >= 1) && (BookTalBonus_14 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,ITWR_INNOSPRAY) >= 1) && (BookTalBonus_15 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_MANIAC) >= 1) && (BookTalBonus_16 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_KAMPFKUNST) >= 1) && (BookTalBonus_17 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_ELEMENTAREARCANEI) >= 1) && (BookTalBonus_18 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_JAGD_UND_BEUTE) >= 1) && (BookTalBonus_19 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,MYRTANAS_LYRIK) >= 1) && (BookTalBonus_20 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,WAHRE_MACHT) >= 1) && (BookTalBonus_21 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,MACHTVOLLE_KUNST) >= 1) && (BookTalBonus_22 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,GOETTERGABE) >= 1) && (BookTalBonus_23 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,GEHEIMNISSE_DER_ZAUBEREI) >= 1) && (BookTalBonus_24 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_UMSONST_01) >= 1) && (BookTalBonus_25 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_ANCIENT) >= 1) && (BookTalBonus_26 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE) >= 1) && (BookTalBonus_27 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE_2) >= 1) && (BookTalBonus_28 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEMONTALE) >= 1) && (BookTalBonus_29 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_SKELETONTALE) >= 1) && (BookTalBonus_30 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK1) >= 1) && (BookTalBonus_31 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK2) >= 1) && (BookTalBonus_32 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ELEMENTARE_ARCANEI) >= 1) && (BookTalBonus_33 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_MonasterySecret) >= 1) && (BookTalBonus_34 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK1) >= 1) && (BookTalBonus_35 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK2) >= 1) && (BookTalBonus_36 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK3) >= 1) && (BookTalBonus_37 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK4) >= 1) && (BookTalBonus_38 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK5) >= 1) && (BookTalBonus_39 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Astronomy_Mis) >= 1) && (BookTalBonus_40 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_VinosKellergeister_Mis) >= 1) && (BookTalBonus_41 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEATH1) >= 1) && (BookTalBonus_42 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEATH2) >= 1) && (BookTalBonus_43 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_HallsofIrdorath_Open_Mis) >= 1) && (BookTalBonus_44 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_XardasSeamapBook_Mis) >= 1) && (BookTalBonus_45 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Alchemy_01) >= 1) && (BookTalBonus_46 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Druid_01) >= 1) && (BookTalBonus_47 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};

	if(BookTalCount >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_05");	//Похоже, что у тебя тут в самом деле имеются очень интересные экземпляры!
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_06");	//Пожалуй, я возьму их. Тебе они точно больше не нужны?
		Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
		Info_AddChoice(DIA_Taliasan_BuyBooks_Done,"Да, забирай их!",DIA_Taliasan_BuyBooks_Done_Yes);
		Info_AddChoice(DIA_Taliasan_BuyBooks_Done,"Мне надо подумать.",DIA_Taliasan_BuyBooks_Done_No);
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_07");	//К сожалению, у тебя нет тех книг, которые бы меня действительно заинтересовали.
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_08");	//Так что лучше продай этот хлам торговцам на площади. Им там самое место!
	};
};


func void DIA_Taliasan_BuyBooks_Done_Yes()
{
	var int tempxpbook;

	BookTalCount = FALSE;

	if((Npc_HasItems(hero,ITWR_CBOW_T1) >= 1) && (BookTalBonus_01 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_CBOW_T1,1);
		CreateInvItems(self,ITWR_CBOW_T1,1);
		BookTalBonus_01 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_CBOW_T2) >= 1) && (BookTalBonus_02 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_CBOW_T2,1);
		CreateInvItems(self,ITWR_CBOW_T2,1);
		BookTalBonus_02 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_EinhandBuch) >= 1) && (BookTalBonus_03 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_EinhandBuch,1);
		CreateInvItems(self,ItWr_EinhandBuch,1);
		BookTalBonus_03 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_ZweihandBuch) >= 1) && (BookTalBonus_04 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_ZweihandBuch,1);
		CreateInvItems(self,ItWr_ZweihandBuch,1);
		BookTalBonus_04 = TRUE;
	};
	if((Npc_HasItems(hero,ASTRONOMIE) >= 1) && (BookTalBonus_05 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ASTRONOMIE,1);
		CreateInvItems(self,ASTRONOMIE,1);
		BookTalBonus_05 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEMONLANG) >= 1) && (BookTalBonus_06 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_DEMONLANG,1);
		CreateInvItems(self,ITWR_DEMONLANG,1);
		BookTalBonus_06 = TRUE;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER1) >= 1) && (BookTalBonus_07 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,LEHREN_DER_GOETTER1,1);
		CreateInvItems(self,LEHREN_DER_GOETTER1,1);
		BookTalBonus_07 = TRUE;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER2) >= 1) && (BookTalBonus_08 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,LEHREN_DER_GOETTER2,1);
		CreateInvItems(self,LEHREN_DER_GOETTER2,1);
		BookTalBonus_08 = TRUE;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER3) >= 1) && (BookTalBonus_09 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,LEHREN_DER_GOETTER3,1);
		CreateInvItems(self,LEHREN_DER_GOETTER3,1);
		BookTalBonus_09 = TRUE;
	};
	if((Npc_HasItems(hero,DAS_MAGISCHE_ERZ) >= 1) && (BookTalBonus_10 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,DAS_MAGISCHE_ERZ,1);
		CreateInvItems(self,DAS_MAGISCHE_ERZ,1);
		BookTalBonus_10 = TRUE;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT1) >= 1) && (BookTalBonus_11 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,SCHLACHT_UM_VARANT1,1);
		CreateInvItems(self,SCHLACHT_UM_VARANT1,1);
		BookTalBonus_11 = TRUE;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT2) >= 1) && (BookTalBonus_12 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,SCHLACHT_UM_VARANT2,1);
		CreateInvItems(self,SCHLACHT_UM_VARANT2,1);
		BookTalBonus_12 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_SOULRIVER) >= 1) && (BookTalBonus_13 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_SOULRIVER,1);
		CreateInvItems(self,ITWR_SOULRIVER,1);
		BookTalBonus_13 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_AZGOLOR) >= 1) && (BookTalBonus_14 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_AZGOLOR,1);
		CreateInvItems(self,ITWR_AZGOLOR,1);
		BookTalBonus_14 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_INNOSPRAY) >= 1) && (BookTalBonus_15 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_INNOSPRAY,1);
		CreateInvItems(self,ITWR_INNOSPRAY,1);
		BookTalBonus_15 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_MANIAC) >= 1) && (BookTalBonus_16 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_MANIAC,1);
		CreateInvItems(self,ITWR_MANIAC,1);
		BookTalBonus_16 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_KAMPFKUNST) >= 1) && (BookTalBonus_17 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_KAMPFKUNST,1);
		CreateInvItems(self,ITWR_KAMPFKUNST,1);
		BookTalBonus_17 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_ELEMENTAREARCANEI) >= 1) && (BookTalBonus_18 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_ELEMENTAREARCANEI,1);
		CreateInvItems(self,ITWR_ELEMENTAREARCANEI,1);
		BookTalBonus_18 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_JAGD_UND_BEUTE) >= 1) && (BookTalBonus_19 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_JAGD_UND_BEUTE,1);
		CreateInvItems(self,ITWR_JAGD_UND_BEUTE,1);
		BookTalBonus_19 = TRUE;
	};
	if((Npc_HasItems(hero,MYRTANAS_LYRIK) >= 1) && (BookTalBonus_20 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,MYRTANAS_LYRIK,1);
		CreateInvItems(self,MYRTANAS_LYRIK,1);
		BookTalBonus_20 = TRUE;
	};
	if((Npc_HasItems(hero,WAHRE_MACHT) >= 1) && (BookTalBonus_21 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,WAHRE_MACHT,1);
		CreateInvItems(self,WAHRE_MACHT,1);
		BookTalBonus_21 = TRUE;
	};
	if((Npc_HasItems(hero,MACHTVOLLE_KUNST) >= 1) && (BookTalBonus_22 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,MACHTVOLLE_KUNST,1);
		CreateInvItems(self,MACHTVOLLE_KUNST,1);
		BookTalBonus_22 = TRUE;
	};
	if((Npc_HasItems(hero,GOETTERGABE) >= 1) && (BookTalBonus_23 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,GOETTERGABE,1);
		CreateInvItems(self,GOETTERGABE,1);
		BookTalBonus_23 = TRUE;
	};
	if((Npc_HasItems(hero,GEHEIMNISSE_DER_ZAUBEREI) >= 1) && (BookTalBonus_24 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,GEHEIMNISSE_DER_ZAUBEREI,1);
		CreateInvItems(self,GEHEIMNISSE_DER_ZAUBEREI,1);
		BookTalBonus_24 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_UMSONST_01) >= 1) && (BookTalBonus_25 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_UMSONST_01,1);
		CreateInvItems(self,ITWR_UMSONST_01,1);
		BookTalBonus_25 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_ANCIENT) >= 1) && (BookTalBonus_26 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_ANCIENT,1);
		CreateInvItems(self,ITWR_ANCIENT,1);
		BookTalBonus_26 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE) >= 1) && (BookTalBonus_27 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DRAGONTALE,1);
		CreateInvItems(self,ITWR_DRAGONTALE,1);
		BookTalBonus_27 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE_2) >= 1) && (BookTalBonus_28 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DRAGONTALE_2,1);
		CreateInvItems(self,ITWR_DRAGONTALE_2,1);
		BookTalBonus_28 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEMONTALE) >= 1) && (BookTalBonus_29 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEMONTALE,1);
		CreateInvItems(self,ITWR_DEMONTALE,1);
		BookTalBonus_29 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_SKELETONTALE) >= 1) && (BookTalBonus_30 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_SKELETONTALE,1);
		CreateInvItems(self,ITWR_SKELETONTALE,1);
		BookTalBonus_30 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK1) >= 1) && (BookTalBonus_31 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_GOLEMBOOK1,1);
		CreateInvItems(self,ITWR_GOLEMBOOK1,1);
		BookTalBonus_31 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK2) >= 1) && (BookTalBonus_32 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_GOLEMBOOK2,1);
		CreateInvItems(self,ITWR_GOLEMBOOK2,1);
		BookTalBonus_32 = TRUE;
	};
	if((Npc_HasItems(hero,ELEMENTARE_ARCANEI) >= 1) && (BookTalBonus_33 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ELEMENTARE_ARCANEI,1);
		CreateInvItems(self,ELEMENTARE_ARCANEI,1);
		BookTalBonus_33 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_MonasterySecret) >= 1) && (BookTalBonus_34 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ItWr_MonasterySecret,1);
		CreateInvItems(self,ItWr_MonasterySecret,1);
		BookTalBonus_34 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK1) >= 1) && (BookTalBonus_35 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK1,1);
		CreateInvItems(self,ITWR_OLDBOOK1,1);
		BookTalBonus_35 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK2) >= 1) && (BookTalBonus_36 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK2,1);
		CreateInvItems(self,ITWR_OLDBOOK2,1);
		BookTalBonus_36 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK3) >= 1) && (BookTalBonus_37 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK3,1);
		CreateInvItems(self,ITWR_OLDBOOK3,1);
		BookTalBonus_37 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK4) >= 1) && (BookTalBonus_38 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK4,1);
		CreateInvItems(self,ITWR_OLDBOOK4,1);
		BookTalBonus_38 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK5) >= 1) && (BookTalBonus_39 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK5,1);
		CreateInvItems(self,ITWR_OLDBOOK5,1);
		BookTalBonus_39 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Astronomy_Mis) >= 1) && (BookTalBonus_40 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Astronomy_Mis,1);
		CreateInvItems(self,ItWr_Astronomy_Mis,1);
		BookTalBonus_40 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_VinosKellergeister_Mis) >= 1) && (BookTalBonus_41 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_VinosKellergeister_Mis,1);
		CreateInvItems(self,ItWr_VinosKellergeister_Mis,1);
		BookTalBonus_41 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEATH1) >= 1) && (BookTalBonus_42 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEATH1,1);
		CreateInvItems(self,ITWR_DEATH1,1);
		BookTalBonus_42 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEATH2) >= 1) && (BookTalBonus_43 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEATH2,1);
		CreateInvItems(self,ITWR_DEATH2,1);
		BookTalBonus_43 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_HallsofIrdorath_Open_Mis) >= 1) && (BookTalBonus_44 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(self,ItWr_HallsofIrdorath_Open_Mis,1);
		BookTalBonus_44 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_XardasSeamapBook_Mis) >= 1) && (BookTalBonus_45 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_XardasSeamapBook_Mis,1);
		CreateInvItems(self,ItWr_XardasSeamapBook_Mis,1);
		BookTalBonus_45 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Alchemy_01) >= 1) && (BookTalBonus_46 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Alchemy_01,1);
		CreateInvItems(self,ItWr_Alchemy_01,1);
		BookTalBonus_46 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Druid_01) >= 1) && (BookTalBonus_47 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Druid_01,1);
		CreateInvItems(self,ItWr_Druid_01,1);
		BookTalBonus_47 = TRUE;
	};

	tempxpbook= BookTalCount * 150;

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
	{
		B_GivePlayerXP(tempxpbook);
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,BookTalCount);
		Npc_ChangeAttribute(hero,ATR_MANA,BookTalCount);
		B_GiveInvItemsManyThings(other,self);
		AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_Yes_01_01");	//Да, забирай их.
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_Yes_01_02");	//Хорошо. А я в свою очередь, как и обещал, повышу твои магические способности.
	}
	else
	{
		B_GivePlayerXP(tempxpbook);
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,BookTalCount);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,BookTalCount);
		B_GiveInvItemsManyThings(other,self);
		AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_Yes_01_05");	//Да, забирай их.
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_Yes_01_06");	//Хорошо. А я в свою очередь, как и обещал, повышу твою жизненную энергию.
	};

	Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
};

func void DIA_Taliasan_BuyBooks_Done_No()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_No_01_01");	//Мне надо подумать.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_No_01_02");	//(ехидно) Само собой. А то мало ли, вдруг они тебе еще понадобятся.
	Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
};

instance DIA_Taliasan_TestCanone(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_TestCanone_condition;
	information = DIA_Taliasan_TestCanone_info;
	permanent = FALSE;
	description = "Есть для меня еще какая-нибудь работенка?";
};

func int DIA_Taliasan_TestCanone_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_TALIASANHELP == LOG_SUCCESS) && (TaliasanNextQuest < daynow))
	{
		return TRUE;
	};
};

func void DIA_Taliasan_TestCanone_info()
{
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_00");	//Есть для меня еще какая-нибудь работенка?
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_01");	//Да. Хорошо, что спросил.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_02");	//У меня как раз появилось одно очень важное дельце, в котором не помешала бы твоя помощь.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_04");	//Пару дней назад лорд Хаген сделал заказ местным алхимикам на изготовление магического порошка для стрельбы из пушек.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_05");	//Запасы паладинов уже подошли к концу, а ситуация с орками становится все более напряженной.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_06");	//Однако проблема в том, что никто из здешних мастеров никогда не занимался ничем подобным.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_07");	//Проще говоря, никто из них не знает, как его делать.
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_08");	//И что же ты предлагаешь?
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_09");	//(раздраженно) Ты еще не дослушал до конца, а уже задаешь вопросы! Мне-то как раз известен рецепт этого порошка!
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_10");	//Почему же ты не расскажешь об этом самому лорду Хагену?
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_11");	//Потому что я не уверен, сработает он или нет.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_12");	//И мне совсем не хочется, в случае неудачи, выглядеть в глазах главы паладинов конченным болваном.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_13");	//Поэтому я сделал небольшой пробник, и мне нужен человек, который бы проверил его действие.
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_14");	//И ты полагаешь, что этим человеком могу быть я.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_15");	//Именно так! В конце концов, в деле с рекомендациями ты показал себя с лучшей стороны.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_16");	//А значит, это дельце не должно составить для тебя особого труда.
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_17");	//Ладно! Говори, что надо делать.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_18");	//Вот, возьми эту колбу с магическим порошком и попробуй выстрелить с помощью него из какой-нибудь пушки.
	B_GiveInvItems(self,other,ItMi_MagicPowder,1);
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_19");	//Только не вздумай это делать в городе! Лишняя шумиха нам ни к чему.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_20");	//Найди местечко потише и там уже шарахай, сколько твоей душе угодно. Все ясно?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_21");	//Вполне.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_22");	//Хорошо, тогда жду от тебя доклада.
	MIS_MagicPowder = LOG_Running;
	Log_CreateTopic(TOPIC_MagicPowder,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MagicPowder,LOG_Running);
	B_LogEntry(TOPIC_MagicPowder,"Галлахад хочет, чтобы я испробовал действие его магического порошка для пушечной стрельбы, прежде чем предложить его лорду Хагену. Мне надо найти какое-нибудь укромное местечко и опробовать его на пушке.");
	AI_StopProcessInfos(self);
};

instance DIA_Taliasan_TestCanone_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_TestCanone_Done_condition;
	information = DIA_Taliasan_TestCanone_Done_info;
	permanent = FALSE;
	description = "По поводу твоего порошка...";
};

func int DIA_Taliasan_TestCanone_Done_condition()
{
	if((MIS_MagicPowder == LOG_Running) && (CanonIsFire == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Taliasan_TestCanone_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Taliasan_TestCanone_Done_01_00");	//По поводу твоего порошка...
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_01");	//(с интересом) Да?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_Done_01_02");	//Судя по всему, он работает.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_03");	//Ты смог с его помощью выстрелить из пушки?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_Done_01_04");	//Конечно. Бабахнул так, что уши заложило.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_05");	//Ну что ж, отличная новость! Теперь этот порошок можно предложить и самому лорду Хагену.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_06");	//Вот, держи свою награду.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_MagicPowder = LOG_Success;
	Log_SetTopicStatus(TOPIC_MagicPowder,LOG_Success);
	B_LogEntry(TOPIC_MagicPowder,"Галлахад был рад услышать об успешном испытании порошка.");
};