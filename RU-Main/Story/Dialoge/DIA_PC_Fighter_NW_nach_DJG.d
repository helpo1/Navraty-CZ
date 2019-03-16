
instance DIA_GornNW_nach_DJG_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 999;
	condition = DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information = DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_nach_DJG_AllDragonsDead(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 59;
	condition = DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information = DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Ты спокоен?";
};


func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if((Gorn_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Ты спокоен?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Конечно, а почему нет? Драконы ведь мертвы, разве не так?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Все немного сложнее.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(смеется) Ладно. Все как всегда. Дай мне знать, если тебе понадобится мой топор.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Мне нужны ты и твой топор.";
};


func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Gorn_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Мне нужны ты и твой топор.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Хорошо. Я не удивлен. Что я могу сделать для тебя?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Ты поплывешь со мной на другой остров? Нужно кое-кому надрать задницу.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(смеется) Конечно. Всегда готов. Просто скажи, что нужно делать.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Горн был готов на все, когда я рассказал ему об острове. Если мне понадобится его топор, я могу взять его с собой.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Сейчас моя команда почти укомплектована, но я думаю, что тебе тоже могло бы найтись место на борту.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Если тебе придется вышвырнуть кого-нибудь из своей команды ради меня - выбери самого слабого.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//В наше суровое время, нельзя разбрасываться людьми, способными крепко держать оружие в руках.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Я дам тебе знать, когда придет время.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Добро пожаловать на борт. Встретимся в гавани.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт. Встретимся в гавани.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Корабль? Ха! Могу сказать одно. С тобой никогда не бывает скучно. До скорой встречи.
	B_GivePlayerXP(XP_Crewmember_Success);
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//Хорошо.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};


instance DIA_GornNW_nach_DJG_LeaveMyShip(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information = DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Возможно, тебе лучше остаться здесь.";
};


func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if((Gorn_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Возможно, тебе лучше остаться здесь.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Ты хочешь, чтобы я отпустил тебя одного? Ммм. Мне нелегко это сделать, но это твоя война. Найди меня, если решишь, что я все же тебе нужен.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornNW_nach_DJG_StillNeedYou(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information = DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся. ТЫ нужен мне.";
};


func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if((Gorn_IsOnBoard == LOG_OBSOLETE) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Возвращайся. Ты мне нужен!
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//Ну. А я уже думал, что ты хочешь оставить меня здесь одного, пока ты будешь заниматься этим всем. До скорого.
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Fighter_nach_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 900;
	condition = DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};


instance DIA_FIGHTER_NACH_DJG_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_kapitelorcattack_condition;
	information = dia_fighter_nach_djg_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Остаешься сражаться?";
};


func int dia_fighter_nach_djg_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (FIGHTERBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_00");	//Остаешься сражаться?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_01");	//Конечно! А ты что, в этом сомневался?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_04");	//Без этого мой топор скоро просто-напросто заржавеет.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_05");	//Эх, руки сейчас прям так и чешутся! Мне только дай добраться до этих тварей - уж я им тогда покажу, с кем они связались.
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_10");	//Твоя уверенность вполне внушает доверие. Тогда увидимся позже!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_11");	//Конечно, приятель.
	B_LogEntry(TOPIC_HELPCREW,"Как я и предполагал, Горн остается вместе с теми, кто будет прорываться из города с боем. Уверен, что ему удастся выбраться из этой заварушки живым.");
	FIGHTERBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_ESCAPE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_escape_condition;
	information = dia_fighter_nach_djg_nw_escape_info;
	permanent = FALSE;
	description = "Рад тебя видеть живым и здоровым!";
};


func int dia_fighter_nach_djg_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Gorn_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_01");	//Рад тебя видеть!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_02");	//По правде говоря, я тебя тоже!
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_03");	//Так значит, вам удалось прорваться через город?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_04");	//Мне, как видишь, удалось! Однако не всем так повезло.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_05");	//Многих из нас орки взяли в плен...(печально) Что теперь они с ними сделают одному только Инносу известно!
			B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я повстречался с Горном - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда, не обошлось и без плохих! Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Надеюсь они еще живы!");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_06");	//Многих из нас орки взяли в плен. Есть и те, кто погиб, сражаясь с ними!
			B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я повстречался с Горном - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда, не обошлось и без плохих! Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Есть и те, кто погиб.");
		};
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_07");	//Да, это не очень хорошие новости.
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_08");	//С этим ничего уже не поделаешь.
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_09");	//Понимаю.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_10");	//Как видишь! И, насколько мне известно, - это удалось всем, кто был тогда на корабле.
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_11");	//Да это просто отличные новости!
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_12");	//Я с тобой согласен. Даже теперь и не знаю, кого благодарить за столь чудесное спасение!
		B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я вновь повстречался с Горном - живым и здоровым. Это хорошая новость! Как и то, что всем остальным парням также удалось выбраться из города.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_FIGHTER_NACH_DJG_NW_SOONBATTLE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_soonbattle_condition;
	information = dia_fighter_nach_djg_nw_soonbattle_info;
	permanent = FALSE;
	description = "Орки не оставят эту ферму в покое!";
};


