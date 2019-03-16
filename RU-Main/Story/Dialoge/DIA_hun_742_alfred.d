const int VALUE_ALFREDSHEEPFUR = 5;
const int VALUE_ALFREDKEILERFUR = 7;
const int VALUE_ALFREDWOLFFUR = 7;
const int VALUE_ALFREDLURKERSKIN = 10;
const int VALUE_ALFREDWARGFUR = 30;
const int VALUE_ALFREDSHARKSKIN = 40;
const int VALUE_ALFREDSHADOWFUR = 70;
const int VALUE_ALFREDPUMAFUR = 100;
const int VALUE_ALFREDICEPUMAFUR = 125;
const int VALUE_ALFREDTROLLFUR = 125;
const int VALUE_ALFREDTROLLBLACKFUR = 250;
const int VALUE_ALFREDTEETH = 10;
const int VALUE_ALFREDTROLLTOOTH = 150;
const int VALUE_ALFREDCLAW = 8;
const int VALUE_ALFREDLURKERCLAW = 10;
const int VALUE_ALFREDDRGHORN = 75;
const int VALUE_ALFREDSHADOWHORN = 120;
const int VALUE_ALFREDSHARKTEETH = 60;
const int VALUE_ALFREDDESERTSHARKTEETH = 100;


instance DIA_HUN_742_ALFRED_EXIT(C_Info)
{
	npc = hun_742_alfred;
	nr = 999;
	condition = dia_hun_742_alfred_exit_condition;
	information = dia_hun_742_alfred_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_742_alfred_exit_condition()
{
	return TRUE;
};

func void dia_hun_742_alfred_exit_info()
{
	AI_StopProcessInfos(self);
};


var int alfredhellofirsttime;

instance DIA_HUN_742_ALFRED_FIRSTHI(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_firsthi_condition;
	information = dia_hun_742_alfred_firsthi_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_hun_742_alfred_firsthi_condition()
{
	if(Kapitel <= 5)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_firsthi_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(other,self,"DIA_HUN_742_FirstHi_01_00");	//Как дела?
		if(ALFREDHELLOFIRSTTIME == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_01");	//Да вроде все ничего. Хотя в последнее время в северных лесах стало немного опасно охотиться.
			AI_Output(other,self,"DIA_HUN_742_FirstHi_01_02");	//А что там опасного?
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_03");	//Драгомир говорит, на него там напали скелеты. Откуда они там появились, ума не приложу.
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_04");	//Там, кроме падальщиков, отродясь и вовсе никого не было. А тут...
			if(HEROISHUNTER == FALSE)
			{
				AI_Output(other,self,"DIA_HUN_742_FirstHi_01_05");	//Понятно. А что это за место?
				AI_Output(self,other,"DIA_HUN_742_FirstHi_01_06");	//Это место - лагерь охотников!
				AI_Output(self,other,"DIA_HUN_742_FirstHi_01_07");	//Если хочешь к нам присоединиться, поговори с Фальком. Он тут у нас за главного.
				AI_Output(self,other,"DIA_HUN_742_FirstHi_01_08");	//Думаю, нам бы не помешал еще один охотник.
			};
			ALFREDHELLOFIRSTTIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_09");	//Да вроде все ничего, приятель.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_742_FirstHi_01_10");	//Эй, как дела?
		AI_Output(self,other,"DIA_HUN_742_FirstHi_01_11");	//Не твоего ума дело!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_742_ALFRED_HELLO(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_hello_condition;
	information = dia_hun_742_alfred_hello_info;
	permanent = FALSE;
	description = "Чем ты занимаешься?";
};


func int dia_hun_742_alfred_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_hello_info()
{
	AI_Output(other,self,"DIA_HUN_742_Hello_01_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_HUN_742_Hello_01_01");	//Я охотник. Живу тем, что продаю клыки да шкуры.
	AI_Output(other,self,"DIA_HUN_742_Hello_01_02");	//За это хорошо платят?
	AI_Output(self,other,"DIA_HUN_742_Hello_01_03");	//Если все делаешь правильно, можно сорвать неплохой куш. Главное - научиться разделывать добычу.
	AI_Output(self,other,"DIA_HUN_742_Hello_01_04");	//Я и тебя могу научить этому. Если хочешь, конечно.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Альфред может научить меня разделывать добычу.");
};


instance DIA_HUN_742_ALFRED_NEWS(C_Info)
{
	npc = hun_742_alfred;
	nr = 2;
	condition = dia_hun_742_alfred_news_condition;
	information = dia_hun_742_alfred_news_info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int dia_hun_742_alfred_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_news_info()
{
	AI_Output(other,self,"DIA_HUN_742_News_01_00");	//Что новенького?
	if((Kapitel >= 1) && (MIS_INSWOLFHIDE == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_01");	//В лесу, недалеко от таверны 'Мертвая Гарпия', объявилась большая стая волков.
		AI_Output(self,other,"DIA_HUN_742_News_01_02");	//До недавнего времени все было вроде нормально - она не доставляла местным жителям особых хлопот.
		AI_Output(self,other,"DIA_HUN_742_News_01_03");	//Но пару дней назад эти волки загрызли насмерть одного человека.
		AI_Output(self,other,"DIA_HUN_742_News_01_04");	//Бедолага, видимо, имел неосторожность зайти в лес слишком далеко.
		AI_Output(other,self,"DIA_HUN_742_News_01_05");	//А ты говорил об этом Фальку?
		AI_Output(self,other,"DIA_HUN_742_News_01_06");	//Да, он в курсе. Более того, мы с Драгомиром даже ходили в тот лес, что убить этих тварей.
		AI_Output(self,other,"DIA_HUN_742_News_01_07");	//Но, к сожалению, нам так и не удалось их выследить.
		AI_Output(self,other,"DIA_HUN_742_News_01_08");	//Похоже, эти бестии очень хитрые, и поймать их будет совсем непросто!
		AI_Output(other,self,"DIA_HUN_742_News_01_09");	//И что же теперь?
		AI_Output(self,other,"DIA_HUN_742_News_01_10");	//В скором времени мы вновь собираемся поохотиться на эту стаю.
		AI_Output(self,other,"DIA_HUN_742_News_01_11");	//А пока будем надеяться на то, что никто больше не пострадает.
		AI_Output(other,self,"DIA_HUN_742_News_01_12");	//Понятно.
		MIS_INSWOLFHIDE = LOG_Running;
		Log_CreateTopic(TOPIC_INSWOLFHIDE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSWOLFHIDE,LOG_Running);
		B_LogEntry(TOPIC_INSWOLFHIDE,"Альфред сообщил мне, что неподалеку от таверны 'Мертвая Гарпия' объявилась стая разъяренных волков. Несколько охотников пытались выследить и уничтожить эту стаю, но их поиски не увенчались успехом.");
		Wld_InsertNpc(hunt_wolf_01,"FP_ROAM_NW_HUNTWOLF_01");
		Wld_InsertNpc(hunt_wolf_02,"FP_ROAM_NW_HUNTWOLF_02");
		Wld_InsertNpc(hunt_wolf_03,"FP_ROAM_NW_HUNTWOLF_03");
		Wld_InsertNpc(hunt_wolf_04,"FP_ROAM_NW_HUNTWOLF_04");
	}
	else if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_13");	//Последнее время в этих краях появилось слишком много бандитов.
		AI_Output(self,other,"DIA_HUN_742_News_01_14");	//Поэтому, выходя за пределы лагеря, всегда рискуешь нарваться на парочку этих ублюдков!
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_15");	//Пока никаких новостей.
		AI_Output(self,other,"DIA_HUN_742_News_01_16");	//Хотя, может, это даже и к лучшему.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_17");	//Последнее время тут творятся странные вещи - в округе появились странные люди в черных балахонах.
		AI_Output(self,other,"DIA_HUN_742_News_01_18");	//Интересно, что им тут надо?!
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_19");	//Поговаривают, что небольшая группа наемников отправилась в Долину Рудников. Представляешь, парни хотят поохотиться на драконов!
		AI_Output(self,other,"DIA_HUN_742_News_01_20");	//Интересно, что выйдет из этой их затеи?
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_21");	//Ходят слухи, что кто-то прикончил всех драконов в Долине Рудников. Представляешь?
		AI_Output(self,other,"DIA_HUN_742_News_01_22");	//Я даже и подумать не мог, что такое под силу человеку.
	}
	else if(Kapitel == 6)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_23");	//Хуже не бывает - из лагеря даже носа не покажешь! Все дороги перекрыты патрулями орков.
		AI_Output(self,other,"DIA_HUN_742_News_01_24");	//Если так и дальше пойдет дело, нам всем скоро наступит конец!
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_25");	//Ничего.
	};
};


instance DIA_HUN_742_ALFRED_INSWOLFHIDE(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_inswolfhide_condition;
	information = dia_hun_742_alfred_inswolfhide_info;
	permanent = FALSE;
	description = "Я расправился со стаей волков.";
};


func int dia_hun_742_alfred_inswolfhide_condition()
{
	if((MIS_INSWOLFHIDE == LOG_Running) && Npc_IsDead(hunt_wolf_01) && Npc_IsDead(hunt_wolf_02) && Npc_IsDead(hunt_wolf_03) && Npc_IsDead(hunt_wolf_04))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_inswolfhide_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_742_InsWolfHide_01_00");	//Я расправился со стаей волков.
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_01");	//Неужели? Совсем неплохо!
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_02");	//Хотя это было очень рискованно с твоей стороны, одному охотиться на целую стаю.
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_05");	//Ну ладно. В таком случае позволь мне тебя отблагодарить за то, что ты сделал.
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_06");	//Вот, возьми эти три рога мракориса в качестве награды.
	B_GiveInvItems(self,other,ItAt_ShadowHorn,3);
	AI_Output(other,self,"DIA_HUN_742_InsWolfHide_01_07");	//Спасибо!
	MIS_INSWOLFHIDE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSWOLFHIDE,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSWOLFHIDE,"Альфред поблагодарил меня за то, что я расправился со стаей волков-убийц, и в качестве награды дал мне три рога мракориса.");
};


instance DIA_HUN_742_ALFRED_RESPECT(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_respect_condition;
	information = dia_hun_742_alfred_respect_info;
	permanent = FALSE;
	description = "Я хочу бросить вызов Фальку!";
};


func int dia_hun_742_alfred_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (ALFRED_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_respect_info()
{
	AI_Output(other,self,"DIA_HUN_742_Respect_01_00");	//Я хочу бросить вызов Фальку!
	AI_Output(self,other,"DIA_HUN_742_Respect_01_01");	//Правда? Очень смело с твоей стороны.
	AI_Output(self,other,"DIA_HUN_742_Respect_01_02");	//Фальк - один из самых лучших охотников, которых мне вообще приходилось встречать.
	AI_Output(self,other,"DIA_HUN_742_Respect_01_03");	//Так что я не думаю, что у тебя будет много шансов победить его.
	AI_Output(other,self,"DIA_HUN_742_Respect_01_04");	//Но я все-таки попробую это сделать.
	AI_Output(other,self,"DIA_HUN_742_Respect_01_05");	//Правда, для начала мне нужно заручится поддержкой большинства охотников в этом лагере, завоевав их уважение к себе.
	AI_Output(self,other,"DIA_HUN_742_Respect_01_06");	//И, по всей видимости, ты хочешь поинтересоваться и моим мнением по этому поводу. Верно?
	AI_Output(other,self,"DIA_HUN_742_Respect_01_07");	//Да. Было бы неплохо узнать, что ты думаешь.
	if(MIS_INSWOLFHIDE == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_742_Respect_01_08");	//Хммм... Ну, что касается меня, то ты его вполне заслужил.
		AI_Output(self,other,"DIA_HUN_742_Respect_01_09");	//То, что ты в одиночку разобрался с целой стаей волков-убийц, уже говорит о многом.
		AI_Output(other,self,"DIA_HUN_742_Respect_01_10");	//То есть я могу рассчитывать на твой голос?
		AI_Output(self,other,"DIA_HUN_742_Respect_01_11");	//Можешь. Хотя навряд ли он тебе поможет в поединке с Фальком.
		AI_Output(self,other,"DIA_HUN_742_Respect_01_12");	//Но все равно хочу пожелать тебе удачи.
		B_LogEntry(TOPIC_HUNTERSWORK,"Альфред считает, что я хороший охотник и достоин его уважения. Он поддержит меня, если я решу бросить вызов Фальку.");
		ALFRED_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_Respect_01_15");	//Извини, парень. Но я пока не вижу ни одной причины, по которой мне следовало бы отдать за тебя свой голос.
		AI_Output(self,other,"DIA_HUN_742_Respect_01_17");	//Ты пока что еще никак не проявил себя в этом лагере.
		AI_Output(self,other,"DIA_HUN_742_Respect_01_18");	//Пойми, пара легких поручений еще не делает из тебя хорошего охотника, и тем более не заставляет других относится к тебе с уважением.
	};
};


instance DIA_HUN_742_ALFRED_RESPECTDONE(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_respectdone_condition;
	information = dia_hun_742_alfred_respectdone_info;
	permanent = TRUE;
	description = "Как теперь насчет твоего согласия?";
};


func int dia_hun_742_alfred_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_742_alfred_respect) && (CANHUNTERCHALLANGE == TRUE) && (ALFRED_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_742_RespectDone_01_00");	//Как теперь насчет твоего согласия?
	if(MIS_INSWOLFHIDE == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_01");	//Хммм... Ну, что касается меня, то ты его вполне заслужил.
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_02");	//То, что ты в одиночку разобрался с целой стаей волков-убийц, уже говорит о многом.
		AI_Output(other,self,"DIA_HUN_742_RespectDone_01_03");	//То есть я могу рассчитывать на твой голос?
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_04");	//Можешь. Хотя навряд ли он тебе поможет в поединке с Фальком.
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_05");	//Но все равно хочу пожелать тебе удачи.
		B_LogEntry(TOPIC_HUNTERSWORK,"Альфред считает, что я хороший охотник и достоин его уважения. Он поддержит меня, если я решу бросить вызов Фальку.");
		ALFRED_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_08");	//Ты знаешь мое мнение, и относительно тебя оно пока что не изменилось.
	};
};


instance DIA_HUN_742_ALFRED_TEACHHUNTING(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_teachhunting_condition;
	information = dia_hun_742_alfred_teachhunting_info;
	permanent = TRUE;
	description = "Я хочу научиться разделывать добычу.";
};


func int dia_hun_742_alfred_teachhunting_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_742_alfred_hello) && (ALFREDTEACHALL == FALSE))
	{
		return TRUE;
	};
};


