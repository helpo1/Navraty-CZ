instance DIA_VLK_664_Masbo_EXIT(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 999;
	condition = DIA_VLK_664_Masbo_EXIT_Condition;
	information = DIA_VLK_664_Masbo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_664_Masbo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_664_Masbo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_664_Masbo_Hallo(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 1;
	condition = DIA_VLK_664_Masbo_Hallo_Condition;
	information = DIA_VLK_664_Masbo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VLK_664_Masbo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_Hallo_Info()
{
	AI_Output(self,other,"DIA_VLK_664_Masbo_Hallo_01_00");	//Эй, парень! Хочешь подраться?
};

instance DIA_VLK_664_Masbo_Intro(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_Intro_Condition;
	information = DIA_VLK_664_Masbo_Intro_Info;
	permanent = FALSE;
	description = "Что ты имеешь ввиду?";
};

func int DIA_VLK_664_Masbo_Intro_Condition()
{
	return TRUE;
};

func void DIA_VLK_664_Masbo_Intro_Info()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Intro_01_00");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_01");	//То, что ты можешь неплохо заработать, если умеешь хорошо работать кулаками.
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_02");	//Видишь тех парней? Так вот, это - лучшие бойцы Хориниса!
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_03");	//Если сможешь победить кого-нибудь из них, заработаешь огромную кучу золота.
	AI_Output(other,self,"DIA_VLK_664_Masbo_Intro_01_04");	//Звучит неплохо!
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_05");	//Еще бы! Однако у нас есть одно правило: тот, кто хочет драться, вначале должен заплатить небольшой денежный взнос.
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_06");	//Победивший в драке забирает обе ставки. Ну, а проигравший остается ни с чем.
	AI_Output(other,self,"DIA_VLK_664_Masbo_Intro_01_07");	//И сколько я должен внести?
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_08");	//Всего навсего сто золотых монет! Так что вначале хорошенько подумай, прежде чем решишься выйти на бой.
};

instance DIA_VLK_664_Masbo_Fight(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_Fight_Condition;
	information = DIA_VLK_664_Masbo_Fight_Info;
	permanent = TRUE;
	description = "Я хочу драться!";
};

func int DIA_VLK_664_Masbo_Fight_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_VLK_664_Masbo_Intro) == TRUE) && (TaverneFightEnd == FALSE) && (TaverneFightStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_Fight_Info()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_01_00");	//Я хочу драться.

	if((OlafWin == FALSE) || (GradenWin == FALSE) || (BramWin == FALSE) || (ValgardWin == FALSE))
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_01_01");	//Хорошо! Но вначале заплати денежный взнос.
		Info_ClearChoices(DIA_VLK_664_Masbo_Fight);
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"У меня нет столько.",DIA_VLK_664_Masbo_Fight_NoGold);

		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Вот, держи.",DIA_VLK_664_Masbo_Fight_Gold);
		};
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,5);
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_01_02");	//Ты уже всех побил тут! Больше с тобой никто не хочет драться.
		TaverneFightEnd = TRUE;
	};
};

func void DIA_VLK_664_Masbo_Fight_NoGold()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_NoGold_01_00");	//У меня нет столько золота.
	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_NoGold_01_01");	//Тогда найди его! Без вступительного взноса боя не будет.
	AI_StopProcessInfos(self);
};

func void DIA_VLK_664_Masbo_Fight_Gold()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Gold_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Gold_01_01");	//Отлично! Тогда выбирай, с кем ты хочешь драться.
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	TaverneFightStart = TRUE;
	Info_ClearChoices(DIA_VLK_664_Masbo_Fight);

	if(OlafWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Курт 'Железный кулак'.",DIA_VLK_664_Masbo_Fight_Olaf);
	};
	if(GradenWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Граден 'Кувалда'.",DIA_VLK_664_Masbo_Fight_Graden);
	};
	if(BramWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Брам 'Дикарь'.",DIA_VLK_664_Masbo_Fight_Bram);
	};
	if(ValgardWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Вальгард 'Череполом'.",DIA_VLK_664_Masbo_Fight_Valgard);
	};
};

