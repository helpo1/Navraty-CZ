
instance DIA_ORC_8552_WATCHER_EXIT(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_exit_condition;
	information = dia_orc_8552_watcher_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8552_watcher_exit_condition()
{
	return TRUE;
};

func void dia_orc_8552_watcher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8552_WATCHER_HELLO(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_hello_condition;
	information = dia_orc_8552_watcher_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8552_watcher_hello_condition()
{
	return TRUE;
};

func void dia_orc_8552_watcher_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_01");	//ГРОТАК НАБАР!!!
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_02");	//Человек!?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_03");	//Носить Улу-Мулу!?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_04");	//Чужак быть сильный воин - орки уважать сильный воин! Орки не убивать чужака.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_05");	//Зачем человек прийти сюда?
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_06");	//Мне надо поговорить с орками об одном очень важном деле.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_07");	//Человек прийти говорить с орками. Хорошо.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_08");	//Чужак может говорить с орками. Чужак носить Улу-Мулу - орки уважать чужака!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_12");	//Кто у вас тут главный?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_10");	//Чужак искать Ур-Тралла! Быть большой вождь орков, быть великий воин.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_11");	//Чужак говорить с ним о деле.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_16");	//А где мне найти Ур-Тралла?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_13");	//Чужак идти дальше в глубь горы. Чужак приходить в город и искать там.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_14");	//Понятно.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_15");	//Теперь чужак идти.
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

instance DIA_ORC_8552_WATCHER_DRINK(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_DRINK_condition;
	information = dia_orc_8552_watcher_DRINK_info;
	permanent = FALSE;
	description = "Почему ты постоянно смотришь вниз?";
};

func int dia_orc_8552_watcher_DRINK_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8552_Watcher_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_orc_8552_watcher_DRINK_info()
{
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_01_01");	//Почему ты постоянно смотришь вниз?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_02");	//Вах Грош уронить туда свой фляга с грогом...(качая головой) Быть очень вкусный грог!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_01_03");	//Так спустись вниз и забери ее.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_04");	//Внизу быть очень темно! Вах Грош будет очень долго искать ее.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_05");	//А Ваш Грошу нельзя надолго уходить со свой места.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_06");	//Иначе Фаррок гневаться, Ур-Тралл гневаться, бить Вах Гроша!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_01_07");	//Понимаю, тебе нельзя покидать свой пост.
	MIS_GroshBottle = LOG_Running;
	Log_CreateTopic(TOPIC_GroshBottle,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GroshBottle,LOG_Running);
	B_LogEntry(TOPIC_GroshBottle,"Вах Грош, охранник у моста, уронил вниз свою флягу с грогом. Спуститься за ней он не может, поскольку ему нельзя надолго покидать свой пост.");
};

instance DIA_ORC_8552_WATCHER_DRINK_Done(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_DRINK_Done_condition;
	information = dia_orc_8552_watcher_DRINK_Done_info;
	permanent = FALSE;
	description = "Вот твоя фляга.";
};

func int dia_orc_8552_watcher_DRINK_Done_condition()
{
	if((MIS_GroshBottle == LOG_Running) && (Npc_HasItems(other,ItMi_GroshBottle) >= 1))

	{
		return TRUE;
	};
};

func void dia_orc_8552_watcher_DRINK_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_Done_01_01");	//Вот твоя фляга.
	B_GiveInvItems(other,self,ItMi_GroshBottle,1);
	Npc_RemoveInvItems(self,ItMi_GroshBottle,1);
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_Done_01_02");	//УРАТ ДАР! Вах Грош теперь снова может пить свой грог!
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_Done_01_03");	//Он сильно благодарить человек, что тот помогать Вах Грошу.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_Done_01_04");	//Да не за что.
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 5");
	};

	MIS_GroshBottle = LOG_Success;
	Log_SetTopicStatus(TOPIC_GroshBottle,LOG_Success);
	B_LogEntry(TOPIC_GroshBottle,"Я принес Вах Грошу его флягу.");
};


//--------------------------------------страж шахты в городе--------------------------------------------------


instance DIA_ORC_8901_GuardMine_EXIT(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_exit_condition;
	information = DIA_ORC_8901_GuardMine_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_ORC_8901_GuardMine_exit_condition()
{
	return TRUE;
};

func void DIA_ORC_8901_GuardMine_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8901_GuardMine_HELLO(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_hello_condition;
	information = DIA_ORC_8901_GuardMine_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_ORC_8901_GuardMine_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_ORC_8901_GuardMine_hello_info()
{
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_hello_01_01");	//(грозно) КАР НАТАРАК! Что человек быть надо от Туррак?
};

instance DIA_ORC_8901_GuardMine_Enter(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_Enter_condition;
	information = DIA_ORC_8901_GuardMine_Enter_info;
	permanent = FALSE;
	description = "Что ты тут охраняешь?";
};

func int DIA_ORC_8901_GuardMine_Enter_condition()
{
	return TRUE;
};

func void DIA_ORC_8901_GuardMine_Enter_info()
{
	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Enter_01_01");	//Что ты тут охраняешь?
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_02");	//Туррак смотреть за вход в железная шахта орков!
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_03");	//Никого не впускать, никого не выпускать, если большой вождь не приказать это Туррак.
	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Enter_01_04");	//А если я все-таки захочу войти в нее?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_05");	//Человек не смочь просто так сделать этого! Братья шаманы делать магию у вход в шахта.
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_06");	//Она убивать любого, если не быть братом.
	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Enter_01_07");	//И как быть, если мне вдруг понадобится заглянуть туда?
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_08");	//(грозно) АРУГ НОР! Только большой вождь может разрешить ходить туда.
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_09");	//Тогда дверь откроется и магия не убить человек!
};

//instance DIA_ORC_8901_GuardMine_Closed(C_Info)
//{
//	npc = OrcWarrior_GuardMine;
//	condition = DIA_ORC_8901_GuardMine_Closed_condition;
//	information = DIA_ORC_8901_GuardMine_Closed_info;
//	permanent = FALSE;
//	description = "Почему шахта закрыта?";
//};

//func int DIA_ORC_8901_GuardMine_Closed_condition()
//{
//	if(MIS_EscapeMine == LOG_Success)
//	{
//		return TRUE;
//	};
//};

//func void DIA_ORC_8901_GuardMine_Closed_info()
//{
//	B_GivePlayerXP(200);
//	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Closed_01_01");	//Почему шахта закрыта?
//	AI_PlayAni(self,"T_NO");
//	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Closed_01_02");	//Все рабы сбежать оттуда! Ур-Тралл сильно гневаться!
//	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Closed_01_03");	//Убивать много братов, закрывать шахта. Человек больше не ходить туда!
//};

//-----------------------------------------------------Тар Гор----------------------------------------

instance DIA_Orc_8205_TarGor_EXIT(C_Info)
{
	npc = Orc_8205_TarGor;
	condition = DIA_Orc_8205_TarGor_exit_condition;
	information = DIA_Orc_8205_TarGor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8205_TarGor_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8205_TarGor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8205_TarGor_HELLO(C_Info)
{
	npc = Orc_8205_TarGor;
	condition = DIA_Orc_8205_TarGor_hello_condition;
	information = DIA_Orc_8205_TarGor_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8205_TarGor_hello_condition()
{
	return TRUE;
};

func void DIA_Orc_8205_TarGor_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_01");	//(грозно) КРУШАК КАР! Кто впустить тебя сюда, человек?!
	AI_Output(other,self,"DIA_Orc_8205_TarGor_hello_01_02");	//Спокойно! Ур-Тралл разрешил мне войти в шахту.
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_03");	//Хммм... Ну, если быть так, человек может ходить дальше.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_04");	//Только не создавать тут проблем, человек! И не отвлекать раб от их работа.
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_05");	//Иначе Тар Гор гневаться! Ар Дагар гневаться! Делать человек мертвый...
	AI_StopProcessInfos(self);
};


//-----------------------------------------------------Грок----------------------------------------

instance DIA_Orc_8204_Grok_EXIT(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_exit_condition;
	information = DIA_Orc_8204_Grok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8204_Grok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8204_Grok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_HELLO(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_hello_condition;
	information = DIA_Orc_8204_Grok_hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8204_Grok_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_hello_info()
{
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_01_01");	//КРОК ТАР МОР ТА! УКТ ДАР МАР БАР ДУРАТ ГРОК...
	AI_Output(other,self,"DIA_Orc_8204_Grok_hello_01_02");	//Эммм... я тебя не очень понимаю.
	AI_PlayAni(self,"T_DONTKNOW");
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_01_03");	//УР ДАГАР ТАРОК МОР ДА КУР ЗАР ПАРАК ТУРАБ.
	AI_Output(other,self,"DIA_Orc_8204_Grok_hello_01_04");	//М-да...(похоже, мне надо знать язык орков, чтобы поговорить с этим парнем)
	AI_PlayAni(self,"T_GETLOST2");
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_01_05");	//УКАТАР ТАРК БОР! НАБАР...
	NeedKnowOrcLang = TRUE;

	if((MIS_LowLevel == LOG_Running) && (KnowGrok == TRUE))
	{
		B_LogEntry(TOPIC_LowLevel,"Чтобы поговорить с Гроком, мне надо выучить язык орков. Кто бы мне в этом помог?");
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_HELLO_OK(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_hello_OK_condition;
	information = DIA_Orc_8204_Grok_hello_OK_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8204_Grok_hello_OK_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_hello_OK_info()
{
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_OK_01_01");	//Что тебе быть нужно, человек? Зачем ты тревожить старого Грока?
	AI_Output(other,self,"DIA_Orc_8204_Grok_hello_OK_01_02");	//Мне нужно поговорить с тобой, орк.
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_OK_01_03");	//(удивленно) Человек знать наш язык? Хорошо, Грок говорить с ним.
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_OK_01_04");	//О чем человек хотеть говорить с Грок?
};

instance DIA_Orc_8204_Grok_HowThings(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_HowThings_condition;
	information = DIA_Orc_8204_Grok_HowThings_info;
	permanent = TRUE;
	description = "Как дела, орк?";
};

func int DIA_Orc_8204_Grok_HowThings_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_HowThings_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_HowThings_01_01");	//Как дела, орк?
	AI_Output(self,other,"DIA_Orc_8204_Grok_HowThings_01_02");	//Грок не понимать, какое человек до этого быть дело.
	AI_Output(self,other,"DIA_Orc_8204_Grok_HowThings_01_03");	//Лучше человек ступать делать свои дела и не тревожить старого Грока.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_WhatYouDo(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_WhatYouDo_condition;
	information = DIA_Orc_8204_Grok_WhatYouDo_info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};

func int DIA_Orc_8204_Grok_WhatYouDo_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_WhatYouDo_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_01");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_02");	//Грок тут стоять и смотреть, чтобы никто не спускаться вниз.
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_03");	//А что там внизу?
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_04");	//Там быть большой шахта орков. Но ходить туда нельзя! ХАРАД!
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_05");	//Почему?
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_06");	//Это дело человек не касаться! Касаться только братов.
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_07");	//Хммм... Интересно. А может, все-таки расскажешь?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_08");	//(сердито) Нет. ХАРАД!
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_09");	//Да ну тебя!
};

instance DIA_Orc_8204_Grok_Help(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_Help_condition;
	information = DIA_Orc_8204_Grok_Help_info;
	permanent = FALSE;
	description = "Ты как-то нехорошо выглядишь";
};

func int DIA_Orc_8204_Grok_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8204_Grok_WhatYouDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_Help_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_01");	//Ты как-то нехорошо выглядишь. Болеешь что ли?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_02");	//Грок уже быть очень старый орк... Ему тяжело стоять тут все дни. Мало сил!
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_03");	//Раньше у Грока были зелья братов духа, он восстанавливал ими своя сила.
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_04");	//Но зелья уже давно кончаться! И теперь Грок становится слабым каждый день.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_05");	//А что произойдет, если ты совсем ослабнешь?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_06");	//Если Грок становиться слабый и браты видеть это, то тогда они есть Грок.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_07");	//М-да, хорошие у вас порядки. Но, может быть, я смогу тебе как-то помочь?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_08");	//Человек хотеть помочь Грок?! Грок сильно удивляться этому.
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_09");	//Обычно люди всегда хотеть только убивать Грок.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_10");	//Обычно люди в ваш город не захаживают.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_11");	//Так какие, говоришь, тебе нужны зелья?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_12");	//Зелья, чтобы делать Грока сильным! Тогда Грок сможет стоять тут еще долго.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_13");	//Значит, зелье силы. Попробую его достать.
	MIS_GrokBringPotion = LOG_Running;
	Log_CreateTopic(TOPIC_GrokBringPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GrokBringPotion,LOG_Running);
	B_LogEntry(TOPIC_GrokBringPotion,"Орк по имени Грок уже очень старый и слабеет с каждым днем. Раньше у него были зелья шаманов, которыми он поддерживал свою силу. Но теперь, когда зелья закончились, он ничего не может с этим сделать. Если он совсем ослабнет, то братья просто съедят его.");
};

instance DIA_Orc_8204_Grok_BringPotion(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_BringPotion_condition;
	information = DIA_Orc_8204_Grok_BringPotion_info;
	permanent = FALSE;
	description = "Вот тебе зелье.";
};

func int DIA_Orc_8204_Grok_BringPotion_condition()
{
	if((MIS_GrokBringPotion == LOG_Running) && (Npc_HasItems(hero,ItPo_Perm_STR) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_BringPotion_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Orc_8204_Grok_BringPotion_01_01");	//Вот тебе зелье.
	B_GiveInvItems(other,self,ItPo_Perm_STR,1);
	Npc_RemoveInvItems(self,ItPo_Perm_STR,1);
	B_UseItem(self,ItPo_Perm_STR_Fake);
	AI_Output(self,other,"DIA_Orc_8204_Grok_BringPotion_01_02");	//Грок благодарить человек! Чувствовать, как сила вновь возвращается к нему.
	AI_Output(other,self,"DIA_Orc_8204_Grok_BringPotion_01_03");	//Ну, значит, твоим братьям придется съесть тебя чуть позже.
	AI_Output(self,other,"DIA_Orc_8204_Grok_BringPotion_01_04");	//Человек уметь славно шутить...(хохочет) Гроку это нравиться!
	MIS_GrokBringPotion = LOG_Success;
	Log_SetTopicStatus(TOPIC_GrokBringPotion,LOG_Success);
	B_LogEntry(TOPIC_GrokBringPotion,"Я принес Гроку зелье. Это помогло ему восстановить силы.");
};

instance DIA_Orc_8204_Grok_LowLevel(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_LowLevel_condition;
	information = DIA_Orc_8204_Grok_LowLevel_info;
	permanent = FALSE;
	description = "Мне нужно знать, что случилось на нижнем уровне шахты.";
};

func int DIA_Orc_8204_Grok_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (KnowGrok == TRUE) && (MIS_GrokBringPotion == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_LowLevel_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_01");	//Мне нужно знать, что случилось на нижнем уровне шахты.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_02");	//А почему человек спрашивать об этом именно Грока?
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_03");	//Потому что ты единственный, кто знает причину, вынудившую орков запереть нижний уровень.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_04");	//Грок очень удивляться...(удивленно) Откуда человек знать это?
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_05");	//Плавильщик Хильдур сказал, что ты единственный, кто выжил тогда в шахте.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_06");	//Хммм...(задумчиво) Хорошо! Человек помочь Гроку, и тот в знак благодарности рассказать ему о шахта.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_07");	//Грок действительно все видеть и все знать. Хильдур не обманывать человек!
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_09");	//Это быть очень много зим назад. Когда еще Грок быть сильным воином и охранять шахта внизу.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_10");	//Браты копать очень много руда. Хотеть копать еще больше и больше!
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_11");	//Однажды они откопать одна пещера, где найти очень большой и злой демон.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_12");	//Грок видеть его! Видеть, какой он убивать братов и рабов.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_13");	//Он сильно испугаться и убегать оттуда! А все его браты умирать там.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_14");	//Потом браты запирать шахта и не открывать ее больше никогда. Не тревожить больше злой демон!
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_15");	//Не думаю, что простая решетка смогла бы остановить настоящего демона.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_16");	//Сначала Грок так и думать! Ждать, что демон еще придти сюда.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_17");	//Но прошло много зим, а демон так больше и не появляться.
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_18");	//Интересно, что его тогда остановило?
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_19");	//Грок точно не знать, но думать, что демон что-то охранять.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_20");	//Он видеть тогда в пещере яркий свет. Думать, это быть очень сильный магия!
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_21");	//Ну да, тогда это многое объясняет.
	B_LogEntry(TOPIC_LowLevel,"От Грока я узнал, что в свое время орки откопали пещеру, внутри которой оказался огромный и злой демон. Он убил всех орков, только Гроку удалось избежать гибели. По всей видимости, демон что-то там охранял. Но что именно, Грок не знает. Он видел лишь яркий слепящий свет, озаряющий всю пещеру.");
};

instance DIA_Orc_8204_Grok_GoLevel(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_GoLevel_condition;
	information = DIA_Orc_8204_Grok_GoLevel_info;
	permanent = FALSE;
	description = "А вы не пытались больше убить этого демона?";
};

func int DIA_Orc_8204_Grok_GoLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Orc_8204_Grok_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_GoLevel_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_GoLevel_01_01");	//А вы не пытались больше убить этого демона?
	AI_Output(self,other,"DIA_Orc_8204_Grok_GoLevel_01_02");	//Когда Ар Дагар стать тут главный орк, он посылать туда сильный отряд своих воинов.
	AI_Output(self,other,"DIA_Orc_8204_Grok_GoLevel_01_03");	//Но из них никто не возвращаться! Никто не знать, куда они пропасть.
	AI_Output(self,other,"DIA_Orc_8204_Grok_GoLevel_01_04");	//Больше браты не ходить вниз, чтобы убить демон.
	KnowGrokDemon = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Ар Дагар посылал вниз отряд воинов, но никто из них так и не вернулся.");
};