var int dia_hun_742_alfred_teachhunting_onetime;

func void dia_hun_742_alfred_teachhunting_info()
{
	AI_Output(other,self,"DIA_HUN_742_TeachHunting_01_00");	//Я хочу научиться разделывать добычу.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		if(DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_01");	//Если знаешь как, то с убитой твари можно снять шкуру, забрать клыки и когти. Это не так-то просто, но подобные трофеи высоко ценятся.
			AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_02");	//Любой торговец с радостью купит их у тебя.
			DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_03");	//На твоем месте я постарался бы научиться всему как можно быстрее.
		};
		Info_ClearChoices(dia_hun_742_alfred_teachhunting);
		Info_AddChoice(dia_hun_742_alfred_teachhunting,Dialog_Back,dia_hun_742_alfred_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),dia_hun_742_alfred_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),dia_hun_742_alfred_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),dia_hun_742_alfred_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Сдирать кожу рептилий",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),dia_hun_742_alfred_teachhunting_reptileskin);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_04");	//Ну вот - я рассказал все, что знал.
		ALFREDTEACHALL = TRUE;
	};
};

func void dia_hun_742_alfred_teachhunting_back()
{
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_Claws_01_00");	//Как добываются когти?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Claws_01_01");	//На самом деле это очень просто - если ты знаешь, что и как делать. Нужно просто отогнуть коготь вперед - только не назад, и не пытайся его выдергивать!
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Claws_01_02");	//Разумеется, в дело идут далеко не все когти. Чаще всего мы добываем их у ящериц.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_Fur_01_00");	//Как снять шкуру?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Fur_01_01");	//Начинать следует с задней части туши, двигаясь к голове. Главное - подцепить ее, дальше все будет легко. Мех стоит очень дорого.
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Fur_01_02");	//Одежду делают из шкуры волка или мракориса. Присмотревшись к меху, ты поймешь, годится он на что-нибудь или нет.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_Teeth_01_00");	//Как добываются клыки?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Teeth_01_01");	//Главное - не сломать их. Поставь нож примерно на середину зуба, у самого основания и, как рычагом, выковырни его.
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Teeth_01_02");	//Клыки есть у волков, снепперов и мракорисов.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_reptileskin()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_ReptileSkin_01_00");	//А если я захочу снять шкуру с рептилии?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_ReptileSkin_01_01");	//Для этой цели подходят разве что шныги да болотожоры.
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_ReptileSkin_01_02");	//Нужно подрезать шкуру по краям, и дальше она слезет сама. Вот и вся наука.	
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};


