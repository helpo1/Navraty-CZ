instance DIA_HUN_741_FALK_EXIT(C_Info)
{
	npc = hun_741_falk;
	nr = 999;
	condition = dia_hun_741_falk_exit_condition;
	information = dia_hun_741_falk_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_hun_741_falk_exit_condition()
{
	return TRUE;
};

func void dia_hun_741_falk_exit_info()
{
	AI_StopProcessInfos(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};

instance DIA_HUN_741_FALK_BACKSWORD(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_backsword_condition;
	information = dia_hun_741_falk_backsword_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_741_falk_backsword_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(self,itmw_2h_master_01) == 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_backsword_info()
{
	AI_Output(self,other,"DIA_HUN_741_Falk_BackSword_01_00");	//Прежде чем мы что-то обсудим, тебе необходимо сделать одну вещь.
	AI_Output(other,self,"DIA_HUN_741_Falk_BackSword_01_01");	//Какую именно?
	AI_Output(self,other,"DIA_HUN_741_Falk_BackSword_01_02");	//(грозно) Вернуть мне мой меч!
	Info_ClearChoices(dia_hun_741_falk_backsword);

	if(Npc_HasItems(other,itmw_2h_master_01) > 0)
	{
		Info_AddChoice(dia_hun_741_falk_backsword,"Держи свой меч!",dia_hun_741_falk_backsword_yes);
	};

	Info_AddChoice(dia_hun_741_falk_backsword,"Как же!",dia_hun_741_falk_backsword_no);
};

func void dia_hun_741_falk_backsword_yes()
{
	B_GiveInvItems(other,self,itmw_2h_master_01,1);
	Npc_RemoveInvItems(other,itmw_2h_master_01,Npc_HasItems(other,itmw_2h_master_01));
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Держи.
	AI_Output(self,other,"DIA_Falk_BackSword_06_01");	//Как раз вовремя!
	Info_ClearChoices(dia_hun_741_falk_backsword);
};

func void dia_hun_741_falk_backsword_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Я думаю, он пока останется у меня.
	AI_Output(self,other,"DIA_Falk_KeepIt_06_03");	//Ну подожди, ублюдок!
	Info_ClearChoices(dia_hun_741_falk_backsword);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_HUN_741_FALK_HELLO(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_hello_condition;
	information = dia_hun_741_falk_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_741_falk_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hello_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_00");	//Эй, приятель! Ты тоже охотник?
		AI_Output(other,self,"DIA_HUN_741_Falk_Hello_01_01");	//С чего ты взял?
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_02");	//На тебе охотничья одежда. Только охотники носят такие доспехи.
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_04");	//Мы всегда рады видеть в нашем лагере парней вроде тебя.
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_05");	//Давай, присаживайся поближе к огоньку, отдохни с дороги...
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_06");	//Эй, ты кто? И что ты тут ошиваешься?
		AI_Output(other,self,"DIA_HUN_741_Falk_Hello_01_07");	//Я? Да так, просто прогуливаюсь, дышу воздухом...
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_08");	//Малыш, здесь довольно опасно для таких слабаков, как ты!
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_11");	//Дам тебе совет: поищи себе другое место для прогулок.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_741_FALK_NEWS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_news_condition;
	information = dia_hun_741_falk_news_info;
	permanent = TRUE;
	description = "Что нового в лагере?";
};

func int dia_hun_741_falk_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_news_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_News_01_00");	//Что нового в лагере?

	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_01");	//В последнее время ничего такого здесь не происходило.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_02");	//Ну, за исключением того, что в нашем лагере появился новый охотник.
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_03");	//Ты имеешь в виду меня, я прав?
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_04");	//Конечно...(смеется) Я знал, что ты сообразительный парень.
	}
	else if((Kapitel == 2) && (MIS_INSORCWARRIOR == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_07");	//Недавно Барем и Раффа, возвращаясь обратно в лагерь, наткнулись в лесу на небольшой отряд орков.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_08");	//Ребята еле ноги унесли от этих тварей. Причем орков было не меньше десяти.
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_09");	//И что здесь такого удивительного?
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_10");	//Как что? Да в этих местах отродясь не водилось столько орков, да еще и вооруженных до зубов!
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_12");	//Где именно они встретили этих тварей?
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_13");	//Кажется, Барем говорил, что это случилось недалеко от фермы Акила. Но на твоем месте я даже и не думал бы связываться с ними.
		MIS_INSORCWARRIOR = LOG_Running;
		Log_CreateTopic(TOPIC_INSORCWARRIOR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSORCWARRIOR,LOG_Running);
		B_LogEntry(TOPIC_INSORCWARRIOR,"Фальк рассказал мне, что недавно пара охотников наткнулась на небольшой отряд орков в лесу недалеко от фермы Акила. У меня возникла идея поохотиться на них.");
		Wld_InsertNpc(orcwarrior_roam_hunt_01,"FP_ROAM_NW_HUNTORK_01");
		Wld_InsertNpc(orcwarrior_roam_hunt_02,"FP_ROAM_NW_HUNTORK_02");
		Wld_InsertNpc(orcwarrior_roam_hunt_03,"FP_ROAM_NW_HUNTORK_03");
		Wld_InsertNpc(orcwarrior_roam_hunt_04,"FP_ROAM_NW_HUNTORK_04");
		Wld_InsertNpc(orcwarrior_roam_hunt_05,"FP_ROAM_NW_HUNTORK_05");
		Wld_InsertNpc(orcwarrior_roam_hunt_06,"FP_ROAM_NW_HUNTORK_06");
		Wld_InsertNpc(orcwarrior_roam_hunt_07,"FP_ROAM_NW_HUNTORK_07");
		Wld_InsertNpc(orcwarrior_roam_hunt_08,"FP_ROAM_NW_HUNTORK_08");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_15");	//Ты уже встречал кого-нибудь из них?
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_16");	//Да, приходилось несколько раз.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_18");	//Скажу тебе честно - слишком уж они подозрительные. Ведут себя как-то странно!
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_21");	//Все ребята на нервах из-за этих типов.
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_23");	//Успокойся. Думаю, все уладится.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_24");	//Надеюсь, ты прав.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_25");	//Недавно сюда приходило несколько наемников.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_27");	//Предлагали мне и нашим парням присоединиться к ним для охоты на драконов.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_28");	//Но мы еще не выжили из ума! Ведь это верная гибель.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_31");	//И я не вижу смысла в том, чтобы угробить свою жизнь за пару золотых монет.
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_33");	//В лагере - ничего. А вот за его пределами становится все опаснее и опаснее!
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_34");	//Из прохода в Долину Рудников постоянно приходят все новые монстры.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_35");	//Если так дело пойдет и дальше - скоро здесь все будет просто кишеть ими.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_36");	//Не говоря уже об орках!
	}
	else if(Kapitel == 6)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_37");	//У всех парней сдают нервы. Эта ситуация с орками просто ужасна.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_38");	//Я слышал, что эти твари устроили в городе, и представляю, что ждет всех остальных.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_39");	//И о чем только думают паладины?
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_40");	//Паладинам тяжело одним остановить такие полчища орков! Их слишком мало.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_41");	//Тогда у нас вообще мало шансов.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_42");	//Но будем надеяться на лучшее.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_43");	//Все как обычно. Ничего нового.
	};
};


instance DIA_HUN_741_FALK_INSORCWARRIOR(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_insorcwarrior_condition;
	information = dia_hun_741_falk_insorcwarrior_info;
	permanent = FALSE;
	description = "Я прикончил этих орков!";
};


func int dia_hun_741_falk_insorcwarrior_condition()
{
	if((MIS_INSORCWARRIOR == LOG_Running) && Npc_IsDead(orcwarrior_roam_hunt_01) && Npc_IsDead(orcwarrior_roam_hunt_02) && Npc_IsDead(orcwarrior_roam_hunt_03) && Npc_IsDead(orcwarrior_roam_hunt_04) && Npc_IsDead(orcwarrior_roam_hunt_05) && Npc_IsDead(orcwarrior_roam_hunt_06) && Npc_IsDead(orcwarrior_roam_hunt_07) && Npc_IsDead(orcwarrior_roam_hunt_08))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_insorcwarrior_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_HUN_741_Falk_InsOrcWarrior_01_00");	//Я прикончил тех орков, на которых наткнулись Барем и Раффа во время охоты.
	AI_Output(self,other,"DIA_HUN_741_Falk_InsOrcWarrior_01_03");	//Что?! Ты серьезно?
	AI_Output(self,other,"DIA_HUN_741_Falk_InsOrcWarrior_01_05");	//Ну... Даже и не знаю, что сказать.
	AI_Output(self,other,"DIA_HUN_741_Falk_InsOrcWarrior_01_06");	//Ты поразил меня, парень. Мы тебе очень благодарны.
	MIS_INSORCWARRIOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSORCWARRIOR,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSORCWARRIOR,"Фалька удивило известие о том, что мне удалось расправиться с этими орками.");
};


instance DIA_HUN_741_FALK_LEADER(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_leader_condition;
	information = dia_hun_741_falk_leader_info;
	permanent = FALSE;
	description = "Ты тут за главного?";
};

func int dia_hun_741_falk_leader_condition()
{
	if((HEROISHUNTER == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_leader_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"DIA_HUN_741_Falk_Leader_01_00");	//Ты тут за главного?

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Leader_01_01");	//Вроде того. Скажем так, я тут самый опытный.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Leader_01_02");	//(сухо) Тебя это мало касается. Лучше проваливай!
		AI_StopProcessInfos(self);
	};
};

instance DIA_HUN_741_FALK_JOIN(C_Info)
{
	npc = hun_741_falk;
	nr = 5;
	condition = dia_hun_741_falk_join_condition;
	information = dia_hun_741_falk_join_info;
	permanent = FALSE;
	description = "Я хочу присоединиться к вам.";
};

func int dia_hun_741_falk_join_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_leader) && (HEROISHUNTER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_join_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"DIA_HUN_741_Falk_Join_01_00");	//Я хочу присоединиться к вам.

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_09_1");	//То, что ты одет в доспехи охотника...
		AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_09_2");	//...еще не убеждает меня в том, что ты охотник и что ты достоин присоединиться к нам.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_01");	//Хочешь стать охотником?
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_02");	//(смеется) А что ты умеешь делать?
		AI_Output(other,self,"DIA_HUN_741_Falk_DuelWon_Hunter_01_03");	//Ну... Я довольно быстро всему учусь!
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_07");	//Эх, ладно! Думаю, просто так ты от меня все равно не отстанешь.
		AI_Output(other,self,"DIA_HUN_741_Falk_Join_01_03");	//Так ты согласен принять меня?
		AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_10");	//Возможно...
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_13");	//Но для начала покажи, что ты умеешь.
	};

	AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_91");	//Вот принесешь мне три шкуры мракориса, тогда и поговорим.
	MIS_SKINBLACKTROLLFALK = LOG_Running;
	Log_CreateTopic(TOPIC_SKINBLACKTROLLFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SKINBLACKTROLLFALK,LOG_Running);
	B_LogEntry(TOPIC_SKINBLACKTROLLFALK,"Фальку нужны три шкуры мракориса, и тогда, возможно, он примет меня в лагерь охотников.");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_CAMP(C_Info)
{
	npc = hun_741_falk;
	nr = 4;
	condition = dia_hun_741_falk_camp_condition;
	information = dia_hun_741_falk_camp_info;
	permanent = FALSE;
	description = "Я принес шкуры мракориса.";
};

func int dia_hun_741_falk_camp_condition()
{
	if((MIS_SKINBLACKTROLLFALK == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowFur) >= 3) && (HEROISHUNTER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_camp_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"DIA_HUN_741_Falk_Camp_01_90");	//Я принес шкуры мракориса.
	B_GiveInvItems(other,self,ItAt_ShadowFur,3);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,3);
	AI_Output(self,other,"DIA_HUN_741_Falk_Camp_01_03");	//Не может быть! А ты парень не промах! Кто бы мог подумать.
	AI_Output(other,self,"DIA_HUN_741_Falk_Join_01_03");	//Так ты солгасен принять меня?
	AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_04");	//Да. Будь как дома - теперь это и твой лагерь тоже.

	if(Hlp_IsItem(itm,ITAR_Leather_L) == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_09");	//Да, и еще. Выкинь те шмотки, что на тебе.
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_12");	//У меня есть приличный комплект охотничьих доспехов. Возьми его.
		B_GiveInvItems(self,other,ITAR_Leather_L,1);
	};

	HEROISHUNTER = TRUE;
	MIS_SKINBLACKTROLLFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SKINBLACKTROLLFALK,LOG_SUCCESS);
	B_LogEntry(TOPIC_SKINBLACKTROLLFALK,"Я принес Фальку три шкуры мракориса.");
	MIS_HUNTERSWORK = LOG_Running;
	Log_CreateTopic(TOPIC_HUNTERSWORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUNTERSWORK,LOG_Running);
	B_LogEntry_Quiet(TOPIC_HUNTERSWORK,"Фальк принял меня в лагерь охотников. ");
};

