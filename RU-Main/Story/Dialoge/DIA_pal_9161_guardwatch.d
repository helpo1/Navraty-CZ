
instance DIA_PAL_9161_GUARDWATCH_EXIT(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 999;
	condition = dia_pal_9161_guardwatch_exit_condition;
	information = dia_pal_9161_guardwatch_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9161_guardwatch_exit_condition()
{
	return TRUE;
};

func void dia_pal_9161_guardwatch_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9161_GUARDWATCH_HALLO(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_hallo_condition;
	information = dia_pal_9161_guardwatch_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_hallo_condition()
{
	if(GRANTTOVARUS == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_hallo_info()
{
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_00");	//Стой! (грозно) Ни шагу дальше!
	if(PYROKARSENTTOHAGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_26");	//Пропусти меня! У меня срочное сообщение для лорда Хагена от самого верховного мага Огня.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_27");	//От верховного мага Огня? Хммм...(удивленно) А не врешь ли ты, приятель?
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_29");	//Я лишь выполняю поручение Пирокара, иначе бы просто не пришел сюда.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_30");	//Ну хорошо, проходи! Но если ты соврал - я лично с тебя шкуру спущу...(грозно)
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_01");	//Ты хоть имеешь малейшее представление - куда ты направляешься?
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_02");	//И куда же?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_03");	//К лорду Варусу - начальнику этого гарнизона и нашему командиру!
		if((MIS_PALADINFOOD == LOG_Running) && (HAGENSENTTOVARUS == TRUE))
		{
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_04");	//Отлично! Он то мне как раз и нужен.
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_05");	//И зачем же?
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_06");	//У меня для него приказ от главы паладинов.
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_07");	//Приказ от самого лорда Хагена?
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_08");	//Именно! Ты все еще хочешь задержать меня или я могу пройти?
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_09");	//Хммм...(задумчиво) ну хорошо - ты можешь пройти!
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_10");	//Однако запомни, что если из-за тебя у лорда Варуса возникнут какие-то проблемы...
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_11");	//...я буду первым, кто научит тебя хорошим манерам! Это понятно?
			GRANTTOVARUS = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_13");	//Спасибо, буду знать. Теперь мне можно пройти?
			if(other.guild == GIL_PAL)
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_14");	//Ну, поскольку ты - один из наших братьев, то я пропущу тебя.
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_15");	//Однако запомни, что если из-за тебя у лорда Варуса возникнут какие-то проблемы...
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_16");	//...я буду первым, кто научит тебя хорошим манерам! Это понятно?
				GRANTTOVARUS = TRUE;
				AI_StopProcessInfos(self);
			}
			else if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_18");	//Ну, поскольку ты - один из достопочтенных служителей Инноса, то я пропущу тебя.
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_19");	//Однако запомни, маг - если из-за тебя у лорда Варуса возникнут какие-то проблемы...
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_20");	//...я буду первым, кто научит тебя хорошим манерам! Это понятно?
				GRANTTOVARUS = TRUE;
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_22");	//Нет!
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_23");	//И если ты сделаешь еще один шаг - клянусь Инносом, я атакую тебя!
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_24");	//Так что лучше не испытывай судьбу и проваливай.
				other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,"LGR_RATSHAUS_17");
				AI_StopProcessInfos(self);
			};
		};
	};
};