instance DIA_HUN_742_ALFRED_TEACHHUNTING_PRETTYMUCH(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_teachhunting_prettymuch_condition;
	information = dia_hun_742_alfred_teachhunting_prettymuch_info;
	permanent = FALSE;
	description = "Твои советы стоят недешево.";
};


func int dia_hun_742_alfred_teachhunting_prettymuch_condition()
{
	if(DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_teachhunting_prettymuch_info()
{
	AI_Output(other,self,"DIA_HUN_742_TeachHunting_PrettyMuch_01_00");	//Твои советы стоят недешево.
	AI_Output(self,other,"DIA_HUN_742_TeachHunting_PrettyMuch_01_01");	//Все здесь имеет свою цену.
	AI_Output(self,other,"DIA_HUN_742_TeachHunting_PrettyMuch_01_02");	//Туша зверя, которую ты не умеешь разделывать, просто сгниет без пользы.
	AI_Output(self,other,"DIA_HUN_742_TeachHunting_PrettyMuch_01_03");	//А ты потеряешь возможность задорого продать его шкуру. Выходит, ты рисковал зря.
};


instance DIA_HUN_742_ALFRED_DRGSNPHORN(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_drgsnphorn_condition;
	information = dia_hun_742_alfred_drgsnphorn_info;
	permanent = FALSE;
	description = "У тебя проблема?";
};


func int dia_hun_742_alfred_drgsnphorn_condition()
{
	if((Kapitel >= 2) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_drgsnphorn_info()
{
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHorn_01_00");	//У тебя проблема? Ты выглядишь немного озадаченным.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_01");	//Да, есть небольшая проблемка. Фальк дал мне заказ: достать рог драконьего снеппера.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_02");	//Ты когда-нибудь встречался с этими зверюшками?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_03");	//Очень милые создания. Откусят тебе голову быстрее, чем ты осознаешь это.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_04");	//Одинокому охотнику даже с одним зверем бывает очень трудно справиться.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_05");	//Не говоря уже о том, что эти твари никогда не охотятся поодиночке!
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHorn_01_06");	//Ты их боишься?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_07");	//Малыш, если бы я боялся, то не стал бы охотником! Дело не в этом.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_09");	//Просто этих зверей в этой части острова практически невозможно встретить.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_10");	//В основном они обитают в Долине Рудников. А там, если ты не в курсе, все кишит орками!
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_11");	//Я не самоубийца, и не хочу попасть в котел к этим зеленокожим тварям в виде жратвы.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_12");	//Вот и ломаю голову, как мне выполнить этот заказ?
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHorn_01_13");	//Может, я смогу тебе помочь в этой опасной охоте?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_15");	//Правда? Это будет очень мило с твоей стороны.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_16");	//Если действительно сможешь принеси мне этот рог, то я обещаю тебе - награду мы разделим поровну. Идет?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_18");	//Приходи, когда у тебя будет этот рог.
	MIS_DRGSNPHORN = LOG_Running;
	Log_CreateTopic(TOPIC_DRGSNPHORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRGSNPHORN,LOG_Running);
	B_LogEntry(TOPIC_DRGSNPHORN,"Охотнику Альфреду нужен рог драконьего снеппера. Он также предупредил меня, что эти создания чертовски опасны и мне надо быть с ними поосторожнее.");
};