instance DIA_HUN_741_Falk_MakeHuntArmor(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_MakeHuntArmor_condition;
	information = DIA_HUN_741_Falk_MakeHuntArmor_info;
	permanent = FALSE;
	description = "У тебя есть доспехи получше?";
};

func int DIA_HUN_741_Falk_MakeHuntArmor_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_MakeHuntArmor_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_MakeHuntArmor_01_00");	//У тебя есть доспехи получше?
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_01");	//(задумчиво) Если на продажу, то нет.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_02");	//Но поскольку ты один из нас...
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_03");	//...то я мог бы научить тебя делать доспехи из шкур различных животных.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_04");	//Они куда крепче и прочнее обычных и смогут надежно защитить тебя во время охоты.
	AI_Output(other,self,"DIA_HUN_741_Falk_MakeHuntArmor_01_05");	//Интересно!
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_06");	//Не так быстро, друг мой. Для начала ты должен доказать, что достоин этого!
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_07");	//Я должен быть полностью уверен, что передаю свои знания настоящему охотнику, а не бревну с луком в руках.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_08");	//Давай договоримся так: я не возьму с тебя золота за обучение...
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_09");	//...но за каждый урок я попрошу тебя принести мне какой-нибудь редкий трофей.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_10");	//Только он должен быть действительно редким, если ты понимаешь, о чем я говорю. Ну что, договорились?
	AI_Output(other,self,"DIA_HUN_741_Falk_MakeHuntArmor_01_11");	//По рукам!
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_12");	//Вот и славно. Тогда жду тебя обратно и, надеюсь, не с пустыми руками.
	FalkCanTeachArmor = TRUE;
	Log_CreateTopic(TOPIC_TalentHuntArmor,LOG_NOTE);
	B_LogEntry(TOPIC_TalentHuntArmor,"Фальк может научить меня делать охотничьи доспехи из шкур животных. За каждый урок он хочет получить какой-нибудь редкий трофей.");
};

instance DIA_HUN_741_Falk_TeachHuntArmor(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_TeachHuntArmor_condition;
	information = DIA_HUN_741_Falk_TeachHuntArmor_info;
	permanent = TRUE;
	description = "По поводу редких трофеев...";
};

func int DIA_HUN_741_Falk_TeachHuntArmor_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmor == TRUE) && ((FalkCanTeachArmor_01 == FALSE) || (FalkCanTeachArmor_02 == FALSE) || (FalkCanTeachArmor_03 == FALSE) || (FalkCanTeachArmor_04 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmor_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_01_00");	//По поводу интересующих тебя редких трофеев.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_01_01");	//Да? Чем порадуешь?

	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmor);
	Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,Dialog_Back,DIA_HUN_741_Falk_TeachHuntArmor_Back);

	if((Npc_HasItems(other,ItAt_XtoneClaw) >= 1) && (FalkCanTeachArmor_01 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(отдать каменный коготь)",DIA_HUN_741_Falk_TeachHuntArmor_H1);
	};
	if((Npc_HasItems(other,ItAt_DlackTeeth) >= 1) && (FalkCanTeachArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(отдать черный клык)",DIA_HUN_741_Falk_TeachHuntArmor_H2);
	};
	if((Npc_HasItems(other,ItAt_GturTrollHorn) >= 1) && (FalkCanTeachArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(отдать рог Утура)",DIA_HUN_741_Falk_TeachHuntArmor_H3);
	};
	if((Npc_HasItems(other,ItAt_CaveBlackFurTroll) >= 1) && (FalkCanTeachArmor_04 == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(отдать шкуру черного пещерного тролля)",DIA_HUN_741_Falk_TeachHuntArmor_H4);
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmor_Back()
{
	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmor);
};

func void DIA_HUN_741_Falk_TeachHuntArmor_H1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAt_XtoneClaw,1);
	Npc_RemoveInvItems(self,ItAt_XtoneClaw,1);

	if(Trophy_StoneClaw == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_StoneClaw,Npc_HasItems(other,ItUt_StoneClaw));
		Trophy_StoneClaw = FALSE;
	};

	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_00");	//Вот, возьми этот каменный коготь.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_01");	//Как интересно! Похоже, это действительно редкая вещь.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_02");	//Что ж, за это я обучу тебя изготовлению доспехов из волчьих шкур.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_03");	//Скажи, как будешь готов, - и мы сразу начнем.
	FalkCanTeachArmor_01 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor,"Я принес Фальку каменный коготь. За это он обучит меня изготовлению доспехов из волчьих шкур.");
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H2()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItAt_DlackTeeth,1);
	Npc_RemoveInvItems(self,ItAt_DlackTeeth,1);

	if(Trophy_BlackTeeth == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_BlackTeeth,Npc_HasItems(other,ItUt_BlackTeeth));
		Trophy_BlackTeeth = FALSE;
	};

	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_00");	//Уверен, что тебя заинтересует этот клык.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_01");	//Хммм... Да, ты прав! Очень необычная вещица.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_02");	//Что ж, за это я обучу тебя изготовлению доспехов из шкур варгов.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_03");	//Скажи, как будешь готов, - и мы сразу приступим.
	FalkCanTeachArmor_02 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor,"Я принес Фальку черный клык. Теперь он обучит меня изготовлению доспехов из шкур варгов.");
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H3()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItAt_GturTrollHorn,1);
	Npc_RemoveInvItems(self,ItAt_GturTrollHorn,1);

	if(Trophy_UturTrollHorn == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_UturTrollHorn,Npc_HasItems(other,ItUt_UturTrollHorn));
		Trophy_UturTrollHorn = FALSE;
	};

	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_00");	//Вот, возьми это рог. 
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_01");	//Ого, приятель! Первый раз в жизни вижу подобную вещь. С кого ты снял его?
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_02");	//С очень огромного и злого тролля.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_03");	//Ну ладно, герой. В таком случае я обучу тебя изготовлению доспехов из шкур этих гигантских тварей.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_04");	//Скажи, как будешь готов.
	FalkCanTeachArmor_03 = TRUE;

	if(SBMode == FALSE)
	{
		FalkCanTeachArmor_04 = TRUE;
	};

	B_LogEntry(TOPIC_TalentHuntArmor,"Я принес Фальку рог тролля Утура. За это он обучит меня изготовлению доспехов из шкур троллей.");
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H4()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_CaveBlackFurTroll,1);
	Npc_RemoveInvItems(self,ItAt_CaveBlackFurTroll,1);
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_00");	//Эта шкура специально для тебя.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_01");	//О, Иннос! Неужели тебе удалось завалить пещерного черного тролля?!
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_02");	//Как видишь.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_03");	//Невероятно! Я еще не встречал ни одного человека, которому бы удалось это.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_04");	//Что ж, в знак уважения к тебе и моей благодарности...
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_05");	//...я обучу тебя созданию доспехов, которые сделают из тебя настоящего мастера охоты.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_06");	//Такие доспехи даже я не могу позволить себе носить. Так что поверь, это огромная честь!
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_07");	//Не сомневаюсь.
	FalkCanTeachArmor_04 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor,"Я принес Фальку шкуру пещерного черного тролля. Он был впечатлен, и в знак уважения теперь обучит меня изготовлению доспехов из шкуры черного тролля.");
};

var int TeachHuntArmorFT;

instance DIA_HUN_741_Falk_TeachHuntArmorDone(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_TeachHuntArmorDone_condition;
	information = DIA_HUN_741_Falk_TeachHuntArmorDone_info;
	permanent = TRUE;
	description = "Научи меня делать доспехи из шкур.";
};

func int DIA_HUN_741_Falk_TeachHuntArmorDone_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmorDone == FALSE) && ((FalkCanTeachArmor_01 == TRUE) || (FalkCanTeachArmor_02 == TRUE) || (FalkCanTeachArmor_03 == TRUE) || (FalkCanTeachArmor_04 == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_01_00");	//Научи меня делать доспехи из шкур.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_01_01");	//Хорошо! Какие именно доспехи ты хочешь сделать?

	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmorDone);
	Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,Dialog_Back,DIA_HUN_741_Falk_TeachHuntArmorDone_Back);

	if((FalkCanTeachArmor_01 == TRUE) && (Know_HuntArmor_01 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Доспехи из волчьих шкур",DIA_HUN_741_Falk_TeachHuntArmorDone_H1);
	};
	if((FalkCanTeachArmor_02 == TRUE) && (Know_HuntArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Доспехи из шкур варгов",DIA_HUN_741_Falk_TeachHuntArmorDone_H2);
	};
	if((FalkCanTeachArmor_03 == TRUE) && (Know_HuntArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Доспехи из шкур троллей",DIA_HUN_741_Falk_TeachHuntArmorDone_H3);
	};
	if((FalkCanTeachArmor_04 == TRUE) && (Know_HuntArmor_04 == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Доспехи из шкуры черного тролля",DIA_HUN_741_Falk_TeachHuntArmorDone_H4);
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_Back()
{
	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmorDone);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H1()
{
	if(TeachHuntArmorFT == FALSE)
	{
    		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_00");   //Хорошо, слушай внимательно! Для начала тебе понадобятся шкуродер и разделочный нож.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_01");   //Ну и, естественно, волчьи шкуры. Собери их побольше. Также необходимы когти и клыки.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_02");   //Из всех шкур, что есть, выбери самую большую и самую маленькую.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_03");   //Большую отложи, а маленькую избавь от лап и брюшных краев, оставь только ту полосу шкуры, что покрывает спину твари - этот участок наиболее хорошо сохраняет тепло и отлично подходит для пояса.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_04");   //Далее ты вырезаешь такие же полосы из шкур, что побольше, перекидываешь их через плечи, надежно укутывая грудь - легкие охотнику нужно беречь.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_05");   //Концы полос фиксируешь за спиной при помощи застежки из двух прочных когтей.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_06");   //Ну и настает черед самой большой шкуры. Кидаешь ее себе на спину, застегиваешь спереди, вместо пуговиц используя клыки.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_07");   //Вот собственно и все.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_08");   //Хорошо, слушай внимательно!
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_09");   //Естественно тебе понадобятся волчьи шкуры. Собери их побольше. Также необходимы когти и клыки.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_10");   //Из всех шкур, что есть, выбери самую большую и самую маленькую.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_11");   //Большую отложи, а маленькую избавь от лап и брюшных краев, оставь только ту полосу шкуры, что покрывает спину твари - этот участок наиболее хорошо сохраняет тепло и отлично подходит для пояса.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_12");   //Далее ты вырезаешь такие же полосы из шкур, что побольше, перекидываешь их через плечи, надежно укутывая грудь - легкие охотнику нужно беречь.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_13");   //Концы полос фиксируешь за спиной при помощи застежки из двух прочных когтей.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_14");   //Ну и настает черед самой большой шкуры. Кидаешь ее себе на спину, застегиваешь спереди, вместо пуговиц используя клыки.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_15");   //Вот собственно и все.
	};

	Know_HuntArmor_01 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Изучен рецепт изготовления доспехов - 'Доспехи из волчьих шкур'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Теперь я умею делать охотничьи доспехи из волчьих шкур. Для этого мне понадобятся: разделочный нож, двадцать волчьих шкур, два когтя, десять клыков и стальная заготовка.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H2()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_00");   //Слушай и запоминай. Для начала тебе понадобятся шкуродер и разделочный нож.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_01");   //В общем-то, процесс изготовления мало чем отличается от предыдущего. Спинная доля - самая теплая, шкур брать побольше. Запомни эти простые истины.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_02");   //Единственный момент... Шкура варга имеет весьма неприятный запах, поэтому ее нужно обработать смолой и обязательно умостить где-то кусок серы. Сделай это, и зловоние пропадет.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_03");   //Как и долгий треп моих собеседников...(себе под нос) То, что нужно.
		TeachHuntArmorFT = TRUE;
     	}
     else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_04");   //Слушай и запоминай.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_05");   //В общем-то, процесс изготовления мало чем отличается от предыдущего. Спинная доля - самая теплая, шкур брать побольше. Запомни эти простые истины.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_06");   //Единственный момент... Шкура варга имеет весьма неприятный запах, поэтому ее нужно обработать смолой и обязательно умостить где-то кусок серы. Сделай это, и зловоние пропадет.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_07");   //Как и долгий треп моих собеседников. (себе под нос) То, что нужно.
	};

	Know_HuntArmor_02 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Изучен рецепт изготовления доспехов - 'Доспехи из шкур варгов'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Теперь я умею делать охотничьи доспехи из шкур варгов. Для этого мне понадобятся: разделочный нож, десяток шкур варгов, дюжина клыков, две стальные заготовки, кусок серы и смола.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H3()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_00");   //Это будет непросто! Так что слушай внимательно. Для начала тебе понадобятся шкуродер и разделочный нож.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_01");   //Принцип тот же, но шкура тролля массивная, а это значит, что процесс ее нарезки будет более трудоемким и времязатратным.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_02");   //Клыки пойдут на всякого рода застежки и заклепки. Смола и уголь требуются для обработки шкуры с целью освобождения ее от мелких вредоносных насекомых, накопившихся между ворсинками.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_03");   //Самый большой кусок как всегда используется для покрытия спины и плеч. Только смотри не надорвись, взваливай на горб тот вес, с которым сможешь бегать.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_04");   //Удержать эту часть доспеха призваны огромные тролльи клыки, который следует размещать в подмышках - по два с каждой стороны.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_05");   //Это будет непросто! Так что слушай внимательно.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_06");   //Принцип тот же, но шкура тролля массивная, а это значит, что процесс ее нарезки будет более трудоемким и времязатратным.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_07");   //Клыки пойдут на всякого рода застежки и заклепки. Смола и уголь требуются для обработки шкуры с целью освобождения ее от мелких вредоносных насекомых, накопившихся между ворсинками.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_08");   //Самый большой кусок как всегда используется для покрытия спины и плеч. Только смотри не надорвись, взваливай на горб тот вес, с которым сможешь бегать.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_09");   //Удержать эту часть доспеха призваны огромные тролльи клыки, которые следует размещать в подмышках - по два с каждой стороны.
	};

	Know_HuntArmor_03 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Изучен рецепт изготовления доспехов - 'Доспехи из шкур троллей'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Теперь я умею делать охотничьи доспехи из шкур троллей. Для этого мне понадобятся: разделочный нож, пять шкур тролля, четыре клыка тролля, два десятка клыков, шесть стальных заготовок, смола и три куска угля.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H4()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_00");	//Процесс создания этого доспеха мало чем отличается от обычного тролльего.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_01");	//Потом не спеша принимаешься за работу...(рассказывает)...Вот и все!
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_02");	//Если сделаешь все правильно, то получишь один из лучших доспехов, что я вообще видел в своей жизни.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_03");	//Хорошо! Постараюсь ничего не забыть.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_04");	//Чтобы изготовить этот доспех, нужно целое искусство!
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_05");	//Потом не спеша принимаешься за работу...(рассказывает)...Вот и все! 
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_06");	//Если сделаешь все правильно, то получишь один из лучших доспехов, что я вообще видел в своей жизни.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_07");	//Хорошо! Постараюсь ничего не забыть.
	};

	Know_HuntArmor_04 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Изучен рецепт изготовления доспехов - 'Доспехи из шкуры черного тролля'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Теперь я умею делать охотничьи доспехи из шкуры черного тролля. Для этого мне понадобятся: разделочный нож, три шкуры черного тролля, рог черного тролля, шесть клыков тролля, четыре десятка клыков, восемь стальных заготовок, три куска серы, смола, шесть кусков угля и черный жемчуг.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_HUNT(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunt_condition;
	information = dia_hun_741_falk_hunt_info;
	permanent = FALSE;
	description = "Как охота?";
};

