	
instance DIA_ADDON_INEXTREMO_ANNOUNCER_EXIT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 999;
	condition = dia_addon_inextremo_announcer_exit_condition;
	information = dia_addon_inextremo_announcer_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_announcer_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_announcer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_PICKPOCKET(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 900;
	condition = dia_addon_inextremo_announcer_pickpocket_condition;
	information = dia_addon_inextremo_announcer_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_announcer_pickpocket_condition()
{
	return C_Beklauen(118,300);
};

func void dia_addon_inextremo_announcer_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
	Info_AddChoice(dia_addon_inextremo_announcer_pickpocket,Dialog_Back,dia_addon_inextremo_announcer_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_announcer_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_announcer_pickpocket_doit);
};

func void dia_addon_inextremo_announcer_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
};

func void dia_addon_inextremo_announcer_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HI(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hi_condition;
	information = dia_addon_inextremo_announcer_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hi_info()
{
	AI_Output(self,other,"DIA_pir_1398_Hi_01_00");	//Чего тебе надо?! Не видишь, мы работаем.
	AI_Output(self,other,"DIA_pir_1398_Hi_01_01");	//Поговорим позже!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HALLO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hallo_condition;
	information = dia_addon_inextremo_announcer_hallo_info;
	permanent = FALSE;
	description = "Кто вы?";
};


func int dia_addon_inextremo_announcer_hallo_condition()
{
	if((JOINKILLERS == FALSE) && (Npc_GetDistToWP(self,"OCR_ANNOUNCER") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hallo_info()
{
	AI_Output(other,self,"DIA_pir_1398_Hallo_01_00");	//Кто вы?
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_03");	//А что, разве не видно? (смеется) Мы - труппа бродячих музыкантов, веселим и развлекаем здешнюю публику.
	AI_Output(other,self,"DIA_pir_1398_Hallo_01_04");	//А как давно вы в городе?
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_05");	//Уже несколько месяцев. Обычно мы стараемся долго не задерживаться на одном месте, но...
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_06");	//...в местный порт пока что до последнего времени не зашел ни один корабль. Если, конечно, не считать галеры паладинов, прибывшей пару недель назад.
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_09");	//Хотя нам по большому счету все равно, где выступать.
	MEETSTID = TRUE;
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HALLOTWO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hallotwo_condition;
	information = dia_addon_inextremo_announcer_hallotwo_info;
	permanent = FALSE;
	description = "И как тебе такая жизнь?";
};


func int dia_addon_inextremo_announcer_hallotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallo) && (CHECKFLAGKILLSMEET == FALSE) && (JOINKILLERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hallotwo_info()
{
	AI_Output(other,self,"DIA_pir_1398_HalloTwo_01_00");	//И как тебе такая жизнь?
	AI_Output(self,other,"DIA_pir_1398_HalloTwo_01_01");	//Да вроде жаловаться не приходится. Пока что.
	AI_Output(self,other,"DIA_pir_1398_HalloTwo_01_02");	//Нам много не надо - пара золотых монет, чтобы прокормить себя, да иногда поставить ребятам выпивку.
	AI_Output(self,other,"DIA_pir_1398_HalloTwo_01_03");	//Большинству жителей этого города, похоже, нравятся наши выступления.
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MENTION(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_mention_condition;
	information = dia_addon_inextremo_announcer_mention_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_mention_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallotwo) && (CHECKFLAGKILLSMEET == FALSE) && (Npc_GetDistToWP(self,"OCR_ANNOUNCER") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_mention_info()
{
	AI_Output(self,other,"DIA_pir_1398_Mention_01_00");	//Да... и еще кое-что.
	AI_Output(self,other,"DIA_pir_1398_Mention_01_02");	//Хочу попросить тебя - не приставай к остальным парням.
	AI_Output(self,other,"DIA_pir_1398_Mention_01_03");	//Мы выступаем почти целый день. И, естественно, после тяжелого дня им хочется немного отдохнуть.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_TELLABOUTKILLERS(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_tellaboutkillers_condition;
	information = dia_addon_inextremo_announcer_tellaboutkillers_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь про гильдию убийц?";
};


func int dia_addon_inextremo_announcer_tellaboutkillers_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallo) && (CANCOMPLETEGUILDKILL == FALSE) && Npc_KnowsInfo(hero,dia_ramirez_guildkill) && (KILLCANJOIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_tellaboutkillers_info()
{
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_01_00");	//Ты что-нибудь знаешь про гильдию убийц?
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_01_01");	//ЧТО?!
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_01_04");	//Кто тебе сказал, что я что-нибудь знаю про это?
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutkillers,"Рамирез сказал мне об этом.",dia_addon_inextremo_announcer_tellaboutkillers_ramirez);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutkillers,"Это не имеет значения.",dia_addon_inextremo_announcer_tellaboutkillers_nomatter);
};

func void dia_addon_inextremo_announcer_tellaboutkillers_ramirez()
{
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_Ramirez_01_00");	//Рамирез сказал мне об этом.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_01");	//(задумчиво) Рамирез, говоришь?
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_02");	//Хммм... мне кажется, у кого-то слишком длинный язык.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_05");	//Так ты интересуешься гильдией убийц, как я понял. И зачем же они тебе понадобились?
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_Ramirez_01_06");	//У меня к ним есть одно небольшое дельце.
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_Ramirez_01_10");	//Просто расскажи мне, что ты про них знаешь и где я смогу их найти.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_13");	//Хммм...(внимательно вглядываясь)
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_14");	//Ну хорошо. Если тебе так приспичило поиграть со смертью, то я могу тебе устроить эту встречу.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_15");	//Завтра около часа полуночи приходи в заброшенный дом на пристани. Там ты найдешь того, кого искал.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_16");	//(улыбается) И смотри не опаздывай. Другого шанса у тебя не будет.
	B_LogEntry(TOPIC_GUILDKILL,"Гиллиан готов устроить мне встречу с гильдией убийц. Для этого мне необходимо около часа после полуночи прийти в дом на берегу моря недалеко от пристани.");
	KILLSMEET = TRUE;
	THIEFKILLS = TRUE;
	MIS_KILLSMEET_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_announcer_tellaboutkillers_nomatter()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_NoMatter_01_00");	//Это не имеет значения. Знаешь ли, ходят слухи...
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_01");	//Хммм...(внимательно вглядывается) Слухи говоришь? Ну ладно.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_03");	//Итак, ты интересуешься гильдией убийц, как я понял. И зачем же они тебе понадобились?
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_NoMatter_01_04");	//У меня к ним есть одно небольшое дельце.
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_NoMatter_01_08");	//Расскажи мне, что ты про них знаешь и где я смогу их найти.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_11");	//Хммм...(внимательно вглядываясь)
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_12");	//Ну, хорошо! Если тебе так приспичило поиграть со смертью, то я могу тебе устроить эту встречу.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_13");	//Завтра около часа после полуночи приходи в заброшенный дом на пристани. Там ты найдешь того, кого искал.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_14");	//(улыбается) И смотри не опаздывай. Другого шанса у тебя не будет.
	B_LogEntry(TOPIC_GUILDKILL,"Гиллиан готов устроить мне встречу с гильдией убийц. Для этого мне необходимо завтра около часа после полуночи прийти в дом на берегу моря недалеко от пристани.");
	KILLSMEET = TRUE;
	MIS_KILLSMEET_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MEETINHOUSE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_meetinhouse_condition;
	information = dia_addon_inextremo_announcer_meetinhouse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_meetinhouse_condition()
{
	if((KILLSMEET == TRUE) && (CHECKFLAGKILLSMEET == TRUE) && (JOINKILLERS == FALSE) && Npc_IsInState(self,ZS_Talk) && (MIS_GUILDKILL == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_meetinhouse_info()
{
	B_GivePlayerXP(250);
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_00");	//Итак, ты все-таки пришел...(смеется) Не ожидал, что у тебе хватит духу на это!
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_01_01");	//Гиллиан?!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_02");	//Что, удивлен? Не стоит так удивляться. В конце концов, ты сам искал этой встречи.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_01_03");	//Значит, ты один из тех парней, что состоят в гильдии убийц?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_04");	//Как и все, кого ты тут видишь вокруг.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_01_05");	//Хммм... так вот чем занимаются обыкновенные бродячие музыканты в свободное время. Кто бы мог подумать...
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_06");	//Каждый зарабатывает на хлеб так, как умеет...(смеется)
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_07");	//Но хватит пустой болтовни - у нас сейчас не так много времени на это.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_08");	//Так что говори, что тебе нужно от нас?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_09");	//И я очень надеюсь, что та причина, которая привела тебя сюда, достойна того, чтобы мы тебя выслушали.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_10");	//Иначе этот разговор закончится довольно быстро. Так же, как и твоя жизнь! (смеется)
	GUILDKILLKNOWNLOC = TRUE;
	B_LogEntry(TOPIC_GUILDKILL,"Я пришел на встречу в назначенное время. Гиллиан тоже был там... Труппа бродячих музыкантов, прибывших пару недель назад в город, и оказалось той самой гильдией убийц, что наводила ужас на жителей Хориниса. Теперь все зависит от моих дальнейших действий - мне надо как-то выкрутиться из этой ситуации.");
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Я пришел сюда, чтобы убить вас.",dia_addon_inextremo_announcer_meetinhouse_kill);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Я хочу присоединиться к вам.",dia_addon_inextremo_announcer_meetinhouse_join);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Я ищу человека по имени Асмал.",dia_addon_inextremo_announcer_meetinhouse_asmal);
};

func void dia_addon_inextremo_announcer_meetinhouse_asmal()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Asmal_01_00");	//Я ищу человека по имени Асмал.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Asmal_01_01");	//Асмал? Тебе нужен Асмал? (смеется)
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Asmal_01_02");	//Ну, тогда можешь считать, что ты его уже нашел. Асмал - это я!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Asmal_01_03");	//Что-нибудь еще?
	B_LogEntry(TOPIC_GUILDKILL,"Гиллиан и оказался тем самым Асмалом! Немного непредусмотрительно с его стороны, но кто знает - может, это последняя вещь, которую я смогу выяснить в этом деле.");
	self.name[0] = "Асмал";
	KNOWSASMAL = TRUE;
};