instance DIA_HUN_742_ALFRED_DRGSNPHORNDONE(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_drgsnphorndone_condition;
	information = dia_hun_742_alfred_drgsnphorndone_info;
	permanent = FALSE;
	description = "Я достал тебе рог драконьего снеппера.";
};


func int dia_hun_742_alfred_drgsnphorndone_condition()
{
	if((MIS_DRGSNPHORN == LOG_Running) && (Npc_HasItems(other,ItAt_DrgSnapperHorn) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_drgsnphorndone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_00");	//Я достал тебе рог драконьего снеппера. Как ты и просил.
	B_GiveInvItems(other,self,ItAt_DrgSnapperHorn,1);
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHornDone_01_01");	//Ух ты! Где ты его раздобыл? Да, парень, - судя по всему, ты крутой, если смог завалить такого монстра!
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_02");	//Пришлось немного попотеть - эта тварь действительно оказалась очень сильной!
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHornDone_01_03");	//Ладно. Теперь ты можешь расслабиться и получить свое вознаграждение.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHornDone_01_04");	//Вот, как я и обещал - твоя доля!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_05");	//Спасибо!
	MIS_DRGSNPHORN = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DRGSNPHORN,LOG_SUCCESS);
	B_LogEntry(TOPIC_DRGSNPHORN,"Я достал Альфреду рог драконьего снеппера.");
};


