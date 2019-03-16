
instance DIA_HUN_743_NIX_EXIT(C_Info)
{
	npc = hun_743_nix;
	nr = 999;
	condition = dia_hun_743_nix_exit_condition;
	information = dia_hun_743_nix_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_743_nix_exit_condition()
{
	return TRUE;
};

func void dia_hun_743_nix_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_743_NIX_WHOSDOGS(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_whosdogs_condition;
	information = dia_hun_743_nix_whosdogs_info;
	permanent = FALSE;
	description = "Это твоя собака?";
};


func int dia_hun_743_nix_whosdogs_condition()
{
	if((HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_whosdogs_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_WhosDogs_01_00");	//Это твоя собака?
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_01");	//Если ты имеешь в виду Клыка, то да, моя. Хотя это и не совсем собака.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_02");	//Ты, быть может, и не поверишь, но Клык от рождения чистокровный волк!
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_06");	//Лет пять назад, во время одной своей охоты, я натолкнулся в лесу на маленького волчонка.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_09");	//Видимо, все его бросили, поскольку рядом с ним никого из волков не оказалось.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_10");	//К тому же у малыша была сломана нога, а с такой раной он стал бы легкой добычей для других зверей.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_11");	//В общем, я подобрал его и принес сюда к нам в лагерь.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_12");	//Пришлось приложить немало усилий, чтобы его выходить. Бедолага был крайне плох и практически без сил.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_13");	//Но, в конце концов, все встало на свои места - нога зажила, а малыш постепенно поправился и окреп.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_14");	//Кстати, за то время, что он провел у нас в лагере, большинство ребят, так же, как и я, очень привыкли к нему.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_15");	//Вот с тех пор этот волчонок и живет вместе с нами, постепенно став таким же настоящим охотником, как и все мы!
};


instance DIA_HUN_743_NIX_NEXDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_nexdog_condition;
	information = dia_hun_743_nix_nexdog_info;
	permanent = FALSE;
	description = "Но разве волк может быть охотником?";
};


func int dia_hun_743_nix_nexdog_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_whosdogs) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_nexdog_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_NexDog_01_00");	//Разве волк может быть охотником?
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_03");	//Конечно. Я и другие парни частенько берем его с собой в лес на охоту.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_05");	//Один раз он даже спас мне жизнь.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_06");	//Так что этот волк значит для меня намного больше, чем просто обычный зверь.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_07");	//Клык - мой друг!
	AI_Output(other,self,"DIA_HUN_743_Nix_NexDog_01_08");	//Ясно.
};


instance DIA_HUN_743_NIX_NEXILLDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_nexilldog_condition;
	information = dia_hun_743_nix_nexilldog_info;
	permanent = FALSE;
	description = "На вид твой друг немного слабоват.";
};


func int dia_hun_743_nix_nexilldog_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_nexdog) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_nexilldog_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_NexIllDog_01_00");	//На вид твой друг немного слабоват.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_01");	//Это кажется только на первый взгляд.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_02");	//На самом деле Клык куда сильнее и выносливее, чем его обычные сородичи.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_06");	//Правда, во время последней охоты один варг тяжело ранил его.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_07");	//Я сделал все, что смог, - но, кажется, этого недостаточно, чтобы он окончательно поправился.
};


instance DIA_HUN_743_NIX_RECOVERDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdog_condition;
	information = dia_hun_743_nix_recoverdog_info;
	permanent = FALSE;
	description = "Могу ли я чем-то помочь?";
};


