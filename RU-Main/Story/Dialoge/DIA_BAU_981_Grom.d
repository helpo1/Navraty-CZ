
instance DIA_Grom_EXIT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 999;
	condition = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grom_HALLO(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = DIA_Grom_HALLO_Condition;
	information = DIA_Grom_HALLO_Info;
	description = "Все в порядке?";
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Все в порядке?
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(self,other,"DIA_Grom_HALLO_08_02");	//Вроде нормально, приятель!
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Ах, незнакомый странник...(сухо) Я очень занят. Что ты хочешь?
	};
};


instance DIA_Grom_HALLO_waszusehen(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_hallo_waszusehen_condition;
	information = dia_grom_hallo_waszusehen_info;
	description = "Что интересного здесь можно увидеть?";
};


func int dia_grom_hallo_waszusehen_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void dia_grom_hallo_waszusehen_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_Waszusehen_15_00");	//Что интересного здесь можно увидеть?
	AI_Output(self,other,"DIA_Grom_HALLO_Waszusehen_08_01");	//Интересное - это хорошо сказано. Если ты углубишься в здешний лес, то наткнешься на очень злобных парней.
	AI_Output(self,other,"DIA_Grom_HALLO_Waszusehen_08_02");	//Они около десяти футов высотой, волосатые и в очень дурном расположении духа. Так что лучше не ходи туда, если не считаешь, что достаточно силен.
};


instance DIA_Grom_HALLO_was(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_hallo_was_condition;
	information = dia_grom_hallo_was_info;
	description = "Что ты здесь делаешь?";
};


func int dia_grom_hallo_was_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_grom_hallo_was_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_Was_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_01");	//А что, по-твоему, может здесь делать охотник? Охочусь, конечно!
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_02");	//Фальк заказал мне парочку шкур горных троллей.
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_03");	//Вот я и околачиваюсь тут - жду удобного момента, чтобы грохнуть этих тварей!
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_04");	//Если бы не этот заказ, я бы уже давно сидел в лагере - ел вкусное мясо и пил холодное пиво.
	MIS_GROMTROLLS = LOG_Running;
	Log_CreateTopic(TOPIC_GROMTROLLS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMTROLLS,LOG_Running);
	B_LogEntry(TOPIC_GROMTROLLS,"Охотнику Грому нужны две шкуры тролля. Я мог бы помочь ему раздобыть их.");
};


instance DIA_GROM_TROLLFUR(C_Info)
{
	npc = BAU_981_Grom;
	nr = 2;
	condition = dia_grom_trollfur_condition;
	information = dia_grom_trollfur_info;
	permanent = FALSE;
	description = "У меня есть для тебя несколько шкур троллей.";
};


func int dia_grom_trollfur_condition()
{
	if((MIS_GROMTROLLS == LOG_Running) && (Npc_HasItems(other,ItAt_TrollFur) >= 2))
	{
		return TRUE;
	};
};

func void dia_grom_trollfur_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Grom_TrollFur_01_00");	//У меня есть для тебя несколько шкур троллей.
	AI_Output(self,other,"DIA_Grom_TrollFur_01_01");	//Парень, откуда они у тебя? Ты что, на них охотишься? Это же чертовски опасно!
	AI_Output(self,other,"DIA_Grom_TrollFur_01_03");	//Спасибо тебе. А то я думал, что застрял тут навсегда. Давай их сюда.
	AI_Output(other,self,"DIA_Grom_TrollFur_01_04");	//Вот, держи.
	B_GiveInvItems(other,self,ItAt_TrollFur,2);
	AI_Output(self,other,"DIA_Grom_TrollFur_01_05");	//Отлично! Я дам тебе за них пятьсот монет. Это намного больше, чем тебе предложат торговцы в городе.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Grom_TrollFur_01_06");	//Ну, а мне пора возвращаться в лагерь. Еще увидимся!
	MIS_GROMTROLLS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GROMTROLLS,LOG_SUCCESS);
	B_LogEntry(TOPIC_GROMTROLLS,"Я принес Грому пару шкур горных троллей.");
	Npc_ExchangeRoutine(self,"GotoHunters");
	Info_ClearChoices(dia_grom_trollfur);
	AI_StopProcessInfos(self);
};


