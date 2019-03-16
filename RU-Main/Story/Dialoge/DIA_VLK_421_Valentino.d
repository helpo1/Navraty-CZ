
instance DIA_Valentino_EXIT(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 999;
	condition = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Valentino_HALLO(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 1;
	condition = DIA_Valentino_HALLO_Condition;
	information = DIA_Valentino_HALLO_Info;
	permanent = FALSE;
	description = "Так, и что у нас здесь?";
};


func int DIA_Valentino_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Ну что же ты за человек?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Меня зовут Валентино. Я пытаюсь не осквернить этот день, данный мне Инносом, своей работой.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Придержи язык.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Ох, прошу прощения, я не хотел оскорбить нашего Владыку. Еще раз прошу простить меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Ты незнаком с хорошими манерами? Это отвратительно!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Повсюду этот грязный сброд. У тебя что, нет работы, которой ты должен заниматься?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Но, я полагаю, никто не хватится такого бездельника как ты, да?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//Ну, если бы у тебя было столько же золота, сколько у меня, ты бы уж тоже не работал. Но тебе никогда не стать таким богатым.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Ты такой забавный.
	};
};


instance DIA_Valentino_WhoAgain(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 2;
	condition = DIA_Valentino_WhoAgain_Condition;
	information = DIA_Valentino_WhoAgain_Info;
	permanent = FALSE;
	description = "Я спросил тебя, кто ты такой!";
};


func int DIA_Valentino_WhoAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (other.guild != GIL_KDM) && (VALENTINOCANJOINPSI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Я спросил тебя, кто ты такой!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Я Валентино Великолепный. Бонвиван и любимчик женщин.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Бедный заботами, богатый мудростью и золотом, женщины так и бросаются на меня.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Если у тебя есть проблемы, держи их при себе. Мне они не нужны.
};


instance DIA_Valentino_Manieren(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 3;
	condition = DIA_Valentino_Manieren_Condition;
	information = DIA_Valentino_Manieren_Info;
	permanent = FALSE;
	description = "Похоже, мне придется поучить тебя хорошим манерам!";
};


func int DIA_Valentino_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF) && (other.guild != GIL_KDW) && (other.guild != GIL_KDM) && (VALENTINOCANJOINPSI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Похоже, мне придется поучить тебя хорошим манерам!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Меня это не волнует! Молоти меня, сколько хочешь. А когда я встану завтра утром, я опять буду красавчиком.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Но тебе придется жить дальше с этим преступлением до конца своих дней.
};


var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;

instance DIA_Valentino_WASNUETZLICHES(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 4;
	condition = DIA_Valentino_WASNUETZLICHES_Condition;
	information = DIA_Valentino_WASNUETZLICHES_Info;
	permanent = TRUE;
	description = "Ты еще что-нибудь можешь сказать мне?";
};


func int DIA_Valentino_WASNUETZLICHES_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (VALENTINOCANJOINPSI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(спокойно) Ты еще что-нибудь можешь сказать мне?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if((Valentino_Lo_Perm == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Стань популярным, никогда ничего никому не обещай, бери то, что можешь, и смотри, чтобы не ввязаться в драку с ополчением.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Или с ревнивым мужем, конечно. Это хуже всего, уж поверь мне.
		Valentino_Lo_Perm = TRUE;
	}
	else if((Valentino_Hi_Perm == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//Для человека в твоем положении нет ничего невозможного. Ты просто должен знать, когда нужно действовать.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Так что не теряй времени и действуй.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Я сказал тебе все, что тебе нужно знать. Остальное за тобой.
	};
};


instance DIA_Valentino_PICKPOCKET(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = DIA_Valentino_PICKPOCKET_Condition;
	information = DIA_Valentino_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};


func int DIA_Valentino_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Valentino) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Valentino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,Dialog_Back,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItKe_Valentino,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Valentino_PICKPOCKET);
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

func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
};


