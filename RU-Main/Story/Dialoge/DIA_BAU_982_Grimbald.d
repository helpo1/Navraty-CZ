
instance DIA_Grimbald_EXIT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 999;
	condition = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_HALLO(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_HALLO_Condition;
	information = DIA_Grimbald_HALLO_Info;
	description = "Ты чего-то ждешь?";
};

func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};


var int Grimbald_PissOff;
var int GrimbaldTellBT;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Ты чего-то ждешь?

	if((Npc_IsDead(Grimbald_Snapper1) == FALSE) && (Npc_IsDead(Grimbald_Snapper2) == FALSE) && (Npc_IsDead(Grimbald_Snapper3) == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Больше нет. Ты ведь уже пришел.
		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO,"Меня ждут дела.",DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO,"Что ты задумал?",DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO,"Почему я?",DIA_Grimbald_HALLO_ich);
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Я охочусь! По-моему это очевидно.
	};
};

func void DIA_Grimbald_HALLO_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Почему я?!
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Похоже, ты сильный человек. Я бы не отказался от твоей помощи.
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_02");	//Все остальные охотники отправились в лагерь - так что, только ты сможешь мне помочь.
};

func void DIA_Grimbald_HALLO_Was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Что ты задумал?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Я хочу поохотиться на снепперов вон там, но боюсь, мне не справиться с ними в одиночку.
	Info_AddChoice(DIA_Grimbald_HALLO,"Можешь не рассчитывать на меня.",DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO,"Хорошо, я помогу тебе! Но ты пойдешь впереди.",DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HALLO_Was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Можешь не рассчитывать на меня.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Тогда проваливай, трус!
	Grimbald_PissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HALLO_Was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Хорошо, я помогу тебе! Но ты пойдешь впереди.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Конечно! Только не приближайся слишком близко к черному троллю. Он разорвет тебя на куски, понял?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//И я не прощу тебя, если ты решишь cбежать.
	GrimbaldTellBT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Jagd");
};

func void DIA_Grimbald_HALLO_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//Меня ждут дела.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Не мели чепуху! Что такого важного может ждать тебя в этой глуши?
};

instance DIA_Grimbald_TrollTell(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_TrollTell_Condition;
	information = DIA_Grimbald_TrollTell_Info;
	permanent = FALSE;
	description = "Что ты знаешь о черном тролле?";
};


func int DIA_Grimbald_TrollTell_Condition()
{
	if((Npc_IsDead(troll_black_ext) == FALSE) && (GrimbaldTellBT == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_TrollTell_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_00");	//Что ты знаешь о черном тролле?
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_01");	//Этот зверь появился здесь очень давно. Он облюбовал ту пещеру, и с тех пор она стала его постоянным логовом.
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_02");	//Он что, всегда сидит в ней?
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_03");	//Не знаю, приятель. Обычно тролли живут высоко в горах, и лишь изредка спускаются в долину.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_04");	//Но этому, похоже, тут нравится. Поэтому он вряд ли уйдет отсюда.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_05");	//Правда, на твоем месте я бы не стал это проверять, приятель.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_06");	//Черный тролль способен разорвать живого человека на множество мелких кусочков!
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_07");	//И даже очень крепкие доспехи едва ли спасут тебя от его огромных лап.
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_08");	//Неужели никто так и не смог убить этого монстра?
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_09");	//Многие уже пытались это сделать, но все они погибли.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_10");	//Пара охотников были последними, кто попробовал бросить ему вызов.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_11");	//Кажется, их тела до сих пор лежат в пещере...
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_12");	//Ясно.
};

instance DIA_Grimbald_Trolltot(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Trolltot_Condition;
	information = DIA_Grimbald_Trolltot_Info;
	important = TRUE;
};


func int DIA_Grimbald_Trolltot_Condition()
{
	if(Npc_IsDead(troll_black_ext))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//Черный тролль мертв! Отличная работа. Я не верил, что его вообще можно убить. Никогда этого не забуду.
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(self,other,"DIA_Grimbald_Trolltot_07_01");	//Мы с ребятами - Фальком и остальными охотниками, поспорили, кто первый из нас его грохнет.
		AI_Output(self,other,"DIA_Grimbald_Trolltot_07_02");	//Но уж точно никто из нас не думал, что это будешь ты!
		AI_Output(self,other,"DIA_Grimbald_Trolltot_07_03");	//Фальк будет удивлен.
	};
};