func int dia_hun_743_nix_recoverdog_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_nexilldog) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdog_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDog_01_00");	//Могу ли я чем-то помочь?
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_01");	//Единственная мысль, которая мне приходит на ум, - это обратиться к Сагитте, лесной целительнице.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_02");	//Она живет в глубине леса за фермой Секоба.
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDog_01_03");	//Я знаю, где она живет.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_04");	//Это хорошо.
	};
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_05");	//Однако я не уверен в том, что и она сможет помочь Клыку.
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDog_01_07");	//Но в любом случае стоит попробовать.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_08");	//Хорошо. Только умоляю тебя, поспеши!
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_09");	//Клык слабеет с каждым днем все больше и больше. Я даже и думать не хочу, что может произойти!
	CLAWTIMER = Wld_GetDay();
	MIS_RECOVERDOG = LOG_Running;
	Log_CreateTopic(TOPIC_RECOVERDOG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RECOVERDOG,LOG_Running);
	B_LogEntry(TOPIC_RECOVERDOG,"Никса беспокоит состояние Клыка, его ручного волка. Во время последней охоты Клыка тяжело ранил варг, и его состояние становится все хуже. Я вызвался помочь Никсу и наведаться к целительнице Сагитте.");
};


instance DIA_HUN_743_NIX_RECOVERDOGBRING(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogbring_condition;
	information = dia_hun_743_nix_recoverdogbring_info;
	permanent = FALSE;
	description = "Я принес лекарcтво для твоего волка.";
};


func int dia_hun_743_nix_recoverdogbring_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (SAGITTAHELPSCLAW == TRUE) && (Npc_HasItems(other,itpo_sagittaclawpotion) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogbring_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogBring_01_00");	//Я принес лекарcтво для твоего волка.
	if(CLAWTIMER < (daynow - 3))
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_01");	//Эх, приятель! Спасибо тебе, конечно.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_02");	//Но, к сожалению, ты опоздал - Клыка больше с нами нет.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_03");	//Он умер, и я ничем не смог ему помочь... хотя был просто обязан это сделать.
		AI_StopProcessInfos(self);
		MIS_RECOVERDOG = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RECOVERDOG);
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_04");	//Правда? Думаешь, оно действительно поможет ему?
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_06");	//А что нужно делать?
		AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogBring_01_07");	//Нужно обработать его рану этим настоем из трав, что она дала.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_08");	//Ладно, давай сюда это лекарcтво.
		AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogBring_01_09");	//Вот, держи.
		B_GiveInvItems(other,self,itpo_sagittaclawpotion,1);
		Npc_RemoveInvItems(self,itpo_sagittaclawpotion,1);
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_10");	//Хорошо! Теперь я обработаю рану...
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_HUNTERCAMP_CLAW");
		AI_AlignToWP(self);
		AI_PlayAni(self,"T_PLUNDER");
		AI_GotoNpc(self,hero);
		AI_TurnToNPC(self,other);
		AI_LookAtNpc(self,other);
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_11");	//Все. Надеюсь, это поможет.
		B_LogEntry(TOPIC_RECOVERDOG,"Я принес лекарство для Клыка, а Никс сразу же обработал им его рану. Теперь остается ждать и надеяться, что Клык поправится.");
		CLAWTIMERRECOVER = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Recover");
		CLAWBEGINRECOVER = TRUE;
	};
};


instance DIA_HUN_743_NIX_RECOVERDOGABOUT(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogabout_condition;
	information = dia_hun_743_nix_recoverdogabout_info;
	permanent = TRUE;
	description = "Как чувствует себя Клык?";
};


func int dia_hun_743_nix_recoverdogabout_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (CLAWBEGINRECOVER == TRUE) && (CLAWHEALTHOK == FALSE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogabout_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogAbout_01_01");	//Как самочувствие Клыка?
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogAbout_01_02");	//Эх...(печально вздыхая) пока все так же плохо.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogAbout_01_03");	//Возможно, должно пройти больше времени, чтобы он окончательно поправился.
};