func void dia_addon_inextremo_announcer_meetinhouse_kill()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_00");	//Я пришел сюда, чтобы убить вас.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_01");	//ЧТО?! (смеется) Ты действительно решил, что ты такой крутой парень и тебе это под силу?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_02");	//(смеется) Ну ты и глупец!
	B_LogEntry(TOPIC_GUILDKILL,"Я раскрыл свои карты, сказав Асмалу, что пришел убить их. Он рассмеялся, услыхав мое смелое заявление. Вот хватит ли мне сил справиться со всей его бандой?");
	if((THIEFKILLS == TRUE) && !(Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez)))
	{
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_05");	//Ха! Ты закончишь так же, как твои дружки из гильдии воров, у которых слишком длинные языки.
		AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_06");	//ЧТО?
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_07");	//Ты думал, я позволю таким типам, как этот Рамирез, болтать о том, о чем лучше всегда помалкивать?
		B_LogEntry(TOPIC_GUILDKILL,"Асмал также сказал мне, что расправился с гильдией воров. И, кажется, именно я стал виной их гибели, проговорившись Асмалу про Рамиреза. Как неосмотрительно с моей стороны.");
		B_KillNpc(VLK_447_Cassia);
		B_KillNpc(VLK_446_Jesper);
		B_KillNpc(VLK_445_Ramirez);
		B_KillNpc(VLK_494_Attila);
	};
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_08");	//Так что лучше прибереги свой пыл для чего-нибудь другого, молокосос, и приготовься умереть!
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_10");	//Тогда не будем терять времени.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_11");	//Ну ладно, как скажешь!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_join()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_01");	//(озадаченно) Что? Хммм... да, парень, - наглости тебе не занимать!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_02");	//Прийти сюда, чтобы предложить нам такое! (смеется) Эй парни, вы слышали это?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_04");	//Ну, говори. С чего это ты вдруг решил, что нам нужны твои услуги?
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_05");	//Я состою на службе у лорда Андрэ в его городской страже и...
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_08");	//...подумал, что вам мог бы пригодиться человек, который имеет связи в этих кругах.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_09");	//Это решило бы многие ваши проблемы с ополчением!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_10");	//Хммм... верно. Может, такой человек мог бы действительно пригодиться.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_11");	//Но откуда нам знать, что ты не побежишь сразу после этой встречи к тому же лорду Андрэ и не расскажешь про все то, что тут увидел.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_12");	//К тому же я не могу понять, какая тебе выгода от этого?
	B_LogEntry(TOPIC_GUILDKILL,"Я сказал Асмалу, что хочу присоединиться к ним. Он был очень удивлен этим фактом и захотел узнать причину, побудившую меня сделать им такое предложение.");
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Я слышал, что убийцы неплохо зарабатывают на своем деле.",dia_addon_inextremo_announcer_meetinhouse_money);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Это тебя не касается!",dia_addon_inextremo_announcer_meetinhouse_notyours);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"А разве это так важно?",dia_addon_inextremo_announcer_meetinhouse_donttell);
};

func void dia_addon_inextremo_announcer_meetinhouse_money()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_00");	//Я слышал, что убийцы неплохо зарабатывают на своем деле.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_01");	//Золото любишь, да?
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_02");	//А кто же его не любит.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_04");	//Насколько я знаю, лорд Андрэ хорошо заботится о своих людях.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_06");	//А это все мне говорит о том, что ты не очень-то надежный человек!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_07");	//Думаю, ты запросто сдашь нас при одном только виде золота.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_08");	//Извини, но такие люди нам не нужны.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_10");	//Погоди...
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_11");	//Эй, ребята! Давайте проучим этого ублюдка!
	B_LogEntry(TOPIC_GUILDKILL,"Мне не удалось произвести впечатление на Асмала своими доводами. Теперь у меня есть два выхода: убить их всех или попытаться выбраться отсюда живым, чтобы сообщить лорду Андрэ о случившемся.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_notyours()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_NotYours_01_00");	//Это тебя не касается!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_01");	//О, ты глубоко ошибаешься!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_02");	//Думаю, скорее всего, ты и сам не знаешь, зачем тебе это нужно.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_03");	//А это наводит на очень подозрительные мысли.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_04");	//А со всем подозрительным, по моему мнению, лучше всегда кончать сразу.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_NotYours_01_07");	//Погоди...
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_08");	//Эй, ребята! Давайте проучим этого ублюдка!
	B_LogEntry(TOPIC_GUILDKILL,"Мне не удалось произвести впечатление на Асмала своими доводами. Теперь у меня есть два выхода: убить их всех или попытаться выбраться отсюда живым, чтобы сообщить лорду Андрэ о случившемся.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_donttell()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_00");	//А разве это так важно?
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_01");	//Я и так сильно рискую тем, что пришел сюда.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_02");	//Так что можешь не сомневаться, мои причины достаточно весомы.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_04");	//Значит, хочешь стать одним из нас...(внимательно вглядывается)
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_05");	//Ну хорошо. Считай, что ты меня убедил.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_06");	//Значит, теперь я вхожу в гильдию?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_07");	//Да! Теперь ты один из нас.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_08");	//Но запомни: на многое пока что можешь не рассчитывать.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_11");	//Ты еще должен доказать, что способен не только болтать языком, но и делать что-нибудь посерьезнее.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_13");	//Надеюсь, ты понимаешь, о чем я говорю.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_17");	//Я понимаю.
	if(KNOWSASMAL == FALSE)
	{
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_19");	//И еще кое-что...
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_20");	//Гиллиан - это не мое настоящее имя.
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_22");	//Все знают меня как Асмала. Поэтому обращайся ко мне именно так.
		self.name[0] = "Асмал";
		KNOWSASMAL = TRUE;
	};
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	B_LogEntry(TOPIC_GUILDKILL,"Мне удалось произвести впечатление на Асмала. Он согласился принять меня в их гильдию на достаточно жестких условиях, но выбирать не приходится.");
	if(JOINKILLERS == FALSE)
	{
		MIS_KILLWAY = LOG_Running;
		Log_CreateTopic(TOPIC_KILLWAY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KILLWAY,LOG_Running);
		B_LogEntry(TOPIC_KILLWAY,"Асмал принял меня в гильдию убийц. Правда, пока только на словах - до тех пор, пока я не докажу ему, что действительно достоин этого.");
		JOINKILLERS = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MEETKILLERS(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_meetkillers_condition;
	information = dia_addon_inextremo_announcer_meetkillers_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_meetkillers_condition()
{
	if((MIS_GERBRANDTHELP == LOG_Running) && (MEETCHIEFKILLERSLAIT == FALSE) && Npc_IsInState(self,ZS_Talk) && (APEARKILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_meetkillers_info()
{
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);

	if(MEETSTID == TRUE)
	{
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_00");	//Эй, ты! Что тебе здесь нужно?
		AI_Output(other,self,"DIA_pir_1398_MeetKillers_01_01");	//Ээ... я должен тут встретиться с одним человеком.
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_02");	//Да ну? Правда?! Хммм...
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_03");	//Ну, тогда считай, что эта встреча уже произошла...(внимательно вглядывается)
		AI_Output(other,self,"DIA_pir_1398_MeetKillers_01_04");	//А что ты на меня так смотришь?
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_05");	//Хммм... твое лицо мне кажется знакомым. Мы нигде раньше не встречались?
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_08");	//Ладно, сейчас это не важно.
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_10");	//Итак, значит это ты искал меня?
		B_LogEntry(TOPIC_GERBRANDTHELP,"Я встретился с тем человеком, о котором говорил Гербрандт, как и было оговорено - в таверне, ровно в назначенное время. Им оказался один из бродячих музыкантов - Гиллиан. Правда, на этот раз он был уже не таким любезным, как при первой нашей встрече.");
	}
	else
	{
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_11");	//Эй парень, это ты искал со мной встречи?!
		B_LogEntry(TOPIC_GERBRANDTHELP,"Я встретился с тем человеком, о котором говорил Гербрандт, как и было оговорено - в таверне, ровно в назначенное время.");
	};

	MEETCHIEFKILLERS = TRUE;
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Да, это был я.",dia_addon_inextremo_announcer_meetkillers_me);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Ну, не совсем я...",dia_addon_inextremo_announcer_meetkillers_notme);
};

func void dia_addon_inextremo_announcer_meetkillers_notme()
{
	STIDKILLME = TRUE;
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_NotMe_01_00");	//Ну, не совсем я...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_01");	//(удивленно) Что это значит?!
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_NotMe_01_02");	//Один человек послал меня встретиться с тобой.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_03");	//И кто же?
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_NotMe_01_04");	//Я не могу сказать. Он попросил оставить его имя в тайне.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_05");	//Хммм... ну ладно.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_06");	//И что же ему от меня нужно?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
	{
		Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Вот, возьми этот кошелек и письмо.",dia_addon_inextremo_announcer_meetkillers_giveger);
	};
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Понятия не имею.",dia_addon_inextremo_announcer_meetkillers_dontknow);
};

func void dia_addon_inextremo_announcer_meetkillers_me()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Me_01_00");	//Да, это был я.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Me_01_01");	//Хорошо, и что же тебе нужно от меня?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
	{
		Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Вот, возьми этот кошелек и письмо.",dia_addon_inextremo_announcer_meetkillers_giveger);
	};
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Понятия не имею.",dia_addon_inextremo_announcer_meetkillers_dontknow);
};