instance DIA_Grimbald_Jagd(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Jagd_Condition;
	information = DIA_Grimbald_Jagd_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня охотиться?";
};

func int DIA_Grimbald_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimbald_HALLO) && (Grimbald_TeachAnimalTrophy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Jagd_Info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Ты можешь научить меня охотиться?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Ты уже знаешь все, чему я мог научить тебя.
		GrimbaldTeachFinish = TRUE;
	}
	else
	{
		if(HEROISHUNTER == TRUE)
		{
			if((Grimbald_PissOff == FALSE) && (Npc_IsDead(Grimbald_Snapper1) == TRUE) && (Npc_IsDead(Grimbald_Snapper2) == TRUE) && (Npc_IsDead(Grimbald_Snapper3) == TRUE))
			{
				AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Ммм. Хорошо. Ты не особенно-то помог мне, но не стоит быть слишком строгим.
				Grimbald_TeachAnimalTrophy = TRUE;
				Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
				Log_AddEntry(TOPIC_HUNTERTEACHERS,"Гримбальд может научить меня разделывать животных.");
			}
			else
			{
				AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Конечно. Но не бесплатно.
				B_Say_Gold(self,other,200);
				Info_ClearChoices(DIA_Grimbald_Jagd);
				Info_AddChoice(DIA_Grimbald_Jagd,"Хорошо, я подумаю об этом.",DIA_Grimbald_Jagd_zuviel);
				Info_AddChoice(DIA_Grimbald_Jagd,"Договорились, вот твои деньги.",DIA_Grimbald_Jagd_ja);
			};
		}
		else if(Npc_KnowsInfo(other,DIA_Grimbald_Trolltot))
		{
			AI_Output(self,other,"DIA_Grimbald_Jagd_07_03");	//(задумчиво) Ну хорошо! Ты убил черного тролля и для меня честь учить тебя.
			Grimbald_TeachAnimalTrophy = TRUE;
			Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
			Log_AddEntry(TOPIC_HUNTERTEACHERS,"Гримбальд может научить меня разделывать животных.");
		}
		else
		{
			AI_Output(self,other,"DIA_Grimbald_Jagd_07_04");	//(небрежно) Для начала стань охотником, парень. Потом и поговорим.
			AI_StopProcessInfos(self);
		};
	};
};

func void DIA_Grimbald_Jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Хорошо, вот деньги.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Отлично! Скажешь, когда захочешь научиться чему-нибудь.
		Grimbald_TeachAnimalTrophy = TRUE;
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		Log_AddEntry(TOPIC_HUNTERTEACHERS,"Гримбальд может научить меня разделывать животных.");
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Принеси мне деньги, и я готов обучать тебя.
	};
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Как хочешь.
	Info_ClearChoices(DIA_Grimbald_Jagd);
};


instance DIA_Grimbald_TEACHHUNTING(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 12;
	condition = DIA_Grimbald_TEACHHUNTING_Condition;
	information = DIA_Grimbald_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};