instance DIA_HUN_742_ALFRED_PICKPOCKET(C_Info)
{
	npc = hun_742_alfred;
	nr = 900;
	condition = dia_hun_742_alfred_pickpocket_condition;
	information = dia_hun_742_alfred_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_742_alfred_pickpocket_condition()
{
	return C_Beklauen(75,150);
};

func void dia_hun_742_alfred_pickpocket_info()
{
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
	Info_AddChoice(dia_hun_742_alfred_pickpocket,Dialog_Back,dia_hun_742_alfred_pickpocket_back);
	Info_AddChoice(dia_hun_742_alfred_pickpocket,DIALOG_PICKPOCKET,dia_hun_742_alfred_pickpocket_doit);
};

func void dia_hun_742_alfred_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
};

func void dia_hun_742_alfred_pickpocket_back()
{
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
};


instance DIA_HUN_742_ALFRED_TROPHYEXPLAIN(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_trophyexplain_condition;
	information = dia_hun_742_alfred_trophyexplain_info;
	permanent = FALSE;
	description = "Почему охотничьи трофеи так высоко ценятся?";
};


func int dia_hun_742_alfred_trophyexplain_condition()
{
	if((DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == TRUE) || (MIS_DRGSNPHORN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_trophyexplain_info()
{
	AI_Output(other,self,"DIA_HUN_742_TrophyExplain_01_00");	//Почему охотничьи трофеи так высоко ценятся?
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_01");	//По разным причинам.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_02");	//В основном, конечно, потому, что их можно использовать в качестве погонного материала для создания других вещей.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_03");	//Одежда, украшения, доспехи и прочая домашняя утварь - во всем можно найти им применение!
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_04");	//Ну, а некоторым людям просто нравится их коллекционировать. Хотя это уже касается только очень редких трофеев.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_05");	//Кстати, если у тебя вдруг случайно заваляется парочка ненужных тебе вещей, я бы мог с радостью купить их у тебя.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_06");	//Естественно, я не беру все подряд. Меня интересуют только шкуры, клыки и когти.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_07");	//Если тебе они без надобности - приноси их сюда.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_08");	//О цене можешь не беспокоиться! Дороже, чем я, у тебя все равно их никто не купит.
	Log_CreateTopic(TOPIC_HUNTERTRADES,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTRADES,"Альфред покупает шкуры, клыки и когти убитых животных.");
	ALFREDCANBUY = TRUE;
};


instance DIA_HUN_742_ALFRED_TROPHYSELL(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_trophysell_condition;
	information = dia_hun_742_alfred_trophysell_info;
	permanent = TRUE;
	description = "У меня есть парочка трофеев для тебя.";
};


func int dia_hun_742_alfred_trophysell_condition()
{
	if(ALFREDCANBUY == TRUE)
	{
		if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_hun_742_alfred_trophysell_info()
{
	AI_Output(other,self,"DIA_HUN_742_TrophySell_01_00");	//У меня есть парочка трофеев для тебя.
	AI_Output(self,other,"DIA_HUN_742_TrophySell_01_01");	//Отлично! Тогда давай посмотрим на них.
	Info_ClearChoices(dia_hun_742_alfred_trophysell);
	Info_AddChoice(dia_hun_742_alfred_trophysell,Dialog_Back,dia_hun_742_alfred_trophysell_back);
	if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"Отдать все шкуры.",dia_hun_742_alfred_trophysell_fur);
	};
	if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"Отдать все шкуры рептилий.",dia_hun_742_alfred_trophysell_skin);
	};
	if((Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"Отдать все рога.",dia_hun_742_alfred_trophysell_horn);
	};
	if((Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0) || (Npc_HasItems(other,ItAt_DesertSharkTeeth) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"Отдать все клыки и зубы.",dia_hun_742_alfred_trophysell_teeth);
	};
	if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"Отдать все когти.",dia_hun_742_alfred_trophysell_claw);
	};
};