//-----------------------------------------------------Дабар Шак----------------------------------------

instance DIA_Orc_8206_Dakar_EXIT(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_exit_condition;
	information = DIA_Orc_8206_Dakar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8206_Dakar_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8206_Dakar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8206_Dakar_HELLO(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_hello_condition;
	information = DIA_Orc_8206_Dakar_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8206_Dakar_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Orc_8206_Dakar_hello_info()
{
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_01");	//Что человек тут делать?! Зачем говорить с Дабар Шаку?!
	AI_Output(other,self,"DIA_Orc_8206_Dakar_hello_01_02");	//Я просто осматриваюсь. А что ты тут охраняешь?
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_03");	//Дабар Шак смотреть за печь, смотреть, чтобы человек делать сталь для орков.
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_04");	//Если сталь быть мало, Ар Дагар быть недоволен. Ругать Дабар Шака!
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_05");	//Поэтому Дабар Шак смотреть, чтобы человек работать хорошо. 
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_06");	//Не отдыхать! Только работать, делать сталь. Много сталь...
};

instance DIA_Orc_8206_Dakar_Steel(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_Steel_condition;
	information = DIA_Orc_8206_Dakar_Steel_info;
	permanent = FALSE;
	description = "Зачем вам столько стали?";
};

func int DIA_Orc_8206_Dakar_Steel_condition()
{
	return TRUE;
};

func void DIA_Orc_8206_Dakar_Steel_info()
{
	AI_Output(other,self,"DIA_Orc_8206_Dakar_Steel_01_01");	//Зачем вам столько стали?
	AI_Output(self,other,"DIA_Orc_8206_Dakar_Steel_01_02");	//Орки много воевать! Братам надо много оружия.
};


//-----------------------------------------------------Ар Дагар----------------------------------------


instance DIA_OrcWarrior_MineCommander_EXIT(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_exit_condition;
	information = DIA_OrcWarrior_MineCommander_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineCommander_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineCommander_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineCommander_HELLO(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_hello_condition;
	information = DIA_OrcWarrior_MineCommander_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_OrcWarrior_MineCommander_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_hello_info()
{
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_hello_01_01");	//(гневно) Что человек тут делать?! Почему не работать?
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_hello_01_02");	//Я не из числа твоих рабов.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_hello_01_03");	//Тогда, что тебе быть надо от Ар Дагар?
};

instance DIA_OrcWarrior_MineCommander_WhoYou(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhoYou_condition;
	information = DIA_OrcWarrior_MineCommander_WhoYou_info;
	permanent = FALSE;
	description = "Ты кто?";
};

func int DIA_OrcWarrior_MineCommander_WhoYou_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineCommander_WhoYou_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhoYou_01_01");	//Ты кто?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_02");	//Меня звать Ар Дагар, человек...(грозно) А это быть мой железная шахта.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhoYou_01_03");	//А я думал, шахта принадлежит оркам Ур-Тралла.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_04");	//Да, быть так. Но приказы отдавать тут только я один!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_05");	//Так что человек быть осторожным в своих слова, если не хотеть разгневать Ар Дагар.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_06");	//Иначе знак силы не помочь ему!
};

instance DIA_OrcWarrior_MineCommander_LowLevel(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_LowLevel_condition;
	information = DIA_OrcWarrior_MineCommander_LowLevel_info;
	permanent = FALSE;
	description = "Я хочу спросить про нижний уровень шахты.";
};

func int DIA_OrcWarrior_MineCommander_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (KnowGrokDemon == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_LowLevel_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_LowLevel_01_01");	//Я хочу спросить про нижний уровень шахты.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_02");	//(грозно) Ар Дагар думать, что это мало касаться человек.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_LowLevel_01_03");	//Просто ответь - ты ведь посылал туда своих бойцов?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_04");	//Хммм...(мрачно) Ар Дагар не знать, откуда человек быть известно об этом.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_05");	//Но тот быть прав! Когда-то Ар Дагар хотеть освободить глубокий шахта.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_06");	//Он отправлять туда многих сильный брат, но они все погибать там.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_07");	//Никто не возвращаться к Ар Дагар обратно...
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_LowLevel_01_08");	//Тебе же известно, что там находится внизу?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_09");	//Там быть зло...(мрачно) Огромный зло, которое убивать много братов Ар Дагар!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_10");	//Страшный демон, который не иметь имени, не иметь названия.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_11");	//Ар Дагар больше не посылать туда никто! Не тревожить больше злой демон.
	B_LogEntry(TOPIC_LowLevel,"Ар Дагар подтвердил слова Грока, что когда-то пытался освободить глубокую шахту. Так назвал ее сам Ар Дагар.");
};

instance DIA_OrcWarrior_MineCommander_WhyDemon(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhyDemon_condition;
	information = DIA_OrcWarrior_MineCommander_WhyDemon_info;
	permanent = FALSE;
	description = "Ты знаешь, откуда он вообще мог там взяться?";
};

func int DIA_OrcWarrior_MineCommander_WhyDemon_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_WhyDemon_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhyDemon_01_01");	//Ты знаешь, откуда он вообще мог там взяться?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhyDemon_01_02");	//Ар Дагар не знать этого! Только старый Грок быть там, когда демон пробудиться.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhyDemon_01_03");	//Грок предположил, что он там что-то охранял.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhyDemon_01_04");	//Ар Дагар ничего не известно об этом...(мрачно) Но возможно, Грок быть и прав.
};

instance DIA_OrcWarrior_MineCommander_HelpDemon(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_HelpDemon_condition;
	information = DIA_OrcWarrior_MineCommander_HelpDemon_info;
	permanent = FALSE;
	description = "Я хочу помочь вам рассправиться с демоном.";
};

func int DIA_OrcWarrior_MineCommander_HelpDemon_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_HelpDemon_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_01");		//Я хочу помочь вам расправиться с демоном.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_02");		//(хохочет) Неужели человек возомнить себя великий воин?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_03");		//Злой демон раздавить его как жалкий червяк!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_04");		//На твоем месте я бы не был настолько самоуверен.

	if(MIS_PsicampDemon == LOG_Success)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_01");	//Храм на болотах свободен!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_05");		//Теперь Ар Дагар видеть, что тот не врать ему. Человек уметь хорошо сражаться!
		AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_06");		//А что насчет шахты?
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_08");		//Он разрешать человек идти в глубокий шахта сражаться там с демон.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_09");		//Но у злой демон быть много мертвый слуг! Человек быть тяжело одному ходить туда.
		AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_10");		//И что ты предлагаешь?
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_11");		//У Ар Дагар быть мало сильный воин, чтобы отправлять их вместе с человек. 
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_12");		//Поэтому тот сначала ходить к Ур-Тралл, великий вождь братов. Просить, чтобы тот дать много сильный воин.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_13");		//Они пойти вместе с человек. Будут помогать ему сражаться с демон!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_14");		//Теперь человек ступать! Приходить к Ар Дагар, когда поговорить с Ур-Тралл.
		B_LogEntry(TOPIC_LowLevel,"Ар Дагар отправил меня к Ур-Траллу, чтобы тот прислал ему воинов. Эти орки пойдут вместе со мной, чтобы помочь мне расправиться с демоном.");
		SendForHelp = TRUE;
	}
	else
	{
	 	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_05");		//По крайней мере, ты хотя бы можешь дать мне шанс.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_06");		//Хммм...(задумчиво) Человек быть очень храбрый, но очень глупый!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_07");		//Но Ар Дагар давать ему шанс сразится с тем демон.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_08");		//Однако для начала человек принести мне Грах Шах!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_09");		//Ар Дагар проверить, настолько ли человек силен, как говорить.
		AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_10");		//А что такое Грах Шах?
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_11");		//Награда того, кто стать самым сильным воином в городе братов!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_12");		//Если человек докажет, что достоин носить Грах Шах, то идти сражаться со злой демон.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_13");		//И Ар Дагар помочь ему в этом.
		B_LogEntry(TOPIC_LowLevel,"Если я стану чемпионом арены в городе орков, Ар Дагар разрешит мне спуститься на нижний уровень шахты.");
	};
};

instance DIA_OrcWarrior_MineCommander_BringGrah(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_BringGrah_condition;
	information = DIA_OrcWarrior_MineCommander_BringGrah_info;
	permanent = FALSE;
	description = "У меня есть Грах Шах!";
};

func int DIA_OrcWarrior_MineCommander_BringGrah_condition()
{
	if((MIS_LowLevel == LOG_Running) && (SendForHelp == FALSE) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_HelpDemon) == TRUE) && (Npc_HasItems(hero,ItMi_GrahShar) >= 1))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_BringGrah_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_01");	//У меня есть Грах Шах!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_02");	//Тогда человек показать его Ар Дагар. Тот будет смотреть!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_03");	//Вот он.
	B_GiveInvItems(other,self,ItMi_GrahShar,1);
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_04");	//Хммм...(уважительно) КРАТ КОР! Человек быть Мор Дар! Великий воин братов.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_05");	//Теперь Ар Дагар видеть, что тот не врать ему. Человек уметь хорошо сражаться!
	B_GiveInvItems(self,other,ItMi_GrahShar,1);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_06");	//А что насчет шахты?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_07");	//Ар Дагар давать слово помочь человек, если он приносить Грах Шах! Ар Дагар выполнять свой обещание.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_08");	//Он разрешать человек идти в глубокий шахта сражаться там с демон.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_09");	//Но у злой демон быть много мертвый слуг! Человек быть тяжело одному ходить туда.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_10");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_11");	//У Ар Дагар быть мало сильный воин, чтобы отправлять их вместе с человек. 
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_12");	//Поэтому тот сначала ходить к Ур-Тралл, великий вождь братов. Просить, чтобы тот дать много сильный воин.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_13");	//Они пойти вместе с человек. Будут помогать ему сражаться с демон!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_14");	//Теперь человек ступать! Приходить к Ар Дагар, когда поговорить с Ур-Тралл.
	B_LogEntry(TOPIC_LowLevel,"Ар Дагар отправил меня к Ур-Траллу, чтобы тот прислал ему воинов. Эти орки пойдут вместе со мной, чтобы помочь мне расправиться с демоном.");
	SendForHelp = TRUE;
};

instance DIA_OrcWarrior_MineCommander_GoShaht(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_GoShaht_condition;
	information = DIA_OrcWarrior_MineCommander_GoShaht_info;
	permanent = FALSE;
	description = "Ур-Тралл поможет с воинами!";
};

func int DIA_OrcWarrior_MineCommander_GoShaht_condition()
{
	if((MIS_LowLevel == LOG_Running) && (OrcHelpLowLevel == TRUE) && (Npc_IsDead(HaosDemon_Orcmine) == FALSE) && (Npc_IsDead(skeleton_warrior_dark_stoneshpere) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_GoShaht_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_GoShaht_01_01");	//Ур-Тралл поможет с воинами!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_GoShaht_01_02");	//Быть хорошо! Тогда человек идти сражаться с демон.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_GoShaht_01_03");	//Ар Дагар желать ему удача!
	GoFightDeepMine = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Я сообщил Ар Дагару, что Ур-Тралл согласился помочь с воинами. Пора покончить с тем злом, что там завелось.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(STRF_2153_Fighter,"ORCMINE_FIGHTER_01");
	Wld_InsertNpc(STRF_2154_Fighter,"ORCMINE_FIGHTER_02");
	Wld_InsertNpc(STRF_2155_Fighter,"ORCMINE_FIGHTER_03");
	Wld_InsertNpc(STRF_2156_Fighter,"ORCMINE_FIGHTER_04");
	Wld_InsertNpc(STRF_2157_Fighter,"ORCMINE_FIGHTER_05");
};

instance DIA_OrcWarrior_MineCommander_FreeDeepShaht(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_FreeDeepShaht_condition;
	information = DIA_OrcWarrior_MineCommander_FreeDeepShaht_info;
	permanent = FALSE;
	description = "Со злом в глубокой шахте покончено.";
};

func int DIA_OrcWarrior_MineCommander_FreeDeepShaht_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_IsDead(HaosDemon_Orcmine) == TRUE) && (Npc_IsDead(skeleton_warrior_dark_stoneshpere) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_FreeDeepShaht_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_01");	//Со злом в глубокой шахте покончено.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_02");	//(удивленно) Человек быть точно уверен, что убить злой демон?
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_03");	//Если не веришь, можешь сам спуститься туда и проверить. Там никого нет!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_04");	//В этом не быть необходимость! Ар Дагар верить человек.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_05");	//Он просто не понимать, как ему удалось это сделать.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_06");	//Человек воистину быть великий и бесстрашный воин! Ар Дагар большая честь говорить с ним.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_07");	//Приятно это слышать.
	MIS_LowLevel = LOG_Success;
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Success);
	B_LogEntry(TOPIC_LowLevel,"Я вернулся к Ар Дагару и рассказал о том, что мне удалось покончить с проклятьем орков.");
};

instance DIA_OrcWarrior_MineCommander_WhatNow(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhatNow_condition;
	information = DIA_OrcWarrior_MineCommander_WhatNow_info;
	permanent = FALSE;
	description = "Теперь орки вновь смогут добывать магическую руду?";
};

func int DIA_OrcWarrior_MineCommander_WhatNow_condition()
{
	if(MIS_LowLevel == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_WhatNow_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhatNow_01_01");	//Теперь орки вновь смогут добывать магическую руду?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_02");	//Ар Дагар думать, что нет... Быть нельзя!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhatNow_01_03");	//Но почему? Ведь нижний уровень шахты теперь свободен.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_04");	//Орки быть тогда очень глупый, что копать так глубоко шахта!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_05");	//Ар Дагар не хотеть больше делать ошибки своих братов.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_06");	//Ни один орк никогда не ступать больше туда! Иначе может случиться новый беда.
};

instance DIA_OrcWarrior_MineCommander_PICKPOCKET(C_Info)
{
	npc = OrcWarrior_MineCommander;
	nr = 900;
	condition = DIA_OrcWarrior_MineCommander_pickpocket_condition;
	information = DIA_OrcWarrior_MineCommander_pickpocket_info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int DIA_OrcWarrior_MineCommander_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_ArDagarKey == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_pickpocket_info()
{
	Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	Info_AddChoice(DIA_OrcWarrior_MineCommander_pickpocket,Dialog_Back,DIA_OrcWarrior_MineCommander_pickpocket_back);
	Info_AddChoice(DIA_OrcWarrior_MineCommander_pickpocket,DIALOG_PICKPOCKET,DIA_OrcWarrior_MineCommander_pickpocket_doit);
};

func void DIA_OrcWarrior_MineCommander_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		B_GiveThiefXP();
		B_GiveInvItems(self,other,ItKe_ArDagar,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_LogEntry(TOPIC_ArDagarKey,"Я выкрал ключ у Ар Дагара! Думаю теперь, мне стоит вернуться к Гарсу.");
		Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	}
	else
	{
		B_Say(other,other,"$TOOHEAVYFORME");
		Print("Необходимая ловкость: 100");
		Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	};
};

func void DIA_OrcWarrior_MineCommander_pickpocket_back()
{
	Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
};

//-----------------------------------------------------Вакур Шак----------------------------------------

var int VakurShakNeedGold;
var int VakurShakNeedMoreGold;
var int VakurShakSellRing;
var int VakurShakNeedGoldCount;