func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if((Grimbald_TeachAnimalTrophy == TRUE) && (GrimbaldTeachFinish == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Grimbald_TEACHHUNTING_OneTime;

func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Научи меня охотиться.

	if(DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Что именно ты хочешь узнать?
		Info_AddChoice(DIA_Grimbald_TEACHHUNTING,Dialog_Back,DIA_Grimbald_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать жало кровяного шершня.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Grimbald_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отрезать крылья кровяного шершня.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Grimbald_TEACHHUNTING_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Ломать когти.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Grimbald_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grimbald_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление панцирей ползунов.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Ты уже знаешь все, чему я мог научить тебя.
		GrimbaldTeachFinish = TRUE;
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn_03_01");	//Ты втыкаешь нож глубоко в лоб зверя и, как рычагом, осторожно, вытаскиваешь эту штуку.
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn_03_02");	//Если он не отрывается от черепа, тогда тебе нужно воспользоваться вторым ножом с другой стороны.
		CreateInvItems(Gaans_Snapper,ItAt_DrgSnapperHorn,1);
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Вырезать жало кровавой мухи довольно просто. Тебе нужно найти его основание и с силой воткнуть туда нож.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Крылья кровавой мухи можно вырвать или вырезать при помощи острого ножа.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Есть несколько способов вырезать когти. Для одних животных необходим сильный точный удар ножом, а у других их нужно вырезать очень аккуратно.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//У ползунов и полевых хищников сильные мандибулы, которые можно отделить от головы сильным точным ударом.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Панцири с ползунов снять нелегко, но это все же можно сделать при помощи острого прочного предмета.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};


instance DIA_Grimbald_NovChase(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_NovChase_Condition;
	information = DIA_Grimbald_NovChase_Info;
	description = "Ты не видел здесь послушника?";
};


func int DIA_Grimbald_NovChase_Condition()
{
	if(MIS_NovizenChase == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Ты не видел здесь послушника?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Сегодня здесь прошло много разных странных личностей, включая тех двух клоунов у каменной арки.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//А недавно с ними о чем-то разговаривал послушник магов Огня.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_PICKPOCKET(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 900;
	condition = DIA_Grimbald_PICKPOCKET_Condition;
	information = DIA_Grimbald_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grimbald_PICKPOCKET_Condition()
{
	return C_Beklauen(85,250);
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,Dialog_Back,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};


instance DIA_GRIMBALD_RESPECT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_respect_condition;
	information = dia_grimbald_respect_info;
	permanent = FALSE;
	description = "Мне нужна твоя поддержка.";
};


func int dia_grimbald_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (GRIMBALD_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_respect_info()
{
	AI_Output(other,self,"DIA_Grimbald_Respect_01_00");	//Мне нужна твоя поддержка.
	AI_Output(self,other,"DIA_Grimbald_Respect_01_01");	//(удивленно) Что ты задумал, парень?
	AI_Output(other,self,"DIA_Grimbald_Respect_01_02");	//Я хочу бросить Фальку вызов за звание лучшего охотника.
	AI_Output(other,self,"DIA_Grimbald_Respect_01_03");	//Ты проголосуешь за меня?

	if(Npc_IsDead(troll_black_ext))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Grimbald_Respect_01_04");	//Почему бы и нет. В конце концов, именно ты завалил черного тролля, а не Фальк.
		AI_Output(self,other,"DIA_Grimbald_Respect_01_05");	//Так что можешь рассчитывать на мой голос.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_06");	//Спасибо.
		GRIMBALD_RESPECT = TRUE;
		B_LogEntry(TOPIC_HUNTERSWORK,"Гримбальд отдаст за меня свой голос в споре с Фальком.");
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Respect_01_07");	//Почему бы и нет. Но сначала ты должен доказать мне, что достоин этого.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_08");	//И что я должен сделать?
		AI_Output(self,other,"DIA_Grimbald_Respect_01_09");	//Завали того черного тролля! Если сможешь сделать это, то я отдам за тебя свой голос.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_10");	//Хорошо.
	};
};

instance DIA_GRIMBALD_RESPECTDONE(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_respectdone_condition;
	information = dia_grimbald_respectdone_info;
	permanent = FALSE;
	description = "Черный тролль мертв!";
};

func int dia_grimbald_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_respect) && (CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GRIMBALD_RESPECT == FALSE) && Npc_IsDead(troll_black_ext))
	{
		return TRUE;
	};
};

func void dia_grimbald_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Grimbald_RespectDone_01_00");	//Черный тролль мертв! Теперь я могу рассчитывать на твою поддержку?
	AI_Output(self,other,"DIA_Grimbald_RespectDone_01_01");	//Конечно, как и договаривались!
	GRIMBALD_RESPECT = TRUE;
	B_LogEntry(TOPIC_HUNTERSWORK,"Гримбальд отдаст за меня свой голос в споре с Фальком.");
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

instance DIA_GRIMBALD_Furs(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_condition;
	information = dia_grimbald_Furs_info;
	permanent = FALSE;
	description = "Мне нужны овечьи шкуры.";
};

func int dia_grimbald_Furs_condition()
{
	if(MIS_TiraksFur == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_info()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_01_00");	//Мне нужны овечьи шкуры.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_01");	//Хорошо. И что с того?
	AI_Output(other,self,"DIA_Grimbald_Furs_01_02");	//Они у тебя есть? 
	AI_Output(self,other,"DIA_Grimbald_Furs_01_03");	//(непонимающе) А откуда им взяться?
	AI_Output(other,self,"DIA_Grimbald_Furs_01_04");	//Но ты же охотник. Разве нет?
	AI_Output(self,other,"DIA_Grimbald_Furs_01_05");	//Все правильно, приятель. Я охотник, а не фермер! Или ты видишь рядом со мной стадо овец?
	AI_Output(other,self,"DIA_Grimbald_Furs_01_06");	//Ну, я надеялся, что у тебя где-нибудь завалялась парочка-другая.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_07");	//Нет, парень. Ты и сам уже понял, что обратился не по адресу.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_08");	//Единственные шкуры, которые у меня есть, это шкуры хищных тварей, на которых я охочусь тут.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_09");	//Так что, если хочешь, могу предложить их.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_10");	//А они достаточно хороши, чтобы согреть ночью?
	AI_Output(self,other,"DIA_Grimbald_Furs_01_12");	//Более чем! Единственная причина, по которой люди покупают овечьи шкуры, - они довольно дешевые.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_13");	//А те, у кого водятся настоящие деньги, предпочитают более дорогие шкуры мракорисов, варгов и даже троллей.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_14");	//Даже так?
	AI_Output(self,other,"DIA_Grimbald_Furs_01_15");	//Я врать не буду. Правда, сейчас у меня с собой остались только шкуры мракорисов.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_16");	//Поэтому могу тебе предложить только их.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_17");	//Ладно. И сколько стоят твои шкуры?

	if(HEROISHUNTER == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Grimbald_Furs_01_18");	//Ну, поскольку ты все-таки один из нас, то я отдам тебе их бесплатно.
		AI_Output(self,other,"DIA_Grimbald_Furs_01_19");	//Вот, держи. Надеюсь, они тебе пригодятся.
		B_GiveInvItems(self,other,ItAt_ShadowFur,2);
		AI_Output(other,self,"DIA_Grimbald_Furs_01_20");	//Отличные шкуры! Благодарю тебя.
		AI_Output(self,other,"DIA_Grimbald_Furs_01_21");	//Да не за что...
		GrimbaldTellSellFur = TRUE;
		B_LogEntry(TOPIC_TiraksFur,"У Гримбальда не оказалось овечьих шкур. Однако он подарил мне две шкуры мракориса, сказав, что они согреют от холода не хуже, чем овечьи.");
	}
	else if(Npc_IsDead(troll_black_ext) == TRUE)
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Grimbald_Furs_01_22");	//Ну...(задумчиво) Поскольку именно ты убил черного тролля, то я отдам тебе их бесплатно.
		AI_Output(self,other,"DIA_Grimbald_Furs_01_23");	//Но только одну. Вот, держи.
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		AI_Output(other,self,"DIA_Grimbald_Furs_01_24");	//Отличная шкура. А сколько стоит вторая?
		AI_Output(self,other,"DIA_Grimbald_Furs_01_25");	//Для тебя две сотни золотых. И поверь мне, это честная цена.
		GrimbaldSellFur = TRUE;
		B_LogEntry(TOPIC_TiraksFur,"У Гримбальда не оказалось овечьих шкур. Однако он подарил мне шкуру мракориса, сказав, что она согреет от холода не хуже, чем овечья. Если я захочу заполучить еще одну, то мне придется заплатить за нее двести золотых монет.");
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_01_27");	//Для тебя две сотни золотых за каждую. И поверь мне, это честная цена.
		B_LogEntry(TOPIC_TiraksFur,"У Гримбальда не оказалось овечьих шкур. Однако он предложил мне купить у него шкуры мракориса, сказав, что они согреют от холода не хуже, чем овечьи. Но мне придется заплатить за каждую из них по двести золотых монет.");
		GrimbaldSellFurAll = TRUE;
	};
};