func void dia_addon_inextremo_announcer_meetkillers_dontknow()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_DontKnow_01_00");	//Понятия не имею.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_01");	//Хммм. А ты шутник, как я погляжу...(смеется)
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_03");	//Позволь мне объяснить тебе пару вещей.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_04");	//Мое время - это мои деньги!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_08");	//Так что теперь ты - мой должник...(смеется)
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_DontKnow_01_09");	//Я тебе ничего не должен!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_11");	//И скажу тебе честно, как на духу, - я не очень-то особо жалую должников, а самое главное - всегда получаю то, что мне причитается.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_12");	//И знаешь, что я решил...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_14");	//...я решил, что взыщу твой должок с тебя прямо сейчас!
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Теперь мне точно не видать рекомендательного письма от Гербрандта, поскольку я завалил все дело. К тому же во время встречи у меня возникли, так сказать, некоторые сложности.");
	MEETCHIEFKILLERSMISSTIME = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetkillers_giveger()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_00");	//Вот, возьми этот кошелек...
	B_GiveInvItems(other,self,itse_gerbrandpocket,1);
	Npc_RemoveInvItems(self,itse_gerbrandpocket,1);
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_01");	//...и еще письмо. Здесь все, что тебе нужно.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_02");	//Хммм... ну, давай посмотрим.
	if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
	{
		B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
		Npc_RemoveInvItems(self,itwr_gerbrandseclet,1);
		B_UseFakeScroll();

		if(STIDKILLME == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_03");	//Хорошо, мне все ясно. Думаю, с этим делом не возникнет много хлопот.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_04");	//Вот и отлично! Думаю, теперь наш разговор можно считать завершенным.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_05");	//Не так быстро, друг мой! (ехидно улыбается) Не так быстро.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_09");	//Мне нужно имя того человека, кто тебя послал ко мне.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_10");	//(повысив голос) Я уже говорил тебе, что это тебя не касается!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_11");	//Не груби! Иначе мне придется научить тебя хорошим манерам.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_12");	//Если ты мне не скажешь его имя, то, боюсь, я не смогу просто так тебя отпустить.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_13");	//Понимаешь, я должен отчетливо представлять себе, с кем я веду дела.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_14");	//В противном случае я очень многим рискую.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_15");	//Поэтому тебе придется назвать мне его имя.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_16");	//В противном же случае...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_18");	//...мне просто придется убить тебя.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_20");	//Эй, постой...
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_22");	//Если я тебе назову имя того человека - что тогда?
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_23");	//Хммм... тогда ты сможешь спокойно убраться отсюда куда тебе вздумается - я тебя не трону.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_24");	//Так что ты выбрал?
			Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
			Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Угрозами ты от меня ничего не добьешься!",dia_addon_inextremo_announcer_meetkillers_donttell);
			Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Хорошо! Я скажу то, что знаю сам.",dia_addon_inextremo_announcer_meetkillers_tell);
		}
		else
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_25");	//Хорошо! Мне все ясно. Думаю, с этим делом не возникнет много хлопот.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_26");	//Можешь быть спокоен - твоя проблема будет решена быстро.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_27");	//Вот и отлично! Думаю, теперь наш разговор можно считать завершенным.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_3A");	//Еще увидимся!
			B_LogEntry(TOPIC_GERBRANDTHELP,"Я выполнил все в точности так, как велел мне Гербрандт. Теперь осталось вернуться к нему и забрать свою награду.");
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,400);
			Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
			Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_23");
		};
	}
	else
	{
		B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
		Npc_RemoveInvItems(self,itwr_gerbrandseclet_open,1);
		B_UseFakeScroll();
		if(STIDKILLME == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_31");	//Хорошо! Мне все ясно. Думаю, с этим делом не возникнет много хлопот.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_32");	//Однако, как я заметил, печать на письме была сломана еще до того, как я взялся его прочитать.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_33");	//Я просто хотел...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_34");	//(перебивая) Я знаю, что ты хотел.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_35");	//Все это мне говорит только об одном - о том, что ты не слишком надежный человек в делах такого рода.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_39");	//Позволь мне объяснить тебе пару вещей.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_40");	//Видишь ли, в нашем деле нет ничего хуже, чем люди, на которых нельзя положиться.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_43");	//Поэтому, боюсь, я не смогу просто так тебя отпустить.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_44");	//То есть?
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_45");	//От таких идиотов вроде тебя нужно избавляться как можно быстрее.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_47");	//Пойми, ничего личного - но ты не оставил мне выбора...
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			B_LogEntry(TOPIC_GERBRANDTHELP,"Я сделал все, о чем просил Гербрандт. Правда, во время встречи возникли, так сказать, некоторые сложности.");
			MEETCHIEFKILLERSNOTOK = TRUE;
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_GuardStopsIntruder,0);
		}
		else
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_48");	//Хорошо! Мне все ясно. Думаю, с этим делом не возникнет много хлопот.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_49");	//Однако, как я заметил, печать на письме была сломана еще до того, как я взялся его прочитать.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_50");	//Значит ли это, что ты решил прочитать еще раз свое же письмо, что выглядит очень странно...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_51");	//...либо его написал другой человек?!
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_52");	//Я...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_53");	//Хммм... ты можешь ничего не объяснять. Мне и так все понятно.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_54");	//Все это мне говорит только об одном - о том, что ты не слишком надежный человек в делах такого рода.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_55");	//Но хуже всего то, что ты соврал мне. Это весьма печальный факт!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_56");	//Думаю, наверняка тебя просто кто-то послал, чтобы передать мне это письмо и кошелек, а ты...(ехидно улыбаясь)
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_59");	//Позволь мне объяснить тебе пару вещей.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_60");	//Видишь ли, в нашем деле нет ничего хуже, чем люди, на которых нельзя положиться.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_63");	//Поэтому, боюсь, я не смогу просто так тебя отпустить.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_64");	//То есть? Как это понимать?!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_65");	//От таких идиотов вроде тебя нужно избавляться как можно быстрее.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_66");	//И чем скорее это сделать, тем будет лучше для всех. И для дела в том числе!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_67");	//Пойми, ничего личного - но ты не оставил мне выбора...
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			B_LogEntry(TOPIC_GERBRANDTHELP,"Я сделал все, о чем просил Гербрандт. Правда, во время встречи возникли, так сказать, некоторые сложности.");
			MEETCHIEFKILLERSNOTOK = TRUE;
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_GuardStopsIntruder,0);
		};
	};
};

func void dia_addon_inextremo_announcer_meetkillers_donttell()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_DontTell_01_00");	//Угрозами ты от меня ничего не добьешься!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontTell_01_01");	//Хммм... значит, ты предпочитаешь умереть. Как глупо с твоей стороны так поступать! (смеется)
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontTell_01_02");	//Или, быть может, ты решил со мной поторговаться?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Глупо или нет - это решит бой!",dia_addon_inextremo_announcer_meetkillers_fight);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Поторговаться? А почему бы и нет.",dia_addon_inextremo_announcer_meetkillers_torg);
};

func void dia_addon_inextremo_announcer_meetkillers_tell()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_00");	//Хорошо! Я скажу то, что знаю сам.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_01");	//Я слушаю...
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_02");	//Его зовут Гербрандт.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_03");	//Где он живет?
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_04");	//В верхнем квартале города, первый дом справа. Больше я ничего не знаю.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_05");	//Ну что же, этого вполне достаточно.
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_06");	//Эй! Ты же обещал!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_07");	//Тебе не следует верить всему тому, что говорят.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_09");	//Но ведь мы договорились!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_10");	//Ха! (смеется) Позволь мне объяснить тебе пару вещей.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_11");	//Видишь ли, в нашем деле нет ничего хуже, чем люди, на которых нельзя положиться.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_13");	//И судя по всему, ты относишься именно к этой категории людей. Так просто сдал мне своего работодателя - о чем же еще говорить?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_14");	//Не факт, что ты не проболтаешься и о нашей встрече. А я так рисковать не могу! Понимаешь?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_15");	//А посему ты не оставил мне выбора...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_16");	//Придется тебе сегодня все-таки умереть.
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Я сделал все, о чем просил Гербрандт. Правда, во время встречи возникли, так сказать, некоторые сложности. К тому же я проболтался о причастности Гербрандта к этому делу. Не думаю, что это ему понравится.");
	MEETCHIEFKILLERSNOTOK = TRUE;
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSTELLSGER = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetkillers_fight()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Fight_01_00");	//Посмотрим! Все решит бой!
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_01");	//Ха! Смелые слова, храбрец. Ты, видимо, даже и не догадываешься, кому ты бросаешь вызов.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_03");	//Конечно, я бы мог с легкостью отправить тебя сейчас на тот свет, но, знаешь...(задумчиво)
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_04");	//...я этого не стану делать.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_05");	//Я уважаю таких людей, как ты. К тому же, как я понял, ты умеешь держать язык за зубами, а это тоже чего-то стоит.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Fight_01_06");	//Что ты хочешь этим сказать?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_07");	//То, что наш разговор окончен. Иди и передай своему работадателю, что я позабочусь о его проблемах.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_LogEntry(TOPIC_GERBRANDTHELP,"Я сделал все, о чем просил Гербрандт. Правда, во время встречи возникли, так сказать, некоторые сложности. Мне также хватило ума не проболтаться о причастности Гербрандта к этому делу. Теперь осталось вернуться к нему и забрать свою награду.");
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSDANGER = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,400);
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_23");
};