instance DIA_OrcWarrior_MineWatcher_Vakur_EXIT(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_exit_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Vakur_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_Hello(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_Hello_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_Hello_info;
	permanent = FALSE;
	description = "Привет тебе, зеленая морда.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_Hello_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Vakur_Hello_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_01");	//Привет тебе, зеленая морда.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_02");	//Человек...(грозно) Зачем приходить сюда? 
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_03");	//Или человек хотеть стать раб братов, как и остальные морра?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_04");	//Не дождешься, орк.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_WhatDo(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_info;
	permanent = FALSE;
	description = "Чем ты тут занимаешься?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_01");	//Чем ты тут занимаешься?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_02");	//Вакур Шак следить, чтобы рабы работать хорошо.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_03");	//Если работать плохо, Вакур Шак бить их!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_04");	//Как все просто у тебя.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_DontLove(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_DontLove_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_DontLove_info;
	permanent = FALSE;
	description = "И много тут вас таких?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_DontLove_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_DontLove_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_01");	//И много тут вас таких?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_02");	//Братов быть много, людей быть мало.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_03");	//Никто не сбежать!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_04");	//Само собой.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_FerdRing(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_info;
	permanent = FALSE;
	description = "Эй, у меня к тебе одно дело.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_condition()
{
	if((MIS_FerdRing == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_01");	//Эй, у меня к тебе одно дело.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_02");	//Вакур Шак не иметь дел с человек!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_03");	//Он только говорить человек, что делать. Но не слушать его!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_04");	//А если дело касается золота?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_05");	//Хммм...(задумчиво) Тогда человек давать его Вакур Шак и тот тогда слушать.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_06");	//И сколько же тебе надо?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_07");	//Много, много золота! Так много, чтобы Вакур Шак был очень счастлив.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_08");	//Говори точнее!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_09");	//....(думает) Тридцать золотых самородков! 
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_10");	//Хороший у тебя аппетит. Но если по-другому нельзя, придется достать их для тебя.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_11");	//Человек быть не глупый, если понимать это.
	VakurShakNeedGold = TRUE;
	B_LogEntry(TOPIC_FerdRing,"Этот орк Вакур Шак вообще отказался со мной говорить! Только золото заставит его выслушать меня, а именно тридцать золотых самородков. Да, у этого орка губа не дура...");
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_info;
	permanent = FALSE;
	description = "Вот твои тридцать самородков.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_condition()
{
	if((MIS_FerdRing == LOG_Running) && (VakurShakNeedGold == TRUE) && (Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= 30))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_info()
{
	VakurShakNeedGoldCount = FALSE;
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_01");	//Вот твои тридцать самородков.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,30);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,30);
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_02");	//Золото! Вакур Шак очень любить золото.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_03");	//Теперь человек может спросить, что он хотеть. Вакур Шак его будет слушать!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_04");	//Мне нужно то кольцо, которое ты отобрал у раба Ферда.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_05");	//Какое еще быть кольцо?!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_06");	//Простое серебряное кольцо! Ты что, никогда таких не видел?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_07");	//Аааа, Вакур Шак, кажется, понимать, о чем человек говорить...(доставая кольцо) Он иметь в виду эта вещь?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_08");	//Да, оно самое. Отдай его мне!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_09");	//(хохочет) Вакур Шак ничего просто так не даст глупый человек!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_10");	//Ну хорошо, что ты за него хочешь?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_11");	//Вакур Шак думать, что человек знать это.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_12");	//Что, опять золото?!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_13");	//Не опять золото! А много золото! Полсотни кусков золота...(жадно)
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_14");	//Ты с ума сошел, если просишь столько за обычное серебряное кольцо!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_15");	//Человек сам решать, брать или нет! Вакур Шак сказать свой цена.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_16");	//Ну ты и наглец!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_17");	//Аррргггх...
	VakurShakNeedMoreGold = TRUE;
	VakurShakNeedGoldCount = 50;	
	B_LogEntry(TOPIC_FerdRing,"Я принес Вакур Шаку тридцать золотых самородков и спросил его про кольцо Ферда. И тот заломил за него еще полсотни золотых самородков! И зачем я только с ним связался...");
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_info;
	permanent = FALSE;
	description = "Может сойдемся на половине?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_condition()
{
	if((MIS_FerdRing == LOG_Running) && (VakurShakNeedMoreGold == TRUE) && (VakurShakSellRing == FALSE) && (VakurShakNeedGoldCount >= 50))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_01");	//Может, сойдемся на половине?

	if(RhetorikSkillValue[1] >= 65)
	{
		AI_PlayAni(self,"T_YES");
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_02");	//Хммм... Ну, хорошо! Но это быть последний цена Вакур Шака.
		B_LogEntry(TOPIC_FerdRing,"Я сторговался с Вакур Шаком на двадцать пять золотых самородков.");
		VakurShakNeedGoldCount = 25;
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_03");	//(злобно) Нет... ХАРАД!
	};
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_info;
	permanent = FALSE;
	description = "Вот, держи свое золото.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_condition()
{
	if((MIS_FerdRing == LOG_Running) && (VakurShakNeedMoreGold == TRUE) && (Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= VakurShakNeedGoldCount))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_01");	//Вот, держи свое золото.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,VakurShakNeedGoldCount);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,VakurShakNeedGoldCount);
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_02");	//(жадно) Золото быть хорошо. Вакур Шак быть очень довольный!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_03");	//Теперь отдай мне то кольцо.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_04");	//ХАРАД! (хохочет) Вакур Шак быть очень умный! Он перехитрить человек.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_05");	//Тот быть очень глупый, если думать, что Вакур Шак отдать ему это кольцо.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_06");	//Так ты что, решил меня надуть?!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_07");	//Жалкий морра! Тебе никогда не получить его.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_08");	//Ну что же, тогда мне придется нанести визит Ур-Траллу! Пускай он нас рассудит.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_09");	//(боязно) Ур-Тралл? Человек знать великий вождь?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_10");	//А как ты думаешь, кто разрешил мне войти в эту шахту?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_11");	//КРОТАК! Человек не надо ходить к Ур-Тралл! Вакур Шак просто шутить.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_12");	//Вот, человек взять то кольцо! Только не надо ходить к великий вождь.
	B_GiveInvItems(self,other,ItRi_Ferd,1);

	if(RhetorikSkillValue[1] >= 65)
	{
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_13");	//Этого мало!
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_14");	//Что?!
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_15");	//За свое вранье тебе придется заплатить мне гораздо больше.
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_16");	//Аррргггх...(злобно) И что же человек хотеть от Вакур Шака?!
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_17");	//Смотря, что ты можешь мне предложить.
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_18");	//Хммм...(задумчиво) У Вакур Шака есть зелье, которое делать морра сильным.
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_19");	//Он может дать его человек.
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_20");	//Отлично. Давай его сюда.
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_21");	//(злобно) Аррргггх...
	}
	else
	{
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_22");	//Так-то лучше.
	};

	VakurShakSellRing = TRUE;
	B_LogEntry(TOPIC_FerdRing,"Кольцо Ферда теперь у меня.");
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_Perm(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_Perm_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_Perm_info;
	permanent = TRUE;
	description = "Зачем тебе столько золота, орк?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_Perm_condition()
{
	if(VakurShakSellRing == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_Perm_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_01");	//Зачем тебе столько золота, орк?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_02");	//Человек это мало касаться! 
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_03");	//Лучше человек идти, куда хотеть. Не говорить больше с Вакур Шак.
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_info;
	permanent = FALSE;
	description = "Мне нужна новая кирка.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == 2))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_01");	//Мне нужна новая кирка.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_02");	//Если человек хотеть новый кирка, то платить Вакур Шак золото.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_03");	//И сколько ты хочешь?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_04");	//Десять золотой самородок! И ни куска меньше...
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_05");	//Эй, не слишком ли много для обычной кирки?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_06");	//Вакур Шак думать, цена быть хороший. Хороший, чтобы ее продавать!
	ElkNeedNewKirka = 3;
};

instance DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_info;
	permanent = TRUE;
	description = "Продай мне новую кирку. (Цена: 10 золотых самородков)";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == 3))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_01");	//Продай мне кирку.

	if(Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= 10)
	{
		B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,10);
		Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,10);
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_02");	//Быть хороший сделка...(довольно) Теперь человек может забирать свой инструмент!
		B_GiveInvItems(self,other,ItMw_Kirka_New,1);
		ElkNeedNewKirka = 4;
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_03");	//У человек не быть достаточно золота!
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_04");	//Вакур Шак не давать ему ничего.
	};
};

//-----------------------------------------------------Кор Шак----------------------------------------

instance DIA_OrcWarrior_MineWatcher_Korshak_EXIT(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_exit_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Korshak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Korshak_Hello(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_Hello_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_Hello_info;
	permanent = FALSE;
	description = "Ты кто?";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_Hello_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Korshak_Hello_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_01");	//Ты кто?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_02");	//Меня зовут Кор Шак, человек...
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_03");	//Я слежу за тем, чтобы рабы тут не сидели без дела, а добывали руду.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_04");	//Хммм... Для орка ты довольно неплохо говоришь по-человечески.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_05");	//Кор Шак долго учить человеческий язык.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_06");	//Хорошо понимать своего врага значит не меньше, чем хорошо сражаться с ним.
};

instance DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_info;
	permanent = FALSE;
	description = "Где ты так хорошо научился говорить?";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_01");	//Где ты так хорошо научился говорить?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_02");	//Кор Шак долго находился в плену у людей! Был их рабом на протяжении многих зим.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_03");	//Он слушал люди и учился говорить, как они.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_04");	//Понятно.
};

instance DIA_OrcWarrior_MineWatcher_Korshak_KrowBook(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_info;
	permanent = FALSE;
	description = "Я слышал, у тебя есть дневник одного раба.";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_01");	//Я слышал, у тебя есть дневник одного раба.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_02");	//Да, человек прав...
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_03");	//Кор Шак забрать эта книга для себя, но никому ее больше не отдавать.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_04");	//А зачем она тебе?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_05");	//Кор Шак думает, что сможет научиться лучше говорить, если будет читать эту книгу.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_06");	//И как успехи?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_07");	//Пока быть плохо... Кор Шак мало пока понимает, что там написано.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_08");	//Но думает, что если он долго будет ее читать, то у него все получаться.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_09");	//Что-то я в этом сомневаюсь.
	B_LogEntry(TOPIC_KrowBook,"Кор Шак забрал себе дневник Кроу, чтобы научится лучше говорить по-человечески. Довольно странное желание для орка. Надо как-то помочь ему в этом, если я хочу заполучить дневник Кроу обратно. Возможно, ему поможет какая-нибудь книга?");
};

instance DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_info;
	permanent = FALSE;
	description = "У меня есть к тебе предложение получше.";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_KrowBook) == TRUE) && (Npc_HasItems(hero,ITWR_RHETORIKBOOK) >= 1))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_01");	//У меня есть к тебе предложение получше.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_02");	//О чем это человек говорит?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_03");	//Смотри, это учебник риторики! Он позволит тебе куда лучше понять язык людей.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_04");	//(с интересом) У человека есть еще одна книга? А что он хочет за нее?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_05");	//Давай меняться. Я тебе эту книгу, а ты мне тот дневник.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_06");	//Соглашайся, орк. Поверь, это честная сделка!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_07");	//Хммм...(задумчиво) Ну хорошо! Кор Шак согласен меняться.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_08");	//Но если Кор Шаку не понравится книга человека, он не давать ему тогда ничего!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_09");	//Лучше взгляни на нее сам.
	B_GiveInvItems(other,self,ITWR_RHETORIKBOOK,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_10");	//КРОДАР КАР! УР ТАР БАР!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_11");	//(довольно) Кор Шак думает, это быть очень интересная книга. Он даже понимать, что тут писать люди!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_12");	//Вот и наслаждайся. Но сначала верни мне дневник.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_13");	//Держи, человек! Забирать его. Он больше не нужен Кор Шак!
	B_GiveInvItems(self,other,ItWr_KrowBook,1);
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_14");	//С тобой приятно иметь дело.
	B_LogEntry(TOPIC_KrowBook,"Я обменял у Кор Шака учебник риторики на дневник Кроу. Пора вернуть его законному владельцу.");
};

instance DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_info;
	permanent = TRUE;
	description = "Ну и как тебе та книга?";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_condition()
{
	if(MIS_KrowBook == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_01_01");	//Ну и как тебе та книга?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_01_02");	//Очень интересная! Кор Шак благодарит человек за нее.
	AI_PlayAni(self,"T_GREETGRD");
};

//-----------------------------------------------------Орк охраник рядом с Нутсом----------------------------------------