func void DIA_VLK_664_Masbo_Fight_Olaf()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_00");	//Я хочу драться с Куртом по прозвищу 'Железный кулак'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Хорошо! Тогда пока вы не начали, я вкратце объясню тебе правила.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Вначале, перед боем, обязательно поприветствуй своего противника. У нас так принято!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Во вторых, в бою можно использовать только свои кулаки!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Если обнажишь свое оружие или используешь какую-нибудь магию, то для тебя бой будет окончен. Причем навсегда!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//Ну и последнее - вы сражаетесь в пределах этой части таверны. Отступишь дальше и считай, что ты проиграл поединок.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Тебе все ясно?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Яснее не бывает.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Отлично! Тогда выходи на ринг.
	Fight_Olaf = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFight");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Graden()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Graden_01_00");	//Я хочу драться с Граденом по прозвищу 'Кувалда'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Хорошо! Тогда пока вы не начали, я вкратце объясню тебе правила.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Вначале, перед боем, обязательно поприветствуй своего противника. У нас так принято!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Во вторых, в бою можно использовать только свои кулаки!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Если обнажишь свое оружие или используешь какую-нибудь магию, то для тебя бой будет окончен. Причем навсегда!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//Ну и последнее - вы сражаетесь в пределах этой части таверны. Отступишь дальше и считай, что ты проиграл поединок.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Тебе все ясно?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Яснее не бывает.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Отлично! Тогда выходи на ринг.
	Fight_Graden = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_661_Graden,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Bram()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Bram_01_00");	//Я хочу драться с Брамом по прозвищу 'Дикарь'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Хорошо! Тогда пока вы не начали, я вкратце объясню тебе правила.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Вначале, перед боем, обязательно поприветствуй своего противника. У нас так принято!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Во вторых, в бою можно использовать только свои кулаки!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Если обнажишь свое оружие или используешь какую-нибудь магию, то для тебя бой будет окончен. Причем навсегда!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//Ну и последнее - вы сражаетесь в пределах этой части таверны. Отступишь дальше и считай, что ты проиграл поединок.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Тебе все ясно?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Яснее не бывает.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Отлично! Тогда выходи на ринг.
	Fight_Bram = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_662_Bram,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Valgard()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Valgard_01_00");	//Я хочу драться с Вальгардом по прозвищу 'Череполом'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Хорошо! Тогда пока вы не начали, я вкратце объясню тебе правила.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Вначале, перед боем, обязательно поприветствуй своего противника. У нас так принято!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Во вторых, в бою можно использовать только свои кулаки!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Если обнажишь свое оружие или используешь какую-нибудь магию, то для тебя бой будет окончен. Причем навсегда!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//Ну и последнее - вы сражаетесь в пределах этой части таверны. Отступишь дальше и считай, что ты проиграл поединок.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Тебе все ясно?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Яснее не бывает.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Отлично! Тогда выходи на ринг.
	Fight_Valgard = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