instance DIA_GRIMBALD_Furs_Tell(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_Tell_condition;
	information = dia_grimbald_Furs_Tell_info;
	permanent = FALSE;
	description = "А ты можешь продать мне еще шкур?";
};

func int dia_grimbald_Furs_Tell_condition()
{
	if(GrimbaldTellSellFur == TRUE)
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_Tell_info()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Tell_01_00");	//А ты можешь продать мне еще шкур?
	AI_Output(self,other,"DIA_Grimbald_Furs_Tell_01_01");	//Конечно. Но на этот раз тебе придется заплатить за них.
	GrimbaldSellFur = TRUE;
};

instance DIA_GRIMBALD_Furs_Trade(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_Trade_condition;
	information = dia_grimbald_Furs_Trade_info;
	permanent = TRUE;
	description = "Я хочу купить у тебя шкуры.";
};

func int dia_grimbald_Furs_Trade_condition()
{
	if((GrimbaldSellFur == TRUE) || (GrimbaldSellFurAll == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_Trade_info()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_01_00");	//Я хочу купить у тебя шкуры.

	if(KapitelGrimbaldSell == Kapitel)
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_01");	//Сейчас у меня пока что не осталось шкур на продажу. Приходи позже.
	}
	else
	{
		if(MIS_TiraksFur == LOG_Running)
		{
			AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_03");	//Как я уже говорил, шкура мракориса тебе обойдется в двести золотых.
			AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_04");	//У тебя есть такие деньги?
			Info_ClearChoices(DIA_Grimbald_Furs_Trade);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Пока нет.",DIA_Grimbald_Furs_Trade_no);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Вот твои деньги.",DIA_Grimbald_Furs_Trade_geld);
		}
		else
		{
			AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_05");	//Хорошо. Какую шкуру ты хотел бы купить?
			Info_ClearChoices(DIA_Grimbald_Furs_Trade);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Я передумал.",DIA_Grimbald_Furs_Trade_NoSale);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Шкура варга (Цена: 100 монет)",DIA_Grimbald_Furs_Trade_Warg);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Шкура мракориса (Цена: 200 монет)",DIA_Grimbald_Furs_Trade_Shadow);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Шкура тролля (Цена: 500 монет)",DIA_Grimbald_Furs_Trade_troll);
		};
	};
};