instance DIA_Orc_8208_MineGuard_EXIT(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_exit_condition;
	information = DIA_Orc_8208_MineGuard_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8208_MineGuard_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8208_MineGuard_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_HELLO(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_hello_condition;
	information = DIA_Orc_8208_MineGuard_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8208_MineGuard_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_hello_info()
{
	AI_PlayAni(self,"T_GETLOST2");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_hello_01_01");	//(гневно) КРАТУК КАР ДРАГ БАР КИРАК! ХАРАД МОРРА ТАР!
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_hello_01_02");	//Эммм... Что ты сказал?

	if(MIS_RemoveOrc == FALSE)
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_Orc_8208_MineGuard_RemoveOrc(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_RemoveOrc_condition;
	information = DIA_Orc_8208_MineGuard_RemoveOrc_info;
	permanent = FALSE;
	description = "Тебя вызывает к себе Ар Дагар!";
};

func int DIA_Orc_8208_MineGuard_RemoveOrc_condition()
{
	if(MIS_RemoveOrc == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_RemoveOrc_info()
{
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_RemoveOrc_01_01");	//Тебя вызывает к себе Ар Дагар!
	AI_PlayAni(self,"T_DONTKNOW");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_RemoveOrc_01_02");	//РАТ ТОР КУ БАР ХАК НОР...
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_RemoveOrc_01_03");	//Если честно, я не понимаю, что ты там бормочешь.
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_RemoveOrc_01_04");	//Но если не хочешь его разозлить, лучше бы тебе поторопиться.
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_RemoveOrc_01_05");	//МОРРА ДАХ ТУП ГРОН САКУР ДАР...
	RemoveOrcDone = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_Angry(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_Angry_condition;
	information = DIA_Orc_8208_MineGuard_Angry_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Orc_8208_MineGuard_Angry_condition()
{
	if((MIS_RemoveOrc == LOG_Success) && (OrcDoneWalArDagar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_Angry_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_Angry_01_01");	//МОРРА КРАШ ДАР СУР МЕР! АР ДАГАР КАР БИТ МОРРА.
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_Angry_01_02");	//Ну да, перепутал малость. С кем не бывает!
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_Angry_01_03");	//ХАРАД КАР ВАК ШАР ТУГ! КРОТАК НАБАР...
	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_Angry_Perm(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_Angry_Perm_condition;
	information = DIA_Orc_8208_MineGuard_Angry_Perm_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Orc_8208_MineGuard_Angry_Perm_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(hero,DIA_Orc_8208_MineGuard_Angry) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_Angry_Perm_info()
{
	AI_PlayAni(self,"T_GETLOST");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_Angry_Perm_01_01");	//МОРРА ХАРАД ТАР...
	AI_StopProcessInfos(self);
};

//-----------------------------------------------------Умрак----------------------------------------

instance DIA_Orc_8210_Umrak_EXIT(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_exit_condition;
	information = DIA_Orc_8210_Umrak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8210_Umrak_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8210_Umrak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8210_Umrak_PreHello(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_PreHello_condition;
	information = DIA_Orc_8210_Umrak_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8210_Umrak_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8210_Umrak_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8210_Umrak_PreHello_01_01");	//Пошел отсюда! А то изрублю тебя на куски...
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8210_Umrak_PreHello_01_02");	//Не сейчас, морра.
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8210_Umrak_PreHello_01_03");	//У меня много дел.
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8210_Umrak_Hello(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_Hello_condition;
	information = DIA_Orc_8210_Umrak_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8210_Umrak_Hello_condition()
{
	if((ArenaBattle_06 == TRUE) && (ArenaBattle_06_Won == FALSE) && (ArenaBattle_06_Lost == FALSE) && (UmrakIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8210_Umrak_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_00");	//Хорошо!
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_01");	//Наконец-то достойный противник.
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_02");	//Я раздавлю тебя как червя...
	UmrakIsFight = TRUE;
	KnowAboutUmrak = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Уртрок----------------------------

instance DIA_Orc_8211_UrTrok_EXIT(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_exit_condition;
	information = DIA_Orc_8211_UrTrok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8211_UrTrok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8211_UrTrok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8211_UrTrok_PreHello(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_PreHello_condition;
	information = DIA_Orc_8211_UrTrok_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8211_UrTrok_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8211_UrTrok_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_01");	//Орак Шака!
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_02");	//Бейся с честью...
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_03");	//Исчезни!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8211_UrTrok_Hello(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_Hello_condition;
	information = DIA_Orc_8211_UrTrok_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8211_UrTrok_Hello_condition()
{
	if((ArenaBattle_05 == TRUE) && (ArenaBattle_05_Won == FALSE) && (ArenaBattle_05_Lost == FALSE) && (UrTrokIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8211_UrTrok_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8211_UrTrok_Hello_01_01");	//Никто не может победить меня, морра.
	AI_Output(self,other,"DIA_Orc_8211_UrTrok_Hello_01_02");	//Сейчас я тебя на куски порву!
	UrTrokIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


//-------------------------------Турук----------------------------

instance DIA_Orc_8212_Turuk_EXIT(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_exit_condition;
	information = DIA_Orc_8212_Turuk_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8212_Turuk_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8212_Turuk_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8212_Turuk_PreHello(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_PreHello_condition;
	information = DIA_Orc_8212_Turuk_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8212_Turuk_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8212_Turuk_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_01");	//Хорошее оружие должно быть острым!
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_02");	//Проваливай!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_03");	//Исчезни!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8212_Turuk_Hello(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_Hello_condition;
	information = DIA_Orc_8212_Turuk_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8212_Turuk_Hello_condition()
{
	if((ArenaBattle_03 == TRUE) && (ArenaBattle_03_Won == FALSE) && (ArenaBattle_03_Lost == FALSE) && (TurukIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8212_Turuk_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8212_Turuk_Hello_01_01");	//Глупец!
	AI_Output(self,other,"DIA_Orc_8212_Turuk_Hello_01_02");	//Ты действительно считаешь, что сможешь победить меня?
	TurukIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Гуннок----------------------------

instance DIA_Orc_8213_Gunnok_EXIT(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_exit_condition;
	information = DIA_Orc_8213_Gunnok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8213_Gunnok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8213_Gunnok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8213_Gunnok_PreHello(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_PreHello_condition;
	information = DIA_Orc_8213_Gunnok_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8213_Gunnok_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8213_Gunnok_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8213_Gunnok_PreHello_01_01");	//Ты слишком болтлив, морра.
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8213_Gunnok_PreHello_01_02");	//Орак Шака!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8213_Gunnok_PreHello_01_03");	//Иди отсюда.
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8213_Gunnok_Hello(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_Hello_condition;
	information = DIA_Orc_8213_Gunnok_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8213_Gunnok_Hello_condition()
{
	if((ArenaBattle_02 == TRUE) && (ArenaBattle_02_Won == FALSE) && (ArenaBattle_02_Lost == FALSE) && (GunnokIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8213_Gunnok_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8213_Gunnok_Hello_01_01");	//Да я тебя размажу!
	GunnokIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Даграт----------------------------

instance DIA_Orc_8214_Dagrag_EXIT(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_exit_condition;
	information = DIA_Orc_8214_Dagrag_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8214_Dagrag_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8214_Dagrag_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8214_Dagrag_PreHello(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_PreHello_condition;
	information = DIA_Orc_8214_Dagrag_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8214_Dagrag_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8214_Dagrag_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_01");	//Ищещь проблем на свою голову?
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_02");	//Крепче бей!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Орак Шака!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8214_Dagrag_Hello(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_Hello_condition;
	information = DIA_Orc_8214_Dagrag_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8214_Dagrag_Hello_condition()
{
	if((ArenaBattle_01 == TRUE) && (ArenaBattle_01_Won == FALSE) && (ArenaBattle_01_Lost == FALSE) && (DagragIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8214_Dagrag_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8214_Dagrag_Hello_01_01");	//Ну, покажи, чего ты стоишь, морра...
	DagragIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Ур Кан----------------------------

instance DIA_Orc_8215_Kan_EXIT(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_exit_condition;
	information = DIA_Orc_8215_Kan_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8215_Kan_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8215_Kan_exit_info()
{
	AI_StopProcessInfos(self);
};

var int UrKanFirstTime;

instance DIA_Orc_8215_Kan_PreHello(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_PreHello_condition;
	information = DIA_Orc_8215_Kan_PreHello_info;
	permanent = TRUE;
	description = "Привет тебе, орк!";

};

func int DIA_Orc_8215_Kan_PreHello_condition()
{
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_PreHello_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_PreHello_01_00");	//Привет тебе, орк!

	if(UrKanFirstTime == FALSE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_01");	//КОР ГАР! ТУР КАР УЛУ МУЛУ ГОР...
		AI_Output(other,self,"DIA_Orc_8215_Kan_PreHello_01_02");	//Я тебя не понимаю!
		NeedKnowOrcLang = TRUE;
		UrKanFirstTime = TRUE;
	};

	AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_03");	//ДАБАР КАРАД ГОР ТАК НИР ВАК.
	AI_Output(other,self,"DIA_Orc_8215_Kan_PreHello_01_04");	//Ах, это бесполезно! Сначала надо выучить ваш язык.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8215_Kan_Hello(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Hello_condition;
	information = DIA_Orc_8215_Kan_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8215_Kan_Hello_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Hello_info()
{
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_01");	//КОР ГАР! Человек... Я видеть, ты носить Улу-Мулу.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Hello_01_03");	//И что с того?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_02");	//Я думать, что человек быть очень сильный воин, если у него есть Улу-Мулу.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_04");	//А раз так, то человек может тут сражаться с другими воинами, чтобы получать много честь.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_05");	//Когда много честь, все браты уважать человек.
};

instance DIA_Orc_8215_Kan_WhoYou(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_WhoYou_condition;
	information = DIA_Orc_8215_Kan_WhoYou_info;
	permanent = FALSE;
	description = "Ты кто?";
};

func int DIA_Orc_8215_Kan_WhoYou_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_WhoYou_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_WhoYou_01_01");	//Ты кто?
	AI_Output(self,other,"DIA_Orc_8215_Kan_WhoYou_01_02");	//Мое звать Ур Кан, человек.
	AI_Output(other,self,"DIA_Orc_8215_Kan_WhoYou_01_03");	//А что ты тут делаешь?
	AI_Output(self,other,"DIA_Orc_8215_Kan_WhoYou_01_04");	//Ур Кан следить, чтобы его воины всегда быть готов к бой.
	AI_Output(self,other,"DIA_Orc_8215_Kan_WhoYou_01_05");	//Быть сильный! Много тренироваться, мало спать...
};

instance DIA_Orc_8215_Kan_Place(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Place_condition;
	information = DIA_Orc_8215_Kan_Place_info;
	permanent = FALSE;
	description = "А что это вообще за место?";
};

func int DIA_Orc_8215_Kan_Place_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Place_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Place_01_01");	//А что это вообще за место?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Place_01_02");	//Тут быть великий арена орков.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Place_01_03");	//Могучий воин здесь сражаться между собой за честь, за право называться Мор Дар!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Place_01_04");	//Мор Дар?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Place_01_05");	//На язык братов означать самый лучший, самый сильный воин орков. Много честь, много уважения!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Place_01_06");	//А, понимаю.
};

instance DIA_Orc_8215_Kan_MorDar(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_MorDar_condition;
	information = DIA_Orc_8215_Kan_MorDar_info;
	permanent = FALSE;
	description = "Кто сейчас является Мор Дар?";
};

func int DIA_Orc_8215_Kan_MorDar_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Place) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_MorDar_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_MorDar_01_01");	//Кто сейчас является Мор Дар?
	AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_02");	//Черный орк по имени Ур-Каррас быть последний, кто удостаиваться подобный честь.

	if(UrKarrasInsert == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_03");	//Но он уже больше не сражаться на арена!
		AI_Output(other,self,"DIA_Orc_8215_Kan_MorDar_01_04");	//Почему?
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_05");	//Ур-Каррас стать великий старейшина и идти воевать вместе с Ур-Тралл против людей.
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_07");	//Но он давно уйти из город воевать с человек.
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_08");	//Братам нужен новый Мор Дар!
	};
};

instance DIA_Orc_8215_Kan_Interes(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Interes_condition;
	information = DIA_Orc_8215_Kan_Interes_info;
	permanent = FALSE;
	description = "Вы сражаетесь за просто так или есть какая-то награда?";
};

func int DIA_Orc_8215_Kan_Interes_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Join) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Interes_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_01");	//Вы сражаетесь просто так или есть какая-нибудь награда?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_02");	//Если человек хорошо сражаться и побеждать, он получать от Ур Кан награда за каждый бой.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_03");	//Если проиграть и хотеть снова сражаться, то давать Ур Кан немного руда магия.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_04");	//А золото вас, значит, мало интересует?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_05");	//Орки не любить золото, как любить его люди...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_06");	//Орки любить только хороший меч и крепкий доспех!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_07");	//А зачем тогда вам магическая руда?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_08");	//Из нее браты могут делать очень сильный оружие. Потом идти и лучше сражаться!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_09");	//И кто делает для вас такое оружие?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_10");	//Человек спросить Хаш Тора! Только он заниматься этим.
	KnowAboutHashTor = TRUE;
	B_LogEntry(TOPIC_OrcArena,"За каждый выигранный бой мне полагается награда. Если я проиграю бой, то для следующего вызова мне необходимо отдать Ур Кану несколько кусков магической руды. Она тут очень ценится, ведь орки делают из нее неплохое оружие.");
};

instance DIA_Orc_8215_Kan_GrahShar(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_GrahShar_condition;
	information = DIA_Orc_8215_Kan_GrahShar_info;
	permanent = FALSE;
	description = "А что за главный приз?";
};

func int DIA_Orc_8215_Kan_GrahShar_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Interes) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_GrahShar_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_GrahShar_01_01");	//А что за главный приз?
	AI_Output(self,other,"DIA_Orc_8215_Kan_GrahShar_01_02");	//Если человек побеждать всех и становится Мор Дар, то он получать Грах Шах.
	AI_Output(other,self,"DIA_Orc_8215_Kan_GrahShar_01_03");	//Грах Шах?
	AI_Output(self,other,"DIA_Orc_8215_Kan_GrahShar_01_04");	//Великий символ могучего воина орков! Делать человек еще сильней...
	B_LogEntry(TOPIC_OrcArena,"Самый ценный приз арены - Грах Шах. Я не знаю, что это такое. А Ур Кан не объяснил.");
};


instance DIA_Orc_8215_Kan_Join(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Join_condition;
	information = DIA_Orc_8215_Kan_Join_info;
	permanent = FALSE;
	description = "Я тоже хочу сражаться на арене.";
};

func int DIA_Orc_8215_Kan_Join_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Place) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Join_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_01");	//Я тоже хочу сражаться на арене.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_02");	//Сначала человек придется доказать, что он быть достоин этого.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_03");	//И как же это сделать? Набить тебе морду, орк?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_04");	//(хохочет) А человек быть смешной! Ур Кан нравиться, как тот шутить.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_05");	//Однако это ему не помочь.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_06");	//Человек должен победить одного из воинов Ур Кана! Только тогда он доказать, что быть достоин.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_07");	//Ну, с этим я как-нибудь справлюсь.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_08");	//Это быть еще не все...(серьезно) Человек будет сражаться с Улу-Мулу!
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_09");	//Если он взять другой оружие, то быстро умирать! Так сказать Ур Кан...
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_10");	//Ага, понимаю.
	MIS_OrcArena = LOG_Running;
	Log_CreateTopic(TOPIC_OrcArena,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcArena,LOG_Running);
	B_LogEntry(TOPIC_OrcArena,"В городе орков есть арена, на которой сражаются за право носить титул великого воина орков - Мор Дар. А орк Ур Кан заправляет там всем. Я изъявил желание поучаствовать в этом. Для начала Ур Кан хочет проверить меня как бойца. Мне придется победить одного из его воинов, чтобы заслужить право выступать на этой арене.");
};

instance DIA_Orc_8215_Kan_JoinNext(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_JoinNext_condition;
	information = DIA_Orc_8215_Kan_JoinNext_info;
	permanent = FALSE;
	description = "А если я выиграю бой, что тогда?";
};

func int DIA_Orc_8215_Kan_JoinNext_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Join) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_JoinNext_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_JoinNext_01_01");	//А если я выиграю бой, что тогда?
	AI_Output(self,other,"DIA_Orc_8215_Kan_JoinNext_01_02");	//Тогда человек становиться одним из воинов Ур Кана и потом сможет бросать вызов его остальным бойцам.
	AI_Output(self,other,"DIA_Orc_8215_Kan_JoinNext_01_03");	//Пока не стать Мор Дар или не умирать!
};

var int UrKanTellRules;

instance DIA_Orc_8215_Kan_Rules(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Rules_condition;
	information = DIA_Orc_8215_Kan_Rules_info;
	permanent = FALSE;
	description = "Каковы тут правила боя?";
};

func int DIA_Orc_8215_Kan_Rules_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_JoinNext) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Rules_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_01");	//Каковы тут правила боя?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_02");	//Человек сражаться только с Улу-Мулу!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_03");	//Что, всегда?!
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_04");	//Нет. Он может использовать другой оружие, но только если выиграть свой первый бой.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_05");	//Ладно. Что еще?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_06");	//Пускать стрела или болт ХАРАД! Человек умирать...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_07");	//Использовать магия ХАРАД! Человек опять умирать...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_08");	//Начинать бой только после разговора с противник! Если бить раньше, то снова умирать...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_09");	//Не убивать, если победить! Иначе браты быстро делать человек мертвый.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_10");	//Если он убегать, то больше не быть сражаться на великий арена.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_11");	//Это все?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_12");	//Да, Ур Кан сказать все.
	UrKanTellRules = TRUE;
	B_LogEntry(TOPIC_OrcArena,"Ур Кан рассказал мне правила боев на великой арене орков. Тут нельзя пользоваться ни луком, ни арбалетом и тем более магией. Это неминуемо карается смертью. Я должен сначала поприветствовать своего противника и только после этого начинать бой. Нельзя уходить с арены, когда объявлен вызов, иначе мне больше не разрешат участвовать в боях. Ну и, конечно, нельзя убивать своего противника. В первом своем бою я не могу использовать иное оружие, кроме как Улу-Мулу. В последующих я могу выбрать любое другое оружие. После того как бой на арене будет закончен, мне надо не забыть одеть Улу-Мулу, иначе орки убьют меня. Как у них все сложно... Но это и не удивительно - ведь я для них чужак.");
};

instance DIA_Orc_8215_Kan_Ready(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Ready_condition;
	information = DIA_Orc_8215_Kan_Ready_info;
	permanent = TRUE;
	description = "Я готов к сражению.";
};

func int DIA_Orc_8215_Kan_Ready_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_JoinNext) == TRUE) && (ArenaBattle_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Ready_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8147_Dagrag);
	AI_Output(other,self,"DIA_Orc_8215_Kan_Ready_01_01");	//Я готов к сражению.

	if(UrKanTellRules == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_02");	//Хорошо. Твоего первого противника звать Даграг!
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_03");	//Он быть самый слабый воин Ур Кана.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_04");	//Если человек не смочь одолеть Даграг, ему нечего тут делать.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_05");	//Человек уходить и больше не приходить к Ур Кан.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_06");	//Теперь он ступать на арена! Даграг его уже ждать там...
		B_LogEntry(TOPIC_OrcArena,"Итак, первым делом я должен одолеть орка по имени Даграг. Что ж, посмотрим, насколько сильные тут бойцы.");
		AI_StopProcessInfos(self);
		ArenaBattle_01 = TRUE;
		ArenaFightNow = TRUE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_07");	//Сначала Ур Кан рассказать человек правила бой!
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_08");	//Потом он уже идти сражаться.
	};
};

var int ReadyForRoundTwo;
var int ReadyForRoundThree;
var int ReadyForRoundFour;
var int ReadyForRoundFive;
var int ReadyForRoundSix;
var int LostLastOrcFight;

instance DIA_Orc_8215_Kan_PissOff(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_PissOff_condition;
	information = DIA_Orc_8215_Kan_PissOff_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8215_Kan_PissOff_condition()
{
	if((UrKanPissOff == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_PissOff_info()
{
	AI_Output(self,other,"DIA_Orc_8215_Kan_PissOff_01_01");	//(небрежно) Человек лучше уходить. Он быть слабый!
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8215_Kan_Round_First(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Round_First_condition;
	information = DIA_Orc_8215_Kan_Round_First_info;
	permanent = FALSE;
	description = "Я провел свой первый бой.";
};

func int DIA_Orc_8215_Kan_Round_First_condition()
{
	if((ArenaBattle_01_Won == TRUE) || (ArenaBattle_01_Lost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Round_First_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_01");	//Я провел свой первый бой.

	if(ArenaBattle_01_Won == TRUE)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_02");	//И ты выиграть его...(с уважением) Ур Кан видеть, что человек быть умелый воин!
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_03");	//Теперь, если он хотеть, то может сражаться с другими воинами Ур Кана.
		AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_04");	//А как насчет моей награды?
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_05");	//За этот бой человек ничего не получать. Ур Кан просто проверять человек.
		B_LogEntry(TOPIC_OrcArena,"Я прошел испытание Ур Кана. Теперь я смогу бросить вызов и другим бойцам арены.");
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 5");
		};
		ArenaFightNow = FALSE;
		ReadyForRoundTwo = TRUE;
		CanArenaFightNoUluMulu = TRUE;
	}
	else if(ArenaBattle_01_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_07");	//И ты проиграть его! Человек быть слабый и не достоин носить Улу-Мулу.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_08");	//Ур Кан больше не говорить с человек! Тот уходить.
		AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_09");	//Эй, постой...
		B_LogEntry(TOPIC_OrcArena,"Я не прошел испытание Ур Кана. Теперь мне лучше вообще не показываться ему на глаза.");
		MIS_OrcArena = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_OrcArena);
		UrKanPissOff = TRUE;
		AI_StopProcessInfos(self);
	};

	B_StartOtherRoutine(STRF_8147_Dagrag,"Start");
};

//-----------------------------цикл битв-----------------------------------------------------

instance DIA_Orc_8215_Kan_RoundTwo(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwo_condition;
	information = DIA_Orc_8215_Kan_RoundTwo_info;
	permanent = FALSE;
	description = "Я хочу сражаться!";
};

func int DIA_Orc_8215_Kan_RoundTwo_condition()
{
	if((ReadyForRoundTwo == TRUE) && (ArenaBattle_02 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwo_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8148_Gunnok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwo_01_01");	//Я хочу сражаться!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_02");	//Хорошо. Я знал, что человек это понравиться!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_03");	//Тогда твой следующий противник - Гуннок.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_04");	//Он быть довольно крепкий и сильный воин орков. Человек быть не просто!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_05");	//Теперь он ступать на арена! Ур Кан все сказать...
	B_LogEntry(TOPIC_OrcArena,"Мой следующий противник - орк по имени Гуннок.");
	AI_StopProcessInfos(self);
	ArenaBattle_02 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundTwoDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwoDone_condition;
	information = DIA_Orc_8215_Kan_RoundTwoDone_info;
	permanent = TRUE;
	description = "Я сразился с Гунноком.";
};

func int DIA_Orc_8215_Kan_RoundTwoDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundThree == FALSE) && ((ArenaBattle_02_Won == TRUE) || (ArenaBattle_02_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwoDone_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwoDone_01_01");	//Я сразился с Гунноком.

	if(ArenaBattle_02_Won == TRUE)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwoDone_01_02");	//Ур Кан видеть бой...(с уважением) Человек хорошо сражаться и заслужить награда!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwoDone_01_03");	//Вот, брать эти зелья магия. Они помогать восстановить человек сила.
		B_GiveInvItems(self,other,ItPo_Health_03,2);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 5");
		};
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwoDone_01_04");	//Благодарю.
		ArenaFightNow = FALSE;
		ReadyForRoundThree = TRUE;
	}
	else if(ArenaBattle_02_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_05");	//Ур Кан видеть бой...(разочарованно) Человек быть недостаточно силен, чтобы одолеть Гуннок.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_06");	//Для этого ему надо больше тренироваться и становиться более сильный.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_07");	//Он снова приходить, когда будет готов сразиться с Гуннок.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_08");	//И не забывать приносить Ур Кан руда магия, потому что проиграть. 
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_09");	//Без нее Ур Кан не разрешить человек сражаться на арена!
		ArenaBattle_02_Won = FALSE;
		ArenaBattle_02_Lost = FALSE;
		ArenaBattle_02 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8148_Gunnok,"Start");
};

instance DIA_Orc_8215_Kan_RoundTwo_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwo_Again_condition;
	information = DIA_Orc_8215_Kan_RoundTwo_Again_info;
	permanent = TRUE;
	description = "Я хочу вновь сразиться с Гунноком. (Цена: 10 кусков руды)";
};

func int DIA_Orc_8215_Kan_RoundTwo_Again_condition()
{
	if((ReadyForRoundTwo == TRUE) && (ArenaBattle_02 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwo_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8148_Gunnok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwo_Again_01_01");	//Я хочу вновь сразиться с Гунноком.

	if(Npc_HasItems(other,ItMi_Nugget) >= 10)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,10);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_02");	//Хорошо. Человек попытаться победить Гуннок снова!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_03");	//Ступать на арена! Тот будет ждать его там...
		AI_StopProcessInfos(self);
		ArenaBattle_02 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_04");	//У человек не хватать руда для этого!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_05");	//Ур Кан не разрешать человек сражаться на арена.
	};
};

//-----------------------------Турук---------------------------------------------------------

instance DIA_Orc_8215_Kan_RoundThree(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThree_condition;
	information = DIA_Orc_8215_Kan_RoundThree_info;
	permanent = FALSE;
	description = "Кто твой следующий боец?";
};

func int DIA_Orc_8215_Kan_RoundThree_condition()
{
	if((ReadyForRoundThree == TRUE) && (ArenaBattle_03 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThree_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThree_01_01");	//Кто твой следующий боец?
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_01_02");	//Турук. Быть очень серьезный противник!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_01_03");	//Он очень умело владеть свой топор и победить много сильный воин.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_01_04");	//Человек ступать на арена! Турук его уже ждать там...
	B_LogEntry(TOPIC_OrcArena,"Теперь мне надо сразится с орком по имени Турук.");
	AI_StopProcessInfos(self);
	ArenaBattle_03 = TRUE;
	ArenaFightNow = TRUE;
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundThreeDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThreeDone_condition;
	information = DIA_Orc_8215_Kan_RoundThreeDone_info;
	permanent = TRUE;
	description = "Я сразился с Туруком.";
};

func int DIA_Orc_8215_Kan_RoundThreeDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundFour == FALSE) && ((ArenaBattle_03_Won == TRUE) || (ArenaBattle_03_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThreeDone_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThreeDone_01_01");	//Я сразился с Туруком.

	if(ArenaBattle_03_Won == TRUE)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_02");	//Турук быть очень умелый воин, но человек победить его!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_03");	//За это Ур Кан давать в награда ему черный жемчужина.
		B_GiveInvItems(self,other,ItMi_DarkPearl,1);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 5");
		};
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThreeDone_01_04");	//Неплохо.
		ArenaFightNow = FALSE;
		ReadyForRoundFour = TRUE;
	}
	else if(ArenaBattle_03_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_05");	//Турук быть очень умелый воин! Человек не смог победить его.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_06");	//Человек должен быть быстрее и сильнее, чтобы победить Турук.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_07");	//Если хотеть сражаться снова, то говорить Ур Кан.
		ArenaBattle_03_Won = FALSE;
		ArenaBattle_03_Lost = FALSE;
		ArenaBattle_03 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Start");
};

instance DIA_Orc_8215_Kan_RoundThree_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThree_Again_condition;
	information = DIA_Orc_8215_Kan_RoundThree_Again_info;
	permanent = TRUE;
	description = "Я хочу вновь сразиться с Туруком. (Цена: 20 кусков руды)";
};

func int DIA_Orc_8215_Kan_RoundThree_Again_condition()
{
	if((ReadyForRoundThree == TRUE) && (ArenaBattle_03 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThree_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThree_Again_01_01");	//Я хочу вновь сразиться с Туруком.

	if(Npc_HasItems(other,ItMi_Nugget) >= 20)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,20);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_02");	//Человек хочет вызвать на бой грозного Турука?
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_03");	//Ур Кан не быть против! Идти на арена и сражаться с ним.
		AI_StopProcessInfos(self);
		ArenaBattle_03 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		Npc_ClearAIQueue(ArenaFighter);
		AI_RemoveWeapon(ArenaFighter);
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_04");	//У человек не хватать руда для этого!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_05");	//Ур Кан не разрешать человек сражаться на арена.
	};
};

//--------------------------------Харт--------------------------------------------------------------------------------------

instance DIA_Orc_8215_Kan_RoundFour(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFour_condition;
	information = DIA_Orc_8215_Kan_RoundFour_info;
	permanent = FALSE;
	description = "У тебя есть бойцы посильней?";
};

func int DIA_Orc_8215_Kan_RoundFour_condition()
{
	if((ReadyForRoundFour == TRUE) && (ArenaBattle_04 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFour_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFour_01_01");	//У тебя есть бойцы посильней?
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_01_02");	//Конечно. Следующий бой будет с человек по имени Харт!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_01_03");	//Он заслужить свое право сражаться тут, убив много грозных братов Ур Кан.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_01_04");	//Ступать на арена сейчас! Ур Кан желать человек удача...
	B_LogEntry(TOPIC_OrcArena,"Пришло время сразиться с Хартом - единственным человеком, выступающим на арене орков.");
	AI_StopProcessInfos(self);
	ArenaBattle_04 = TRUE;
	ArenaFightNow = TRUE;
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundFourDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFourDone_condition;
	information = DIA_Orc_8215_Kan_RoundFourDone_info;
	permanent = TRUE;
	description = "Я сразился с Хартом.";
};

func int DIA_Orc_8215_Kan_RoundFourDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundFive == FALSE) && ((ArenaBattle_04_Won == TRUE) || (ArenaBattle_04_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFourDone_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFourDone_01_01");	//Я сразился с Хартом.

	if(ArenaBattle_04_Won == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_02");	//И ты смог одолеть его! Хотя он быть сильный и ловкий воин.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_03");	//В качестве награда человек получить теперь шкура черный тролль.
		B_GiveInvItems(self,other,ItAt_TrollBlackFur,1);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 5");
		};

		ArenaFightNow = FALSE;
		ReadyForRoundFive = TRUE;
	}
	else if(ArenaBattle_04_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_04");	//Человек не смог победить своего брат...
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_05");	//Тот быть слишком сильный и ловкий для него.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_06");	//Теперь он идти учиться лучше сражаться меч.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_07");	//А потом приходить на арена снова.
		ArenaBattle_04_Won = FALSE;
		ArenaBattle_04_Lost = FALSE;
		ArenaBattle_04 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Start");
	AI_Teleport(STRF_8146_Hart,"ORC_CITY_HART");
};

instance DIA_Orc_8215_Kan_RoundFour_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFour_Again_condition;
	information = DIA_Orc_8215_Kan_RoundFour_Again_info;
	permanent = TRUE;
	description = "Я хочу вновь сразиться с Хартом. (Цена: 30 кусков руды)";
};

func int DIA_Orc_8215_Kan_RoundFour_Again_condition()
{
	if((ReadyForRoundFour == TRUE) && (ArenaBattle_04 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFour_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFour_Again_01_01");	//Я хочу вновь сразиться с Хартом.

	if(Npc_HasItems(other,ItMi_Nugget) >= 30)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,30);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_02");	//У человек есть руда магия, значить быть бой!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_03");	//Теперь ступать на арена и победить свой враг.
		AI_StopProcessInfos(self);
		ArenaBattle_04 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		Npc_ClearAIQueue(ArenaFighter);
		AI_RemoveWeapon(ArenaFighter);
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_04");	//У человек не хватать руда для этого!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_05");	//Ур Кан не разрешать человек сражаться на арена.
	};
};

//--------------------------------Ур Трок----------------------------------------

instance DIA_Orc_8215_Kan_RoundFive(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFive_condition;
	information = DIA_Orc_8215_Kan_RoundFive_info;
	permanent = FALSE;
	description = "Мне нужен новый боец.";
};

func int DIA_Orc_8215_Kan_RoundFive_condition()
{
	if((ReadyForRoundFive == TRUE) && (ArenaBattle_05 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFive_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8150_UrTrok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFive_01_01");	//Мне нужен новый боец.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_01_02");	//И человек получить его...(с уважением) Ур Трок быть один из лучший воин Ур Кана!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_01_03");	//Тот бить так сильно, что мочь убить человек с один удар.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_01_04");	//Теперь ступать на арена! Он ждать тебя уже...
	B_LogEntry(TOPIC_OrcArena,"Ур Трок мой следующий противник.");
	AI_StopProcessInfos(self);
	ArenaBattle_05 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundFiveDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFiveDone_condition;
	information = DIA_Orc_8215_Kan_RoundFiveDone_info;
	permanent = TRUE;
	description = "Я сразился с Ур Троком.";
};

func int DIA_Orc_8215_Kan_RoundFiveDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundSix == FALSE) && ((ArenaBattle_05_Won == TRUE) || (ArenaBattle_05_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFiveDone_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFiveDone_01_01");	//Я сразился с Ур Троком.

	if(ArenaBattle_05_Won == TRUE)
	{
		B_GivePlayerXP(600);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_02");	//Ур Кан восхищаться силой человек! Победить Ур Трок быть очень тяжело.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_03");	//Поэтому он давать человек очень ценный награда. Зелье сила!
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFiveDone_01_04");	//Оно мне точно не помешает.
		ArenaFightNow = FALSE;
		ReadyForRoundSix = TRUE;
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 5");
		};
	}
	else if(ArenaBattle_05_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_05");	//Ур Кан предупреждать человек, что Ур Трок быть очень силен.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_06");	//И тот мог сам убедиться в этом.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_07");	//Надо быть куда сильнее, чтобы победить Ур Трок!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_08");	//Человек ступать тренироваться! Если сражаться снова, то говорить Ур Кан.
		ArenaBattle_05_Won = FALSE;
		ArenaBattle_05_Lost = FALSE;
		ArenaBattle_05 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8150_UrTrok,"Start");
};

instance DIA_Orc_8215_Kan_RoundFive_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFive_Again_condition;
	information = DIA_Orc_8215_Kan_RoundFive_Again_info;
	permanent = TRUE;
	description = "Я хочу вновь сразиться с Ур Троком. (Цена: 60 кусков руды)";
};

