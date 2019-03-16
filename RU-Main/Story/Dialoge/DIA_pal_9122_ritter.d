
instance DIA_PAL_9122_RITTER_EXIT(C_Info)
{
	npc = pal_9122_ritter;
	nr = 999;
	condition = dia_pal_9122_ritter_exit_condition;
	information = dia_pal_9122_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9122_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_9122_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9122_RITTER_WHO(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_who_condition;
	information = dia_pal_9122_ritter_who_info;
	permanent = FALSE;
	description = "Привет, ты кто?";
};


func int dia_pal_9122_ritter_who_condition()
{
	return TRUE;
};

func void dia_pal_9122_ritter_who_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_Who_01_00");	//Привет, ты кто?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_Who_01_01");	//Мое имя Фердинанд, незнакомец...(грустно вздыхает)
};


instance DIA_PAL_9122_RITTER_SILVERCUP(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_silvercup_condition;
	information = dia_pal_9122_ritter_silvercup_info;
	permanent = FALSE;
	description = "Какие-то проблемы?";
};


func int dia_pal_9122_ritter_silvercup_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_who))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_silvercup_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_01_00");	//Что с тобой? Я впервые вижу паладина, страдающего хандрой.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_01");	//Увы, но у меня есть на то причины.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_02");	//Видишь ли, я уже долгое время не могу пить свое любимое вино.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_01_03");	//Что, проиграл все деньги в кости, и теперь нечем заплатить в кабаке за выпивку? (посмеивается)
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_04");	//К несчастью, моя проблема более фатальна!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_05");	//Видишь ли, в моей семье так принято, что мужчина может пить вино только из серебряной посуды.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_06");	//Свой кубок я забыл на корабле. На складе есть несколько, но его смотритель Рейн не соглашается ни одного продать мне.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_07");	//Лорд Варус не отпускает нас из форта, так что я не могу купить кубок где-нибудь еще.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Может, я смогу тебе чем-то помочь?",dia_pal_9122_ritter_silvercup_help);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Думаю, ты беспокоишься по пустякам!",dia_pal_9122_ritter_silvercup_crazy);
	if(Npc_HasItems(other,ItMi_SilverCup) >= 1)
	{
		Info_AddChoice(dia_pal_9122_ritter_silvercup,"У меня есть при себе один серебряный кубок.",dia_pal_9122_ritter_silvercup_have);
	};
};

func void dia_pal_9122_ritter_silvercup_help()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Help_01_00");	//Хочешь, я помогу тебе? Я найду такой кубок!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Help_01_01");	//Ты правда сделаешь это? Я буду бесконечно благодарен тебе.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	MIS_FERDSILVERCUP = LOG_Running;
	Log_CreateTopic(TOPIC_FERDSILVERCUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_Running);
	B_LogEntry(TOPIC_FERDSILVERCUP,"Я обещал достать для паладина Фердинанда серебряный кубок, чтобы он смог пить свое вино.");
};

func void dia_pal_9122_ritter_silvercup_crazy()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_00");	//Ты что, смеешься? Не время думать о таких пустяках! Плюнь ты на свой обычай.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_01");	//Что? Тебе, видно, не знакомы такие вещи, как честь и верность. Оставь меня в покое, незнакомец.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_02");	//И как ты вообще добился такого положения в обществе?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_03");	//(с презрением) И кто только пускает таких сюда?
	};
	FERDINPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercup_have()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Have_01_00");	//У меня есть при себе серебряный кубок.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Have_01_01");	//Правда? Ты не шутишь?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Have_01_02");	//Ты можешь просить у меня всего чего пожелаешь.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Думаю, тысячи золотых вполне хватит.",dia_pal_9122_ritter_silvercup_gold);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Ничего! Я тебе его дарю.",dia_pal_9122_ritter_silvercup_give);
};

func void dia_pal_9122_ritter_silvercup_gold()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_00");	//Думаю, тысячи золотых будет вполне достаточно.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_01");	//Ты, верно, смеешься надо мной? Да будь он из цельного золота, он стоил бы меньше.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_02");	//Ну, если он тебе не нужен, тогда я...
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_03");	//(перебивая) Подожди - держи свои деньги, гадкий спекулянт.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_04");	//Отлично, держи кубок.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_05");	//С тобой приятно иметь дело. Если что - обращайся! (с издевкой)
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_06");	//Убирайся с глаз моих, мерзавец!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_07");	//Я больше не хочу иметь с тобой никаких дел.

	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_08");	//И как ты вообще добился такого положения в обществе?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_09");	//(с презрением) И кто только пускает таких сюда?
	};
	FERDINPISSOFF = TRUE;

	if(MIS_FERDSPECWINE == LOG_Running)
	{
		MIS_FERDSPECWINE = LOG_Failed;
		B_LogEntry_Failed(TOPIC_FERDSPECWINE);
	};

	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercup_give()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Give_01_00");	//Забирай так, а то я вижу, ты сейчас совсем с ума сойдешь!
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Give_01_01");	//Твоя щедрость не знает границ, мой друг, но я не могу просто так принять его.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Give_01_02");	//Возьми кусок черной руды, это очень редкая штука.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
};