func int dia_fighter_nach_djg_nw_soonbattle_condition()
{
	if((MIS_HELPCREW == LOG_SUCCESS) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_soonbattle_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_00");	//Орки не оставят эту ферму в покое! Наверняка скоро нам придется сражаться с ними.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_01");	//Очень на это надеюсь! А то мой топор уже заждался того момента, когда снова сможет прикончить парочку из них.
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_02");	//Ты неисправим! Но мне нравится твой настрой.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_03");	//(смеется) Ты ведь меня знаешь, приятель!
};


instance DIA_FIGHTER_NACH_DJG_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_soonbattlenow_condition;
	information = dia_fighter_nach_djg_nw_soonbattlenow_info;
	permanent = FALSE;
	description = "Как настрой перед боем?";
};


func int dia_fighter_nach_djg_nw_soonbattlenow_condition()
{
	if((STOPBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_soonbattlenow_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_SoonBattleNow_01_00");	//Как настрой перед боем?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_SoonBattleNow_01_01");	//Не волнуйся, я готов! Главное, чтобы орки не передумали нас атаковать.
};


instance DIA_FIGHTER_NACH_DJG_NW_BATTLEWIN(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_battlewin_condition;
	information = dia_fighter_nach_djg_nw_battlewin_info;
	permanent = FALSE;
	description = "Мы победили!";
};


func int dia_fighter_nach_djg_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_BattleWin_01_00");	//Мы победили!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_BattleWin_01_01");	//Да, приятель... Это была славная битва! Давно я так не упражнялся со своим топором.
	if(HORINISISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_BattleWin_01_02");	//Но радоваться пока еще рано. Насколько я знаю, орки до сих пор контролируют город!
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_BattleWin_01_03");	//Я думаю, теперь мы и с этим справимся.
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_BattleWin_01_04");	//Само собой...(смеется) Так что, если что, мой топор всегда к твоим услугам.
	};
};


instance DIA_FIGHTER_NACH_DJG_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_goonorkshunt_condition;
	information = dia_fighter_nach_djg_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Не хочешь вместе со мной поохотиться на орков?";
};


func int dia_fighter_nach_djg_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (GORNTOBIGLAND == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_fighter_nach_djg_nw_battlewin))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_00");	//Не хочешь поохотиться со мной на орков?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_01");	//И ты еще спрашиваешь? Конечно хочу!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_02");	//Мой топор всегда плачет по этим тварям.
	GORNJOINMEHUNT = TRUE;
};


instance DIA_FIGHTER_NACH_DJG_NW_FOLLOWME(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_followme_condition;
	information = dia_fighter_nach_djg_nw_followme_info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int dia_fighter_nach_djg_nw_followme_condition()
{
	if((GORNJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_followme_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_FollowMe_01_00");	//Иди за мной!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_FollowMe_01_01");	//Вперед, приятель.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_STOPHERE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_stophere_condition;
	information = dia_fighter_nach_djg_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_fighter_nach_djg_nw_stophere_condition()
{
	if((GORNJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_StopHere_01_01");	//Эй, но мы ведь только начали! Я даже не успел толком размяться!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_StopHere_01_03");	//Эх! Ладно, как скажешь.
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_allgreatvictory_condition;
	information = dia_fighter_nach_djg_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Полагаю, что скоро ты опять заскучаешь.";
};


func int dia_fighter_nach_djg_nw_allgreatvictory_condition()
{
	if((ALLGREATVICTORY == TRUE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_00");	//Полагаю, что скоро ты опять заскучаешь.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_01");	//Это еще почему?
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_02");	//Просто в этой части острова больше не осталось ни одного орка!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_03");	//Ну, ничего страшного. Наверняка в Долине Рудников их еще полным полно.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_06");	//Так что надо будет как-нибудь туда заглянуть!
};


instance DIA_FIGHTER_NACH_DJG_NW_WHATDONOW(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_whatdonow_condition;
	information = dia_fighter_nach_djg_nw_whatdonow_info;
	permanent = FALSE;
	description = "Какие ближайшие планы?";
};


func int dia_fighter_nach_djg_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_WhatDoNow_01_00");	//Какие ближайшие планы?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_WhatDoNow_01_01");	//Думаю, что я пока останусь с Ли. Мне все равно больше некуда идти, приятель.
};


instance DIA_FIGHTER_NACH_DJG_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_travelonbigland_condition;
	information = dia_fighter_nach_djg_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Я плыву на материк. Ты со мной?";
};


func int dia_fighter_nach_djg_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_00");	//Я плыву на материк. Ты со мной?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_01");	//Конечно...(улыбаясь) Ты еще спрашиваешь!
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_02");	//Правда, поговаривают, что там сейчас полным полно орков.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_03");	//Это мне и надо, приятель! А тут я просто с ума от скуки сойду!
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_04");	//Тогда встретимся на корабле.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	GORNTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Как я и предполагал, Горн плывет вместе со мной.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