instance DIA_HUN_743_NIX_RECOVERDOGDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogdone_condition;
	information = dia_hun_743_nix_recoverdogdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_recoverdogdone_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (CLAWHEALTHOK == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_00");	//Эй, приятель!
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogDone_01_01");	//Что?
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_02");	//Благодаря нашим с тобой усилиям и лекарству Сагитты, рана Клыка уже затянулась, и он пошел на поправку.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_03");	//Так что я хочу от всей души поблагодарить тебя за то, что ты помог мне его вылечить.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_04");	//Вот, возьми эту вещицу в качестве моей благодарности.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	MIS_RECOVERDOG = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RECOVERDOG,LOG_SUCCESS);
	B_LogEntry(TOPIC_RECOVERDOG,"Никс сказал мне, что лекарcтво Сагитты помогло Клыку и он пошел поправку.");
};


instance DIA_HUN_743_NIX_CLAWGOHUNT(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_clawgohunt_condition;
	information = dia_hun_743_nix_clawgohunt_info;
	permanent = FALSE;
	description = "Когда теперь на охоту?";
};


func int dia_hun_743_nix_clawgohunt_condition()
{
	if((MIS_RECOVERDOG == LOG_SUCCESS) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_clawgohunt_info()
{
	var C_Npc dog;
	dog = Hlp_GetNpc(nixdog);
	AI_Output(other,self,"DIA_HUN_743_Nix_ClawGoHunt_01_00");	//Когда теперь на охоту?
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_01");	//Не знаю, приятель. У меня пока дел хватает и в лагере.
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_02");	//Кстати, если вдруг сам соберешься поохотиться, то можешь захватить с собой и Клыка.
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_05");	//Заодно и увидишь, на что он способен!
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_06");	//Правда, прямо сейчас этого лучше не делать, - пусть Клык окончательно поправится. Ну, а через пару дней...
	AI_Output(other,self,"DIA_HUN_743_Nix_ClawGoHunt_01_07");	//Хорошо, я подумаю над этим.
	CLAWTIMERCLAWGOHUNT = Wld_GetDay();
	dog.start_aistate = zs_mm_rtn_huntgone;
};


instance DIA_HUN_743_NIX_CLAWREVENGE(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_clawrevenge_condition;
	information = dia_hun_743_nix_clawrevenge_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_743_nix_clawrevenge_condition()
{
	if(KILLCLAWREVENGE == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_clawrevenge_info()
{
	if(NIXFIRSTWARN == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_01");	//Зачем ты убил Клыка, сволочь! Что он сделал тебе плохого?!
		if(MIS_RECOVERDOG == LOG_Running)
		{
			MIS_RECOVERDOG = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_RECOVERDOG);
		}
		else
		{
		};
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_04");	//Идиот! Он был моим другом и не заслужил подобной смерти!
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_05");	//За это я убью тебя, ублюдок!
		AI_StopProcessInfos(self);
		NIXFIRSTWARN = TRUE;
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_06");	//Я помню, что ты сделал, подонок!
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_08");	//Этого я тебе никогда не прощу - умри, ублюдок!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};


instance DIA_HUN_743_NIX_WELCOME(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_welcome_condition;
	information = dia_hun_743_nix_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_welcome_condition()
{
	if((HEROISHUNTER == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_welcome_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_01");	//Эй, поглядите-ка, кто у нас тут. Еще один охотник!
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_03");	//В нашем лагере всегда найдется местечко для таких парней, как ты.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_04");	//А если захочешь остаться с нами, то просто поговори с Фальком.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_05");	//Он у нас тут главный.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_06");	//Эй ты! Чего тебе здесь надо, а?!
		AI_Output(other,self,"DIA_HUN_743_Nix_Welcome_01_07");	//Да я так, просто прогуливаюсь тут.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_09");	//Парень, тут живут охотники и тебе тут не место!
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_11");	//И, если создашь в лагере проблемы, я лично научу тебя хорошим манерам! Понял?!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_743_NIX_WELCOMEHUNT(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_welcomehunt_condition;
	information = dia_hun_743_nix_welcomehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_welcomehunt_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_welcomehunt_info()
{
	AI_Output(self,other,"DIA_HUN_743_Nix_WelcomeHunt_01_00");	//Так ты теперь один из нас, приятель?
	AI_Output(other,self,"DIA_HUN_743_Nix_WelcomeHunt_01_01");	//Да, Фальк принял меня в лагерь.
	AI_Output(self,other,"DIA_HUN_743_Nix_WelcomeHunt_01_02");	//Ну что же, тогда поздравляю! И я наверняка уверен в том, что ты не пожалеешь о своем решении присоединиться к нам.
};


instance DIA_HUN_743_NIX_NEWS(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_news_condition;
	information = dia_hun_743_nix_news_info;
	permanent = TRUE;
	description = "В лагере все спокойно?";
};


func int dia_hun_743_nix_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_news_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_News_01_00");	//В лагере все спокойно?
	if((Kapitel >= 3) && (MIS_INSBLACKSANPPER == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_01");	//Да есть кое-что...
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_02");	//Говорят, что на севере долины около древних пирамид видели какого-то необычного снеппера.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_03");	//В отличие от своих сородичей этот был черным, как ночь! И кроме этого, вел себя как-то странно.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_04");	//Причем, по слухам, этот черный снеппер там охотился в одиночку, хотя обычно эти твари живут только стаей.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_06");	//Некоторые люди поговаривают, что убить такого зверя считается для охотника большой удачей!
		AI_Output(other,self,"DIA_HUN_743_Nix_News_01_07");	//Почему?
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_08");	//Да потому, что повстречать его - это уже огромное везение! Не говоря уже обо всем остальном.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_09");	//Хотя лично для меня это всего лишь глупые суеверия.
		MIS_INSBLACKSANPPER = LOG_Running;
		Log_CreateTopic(TOPIC_INSBLACKSANPPER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSBLACKSANPPER,LOG_Running);
		B_LogEntry(TOPIC_INSBLACKSANPPER,"По словам охотника Никса, рядом с древними пирамидами видели необычного черного снеппера. Поговаривают, что убить такого снеппера для охотника - большая удача.");
		Wld_InsertNpc(blacksnapper,"NW_TROLLAREA_RUINS_22");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_11");	//Вроде да. Однако многих ребят беспокоит появление в округе этих парней в черном.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_12");	//Думаю, они здесь не просто так объявились!
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_13");	//Видимо, что-то ищут или кого-то...(загадачно)
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_16");	//Пока да. Хотя меня немного беспокоит, что в последнее время тут частенько стали появляться орки.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_17");	//Не нравится мне все это.
	}
	else if(Kapitel == 6)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_18");	//Все парни на нервах!
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_19");	//Округа просто кишит орками - просто так и шага отсюда не сделаешь.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_20");	//Ну да. А почему тут должно быть неспокойно?
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_21");	//Скажу даже больше - спокойнее места тебе во всем Хоринисе не найти!
	};
};


instance DIA_HUN_743_NIX_INSBLACKSANPPER(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_insblacksanpper_condition;
	information = dia_hun_743_nix_insblacksanpper_info;
	permanent = FALSE;
	description = "Я убил черного снеппера.";
};


func int dia_hun_743_nix_insblacksanpper_condition()
{
	if((MIS_INSBLACKSANPPER == LOG_Running) && Npc_IsDead(blacksnapper) && (Npc_HasItems(other,itat_clawblacksnapper) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_insblacksanpper_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_743_Nix_InsBlackSanpper_01_00");	//Я убил черного снеппера.
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_01");	//Правда? А где доказательства?
	AI_Output(other,self,"DIA_HUN_743_Nix_InsBlackSanpper_01_02");	//Вот его когти.
	B_GiveInvItems(other,self,itat_clawblacksnapper,1);
	Npc_RemoveInvItems(self,itat_clawblacksnapper,1);
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_03");	//Вот это да... Просто невероятно!
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_04");	//Парень, да ты просто везунчик!
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_05");	//Прими мои поздравления.
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_06");	//Ты просто отличный охотник!
	MIS_INSBLACKSANPPER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSBLACKSANPPER,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSBLACKSANPPER,"Никс был просто изумлен, когда я показал ему когти убитого мной черного снеппера.");
};


instance DIA_HUN_743_NIX_RESPECT(C_Info)
{
	npc = hun_743_nix;
	nr = 4;
	condition = dia_hun_743_nix_respect_condition;
	information = dia_hun_743_nix_respect_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь.";
};


func int dia_hun_743_nix_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (NIX_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_respect_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_Respect_01_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_01");	//И какая же именно?
	AI_Output(other,self,"DIA_HUN_743_Nix_Respect_01_02");	//Я собираюсь вызвать Фалька на поединок, но для этого я должен заручиться поддержкой большинства охотников.
	AI_Output(other,self,"DIA_HUN_743_Nix_Respect_01_03");	//Могу ли я рассчитывать на твой голос?
	if((MIS_RECOVERDOG == LOG_SUCCESS) || (MIS_INSBLACKSANPPER == LOG_SUCCESS))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_04");	//Конечно, приятель!
		if(MIS_RECOVERDOG == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_05");	//Ведь ты помог мне выходить Клыка, а таких вещей я никогда не забываю!
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_06");	//Так что можешь смело идти к Фальку и сказать, что я поддерживаю тебя.
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_07");	//Одно то, что ты смог завалить того черного снеппера, уже говорит о том, что ты - отличный охотник и достоин уважения!
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_08");	//Так что можешь смело идти к Фальку и сказать, что я поддерживаю тебя.
		};
		B_LogEntry(TOPIC_HUNTERSWORK,"Никс отдаст за меня голос, если я решу бросить Фальку вызов.");
		NIX_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_10");	//Ты еще не доказал того, что достоин этого.
		AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_11");	//Так что для начала прояви себя каким-нибудь образом, а потом мы уже и поговорим.
	};
};


instance DIA_HUN_743_NIX_RESPECTDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 4;
	condition = dia_hun_743_nix_respectdone_condition;
	information = dia_hun_743_nix_respectdone_info;
	permanent = TRUE;
	description = "Как насчет моей просьбы?";
};


func int dia_hun_743_nix_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_respect) && (CANHUNTERCHALLANGE == TRUE) && (NIX_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_RespectDone_01_00");	//Как насчет моей просьбы?
	if((MIS_RECOVERDOG == LOG_SUCCESS) || (MIS_INSBLACKSANPPER == LOG_SUCCESS))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_01");	//Ну, почему бы и нет?
		if(MIS_RECOVERDOG == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_02");	//Ведь ты помог мне выходить Клыка, а таких вещей я никогда не забываю!
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_03");	//Так что можешь смело идти к Фальку и сказать, что я поддерживаю тебя.
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_04");	//Одно то, что ты смог завалить того черного снеппера, уже говорит о том, что ты отличный охотник и достоин уважения!
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_05");	//Так что можешь смело идти к Фальку и сказать, что я поддерживаю тебя.
		};
		B_LogEntry(TOPIC_HUNTERSWORK,"Никс отдаст за меня голос, если я решу бросить Фальку вызов.");
		NIX_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_06");	//Парень! Я же сказал, что тебе нужно проявить себя на деле, а не доставать меня вопросами!
		AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_07");	//Что тут непонятного?
	};
};