func void dia_addon_inextremo_announcer_meetkillers_torg()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_00");	//Поторговаться? А почему бы и нет.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_01");	//Каждая информация всегда чего-то стоит.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_06");	//Тем более такая ценная!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_07");	//А ты, как я посмотрю, делец! Ладно, я дам тебе триста монет. Теперь говори!
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_08");	//Его зовут Гербрандт, он торговец.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_09");	//А где он живет?
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_10");	//В верхнем квартале города, первый дом справа. Больше я ничего не знаю.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_11");	//Хммм... ну что же, этого вполне достаточно.
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_12");	//Эй! Ты же обещал! И где мои деньги?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_13");	//Тебе не следует верить всему тому, что говорят.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_14");	//Неужели ты думаешь, что я настолько глуп, чтобы платить тебе за это.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_16");	//Позволь мне объяснить тебе пару вещей.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_17");	//Видишь ли, в нашем деле нет ничего хуже, чем люди, на которых нельзя положиться.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_19");	//Тем более те, которые готовы продать все ради блеска золота в своих карманах.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_20");	//И судя по всему, ты относишься именно к этой категории людей. Вот так просто взял и сдал мне своего работодателя - о чем же еще говорить?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_21");	//Не факт, что ты не проболтаешься и о нашей встрече. А я так рисковать не могу! Понимаешь?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_22");	//А посему ты не оставил мне выбора.
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Я сделал все, о чем просил Гербрандт. Правда, во время встречи возникли, так сказать, некоторые сложности. К тому же я проболтался о причастности Гербрандта к этому делу. Не думаю, что это ему понравится.");
	MEETCHIEFKILLERSNOTOK = TRUE;
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSTELLSGER = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_TELLABOUTWAMBO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_tellaboutwambo_condition;
	information = dia_addon_inextremo_announcer_tellaboutwambo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_inextremo_announcer_tellaboutwambo_condition()
{
	if((KILLCANJOIN == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_KILLWAMBO_01") <= 1500))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_tellaboutwambo_info()
{
	B_GivePlayerXP(100);
	MEETSTIDGERBRANT = TRUE;
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	Npc_ExchangeRoutine(self,"Start");
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0A");	//Это опять ты! Хммм... вот мы и снова встретились.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0B");	//Хотя на мой взгляд ты выбрал не совсем подходящее для этого время.
	if(MEETSTID == TRUE)
	{
		AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_0C");	//Ну, если честно, я и сам не ожидал увидеть тебя здесь.
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0D");	//Однако это произошло!
	}
	else
	{
		AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_0E");	//А разве мы знакомы?! Хотя постой! Ты же тот человек из таверны, верно?
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0F");	//Вижу, что ты меня хорошенько запомнил! Впрочем, как и я тебя.
	};
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_00");	//Кажется, у тебя неприятности с ополчением.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_01");	//У меня? (смеется) Что ты имеешь в виду?
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_02");	//Может быть, мне показалось, но, похоже, ты только что убил человека.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_03");	//Думаю, у тебя из-за этого будут большие проблемы.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0H");	//Ты ошибаешься, друг мой! У меня их не будет, поскольку об этом вряд ли кто узнает.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_05");	//Ведь для этого нужны свидетели...(смеется)
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_06");	//А что насчет меня? Я же видел, как ты...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_07");	//(перебивая) Значит, тем хуже для тебя!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_09");	//Ты выбрал не самое лучшее время, чтобы перейти мне дорогу.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_10");	//Хотя я тебя не виню - скорее всего, ты здесь оказался просто по нелепой случайности.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_12");	//Ты мне угрожаешь?!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_13");	//Нет, что ты! Угрозы - это лишь пустая трата времени и сил.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_14");	//Действия приносят куда больше пользы.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_15");	//Пойми меня правильно - я не имею ничего против тебя, но я не могу так рисковать.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_18");	//Просто своим появлением здесь ты не оставил мне выбора...(смеется)
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_35");	//Тем более что ты сам состоишь в ополчении.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_36");	//Тем более что ты сам паладин.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_37");	//Тем более что ты - маг Огня и наверняка настучишь друзьям-паладинам.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_38");	//Тем более что ты - приспешник магов Огня и наверняка захочешь выслужиться.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	};
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_19");	//Постой! Давай просто спокойно поговорим.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_20");	//Может, мы все-таки сможем мирно уладить эту проблему?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_25");	//(задумался) Может быть...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_30");	//Может, ты мне и будешь полезен, если, конечно...(внимательно вглядываясь)
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_31");	//К чему ты ведешь?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_32");	//Возможно, мне бы пригодилась помощь такого человека, как ты.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_33");	//Насколько я понял, ты вроде парень ничего - не из болтливых, да и наглости тебе не занимать.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_34");	//Поэтому... думаю, у меня есть к тебе одно предложение.
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutwambo);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"И в чем оно заключается?",dia_addon_inextremo_announcer_tellaboutwambo_tellme);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Не думаю, что оно меня заинтересует.",dia_addon_inextremo_announcer_tellaboutwambo_refuse);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_refuse()
{
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_Refuse_01_00");	//Не думаю, что оно меня заинтересует.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_Refuse_01_01");	//Ты отказался, даже не выслушав, что я хотел тебе предложить.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_Refuse_01_04");	//Ну, в таком случае пришло время умирать, друг мой.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_tellme()
{
	CANCOMPLETEGUILDKILL = TRUE;
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_00");	//И в чем оно заключается?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_01");	//Для начала позволь мне тебе кое-что объяснить...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_02");	//Думаю, ты уже наверняка догадываешься, что я не совсем обычный человек, как это кажется на первый взгляд.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_03");	//Это ты верно подметил! Простым парнем тебя трудно назвать.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_05");	//Мое настоящее ремесло также нельзя назвать обычным занятием.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_06");	//И чем ты занимаешься?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_08");	//Мое настоящее занятие заключается в том, что я помогаю людям решать их проблемы не совсем законными методами.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_11");	//Мое настоящее имя - Асмал. Может быть, это тебе о чем-нибудь говорит?
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_13");	//Никогда раньше не слышал о тебе.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_14");	//Хммм...(улыбается) Может, это и к лучшему для тебя.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_16");	//Пойми правильно: мне не доставляет удовольствия убивать людей, но каждый зарабатывает на хлеб так, как умеет.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_17");	//В конце концов, тот, кого я сейчас убил, был всего лишь продажным ополченцем, доставлявшим множество хлопот местным торговцам.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_18");	//Думаю, от его смерти этот мир лишь выиграл, нежели проиграл.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_19");	//Кстати, именно ты подписал этому бедняге смертный приговор, передав мне ту записку с деньгами в таверне...(смеется)
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_20");	//Правда, сейчас это уже не имеет никакого значения. Поэтому лучше вернемся непосредственно к твоей персоне.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_21");	//Скажу честно: конечно, мне было бы проще просто убить тебя...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_22");	//...и тем самым уладить возникшую проблему. Но... я хочу дать тебе шанс.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_23");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_24");	//Я предлагаю тебе стать одним из нас.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_25");	//Одним из вас? Ты предлагаешь мне стать убийцей?!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_26");	//Да. И присоединиться к нашему тайному обществу или, проще говоря, к нашей гильдии убийц.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_27");	//Примешь ли ты мое предложение или нет - решать тебе.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_29");	//Итак, что скажешь?
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutwambo);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Я не имею дел с убийцами!",dia_addon_inextremo_announcer_tellaboutwambo_becomeno);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Хорошо, я с вами!",dia_addon_inextremo_announcer_tellaboutwambo_becomeyes);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_becomeno()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeNo_01_00");	//Я не имею дел с убийцами!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeNo_01_03");	//В таком случае, думаю, на этом стоит закончить наш разговор, друг мой.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeNo_01_04");	//Теперь пришло время умирать!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_becomeyes()
{
	self.name[0] = "Асмал";
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_00");	//Хорошо, я с вами!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_01");	//Я знал, что ты согласишься с моим предложением.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_02");	//Ты сделал правильный выбор, иначе бы ты сейчас был бы просто мертв.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_03");	//И что теперь?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_04");	//Теперь ты один из нас!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_07");	//Скажу тебе - на многое пока что можешь не рассчитывать.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_08");	//Ты еще должен доказать, что способен не только болтать языком, но и делать что-нибудь посерьезнее.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_10");	//Надеюсь, ты понимаешь, о чем я говорю.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_15");	//Я понимаю.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_16");	//И еще кое-что... Последнее время в Хоринисе стало немного неспокойно.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_18");	//Поэтому лучше пока отсидеться в каком-нибудь тихом местечке.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_20");	//Если будешь вновь искать со мной встречи, приходи в заброшенный дом на пристани.

	if(JOINKILLERS == FALSE)
	{
		MIS_KILLWAY = LOG_Running;
		Log_CreateTopic(TOPIC_KILLWAY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KILLWAY,LOG_Running);
		B_LogEntry(TOPIC_KILLWAY,"Асмал принял меня в гильдию убийц. Правда, пока только на словах - до тех пор, пока я не докажу ему, что действительно достоин этого.");
		JOINKILLERS = TRUE;
	};

	CHANGELOCATIONASMAL = TRUE;
	CHECKFLAGKILLSJOIN = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Logovo");
	B_StartOtherRoutine(vlk_6028_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6029_buergerin,"TOT");
	B_StartOtherRoutine(vlk_6030_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6031_buergerin,"TOT");
	//B_StartOtherRoutine(vlk_6032_buergerin,"TOT");
	B_StartOtherRoutine(vlk_6033_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6034_buergerin,"TOT");
	B_StartOtherRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"Logovo");
	B_StartOtherRoutine(PIR_1395_Addon_InExtremo_Lutter,"Logovo");
	B_StartOtherRoutine(PIR_1396_Addon_InExtremo_Flex,"Logovo");
	B_StartOtherRoutine(PIR_1391_Addon_InExtremo_TheFlail,"Logovo");
	B_StartOtherRoutine(pir_1397_addon_inextremo_charlotte,"Logovo");
	B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Logovo");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLARMOR(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killarmor_condition;
	information = dia_addon_inextremo_announcer_killarmor_info;
	permanent = FALSE;
	description = "А что это на тебе за доспехи?";
};