func int dia_hun_741_falk_hunt_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunt_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_Hunt_01_00");	//Как охота?
	AI_Output(self,other,"DIA_HUN_741_Falk_Hunt_01_01");	//Особых проблем не возникает, если не заходить слишком далеко в лес.
	AI_Output(self,other,"DIA_HUN_741_Falk_Hunt_01_02");	//А недавно в одной из пещер мы нашли настоящее драконье яйцо!
	AI_Output(self,other,"DIA_HUN_741_Falk_Hunt_01_03");	//Очень редкая вещь - даже не представляю, откуда оно там взялось...
};


instance DIA_HUN_741_FALK_DRAGON(C_Info)
{
	npc = hun_741_falk;
	nr = 5;
	condition = dia_hun_741_falk_dragon_condition;
	information = dia_hun_741_falk_dragon_info;
	permanent = FALSE;
	description = "Драконы скоро могут пожаловать и сюда.";
};


func int dia_hun_741_falk_dragon_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_hunt) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_dragon_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_HUN_741_Falk_Dragon_01_00");	//Драконы скоро могут пожаловать и сюда.
	AI_Output(self,other,"DIA_HUN_741_Falk_Dragon_01_01");	//(испуганно) Что? Почему ты так решил?
	AI_Output(other,self,"DIA_HUN_741_Falk_Dragon_01_02");	//Ходят слухи, что нескольких драконов видели в Долине Рудников.
	AI_Output(self,other,"DIA_HUN_741_Falk_Dragon_01_03");	//Если это правда, нам всем придется нелегко!
	AI_Output(self,other,"DIA_HUN_741_Falk_Dragon_01_08");	//Вот черт!
};


instance DIA_HUN_741_FALK_TEACHABOUT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_teachabout_condition;
	information = dia_hun_741_falk_teachabout_info;
	permanent = FALSE;
	description = "Кто может меня чему-нибудь научить?";
};


func int dia_hun_741_falk_teachabout_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_teachabout_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachAbout_01_00");	//Кто здесь может меня чему-нибудь научить?
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_03");	//Никлас научит тебя делать стрелы и болты.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_05");	//Остальные - Альфред, Гром, Гаан и Гримбальд смогут рассказать тебе, как разделывать тушки убитых тобой животных.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_06");	//Ведь сбор охотничьих трофеев - самая важная часть в нашем деле.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_07");	//К сожалению, многих ребят сейчас нет в лагере.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_08");	//Никлас промышляет на охотничьих угодьях недалеко от маяка. Он у нас отвечает за регулярные поставки мяса в лагерь.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_09");	//Гаан охотится возле прохода в Долину Рудников. Помнится, он выслеживал какого-то странного зверя, явно не из этих мест.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_10");	//Гром околачивается возле фермы Онара. Я дал ему один очень непростой заказ. Наверное, он им до сих пор и занят.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_11");	//Ну а Гримбальд охотится на снепперов в северной части острова, недалеко от логова черного тролля.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_12");	//Мы, кстати, даже поспорили с ребятами, - кто первым завалит этого монстра. Можешь поучаствовать! (смеется)
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachAbout_01_13");	//И что я получу, если убью его?
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_14");	//Вот сначала убей, и тогда узнаешь.
	MIS_BLACKTROLLPARI = LOG_Running;
	Log_CreateTopic(TOPIC_BLACKTROLLPARI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BLACKTROLLPARI,LOG_Running);
	B_LogEntry(TOPIC_BLACKTROLLPARI,"Охотники устроили состязание: кто первый убьет большого черного тролля. Я тоже могу в нем поучаствовать.");
};


instance DIA_HUN_741_FALK_WOLFFURFALK(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_wolffurfalk_condition;
	information = dia_hun_741_falk_wolffurfalk_info;
	permanent = FALSE;
	description = "У тебя есть для меня какое-нибудь поручение?";
};


func int dia_hun_741_falk_wolffurfalk_condition()
{
	if((HEROISHUNTER == TRUE) && Npc_KnowsInfo(hero,dia_hun_741_falk_teachabout))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_wolffurfalk_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalk_01_00");	//У тебя есть для меня какое-нибудь поручение?
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_01");	//Хорошо, что спросил. Тут как раз есть кое-что для тебя.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_03");	//Один торговец из города заказал мне два десятка волчьих шкур.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_04");	//Возьмешься за это?
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalk_01_05");	//Конечно. Я принесу тебе волчьи шкуры.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_06");	//Тогда жду тебя с этими шкурами не позднее следующей недели.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_07");	//Постарайся не тянуть с этим делом - мой заказчик не любит долго ждать.
	MIS_WOLFFURFALK = LOG_Running;
	Log_CreateTopic(TOPIC_WOLFFURFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLFFURFALK,LOG_Running);
	B_LogEntry(TOPIC_WOLFFURFALK,"Фальку сделали заказ на двадцать волчьих шкур. Я вызвался принести ему их.");
};


instance DIA_HUN_741_FALK_WOLFFURFALKDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_wolffurfalkdone_condition;
	information = dia_hun_741_falk_wolffurfalkdone_info;
	permanent = FALSE;
	description = "Я принес волчьи шкуры.";
};


func int dia_hun_741_falk_wolffurfalkdone_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_WOLFFURFALK == LOG_Running) && (Npc_HasItems(other,ItAt_WolfFur) >= 20))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_wolffurfalkdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalkDone_01_00");	//Я принес волчьи шкуры.
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalkDone_01_02");	//Вот, как ты и просил, - ровно двадцать.
	B_GiveInvItems(other,self,ItAt_WolfFur,20);
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_03");	//Отличная работа, парень! Думаю, это немного порадует старика Боспера.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_04");	//А что касается тебя, то вот - держи свою долю. Ты ее честно заслужил.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalkDone_01_05");	//Так ты работаешь на торговца Боспера?
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_06");	//Нет, просто иногда я выполняю для него небольшие заказы.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_07");	//А он в свою очередь мне хорошо за них платит. Но не более того.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_09");	//Бывают заказы и от других торговцев.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_11");	//Например, недавно один торговец из города интересовался когтями какого-нибудь особенного снеппера.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_12");	//Вот только где нам найти такого?
	MIS_WOLFFURFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WOLFFURFALK,LOG_SUCCESS);
	B_LogEntry(TOPIC_WOLFFURFALK,"Я принес Фальку два десятка волчьих шкур.");
};

instance DIA_HUN_741_FALK_BLACKTROLLPARI(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_blacktrollpari_condition;
	information = dia_hun_741_falk_blacktrollpari_info;
	permanent = FALSE;
	description = "Черный тролль мертв!";
};

func int dia_hun_741_falk_blacktrollpari_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_BLACKTROLLPARI == LOG_Running) && (Npc_HasItems(other,ItAt_TrollBlackFur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_blacktrollpari_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_HUN_741_Falk_BlackTrollPari_01_00");	//Черный тролль мертв!
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTrollPari_01_01");	//А где доказательства?
	AI_Output(other,self,"DIA_HUN_741_Falk_BlackTrollPari_01_02");	//Вот его шкура.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTrollPari_01_03");	//(удивленно) Не может быть! Ну ты даешь...
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTrollPari_01_04");	//Выходит, именно ты выиграл наш спор. А посему, вот - возьми свой приз.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTroll_01_05");	//Редкая вещица! Ты мне шкуру, я тебе - зелье.
	MIS_BLACKTROLLPARI = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BLACKTROLLPARI,LOG_SUCCESS);
	B_LogEntry(TOPIC_BLACKTROLLPARI,"Я показал Фальку шкуру черного тролля, и он признал меня победителем в споре охотников.");
};

instance DIA_HUN_741_FALK_MAIN(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_main_condition;
	information = dia_hun_741_falk_main_info;
	permanent = FALSE;
	description = "Почему именно ты здесь главный?";
};


func int dia_hun_741_falk_main_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_main_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_Main_01_00");	//Почему именно ты здесь главный?
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_01");	//Я заправляю здесь всем, поскольку являюсь самым лучшим охотником в этом лагере.
	AI_Output(other,self,"DIA_HUN_741_Falk_Main_01_05");	//И что же делает тебя лучшим?
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_06");	//Как что? В первую очередь, умение охотиться, конечно.
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_07");	//Кроме всего прочего, в тебе должна присутствовать еще неумолимая тяга и любовь к этому ремеслу.
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_08");	//Ведь быть охотником - это не просто уметь метко стрелять из лука или разделывать туши животных.
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_09");	//Охота должна стать частью тебя!
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_13");	//В ней смысл всей моей жизни! И без нее я не представляю свое существование в этом мире.
};


instance DIA_HUN_741_FALK_GRAND(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_grand_condition;
	information = dia_hun_741_falk_grand_info;
	permanent = FALSE;
	description = "А кто научил тебя охотиться?";
};


func int dia_hun_741_falk_grand_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_grand_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_Grand_01_00");	//А кто научил тебя охотиться?
	AI_Output(self,other,"DIA_HUN_741_Falk_Grand_01_01");	//Всему этому я обязан только одному человеку в своей жизни - моему деду Бену!
	AI_Output(other,self,"DIA_HUN_741_Falk_Grand_01_03");	//Твой дед тоже был охотником?
	AI_Output(self,other,"DIA_HUN_741_Falk_Grand_01_04");	//Да. И не просто охотником, а самым лучшим охотником в этих краях!
	AI_Output(other,self,"DIA_HUN_741_Falk_Grand_01_09");	//А где он сейчас?
	AI_Output(self,other,"DIA_HUN_741_Falk_Grand_01_10");	//Этого я не знаю. Семь лет назад он ушел охотиться в горы на севере, и с тех пор больше никто его здесь не видел.
};

instance DIA_HUN_741_FALK_HUNTFORWHAT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_huntforwhat_condition;
	information = dia_hun_741_falk_huntforwhat_info;
	permanent = FALSE;
	description = "На кого вы обычно охотитесь?";
};

func int dia_hun_741_falk_huntforwhat_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_huntforwhat_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_HuntForWhat_01_00");	//На кого вы обычно охотитесь?
	AI_Output(self,other,"DIA_HUN_741_Falk_HuntForWhat_01_03");	//Любая живность представляет для нас интерес, если с нее можно снять какой-нибудь ценный охотничий трофей.
	AI_Output(self,other,"DIA_HUN_741_Falk_HuntForWhat_01_02");	//Волки, падальщики, снепперы или тролли.
	AI_Output(self,other,"DIA_HUN_741_Falk_HuntForWhat_01_04");	//Охотиться можно на кого угодно. Главное - знать, как это делается.
};