instance DIA_VALENTINO_JOINSEKTA(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_joinsekta_condition;
	information = dia_valentino_joinsekta_info;
	permanent = FALSE;
	description = "Тебя не очень-то любят в городе.";
};


func int dia_valentino_joinsekta_condition()
{
	if((MIS_NOVICECANJOIN == LOG_Running) && (other.guild == GIL_SEK) && Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (VALENTINOSHIT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valentino_joinsekta_info()
{
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_00");	//Тебя не очень-то любят в городе, как я заметил.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_01");	//(злобно) А тебе что до этого?
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_02");	//Не горячись. У меня есть одна мысль, как тебе помочь.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_04");	//(кичливо) Мне не нужна ничья помощь! Я сам способен позаботиться о себе!
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_05");	//Ты хочешь добиться уважения людей.
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_07");	//Но все, чего ты смог добиться, - лишь получить пару затрещин от Региса.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_09");	//Я...(неуверенно) я... я пытаюсь, но... да, наверное, ты прав...
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_10");	//Я знаю, что поможет тебе обрести уверенность в себе.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_11");	//Да?! О чем ты?
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_12");	//Ты слышал о болотном Братстве?
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_15");	//Гуру Братства - очень мудрые люди, постигшие истинную веру в долгих годах самопознания.
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_16");	//Я думаю, это именно то, что тебе нужно.
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_17");	//Братство поможет тебе обрести себя и поставит на истинный путь.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_18");	//(с надеждой) Ты действительно так считаешь?
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_26");	//Хммм...(думает) Хорошо, идем!
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_27");	//Отлично! Следуй за мной и не отставай.
	B_LogEntry(TOPIC_NOVICECANJOIN,"Я поговорил с Валентино. Его легко удалось уговорить отправиться со мной к Идолу Парвезу.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	VALENTINOCANJOINPSI = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VALENTINO_THANKSJOINSEKTA(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_thanksjoinsekta_condition;
	information = dia_valentino_thanksjoinsekta_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_valentino_thanksjoinsekta_condition()
{
	if((MIS_NOVICECANJOIN == LOG_SUCCESS) && (VALENTINOPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_valentino_thanksjoinsekta_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Valentino_ThanksJoinSekta_01_00");	//Спасибо, что помог мне. Я даже не знаю, чем отплатить тебе за твою помощь.
	VALENTINOPSI = TRUE;
	self.guild = GIL_SEK;
	Npc_SetTrueGuild(self,GIL_SEK);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;

	if(MIS_VALENTINOHELP == LOG_Running)
	{
		MIS_VALENTINOHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_VALENTINOHELP);
	};

	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_TALIASANLETTER(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_taliasanletter_condition;
	information = dia_valentino_taliasanletter_info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int dia_valentino_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && !Npc_KnowsInfo(other,DIA_TALIASAN_SENDTOLARIUS) && Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (VALENTINOPSI == FALSE) && ((hero.guild != GIL_KDF) || (hero.guild != GIL_PAL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDM)))
	{
		return TRUE;
	};
};

func void dia_valentino_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_06");	//Хммм. Ты не производишь впечатление крутого парня!
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_07");	//А тебе никогда не говорили, что внешность - обманчивая штука?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_08");	//Да? Ну, тогда...
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_10");	//Тут один парень по имени Регис давеча очень грубо обошелся со мной.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_12");	//Если ты такой крутой, то вот тебе задание: врежь этому олуху от меня пару раз!
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_14");	//Я бы и сам это сделал, да только руки марать неохота.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_18");	//Ах, да. Ты, видимо, хочешь спросить, сколько я заплачу тебе за это?
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_21");	//Золото меня не интересует.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_22");	//(удивленно) Да? Вот-те раз! Так ты что, еще у нас и гордый? От золота отказываешься?
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_23");	//Нет. Дело в другом.
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_25");	//Мне нужна помощь влиятельных людей этого города, чтобы решить одну маленькую проблемку.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_30");	//Хммм. Ну ладно. И какая помощь тебе нужна?
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_31");	//Ты ведь слышал про человека по имени Галлахад?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_32");	//Галлахад? Конечно! Кто же о нем не слышал.
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_33");	//Так вот - именно ему и нужна твоя помощь.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_34");	//А! Так ты мальчик на побегушках у Галлахада! (смеется) Теперь все ясно.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_35");	//И что же нужно от меня Галлахаду?
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_36");	//Ему нужно, чтобы ты написал для него рекомендательное письмо, в котором бы похвалил его перед Лариусом.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_37");	//Перед губернатором? Но зачем ему это понадобилось?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_41");	//Но для начала - надавай по шее Регису!
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_44");	//Только учти: Регис должен знать, что это именно я возвращаю ему этот, так сказать, должок! Хе-ха!
	MIS_VALENTINOHELP = LOG_Running;
	Log_CreateTopic(TOPIC_VALENTINOHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_Running);
	B_LogEntry(TOPIC_VALENTINOHELP,"Валентино напишет рекомендательное письмо для Галлахада, если я устрою взбучку Регису, с которым у него недавно произошла ссора.");
	AI_StopProcessInfos(self);
};