instance DIA_VLK_664_Masbo_FightEnd(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_FightEnd_Condition;
	information = DIA_VLK_664_Masbo_FightEnd_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_664_Masbo_FightEnd_Condition()
{
	if((FightCurrentWin == TRUE) || (FightCurrentLost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_FightEnd_Info()
{
	if(FightCurrentWin == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_00");	//Поздравляю с победой, приятель!
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_01");	//Вот, возьми свои деньги.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else if(FightCurrentLost == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_02");	//Извини, приятель, но ты проиграл.
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_03");	//Твои деньги ушли победителю.
	};

	FightCurrentWin = FALSE;
	FightCurrentLost = FALSE;
	TaverneFightStart = FALSE;
	AI_StopProcessInfos(self);
};

//------------------------------бойцы--------------------------------------------------------------

instance DIA_VLK_660_Olaf_EXIT(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 999;
	condition = DIA_VLK_660_Olaf_EXIT_Condition;
	information = DIA_VLK_660_Olaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_660_Olaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_660_Olaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_660_Olaf_GetOff(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 10;
	condition = DIA_VLK_660_Olaf_GetOff_condition;
	information = DIA_VLK_660_Olaf_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_660_Olaf_GetOff_Condition()
{
	if((Fight_Olaf == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_660_Olaf_GetOff_Info()
{
	if(OlafWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_660_Olaf_Fight(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 10;
	condition = DIA_VLK_660_Olaf_Fight_condition;
	information = DIA_VLK_660_Olaf_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_660_Olaf_Fight_Condition()
{
	if((Fight_Olaf == TRUE) && (Fight_Olaf_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_660_Olaf_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Olaf_Now = TRUE;
	Fight_Olaf = FALSE;
	Info_ClearChoices(DIA_VLK_660_Olaf_Fight);
	Info_AddChoice(DIA_VLK_660_Olaf_Fight,"Начнем бой!",DIA_VLK_660_Olaf_Fight_Now);
};

func void DIA_VLK_660_Olaf_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_661_Graden_EXIT(C_Info)
{
	npc = VLK_661_Graden;
	nr = 999;
	condition = DIA_VLK_661_Graden_EXIT_Condition;
	information = DIA_VLK_661_Graden_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_661_Graden_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_661_Graden_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_661_Graden_GetOff(C_Info)
{
	npc = VLK_661_Graden;
	nr = 10;
	condition = DIA_VLK_661_Graden_GetOff_condition;
	information = DIA_VLK_661_Graden_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_661_Graden_GetOff_Condition()
{
	if((Fight_Graden == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_661_Graden_GetOff_Info()
{
	if(GradenWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_661_Graden_Fight(C_Info)
{
	npc = VLK_661_Graden;
	nr = 10;
	condition = DIA_VLK_661_Graden_Fight_condition;
	information = DIA_VLK_661_Graden_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_661_Graden_Fight_Condition()
{
	if((Fight_Graden == TRUE) && (Fight_Graden_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_661_Graden_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Graden_Now = TRUE;
	Fight_Graden = FALSE;
	Info_ClearChoices(DIA_VLK_661_Graden_Fight);
	Info_AddChoice(DIA_VLK_661_Graden_Fight,"Начнем бой!",DIA_VLK_661_Graden_Fight_Now);
};

func void DIA_VLK_661_Graden_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_662_Bram_EXIT(C_Info)
{
	npc = VLK_662_Bram;
	nr = 999;
	condition = DIA_VLK_662_Bram_EXIT_Condition;
	information = DIA_VLK_662_Bram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_662_Bram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_662_Bram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_662_Bram_GetOff(C_Info)
{
	npc = VLK_662_Bram;
	nr = 10;
	condition = DIA_VLK_662_Bram_GetOff_condition;
	information = DIA_VLK_662_Bram_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_662_Bram_GetOff_Condition()
{
	if((Fight_Bram == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_662_Bram_GetOff_Info()
{
	if(BramWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_662_Bram_Fight(C_Info)
{
	npc = VLK_662_Bram;
	nr = 10;
	condition = DIA_VLK_662_Bram_Fight_condition;
	information = DIA_VLK_662_Bram_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_662_Bram_Fight_Condition()
{
	if((Fight_Bram == TRUE) && (Fight_Bram_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_662_Bram_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Bram_Now = TRUE;
	Fight_Bram = FALSE;
	Info_ClearChoices(DIA_VLK_662_Bram_Fight);
	Info_AddChoice(DIA_VLK_662_Bram_Fight,"Начнем бой!",DIA_VLK_662_Bram_Fight_Now);
};

func void DIA_VLK_662_Bram_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_663_Valgard_EXIT(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 999;
	condition = DIA_VLK_663_Valgard_EXIT_Condition;
	information = DIA_VLK_663_Valgard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_663_Valgard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_663_Valgard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_663_Valgard_GetOff(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 10;
	condition = DIA_VLK_663_Valgard_GetOff_condition;
	information = DIA_VLK_663_Valgard_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_663_Valgard_GetOff_Condition()
{
	if((Fight_Valgard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_663_Valgard_GetOff_Info()
{
	if(ValgardWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_663_Valgard_Fight(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 10;
	condition = DIA_VLK_663_Valgard_Fight_condition;
	information = DIA_VLK_663_Valgard_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_663_Valgard_Fight_Condition()
{
	if((Fight_Valgard == TRUE) && (Fight_Valgard_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_663_Valgard_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Valgard_Now = TRUE;
	Fight_Valgard = FALSE;
	Info_ClearChoices(DIA_VLK_663_Valgard_Fight);
	Info_AddChoice(DIA_VLK_663_Valgard_Fight,"Начнем бой!",DIA_VLK_663_Valgard_Fight_Now);
};

func void DIA_VLK_663_Valgard_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};