instance DIA_HUN_743_NIX_HELLO(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_hello_condition;
	information = dia_hun_743_nix_hello_info;
	permanent = FALSE;
	description = "Ты можешь меня чему-нибудь научить?";
};


func int dia_hun_743_nix_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_hello_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_Hello_01_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_HUN_743_Nix_Hello_01_01");	//Я могу показать тебе, как стать более ловким.
	AI_Output(self,other,"DIA_HUN_743_Nix_Hello_01_02");	//Если, конечно, захочешь.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Никс может показать мне, как стать более ловким.");
};


instance DIA_HUN_743_NIX_DEX(C_Info)
{
	npc = hun_743_nix;
	nr = 3;
	condition = dia_hun_743_nix_dex_condition;
	information = dia_hun_743_nix_dex_info;
	permanent = TRUE;
	description = "Покажи мне, как стать более ловким.";
};


func int dia_hun_743_nix_dex_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_hello))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_dex_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_Dex_01_00");	//Покажи мне, как стать более ловким.
	AI_Output(self,other,"DIA_HUN_743_Nix_Dex_01_01");	//Успех охоты во многом зависит от ловкости!
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};

func void dia_hun_743_nix_dex_back()
{
	Info_ClearChoices(dia_hun_743_nix_dex);
};

func void dia_hun_743_nix_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};