func int dia_addon_inextremo_announcer_killarmor_condition()
{
	if(JOINKILLERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killarmor_info()
{
	AI_Output(other,self,"DIA_pir_1398_KillArmor_01_00");	//А что это на тебе за доспехи?
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_01");	//А сам-то как думаешь? Могу дать руку на отсечение, что раньше ты подобных не встречал.
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_03");	//Такие доспехи носят только те люди, которые по праву заслужили свое место в нашем кругу. А что, они тебе так приглянулись?
	AI_Output(other,self,"DIA_pir_1398_KillArmor_01_04");	//Очень интересно! А как мне получить такие же?
	AI_Output(other,self,"DIA_pir_1398_KillArmor_01_05");	//Теперь я тоже состою в гильдии убийц и...
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_06");	//(перебивая) Ха! Эти доспехи еще надо для начала заслужить! Или ты думаешь, что уже много сделал для нашей гильдии?
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_07");	//Для начала прояви себя, выполни пару моих поручений и, быть может, в конце концов, ты будешь удостоен чести носить доспехи настоящего убийцы!
	B_LogEntry(TOPIC_KILLWAY,"Асмал сказал, что я пока не достоин носить доспехи наемного убийцы, и мне нужно заслужить эту честь, проявив себя на деле.");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_CANTEACH(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_canteach_condition;
	information = dia_addon_inextremo_announcer_canteach_info;
	permanent = FALSE;
	description = "Ты можешь меня чему-нибудь научить?";
};

func int dia_addon_inextremo_announcer_canteach_condition()
{
	if((JOINKILLERS == TRUE) && (ANNOUNCERCANTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_canteach_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_Addon_InExtremo_Announcer_CanTeach_01_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_01");	//Боюсь, многому я тебя научить не смогу. Сам понимаешь, не мое это дело учить кого-то.
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_02");	//Но, если на то пошло, то парочку приемов фектования я бы мог тебе преподать.
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_03");	//Ведь как-никак от этого зависит успех выполненой работы - а это важный момент в нашем ремесле!
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_04");	//Так что, если ты хочешь научиться получше владеть своей шпагой или мечом, - только скажи, и мы начнем.
	ANNOUNCERCANTEACH = TRUE;
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_TEACH(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_teach_condition;
	information = dia_addon_inextremo_announcer_teach_info;
	permanent = TRUE;
	description = "Давай начнем тренировку.";
};

func int dia_addon_inextremo_announcer_teach_condition()
{
	if((JOINKILLERS == TRUE) && (ANNOUNCERCANTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_teach_info()
{
	self.name[0] = "Асмал";
	Info_ClearChoices(dia_addon_inextremo_announcer_teach);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
};

func void dia_addon_inextremo_announcer_teach_back()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_teach);
};

func void dia_addon_inextremo_announcer_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		Info_ClearChoices(dia_addon_inextremo_announcer_teach);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
	};
};

func void dia_addon_inextremo_announcer_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		Info_ClearChoices(dia_addon_inextremo_announcer_teach);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK0(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork0_condition;
	information = dia_addon_inextremo_announcer_killwork0_info;
	permanent = FALSE;
	description = "Как насчет какой-нибудь работенки?";
};


func int dia_addon_inextremo_announcer_killwork0_condition()
{
	if((JOINKILLERS == TRUE) && (WAMBOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork0_info()
{
	self.name[0] = "Асмал";
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_00");	//Как насчет какой-нибудь работенки?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_01");	//Ха! Так спешишь показать показать себя на деле? Хммм...
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_02");	//Думаю, есть одно дельце - как раз для тебя! Заодно и посмотрим, на что ты способен.
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_03");	//И что нужно делать?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_04");	//Один человек из городского ополчения очень сильно докучает некоторым крупным торговцам из верхнего квартала Хориниса.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_05");	//Видимо, парень создает уж совсем много проблем, если они решили обратиться именно к нам за помощью.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_06");	//Судя по их словам, у того стражника слишком большой аппетит в плане денег в отношении этих торговцев...(смеется)
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_08");	//Я хочу, чтобы ты разобрался с этим стражником. И чем быстрее ты это сделаешь, тем будет лучше!
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_09");	//Проще говоря, мне нужно его убить?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_10");	//Какой ты догадливый!
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_11");	//Кто этот парень?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_12");	//Его зовут Вамбо. Возможно, ты уже встречался с ним. Так что не теряй времени!
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_13");	//Возвращайся, когда разберешься с этим делом. Возможно, у меня будут к тебе еще поручения.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_14");	//Да, и еще. Я надеюсь, мне не стоит тебе напоминать, что все это лучше сделать без свидетелей.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_15");	//Сам понимаешь, нам не нужны лишние проблемы с ополчением.
	MIS_KILLWAMBO = LOG_Running;
	Log_CreateTopic(TOPIC_KILLWAMBO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLWAMBO,LOG_Running);
	B_LogEntry(TOPIC_KILLWAMBO,"Асмал поручил мне разобраться с ополченцем по имени Вамбо, который серьезно докучает торговцам из верхнего квартала.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Mil_316_Wambo,"WaitFight2");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK0DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork0done_condition;
	information = dia_addon_inextremo_announcer_killwork0done_info;
	permanent = FALSE;
	description = "Я уладил дело с Вамбо.";
};


func int dia_addon_inextremo_announcer_killwork0done_condition()
{
	if((MIS_KILLWAMBO == LOG_Running) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork0done_info()
{
	self.name[0] = "Асмал";
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_pir_1398_KillWork0Done_01_00");	//Я уладил дело с Вамбо.
	AI_Output(self,other,"DIA_pir_1398_KillWork0Done_01_03");	//Хммм. Ну хорошо. Думаю, наши заказчики будут довольны.
	AI_Output(self,other,"DIA_pir_1398_KillWork0Done_01_04");	//Кажется, от тебя действительно есть польза.
	AI_Output(self,other,"DIA_pir_1398_KillWork0Done_01_05");	//Вот, возьми этот кошелек. Тут твоя доля за выполненную работу.
	B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
	MIS_KILLWAMBO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLWAMBO,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLWAMBO,"Асмал остался доволен моей работой.");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK1(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork1_condition;
	information = dia_addon_inextremo_announcer_killwork1_info;
	permanent = FALSE;
	description = "Есть для меня работа?";
};


func int dia_addon_inextremo_announcer_killwork1_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET1 == FALSE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork1_info()
{
	var C_Npc slf;
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork1_01_00");	//Есть для меня работа?
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_01");	//Хммм... да, есть еще одно дельце. Думаю, ты с ним без труда справишься.
	AI_Output(other,self,"DIA_pir_1398_KillWork1_01_02");	//Что надо делать?
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_03");	//Я хочу, чтобы ты позаботился об одном человеке по имени Луис. Ты найдешь его здесь, в городе.
	AI_Output(other,self,"DIA_pir_1398_KillWork1_01_04");	//Его надо убить?
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_05");	//Да, этот парень слишком много треплет языком о тех вещах, о которых лучше всегда помалкивать.
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_06");	//И, естественно, кое-кому это не очень нравится.
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_07");	//Постарайся все сделать тихо, без лишнего шума. Сам понимаешь, от этого зависит наша репутация!
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_08");	//А как уладишь это дело - возвращайся ко мне. У меня будет для тебя еще одно поручение.
	AI_StopProcessInfos(self);
	MIS_KILLTARGET1 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET1,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET1,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET1,"Асмал попросил меня уладить дело с типом по имени Луис. Этот парень явно много болтает, если кто-то захотел его смерти. Придется мне приложить все усилия, чтобы он больше не доставлял никому проблем.");
	Wld_InsertNpc(vlk_6109_luis,"NW_CITY_LUIS");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(Lehmar) == TRUE)
	{
		KILLTARGET2 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK1DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork1done_condition;
	information = dia_addon_inextremo_announcer_killwork1done_info;
	permanent = FALSE;
	description = "Про проблему с Луисом можно забыть.";
};


func int dia_addon_inextremo_announcer_killwork1done_condition()
{
	if((MIS_KILLTARGET1 == LOG_Running) && (KILLTARGET1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork1done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork1Done_01_00");	//Про проблему с Луисом можно забыть.
	AI_Output(self,other,"DIA_pir_1398_KillWork1Done_01_01");	//Ты позаботился о том, чтобы он больше не раскрывал свою пасть?
	AI_Output(other,self,"DIA_pir_1398_KillWork1Done_01_02");	//Парень теперь нем как рыба.
	AI_Output(self,other,"DIA_pir_1398_KillWork1Done_01_03");	//Что же, неплохо! Ты делаешь успехи. А это, как сам понимаешь, всегда поощряется.
	AI_Output(self,other,"DIA_pir_1398_KillWork1Done_01_05");	//Так что... вот, держи - тут твоя доля за твои хлопоты.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_KILLTARGET1 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET1,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET1,"Я уладил дело с Луисом.");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(Lehmar) == TRUE)
	{
		KILLTARGET2 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK2(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork2_condition;
	information = dia_addon_inextremo_announcer_killwork2_info;
	permanent = FALSE;
	description = "Ты говорил про еще одно поручение.";
};


func int dia_addon_inextremo_announcer_killwork2_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET2 == FALSE) && (KILLTARGET1 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork2_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_00");	//Ты говорил про еще одно поручение.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_01");	//Да, и оно достаточно срочное. Нам как можно скорее нужно решить эту проблему, пока проблемы не возникли у нас.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_02");	//А в чем, собственно, дело?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_03");	//Ты знаешь человека по имени Лемар? Он ростовщик в портовом квартале Хориниса.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_04");	//Да, я его знаю. А что у тебя за дела с ним?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_05");	//Это тебя не касается! Единственное, что тебе следует знать, так это то, что в свое время Лемар оказал нам одну очень неоценимую услугу.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_06");	//Его помощь существенно облегчила нам жизнь в городе, хотя и плата за его услуги была достаточно высока.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_07");	//Думаю, он с самого начала догадывался, кто мы такие и чем занимаемся.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_08");	//Правда, больше всего его все-таки интересовало золото, поэтому он не стал задавать лишних вопросов. По крайней мере, до последнего времени.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_09");	//(злобно) Но теперь этот ублюдок зашел слишком далеко!
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_10");	//Что он сделал?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_11");	//В последнее время дела у него идут не слишком хорошо.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_12");	//Слишком много должников, но мало кто из них платит по счетам. Поэтому он решил, что было бы неплохо заработать деньги иным способом.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_14");	//Он поставил нам условие: что, если мы не хотим чтобы кто-то узнал о нас больше, нам придется раскошелится...(смеется)
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_15");	//А если мы откажемся, он угрожает сдать нас лорду Андрэ и его ополчению!
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_17");	//Так пошли кого-нибудь из своих ребят к Лемару, чтобы они разобрались с ним.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_20");	//Все не так просто. Одно только появление моих ребят рядом с домом Лемара вызовет его беспокойство, и он сразу же побежит к лорду Андрэ.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_21");	//Он не дурак, и понимает, что мы наверняка попробуем поквитаться с ним. К тому же Лемар знает в лицо практически всех моих ребят.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_23");	//Ко всему прочему, недавно он еще и нанял себе телохранителя, представляешь? Лютер знает этого парня - он отличный боец и справиться с ним без лишнего шума будет крайне сложно.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_24");	//М-да. похоже, Лемар все предусмотрел.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_25");	//Все, кроме одного...(смеется)
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_26");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_27");	//Тебя, естественно! Этот болван даже не догадывается, что ты - один из нас...(смеется) Представляю, какое у него будет лицо, когда он узнает об этом!
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_30");	//Не теряй времени. Отправляйся к Лемару и позаботься о том, чтобы этот ублюдок больше никогда не смог угрожать нам.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_31");	//А что насчет телохранителя?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_32");	//Если понадобится, тебе придется позаботиться и о нем. Конечно, это будет совсем непросто, но другого выхода у нас нет.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_33");	//Хммм... но вокруг его дома всегда полно народу! Если я кого-нибудь прикончу, меня тут же схватит ополчение!
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_35");	//Постарайся застать ростовщика в таком месте, где было бы поменьше всяких зевак.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_37");	//Недавно я слышал, что Лемар частенько наведывается вечером в гавань. Видимо, выходит прогуляться и подышать свежим морским воздухом.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_38");	//Обычно в это время там практически никого нет.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_45");	//Когда будешь протыкать эту жирную свинью шпагой, передай ему привет от меня и моих ребят...(смеется)
	MIS_KILLTARGET2 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET2,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET2,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET2,"У гильдии убийц возникли проблемы с ростовщиком Лемаром. Тот знает, кто они и решил воспользоваться этим, шантажируя Асмала и его людей. Мне нужно разобраться с этой проблемой, хотя это будет непросто. Лемар нанял себе телохранителя, и застать его врасплох будет трудновато. Кроме того, Асмал упомянул, что вечером Лемар любит гулять в гавани и намекнул, что это лучший шанс сделать мое грязное дело без лишнего шума.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_484_Lehmar,"CanKill");
	Wld_InsertNpc(vlk_6120_lemarguard,"NW_CITY_LEMAR_KILL_GUARD");

	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK2DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork2done_condition;
	information = dia_addon_inextremo_announcer_killwork2done_info;
	permanent = FALSE;
	description = "Я передал привет Лемару от тебя.";
};


func int dia_addon_inextremo_announcer_killwork2done_condition()
{
	if((MIS_KILLTARGET2 == LOG_Running) && (KILLTARGET2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork2done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork2Done_01_00");	//Я передал Лемару привет от тебя.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_01");	//Да? (смеется) И что же он сказал?
	AI_Output(other,self,"DIA_pir_1398_KillWork2Done_01_02");	//Ничего, потому что он уже был мертв.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_03");	//Отлично! Эта свинья заслужила это! Думаю, многие обрадуются его смерти.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_05");	//Слишком много людей были ему должны.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_06");	//Что же касается тебя, то ты отлично поработал!
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_07");	//Вот, возьми это золото за свои труды и прими мою благодарность.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_KILLTARGET2 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET2,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET2,"Асмал был рад узнать, что я убил Лемара.");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLREWARD(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killreward_condition;
	information = dia_addon_inextremo_announcer_killreward_info;
	permanent = FALSE;
	description = "Надеюсь, теперь я достоин носить доспехи убийцы?";
};

func int dia_addon_inextremo_announcer_killreward_condition()
{
	if((MIS_KILLTARGET2 == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killarmor))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killreward_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillReward_01_00");	//Надеюсь, теперь я достоин носить доспехи убийцы?
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_01");	//(удивленно) Тебя все еще это интересует?
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_03");	//Хммм...(внимательно вглядываясь) Ну, если ты так хочешь узнать мое мнение, - то, думаю, да. Ты достоин!
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_04");	//Ты доказал всем, что по праву заслужил носить эти доспехи, и даже более того.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_05");	//Я был уверен, что ты далеко пойдешь!
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_06");	//Правда, я не ожидал, что это произойдет так быстро.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_08");	//Поэтому вот, прими от меня эти доспехи наемного убийцы.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_09");	//И уж я надеюсь, ты понимаешь, что этой чести удостаивались единицы.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_10");	//Вид этих доспехов любому скажет, кто ты и на что способен.
	B_GiveInvItems(self,other,itar_kil_sl,1);
	B_LogEntry(TOPIC_KILLWAY,"Асмал считает, что теперь я достоин носить звание наемного убийцы и быть полноценным представителем их гильдии.");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK3(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork3_condition;
	information = dia_addon_inextremo_announcer_killwork3_info;
	permanent = FALSE;
	description = "Что-нибудь еще?";
};


func int dia_addon_inextremo_announcer_killwork3_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET3 == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork3_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork3_01_00");	//Что-нибудь еще?
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_01");	//Для тебя еще есть одна работенка довольно специфического плана.
	AI_Output(other,self,"DIA_pir_1398_KillWork3_01_02");	//Кто на этот раз?
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_03");	//Кантар, торговец на рыночной площади.
	AI_Output(other,self,"DIA_pir_1398_KillWork3_01_04");	//Кантар? И кому же он наступил на больную мозоль, да еще так сильно?
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_07");	//Кантар уж слишком преуспевающий торговец, и именно из-за этого у него в скором времени будут большие проблемы.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_09");	//Люди не любят особо удачливых. К тому же, как оказалось, и сам Кантар играет не совсем честно.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_11");	//У него есть небольшие связи в верхних кругах городской знати и он этим пользуется, чтобы убрать со своего пути других торговцев на рыночной площади.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_15");	//Постарайся не обмануть надежды этих людей - они очень рассчитывают на нашу помощь.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_16");	//Теперь ступай! Ты знаешь что надо делать.
	AI_StopProcessInfos(self);
	MIS_KILLTARGET3 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET3,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET3,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET3,"Асмал дал мне очередное поручение. На этот раз мне нужно позаботиться о торговце Кантаре. Думаю, это не составит особого труда.");

	if(Npc_GetDistToWP(VLK_468_Canthar,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	{
		Npc_ExchangeRoutine(VLK_468_Canthar,"CanKill");
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK3DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork3done_condition;
	information = dia_addon_inextremo_announcer_killwork3done_info;
	permanent = FALSE;
	description = "Кантар больше не помеха для других торговцев.";
};


func int dia_addon_inextremo_announcer_killwork3done_condition()
{
	if((MIS_KILLTARGET3 == LOG_Running) && (KILLTARGET3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork3done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork3Done_01_00");	//Кантар больше не помеха для других торговцев.
	AI_Output(self,other,"DIA_pir_1398_KillWork3Done_01_03");	//Хорошо! Наши заказчики будут довольны.
	AI_Output(self,other,"DIA_pir_1398_KillWork3Done_01_04");	//Вот, возьми причитающуюся тебе долю за эту работу.
	B_GiveInvItems(self,other,ItMi_Gold,750);
	MIS_KILLTARGET3 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET3,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET3,"Я отчитался перед Асмалом о выполненном заказе.");
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK4(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork4_condition;
	information = dia_addon_inextremo_announcer_killwork4_info;
	permanent = FALSE;
	description = "Как насчет очередного заказа?";
};


func int dia_addon_inextremo_announcer_killwork4_condition()
{
	if((JOINKILLERS == TRUE) && (MISSION4COMPLETE == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (KILLTARGET3 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork4_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork4_01_00");	//Как насчет очередного заказа?
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_03");	//(улыбается) Ну, как скажешь. Есть тут у меня еще одно дельце, как раз для тебя.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_05");	//Один человек по имени Найджел задолжал одному крупному торговцу огромную кучу денег.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_06");	//Насколько я знаю, его задолженность перед торговцем составляет порядка двух тысяч золотых.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_08");	//Деньги немалые. Вот и этот парень решил, что лучше будет забыть про долг, чем его отдать.
	AI_Output(other,self,"DIA_pir_1398_KillWork4_01_09");	//Что от меня требуется?
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_10");	//Найди этого ублюдка и постарайся выбить из него этот долг. А если он откажется платить - просто убей его!
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_11");	//Конечно, как ты сам понимаешь, первый вариант более предпочтительнее для всех...
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_12");	//...но если так не выйдет - надо проучить этого бедолагу.
	AI_Output(other,self,"DIA_pir_1398_KillWork4_01_13");	//А где мне его искать?
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_14");	//Говорят, что его недавно видели в таверне у Орлана. Он, видимо, наивно полагает, что его там никто не достанет.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_16");	//Теперь ступай, и не подведи меня!
	MIS_KILLTARGET4 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET4,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET4,"Мне необходимо найти человека по имени Найджел и напомнить ему о его долге. Если он откажется платить, придется просто убить его. Асмал сказал, что недавно этого типа видели в таверне у Орлана.");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK4DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork4done_condition;
	information = dia_addon_inextremo_announcer_killwork4done_info;
	permanent = FALSE;
	description = "Я уладил дело с Найджелом.";
};


func int dia_addon_inextremo_announcer_killwork4done_condition()
{
	if((MIS_KILLTARGET4 == LOG_Running) && ((KILLTARGET4 == TRUE) || ((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE) && (KILLTARGET4 == FALSE) && ((Npc_HasItems(other,ItMi_Gold) >= 2000) || (Npc_HasItems(other,itse_nigelpocket) >= 1)))))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork4done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_00");	//Я уладил дело с Найджелом.
	AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_01");	//(с интересом) Он отдал деньги?
	if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE) && (KILLTARGET4 == FALSE) && ((Npc_HasItems(other,ItMi_Gold) >= 2000) || (Npc_HasItems(other,itse_nigelpocket) >= 1)))
	{
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_02");	//Можно сказать, что да. Правда, пришлось немного повозиться с этим делом.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_03");	//А где деньги?!
		if(Npc_HasItems(other,itse_nigelpocket) >= 1)
		{
			B_GiveInvItems(other,self,itse_nigelpocket,1);
			AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_04A");	//Вот, держи этот кошелек.
			Npc_RemoveInvItems(self,itse_nigelpocket,1);

			if(MIS_NIGELMATTER == LOG_Running)
			{
				MIS_NIGELMATTER = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_OBSOLETE);
			};
		}
		else
		{
			B_GiveInvItems(other,self,ItMi_Gold,2000);
			AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_04B");	//Вот, держи. Как ты и говорил - две тысячи!
			Npc_RemoveInvItems(self,ItMi_Gold,2000);
		};
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_05");	//Отлично! Наш клиент будет очень доволен нашей работой.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_09");	//А за то, что сумел выбить должок, - твоя доля за это дельце будет больше, чем обычно.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_10");	//Вот, держи - целая куча золота! Надеюсь, ты сможешь найти ему достойное применение.
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_11");	//Можешь не сомневаться.
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		MIS_KILLTARGET4 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_SUCCESS);
		B_LogEntry(TOPIC_KILLTARGET4,"Асмал был рад узнать, что мне удалось выбить из Найджела долг.");
	}
	else if(KILLTARGET4 == TRUE)
	{
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_12");	//К сожалению, нет. Парень не воспринял всерьез все мои доводы, да и денег у него не оказалось.
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_13");	//Так что пришлось его прикончить.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_14");	//Жаль. Хотя, в общем, я не очень и рассчитывал на то, что тебе удастся выбить из него эти деньги.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_15");	//Но в любом случае ты выполнил свою работу хорошо.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_16");	//Вот, держи - как всегда твой гонорар за хлопоты.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_KILLTARGET4 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_SUCCESS);
		B_LogEntry(TOPIC_KILLTARGET4,"Асмал был немного расстроен тем, что мне не удалось выбить из Найджела долг. С другой стороны, работа сделана, а этого достаточно.");
	};
	MISSION4COMPLETE = TRUE;
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK5(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork5_condition;
	information = dia_addon_inextremo_announcer_killwork5_info;
	permanent = FALSE;
	description = "Есть еще работа?";
};