instance DIA_VALENTINO_PAYBACK(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_payback_condition;
	information = dia_valentino_payback_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_valentino_payback_condition()
{
	if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE) && ((REGISFIGHTOK == TRUE) || (REGISFIGHTNOTOK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_valentino_payback_info()
{
	if(REGISFIGHTOK == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Valentino_PayBack_01_00");	//Эй! Я слышал, что ты хорошо врезал этому Регису!
		AI_Output(self,other,"DIA_Valentino_PayBack_01_04");	//Надеюсь, он надолго запомнит тот урок, который ты ему преподал.

		if(MIS_TALIASANHELP == LOG_Running)
		{
			AI_Output(other,self,"DIA_Valentino_PayBack_01_05");	//Ты написал письмо для Галлахада?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_08");	//Вот, держи. Как и договаривались.
			AI_Output(self,other,"DIA_Valentino_PayBack_01_09");	//Тут самые лучшие рекомендации, которые он только может получить от меня.
			B_GiveInvItems(self,other,itwr_valentinoletter,1);
		};
		
		AI_Output(self,other,"DIA_Valentino_PayBack_01_14");	//A ты, если что, обращайся ко мне.
		AI_Output(self,other,"DIA_Valentino_PayBack_01_15");	//Возможно, у меня в будущем найдется для тебя еще какая-нибудь работка.
		MIS_VALENTINOHELP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_SUCCESS);
		B_LogEntry(TOPIC_VALENTINOHELP,"Валентино был доволен тем, что я накостылял Регису и написал рекомендательное письмо для Галлахада.");
		AI_StopProcessInfos(self);
	};
	if(REGISFIGHTNOTOK == TRUE)
	{
		AI_Output(self,other,"DIA_Valentino_PayBack_01_18");	//Эй! Я слышал, что Регис хорошо врезал тебе.
		AI_Output(self,other,"DIA_Valentino_PayBack_01_19");	//Я так и думал, что ты лишь обычный хвастун, как и все остальные.
		AI_Output(self,other,"DIA_Valentino_PayBack_01_20");	//И ни на что не годный, жалкий оборванец...(с издевкой)

		if(MIS_TALIASANHELP == LOG_Running)
		{
			AI_Output(other,self,"DIA_Valentino_PayBack_01_24");	//Ты написал письмо для Галлахада?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_25");	//ЧТО? (смеется) И ты еще смеешь его требовать, наглец?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_26");	//Или ты забыл наш уговор?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_27");	//Проваливай! Такие идиоты, как ты, ничего не получают от меня.
		};

		MIS_VALENTINOHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_VALENTINOHELP);
		AI_StopProcessInfos(self);
	};
};