instance DIA_HUN_741_FALK_TALKFORWHAT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_talkforwhat_condition;
	information = dia_hun_741_falk_talkforwhat_info;
	permanent = FALSE;
	description = "Расскажи мне что-нибудь об охоте.";
};


func int dia_hun_741_falk_talkforwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_huntforwhat))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_talkforwhat_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TalkForWhat_01_00");	//Расскажи мне что-нибудь об охоте.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_03");	//В каждом конкретном случае существуют свои некоторые особенности.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_05");	//Для начала ты должен знать, что каждый зверь имеет свои повадки и обладает особенной манерой поведения.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_08");	//Например, охота на стаю снепперов - это совершенно иное, нежели охота на стаю волков.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_09");	//Также надо учесть, что различные животные нападают и защищаются тоже совершенно по-разному.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_11");	//Если ты будешь хорошо разбираться во всем этом, то без особого труда сможешь справиться с любым зверем.
};


instance DIA_HUN_741_FALK_TALKABOUTHUNT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_talkabouthunt_condition;
	information = dia_hun_741_falk_talkabouthunt_info;
	permanent = TRUE;
	description = "Можешь ли ты рассказать мне еще об охоте?";
};


func int dia_hun_741_falk_talkabouthunt_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_talkforwhat))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_talkabouthunt_info()
{
	AI_Output(other,self,"DIA_HUN_741_TA_01_00");	//Можешь ли ты рассказать мне еще об охоте?
	AI_Output(self,other,"DIA_HUN_741_TA_01_01");	//Я много чего могу рассказать о местных тварях.
	AI_Output(self,other,"DIA_HUN_741_TA_01_02");	//Что именно тебя интересует?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне об охоте на животных.",dia_hun_741_falk_talkabouthunt_other);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне об охоте на рептилий.",dia_hun_741_falk_talkabouthunt_reptile);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Я хочу узнать побольше об охоте на хищников.",dia_hun_741_falk_talkabouthunt_predators);
};

func void dia_hun_741_falk_talkabouthunt_other()
{
	AI_Output(other,self,"DIA_HUN_741_TA_Other_01_00");	//Расскажи мне об охоте на животных.
	AI_Output(self,other,"DIA_HUN_741_TA_Other_01_01");	//О ком именно ты хочешь узнать?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне о ползунах.",dia_hun_741_falk_talkabouthunt_minecrawler);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне про кабанов.",dia_hun_741_falk_talkabouthunt_keiler);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне про кровяных шершней.",dia_hun_741_falk_talkabouthunt_bloodfly);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне про падальщиков.",dia_hun_741_falk_talkabouthunt_scavenger);
};

func void dia_hun_741_falk_talkabouthunt_reptile()
{
	AI_Output(other,self,"DIA_HUN_741_TA_Reptile_01_00");	//Расскажи мне об охоте на рептилий.
	AI_Output(self,other,"DIA_HUN_741_TA_Reptile_01_01");	//Хорошо! Про кого именно ты хочешь услышать?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Как охотиться на огненных ящеров?",dia_hun_741_falk_talkabouthunt_firewaran);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне как охотиться на шныгов.",dia_hun_741_falk_talkabouthunt_luker);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне про ящерец.",dia_hun_741_falk_talkabouthunt_waran);
};

func void dia_hun_741_falk_talkabouthunt_predators()
{
	AI_Output(other,self,"DIA_HUN_741_TA_Predators_01_00");	//Я хочу узнать побольше об охоте на хищников.
	AI_Output(self,other,"DIA_HUN_741_TA_Predators_01_01");	//Нет проблем! Про кого именно ты хочешь, чтобы я рассказал?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне о троллях.",dia_hun_741_falk_talkabouthunt_troll);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне о мракорисе.",dia_hun_741_falk_talkabouthunt_shadow);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне про снепперов.",dia_hun_741_falk_talkabouthunt_snapper);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Расскажи мне о волках.",dia_hun_741_falk_talkabouthunt_wolf);
};

func void dia_hun_741_falk_talkabouthunt_back()
{
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
};

func void dia_hun_741_falk_talkabouthunt_scavenger()
{
	if(BONUSHUNTTELL_01 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_01 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Scavenger_01_00");	//Расскажи мне про падальщиков.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_01");	//Падальщиками мы называем этих больших птиц. Атаковать их нужно поодиночке. Довольно легко выманить одного падальщика из стаи.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_02");	//Когда ты подойдешь поближе, птица сперва забеспокоится, а затем помчится на тебя. Ты должен уже ждать ее с оружием в руках.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_03");	//Если тебе удастся нанести удар, прежде чем эта тварь укусит тебя, не останавливайся, продолжай драться - и ты одержишь победу, не получив ни единой царапины.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_04");	//Если же ОНА ударит тебя первой... ну, не стоит до этого доводить.
};

func void dia_hun_741_falk_talkabouthunt_bloodfly()
{
	if(BONUSHUNTTELL_02 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_02 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_00");	//Расскажи мне про кровяных шершней.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_01");	//Главное в этом деле - внимание и хорошая реакция.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_02");	//Нанести точный удар мечом в сражении с шершнем довольно трудно - уж больно эти создания увертливые.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_03");	//Поэтому дам тебе один совет - не бросайся в атаку сломя голову!
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_04");	//Просто стой и внимательно следи за траекторией его полета. Выжидай того момента, когда шершень решит атаковать тебя.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_06");	//Когда шершень подлетит к тебе, чтобы ужалить, - нанеси одиночный удар и отступи назад!
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_07");	//И лучше всего это делать снизу вверх! Вот так...
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HATTACKMOVE");
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_08");	//Запомнил?
	AI_RemoveWeapon(self);
	AI_TurnToNPC(self,other);
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_09");	//Да.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_10");	//Хорошо. Если сделаешь все, как я сказал, то без особого труда справишься с этой тварью.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_11");	//Хотя, конечно, еще проще - это отстреливать шершней из лука.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_12");	//Даже неумело выпущенная стрела, попади она в цель, сможет запросто перебить перепонки у его крыльев.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_13");	//А со сломанными крыльями кровяной шершень уже не так опасен.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_14");	//Добить его останется только делом техники.
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_15");	//Спасибо за совет.
};

func void dia_hun_741_falk_talkabouthunt_keiler()
{
	if(BONUSHUNTTELL_03 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_03 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Keiler_01_00");	//Расскажи мне про кабанов.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_01");	//Кабаны не слишком умны, и в основном полагаются только на свою мощь.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_04");	//Запомни: главное оружие кабана - это его первый, ужасающей силы удар!
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_05");	//Он запросто может сбить тебя с ног, а его мощные клыки способны разорвать тебя в клочья.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_06");	//Поэтому, самое главное, - не дать ему ударить тебя первым.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_08");	//Просто сделай шаг назад или в сторону, хотя это уже сложней. А потом сам переходи в атаку!
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_09");	//Нанеси несколько ударов, снова уйди в сторону и повтори атаку.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_10");	//Кабан не слишком проворен в ближнем бою. И если ты достаточно ловок, тебе не составит труда довести дело до конца.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_11");	//Также не советую тебе охотиться на кабана с луком или арбалетом.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_12");	//Стрелы или болты не причинят ему особого вреда, если ты недостаточно хорошо обучен стрельбе из этого оружия.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_13");	//Поверь мне, шкура кабана очень крепкая!
	AI_Output(other,self,"DIA_HUN_741_TA_Keiler_01_14");	//Я буду иметь это в виду.
};

func void dia_hun_741_falk_talkabouthunt_minecrawler()
{
	if(BONUSHUNTTELL_04 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_04 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_MineCrawler_01_00");	//Расскажи мне о ползунах.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_01");	//Когда имеешь дело с этими тварями, важно помнить одно: если увидел ползуна, беги к нему и атакуй его первым.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_04");	//Главное не дать ползуну возможности самому атаковать тебя - у него длинные щупальца, и он без труда достанет тебя.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_05");	//Но если ты столкнешься с ползуном-воином, то тут нужна совершенно иная тактика.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_06");	//Пластины панциря этих тварей - самый прочный материал из всех, что мне приходилось видеть. Они практически непробиваемые!
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_07");	//Арбалеты и луки тут и вовсе бесполезны. Пытаться пробить такую броню болтом или стрелой - только бесполезная трата времени.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_08");	//Лезвие твоего меча будет куда более эффективным против панцирей этих тварей.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_09");	//Всегда держи ползуна на расстоянии удара - не позволяй ему приблизиться к себе вплотную.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_11");	//Ползун-воин - хоть и опасное существо, но крайне упрямое и примитивное. Они действуют инстинктивно, убивая всех на своем пути.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_12");	//Он будет лезть на рожон, даже если получит несколько серьезных ранений. И ты должен этим пользоваться.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_13");	//Твой меч не должен знать покоя до тех пор, пока окончательно не прикончит ползуна.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_14");	//Кстати, я слышал, что кроме обычных ползунов и ползунов-воинов существует также еще один особенный представитель этих... тварей.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_15");	//Это создание называют королевой ползунов.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_16");	//Она откладывает яйца, из которых потом вылупляются новые ползуны.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_17");	//Правда, здесь я никогда не встречал подобных существ. Но тебе, возможно, повезет больше! (смеется)
};

func void dia_hun_741_falk_talkabouthunt_waran()
{
	if(BONUSHUNTTELL_05 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_05 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Waran_01_00");	//Расскажи мне про ящериц.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_01");	//В основном они живут на побережье моря, поскольку очень любят погреться на солнышке.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_02");	//Хотя иногда их можно встретить и в небольших зарослях или в лесу.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_06");	//На твоем месте я бы опасался их острых когтей, которыми они разделывают свою добычу.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_07");	//Теперь же, что касается самой охоты на варанов...
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_08");	//Самое подходящее для этого дела оружие - это охотничий лук или арбалет.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_09");	//Кожа этих созданий не слишком прочна.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_10");	//Практически любая выпущенная тобой стрела без труда пробьет ее насквозь и тем самым серьезно ранит зверя.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_11");	//Куда больше придется попотеть, если у тебя нет при себе ни лука, ни арбалета.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_12");	//Вараны чрезвычайно ловкие существа, и поэтому в данном случае лучшая тактика в сражении с ними - это контратака.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_13");	//Подпусти к себе тварь поближе и жди, пока она не попытается цапнуть тебя.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_14");	//Уклонись и мгновенно наноси удар. Каким бы ловким это создание ни было, от этого выпада ему не увернуться!
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_15");	//Обычно хватает лишь одного точного удара, но если же ты промахнешься - отступи и повтори все заново.
};

func void dia_hun_741_falk_talkabouthunt_luker()
{
	if(BONUSHUNTTELL_06 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_06 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Luker_01_00");	//Расскажи мне, как охотиться на шныгов.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_02");	//Шныги - опасные звери, и крайне непредсказуемые.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_03");	//Даже с одним таким зверем бывает тяжело справиться, не говоря уже о двух или трех.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_05");	//Но у них есть одна слабость - медлительность, и этим надо пользоваться.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_06");	//Поэтому не стоит ждать того момента, когда зверь сам нападет на тебя - атакуй его первым!
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_07");	//Наноси удары одним за другим, не давая зверю опомниться.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_09");	//Но не стоит также забывать и про свою безопасность.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_10");	//Если ты чувствуешь, что твои удары проходят мимо цели, - лучше отступить.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_11");	//Дождись подходящего момента и снова повтори свою атаку.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_12");	//И помни: большое значение в сражении со шныгом имеет длина твоего оружия.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_13");	//Этого зверя надо держать на расстоянии, иначе он легко достанет тебя своими длинными лапами.
};

func void dia_hun_741_falk_talkabouthunt_firewaran()
{
	if(BONUSHUNTTELL_07 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_07 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_FireWaran_01_00");	//Как охотиться на огненных ящеров?
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_01");	//Этих созданий нечасто можно встретить в этих краях.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_02");	//Да и никто из наших парней на них не охотится - слишком уж опасное это занятие.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_06");	//Самый главный их отличительный знак - это ярко-красный окрас кожи и большой гребень, что растет у них на спине.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_08");	//Эти бестии запросто превратят тебя в большой пылающий факел, если у тебя хватит глупости встать у них на пути.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_09");	//Если от клыков и когтей еще как-то можно увернуться, то от огненного дыхания этих тварей практически невозможно.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_10");	//Насколько мне известно, единственный безопасный способ убить их - это научиться метко стрелять из лука или арбалета.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_13");	//Подыщи себе местечко, где эта тварь не достанет тебя, затем хорошо прицелься и стреляй!
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_14");	//Прикончить эту тварь - дело не из легких.
};