func int DIA_Orc_8215_Kan_RoundFive_Again_condition()
{
	if((ReadyForRoundFive == TRUE) && (ArenaBattle_05 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFive_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8150_UrTrok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFive_Again_01_01");	//Я хочу вновь сразиться с Ур Троком.

	if(Npc_HasItems(other,ItMi_Nugget) >= 60)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,60);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_02");	//Если человек быть уверен в свой сила, то Ур Кан начинать бой.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_03");	//Идти человек! Ур Трок ждать его.
		AI_StopProcessInfos(self);
		ArenaBattle_05 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_04");	//У человек не хватать руда для этого!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_05");	//Ур Кан не разрешать человек сражаться на арена.
	};
};

//----------------------------------Умрак----------------------------------------------

instance DIA_Orc_8215_Kan_RoundSix(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSix_condition;
	information = DIA_Orc_8215_Kan_RoundSix_info;
	permanent = FALSE;
	description = "У тебя еще кто-нибудь остался?";
};

func int DIA_Orc_8215_Kan_RoundSix_condition()
{
	if((ReadyForRoundSix == TRUE) && (ArenaBattle_06 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSix_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8151_Umrak);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_01_01");	//У тебя еще кто-нибудь остался?
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_02");	//Против человек не выступать только Умрак.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_03");	//Это самый сильный воин Ур Кан! По силе не уступать даже великий Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_04");	//Человек сначала хорошо подумать. Действительно ли он хочет сразиться с Умрак?
	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_01_05");	//Давай его уже сюда!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_06");	//(серьезно) Хорошо. Быть так! Ступать на арена, сражаться с Умрак Дар.
	B_LogEntry(TOPIC_OrcArena,"Мой последний бой на арене. Против меня выйдет Умрак. По словам Ур Кана, это очень серьезный противник. По силе он не уступает великому вождю орков.");
	AI_StopProcessInfos(self);
	ArenaBattle_06 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundSixDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSixDone_condition;
	information = DIA_Orc_8215_Kan_RoundSixDone_info;
	permanent = TRUE;
	description = "Я сразился с Умраком.";
};

func int DIA_Orc_8215_Kan_RoundSixDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (HeroIsMorDar == FALSE) && ((ArenaBattle_06_Won == TRUE) || (ArenaBattle_06_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSixDone_info()
{

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_01");	//Я сразился с Умраком.

	if(ArenaBattle_06_Won == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_02");	//Ур Кан не верить своим глазам! Человек победить сам Умрак!
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_03");	//Да, и это было непросто!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_04");	//Тогда теперь человек становиться Мор Дар! Лучший воин великий арена орков.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_05");	//Сильнее него тут не быть больше никого. Очень много сила, очень много чести и уважения.
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_06");	//А где моя награда?
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_07");	//Вот, человек получать Грах Шах! Самый ценный награда, который только быть у него.
		B_GiveInvItems(self,other,ItMi_GrahShar,1);
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_08");	//Интересная вещица. А для чего она?
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_09");	//Человек одевать ее и смотреть! Ур Кан думать, что человек это сам понять.
		ORCRESPECT = ORCRESPECT + 45;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 45");
		};

		ArenaFightNow = FALSE;
		HeroIsMorDar = TRUE;
		MIS_OrcArena = LOG_Success;
		Log_SetTopicStatus(TOPIC_OrcArena,LOG_Success);
		B_LogEntry(TOPIC_OrcArena,"Теперь я Мор Дар - чемпион великой арены орков!");
	}
	else if(ArenaBattle_06_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_11");	//Ур Кан не удивляться, что человек проиграть Умрак.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_12");	//Тот еще повезло, что Умрак не убить его!
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_13");	//Да, этот парень довольно крепкий орешек.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_14");	//Потому что быть лучший, быть почти Мор Дар!
		ArenaBattle_06_Won = FALSE;
		ArenaBattle_06_Lost = FALSE;
		ArenaBattle_06 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8151_Umrak,"Start");
};

instance DIA_Orc_8215_Kan_RoundSix_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSix_Again_condition;
	information = DIA_Orc_8215_Kan_RoundSix_Again_info;
	permanent = TRUE;
	description = "Я хочу вновь сразиться с Умраком. (Цена: 100 кусков руды)";
};

func int DIA_Orc_8215_Kan_RoundSix_Again_condition()
{
	if((ReadyForRoundSix == TRUE) && (ArenaBattle_06 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSix_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8151_Umrak);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_Again_01_01");	//Я хочу вновь сразиться с Умраком.

	if(Npc_HasItems(other,ItMi_Nugget) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_02");	//Человек уверен, что хотеть этого?
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_Again_01_03");	//Я должен его победить.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_04");	//Тогда ступать! Великий битва скоро начаться...
		AI_StopProcessInfos(self);
		ArenaBattle_06 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_05");	//У человек не хватать руда для этого!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_06");	//Ур Кан не разрешать человек сражаться на арена.
	};
};

//--------------------------------------------------Ур-Так-------------------------------------

instance DIA_STRF_8152_UrTak_EXIT(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_exit_condition;
	information = DIA_STRF_8152_UrTak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8152_UrTak_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8152_UrTak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8152_UrTak_Hello(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Hello_condition;
	information = DIA_STRF_8152_UrTak_Hello_info;
	permanent = FALSE;
	description = "Тренируешься?";
};

func int DIA_STRF_8152_UrTak_Hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8152_UrTak_Hello_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Hello_01_01");	//Тренируешься?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Hello_01_02");	//Уртак хотеть быть сильный воин...(серьезно) Хотеть быть как его брат Умрак!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Hello_01_03");	//Поэтому человек не мешать Уртак! Иначе тот сильно злиться и будет бить человек.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Hello_01_04");	//Какой ты грозный.
};


instance DIA_STRF_8152_UrTak_Umrak(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Umrak_condition;
	information = DIA_STRF_8152_UrTak_Umrak_info;
	permanent = FALSE;
	description = "Умрак твой брат?";
};

func int DIA_STRF_8152_UrTak_Umrak_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE) && (KnowAboutUmrak == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_Umrak_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Umrak_01_01");	//Умрак твой брат?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Umrak_01_02");	//(гордо) Быть так. Быть очень сильный воин! Сражаться на великий арена братов.
};

instance DIA_STRF_8152_UrTak_Teach(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Teach_condition;
	information = DIA_STRF_8152_UrTak_Teach_info;
	permanent = FALSE;
	description = "Покажешь мне пару своих приемчиков?";
};

func int DIA_STRF_8152_UrTak_Teach_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_Teach_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Teach_01_01");	//Покажешь мне пару своих приемчиков?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_02");	//А почему Уртак должен это делать? Уртак думать, что человек быть слабый!
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Teach_01_03");	//Может, проверим?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_04");	//Ар Дагар запретить тут сражаться! Если ослушаться, то браты убивать человек и Уртак.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_05");	//Если человек хотеть доказать Уртак, что он быть сильный, то идти и побеждать Умрака!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_06");	//Тогда Уртак научить его сражаться оружием братов.
	MIS_UrTakTeach = LOG_Running;
	Log_CreateTopic(TOPIC_UrTakTeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_UrTakTeach,LOG_Running);
	B_LogEntry(TOPIC_UrTakTeach,"Уртак покажет мне, как сражаться с орочьим оружием. Но только если я смогу победить его брата Умрака на арене орков.");
};