func void dia_hun_743_nix_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};


instance DIA_HUN_743_NIX_SHADOWFUR(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_shadowfur_condition;
	information = dia_hun_743_nix_shadowfur_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_shadowfur_condition()
{
	if((Kapitel >= 2) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_shadowfur_info()
{
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_00");	//Эй, постой. У меня к тебе есть одно дельце.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_02");	//Мне позарез нужна шкура мракориса! Но я не могу уйти на охоту - я должен охранять этот лагерь.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_03");	//А вот ты - другое дело! Достань мне эту шкуру, и я обещаю, что ты не пожалеешь об этом.
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFur_01_04");	//Где мне искать мракорисов?
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_05");	//Обычно они живут в пещерах или в глухом лесу.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_06");	//Эти звери не слишком любят дневной свет, поэтому стараются от него как можно лучше спрятаться.
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFur_01_07");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_08");	//Спасибо, приятель. Поверь мне, я в долгу не останусь!
	MIS_SHADOWFURNIX = LOG_Running;
	Log_CreateTopic(TOPIC_SHADOWFURNIX,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHADOWFURNIX,LOG_Running);
	B_LogEntry(TOPIC_SHADOWFURNIX,"Охотнику Никсу нужна шкура мракориса. Он сказал, что обычно эти животные живут в пещерах или тех частях леса, где мало солнца.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_743_NIX_SHADOWFURDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_shadowfurdone_condition;
	information = dia_hun_743_nix_shadowfurdone_info;
	permanent = FALSE;
	description = "Вот шкура мракориса, которую ты просил.";
};


func int dia_hun_743_nix_shadowfurdone_condition()
{
	if((MIS_SHADOWFURNIX == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowFur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_shadowfurdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFurDone_01_00");	//Вот шкура мракориса, которую ты просил.
	B_GiveInvItems(other,self,ItAt_ShadowFur,1);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,1);
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFurDone_01_01");	//Отлично! Наверное, тебе пришлось немного повозиться с этим делом, да?
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFurDone_01_02");	//Совсем немного.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFurDone_01_03");	//Ну тогда ладно! Вот, возьми это золото - ты его честно заработал!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_SHADOWFURNIX = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SHADOWFURNIX,LOG_SUCCESS);
	B_LogEntry(TOPIC_SHADOWFURNIX,"Я достал для охотника Никса шкуру мракориса.");
};


instance DIA_HUN_743_NIXNW_PICKPOCKET(C_Info)
{
	npc = hun_743_nix;
	nr = 900;
	condition = dia_hun_743_nixnw_pickpocket_condition;
	information = dia_hun_743_nixnw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_743_nixnw_pickpocket_condition()
{
	return C_Beklauen(65,90);
};

func void dia_hun_743_nixnw_pickpocket_info()
{
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
	Info_AddChoice(dia_hun_743_nixnw_pickpocket,Dialog_Back,dia_hun_743_nixnw_pickpocket_back);
	Info_AddChoice(dia_hun_743_nixnw_pickpocket,DIALOG_PICKPOCKET,dia_hun_743_nixnw_pickpocket_doit);
};

func void dia_hun_743_nixnw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
};

func void dia_hun_743_nixnw_pickpocket_back()
{
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
};