func void dia_hun_741_falk_talkabouthunt_wolf()
{
	if(BONUSHUNTTELL_08 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_08 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Wolf_01_00");	//Расскажи мне о волках.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_01");	//Волк - очень агрессивное и опасное животное.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_03");	//Конечно, один такой зверь не станет для тебя слишком большой проблемой.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_04");	//Но дело в том, что волки всегда охотятся только стаями.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_05");	//Самое главное при охоте на стаю волков - это, прежде всего, скрытность и потом уже четкость твоих дальнейших действий.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_06");	//Запомни, что выманить поодиночке каждого волка из стаи не получится. Это тебе не падальщики.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_07");	//Если хотя бы один зверь заметит тебя, все остальные его сородичи тотчас же на тебя набросятся.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_08");	//Итак, незаметно подкрадись к стае на расстояние полета стрелы, точно прицелься и стреляй!
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_09");	//Если повезет, одного зверя ты убьешь сразу, и это даст тебе небольшое преимущество.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_10");	//После этого обнажи свое оружие и жди, пока остальные волки не нападут на тебя.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_11");	//Обычно эти звери атакуют свою жертву, обходя ее с разных сторон. Этого нельзя допустить!
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_12");	//Сделай пару выпадов и отступи. Это лишит волков возможности обойти тебя сзади.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_13");	//При атаке выжидай момент, когда волк бросается на тебя, и только тогда наноси удар.
};

func void dia_hun_741_falk_talkabouthunt_snapper()
{
	if(BONUSHUNTTELL_09 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_09 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Snapper_01_00");	//Расскажи мне про снепперов.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_01");	//На этих тварей может охотиться только по-настоящему опытный охотник.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_02");	//Конечно, с одним снеппером ты еще как-нибудь справишься, но чаще всего они охотятся стаями.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_04");	//Никогда не атакуй снепперов в стае из арбалета или лука!
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_06");	//Это привлечет внимание остальных снепперов, и они сразу же бросятся на тебя всем скопом!
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_07");	//Лучше незаметно покрадись и просто позволь одному из них себя обнаружить.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_08");	//Увидев тебя, зверь не захочет упускать свою потенциальную добычу, и медленно начнет двигаться в твою сторону.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_09");	//Постарайся подальше выманить его из стаи, а потом приготовься к бою и жди.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_11");	//Подойдя поближе, снеппер стремительно помчится на тебя. Вот тут и наступает самый ответственный момент.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_12");	//Не пытайся отразить его попытку укусить тебя! Это практически невозможно - у тебя просто не хватит реакции на это.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_13");	//Просто быстро отступи на несколько шагов назад и нанеси один удар! Запомни, только один выпад.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_14");	//Если ты предпримешь попытку нанести сразу несколько ударов, то у тебя не будет времени, чтобы среагировать на следующий бросок зверя.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_15");	//И не вздумай отступать! Жди, пока зверь снова не побежит на тебя.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_16");	//Как только снеппер вновь попытается тебя укусить, снова отпрыгни назад и атакуй.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_19");	//Отлично, да? И чуть не забыл - есть еще кое-что...
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_21");	//Если ты уже вступил в бой с снеппером, не стоит убегать. Это все равно не поможет.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_22");	//Снеппер бегает намного быстрее, чем ты, и без особого труда нагонит тебя.
};

func void dia_hun_741_falk_talkabouthunt_shadow()
{
	if(BONUSHUNTTELL_10 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_10 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Shadow_01_00");	//Расскажи мне о мракорисе.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_03");	//Мракорис - одно из самых опасных созданий, которое мне вообще доводилось встречать!
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_04");	//В большинстве случаев они живут в глубине леса или в пещерах, поскольку не выносят дневного света.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_06");	//Охотятся эти хищники только ночью - их глаза отлично видят в темноте, и в это время суток лучше держаться от него подальше.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_07");	//Воистину, этот зверь необычайно силен и ловок - ты даже и представить себе не можешь, насколько!
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_10");	//Поэтому единственное, что тебе сможет помочь в схватке с ним, - это отличное владение оружием, невероятная ловкость и огромное везение!
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_11");	//Конечно, самый эффективный способ убить мракориса - это использовать арбалет.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_12");	//Однако одного болта вряд ли хватит, чтобы завалить этого зверя. В лучшем случае два или три.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_14");	//Можно еще воспользоваться своим мечом.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_15");	//Незаметно подкрадись к зверю сзади, пока он спит. Размахнись что есть сил и нанеси удар.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_16");	//Потом наноси еще удары одним за другим, пока зверь будет приходить в себя.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_17");	//Как только мракорис развернется к тебе - отскочи на пару шагов назад и прими выжидающую стойку.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_18");	//Когда хищник помчится на тебя и попробует ударить тебя лапой - снова сделай шаг назад, и далее несколько выпадов вперед.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_19");	//Затем снова отступи подальше от зверя и жди его очередной атаки.
};

func void dia_hun_741_falk_talkabouthunt_troll()
{
	if(BONUSHUNTTELL_11 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_11 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Troll_01_00");	//Что я должен знать, если захочу поохотиться на троллей?
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_01");	//Обычно тролли живут высоко в горах, там где много свободного места.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_02");	//Хотя иногда их можно встретить и в других местах, но это большая редкость.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_03");	//Поверь мне, завалить такого монстра - дело просто НЕВЕРОЯТНОЙ сложности!
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_05");	//У троллей настолько крепкая шкура, что обычные болты или стрелы ее даже с близкого расстояния не пробьют.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_06");	//Поэтому единственная возможность убить эту тварь - это сражаться с ним в ближнем бою.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_07");	//Но эти монстры обладают просто чудовищной силой, и если ты пропустишь хотя бы один удар, то от тебя останется одно лишь мокрое место!
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_08");	//Тролли практически не имеют слабых мест, однако у этих существ все-таки есть один очень серьезный недостаток.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_09");	//Из-за своих огромных размеров и массы они крайне неповоротливы.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_10");	//Когда ты начнешь приближаться к троллю, он сначала жутко заревет.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_11");	//Беги к нему, не останавливайся! Твоя основная задача - зайти ему за спину. Там, где тебя не достанут его огромные кулаки.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_12");	//Если сможешь это сделать, - считай, у тебя уже есть преимущество в схватке с ним.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_13");	//Ну а дальше начинай действовать своим мечом. И внимательно следи, чтобы ты оставался при этом у него за спиной.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_14");	//Тебе придется изрядно попотеть, чтобы в конце концов нанести этой твари смертельную рану.
	if(Npc_KnowsInfo(other,dia_hun_741_falk_teachabout))
	{
		AI_Output(other,self,"DIA_HUN_741_TA_Troll_01_16");	//А что насчет черного тролля?
		AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_17");	//Ха! Эта тварь будет пострашней обычного.
		AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_18");	//Скажу тебе лишь одно: в последний раз, когда мы охотились на него, черный тролль одним ударом своего кулака убил сразу двоих наших парней!
		AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_19");	//Так что лучше лишний раз не испытывать судьбу.
	};
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_20");	//На этом острове полно и другой живности, на которую можно поохотиться.
};


instance DIA_HUN_741_FALK_BRINGARROW(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrow_condition;
	information = dia_hun_741_falk_bringarrow_info;
	permanent = FALSE;
	description = "У тебя нет какой-нибудь работы для меня?";
};


func int dia_hun_741_falk_bringarrow_condition()
{
	if(MIS_WOLFFURFALK == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrow_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrow_01_00");	//У тебя нет какой-нибудь работы для меня?
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrow_01_01");	//Нужно отнести вот это письмо в город торговцу Босперу.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrow_01_06");	//Вот, держи его. И постарайся не потерять.
	B_GiveInvItems(self,other,itwr_letterfalk,1);
	MIS_LETTERFALK = LOG_Running;
	Log_CreateTopic(TOPIC_LETTERFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LETTERFALK,LOG_Running);
	B_LogEntry(TOPIC_LETTERFALK,"Фальк попросил меня доставить его письмо торговцу Босперу.");
};


instance DIA_HUN_741_FALK_BRINGARROWFAIL(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrowfail_condition;
	information = dia_hun_741_falk_bringarrowfail_info;
	permanent = FALSE;
	description = "По поводу твоего поручения...";
};


func int dia_hun_741_falk_bringarrowfail_condition()
{
	if((FALKLETTEROPENED == TRUE) && (MIS_LETTERFALK == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrowfail_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_00");	//По поводу твоего поручения...
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_01");	//Да?
	if(BOSPERREFUSEARROW == FALSE)
	{
		if(Npc_HasItems(other,ItRw_Arrow) >= 100)
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_02");	//У меня есть для тебя добрая сотня стрел, о которых ты просишь Боспера в своем письме.
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_03");	//И я могу продать их тебе за весьма умеренную плату.
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_04");	//Что? Ты вскрыл мое письмо?!
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_05");	//Убирайся с глаз моих, идиот!
		}
		else
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_06");	//Из твоего письма Босперу я узнал, что тебе нужны стрелы.
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_07");	//Вот и хотел предложить достать их для тебя. И причем за весьма умеренную плату!
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_08");	//Как? Ты вскрыл мое письмо?! Да как ты посмел это сделать?
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_09");	//Убирайся с глаз моих, идиот!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_10");	//Я отнес твое письмо Босперу, но он послал меня ко всем чертям!
		AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_11");	//Что? Но почему?
		AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_12");	//Просто я случайно вскрыл твое письмо.
		AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_13");	//Что? Да как ты посмел это сделать?!
		AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_16");	//Убирайся с глаз моих, идиот! Я больше не нуждаюсь в твоих услугах.
	};
	MIS_LETTERFALK = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_LETTERFALK);
	FALKPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_FUCKOFF(C_Info)
{
	npc = hun_741_falk;
	nr = 10;
	condition = dia_hun_741_falk_fuckoff_condition;
	information = dia_hun_741_falk_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_741_falk_fuckoff_condition()
{
	if((FALKPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");

	if((Npc_HasItems(other,itam_benkenob) >= 1) || ((FINDFALKGRANDFATHERSEEK_01 == TRUE) && (FINDFALKGRANDFATHERSEEK_01_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE)))
	{
		AI_Output(other,self,"DIA_HUN_741_Falk_FuckOff_01_01");	//Постой! У меня для тебя есть кое-что...
		AI_Output(self,other,"DIA_HUN_741_Falk_FuckOff_01_02");	//От такого ублюдка, как ты, мне ничего не надо! Или ты хочешь, чтобы это за меня сказал тебе мой меч?!
		AI_Output(other,self,"DIA_HUN_741_Falk_FuckOff_01_03");	//Не горячись, а просто выслушай меня! У меня есть новости касательно твоего деда Бена.
		AI_Output(self,other,"DIA_HUN_741_Falk_FuckOff_01_04");	//(меняясь в лице) Что?
		AI_Output(self,other,"DIA_HUN_741_Falk_FuckOff_01_06");	//Хммм. Ну хорошо. Выкладывай, что у тебя там.
		FALKPISSOFF = FALSE;
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_HUN_741_FALK_BRINGARROWDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrowdone_condition;
	information = dia_hun_741_falk_bringarrowdone_info;
	permanent = FALSE;
	description = "По поводу твоего поручения...";
};

func int dia_hun_741_falk_bringarrowdone_condition()
{
	if((BOSPERGIVEARROWS == TRUE) && (Npc_HasItems(other,ITRW_ZUNTARROW) >= 100) && (MIS_LETTERFALK == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrowdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowDone_01_00");	//По поводу твоего поручения...
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_01");	//Да? Тебе есть чем меня порадовать?
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowDone_01_02");	//Вот, Боспер передает тебе сотню клейменых стрел.
	B_GiveInvItems(other,self,ITRW_ZUNTARROW,100);
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_03");	//Отлично! Их-то мне как раз и не хватало!
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowDone_01_04");	//А что это за стрелы?
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_05");	//Ну, как ты уже, наверное, понял - это не простые стрелы.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_06");	//Помимо того, что у них на наконечнике стоит мое клеймо, они еще и намного лучше обычных.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_07");	//Эти стрелы летят куда дальше обычных и наносят больший урон.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_08");	//Наконечник для них выкован из закаленной стали, а их оперение сделано таким особенным способом, что это позволяет стрелять намного точнее.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_10");	//Такие стрелы Боспер делает только для меня.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_11");	//А раньше делал только для моего деда! А отец Боспера, в свою очередь, продавал их только отцу моего деда.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_12");	//Так что, можно сказать, что эти стрелы - наша семейная реликвия!
	MIS_LETTERFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LETTERFALK,LOG_SUCCESS);
	B_LogEntry(TOPIC_LETTERFALK,"Фальк поблагодарил меня за то, что я доставил ему сотню клейменых стрел, которые передал для него Боспер.");
};


instance DIA_HUN_741_FALK_F(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_f_condition;
	information = dia_hun_741_falk_f_info;
	permanent = FALSE;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int dia_hun_741_falk_f_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_teachabout))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_f_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_F_01_00");	//Ты можешь чему-нибудь научить меня?
	AI_Output(self,other,"DIA_HUN_741_Falk_F_01_01");	//Я могу показать тебе, как сражаться двуручным оружием.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Фальк может научить меня сражаться двуручным оружием.");
};


instance DIA_HUN_741_FALK_2H(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_2h_condition;
	information = dia_hun_741_falk_2h_info;
	permanent = TRUE;
	description = "Я хочу научиться владеть двуручным мечом.";
};


func int dia_hun_741_falk_2h_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_f))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_2h_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_2H_01_00");	//Я хочу научиться владеть двуручным мечом.
	Info_ClearChoices(dia_hun_741_falk_2h);
	Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
	Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
	Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
};