instance DIA_STRF_8152_UrTak_TeachDone(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_TeachDone_condition;
	information = DIA_STRF_8152_UrTak_TeachDone_info;
	permanent = FALSE;
	description = "Я победил твоего брата на арене!";
};

func int DIA_STRF_8152_UrTak_TeachDone_condition()
{
	if((MIS_UrTakTeach == LOG_Running) && (HeroIsMorDar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_TeachDone_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_TeachDone_01_01");	//Я победил твоего брата на арене!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_TeachDone_01_02");	//Человек одолеть Умрак? (с уважением) Тогда он быть великий воин!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_TeachDone_01_03");	//Для Уртак это быть большой честь учить его сражаться.
	AI_PlayAni(self,"T_GREETGRD");
	MIS_UrTakTeach = LOG_Success;
	Log_SetTopicStatus(TOPIC_UrTakTeach,LOG_Success);
	B_LogEntry(TOPIC_UrTakTeach,"Теперь Уртак покажет мне, как сражаться с орочьим оружием.");
};

instance DIA_STRF_8152_UrTak_OFStyle(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_OFStyle_condition;
	information = DIA_STRF_8152_UrTak_OFStyle_info;
	permanent = TRUE;
	description = "Научи меня сражаться оружием орков. (Очки обучения: 10)";
};

func int DIA_STRF_8152_UrTak_OFStyle_condition()
{
	if((MIS_UrTakTeach == LOG_Success) && (OFStyle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_OFStyle_info()
{
	var int kosten;

	kosten = 10;

	AI_Output(other,self,"DIA_STRF_8152_UrTak_OFStyle_01_00");	//Научи меня сражаться оружием орков.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_01");	//У человек не хватать опыт для этого! Уртак не может его учить...
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_02");	//Тогда слушать Уртак внимательно. Он будет говорить.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_03");	//Оружие братов быть очень тяжелый для человек! Тяжело держать, тяжело сражаться.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_04");	//Тот быстро уставать, терять сила и проиграть битва.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_05");	//Уртак показать, как правильно держать оружие, как правильно наносить удар.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_06");	//Человек должен использовать тяжесть оружия, а не своя сила, чтобы бить.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_07");	//Тогда он сможет использовать оружие братов правильно!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Изучено: владение орочьим оружием");
		OFStyle = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_STRF_8152_UrTak_WhatDo(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_WhatDo_condition;
	information = DIA_STRF_8152_UrTak_WhatDo_info;
	permanent = FALSE;
	description = "А что ты здесь вообще делаешь?";
};

func int DIA_STRF_8152_UrTak_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_WhatDo_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_WhatDo_01_01");	//А что ты здесь вообще делаешь?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_02");	//Уртак охранять вход в глубокий шахта.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_03");	//Если сниза приходить враг, то Уртак сражаться с ним!
	AI_Output(other,self,"DIA_STRF_8152_UrTak_WhatDo_01_04");	//А что там за враг?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_05");	//Уртак этого не знать, но другие браты говорить, что он быть очень сильный!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_06");	//Он даже хотеть пойти сам смотреть, но Ар Дагар говорить Уртак нельзя.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_07");	//Уртак сильно печалиться. Уртак хотеть биться с враг!
	AI_Output(other,self,"DIA_STRF_8152_UrTak_WhatDo_01_08");	//Ну, не расстраивайся! Может быть, тебе еще представится подобная возможность.
	MIS_UrTakWannaFight = LOG_Running;
	Log_CreateTopic(TOPIC_UrTakWannaFight,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_UrTakWannaFight,LOG_Running);
	B_LogEntry(TOPIC_UrTakWannaFight,"Орк Уртак хочет сражаться со злом, что затаилось в глубокой шахте. Но поскольку Ар Дагар запретил кому-либо спускаться туда, Уртак очень печалится об этом. Если я вдруг отправлюсь туда, надо не забыть про этого воина.");
};

instance DIA_STRF_8152_UrTak_GoWithMe(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_GoWithMe_condition;
	information = DIA_STRF_8152_UrTak_GoWithMe_info;
	permanent = FALSE;
	description = "Пойдешь со мной сражаться в глубокую шахту?";
};

func int DIA_STRF_8152_UrTak_GoWithMe_condition()
{
	if((MIS_LowLevel == LOG_Running) && (MIS_UrTakWannaFight == LOG_Running) && (GoFightDeepMine == TRUE) && (DeepMineArrived == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_GoWithMe_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_01");	//Пойдешь со мной сражаться в глубокую шахту?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_GoWithMe_01_02");	//Человек не шутить с Уртак? Разве Ар Дагар не запрещать никому ходить туда?
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_03");	//Ар Дагар дал мне свое согласие.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_04");	//Так что теперь я с несколькими вашими воинами отправляюсь вниз, чтобы покончить с обосновавшимся там злом.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_GoWithMe_01_05");	//Уртак быть рад, что человек не забыть про него! Он идти вместе с ним сражаться в глубокий шахта.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_06");	//Тогда отправляйся к подъемнику. Сбор там.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_GoWithMe_01_07");	//Хорошо! Уртак уже идти.

	if(MIS_UrTakWannaFight != LOG_Success)
	{
		MIS_UrTakWannaFight = LOG_Success;
		Log_SetTopicStatus(TOPIC_UrTakWannaFight,LOG_Success);
		B_LogEntry(TOPIC_UrTakWannaFight,"Я взял Уртака с собой в глубокую шахту.");
	};

	AI_StopProcessInfos(self);

	if((OrcMineFightReady == TRUE) && (ORCMINEKILL_01 == FALSE))
	{
		Npc_ExchangeRoutine(STRF_8152_UrTak,"Elevator");
	}
	else
	{
		Npc_ExchangeRoutine(self,"NearFight");
	};
};


//--------------------------------------------------Орки УрТралла-------------------------------------

instance DIA_STRF_8153_Fighter_EXIT(C_Info)
{
	npc = STRF_2153_Fighter;
	condition = DIA_STRF_8153_Fighter_exit_condition;
	information = DIA_STRF_8153_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8153_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8153_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8153_Fighter_PreHello(C_Info)
{
	npc = STRF_2153_Fighter;
	condition = DIA_STRF_8153_Fighter_PreHello_condition;
	information = DIA_STRF_8153_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8153_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8153_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Орак Шака!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8154_Fighter_EXIT(C_Info)
{
	npc = STRF_2154_Fighter;
	condition = DIA_STRF_8154_Fighter_exit_condition;
	information = DIA_STRF_8154_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8154_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8154_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8154_Fighter_PreHello(C_Info)
{
	npc = STRF_2154_Fighter;
	condition = DIA_STRF_8154_Fighter_PreHello_condition;
	information = DIA_STRF_8154_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8154_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8154_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Орак Шака!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8155_Fighter_EXIT(C_Info)
{
	npc = STRF_2155_Fighter;
	condition = DIA_STRF_8155_Fighter_exit_condition;
	information = DIA_STRF_8155_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8155_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8155_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8155_Fighter_PreHello(C_Info)
{
	npc = STRF_2155_Fighter;
	condition = DIA_STRF_8155_Fighter_PreHello_condition;
	information = DIA_STRF_8155_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8155_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8155_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Орак Шака!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8156_Fighter_EXIT(C_Info)
{
	npc = STRF_2156_Fighter;
	condition = DIA_STRF_8156_Fighter_exit_condition;
	information = DIA_STRF_8156_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8156_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8156_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8156_Fighter_PreHello(C_Info)
{
	npc = STRF_2156_Fighter;
	condition = DIA_STRF_8156_Fighter_PreHello_condition;
	information = DIA_STRF_8156_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8156_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8156_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Орак Шака!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8157_Fighter_EXIT(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_exit_condition;
	information = DIA_STRF_8157_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8157_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8157_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8157_Fighter_PreHello(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_PreHello_condition;
	information = DIA_STRF_8157_Fighter_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8157_Fighter_PreHello_condition()
{
	return TRUE;
};

func void DIA_STRF_8157_Fighter_PreHello_info()
{
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Орак Шака!
	AI_Output(self,other,"DIA_STRF_8157_Fighter_PreHello_01_01");	//Нас прислать великий вождь идти сражаться в глубокий шахта!
	AI_Output(other,self,"DIA_STRF_8157_Fighter_PreHello_01_02");	//Не так уж вас и много.
	AI_Output(self,other,"DIA_STRF_8157_Fighter_PreHello_01_03");	//Все воины, который быть тут, все очень сильный! Много раз сражаться с враг и побеждать его.
	AI_Output(other,self,"DIA_STRF_8157_Fighter_PreHello_01_04");	//Ну, будем надеяться, что ты прав и они действительно мне помогут.
	AI_Output(self,other,"DIA_STRF_8157_Fighter_PreHello_01_05");	//Человек давать знать, когда начинать! Мы ждать тут его сигнал...
};

instance DIA_STRF_8157_Fighter_Go(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_Go_condition;
	information = DIA_STRF_8157_Fighter_Go_info;
	permanent = FALSE;
	description = "Грузитесь на платформу! Мы начинаем.";
};

func int DIA_STRF_8157_Fighter_Go_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8157_Fighter_PreHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8157_Fighter_Go_info()
{
	AI_Output(other,self,"DIA_STRF_8157_Fighter_Go_01_01");	//Грузитесь на платформу! Мы начинаем.
	AI_Output(self,other,"DIA_STRF_8157_Fighter_Go_01_02");	//Хорошо! Тогда человек брать ключ, чтобы опускать платформа. 
	B_GiveInvItems(self,other,ItKe_OrcMine_Elevator,1);
	AI_Output(self,other,"DIA_STRF_8157_Fighter_Go_01_03");	//Орак Шака!
	OrcMineFightReady = TRUE;
	AI_StopProcessInfos(self);
	B_SetAttitude(STRF_2153_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2154_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2155_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2156_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2157_Fighter,ATT_FRIENDLY);
	Npc_ExchangeRoutine(STRF_2153_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2154_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2155_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2156_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2157_Fighter,"Elevator");

	if((MIS_UrTakWannaFight == LOG_Success) && (Npc_IsDead(STRF_8152_UrTak) == FALSE))
	{
		Npc_ExchangeRoutine(STRF_8152_UrTak,"Elevator");
		AI_Teleport(STRF_8152_UrTak,"ORCMINE_FIGHTER_URTAK");
		B_SetAttitude(STRF_8152_UrTak,ATT_FRIENDLY);
	};
};

//------------------------------------------------------кузнец орков--------------------------

instance DIA_Orc_8571_HashTor_EXIT(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_exit_condition;
	information = dia_Orc_8571_HashTor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_Orc_8571_HashTor_exit_condition()
{
	return TRUE;
};

func void dia_Orc_8571_HashTor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8571_HashTor_PreHello(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = DIA_Orc_8571_HashTor_PreHello_condition;
	information = DIA_Orc_8571_HashTor_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8571_HashTor_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8571_HashTor_PreHello_info()
{
	AI_Output(self,other,"DIA_Orc_8571_HashTor_PreHello_01_01");	//КАРАТ ДАР ПОР НУРАК КАР?
	AI_Output(other,self,"DIA_Orc_8571_HashTor_PreHello_01_02");	//Эммм...
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8571_HashTor_UpHello(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = DIA_Orc_8571_HashTor_UpHello_condition;
	information = DIA_Orc_8571_HashTor_UpHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8571_HashTor_UpHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8571_HashTor_UpHello_info()
{
	AI_Output(self,other,"DIA_Orc_8571_HashTor_UpHello_01_02");	//Что человек быть надо от Хаш Тор?
};

instance DIA_Orc_8571_HashTor_HELLO(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_hello_condition;
	information = dia_Orc_8571_HashTor_hello_info;
	permanent = FALSE;
	description = "Ты ведь кузнец?";
};

func int dia_Orc_8571_HashTor_hello_condition()
{
	if(KnowAboutHashTor == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_01");	//Ты ведь кузнец?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_02");	//(одобрительно) ДАГ ТАКАР. Хаш Тор быть мастер железный руда! Быть кузнец, как говорить люди.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_03");	//Ур Кан сказал, что ты делаешь оружие из магической руды. Это так?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_04");	//Да, Хаш Тор делать! Но только если браты приносить ему много руда магия.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_05");	//Оружие орков быть очень большой и тяжелый! Надо много руда магия, чтобы ковать его.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_06");	//А меня можешь этому научить?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_07");	//Оружие орков не нужно человек... Тот даже не уметь с ним обращаться!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_08");	//Если человек научиться, как сражаться оружием орков, тогда Хаш Тор показать ему, как его делать.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_09");	//А кто этому может научить?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_10");	//Хаш Тор не знать! Человек сам спрашивать братов об этом.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_11");	//Ладно, я тебя понял.
	MIS_HashTorRule = LOG_Running;
	Log_CreateTopic(TOPIC_HashTorRule,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HashTorRule,LOG_Running);
	B_LogEntry(TOPIC_HashTorRule,"Кузнец Хаш Тор может научить меня делать оружие орков, если я научусь сражаться им.");	
};

instance DIA_Orc_8571_HashTor_Rule(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Rule_condition;
	information = dia_Orc_8571_HashTor_Rule_info;
	permanent = FALSE;
	description = "Я умею сражаться орочьим оружием.";
};

func int dia_Orc_8571_HashTor_Rule_condition()
{
	if((MIS_HashTorRule == LOG_Running) && (OFStyle == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Rule_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Rule_01_01");	//Я умею сражаться орочьим оружием.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Rule_01_02");	//УРАК ШАКА МОРА...(одобрительно) Хаш Тор видеть это! Человек быть сильный, если смог научиться этому.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Rule_01_03");	//Теперь покажешь мне, как ковать рудное оружие орков?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Rule_01_04");	//Хаш Тор обещать - Хаш Тор держать свой слово!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Rule_01_05");	//Он обучить этому человек, если у того хватать руда магия и опыта.
	MIS_HashTorRule = LOG_Success;
	Log_SetTopicStatus(TOPIC_HashTorRule,LOG_Success);
	B_LogEntry(TOPIC_HashTorRule,"Теперь, когда я умею сражаться оружием орков наверняка Хаш Тор может научить меня ковать орочьи мечи и топоры. В качестве оплаты Хаш Тор берет магическую руду.");	
	Log_CreateTopic(TOPIC_ORCWEAPON,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ORCWEAPON,"Ковка оружия орков...");
};

var int HashTorTeachAll;

instance DIA_Orc_8571_HashTor_Teach(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Teach_condition;
	information = dia_Orc_8571_HashTor_Teach_info;
	permanent = TRUE;
	description = "Научи меня делать рудное оружие орков.";
};

func int dia_Orc_8571_HashTor_Teach_condition()
{
	if((MIS_HashTorRule == LOG_Success) && (HashTorTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Teach_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Teach_01_01");	//Научи меня ковать рудное оружие орков.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Teach_01_02");	//Что именно человек хотеть знать?
	Info_ClearChoices(DIA_Orc_8571_HashTor_Teach);
	Info_AddChoice(DIA_Orc_8571_HashTor_Teach,Dialog_Back,DIA_Orc_8571_HashTor_Teach_Back);

	if(ORCWEAPON_LINE_STR_01 == FALSE)
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудный орочий топор (Кусков руды: 125)",DIA_Orc_8571_HashTor_Teach_STR_01);
	};
	if((ORCWEAPON_LINE_STR_01 == TRUE) && (ORCWEAPON_LINE_STR_02 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудный меч воина (Кусков руды: 250)",DIA_Orc_8571_HashTor_Teach_STR_02);
	};
	if((ORCWEAPON_LINE_STR_02 == TRUE) && (ORCWEAPON_LINE_STR_03 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудный боевой топор (Кусков руды: 500)",DIA_Orc_8571_HashTor_Teach_STR_03);
	};
	if((ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_01 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудный орочий колун (Кусков руды: 125)",DIA_Orc_8571_HashTor_Teach_HP_01);
	};
	if((ORCWEAPON_LINE_HP_01 == TRUE) && (ORCWEAPON_LINE_HP_02 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудный меч старейшины (Кусков руды: 250)",DIA_Orc_8571_HashTor_Teach_HP_02);
	};
	if((ORCWEAPON_LINE_HP_02 == TRUE) && (ORCWEAPON_LINE_HP_03 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудная штурмовая секира (Кусков руды: 500)",DIA_Orc_8571_HashTor_Teach_HP_03);
	};
	if((ORCWEAPON_LINE_HP_03 == TRUE) && (ORCPRIMEWEAPON == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Рудная клеймора вождя (Кусков руды: 1000, Очки обучения: 10)",DIA_Orc_8571_HashTor_Teach_PRIME);
	};
};

func void DIA_Orc_8571_HashTor_Teach_Back()
{
	Info_ClearChoices(DIA_Orc_8571_HashTor_Teach);
};

func void DIA_Orc_8571_HashTor_Teach_STR_01()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 125)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(hero,ItMi_Nugget,125);
		ORCWEAPON_LINE_STR_01 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный орочий топор'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудный орочий топор. Для этого требуется: стальная заготовка, десять кусков магической руды, два куска железной руды, смола и сера.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_STR_02()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 250)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 10;
		Npc_RemoveInvItems(hero,ItMi_Nugget,250);
		ORCWEAPON_LINE_STR_02 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный меч воина'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудный меч воина. Для этого требуется: стальная заготовка, двадцать кусков магической руды, пять кусков железной руды, два куска угля, два куска серы и две порции смолы.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_STR_03()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 500)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 15;
		Npc_RemoveInvItems(hero,ItMi_Nugget,500);
		ORCWEAPON_LINE_STR_03 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой топор'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудный боевой топор. Для этого требуется: стальная заготовка, тридцать кусков магической руды, пять кусков угля, три порции смолы, ртуть и сера.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_01()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 125)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(hero,ItMi_Nugget,125);
		ORCWEAPON_LINE_HP_01 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный орочий колун'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудный орочий колун. Для этого требуется: стальная заготовка, пять кусков магической руды, десять кусков железной руды, уголь и сера.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_02()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 250)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 10;
		Npc_RemoveInvItems(hero,ItMi_Nugget,250);
		ORCWEAPON_LINE_HP_02 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный меч старейшины'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудный меч старейшины. Для этого требуется: стальная заготовка, десять кусков магической руды, десять кусков железной руды, сера и ртуть.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_03()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 500)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 15;
		Npc_RemoveInvItems(hero,ItMi_Nugget,500);
		ORCWEAPON_LINE_HP_03 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудная штурмовая секира'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудную штурмовую секиру. Для этого требуется: стальная заготовка, тридцать кусков магической руды, пять кусков серы, черный жемчуг и два куска угля.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

func void DIA_Orc_8571_HashTor_Teach_PRIME()
{
	if(hero.lp < 10)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
	}
	else if(Npc_HasItems(hero,ItMi_Nugget) < 1000)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 20;
		Npc_RemoveInvItems(hero,ItMi_Nugget,1000);
		ORCPRIMEWEAPON = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудная клеймора вождя'");
		B_LogEntry(TOPIC_ORCWEAPON,"Теперь я умею ковать рудную клеймору вождя. Для этого требуется: стальная заготовка, пятьдесят кусков магической руды, два куска черной руды, десять кусков серы, две порции смолы, черный жемчуг, изумруд и ртуть.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

instance DIA_Orc_8571_HashTor_Anvil(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Anvil_condition;
	information = dia_Orc_8571_HashTor_Anvil_info;
	permanent = FALSE;
	description = "Большая у тебя кузня!";
};

func int dia_Orc_8571_HashTor_Anvil_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Anvil_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Anvil_01_01");	//Большая у тебя кузня!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Anvil_01_02");	//Когда много ковать, то и надо быть много места.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Anvil_01_03");	//И разжигать большой огонь, чтобы делать большой оружие!
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Anvil_01_04");	//Ну, это понятно.
};

instance DIA_Orc_8571_HashTor_War(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_War_condition;
	information = dia_Orc_8571_HashTor_War_info;
	permanent = FALSE;
	description = "Много работы?";
};

func int dia_Orc_8571_HashTor_War_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_War_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_War_01_01");	//Много работы?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_War_01_02");	//Браты идти воевать. Надо иметь много оружие, много доспехов!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_War_01_03");	//Все это делать Хаш Тор! У него быть очень много дел.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_War_01_04");	//Оно и видно.
};

instance DIA_Orc_8571_HashTor_Help(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Help_condition;
	information = dia_Orc_8571_HashTor_Help_info;
	permanent = FALSE;
	description = "А помощь тебе не нужна?";
};

func int dia_Orc_8571_HashTor_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_War) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Help_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Help_01_01");	//А помощь тебе не нужна?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Help_01_02");	//Хаш Тору очень нужна быть черный руда. Надо не меньше пяти кусков!
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Help_01_03");	//Но зачем тебе столько?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Help_01_04");	//Хаш Тор делать новый меч для великий вождь! Большой и очень крепкий.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Help_01_05");	//Но для этого ему нужна быть черный руда. Без нее Хаш Тор не мочь делать оружие.
	MIS_HashTorOre = LOG_Running;
	Log_CreateTopic(TOPIC_HashTorOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HashTorOre,LOG_Running);
	B_LogEntry(TOPIC_HashTorOre,"Кузнецу Хаш Тору нужно пять кусков черной руды. Без нее он не сможет сковать для своего вождя новое оружие.");	
};


instance DIA_Orc_8571_HashTor_OreDone(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_OreDone_condition;
	information = dia_Orc_8571_HashTor_OreDone_info;
	permanent = FALSE;
	description = "Я принес тебе руду.";
};

func int dia_Orc_8571_HashTor_OreDone_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 5))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_OreDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_01");	//Я принес тебе руду.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_02");	//Тогда человек давать ее Хаш Тор, и он делать большой меч для великий вождь.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Zeitspalt_Addon,5);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,5);
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_04");	//Быть очень хорошо... Теперь человек немного ждать.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_05");	//Эммм... Чего именно?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_06");	//Хаш Тор сейчас ковать оружие, а человек потом относить его в чертоги, отдавать меч Ур-Тралл!
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_07");	//А ты не боишься, что я просто-напросто сбегу с ним?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_08");	//Нет...(посмеивается) Он слишком тяжелый для человек! Тот не сможет ходить с ним на война.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_09");	//Только великий вождь быть такой сильный, что поднимать его.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_10");	//Но если человек не верить, то он может попробовать сам.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_11");	//Вот, он держать его.
	B_GiveInvItems(self,other,ITMW_2H_ORCSWORD_05,1);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_12");	//Проклятье... Какой же он тяжелый!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_13");	//Хаш Тор не обмануть человек! Оружие для Ур-Тралл быть очень тяжелый для него.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_14");	//Все! Теперь человек ступать и отнести его великий вождь. Тот его уже ждать.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 10");
	};

	B_LogEntry(TOPIC_HashTorOre,"Я принес Хаш Тору пять кусков черной руды. Он завершил работу над мечом и попросил меня отнести его Ур-Траллу.");	
};

instance DIA_Orc_8571_HashTor_SwordBack(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_SwordBack_condition;
	information = dia_Orc_8571_HashTor_SwordBack_info;
	permanent = FALSE;
	description = "Я отнес меч Ур-Траллу.";
};

func int dia_Orc_8571_HashTor_SwordBack_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (UrTrallTakeSword == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_SwordBack_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_SwordBack_01_01");	//Я отнес меч Ур-Траллу.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_SwordBack_01_02");	//Хорошо. И что сказать великий вождь?
	AI_Output(other,self,"DIA_Orc_8571_HashTor_SwordBack_01_03");	//Он остался доволен твоей работой и сказал, что ты большой мастер.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_SwordBack_01_04");	//КОР, КОР! (радостно) Большой вождь похвалить Хаш Тор! Он быть очень рад этому.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_SwordBack_01_05");	//Понимаю твою радость.
	MIS_HashTorOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_HashTorOre,LOG_Success);
	B_LogEntry(TOPIC_HashTorOre,"Я передал Хаш Тору, что меч понравился Ур-Траллу.");
};
//------------------------------------------------------шаман орков--------------------------

instance DIA_Orc_8572_UrHoshNar_EXIT(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_exit_condition;
	information = dia_Orc_8572_UrHoshNar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_Orc_8572_UrHoshNar_exit_condition()
{
	return TRUE;
};

func void dia_Orc_8572_UrHoshNar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_PreHello(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = DIA_Orc_8572_UrHoshNar_PreHello_condition;
	information = DIA_Orc_8572_UrHoshNar_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8572_UrHoshNar_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8572_UrHoshNar_PreHello_info()
{
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PreHello_01_01");	//ДАГАР ХАР МОРА!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PreHello_01_02");	//Эммм... что?
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_HELLO(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_hello_condition;
	information = dia_Orc_8572_UrHoshNar_hello_info;
	permanent = FALSE;
	description = "Привет!";
};

func int dia_Orc_8572_UrHoshNar_hello_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_01");	//Привет!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_02");	//Хммм...(удивленно) Я видеть, что человек знать наш язык.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_03");	//Хош Нар не знать, что бывать такие люди!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_04");	//А кто ты?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_05");	//Хош Нар быть сын духов, быть великий шаман братов.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_06");	//Заклинать духи предков, чтобы те не гневаться и не убивать орков.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_07");	//Что это еще за духи?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_08");	//Человек не брат! Человек не понять...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_09");	//Ах, ну да, конечно.
};

instance DIA_Orc_8572_UrHoshNar_Clever(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Clever_condition;
	information = dia_Orc_8572_UrHoshNar_Clever_info;
	permanent = FALSE;
	description = "Вы, шаманы, ведь самые умные среди орков?";
};

func int dia_Orc_8572_UrHoshNar_Clever_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Clever_info()
{
	AI_Output(other,self,"DIA_Orc_8571_UrHoshNar_Clever_01_01");	//Вы, шаманы, ведь самые умные среди орков?
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_Clever_01_02");	//УР РАТ! Сыны духов много знать...(утвердительно) Но зачем человек это спрашивать?
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Clever_01_03");	//Мне бы хотелось немного узнать о культуре орков. А лучше тебя мне вряд ли кто-либо об этом расскажет.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_05");	//Человек очень сильно удивлять Хош Нар! Тот быть очень странный!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_06");	//Но если он действительно хотеть много знать об орках, он прийти правильно сюда.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_07");	//Хош Нар много знать о братах, много видеть, много слышать...
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_08");	//Человек знать наш язык, понимать, что говорить Хаш Нар!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_09");	//Поэтому тот расскажет ему, что знать сам. Если, конечно, человек хотеть слушать.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_10");	//Однако прежде чем он это сделать, Хаш Нар хотеть, чтобы человек принести ему знания людей!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Clever_01_11");	//Ты имеешь в виду книги людей?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_12");	//Книги? Хммм...(замявшись) Хаш Нар не понимать, о чем человек говорит! 
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_13");	//Но ему нужно то, где люди писать о свой народ.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_14");	//Хаш Нар хотеть больше узнать о люди! Как они жить, что они делать, как они воевать...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Clever_01_15");	//Ладно, попробую для тебя что-нибудь найти.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_16");	//Тогда человек нести Хаш Нар эта вещь...(одобрительно) Тот будет ждать человек тут!
	MIS_HoshNarBooks = LOG_Running;
	Log_CreateTopic(TOPIC_HoshNarBooks,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HoshNarBooks,LOG_Running);
	B_LogEntry(TOPIC_HoshNarBooks,"В городе орков я повстречал верховного шамана Ур Хаш Нара. Он хочет узнать больше о культуре людей, и попросил меня достать ему какие-нибудь интересные записи. Например, о быте людей или об их сражениях...");
};

instance DIA_Orc_8572_UrHoshNar_CleverDone(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_CleverDone_condition;
	information = dia_Orc_8572_UrHoshNar_CleverDone_info;
	permanent = FALSE;
	description = "Я принес тебе книгу.";
};

func int dia_Orc_8572_UrHoshNar_CleverDone_condition()
{
	if((MIS_HoshNarBooks == LOG_Running) && (Npc_HasItems(other,ItWr_EinhandBuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_CleverDone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Orc_8571_UrHoshNar_CleverDone_01_01");	//Я принес тебе книгу.
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_CleverDone_01_02");	//(одобрительно) УР ДАГ ТАК. А о чем в ней писать люди?
	AI_Output(other,self,"DIA_Orc_8571_UrHoshNar_CleverDone_01_03");	//Кажется, здесь описано какое-то крупное сражение. Я точно не помню. Лучше ее сам прочти.
	B_GiveInvItems(other,self,ItWr_EinhandBuch,1);
	Npc_RemoveInvItems(self,ItWr_EinhandBuch,1);
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_CleverDone_01_05");	//(с интересом) Большой война? Хаш Нар думать, это быть ему интересно!
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_CleverDone_01_06");	//Он брать ее у человек и благодарить его.
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 15");
	};

	TellAboutOrcs = TRUE;
	MIS_HoshNarBooks = LOG_Success;
	Log_SetTopicStatus(TOPIC_HoshNarBooks,LOG_Success);
	B_LogEntry(TOPIC_HoshNarBooks,"Я принес Ур Хаш Нару интересующую его книгу. Он в свою очередь сможет мне рассказать о культуре орков.");
};

instance DIA_Orc_8572_UrHoshNar_WhereFrom(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_WhereFrom_condition;
	information = dia_Orc_8572_UrHoshNar_WhereFrom_info;
	permanent = FALSE;
	description = "Расскажи мне о городе орков.";
};

func int dia_Orc_8572_UrHoshNar_WhereFrom_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_WhereFrom_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_WhereFrom_01_01");	//Расскажи мне о городе орков.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_02");	//УР КАР ВАШАР... Это быть не город, как у люди! Быть крепость братов, чтобы идти на война.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_03");	//Так это крепость?!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_04");	//УР АР ШАР...(одобрительно) Орки строить ее очень много зим назад.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_05");	//Быть место, где собираться самый сильный воин братов! Тут же находиться чертоги вождей племен.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_06");	//А что с остальными орками?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_07");	//Остальные браты жить далеко в горах! Но человек туда никогда не смочь попасть. Быть очень высоко!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_08");	//Понимаю.
};

instance DIA_Orc_8572_UrHoshNar_War(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_War_condition;
	information = dia_Orc_8572_UrHoshNar_War_info;
	permanent = FALSE;
	description = "Расскажи мне о войне.";
};

func int dia_Orc_8572_UrHoshNar_War_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_War_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_01");	//Расскажи мне о войне.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_02");	//Она идти уже очень давно. Хаш Нар быть еще очень молодой, когда быть война.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_03");	//А с чего вообще она началась?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_04");	//(гневно) КОР МОРА ТАР!!! Люди быть слишком жадный, хотеть очень много золото, очень много руда!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_05");	//Много зим назад приплывать сюда и убивать много братов Ур Хаш Нара.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_06");	//Тогда орки уходить высоко в горы, собирать много воинов и идти воевать.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_07");	//Мстить за своих братов! Убивать всех люди, выгонять с остров.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_08");	//И больше вам ничего не нужно?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_09");	//Нет! Орки всегда хотят жить мирно, но люди так не уметь. Люди быть злой, очень злой!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_10");	//Хммм... Ясно.
};