func int dia_addon_inextremo_announcer_killwork5_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET5 == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (KILLTARGET3 == TRUE) && (MISSION4COMPLETE == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork5_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_00");	//Есть еще работа?
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_01");	//(серьезно) Пожалуй, найдется. Есть одна проблема, требующая немедленного решения.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_05");	//Недавно в таверне у Орлана я встретил одного человека. Не совсем простого человека... старого знакомого из далекого прошлого.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_07");	//Когда-то давно он состоял в нашей гильдии убийц.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_10");	//Но потом случилось так, что этот идиот умудрился погореть на одном деле и чуть не подставил всех нас!
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_11");	//Его приговорили к каторжным работам на рудниках в какой-то из колоний королевства. Ну а нам удалось избежать этой горькой участи.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_13");	//С тех пор о нем никто ничего не слышал. По крайней мере, до недавнего времени.
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_17");	//А в чем, собственно, проблема?
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_18");	//Проблема в том, что слишком уж он много знает про нас!
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_19");	//К тому же этот парень до сих пор винит нас в том, что мы тогда не смогли вытащить его из того дерьма, в которое он сам вляпался.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_20");	//И, думаю, теперь, когда он повстречал меня здесь на острове, этот ублюдок не преминет при удобном случае сдать меня городскому ополчению.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_21");	//Да и звук золота для него не последний в этой жизни.
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_22");	//Но он же беглый каторжник. Ему же никто не поверит!
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_23");	//Возможно. Но не стоит так рисковать!
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_24");	//Правда, насколько мне стало известно, сейчас он подался в наемники на двор Онара.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_27");	//Надо разобраться и как можно скорее!
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_30");	//Как его имя?
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_31");	//Его зовут Рудар. Запомнил?
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_32");	//Да, нет проблем. Считай, что он уже труп.
	MIS_KILLTARGET5 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET5,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET5,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET5,"Недавно Асмал встретил одного старого знакомого. Когда-то давно он состоял в гильдии убийц, пока не влип в одну историю, из-за чего был сослан на каторжные работы в Долину Рудников. Асмал уверен, что этот тип - Рудар - не преминет при первом удобном случае сдать Асмала ополчению за то, что тот в свое время не смог помочь ему в той ситуации. Поэтому мне необходимо как можно скорее решить эту проблему. Асмал сказал, что Рудар подался в наемники к Онару.");
	Wld_InsertNpc(sld_6111_rudar,"NW_BIGFARM_RUDAR");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK5DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork5done_condition;
	information = dia_addon_inextremo_announcer_killwork5done_info;
	permanent = FALSE;
	description = "Рудар мертв.";
};