func void dia_hun_741_falk_2h_back()
{
	Info_ClearChoices(dia_hun_741_falk_2h);
};

func void dia_hun_741_falk_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60))
	{
		if(FALKTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_01");	//Хорошо, начнем с самого простого.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_02");	//Держи меч горизонтально. Тебе понадобится большой замах, чтобы атаковать противника тяжелым оружием.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_03");	//Подними руку и бей вертикально вниз. Обычно этого достаточно, чтобы избавиться от любого врага.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_04");	//Используй инерцию движения, чтобы вернуться в исходную позицию.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_05");	//Двуручный меч просто идеален для боковых ударов, чтобы держать противника на расстоянии.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_06");	//Попробуй начать с этого.
			FALKTEACHFT = TRUE;
		};
		if((FALKTEACHST == FALSE) && (other.HitChance[NPC_TALENT_2H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_2H_1_01_07");	//Я хочу больше узнать о двуручном мече.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_08");	//Прежде всего, смени исходную стойку. Держи меч вертикально, возьмись за рукоять обеими руками и отведи его в сторону.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_09");	//Теперь быстро отводи его вниз и делай замах от плеча. А теперь - рубящий удар вправо!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_10");	//У противника не будет ни единого шанса.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_11");	//Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_12");	//Развернись, чтобы придать мечу должный разгон - и еще один рубящий удар!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_13");	//Если этого окажется недостаточно, меч по инерции легко вернется в исходное положение.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_14");	//Закончив серию, переходи в блок и жди момента, чтобы атаковать снова.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_15");	//Секрет успеха кроется в чередовании ударов и боевых стоек.
			FALKTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_741_falk_2h);
		Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
	};
};

func void dia_hun_741_falk_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60))
	{
		if(FALKTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_01");	//Хорошо, начнем с самого простого.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_02");	//Держи меч горизонтально. Тебе понадобится большой замах, чтобы атаковать противника тяжелым оружием.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_03");	//Подними руку и бей вертикально вниз. Обычно этого достаточно, чтобы избавиться от любого врага.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_04");	//Используй инерцию движения, чтобы вернуться в исходную позицию.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_05");	//Двуручный меч просто идеален для боковых ударов, чтобы держать противника на расстоянии.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_06");	//Попробуй начать с этого.
			FALKTEACHFT = TRUE;
		};
		if((FALKTEACHST == FALSE) && (other.HitChance[NPC_TALENT_2H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_2H_5_01_07");	//Я хочу больше узнать о двуручном мече.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_08");	//Прежде всего, смени исходную стойку. Держи меч вертикально, возьмись за рукоять обеими руками и отведи его в сторону.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_09");	//Теперь быстро отводи его вниз и делай замах от плеча. А теперь - рубящий удар вправо!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_10");	//У противника не будет ни единого шанса.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_11");	//Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_12");	//Развернись, чтобы придать мечу должный разгон - и еще один рубящий удар!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_13");	//Если этого окажется недостаточно, меч по инерции легко вернется в исходное положение.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_14");	//Закончив серию, переходи в блок и жди момента, чтобы атаковать снова.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_15");	//Секрет успеха кроется в чередовании ударов и боевых стоек.
			FALKTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_741_falk_2h);
		Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
	};
};


instance DIA_HUN_741_FALK_FALKGRANDFATHER(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_falkgrandfather_condition;
	information = dia_hun_741_falk_falkgrandfather_info;
	permanent = FALSE;
	description = "Я нашел одну очень интересную вещь.";
};


func int dia_hun_741_falk_falkgrandfather_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_grand) && (FINDFALKGRANDFATHERSEEK_01 == TRUE) && (Npc_HasItems(other,itwr_falkgrandfather_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_falkgrandfather_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_HUN_741_GF_01_00");	//Я нашел одну очень интересную вещь. И, возможно, она тебя заинтересует.
	AI_Output(self,other,"DIA_HUN_741_GF_01_01");	//Что за вещь?
	AI_Output(other,self,"DIA_HUN_741_GF_01_02");	//Эта старая записка. В ней упоминается имя Бен. Так, кажется, звали и твоего деда. Ведь так?
	AI_Output(self,other,"DIA_HUN_741_GF_01_03");	//(потерянно) Что? Дай мне взглянуть на нее!
	B_GiveInvItems(other,self,itwr_falkgrandfather_01,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_HUN_741_GF_01_05");	//Судя по тексту, ее написал охотник.
	AI_Output(self,other,"DIA_HUN_741_GF_01_06");	//А где ты нашел этот клочок бумаги?
	AI_Output(other,self,"DIA_HUN_741_GF_01_07");	//Недалеко от старых развалин на севере.
	AI_Output(self,other,"DIA_HUN_741_GF_01_08");	//Правда?
	AI_Output(self,other,"DIA_HUN_741_GF_01_09");	//Я не знаю, - может, это и совпадение, но именно туда семь лет назад отправился на охоту мой дед.
	AI_Output(self,other,"DIA_HUN_741_GF_01_10");	//(с грустью) После чего он бесследно пропал.
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
	Info_AddChoice(dia_hun_741_falk_falkgrandfather,"Мне еще раз очень жаль.",dia_hun_741_falk_falkgrandfather_no);
	Info_AddChoice(dia_hun_741_falk_falkgrandfather,"Может быть, я смогу тебе чем-то помочь?",dia_hun_741_falk_falkgrandfather_yes);
};

func void dia_hun_741_falk_falkgrandfather_no()
{
	AI_Output(self,other,"DIA_HUN_741_GF_No_01_02");	//В любом случае сейчас уже ничего нельзя изменить.
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
};

func void dia_hun_741_falk_falkgrandfather_yes()
{
	AI_Output(other,self,"DIA_HUN_741_GF_Yes_01_00");	//Может быть, я смогу тебе чем-то помочь?
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_01");	//Ты? И чем же?
	AI_Output(other,self,"DIA_HUN_741_GF_Yes_01_02");	//Ну, например, узнать, что случилось с твоим дедом.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_06");	//Ты окажешь мне просто огромную услугу, приятель!
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_11");	//Старика Бена всегда интересовали всякие необычные вещи.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_12");	//Кстати, это и было той причиной, по которой он тогда решил отправиться на охоту к тем старым развалинам.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_14");	//Он частенько говорил об этом, и его постоянно мучил вопрос: откуда они там появились и кто их построил.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_15");	//Возможно, эти древние строения каким-то образом и связаны с его исчезновением. Но, скорее всего, это всего лишь догадки.
	AI_Output(other,self,"DIA_HUN_741_GF_Yes_01_16");	//Думаю, для начала этого достаточно. Я начну поиски.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_17");	//Тогда удачи тебе в твоих поисках, приятель!
	FINDFALKGRANDFATHERSEEK_01_DONE = TRUE;
	if(MIS_FALKGRANDFATHERSEEK == FALSE)
	{
		MIS_FALKGRANDFATHERSEEK = LOG_Running;
		Log_CreateTopic(TOPIC_FALKGRANDFATHERSEEK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_Running);
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"После того как Фальк рассказал мне про своего деда Бена, я решил показать ему найденную мной записку, в которой также упоминается имя Бен. Похоже, ее написал именно его дед, - старика Бена всегда интересовало все необычное. Поэтому он мог отправиться на поиски места, откуда мог прийти тот странный зверь, которого Бен подстрелил во время своей последней охоты.");
	}
	else if(MIS_FALKGRANDFATHERSEEK == LOG_Running)
	{
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Я показал Фальку найденную мной записку, в которой упоминается имя Бен. Похоже, ее написал именно его дед, - старика Бена всегда интересовало все необычное. Поэтому он мог отправиться на поиски места, откуда мог прийти тот странный зверь, которого Бен подстрелил во время своей последней охоты.");
	};
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
};


instance DIA_HUN_741_FALK_FALKGRANDFATHERPROGRESS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_falkgrandfatherprogress_condition;
	information = dia_hun_741_falk_falkgrandfatherprogress_info;
	permanent = TRUE;
	description = "По поводу моих поисков...";
};


func int dia_hun_741_falk_falkgrandfatherprogress_condition()
{
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_01_DONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_falkgrandfatherprogress_info()
{
	var int bonuscount;

	bonuscount = FALSE;
	AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_00");	//По поводу моих поисков...
	AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_01");	//Да? Есть какие-нибудь новости?

	if((Npc_HasItems(other,itam_benkenob) >= 1) || ((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE) && (Npc_HasItems(other,itwr_galkgrandfather_02) >= 1)) || ((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE) && (Npc_HasItems(other,itwr_halkgrandfather_03) >= 1)) || ((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE) && (Npc_HasItems(other,itwr_jalkgrandfather_04) >= 1)) || ((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE) && (Npc_HasItems(other,itwr_kalkgrandfather_final) >= 1)) || ((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE) && (Npc_HasItems(other,itwr_lalkgrandfather_finalext) >= 1)))
	{
		AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_02");	//Ты угадал. Я действительно кое-что узнал.
		AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_03");	//Тогда не тяни - говори!

		if(Npc_HasItems(other,itam_benkenob) >= 1)
		{
			if(FINDFALKGRANDFATHERSEEK_02_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_02_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_03_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_03_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_FINAL_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_FINALEXT_DONE = TRUE;
			};
			bonuscount = bonuscount + 500;
			B_GivePlayerXP(bonuscount);
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_04");	//Вот, я нашел этот старый амулет. На его обратной стороне выбито имя 'Бен Кеноб'.
			B_GiveInvItems(other,self,itam_benkenob,1);
			Npc_RemoveInvItems(self,itam_benkenob,1);
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_07");	//Да, мне знакома эта вещица! Значит, мы не ошиблись.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_10");	//Где ты его нашел?
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_11");	//В желудке у одной убитой мною твари - огромной самки богомола.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_13");	//Теперь все ясно. Похоже, эта тварюга и прикончила моего деда.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_15");	//Ладно, с этим уже ничего не поделаешь.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_16");	//Но я благодарю тебя за твою помощь. И в знак моей признательности прими от меня эту скромную награду.
			B_GiveInvItems(self,other,ItMi_Gold,1000);
			MIS_FALKGRANDFATHERSEEK = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_SUCCESS);
   			B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Я принес Фальку амулет, найденный мной в желудке самки богомола. Фальк узнал реликвию своего деда. Бен Кеноб - так звали деда Фалька - погиб. Мои поиски можно считать оконченными.");
		}
		else
		{
			if((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE) && (Npc_HasItems(other,itwr_galkgrandfather_02) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_20");	//Вот, я нашел эту записку в одной из пещер на северо-восточном побережье острова.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_21");	//Правда? Интересно, откуда ему там взяться?
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_22");	//Насколько мне известно, туда можно попасть только на корабле.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_23");	//(в недоумении) Дай-ка взглянуть...
				B_GiveInvItems(other,self,itwr_galkgrandfather_02,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_26");	//Хммм... Очень интересно. Что-нибудь еще?
				FINDFALKGRANDFATHERSEEK_02_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE) && (Npc_HasItems(other,itwr_halkgrandfather_03) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_27");	//Еще одну записку я обнаружил в небольшом расщелье.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_29");	//Дай мне это письмо.
				B_GiveInvItems(other,self,itwr_halkgrandfather_03,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_31");	//Судя по записям, та часть острова его сильно впечатлила!
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_32");	//Похоже, что он решил ее основательно исследовать.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_34");	//Хорошо. Кажется, картина начинает проясняться. Это все, что ты узнал?
				FINDFALKGRANDFATHERSEEK_03_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE) && (Npc_HasItems(other,itwr_jalkgrandfather_04) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_35");	//Этот клочок бумаги я обнаружил в большом каньоне, что расположен на западе той долины.
				B_GiveInvItems(other,self,itwr_jalkgrandfather_04,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_39");	//Хммм...(задумчиво) Он пишет, что посчитал это место слишком опасным.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_40");	//Надеюсь, там с ним ничего плохого не случилось.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_42");	//Есть еще какие-нибудь новости?
				FINDFALKGRANDFATHERSEEK_04_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE) && (Npc_HasItems(other,itwr_kalkgrandfather_final) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_43");	//Это письмо я нашел недалеко от болота, что раскинулось на востоке долины.
				B_GiveInvItems(other,self,itwr_kalkgrandfather_final,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_49");	//Интересно. Больше нет новостей?
				FINDFALKGRANDFATHERSEEK_FINAL_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE) && (Npc_HasItems(other,itwr_lalkgrandfather_finalext) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_50");	//Вот записка, которую я нашел на болотах. Бен отправился туда на поиски этой странной твари.
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_51");	//И, похоже, его охота складывается не слишком удачно.
				B_GiveInvItems(other,self,itwr_lalkgrandfather_finalext,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_54");	//Хммм... Да, судя по записям, - так оно и есть.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_55");	//Видать, та бестия оказалась очень хитра, раз ему никак не удается ее выследить.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_58");	//Больше ничего не удалось выяснить?
				FINDFALKGRANDFATHERSEEK_FINALEXT_DONE = TRUE;
			};

			B_GivePlayerXP(bonuscount);
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_59");	//Пока все.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_60");	//Хорошо! Продолжай свои поиски - может, еще что-нибудь выяснится.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_62");	//Пока нет.
		AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_63");	//(грустно) Ладно, если что-либо узнаешь - сообщи мне об этом.
	};
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallange_condition;
	information = dia_hun_741_falk_hunterchallange_info;
	permanent = FALSE;
	description = "А могу я возглавить ваш лагерь?";
};