instance DIA_Orc_8572_UrHoshNar_Faith(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Faith_condition;
	information = dia_Orc_8572_UrHoshNar_Faith_info;
	permanent = FALSE;
	description = "Расскажи мне о вашей вере.";
};

func int dia_Orc_8572_UrHoshNar_Faith_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Faith_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_01");	//Расскажи мне о вашей вере.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_02");	//Орки всегда почитать только свой великий предок! Мы молиться великим вождям и шаманам прошлого.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_03");	//А некоторые из нас могут даже общаться с ними!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_04");	//А что насчет Спящего или Белиара?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_05");	//(гневно) УР ДАР КРУШАК КАТ ЗО ХАР!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_06");	//И что это значит?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_07");	//Браты Подгорной Скалы быть глупый, очень глупый, что поклоняться Крушак! Злой демон убивать их всех.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_08");	//Подгорной Скалы?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_09");	//Так звать племя братов, что жить когда-то там. Это их сыны духов вызывать Крушак в этот мир!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_10");	//Ясно. А Белиару вы поклоняетесь?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_11");	//Браты никогда не молиться ГРАТ БАШАР, он не быть их великий предок.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_12");	//ГРАТ БАШАР это по-вашему Белиар?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_13");	//КОР КОР...(одобрительно) Но ГРАТ БАШАР быть очень злой! Все браты очень сильно бояться его.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_14");	//(саркастически) Понимаю. Видать, потому вы ему и служите.
};

instance DIA_Orc_8572_UrHoshNar_Peace(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Peace_condition;
	information = dia_Orc_8572_UrHoshNar_Peace_info;
	permanent = FALSE;
	description = "А чем вы занимаетесь, когда не воюете?";
};

func int dia_Orc_8572_UrHoshNar_Peace_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_War) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Peace_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_01");	//А чем вы занимаетесь, когда не воюете?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_02");	//Много чем...(довольно) Но в основном браты ходить охотиться!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_03");	//Любой орк должен уметь прокормить себя и защищать, если хотеть выжить в горах.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_04");	//Ведь там водится много страшный зверь и быть очень холодно!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_05");	//А чем занимаетесь вы, шаманы?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_06");	//Сыны духов днем спать, ночью молиться духам предков, чтобы те беречь братов.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_07");	//Ночь самый опасный время, когда все браты спать и их легко убивать.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_08");	//А сами вы не воюете, значит?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_09");	//(удивленно) Зачем шаман воевать?! Для этого быть много сильный воин.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_10");	//Только в случае крайней необходимости великий шаман может отдавать приказы братам.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_11");	//Обычно же это делать старейшины и вожди племен.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_12");	//Ясно.
};

instance DIA_Orc_8572_UrHoshNar_Castle(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Castle_condition;
	information = dia_Orc_8572_UrHoshNar_Castle_info;
	permanent = FALSE;
	description = "У вас так много сильных воинов...";
};

func int dia_Orc_8572_UrHoshNar_Castle_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Peace) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Castle_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_01");	//У вас так много сильных воинов. Почему же вы до сих пор не возьмете замок в Долине Рудников?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_03");	//Первый штурм замка провалиться... Тогда погибать много братов!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_04");	//Как же это произошло?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_05");	//У враг паладин быть очень много хороших стрелков и очень сильный магия.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_06");	//Они убивать много братов со стен и те даже не мочь ничего сделать.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_07");	//Поэтому орки долго думать и решить, что пока больше не атаковать замок.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_08");	//Ждать, пока другие браты привезти большой БУДРАК, чтобы ломать главный ворота.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_09");	//БУДРАК?!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_10");	//Быть большой палка, бить ей большие ворота замка!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_11");	//А, ты имеешь в виду таран. И кто же его должен привезти?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_12");	//Орки браты с большой остров! Они уже приплыть сюда, уже делать БУДРАК!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_13");	//Хммм... Какие вы шустрые.
};