instance DIA_Grom_AskTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 10;
	condition = DIA_Grom_AskTeacher_Condition;
	information = DIA_Grom_AskTeacher_Info;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Grom_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Конечно. Но сначала принеси мне приличной еды. Я умираю от голода.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Я хочу бутыль молока, буханку хлеба и жирный окорок. И тогда я научу тебя всему, что сам знаю.
	MIS_GROMASKTEACHER = LOG_Running;
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher,"Охотник Гром научит меня всему, что знает, если я принесу ему бутылку молока, буханку хлеба и окорок.");
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = "Вот еда, как ты просил.";
};


func int DIA_Grom_PayTeacher_Condition()
{
	if((MIS_GROMASKTEACHER == LOG_Running) && Npc_HasItems(other,ItFo_Milk) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Bacon))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Вот еда, как ты и просил.
	if(B_GiveInvItems(other,self,ItFo_Milk,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_01");	//Молоко.
	};
	if(B_GiveInvItems(other,self,ItFo_Bread,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_02");	//Хлеб.
	};
	if(B_GiveInvItems(other,self,ItFo_Bacon,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_03");	//Окорок.
	};
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Отлично, и что теперь?
	Grom_TeachAnimalTrophy = TRUE;
	MIS_GROMASKTEACHER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_SUCCESS);
	B_LogEntry(TOPIC_GromAskTeacher,"Я принес Грому немного поесть.");
};

var int GromTeachFinish;

instance DIA_Grom_TEACHHUNTING(C_Info)
{
	npc = BAU_981_Grom;
	nr = 12;
	condition = DIA_Grom_TEACHHUNTING_Condition;
	information = DIA_Grom_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};

func int DIA_Grom_TEACHHUNTING_Condition()
{
	if((Grom_TeachAnimalTrophy == TRUE) && (GromTeachFinish == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Научи меня охотиться.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Что ты хочешь узнать?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать сердце",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог мракориса",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),dia_grom_teachhunting_firetongue);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Мне нечему учить тебя. Ты и так уже все знаешь.
		GromTeachFinish = TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Сделай разрез вдоль ног животного, чтобы ты мог снять с него шкуру. Снимай ее с зада наперед, а не наоборот.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Челюсть животного нужно вынимать осторожно, чтобы не разломить ее, когда она отделяется от черепа.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Ты можешь вырезать сердце животного, сделав глубокий разрез в его грудной клетке. Но обычно это имеет смысл только в случае особых животных или магических существ.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Мандибулы ползуна или полевого хищника нужно отделять при помощи очень прочного металлического рычага. Они очень глубоко сидят в черепе этих животных.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Чтобы отделить рог мракориса, надави на него всем своим весом, подрезая при этом основание острым ножом.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void dia_grom_teachhunting_firetongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_FireTongue_08_00");	//Язык огненной ящерицы нужно отрезать хорошо наточенным ножом, крепко держа другой рукой пасть этой твари.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};


instance DIA_Grom_PICKPOCKET(C_Info)
{
	npc = BAU_981_Grom;
	nr = 900;
	condition = DIA_Grom_PICKPOCKET_Condition;
	information = DIA_Grom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grom_PICKPOCKET_Condition()
{
	return C_Beklauen(75,40);
};

func void DIA_Grom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
	Info_AddChoice(DIA_Grom_PICKPOCKET,Dialog_Back,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};


instance DIA_GROM_RESPECT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 1;
	condition = dia_grom_respect_condition;
	information = dia_grom_respect_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь.";
};


func int dia_grom_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GROM_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void dia_grom_respect_info()
{
	AI_Output(other,self,"DIA_Grom_Respect_01_01");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Grom_Respect_01_02");	//А в чем, собственно, дело?
	AI_Output(other,self,"DIA_Grom_Respect_01_03");	//Я хочу вызвать Фалька на поединок и мне необходимо заручиться поддержкой других охотников.
	AI_Output(self,other,"DIA_Grom_Respect_01_04");	//Бросить вызов самому Фальку - это очень смелый поступок!
	AI_Output(self,other,"DIA_Grom_Respect_01_05");	//Он же самый лучший охотник в этом лагере, и я не думаю, что у тебя есть хоть какие-то шансы его победить.
	AI_Output(other,self,"DIA_Grom_Respect_01_06");	//Мне это уже говорили, но я не собираюсь отказываться от этой идеи.
	AI_Output(self,other,"DIA_Grom_Respect_01_07");	//Хммм...(задумчиво) Ну, если ты так уверен в своих силах, то, конечно, я бы мог помочь тебе.
	AI_Output(self,other,"DIA_Grom_Respect_01_08");	//Но не просто так. В конце концов, все в этой жизни надо заслужить - и мою поддержку тоже.
	AI_Output(other,self,"DIA_Grom_Respect_01_09");	//И что я должен сделать?
	AI_Output(self,other,"DIA_Grom_Respect_01_10");	//Просто принести мне какой-нибудь редкий охотничий трофей.
	AI_Output(self,other,"DIA_Grom_Respect_01_11");	//Если ты хороший охотник, то для тебя это не составит особого труда.
	AI_Output(other,self,"DIA_Grom_Respect_01_12");	//А какой именно трофей тебе нужен?
	AI_Output(self,other,"DIA_Grom_Respect_01_13");	//Я же сказал - редкий! Например, большое яйцо ползуна.
	AI_Output(self,other,"DIA_Grom_Respect_01_14");	//Эту вещицу днем с огнем не сыщещь, да и битва с ползунами чертовски тяжела. Достойный трофей!
	AI_Output(other,self,"DIA_Grom_Respect_01_15");	//Хорошо, договорились.
	B_LogEntry(TOPIC_HUNTERSWORK,"Я получу согласие Грома, если принесу ему яйцо ползуна.");
};


instance DIA_GROM_RESPECTDONE(C_Info)
{
	npc = BAU_981_Grom;
	nr = 1;
	condition = dia_grom_respectdone_condition;
	information = dia_grom_respectdone_info;
	permanent = FALSE;
	description = "Я принес тебе яйцо ползуна.";
};


func int dia_grom_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_respect) && (CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GROM_RESPECT == FALSE) && (Npc_HasItems(other,itat_crawlerqueen) >= 1))
	{
		return TRUE;
	};
};

func void dia_grom_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Grom_RespectDone_01_00");	//Я принес тебе яйцо ползуна.
	AI_Output(self,other,"DIA_Grom_RespectDone_01_01");	//И где же оно?
	AI_Output(other,self,"DIA_Grom_RespectDone_01_02");	//Вот, держи.
	B_GiveInvItems(other,self,itat_crawlerqueen,1);
	AI_Output(self,other,"DIA_Grom_RespectDone_01_03");	//Хммм...(разглядывая) Похоже, это действительно оно - большое яйцо ползуна.
	AI_Output(self,other,"DIA_Grom_RespectDone_01_04");	//Я, честно говоря, и не думал, что тебе это удастся сделать. Ты удивил меня!
	AI_Output(other,self,"DIA_Grom_RespectDone_01_05");	//Значит, теперь я могу рассчитывать на твою поддержку?
	AI_Output(self,other,"DIA_Grom_RespectDone_01_06");	//Как и договаривались, приятель. Если Фальк меня спросит о тебе, он услышит только хорошее. 
	GROM_RESPECT = TRUE;
	B_LogEntry(TOPIC_HUNTERSWORK,"Я принес Грому яйцо ползуна. Теперь Гром поддержит меня в споре с Фальком.");
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