func int dia_hun_741_falk_hunterchallange_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_main) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallange_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_HCh_01_00");	//А могу я возглавить ваш лагерь?
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_01");	//Поскольку сейчас в лагере именно я являюсь лучшим охотником, то ты можешь бросить мне вызов.
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_02");	//После чего мы устроим охотничий поединок, который и покажет, кто из нас лучший.
	AI_Output(other,self,"DIA_HUN_741_Falk_HCh_01_03");	//Тогда я вызываю тебя!
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_05");	//Одного желания тут будет недостаточно.
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_07");	//Если хочешь потягаться со мной в искусстве охоты, для начала тебе следует заручиться уважением и поддержкой других охотников.
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_10");	//Когда большинство из них выскажется в твою пользу, тогда мы поговорим об этом.
	B_LogEntry(TOPIC_HUNTERSWORK,"Фальк считается самым лучшим охотником среди других парней, обосновавшихся в лагере. Для того чтобы поспорить с ним за это звание, прежде всего, я должен заручиться поддержкой других охотников.");
	CANHUNTERCHALLANGE = TRUE;
};


instance DIA_HUN_741_FALK_CANIHUNTERCHALLANGE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_canihunterchallange_condition;
	information = dia_hun_741_falk_canihunterchallange_info;
	permanent = TRUE;
	description = "Что говорят обо мне в лагере?";
};


func int dia_hun_741_falk_canihunterchallange_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_canihunterchallange_info()
{
	var int ransl;

	AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_00");	//Что говорят обо мне в лагере?
	if(HUNTCHALLENGECOUNT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_01");	//Пока ничего. Так что лучше займись делом вместо того, чтобы трепать языком.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_02");	//Ну, я поговорил с несколькими людьми...
		AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_03");	//И?
		if(HUNTCHALLENGECOUNT >= 7)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_04");	//Кажется, многие в лагере уже готовы поддержать тебя.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_05");	//Ты заслужил уважение многих охотников!
			AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_06");	//Значит ли это, что теперь я смогу поспорить с тобой за звание лучшего охотника?
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_07");	//Да, - считай, что у тебя появился такой шанс!
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_09");	//Теперь, чтобы разрешить наш спор, мы устроим с тобой небольшое состязание.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_10");	//А его победитель сможет назвать себя самым лучшим охотником этого лагеря.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_14");	//Слушай меня внимательно...
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_15");	//Где-то на острове водится один довольно редкий зверек. Охотники дали ему прозвище Слокерс.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_16");	//На вид это создание немного похоже на падальщика, но, в отличие от этих глупых птиц, оно довольно хитрое и крайне осторожное.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_17");	//Многие пытались его выследить, но никому так и не удалось этого сделать.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_19");	//Именно на него мы будем охотиться.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_20");	//Надо выследить этого зверька и подстрелить его, а в качестве доказательства принести снятую с него шкуру.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_21");	//Если сможешь сделать это раньше, чем я, то выиграешь наш спор...(с сомнением)
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_23");	//Так что не теряй времени и отправляйся на охоту.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_24");	//Я отправлюсь чуть позже - дам тебе небольшой шанс. (смеется)
			AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_25");	//Тогда до встречи.
			TIMER_HUNTERCHALLANGE = Wld_GetDay();
			MIS_HUNTERCHALLANGE = LOG_Running;
			Log_CreateTopic(TOPIC_HUNTERCHALLANGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HUNTERCHALLANGE,LOG_Running);
			B_LogEntry(TOPIC_HUNTERCHALLANGE,"Я решил бросить Фальку вызов и поспорить с ним за звание лучшего охотника в лагере. Фальк предложил мне состязание, в котором победитель на правах сильнейшего обретет этот статус. Суть состязания заключается в следующем: выследить и подстрелить небольшого зверька по прозвищу Слокерс. Судя по описанию Фалька, это существо напоминает падальщика. В качестве доказательства того, что именно я первым прикончил этого зверя, мне достаточно предъявить Фальку шкуру убитого Слокерса.");
			Log_AddEntry(TOPIC_HUNTERSWORK,"Фальк принял мой вызов. Теперь все зависит только от меня - смогу ли я всем доказать, что по праву могу носить звание самого лучшего охотника.");
			Npc_ExchangeRoutine(self,"HuntSlokers");
			AI_StopProcessInfos(self);
			ransl = Hlp_Random(7);

			if(ransl == 0)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_SLOKERS_01");
			}
			else if(ransl == 1)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_MEDIUMFOREST_KAP2_29");
			}
			else if(ransl == 2)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT8_M_04");
			}
			else if(ransl == 3)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_CITY_TO_FOREST_32");
			}
			else if(ransl == 4)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_TAVERNE_TROLLAREA_03_03");
			}
			else if(ransl == 5)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_FARM3_PATH_11_SMALLRIVER_03");
			}
			else if(ransl == 6)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_BIGFARM_LAKE_03_MOVEMENT13");
			}
			else
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_SLOKERS_01");
			};
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_31");	//(улыбается) Похоже, ты уже заручился поддержкой некоторых охотников. Совсем неплохо, приятель!
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_32");	//Правда, этого еще недостаточно, чтобы ты смог бросить мне вызов.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_34");	//Но ты на правильном пути...
		};
	};
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGEPROGRESS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallangeprogress_condition;
	information = dia_hun_741_falk_hunterchallangeprogress_info;
	permanent = TRUE;
	description = "Как идет охота?";
};


func int dia_hun_741_falk_hunterchallangeprogress_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_HUNTERCHALLANGE == LOG_Running) && (TIMER_HUNTERCHALLANGE <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallangeprogress_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_HChProgress_01_00");	//Как идет охота?
	AI_Output(self,other,"DIA_HUN_741_Falk_HChProgress_01_01");	//Пока похвастаться нечем. Похоже, эту тварь действительно днем с огнем не сыщешь.
	AI_Output(self,other,"DIA_HUN_741_Falk_HChProgress_01_02");	//Но будь уверен - от меня она точно не уйдет, и я выиграю наш спор.
	AI_Output(other,self,"DIA_HUN_741_Falk_HChProgress_01_03");	//Это мы еще посмотрим!
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGEDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallangedone_condition;
	information = dia_hun_741_falk_hunterchallangedone_info;
	permanent = TRUE;
	description = "Я выиграл наш спор!";
};


func int dia_hun_741_falk_hunterchallangedone_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_Running) && (Npc_HasItems(other,itat_slokersfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallangedone_info()
{
	B_GivePlayerXP(500);
	self.flags = 0;
	AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_00");	//Я выиграл наш спор!
	AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_02");	//У меня есть шкура Слокерса.
	AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_03");	//Да ладно? Этого просто не может быть!
	B_GiveInvItems(other,self,itat_slokersfur,1);
	Npc_RemoveInvItems(self,itat_slokersfur,1);
	AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_05");	//Невероятно! Глазам своим не верю...(совсем растерянно) Но как тебе удалось выследить этого зверя?
	AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_06");	//Это было довольно просто. Ну что, теперь ты готов признать тот факт, что именно я - лучший охотник в лагере?
	AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_07");	//(вздыхая) Ну да, выходит что так. Что же - ты лучший, приятель!

	if((hero.attribute[ATR_DEXTERITY] > hero.attribute[ATR_STRENGTH]) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM) && (hero.guild != GIL_NDM) && (hero.guild != GIL_NDW) && (hero.guild != GIL_NOV) && (hero.guild != GIL_GUR))
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_09");	//Так что прими мои поздравления, и с ними... (замешкался) ...еще этот кереновый лук.
		B_GiveInvItems(self,other,itrw_shadowbow,1);
		AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_10");	//Что это за лук?
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_12");	//Лучшего оружия в руках я еще не держал!
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_13");	//Он сделан из дерева старого керенового дуба, который произрастает в только в далеких лесах Миртаны, и в свое время достался мне от моего деда Бена.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_15");	//Правда, для стрельбы из этого лука тебе понадобятся особенные стрелы, немного не похожие на обычные.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_17");	//Их сможет сделать торговец Боспер.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_18");	//Просто покажи ему этот лук, и он все поймет.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_19");	//Ну что ж, удачи тебе, приятель!
		Log_AddEntry(TOPIC_HUNTERSWORK,"Кроме того, Фальк вручил мне кереновый лук. Для стрельбы из него мне понадобятся особенные стрелы, но их мне без проблем сможет сделать Боспер, если я покажу ему этот лук.");
		TakeShadowBow = TRUE;
	};

	MIS_HUNTERCHALLANGE = LOG_SUCCESS;
	MIS_HUNTERSWORK = LOG_SUCCESS;
	SAVESPOTHUNTER = TRUE;
	Log_SetTopicStatus(TOPIC_HUNTERCHALLANGE,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_HUNTERSWORK,LOG_SUCCESS);
	B_LogEntry(TOPIC_HUNTERCHALLANGE,"Я принес Фальку шкуру Слокерса. Он был обескуражен моей победой, но сдержал слово и признал за мной право зваться лучшим охотником в лагере.");
};


instance DIA_HUN_741_FALK_GATHERARMY(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_gatherarmy_condition;
	information = dia_hun_741_falk_gatherarmy_info;
	permanent = FALSE;
	description = "Ты, кажется, чем-то взволнован.";
};

func int dia_hun_741_falk_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmy_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmy_01_00");	//Ты, кажется, чем-то взволнован.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmy_01_01");	//Кругом полным полно орков!
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmy_01_06");	//Хорошо, что наш лагерь находится вдалеке от главной дороги, и орки его пока не нашли.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmy_01_08");	//И куда, черт возьми, подевались все паладины короля? Разве не они должны нас защищать от этих тварей?
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmy_01_09");	//Лорд Хаген уже собирается выступить со своими паладинами против них.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmy_01_10");	//Но у него пока что недостаточно людей, чтобы дать им открытый бой.
};


instance DIA_HUN_741_FALK_GATHERARMYANSWER(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_gatherarmyanswer_condition;
	information = dia_hun_741_falk_gatherarmyanswer_info;
	permanent = FALSE;
	description = "Кстати, а вы сами не хотели бы присоединиться к его армии?";
};

func int dia_hun_741_falk_gatherarmyanswer_condition()
{
	if(Npc_KnowsInfo(hero,DIA_HUN_741_Falk_GatherArmy) == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmyanswer_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_01");	//А вы сами не хотели бы присоединиться к армии паладинов?
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_02");	//Уверен, что ваша помощь не была бы лишней.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_03");	//Ты предлагаешь нам сражаться с орками? Но мы же охотники, а не воины!
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_04");	//Конечно, любой из нас достаточно хорошо владеет мечом и луком, но, боюсь, что в открытом бою у нас против них нет никаких шансов.

	if((MIS_BAREMCRAWLERARMOR == LOG_SUCCESS) && !Npc_IsDead(hun_744_barem))
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_05");	//К тому же у нас даже доспехов нормальных нет... Ну, кроме Барема, конечно.
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_06");	//Ему каким-то образом удалось раздобыть себе отличный доспех, сделанный из панцирей ползунов.
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_08");	//То тряпье, что на мне и на остальных парнях, вряд ли сможет надежно защитить нас от орочьих топоров.
		AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_09");	//А если я достану вам такие же доспехи?
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_10");	//К тому же у нас даже доспехов нормальных нет.
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_11");	//То тряпье, что на мне и на остальных парнях, вряд ли сможет надежно защитить нас от орочьих топоров.
		AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_12");	//А если я достану вам доспехи?
	};

	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_14");	//В них мы бы чувствовали себя более уверенно, чем сейчас.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_15");	//И сколько, в таком случае, вам нужно доспехов?
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_16");	//Ну, с учетом всех остальных парней, думаю, десяти комплектов вполне хватит.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_17");	//Я посмотрю, что можно сделать.
	MIS_HUNTERSARMOR = LOG_Running;
	Log_CreateTopic(TOPIC_HUNTERSARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUNTERSARMOR,LOG_Running);
	B_LogEntry(TOPIC_HUNTERSARMOR,"Я поговорил с Фальком, главой охотников. Кажется, они тоже не прочь присоединиться к армии лорда Хагена. Однако, выходить против целой армии орков в обычных охотничьих доспехах, - Фальк считает делом глупым и безрассудным. Если я смогу достать для них какие-нибудь более прочные доспехи, то они с радостью помогут паладинам в войне с орками. Десяти комплектов брони будет достаточно.");
	Log_AddEntry(TOPIC_HUNTERSARMOR,"Насколько я помню, наемник Вольф умел делать доспехи из панцирей ползунов. Думаю, они вполне бы подошли охотникам.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_741_FALK_GATHERARMYANSWERDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_gatherarmyanswerdone_condition;
	information = dia_hun_741_falk_gatherarmyanswerdone_info;
	permanent = TRUE;
	description = "Я достал вам доспехи.";
};