func void dia_hun_742_alfred_trophysell_back()
{
	Info_ClearChoices(dia_hun_742_alfred_trophysell);
};

func void dia_hun_742_alfred_trophysell_fur()
{
	var int counttradefur;
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_SheepFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_00");	//(удивленно) Овечьи шкуры? 
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_01");	//Парень, я думал у тебя есть для меня что-нибудь посерьезнее.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_03");	//Ладно, так уж и быть - возьму!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_04");	//Может быть, сгодятся для чего-нибудь.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SheepFur) * VALUE_ALFREDSHEEPFUR);
		Npc_RemoveInvItems(other,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
	};
	if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_05");	//Ага. Несколько шкур кабана. Совсем неплохо!

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Addon_KeilerFur) * VALUE_ALFREDKEILERFUR);
		Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_07");	//Хммм. Очередные волчьи шкуры.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WolfFur) * VALUE_ALFREDWOLFFUR) + (Npc_HasItems(other,ItAt_IceWolfFur) * VALUE_ALFREDWOLFFUR);
		Npc_RemoveInvItems(other,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
		Npc_RemoveInvItems(other,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_11");	//Шкуры варгов! Хммм. Это очень опасные животные!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_13");	//Я бы так сильно не рисковал своей жизнью.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WargFur) * VALUE_ALFREDWARGFUR) + (Npc_HasItems(other,ItAt_OrcDogFur) * VALUE_ALFREDWARGFUR);
		Npc_RemoveInvItems(other,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
		Npc_RemoveInvItems(other,ItAt_OrcDogFur,Npc_HasItems(other,ItAt_OrcDogFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,ItAt_WhitePuma) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_15");	//Ого, шкура пумы! Достаточно редкая вещица.
		AllCountGold = AllCountGold + (Npc_HasItems(other,itat_pumafur) * VALUE_ALFREDPUMAFUR);
		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WhitePuma) * VALUE_ALFREDICEPUMAFUR);
		Npc_RemoveInvItems(other,itat_pumafur,Npc_HasItems(other,itat_pumafur));
		Npc_RemoveInvItems(other,ItAt_WhitePuma,Npc_HasItems(other,ItAt_WhitePuma));
		counttradefur = counttradefur + 1;
	};
	if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_17");	//Ха! Да это же шкура мракориса! Кто бы мог подумать.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_20");	//Этот мех стоит очень больших денег, так что я возьму у тебя все.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_ShadowFur) * VALUE_ALFREDSHADOWFUR);
		Npc_RemoveInvItems(other,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		counttradefur = counttradefur + 1;
	};
	if(Npc_HasItems(other,ItAt_TrollFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_21");	//Не может быть! Глазам своим не верю!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_22");	//Это же настоящая шкура тролля!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_24");	//Охота на них - очень опасное занятие.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_25");	//Но даже за один такой трофей ты выручишь уйму денег!

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollFur) * VALUE_ALFREDTROLLFUR);
		Npc_RemoveInvItems(other,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
		counttradefur = counttradefur + 2;
	};
	if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_26");	//Невероятно! У тебя есть шкура черного тролля!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_28");	//Это же самый ценный трофей, который можно добыть охотой.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_29");	//Да, парень, - ты не перестаешь меня удивлять!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_31");	//Любой торговец оторвет у тебя с руками такую вещицу.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollBlackFur) * VALUE_ALFREDTROLLBLACKFUR);
		Npc_RemoveInvItems(other,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
		counttradefur = counttradefur + 3;
	};

	AI_Output(other,self,"DIA_HUN_742_TrophySell_Fur_01_33");	//Это все, что у меня есть.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};

	if(counttradefur > 5)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_34");	//Ну, этого и так вполне достаточно. Такой большой партии шкур у меня уже давно не было.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_35");	//Но это, конечно, не означает, что они мне больше не нужны.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_36");	//Так что, если у тебя появится что-то новенькое, - приноси!
	}
	else if(counttradefur > 3)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_38");	//Ну что же, совсем неплохо!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_39");	//Хотя я и рассчитывал немного на большее.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_40");	//Но все равно, если у тебя будут еще какие-нибудь шкуры - обязательно приноси их!
	}
	else if(counttradefur >= 1)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_42");	//М-да... В этот раз совсем негусто.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_43");	//Но, может быть, в следующий раз ты порадуешь меня чем-то особенным, правда?
	};
};