func void DIA_Grimbald_Furs_Trade_geld()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_geld_15_00");	//Вот твои деньги.

	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_geld_17_01");	//Очень хорошо! Вот, шкура твоя.
		CreateInvItems(self,ItAt_ShadowFur,1);
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_geld_17_02");	//Благодарю.
		KapitelGrimbaldSell = Kapitel;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_geld_17_03");	//Пока у тебя не будет нужной суммы, я даже разговаривать об этом не буду.
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};


func void DIA_Grimbald_Furs_Trade_Warg()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Warg_15_00");	//Я хочу купить шкуру варга.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Warg_17_01");	//Хорошо, шкура твоя. Забирай!
		CreateInvItems(self,ItAt_WargFur,1);
		B_GiveInvItems(self,other,ItAt_WargFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,100);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Warg_17_02");	//Спасибо.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			KapitelGrimbaldSell = Kapitel;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Warg_17_03");	//Но у тебя же недостаточно золота.
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Warg_17_04");	//Так что не пытайся обмануть меня!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_Shadow()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Shadow_15_00");	//Я хочу купить шкуру мракориса.

	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Shadow_17_01");	//Хорошо, шкура твоя. Забирай!
		CreateInvItems(self,ItAt_ShadowFur,1);
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Shadow_17_02");	//Спасибо.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			KapitelGrimbaldSell = Kapitel;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Shadow_17_03");	//Но у тебя же недостаточно золота.
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Shadow_17_04");	//Так что не пытайся обмануть меня!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_troll()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_troll_15_00");	//Я хочу купить шкуру тролля.

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_troll_17_01");	//Хорошо, шкура твоя. Забирай!
		CreateInvItems(self,ItAt_TrollFur,1);
		B_GiveInvItems(self,other,ItAt_TrollFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_troll_17_02");	//Спасибо.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			KapitelGrimbaldSell = Kapitel;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_troll_17_03");	//Но у тебя же недостаточно золота.
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_troll_17_04");	//Так что не пытайся обмануть меня!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_NoSale()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_NoSale_15_00");	//Я передумал.
	AI_Output(self,other,"DIA_Grimbald_Furs_Trade_NoSale_17_01");	//Ладно, как знаешь.
	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};


func void DIA_Grimbald_Furs_Trade_no()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_no_15_00");	//Пока нет.
	AI_Output(self,other,"DIA_Grimbald_Furs_Trade_no_17_01");	//Тогда нам не о чем говорить.
	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};