func int dia_addon_inextremo_announcer_killwork5done_condition()
{
	if((MIS_KILLTARGET5 == LOG_Running) && (KILLTARGET5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork5done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWork5Done_01_00");	//Рудар мертв.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_03");	//Хммм...(облегченно) Ну, тогда, пожалуй, мы можем забыть об этой проблеме.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_04");	//Я даже, честно говоря, удивлен, что ты смог с ним справиться в одиночку.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_05");	//Рудар всегда был неплохим бойцом и к тому же отлично владел мечом. В отличии от меня, он всегда предпочитал меч заместо шпаги.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_06");	//Но ладно... все это уже не важно. Важно другое - то, что он больше не сможет раскрыть свою поганую пасть.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_07");	//Вот, возьми это золото. Это лучшая награда за твои труды, которую я только могу предложить.
	AI_Output(other,self,"DIA_pir_1398_KillWork5Done_01_08");	//Спасибо!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_KILLTARGET5 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET5,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET5,"Асмал вздохнул с облечением, узнав о смерти Рудара.");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINAL(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinal_condition;
	information = dia_addon_inextremo_announcer_killworkfinal_info;
	permanent = FALSE;
	description = "Есть еще какие-нибудь поручения?";
};


func int dia_addon_inextremo_announcer_killworkfinal_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGETFINAL == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (KILLTARGET3 == TRUE) && (MISSION4COMPLETE == TRUE) && (KILLTARGET5 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinal_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_00");	//Есть еще какие-нибудь поручения?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_01");	//Думаю, да.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_05");	//Как ты и сам уже наверняка знаешь, последнее время в окрестностях Хориниса объявилось слишком много бандитов.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_07");	//Сам понимаешь, что таким людям нечего терять, и они на все готовы, чтобы урвать куш побольше, пока есть возможность.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_08");	//Грабят и убивают всех кого ни попадя! В общем, эти ублюдки совсем озверели.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_09");	//А при чем тут вы? Какое отношение гильдия убийц имеет ко всему происходящему?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_12");	//В городе из-за всего происходящего много недовольных людей. В большинстве случаев - это торговцы, чей бизнес страдает от этих грабежей и нападений больше всего.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_13");	//Вот и недавно на одного такого торговца напали бандиты. Он вез большую партию разнообразного товара и еще, по его словам, приличную сумму золота!
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_14");	//Ого! Видимо, крупный был торговец!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_15");	//Да, этим подонкам чертовски повезло! К счастью для него самого, он смог выйти из этой переделки живым, и теперь очень хочет вернуть свое добро и свое золото назад.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_16");	//Тогда ему бы следовало обратиться к городскому ополчению.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_17");	//ЧТО?! К этим трусам? (смеется) Да они даже и носа не покажут за городские ворота - не то чтобы разобраться с целой бандой.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_18");	//Только и могут, что драть с местных фермеров налоги. Поэтому он обратился за помощью именно к нам.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_21");	//Делая нам это предложение, он намекнул, что говорит от имени многих влиятельных людей города.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_22");	//Видимо, другие торговцы поддержали его в этом начинании. Еще бы, это же и в их интересах!
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_23");	//И ты согласился?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_24");	//Да, я согласился. Слишком уж хорошие деньги он предложил нам за эту работу!
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_2A");	//И сколько составит доля каждого в этом дельце?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_2B");	//Пока не могу сказать, но куш приличный. Можешь в этом не сомневаться!
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_28");	//Ясно. Ты уже что-нибудь предпринял по этому поводу?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_29");	//Я послал Лютера и Флейла разузнать об этих бандитах побольше.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_30");	//И что они узнали?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_31");	//Немного. Главаря той банды, что напала на торговца, кажется, зовут Ханс. Я о нем ничего раньше не слышал.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_32");	//Вместе с ним в банде еще около семи человек, и все они засели где-то недалеко от фермы Онара.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_37");	//После того как нам удалось узнать, где располагаются эти ублюдки, - я послал несколько своих ребят разобраться с ними.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_41");	//Но те парни не так уж и просты!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_42");	//Мои ребята оттуда еле ноги унесли. Хорошо, что никого не убили!
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_44");	//Кажется, вы нарвались на крутых бандитов!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_45");	//К сожалению, ты прав. Банда Ханса оказалась моим ребятам не по зубам! И, видимо, просто так их голыми руками не взять.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_46");	//И что ты теперь собираешься делать?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_47");	//В любом случае работа должна быть сделана, и неважно, одного человека нужно убить или целую банду! Думаю, придется навести визит этому Хансу и его ребятам самолично.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_48");	//Ты что, собираешься отправиться одиночку?!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_49");	//Нет конечно! (смеется) Я еще совсем из ума не выжил.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_50");	//Мы отправимся туда все вместе! Думаю, тогда у нас будет шанс одолеть Ханса и его ребят.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_54");	//Когда выдвигаемся?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_55");	//Прямо сейчас. Из города будем выбираться поодиночке, чтобы не привлечь внимание стражников.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_58");	//Мы будем ждать тебя в лесу неподалеку от фермы Онара.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_60");	//По словам Лютера, рядом с тем местом еще какой-то парень пасет овец.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_62");	//Хорошо, я все понял.
	MIS_KILLTARGETFINAL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGETFINAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGETFINAL,"Асмал сказал, что нам необходимо разобраться с небольшой бандой, засевшей недалеко от фермы Онара. Ее возглавляет некий Ханс, и судя по всему, он и его ребята - парни достаточно крутые. Но работа есть работа, к тому же, по словам Асмала, за нее очень хорошо заплатят. Я должен буду встретиться с Асмалом и остальными его людьми недалеко от фермы Онара, рядом с пастбищем, после чего мы приступим к выполнению своей грязной работы.");
	AI_StopProcessInfos(self);
	b_killmeetinghans();
	Wld_InsertNpc(bdt_6112_hans,"NW_BDT_HANS_S");
	Wld_InsertNpc(bdt_6113_hansband_01,"NW_BDT_HANS_01_S");
	Wld_InsertNpc(bdt_6114_hansband_02,"NW_BDT_HANS_02_S");
	Wld_InsertNpc(bdt_6115_hansband_03,"NW_BDT_HANS_03_S");
	Wld_InsertNpc(bdt_6116_hansband_04,"NW_BDT_HANS_04_S");
	Wld_InsertNpc(bdt_6117_hansband_05,"NW_BDT_HANS_05_S");
	Wld_InsertNpc(bdt_6118_hansband_06,"NW_BDT_HANS_06_S");
	Wld_InsertNpc(bdt_6119_hansband_07,"NW_BDT_HANS_07_S");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINALREADYFORFIGHT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinalreadyforfight_condition;
	information = dia_addon_inextremo_announcer_killworkfinalreadyforfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_killworkfinalreadyforfight_condition()
{
	if((Npc_GetDistToWP(self,"NW_HANSLAGER") < 500) && (MIS_KILLTARGETFINAL == LOG_Running) && (KILLTARGETFINAL == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinalreadyforfight_info()
{
	self.name[0] = "Асмал";
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_00");	//(нервно) Где тебя носит?! Почему так долго?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_02");	//А, ладно! На болтовню сейчас нет времени.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_03");	//Видишь позади меня в лесу небольшой отблеск костра? Это и есть лагерь Ханса.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_05");	//Пора действовать! Застанем их врасплох - это даст нам определенное преимущество в начале боя.
	GuideGuildsToCamp = TRUE;
	Info_ClearChoices(dia_addon_inextremo_announcer_killworkfinalreadyforfight);
	Info_AddChoice(dia_addon_inextremo_announcer_killworkfinalreadyforfight,"Идем!",dia_addon_inextremo_announcer_killworkfinalreadyforfight_figth);
};

func void dia_addon_inextremo_announcer_killworkfinalreadyforfight_figth()
{
	AI_StopProcessInfos(self);
	b_killgotohans();
	b_changeguild(PIR_1390_Addon_InExtremo_DrPymonte,GIL_NONE);
	b_changeguild(PIR_1391_Addon_InExtremo_TheFlail,GIL_NONE);
	b_changeguild(PIR_1395_Addon_InExtremo_Lutter,GIL_NONE);
	b_changeguild(PIR_1396_Addon_InExtremo_Flex,GIL_NONE);
	b_changeguild(pir_1397_addon_inextremo_charlotte,GIL_NONE);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_NONE);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINALDONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinaldone_condition;
	information = dia_addon_inextremo_announcer_killworkfinaldone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_killworkfinaldone_condition()
{
	if((MIS_KILLTARGETFINAL == LOG_Running) && (KILLTARGETFINAL == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinaldone_info()
{
	var int countlost;
	var int countsharlotte;
	self.name[0] = "Асмал";
	b_changeguild(PIR_1390_Addon_InExtremo_DrPymonte,GIL_OUT);
	b_changeguild(PIR_1391_Addon_InExtremo_TheFlail,GIL_OUT);
	b_changeguild(PIR_1395_Addon_InExtremo_Lutter,GIL_OUT);
	b_changeguild(PIR_1396_Addon_InExtremo_Flex,GIL_OUT);
	b_changeguild(pir_1397_addon_inextremo_charlotte,GIL_OUT);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_OUT);
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_00");	//(переводя дыхание) Теперь Ханс и его люди более не опасны.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_02");	//Эти ублюдки действительно были крутыми парнями.
	MIS_KILLTARGETFINAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGETFINAL,"С бандой Ханса покончено - все его люди мертвы, как и он сам.");

	if((CHARLOTTEISDEADX == TRUE) || (FLEXISDEADX == TRUE) || (LUTTERISDEADX == TRUE) || (THEFLAILISDEADX == TRUE) || (DRPYMONTEISDEADX == TRUE))
	{
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_04");	//М-да... эта работенка нам дорого обошлась!
		if(CHARLOTTEISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_05");	//Шарлотта...
			countsharlotte = 1;
			countlost = countlost + 1;
		};
		if(FLEXISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_06");	//Флекс...
			countlost = countlost + 1;
		};
		if(LUTTERISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_07");	//Лютер...
			countlost = countlost + 1;
		};
		if(THEFLAILISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_08");	//Флейл...
			countlost = countlost + 1;
		};
		if(DRPYMONTEISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_09");	//Паймон...
			countlost = countlost + 1;
		};
		if(countlost > 1)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_10");	//...все они мертвы...(печально) Нам всем будет их очень сильно не хватать!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_12");	//Ну ладно, не будем больше об этом. Теперь уже ничего не поправить.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_13");	//Наша работа сделана, а это самое главное.
		}
		else
		{
			if(countsharlotte == 1)
			{
				AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_14");	//...она мертва! Бедная девочка...(печально) Нам всем будет ее очень сильно не хватать!
			}
			else
			{
				AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_16");	//...он мертв! Нам всем будет его очень сильно не хватать.
			};
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_18");	//...(задумчиво) Ну ладно, не будем больше об этом. Теперь уже ничего не поправить.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_19");	//Наша работа сделана, а это самое главное.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_20");	//Так что мы еще легко отделались - вроде как никого из наших парней не прикончили.
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_22");	//Ну ладно, не будем больше об этом. Теперь все они мертвы, а наша работа сделана. И это самое главное!
	};

	AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_23");	//А что насчет обещанной кучи золота?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_24");	//Ах да, золото! Теперь каждый из нас получит приличный куш. То золото, что бандиты забрали у торговца, и есть наш гонорар за эту работенку.

	if(HANSKILL == 0)
	{
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_25");	//Правда, ты не особо помог нам в этой заварушке, но все равно рисковал своей жизнью, а, значит, заслужил свою долю.
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_26");	//Вот, возьми - тут пятьсот золотых монет!
		AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_27");	//Как! Так мало?
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_28");	//Но ты же даже не прикончил ни одного бандита! И хочешь получить еще больше?
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_29");	//Так что прекрати ныть и жаловаться, как баба!
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_30");	//Надо было лучше махать мечом, если хотел, чтобы твоя доля была больше этой...(смеется)
		AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_31");	//Меня это не устраивает!
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_32");	//Это уже твои личные проблемы.
		Info_ClearChoices(dia_addon_inextremo_announcer_killworkfinaldone);
		Info_AddChoice(dia_addon_inextremo_announcer_killworkfinaldone,"Ладно, давай сюда деньги.",dia_addon_inextremo_announcer_killworkfinaldone_ok);
		Info_AddChoice(dia_addon_inextremo_announcer_killworkfinaldone,"Немедленно заплати мне больше - или я убью тебя!",dia_addon_inextremo_announcer_killworkfinaldone_refuse);
	}
	else
	{
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_34");	//Что касается тебя, то ты славно потрудился!
		MIS_KILLTARGETFINAL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
		B_LogEntry(TOPIC_KILLTARGETFINAL,"С бандой Ханса покончено - все его люди мертвы, как и он сам.");

		if(HANSKILL == 1)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_35");	//Прикончил одного из этих ублюдков - неплохая работа, парень!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_36");	//Вот, возьми - тут тысяча золотых монет.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_37");	//Ну что же, совсем неплохо.
			B_GiveInvItems(self,other,ItMi_Gold,1000);
		}
		else if(HANSKILL == 2)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_39");	//Прикончил двоих ублюдков из этой банды - хорошая работа, парень!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_40");	//Вот, возьми - тут полторы тысячи золотых монет.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_41");	//Ну что же, совсем неплохо.
			B_GiveInvItems(self,other,ItMi_Gold,1500);
		}
		else if(HANSKILL == 3)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_43");	//Прикончил троих ублюдков из банды Ханса - отличная работа, парень!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_44");	//Вот, возьми - тут две тысячи золотых монет.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_45");	//Ну что же, совсем неплохо.
			B_GiveInvItems(self,other,ItMi_Gold,2000);
		}
		else if(HANSKILL == 4)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_47");	//Прикончил аж четверых ублюдков из банды Ханса - работа, достойная уважения, парень!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_48");	//Вот, возьми - тут две с половиной тысячи золотых монет!
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_49");	//Ну что же, совсем неплохо!
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else if(HANSKILL == 5)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_51");	//(удивленно) Прикончил аж пятерых ублюдков из банды Ханса - непостижимо!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_52");	//Вот, возьми - тут три тысячи золотых монет!
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_53");	//Ну что же, совсем неплохо!
			B_GiveInvItems(self,other,ItMi_Gold,3000);
		}
		else if(HANSKILL == 6)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_55");	//(восхищенно) Прикончил шестерых! Если честно, не ожидал от тебя такой прыти!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_56");	//Вот, возьми - тут три с половиной тысячи золотых монет!
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_57");	//Ну что же, совсем неплохо!
			B_GiveInvItems(self,other,ItMi_Gold,3500);
		}
		else if(HANSKILL == 7)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_59");	//Уму непостижимо - один прикончил семерых! Просто нет слов!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_60");	//Бандиты явно не осознавали, с кем они связались!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_61");	//Вот, возьми - тут четыре тысячи золотых монет! Это очень приличные деньги, более чем соизмеримые твоим заслугам в этом деле.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_62");	//Ну что же, совсем неплохо!
			B_GiveInvItems(self,other,ItMi_Gold,4000);
		}
		else if(HANSKILL == 8)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_64");	//Прикончил всех бандитов, да еще и самого Ханса в придачу! Сдается мне, ты бы и без нас справился с этим делом.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_65");	//Думаю, если бы Ханс знал, что такой парень, как ты, охотится за его головой, - его бы и духу здесь не было!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_67");	//Вот, возьми - тут пять тысяч золотых монет! Это очень приличные деньги, более чем соизмеримые твоим заслугам в этом деле.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_68");	//Ну что же, совсем неплохо!
			B_GiveInvItems(self,other,ItMi_Gold,5000);
		};
	};
};