func void dia_hun_742_alfred_trophysell_skin()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,itat_LurkerSkin) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_01");	//Шкуры рептилий... Ты что, опять на болоте на лягушек охотился?
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_02");	//Я возьму у тебя их все.

		AllCountGold = AllCountGold + (Npc_HasItems(other,itat_LurkerSkin) * VALUE_ALFREDLURKERSKIN);
		Npc_RemoveInvItems(other,itat_LurkerSkin,Npc_HasItems(other,itat_LurkerSkin));

	};
	if(Npc_HasItems(other,ItAt_SharkSkin) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_03");	//Шкура болотожора... Довольно редкая вещь в наших краях.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_04");	//Я возьму у тебя их все.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SharkSkin) * VALUE_ALFREDSHARKSKIN);
		Npc_RemoveInvItems(other,ItAt_SharkSkin,Npc_HasItems(other,ItAt_SharkSkin));
	};

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_horn()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_ShadowHorn) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_01");	//Рог мракориса. Очень полезный и ценный трофей!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_02");	//Я возьму у тебя их все.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_ShadowHorn) * VALUE_ALFREDSHADOWHORN);
		Npc_RemoveInvItems(other,ItAt_ShadowHorn,Npc_HasItems(other,ItAt_ShadowHorn));
	};
	if(Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_03");	//Ага! У тебя есть рог драконьего снеппера? Это очень хороший товар!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_04");	//Наверное, пришлось побегать, пока снеппер не умер от усталости или старости?

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_DrgSnapperHorn) * VALUE_ALFREDDRGHORN);
		Npc_RemoveInvItems(other,ItAt_DrgSnapperHorn,Npc_HasItems(other,ItAt_DrgSnapperHorn));
	};

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_teeth()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_Teeth) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_01");	//Очень хорошо! Лишняя пара клыков мне никогда не помешает.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_02");	//На них всегда найдется покупатель.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Teeth) * VALUE_ALFREDTEETH);
		Npc_RemoveInvItems(other,ItAt_Teeth,Npc_HasItems(other,ItAt_Teeth));
	};
	if(Npc_HasItems(other,ItAt_TrollTooth) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_03");	//Это что, клык тролля? Отлично, парень!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_04");	//Эта вещица - очень ценный товар, так что давай его сюда.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollTooth) * VALUE_ALFREDTROLLTOOTH);
		Npc_RemoveInvItems(other,ItAt_TrollTooth,Npc_HasItems(other,ItAt_TrollTooth));

	};
	if((Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_DesertSharkTeeth) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_10");	//Зубы болотожора! Чертовски острая вещь!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_11");	//Иногда алхимики готовы озолотить за них.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SharkTeeth) * VALUE_ALFREDSHARKTEETH) + (Npc_HasItems(other,ItAt_DesertSharkTeeth) * VALUE_ALFREDDESERTSHARKTEETH);
		Npc_RemoveInvItems(other,ItAt_SharkTeeth,Npc_HasItems(other,ItAt_SharkTeeth));
		Npc_RemoveInvItems(other,ItAt_DesertSharkTeeth,Npc_HasItems(other,ItAt_DesertSharkTeeth));
	};
	AI_Output(other,self,"DIA_HUN_742_TrophySell_Teeth_01_05");	//Это все, что у меня есть.
	AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_06");	//Хорошо. Но если что, ты знаешь где меня найти.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_claw()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_Claw) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_01");	//Несколько пар когтей - это хорошо. Очень полезный трофей.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_02");	//Я возьму у тебя их все.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Claw) * VALUE_ALFREDCLAW);
		Npc_RemoveInvItems(other,ItAt_Claw,Npc_HasItems(other,ItAt_Claw));
	};
	if(Npc_HasItems(other,ItAt_LurkerClaw) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_03");	//Ага! У тебя есть когти шныга? Это очень хороший товар!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_04");	//Хотя большинство людей не видит никакой разницы между обычными когтями и когтями шныгов, но поверь мне - она есть!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_06");	//Когти у этих тварей куда более острые и крепкие, чем у остальных.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_07");	//А значит, и использовать их можно куда более разностороннее!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_08");	//Давай их сюда - я заплачу тебе за них куда больше, чем за обычные.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_LurkerClaw) * VALUE_ALFREDLURKERCLAW);
		Npc_RemoveInvItems(other,ItAt_LurkerClaw,Npc_HasItems(other,ItAt_LurkerClaw));
	};
	AI_Output(other,self,"DIA_HUN_742_TrophySell_Claw_01_09");	//Это все, что у меня есть.
	AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_10");	//Хорошо! Приноси мне еще когти, если они у тебя будут.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};