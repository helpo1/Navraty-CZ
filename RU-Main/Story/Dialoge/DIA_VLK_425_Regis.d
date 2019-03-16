
instance DIA_Regis_EXIT(C_Info)
{
	npc = VLK_425_Regis;
	nr = 999;
	condition = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Regis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Regis_PICKPOCKET(C_Info)
{
	npc = VLK_425_Regis;
	nr = 900;
	condition = DIA_Regis_PICKPOCKET_Condition;
	information = DIA_Regis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Regis_PICKPOCKET_Condition()
{
	return C_Beklauen(40,35);
};

func void DIA_Regis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
	Info_AddChoice(DIA_Regis_PICKPOCKET,Dialog_Back,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Regis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};

func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};


instance DIA_Regis_Hallo(C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = DIA_Regis_Hallo_Condition;
	information = DIA_Regis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Regis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Regis_Hallo_Info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Эй, ты недавно в этом городе, да?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Да, а ты?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//Я приплыл с материка и вот теперь болтаюсь здесь без дела. У меня почти закончились деньги, поэтому, похоже, мне ничего другого не остается, кроме как поступить в ополчение.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Но я не хочу делать этого. Я не хочу, чтобы меня убили орки, когда я буду сражаться за короля.
};


instance DIA_Regis_MILIZ(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_MILIZ_Condition;
	information = DIA_Regis_MILIZ_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать об ополчении?";
};


func int DIA_Regis_MILIZ_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Regis_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Что ты можешь рассказать об ополчении?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Ими теперь командует один из паладинов. Некий лорд Андрэ.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Он пытается мобилизовать половину города на случай нападения орков.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Но чтобы вступить в ополчение, нужно быть гражданином этого города.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Насколько мне известно, если ты не являешься гражданином города, тебя все равно будут тренировать, но официально не зачислят.
};


instance DIA_Regis_ANDRE(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_ANDRE_Condition;
	information = DIA_Regis_ANDRE_Info;
	permanent = FALSE;
	description = "Что еще ты можешь рассказать о лорде Андрэ?";
};


func int DIA_Regis_ANDRE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_MILIZ))
	{
		return TRUE;
	};
};

func void DIA_Regis_ANDRE_Info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Что еще ты можешь рассказать о лорде Андрэ?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Он также занял должность судьи.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Если ты нарушил закон в городе, тебе придется держать ответ перед ним.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Я как-то подрался с одним горожанином.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//Он побежал жаловаться к лорду Андрэ.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//И этот пустяк обошелся мне в полсотни золотых монет.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//Хорошо еще, что это случилось ночью, а то были бы другие свидетели.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//Чем больше людей жалуется на тебя, тем выше штраф.
};


instance DIA_Regis_Valentino(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_Valentino_Condition;
	information = DIA_Regis_Valentino_Info;
	permanent = FALSE;
	description = "С кем ты дрался?";
};


func int DIA_Regis_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_ANDRE))
	{
		return TRUE;
	};
};

func void DIA_Regis_Valentino_Info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//С кем ты дрался?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//С парнем по имени Валентино. Он часто ошивается в таверне около храма.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//Обычно я довольно мирный. Но ЭТОТ урод просто вывел меня из себя...
};


instance DIA_Regis_ValDefeat(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_ValDefeat_Condition;
	information = DIA_Regis_ValDefeat_Info;
	permanent = FALSE;
	description = "Я встретил этого Валентино...";
};