instance DIA_Orc_8572_UrHoshNar_Myrtana(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Myrtana_condition;
	information = dia_Orc_8572_UrHoshNar_Myrtana_info;
	permanent = FALSE;
	description = "А что это за 'браты с большой остров'?";
};

func int dia_Orc_8572_UrHoshNar_Myrtana_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Castle) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Myrtana_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_01");	//А что это за 'браты с большой остров'?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_02");	//Туда плыть много дней, быть большой остров! Остров, где жить вождь людей.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_03");	//Так они что, приплыли с материка?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_04");	//Хммм...(удивленно) Ур Хаш Нар не понимать, что человек говорить. Что такое быть мат..рик?
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_05");	//Да ладно, называй его просто 'большой остров'. Не суть важно.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_06");	//Меня интересует другое. Выходит, что вы общаетесь с орками ма...большого острова?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_07");	//Много зим назад к нам приплывать их великий вождь - Кан!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_08");	//Он говорить, чтобы мы идти сражаться с люди. Наш вождь Ур-Тралл согласиться с ним.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_09");	//Теперь наши кланы стать братья, иметь общий враг, во всем помогать друг другу!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_10");	//Потом Кан давать нам БУДРАК! Браты везти его сюда.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_11");	//Понятно.
};

instance DIA_Orc_8572_UrHoshNar_Dragon(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Dragon_condition;
	information = dia_Orc_8572_UrHoshNar_Dragon_info;
	permanent = FALSE;
	description = "Что вы знаете о драконах?";
};

func int dia_Orc_8572_UrHoshNar_Dragon_condition()
{
	if((Kapitel < 4) && (Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Faith) == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Dragon_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_01");	//Что вы знаете о драконах?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_02");	//(уважительно) Быть очень древними созданиями... Очень могущественными и опасными!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_03");	//Браты очень сильно боятся их и никогда не подходить близко к их логову.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_04");	//Значит, вы их боитесь, как и Белиара! Ведь драконы служат именно ему.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_05");	//Человек ошибаться... Эти создания не подчиняться воле ГРАТ БАШАРА!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_06");	//Их повелители быть намного могущественнее, чем он сам.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_07");	//Хммм... Ты в этом уверен?!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_08");	//Ур Хаш Нар говорить только то, что знать сам.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_09");	//Но если человек не верить ему, то может идти и спрашивать об этом у самих драконов.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_10");	//Знаешь, мне пока что не слишком хочется это делать.
	MIS_TrueDragonMasters = LOG_Running;
	Log_CreateTopic(TOPIC_TrueDragonMasters,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrueDragonMasters,LOG_Running);
	B_LogEntry(TOPIC_TrueDragonMasters,"Слова верховного шамана Ур Хаш Нара меня немного смутили. Он сказал, что драконы вовсе не служат Белиару, и их повелители куда могущественнее его самого. Думаю, мне стоит поговорить об этом с Ксардасом. Его мнение будет важно в этом вопросе.");
};

instance DIA_Orc_8572_UrHoshNar_OrcHolyPlaces(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition;
	information = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_info;
	permanent = FALSE;
	description = "Тебе помощь никакая больше не нужна?";
};

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition()
{
	if((MIS_HoshNarBooks == LOG_Success) && (MIS_HeroOrcJoin == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_OrcHolyPlaces_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_01");	//Тебе помощь никакая больше не нужна?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_02");	//(удивленно) Человек хотеть помогать Ур Хаш Нар? Зачем ему это быть надо?
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_03");	//Мне нужно попасть к вашему вождю. Но пока орки не испытывают ко мне уважения, Фаррок не пустит меня к нему.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_05");	//Ур Хаш Нар понимать...
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_06");	//Если он хотеть, чтобы браты его уважать, то он идти в Большой Долина и молиться там великим духам предков!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_07");	//И как мне это сделать?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_08");	//Орки строить для каждого великого предка большой святилище. В Большой Долина их быть всего...ммм...четыре.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_09");	//А где мне искать эти ваши святилища?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_10");	//Ур Хаш Нар говорить это человек...(задумчиво) Одно находиться недалеко от клана Высокой Скалы.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_11");	//Второе там, где рядом высоко падать много вода! Еще одно с большой башней шамана людей.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_12");	//И последнее на высокий гора, где быть море.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_13");	//Ладно, попробую их отыскать.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_14");	//Человек ступать и молиться духам предков! Потом возвращаться к Ур Хаш Нар.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_15");	//Он говорить братам, чтобы они уважать человек.
	MIS_OrcHolyPlaces = LOG_Running;
	Log_CreateTopic(TOPIC_OrcHolyPlaces,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcHolyPlaces,LOG_Running);
	B_LogEntry(TOPIC_OrcHolyPlaces,"Шаман Ур Хаш Нар сказал мне, что если я хочу завоевать уважение орков, то должен помолиться великим духам предков у орочьих святилищ. По его словам, всего их четыре - одно, как я понял, находится рядом с водопадом, второе - там, где обосновался клан Высокой Скалы, третье рядом с башней мага, ну и четвертое - высоко в горах, недалеко от моря.");
};

instance DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_condition;
	information = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_info;
	permanent = FALSE;
	description = "Я помолился всем вашим предкам.";
};

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_condition()
{
	if((MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_01 == TRUE) && (OrcHolyPlaces_02 == TRUE) && (OrcHolyPlaces_03 == TRUE) && (OrcHolyPlaces_04 == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_01");	//Я помолился всем вашим предкам.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_02");	//Ур Хаш Нар уже знать об этом...(одобрительно) Человек все сделать правильно!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_03");	//Откуда тебе это стало известно?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_04");	//Ур Хаш Нар сам говорить с духами, они все рассказать Ур Хаш Нар.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_05");	//Ах, ну да. Я и забыл, что передо мной великий орочий шаман.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_06");	//Значит, теперь твои братья станут больше меня уважать?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_07");	//Ур Хаш Нар рассказать им о человек, как и обещать.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_08");	//Человек может верить Ур Хаш Нар, тот не обмануть его.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_09");	//Надеюсь.
	ORCRESPECT = ORCRESPECT + 20;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 20");
	};

	MIS_OrcHolyPlaces = LOG_Success;
	Log_SetTopicStatus(TOPIC_OrcHolyPlaces,LOG_Success);
	B_LogEntry(TOPIC_OrcHolyPlaces,"Ур Хаш Нар расскажет обо мне другим оркам. Это поднимет мою репутацию среди них.");
};

instance DIA_Orc_8572_UrHoshNar_PsicampDemon(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_PsicampDemon_condition;
	information = dia_Orc_8572_UrHoshNar_PsicampDemon_info;
	permanent = FALSE;
	description = "Могу я еще чем-нибудь помочь?";
};

func int dia_Orc_8572_UrHoshNar_PsicampDemon_condition()
{
	if((MIS_OrcHolyPlaces == LOG_Success) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_PsicampDemon_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_01");	//Могу я еще чем-нибудь помочь?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_02");	//Хммм...(задумчиво) Да, человек может.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_03");	//Но Ур Хаш Нар думать, что это быть очень опасно для него.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_04");	//Рассказывай.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_05");	//Ур Хаш Нар пару дней назад посылать небольшой отряд братов на большой болота.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_06");	//Духи предков говорить ему, что там последнее время происходить очень странный вещи!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_07");	//Что там не так?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_08");	//Ур Хаш Нар не знать. Браты до сих пор не вернуться обратно.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_09");	//Если человек хотеть еще помогать Ур Хаш Нар, то должен сходить на большой болота и разузнать все.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_10");	//Хорошо.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_11");	//Тогда Ур Хаш Нар будет ждать возвращения человек! Но тот быть очень осторожный.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_12");	//Большие болота быть опасный место - много зла, много мертвых...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_13");	//Не беспокойся! Я как-нибудь разберусь с этим.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_14");	//КРАТ ШАКА ОР...(одобрительно) Добрый путь, человек.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_15");	//И тебе не хворать.
	MIS_PsicampDemon = LOG_Running;
	Log_CreateTopic(TOPIC_PsicampDemon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Running);
	B_LogEntry(TOPIC_PsicampDemon,"Ур Хаш Нар послал на болота разведовательный отряд орков. Однако до сих пор от этого отряда нет никаких вестей. Шаман попросил меня сходить на болота и выяснить, что стало с его воинами.");	
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_What(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_What_condition;
	information = dia_Orc_8572_UrHoshNar_What_info;
	permanent = FALSE;
	description = "Я принес известия от Тор Дала.";
};

func int dia_Orc_8572_UrHoshNar_What_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (TorDalSentMe == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_What_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_01");	//Я принес известия от Тор Дала.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_02");	//Ур Хаш Нар его слушать...(задумчиво) Человек говорить!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_03");	//Отряд, что ты послал на болота, практически полностью уничтожен.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_04");	//От него остался лишь только сам Тор Дал и еще несколько бойцов.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_05");	//В самом же храме Братства Спящего обосновалось какое-то страшное зло.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_06");	//Однако Тор Дал точно не знает, что это. Лишь по ночам слышит его жуткие стоны.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_07");	//Он просит тебя прислать ему еще воинов, чтобы он смог отбить храм для орков.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_08");	//Хммм...(недовольно) Быть очень плохой новость, что ты принес, человек!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_09");	//Ур Хаш Нар думать строить в храм святилище орков, но теперь уже передумать.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_00");	//И он не мочь отправить туда еще больше братов воинов.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_11");	//А кто может?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_12");	//Только великий вождь Ур-Тралл должен разрешать это!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_13");	//Но он будет ругать Ур Хаш Нар, если узнать о храм на болотах.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_14");	//Это почему?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_15");	//Ур-Тралл считать, что это быть плохой место для святилища братов.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_16");	//Оно быть проклято Крушак! Там быть много зла...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_17");	//То есть чтобы помочь Тор Далу, сначала мне надо будет встретиться с великим вождем.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_18");	//Ур Хаш Нар думать так. Человек идти к Ур-Тралл и говорить с ним о храм на болотах.
	HoshNarSentMe = TRUE;
	B_LogEntry(TOPIC_PsicampDemon,"Я передал Ур Хаш Нару слова Тор Дала. Но, к сожалению, послать подмогу он ему не может. Для этого требуется разрешение самого Ур-Тралла. Так что мне придется сначала поговорить с великим вождем.");	
};

instance DIA_Orc_8572_UrHoshNar_PsicampDemonDone(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_PsicampDemonDone_condition;
	information = dia_Orc_8572_UrHoshNar_PsicampDemonDone_info;
	permanent = FALSE;
	description = "Храм на болотах свободен!";
};

func int dia_Orc_8572_UrHoshNar_PsicampDemonDone_condition()
{
	if(MIS_PsicampDemon == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_PsicampDemonDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_01");	//Храм на болотах свободен!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_02");	//Ур Хаш Нар быть очень рад этому!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_03");	//Теперь орки там могут строить свой святилище и молиться духам предков.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_04");	//Поэтому человек заслужить большая награда от Ур Хаш Нар, что помогать братам.

	if((hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW))
	{
		ORCRESPECT = ORCRESPECT + 50;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 50");
		};
		if(ShamanArmor == FALSE)
		{
			AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_05");	//Взять этот доспех! Быть доспех сынов духа. Защищать человек от огонь и магия.
			CreateInvItems(other,ItMw_2h_OrcStab,1);
			B_GiveInvItems(self,other,ITAR_SHAMANROBE,1);
			ShamanArmor = TRUE;
		}
		else
		{
			B_GiveInvItems(self,other,ItRu_OrcFireball,1);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_06");	//Взять этот напиток! Он делать человек сильный, как орк.
		ORCRESPECT = ORCRESPECT + 50;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 50");
		};

		B_GiveInvItems(self,other,ITPO_XORCPOTION02,1);
	};
	
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_07");	//Спасибо.
};


//-------------------------------------------------Тор Дал---------------------------------------------------

instance DIA_ORC_8216_TorDal_EXIT(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_exit_condition;
	information = dia_ORC_8216_TorDal_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_ORC_8216_TorDal_exit_condition()
{
	return TRUE;
};

func void dia_ORC_8216_TorDal_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8216_TorDal_HELLO(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_hello_condition;
	information = dia_ORC_8216_TorDal_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_ORC_8216_TorDal_hello_condition()
{
	if(MIS_PsicampDemon == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_01");	//(воинственно) Остановиться, человек! Зачем он сюда приходить?!
	AI_Output(other,self,"DIA_ORC_8216_TorDal_HELLO_01_02");	//А тебе-то что, орк?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_03");	//ГОР ТАК НАБАР ШАР...(качая головой)
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_04");	//Если глупый человек хотеть умирать, то он может идти дальше!
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_05");	//Тор Дал не будет его останавливать.
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8216_TorDal_Meet(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_Meet_condition;
	information = dia_ORC_8216_TorDal_Meet_info;
	permanent = FALSE;
	description = "Это тебя послал на болота шаман Ур Хаш Нар?";
};

func int dia_ORC_8216_TorDal_Meet_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_HELLO) == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_Meet_info()
{
	AI_Output(other,self,"DIA_ORC_8216_TorDal_Meet_01_01");	//Это тебя шаман Ур Хаш Нар послал на болота?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_02");	//(удивленно) КОР РАД... Да, великий шаман посылать Тор Дала на большой болота.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_03");	//Но откуда человек это быть известно?!
	AI_Output(other,self,"DIA_ORC_8216_TorDal_Meet_01_04");	//Я здесь тоже по его заданию. От вас уже давно нет никаких вестей, и Ур Хаш Нар хочет знать, что тут происходит.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_06");	//Значит, человек прийти помогать Тор Дал.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_07");	//Но лучше бы Ур Хаш Нар прислать ему больше воинов. От человека тут быть мало польза...
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 5");
	};
};

instance DIA_ORC_8216_TorDal_Many(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_Many_condition;
	information = dia_ORC_8216_TorDal_Many_info;
	permanent = FALSE;
	description = "Вас как-то не очень много.";
};

func int dia_ORC_8216_TorDal_Many_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_Meet) == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_Many_info()
{
	AI_Output(other,self,"DIA_ORC_8216_TorDal_Many_01_01");	//Вас как-то не очень много.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Many_01_02");	//Много братов Тор Дала погибать... Всех их убивать мертвые!
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Many_01_03");	//Только Тор Дал и еще несколько воинов смогли выжить.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Many_01_04");	//Теперь ждать тут, думать, что делать дальше.
};

instance DIA_ORC_8216_TorDal_What(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_What_condition;
	information = dia_ORC_8216_TorDal_What_info;
	permanent = FALSE;
	description = "А зачем Ур Хаш Нар прислал вас сюда?";
};

func int dia_ORC_8216_TorDal_What_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_Meet) == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_What_info()
{
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_01");	//А зачем Ур Хаш Нар прислал вас сюда?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_02");	//Тор Дал ходить на большой болота в Храм, как ему велеть великий шаман.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_03");	//Тот хотеть строить тут большой святилище братов! Молиться духам предков.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_04");	//Но потом сюда прийти темные шаманы и вызывать большой зло в Храме! Очень страшный зло...
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_05");	//Поднимать много мертвых, чтобы служить ему! Те убивать братов Тор Дала.
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_06");	//Что это еще за зло?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_07");	//Тор Дал не знать, он не видеть его... Только слышать его ночью! Братам становиться страшно.
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_08");	//Тебе надо сообщить об этом Ур Хаш Нару! 
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_09");	//Тор Дал не может идти обратно в город. Сначала он должен уничтожить зло! Мстить за своих братов.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_10");	//Но у Тор Дал нет много воинов, чтобы идти обратно в Храм. Он умирать, если попытаться это сделать.
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_11");	//Может, я помогу тебе расправиться с этим злом?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_12");	//Хммм... Человек быть слабый! Умирать быстрее, чем Тор Дал.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_13");	//Лучше он идти обратно к Ур Хаш Нар и просить прислать ему больше воинов.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_14");	//Те приходить и помогать Тор Дал убивать зло в Храм!
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_15");	//Ладно.
	TorDalSentMe = TRUE;
	B_LogEntry(TOPIC_PsicampDemon,"На болотах я встретил орка Тор Дала и то, что осталось от его отряда. Похоже, в Храме обосновалось какое-то зло. Тор Дал попросил меня сходить к Ур Хаш Нару и попросить его прислать Тор Далу много воинов, чтобы попытаться отбить у нежити храм. Или же я могу попробовать в одиночку разобраться с этой проблемой...");	
};

instance DIA_ORC_8216_TorDal_PsiCampDone(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_PsiCampDone_condition;
	information = dia_ORC_8216_TorDal_PsiCampDone_info;
	permanent = FALSE;
	description = "Храм чист!";
};

func int dia_ORC_8216_TorDal_PsiCampDone_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (DemonPsicampIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_PsiCampDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_ORC_8216_TorDal_PsiCampDone_01_01");	//Храм чист!
	AI_Output(self,other,"DIA_ORC_8216_TorDal_PsiCampDone_01_02");	//(уважительно) Неужели человек сам убивать там зло?
	AI_Output(other,self,"DIA_ORC_8216_TorDal_PsiCampDone_01_03");	//Да, я с ним покончил.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_PsiCampDone_01_04");	//Тор Дал извиняться перед человек, когда говорить, что он слаб.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_PsiCampDone_01_05");	//Тот быть сильный воин! Тор Дал уважать человек... Орак Шака!
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 15");
	};

	AI_PlayAni(self,"T_GREETGRD");
	MIS_PsicampDemon = LOG_Success;
	Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Success);
	B_LogEntry(TOPIC_PsicampDemon,"Я сообщил Тор Далу, что со злом в храме покончено. Теперь орки могут спокойно строить тут свое святилище.");	
};