instance DIA_PAL_9122_RITTER_SILVERCUPDONE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_silvercupdone_condition;
	information = dia_pal_9122_ritter_silvercupdone_info;
	permanent = FALSE;
	description = "Я достал для тебя кубок.";
};

func int dia_pal_9122_ritter_silvercupdone_condition()
{
	if((MIS_FERDSILVERCUP == LOG_Running) && (Npc_HasItems(hero,ItMi_SilverCup) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_silvercupdone_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_01_00");	//Я достал для тебя кубок.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_01_01");	//Правда? Ты не шутишь?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_01_02");	//Ты можешь просить у меня всего, чего пожелаешь.
	Info_ClearChoices(dia_pal_9122_ritter_silvercupdone);
	Info_AddChoice(dia_pal_9122_ritter_silvercupdone,"Думаю, тысячи золотых вполне хватит.",dia_pal_9122_ritter_silvercupdone_gold);
	Info_AddChoice(dia_pal_9122_ritter_silvercupdone,"Я тебе его дарю.",dia_pal_9122_ritter_silvercupdone_give);
};

func void dia_pal_9122_ritter_silvercupdone_gold()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_00");	//Думаю, тысячи золотых будет вполне достаточно.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_01");	//Ты, верно, смеешься надо мной? Да будь он из цельного золота, он стоил бы меньше.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_02");	//Ну, если он тебе не нужен, тогда я...
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_03");	//(перебивая) Подожди - держи свои деньги, гадкий спекулянт.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_04");	//Отлично, держи кубок.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_05");	//С тобой приятно иметь дело. Если что - обращайся! (с издевкой)
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_06");	//Убирайся с глаз моих, мерзавец!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_07");	//Я больше не хочу иметь с тобой никаких дел.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_08");	//И как ты вообще добился такого положения в обществе?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_09");	//(с презрением) И кто только пускает таких сюда?
	};
	MIS_FERDSILVERCUP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERDSILVERCUP,"Я продал Фердинанду серебряный кубок за тысячу золотых монет. Думаю, в дальнейшем это плохо скажется на наших с ним отношениях.");
	FERDINPISSOFF = TRUE;

	if(MIS_FERDSPECWINE == LOG_Running)
	{
		MIS_FERDSPECWINE = LOG_Failed;
		Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_OBSOLETE);
	};

	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercupdone_give()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Give_01_00");	//Забирай так, я тебе его дарю.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Give_01_01");	//Твоя щедрость не знает границ, мой друг, но я не могу просто так принят его.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Give_01_02");	//Возьми кусок черной руды, это очень редкая штука. Очень редкая вещица!
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	MIS_FERDSILVERCUP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERDSILVERCUP,"Я подарил Фердинанду серебряный кубок.");
	Info_ClearChoices(dia_pal_9122_ritter_silvercupdone);
};

instance DIA_PAL_9122_RITTER_FUCKOFF(C_Info)
{
	npc = pal_9122_ritter;
	nr = 10;
	condition = dia_pal_9122_ritter_fuckoff_condition;
	information = dia_pal_9122_ritter_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_9122_ritter_fuckoff_condition()
{
	if((FERDINPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_PAL_9122_RITTER_THINGS(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_things_condition;
	information = dia_pal_9122_ritter_things_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_pal_9122_ritter_things_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_who))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_things_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_Things_01_00");	//Как жизнь?
	if(MIS_FERDSILVERCUP == LOG_Running)
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_01");	//По прежнему, а у тебя есть новости по поискам?
		AI_Output(other,self,"DIA_Pal_9122_Ritter_Things_01_02");	//Как раз этим сейчас и занимаюсь.
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_03");	//Жаль, очень жаль...(печально)
		AI_StopProcessInfos(self);
	}
	else if(MIS_FERDSILVERCUP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_04");	//Рад тебя видеть, мой друг!
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_05");	//Дела просто великолепно!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_06");	//Оставь меня в покое!
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9122_RITTER_SPECWINE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_specwine_condition;
	information = dia_pal_9122_ritter_specwine_info;
	permanent = FALSE;
	description = "А что за вино ты пьешь?";
};


func int dia_pal_9122_ritter_specwine_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_silvercup) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_specwine_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_00");	//А что за вино ты пьешь?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_01");	//(смеется) заинтересовался?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_02");	//Это вино называется 'Слезы счастья'.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_03");	//Его делают из лучших сортов винограда, поэтому оно очень редкое и дорогое.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_04");	//На острове его не найти.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_05");	//А ты тогда где его взял?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_06");	//Ну, во-первых, мы приплыли с материка, а там то оно как раз и продается.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_07");	//А во-вторых... В общем, я узнал, что у одного из торговцев в городе сохранился небольшой запас этого вина.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_09");	//По-моему, его зовут Маттео. Но он вряд ли тебе поможет.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_10");	//Почему?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_11");	//Я отправил к нему человека, чтоб купить все его вино — там было-то всего несколько бутылок.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_12");	//Ты отправил курьера в город? А какого черта ты не заказал ЕМУ купить свой кубок?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_13");	//Пойми, человек, покупающий вино, не вызывает интереса.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_14");	//А за серебряный кубок любой портовый пьяница перережет ему горло.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_15");	//Хмм... Хотя мой человек, что-то сильно задерживается, не случилось бы чего.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_16");	//Послушай, не мог бы ты проверить, где он сейчас?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_17");	//А я, как он вернется, угощу тебя этим замечательным вином!
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
	Info_AddChoice(dia_pal_9122_ritter_specwine,"У меня нет на это времени.",dia_pal_9122_ritter_specwine_no);
	Info_AddChoice(dia_pal_9122_ritter_specwine,"Я могу сходить в город и узнать все.",dia_pal_9122_ritter_specwine_yes);
};