func int DIA_Regis_ValDefeat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_Valentino) && (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Regis_ValDefeat_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//Я встретил этого Валентино...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//И?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Я задал ему хорошую взбучку...
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(смеется) Он заслужил это...

	if(!Npc_IsDead(Valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Вот - я нашел это кольцо в его кармане, когда наша стычка закончилась.
		B_GiveInvItems(self,other,ItRi_ValentinosRing,1);
		Regis_Ring = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(ухмыляется) Ты можешь передать его следующему, кто надает ему тумаков...
	};
};


var int Regis_Bogendieb;

instance DIA_Regis_PERM(C_Info)
{
	npc = VLK_425_Regis;
	nr = 200;
	condition = DIA_Regis_PERM_Condition;
	information = DIA_Regis_PERM_Info;
	permanent = TRUE;
	description = "Слышал что-нибудь интересное?";
};


func int DIA_Regis_PERM_Condition()
{
	return TRUE;
};

func void DIA_Regis_PERM_Info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Слышал что-нибудь интересное?

	if((Regis_Bogendieb == FALSE) && (MIS_Bosper_Bogen != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Можно сказать и так.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Говорят, Боспер, мастер-лучник, был ограблен. Причем самым наглым образом!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Вор вломился в его лавку средь бела дня и схватил лук.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//Боспер побежал за ним, вопя 'Держи вора!' Но вор оказался очень проворным.
		MIS_Bosper_Bogen = LOG_Running;
		Regis_Bogendieb = TRUE;
	}
	else if((MIS_Bosper_Bogen == LOG_SUCCESS) && (Regis_Bogendieb != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//А потом какой-то честный человек нашел этот лук и вернул Босперу.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//Это странно - в наше время обычно никому нет дела до других, но этот парень сам зашел к нему и вернул лук.
		Regis_Bogendieb = 2;
	}
	else if(Kapitel != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//Пока все тихо. Но я думаю, что когда придут орки, мы это заметим...
	}
	else if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Выяснилось, что этот наемник невиновен, и им пришлось отпустить его.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Лорд Хаген, должно быть, вне себя от ярости.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Весь город только и говорит об этом. Ты помнишь Лотара, паладина?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Может быть.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Так вот, он мертв. Убит прямо на улице. В этом подозревают наемников, конечно же.
	};
};


instance DIA_Regis_Crew(C_Info)
{
	npc = VLK_425_Regis;
	nr = 51;
	condition = DIA_Regis_Crew_Condition;
	information = DIA_Regis_Crew_Info;
	permanent = FALSE;
	description = "Я пытаюсь собрать команду для морской прогулки.";
};


func int DIA_Regis_Crew_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Regis_Crew_Info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Я пытаюсь собрать команду для морской прогулки.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//Ничем не могу помочь. Тебе лучше поспрашивать в порту. Ну, или, может, в кабаке.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Если здесь еще остались моряки, то, скорее всего, ты найдешь их там.
};


instance DIA_REGIS_PAYBACK(C_Info)
{
	npc = VLK_425_Regis;
	nr = 51;
	condition = dia_regis_payback_condition;
	information = dia_regis_payback_info;
	permanent = FALSE;
	description = "Тебе привет от Валентино!";
};


func int dia_regis_payback_condition()
{
	if(MIS_VALENTINOHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_regis_payback_info()
{
	AI_Output(other,self,"DIA_Regis_PayBack_01_00");	//Тебе привет от Валентино!
	AI_Output(self,other,"DIA_Regis_PayBack_01_01");	//(удивленно) Что?
	AI_Output(self,other,"DIA_Regis_PayBack_01_02");	//Что нужно от меня этому идиоту?
	AI_Output(other,self,"DIA_Regis_PayBack_01_04");	//Просто, чтобы я пару раз врезал тебе - так сказать, для ума.
	AI_Output(self,other,"DIA_Regis_PayBack_01_05");	//Он что, послал тебя, чтобы поквитаться со мной?
	AI_Output(self,other,"DIA_Regis_PayBack_01_07");	//Ха! И ты думаешь, что у тебя это вот так просто выйдет? (смеется)
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_REGIS_PAYBACKOK(C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = dia_regis_paybackok_condition;
	information = dia_regis_paybackok_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_regis_paybackok_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && Npc_KnowsInfo(other,dia_regis_payback) && (REGISPISSOFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_regis_paybackok_info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_00");	//Ну что - ты доволен?
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_01");	//Думаешь, если побил меня, то стал крутым?!
		AI_Output(other,self,"DIA_Regis_PayBackOk_01_02");	//Эй, приятель, сбавь тон! А то придется мне снова научить тебя хорошим манерам.
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_03");	//Давай, смейся надо мной!
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_04");	//Только учти, что если в следующий раз ты решишь тронуть меня хотя бы пальцем - тебе придется иметь дело с лордом Андрэ!
		self.guild = GIL_VLK;
		REGISPISSOFF = TRUE;
		Npc_SetTrueGuild(self,GIL_VLK);
		self.aivar[AIV_ToughGuy] = FALSE;

		if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE))
		{
			B_GivePlayerXP(250);
			REGISFIGHTOK = TRUE;
			B_LogEntry(TOPIC_VALENTINOHELP,"Я побил Региса!");
		};

		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		self.guild = GIL_VLK;
		Npc_SetTrueGuild(self,GIL_VLK);
		self.aivar[AIV_ToughGuy] = FALSE;
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_07");	//Ну что, тебе хватило?
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_08");	//И только попробуй еще раз сунуться ко мне!
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_09");	//А теперь - убирайся!
		REGISPISSOFF = TRUE;

		if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE))
		{
			REGISFIGHTNOTOK = TRUE;
			B_LogEntry(TOPIC_VALENTINOHELP,"Регис побил меня.");
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_10");	//Что, малыш - так испугался, что раньше времени наделал в штаны? (смеется)
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_11");	//А ведь мы еще не закончили наш разговор...
		AI_StopProcessInfos(self);
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
		B_Attack(self,other,AR_NONE,0);
	};
};