instance DIA_PAL_9161_GUARDWATCH_HALLOATTACK(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_halloattack_condition;
	information = dia_pal_9161_guardwatch_halloattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_halloattack_condition()
{
	if((GRANTTOVARUS == FALSE) && Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_hallo) && (Npc_GetDistToWP(hero,"LGR_RATSHAUS_17") <= (hero.aivar[AIV_LastDistToWP] - 20)) && ((HAGENSENTTOVARUS == FALSE) || (hero.guild != GIL_PAL) || (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_halloattack_info()
{
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloAttack_01_00");	//Кажется, я тебя предупреждал!
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloAttack_01_01");	//Теперь пеняй на себя...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_9161_GUARDWATCH_HALLONOTATTACK(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_hallonotattack_condition;
	information = dia_pal_9161_guardwatch_hallonotattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_hallonotattack_condition()
{
	if((GRANTTOVARUS == FALSE) && Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_hallo) && ((PYROKARSENTTOHAGEN == TRUE) || (HAGENSENTTOVARUS == TRUE) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_hallonotattack_info()
{
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_00");	//Стой! (грозно) Что тебе тут опять нужно?
	if(PYROKARSENTTOHAGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_20");	//Пропусти меня! У меня срочное сообщение для лорда Хагена от самого верховного мага Огня.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_21");	//От верховного мага Огня? Хммм...(удивленно) А не врешь ли ты, приятель?
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_23");	//Я лишь выполняю поручение Пирокара, иначе бы просто не пришел сюда.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_24");	//Ну хорошо, проходи! Но если ты соврал - я с тебя лично шкуру спущу...(грозно)
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(HAGENSENTTOVARUS == TRUE)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_11");	//У меня для него приказ от главы паладинов.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_12");	//Приказ от самого лорда Хагена?!
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_13");	//Именно. Ты все еще хочешь задержать меня или я могу пройти?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_14");	//Хммм...(задумчиво) ну хорошо - ты можешь пройти!
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_15");	//Однако запомни, что если из-за тебя у лорда Варуса возникнут какие-то проблемы...
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_16");	//...я буду первым, кто научит тебя хорошим манерам! Это понятно?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_01");	//Я состою в ордене паладинов. Ты пропустишь меня?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_02");	//Ну хорошо, поскольку ты - один из наших братьев, то я это сделаю.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_03");	//Однако запомни, что если из-за тебя у лорда Варуса возникнут какие-то проблемы...
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_04");	//...я буду первым, кто научит тебя хорошим манерам! Это понятно?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_06");	//Я - маг Огня. Ты пропустишь меня?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_07");	//Ну хорошо, поскольку ты - один из достопочтенных служителей Инноса, то я это сделаю.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_08");	//Однако запомни, маг - если из-за тебя у лорда Варуса возникнут какие-то проблемы...
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_09");	//...я буду первым, кто научит тебя хорошим манерам! Это понятно?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_18");	//Ничего.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_19");	//Тогда проваливай!
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9161_GUARDWATCH_WHAT(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_what_condition;
	information = dia_pal_9161_guardwatch_what_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_pal_9161_guardwatch_what_condition()
{
	if(GRANTTOVARUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_what_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_What_01_00");	//Как обстановка?
	if(MIS_LANZRING == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_What_01_01");	//Все в порядке, приятель! Проходи.
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,30);
	};
};


instance DIA_PAL_9161_GUARDWATCH_POST(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_post_condition;
	information = dia_pal_9161_guardwatch_post_info;
	permanent = FALSE;
	description = "Ты всегда тут на посту?";
};


func int dia_pal_9161_guardwatch_post_condition()
{
	if(GRANTTOVARUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_post_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Post_01_01");	//Ты всегда тут на посту?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Post_01_02");	//Почти всегда.
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Post_01_03");	//И никогда не отдыхаешь?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Post_01_04");	//Нет! Мне не нужен отдых - вера в Инноса придает мне сил.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Post_01_05");	//И хватит меня отвлекать от дела. Лучше займись чем-нибудь!
};


instance DIA_PAL_9161_GUARDWATCH_MISSGOLD(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_missgold_condition;
	information = dia_pal_9161_guardwatch_missgold_info;
	permanent = FALSE;
	description = "А у тебя все в порядке?";
};


func int dia_pal_9161_guardwatch_missgold_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_post))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_missgold_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_01");	//А у тебя все в порядке? Почему ты такой неприветливый?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_02");	//Тебе-то какое дело?
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_05");	//Просто расскажи, что случилось, а там посмотрим.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_06");	//Ну... в общем, во время одного из своих ночных дежурств на восточной стене форта, я случайно уронил вниз свой кошелек.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_07");	//Сначала я хотел спуститься и подобрать его, но потом понял, что не могу из-за такой мелочи бросить свой пост!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_08");	//И в чем же проблема? Подобрал бы его позже.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_09");	//Все так, но я просто не успел это сделать...(раздраженно)
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_10");	//Из кустов вылезла какая-то мерзкая тварь, схватила мой кошелек и рванула в сторону пляжа.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_11");	//Я выстрелил в нее из арбалета, но было так темно...
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_12");	//В общем, выпустив пару болтов - я понял, что это бесполезно.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_13");	//Теперь я не могу найти себе места - я должен вернуть свой кошелек!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_14");	//А что в нем было такого ценного?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_15");	//Кроме несколько сотен золотых монет, в нем я держал одно кольцо. Оно мне очень дорого!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_16");	//Что это за кольцо?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_17");	//Это мой талисман! Его мне подарил сам лорд Хаген, после битвы с орками в пустынях Варанта.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_18");	//С того времени я с ним никогда не расставался! До этого момента...(печально)
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_19");	//Понимаю. А я могу тебе чем-то помочь?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_20");	//Безусловно! Просто найди мой кошелек и верни мне его.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_21");	//Даже не сам кошелек, а кольцо. Деньги, что были там, меня не особо интересуют.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_22");	//Так что можешь их оставить себе.
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_23");	//Ладно, попробую.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_24");	//Спасибо! Ты сделаешь меня самым счастливым человеком, если у тебя это получится.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_25");	//А теперь извини - я не могу долго болтать на посту.
	MIS_LANZRING = LOG_Running;
	Log_CreateTopic(TOPIC_LANZRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LANZRING,LOG_Running);
	B_LogEntry(TOPIC_LANZRING,"Охранник Гланц уронил кошелек во время дежурства на восточной стене форта. Сам кошелек его не очень заботит, но в нем было кольцо, которое подарил ему сам лорд Хаген. Я вызвался помочь Гланцу. Тварь, что утащила его кошелек, убежала в сторону песчаного пляжа.");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9161_GUARDWATCH_MISSGOLDDONE(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_missgolddone_condition;
	information = dia_pal_9161_guardwatch_missgolddone_info;
	permanent = FALSE;
	description = "Я нашел твое кольцо.";
};