func void dia_pal_9122_ritter_specwine_no()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_No_01_00");	//Боюсь, у меня тоже нет на это времени.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_No_01_01");	//Я понимаю...(печально) Ты занятой человек.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_No_01_02");	//Не волнуйся, я уверен, что с ним все в порядке, и он скоро вернется.
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
};

func void dia_pal_9122_ritter_specwine_yes()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_Yes_01_00");	//Я могу сходить в город и узнать все.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_Yes_01_01");	//Сколько вина должен доставить тебе курьер?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_Yes_01_02");	//Это было бы просто замечательно! Ровно две бутылки вина.	
	MIS_FERDSPECWINE = LOG_Running;
	Log_CreateTopic(TOPIC_FERDSPECWINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_Running);
	B_LogEntry(TOPIC_FERDSPECWINE,"Фердинанд обеспокоен тем, что курьер, которого он послал к Маттео за вином, куда-то пропал. Я вызвался помочь ему найти его. Думаю, для начала стоит отправиться в город и поговорить с самим Маттео.");
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
};

instance DIA_PAL_9122_RITTER_SPECWINEDONE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_specwinedone_condition;
	information = dia_pal_9122_ritter_specwinedone_info;
	permanent = FALSE;
	description = "Я нашел твоего курьера.";
};

func int dia_pal_9122_ritter_specwinedone_condition()
{
	if((MIS_FERDSPECWINE == LOG_Running) && (Npc_HasItems(hero,itfo_specwine) >= 2))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_specwinedone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWineDone_01_00");	//Я нашел твоего курьера.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_01");	//И где этот олух?
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWineDone_01_02");	//Он мертв - неподалеку от города нарвался на стаю волков.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_03");	//(с сожалением) М-да, участь не из приятных.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_04");	//А что с вином?
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWineDone_01_05");	//Вино у меня - держи. Две бутылки, как ты и говорил.
	B_GiveInvItems(other,self,itfo_specwine,2);
	Npc_RemoveInvItems(self,itfo_specwine,2);
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_06");	//Ну что же, хоть здесь хорошие новости.	
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_07");	//И как я обещал, я угощу тебя этим вином.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_08");	//Держи - одна бутылка твоя. Угощайся на здоровье.
	B_GiveInvItems(self,other,itfo_specwine_hp,1);
	MIS_FERDSPECWINE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERDSPECWINE,"Я принес Фердинанду две бутылки вина 'Слезы счастья'. Одной из них он поделился со мной.");
};

instance DIA_PAL_9122_RITTER_RAYNEHELP(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_raynehelp_condition;
	information = dia_pal_9122_ritter_raynehelp_info;
	permanent = FALSE;
	description = "Ты мог бы помочь Рэйну на складе?";
};


func int dia_pal_9122_ritter_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_raynehelp_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_RayneHelp_01_00");	//Ты мог бы помочь Рэйну на складе?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_RayneHelp_01_01");	//Вот еще чего - даже и не подумаю этого делать!
	AI_Output(other,self,"DIA_Pal_9122_Ritter_RayneHelp_01_02");	//Ладно, забудь.
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Кажется, что я попусту трачу время - никто из паладинов не хочет помогать Рэйну. Может, мне стоит предпринять более кардинальные действия?");
	};
};


instance DIA_PAL_9122_RITTER_PICKPOCKET(C_Info)
{
	npc = pal_9122_ritter;
	nr = 900;
	condition = dia_pal_9122_ritter_pickpocket_condition;
	information = dia_pal_9122_ritter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9122_ritter_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9122_ritter_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
	Info_AddChoice(dia_pal_9122_ritter_pickpocket,Dialog_Back,dia_pal_9122_ritter_pickpocket_back);
	Info_AddChoice(dia_pal_9122_ritter_pickpocket,DIALOG_PICKPOCKET,dia_pal_9122_ritter_pickpocket_doit);
};

func void dia_pal_9122_ritter_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
};

func void dia_pal_9122_ritter_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
};