func void dia_addon_inextremo_announcer_killworkfinaldone_ok()
{
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_Ok_01_00");	//Ладно, давай сюда деньги.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Ok_01_01");	//Вот так-то лучше! Держи свою долю.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Ok_01_02");	//И чтобы больше я не слышал от тебя этого нытья!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_announcer_killworkfinaldone_refuse()
{
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_Refuse_01_00");	//Немедленно заплати мне больше или я убью тебя!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Refuse_01_01");	//ЧТО?! Ты еще и угрожаешь мне! Да кто ты такой, чтобы мне угрожать?!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Refuse_01_02");	//Придется тебя все-таки научить хорошим манерам! Ты, жадный ублюдок!
	TROUBLEWITHASMAL = TRUE;
	AI_StopProcessInfos(self);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_OUT);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLAFTERDO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killafterdo_condition;
	information = dia_addon_inextremo_announcer_killafterdo_info;
	permanent = FALSE;
	description = "И что теперь вы собираетесь делать?";
};


func int dia_addon_inextremo_announcer_killafterdo_condition()
{
	if(MIS_KILLTARGETFINAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killafterdo_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillAfterDo_01_00");	//Что вы теперь собираетесь делать?
	AI_Output(self,other,"DIA_pir_1398_KillAfterDo_01_01");	//Думаю, мы останемся здесь - подальше от города и от проблем.
	AI_Output(self,other,"DIA_pir_1398_KillAfterDo_01_03");	//Здесь, под боком у этого жирного борова Онара и его наемников, можно чувствовать себя гораздо комфортнее.
	AI_Output(other,self,"DIA_pir_1398_KillAfterDo_01_07");	//Понятно.
	KILLFINISH = TRUE;
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLCANBEMASTER(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killcanbemaster_condition;
	information = dia_addon_inextremo_announcer_killcanbemaster_info;
	permanent = FALSE;
	description = "А как мне получить такие же доспехи, как у тебя?";
};


func int dia_addon_inextremo_announcer_killcanbemaster_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killreward))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killcanbemaster_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_00");	//А как мне получить такие же доспехи, как у тебя?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_01");	//Боюсь, что никак! (смеется)
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_03");	//Эти доспехи мастера гильдии убийц, и только тот, кто обладает этой привилегией, может носить их!
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_04");	//Они подчеркивают его статус в гильдии перед остальными.
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_07");	//Как мне стать мастером гильдии убийц?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_08");	//Хммм...(внимательно всматривается) Намекаешь, что хочешь возглавить гильдию убийц?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_10");	//А ты рисковый парень! Этого вопроса мне не задавали уже очень давно, ибо я давно отбил охоту у большинства людей задавать мне его!
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_11");	//Но ты - новенький в нашей гильдии, поэтому позволь мне кое-что тебе объяснить.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_12");	//В гильдии, друг мой, может быть только один мастер, и на данный момент - это я!
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_13");	//Если ты хочешь сам им стать, тебе придется дождаться, пока я не сложу свои полномочия главы гильдии или же...
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_14");	//...ты можешь просто бросить мне вызов! (смеется)
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_15");	//Если честно, мне было бы очень интересно посмотреть на то, как у тебя это получится.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_16");	//Хотя и наверняка знаю, что против меня у тебя нет ни одно шанса...(смеется)
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_17");	//Ты так считаешь?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_18");	//Я в этом уверен! Или, ты думаешь, ты первый, кто решил замахнуться на мое место?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_19");	//До тебя таких смельчаков, как ты, было предостаточно, но все они теперь кормят крыс...(злорадно)
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_21");	//Так что на твоем бы месте я выкинул бы эту идею из головы, и как можно скорее - для тебя же будет лучше!
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_23");	//Я подумаю над твоим предложением.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_24");	//Правильно - подумай и хорошенько, прежде чем делать необдуманные шаги!
	B_LogEntry(TOPIC_KILLWAY,"Асмал сказал, что, если я хочу получить доспех мастера гильдии убийц и стать ее главой, единственный способ это сделать - бросить ему вызов. По моему мнению, Асмал - отличный боец, и победить его будет нелегко.");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLBEOUT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killbeout_condition;
	information = dia_addon_inextremo_announcer_killbeout_info;
	permanent = FALSE;
	description = "Я хочу бросить тебе вызов.";
};

func int dia_addon_inextremo_announcer_killbeout_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killcanbemaster))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killbeout_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self,"DIA_pir_1398_KillBeOut_01_00");	//Я хочу бросить тебе вызов.
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_01");	//Значит, ты все-таки решился на это. Ха! (смеется)
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_02");	//Смелый поступок, но, по моему мнению, очень глупый.
	AI_Output(other,self,"DIA_pir_1398_KillBeOut_01_03");	//Это решит наш поединок!
	AI_Output(other,self,"DIA_pir_1398_KillBeOut_01_04");	//В любом случае, если это единственная возможность стать главой гильдии убийц, - то можешь не сомневаться в том, что я это сделаю!
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_05");	//(смеется) Жалкий червяк! Ладно, посмотрим, насколько ты хорош.
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_06");	//Я убью тебя быстро.
	CANBEKILLMASTER = TRUE;
	B_LogEntry(TOPIC_KILLWAY,"Я бросил Асмалу вызов. Теперь только бой решит, кто из нас достоин быть главой гильдии убийц.");
	AI_StopProcessInfos(self);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_NONE);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};