func int dia_pal_9161_guardwatch_missgolddone_condition()
{
	if((MIS_LANZRING == LOG_Running) && (Npc_HasItems(other,itri_lanzring) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_missgolddone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_01");	//Я нашел твое кольцо.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_02");	//(недоверчиво) Покажи.
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_03");	//Вот, держи. Это оно?
	B_GiveInvItems(other,self,itri_lanzring,1);
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_04");	//Да! Это то самое кольцо...(счастливо) Я не могу поверить, что оно снова со мной!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_05");	//Тогда думаю, теперь у тебя нет больше причин так переживать.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_06");	//Спасибо тебе, дружище!
	MIS_LANZRING = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LANZRING,LOG_SUCCESS);
	B_LogEntry(TOPIC_LANZRING,"Я вернул кольцо Гланцу.");
};


instance DIA_PAL_9161_GUARDWATCH_RAYNEHELP(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_raynehelp_condition;
	information = dia_pal_9161_guardwatch_raynehelp_info;
	permanent = FALSE;
	description = "Ты мог бы помочь Рэйну на складе?";
};


func int dia_pal_9161_guardwatch_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_raynehelp_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_RayneHelp_01_00");	//Ты мог бы помочь Рэйну на складе?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_RayneHelp_01_01");	//Ну и как ты себе это представляешь? (раздраженно) Сейчас вот брошу свой пост и пойду помогать этому бедолаге!
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Кажется, что я попусту трачу время - никто из паладинов не хочет помогать Рэйну. Может, мне стоит предпринять более кардинальные действия...");
	};
};