func int dia_hun_741_falk_gatherarmyanswerdone_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (Npc_HasItems(hero,ITAR_DJG_Crawler) >= 10))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmyanswerdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_01");	//Я достал вам доспехи.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_03");	//Вот, держи. Тут десять штук, как ты и просил.
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,10);
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_04");	//(оценивающе) Отличные доспехи! И, главное, с виду очень прочные.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_07");	//Хорошо, мы выступим против орков!
	HUN_JOINHAGEN = TRUE;
	MIS_HUNTERSARMOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HUNTERSARMOR,LOG_SUCCESS);
	B_LogEntry(TOPIC_HUNTERSARMOR,"Я достал охотникам новые доспехи, и Фальк остался доволен.");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Охотники решили примкнуть к армии паладинов. Уверен, что эта новость порадует лорда Хагена.");
};


instance DIA_HUN_741_FALK_TRAVELONBIGLAND(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_travelonbigland_condition;
	information = dia_hun_741_falk_travelonbigland_info;
	permanent = FALSE;
	description = "Не хочешь со мной отправиться на материк?";
};


func int dia_hun_741_falk_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_741_Falk_TravelOnBigLand_01_00");	//Не хочешь со мной отправиться на материк?
	AI_Output(self,other,"DIA_HUN_741_Falk_TravelOnBigLand_01_01");	//Неплохая идея, приятель!
	AI_Output(self,other,"DIA_HUN_741_Falk_TravelOnBigLand_01_02");	//Я уже давно хотел побывать там.
	AI_Output(other,self,"DIA_HUN_741_Falk_TravelOnBigLand_01_04");	//Тогда я жду тебя на корабле.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	FALKTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Охотник Фальк решил плыть вместе со мной. Он давно хотел побывать на большой земле.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_Falk_IshiCurrat(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_IshiCurrat_condition;
	information = DIA_HUN_741_Falk_IshiCurrat_info;
	permanent = TRUE;
	description = "Как ты думаешь, кого-нибудь заинтересует этот трофей?";
};

func int DIA_HUN_741_Falk_IshiCurrat_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmor == TRUE) && (Npc_HasItems(hero,ItAt_CurratIshi) >= 1))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_IshiCurrat_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_00");	//Как ты думаешь, кого-нибудь заинтересует этот трофей?
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_01");	//(с интересом) Дай-ка взглянуть.
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_02");	//Вот.
	B_GiveInvItems(other,self,ItAt_CurratIshi,1);
	Npc_RemoveInvItems(self,ItAt_CurratIshi,1);

	if(Trophy_IshiCurrat == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_IshiCurrat,Npc_HasItems(other,ItUt_IshiCurrat));
		Trophy_IshiCurrat = FALSE;
	};

	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_03");	//Ого! Откуда у тебя эта штуковина?
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_04");	//Что, впечатляет?
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_05");	//Скажешь тоже! Я еще ни разу в жизни не видел ничего подобного.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_06");	//На первый взгляд она напоминает закостеневшее жало твари чудовищных размеров. Хотя...
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_08");	//(задумчиво) А знаешь, я тут подумал...
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_09");	//...и?
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_10");	//Пожалуй, оставлю-ка я этот трофей себе. Ты ведь не против?
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_11");	//Ну, все зависит от того, что ты можешь предложить мне взамен.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_12");	//Справедливо. Вот, у меня с собой есть очень редкий магический напиток.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_13");	//Правда, мне неизвестны его свойства. Но я думаю, он стоит не меньше, чем твоя штуковина.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_14");	//Ну как, по рукам?
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_15");	//Ладно, оставь себе.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_16");	//(довольно) Ну и славно. Вот, держи свой напиток! Прям как знал, что для тебя берег.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
};

instance DIA_HUN_741_FALK_NeedMorePeople(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_NeedMorePeople_condition;
	information = dia_hun_741_falk_NeedMorePeople_info;
	permanent = FALSE;
	description = "Значит, я теперь тут главный?";
};

func int dia_hun_741_falk_NeedMorePeople_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_SUCCESS) && (FalkHunters > 0))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_NeedMorePeople_info()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 500;
	AI_NoticePrint(3000,4098,NAME_Addon_HuntBonus);
	HuntBonus = TRUE;
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_00");	//Значит, я теперь тут главный?
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_01");	//Выходит, что да. И тут начинается для тебя самое интересное!
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_02");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_03");	//Как старший охотник, ты теперь должен будешь следить за всеми делами в лагере.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_04");	//Кроме того, тебе придется решать различные вопросы с городскими торговцами.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_05");	//Например, насчет поставок мяса и шкур в город.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_06");	//Эммм... знаешь, я тут подумал... давай лучше все останется так, как есть.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_07");	//А мне вполне хватит и одного лука.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_08");	//(смеется) То-то же, приятель! Быть главным - это не просто пустые слова.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_09");	//Это еще и большая ответственность. В том числе и за тех ребят, что здесь живут.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_10");	//Кстати, раз мы заговорили про парней...
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_11");	//Мне кажется, нам в лагере не помешали бы новые охотники.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_13");	//Заказов от городских торговцев в последнее время все больше и больше. Особенно на мясо.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_14");	//Похоже, эти жирные олухи хотят как следует запастись провизией на случай того, если орки возьмут город в кольцо.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_15");	//И естественно, как ты понимаешь, людей на всех не хватает!
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_16");	//Так что, если хочешь принести пользу лагерю, можешь заняться этим вопросом.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_17");	//И где мне их искать?
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_18");	//Не знаю. Попробуй поискать их в городе или где-нибудь в округе. 
	MIS_NewHunters = LOG_Running;
	Log_CreateTopic(TOPIC_NewHunters,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NewHunters,LOG_Running);
	B_LogEntry_Quiet(TOPIC_NewHunters,"Фальк считает, что ему бы не помешала пара новых охотников в лагере. Его люди не справляются, поскольку количество заказов возросло.");
};

var int FalkHuntersUp;
var int FalkAbountNewHanters;

instance DIA_HUN_741_FALK_NeedMorePeople_Done(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_NeedMorePeople_Done_condition;
	information = dia_hun_741_falk_NeedMorePeople_Done_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_hun_741_falk_NeedMorePeople_Done_condition()
{
	if((MIS_NewHunters == LOG_Running) && (TalbinBecameHunt == TRUE) && (Npc_IsDead(VLK_4132_Talbin_NW) == FALSE) && (Talbin_NW_InCamp == FALSE))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (GestatInHorinis == TRUE) && (Npc_IsDead(VLK_4149_Gestath) == FALSE) && (Gestath_InCamp == FALSE))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (BartokBecameHunt == TRUE) && (Npc_IsDead(VLK_440_Bartok) == FALSE) && (Bartok_InCamp == FALSE))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (FalkHuntersUp >= FalkHunters))
	{
		return TRUE;
	};

	return FALSE;
};

func void dia_hun_741_falk_NeedMorePeople_Done_info()
{
	var int Xp_Hunt;

	if(FalkHuntersUp < FalkHunters)
	{
		if(FalkAbountNewHanters == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_00");	//Отличные новости! В лагере появились новые охотники.
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_01");	//Пока тебя не было, в лагере еще появились новые охотники.
		};

		AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_20");	//Кто именно?

		if((TalbinBecameHunt == TRUE) && (Npc_IsDead(VLK_4132_Talbin_NW) == FALSE) && (Talbin_NW_InCamp == FALSE))
		{
			Xp_Hunt += 500;
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_02");	//Парень по имени Тальбин. По мне так очень хороший охотник!
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_03");	//Он, безусловно, будет нам полезен.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_04");	//Ясно. Кто-нибудь еще?
			Talbin_NW_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if((GestatInHorinis == TRUE) && (Npc_IsDead(VLK_4149_Gestath) == FALSE) && (Gestath_InCamp == FALSE))
		{
			Xp_Hunt += 300;
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_05");	//Охотник Гештат. Я знаю этого парня.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_06");	//Заполучить к нам в лагерь такого мастера охоты дорогого стоит!
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_07");	//Я рад, что он пришел. Больше никого?
			Gestath_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if((BartokBecameHunt == TRUE) && (Npc_IsDead(VLK_440_Bartok) == FALSE) && (Bartok_InCamp == FALSE))
		{
			Xp_Hunt += 200;
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_08");	//Его зовут Барток. Хотя он, конечно, немного труслив для охотника.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_09");	//Но это поправимо. А пока пусть пообтирается в лагере.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_10");	//Это все, кто пришел?
			Bartok_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if((FalkHuntersUp >= FalkHunters) || ((Talbin_NW_InCamp == TRUE) && (Gestath_InCamp == TRUE) && (Bartok_InCamp == TRUE)))
		{
			Xp_Hunt += 1000;
			B_GivePlayerXP(Xp_Hunt);
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_11");	//Пока да. Но, полагаю, что теперь нам больше и не нужно.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_12");	//Ты хорошо поработал, приятель. 
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_13");	//Вот, возьми за свои труды. Это кольцо - большая ценность для охотника.
			B_GiveInvItems(self,other,ItRi_HuntRing,1);
			MIS_NewHunters = LOG_Success;
			Log_SetTopicStatus(TOPIC_NewHunters,LOG_Success);
			B_LogEntry(TOPIC_NewHunters,"Фальк полагает, что теперь в лагере достаточно охотников. Я выполнил его просьбу!");
		}
		else
		{
			B_GivePlayerXP(Xp_Hunt);
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_16");	//Пока да. Но нам нужны еше люди.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_17");	//Ну что ж, нужны так нужны.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_18");	//Полагаю, что проблема в людях пока отпала. Не трать больше время на поиски.
		AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_19");	//Как скажешь.
		MIS_NewHunters = LOG_Success;
		Log_SetTopicStatus(TOPIC_NewHunters,LOG_Success);
		B_LogEntry(TOPIC_NewHunters,"Фальк считает, что можно больше не продолжать поиски.");
	};
};


instance DIA_HUN_741_FALK_OrcBiter(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_OrcBiter_condition;
	information = dia_hun_741_falk_OrcBiter_info;
	permanent = FALSE;
	description = "У тебя есть еще работа для меня?";
};

func int dia_hun_741_falk_OrcBiter_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_OrcBiter_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_00");	//У тебя есть еще работа для меня?
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_01");	//Местные поговаривают, что недалеко фермы Бенгара появилась стая орочих кусачей.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_02");	//По всей видимости, они пришли из прохода, что ведет в Долину Рудников.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_03");	//Сама по себе эта тварь не очень опасна. 
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_04");	//Но когда они сбиваются в стаю, то становятся серьезной проблемой!
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_05");	//И что ты хочешь от меня?
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_06");	//Чтобы ты разобрался с ними, конечно! За это Бенгар, да и другие крестьяне в округе, нас щедро отблагодарят.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_07");	//Такая работенка тебя устроит?
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_08");	//Хорошо, я улажу проблему с кусачами.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_09");	//Отлично! Только сообщи мне, как отправишь их на тот свет.
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_10");	//Само собой.
	MIS_OrcBiter = LOG_Running;
	Log_CreateTopic(TOPIC_OrcBiter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcBiter,LOG_Running);
	B_LogEntry(TOPIC_OrcBiter,"Фальк попросил меня уладить проблему с орочими кусачами, которые недавно появились вблизи фермы Бенгара.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrcBiter_Falk_01,"NW_FARM3_PATH_11_SMALLRIVER_112");
	Wld_InsertNpc(OrcBiter_Falk_02,"NW_FARM3_PATH_11_SMALLRIVER_17");
	Wld_InsertNpc(OrcBiter_Falk_03,"NW_FARM3_PATH_11_SMALLRIVER_16");
	Wld_InsertNpc(OrcBiter_Falk_04,"NW_FARM3_PATH_11_SMALLRIVER_11");
	Wld_InsertNpc(OrcBiter_Falk_05,"NW_FARM3_PATH_11_SMALLRIVER_18");
};

instance DIA_HUN_741_FALK_OrcBiter_Done(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_OrcBiter_Done_condition;
	information = dia_hun_741_falk_OrcBiter_Done_info;
	permanent = FALSE;
	description = "Все кусачи мертвы.";
};

func int dia_hun_741_falk_OrcBiter_Done_condition()
{
	if((MIS_OrcBiter == LOG_Running) && (Npc_IsDead(OrcBiter_Falk_01) == TRUE) && (Npc_IsDead(OrcBiter_Falk_02) == TRUE) && (Npc_IsDead(OrcBiter_Falk_03) == TRUE) && (Npc_IsDead(OrcBiter_Falk_04) == TRUE) && (Npc_IsDead(OrcBiter_Falk_05) == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_OrcBiter_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_Done_01_00");	//Все кусачи мертвы.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_Done_01_01");	//Отлично, приятель! Я даже не сомневался, что ты с этим справишься.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_Done_01_02");	//Вот, возьми свою долю за проделанную работу.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_Done_01_03");	//Благодарю. 
	MIS_OrcBiter = LOG_Success;
	Log_SetTopicStatus(TOPIC_OrcBiter,LOG_Success);
	B_LogEntry(TOPIC_OrcBiter,"Я сообщил Фальку о том. что все кусачи мертвы.");
};