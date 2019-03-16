
instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EDDA_NO_TALK(C_Info)
{
	npc = VLK_471_Edda;
	nr = 1;
	condition = dia_edda_no_talk_condition;
	information = dia_edda_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_edda_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_edda_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hallo(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Edda_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//Что ты варишь?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//Уху! Может, она не особенно вкусная, но, по крайней мере, это горячая еда.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//Могу налить тебе тарелку, если хочешь.
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о городе?";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//Что ты можешь рассказать мне о городе?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//Большинство горожан опасаются воров. Поэтому лучше не входить в чужие дома.
	AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//Но если ты ищешь, где остановиться на ночь, можешь поспать в моей хижине. Там есть еще одна кровать.
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//А ты не боишься воров?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//Единственная ценная вещь, что была у меня, уже пропала.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//Кто-то украл мою статуэтку Инноса!
	Edda_Schlafplatz = TRUE;
	MIS_EddaStatue = LOG_Running;
	Log_CreateTopic(TOPIC_EddaStatue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EddaStatue,LOG_Running);
	B_LogEntry(TOPIC_EddaStatue,"Какой-то вор украл у Эдды статуэтку Инноса. Надо бы помочь бедняжке вернуть ее обратно.");
	Wld_AssignRoomToGuild("hafen08",GIL_NONE);
	Npc_ExchangeRoutine(VLK_471_Edda,"friend");
};

instance DIA_Edda_Kochen(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Kochen_Condition;
	information = DIA_Edda_Kochen_Info;
	permanent = FALSE;
	description = "Ты можешь сварить для меня суп?";
};

func int DIA_Edda_Kochen_Condition()
{
	return TRUE;
};

func void DIA_Edda_Kochen_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_15_00");	//Ты можешь сварить суп для меня?
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//Я готовлю для всех. Для тебя тоже, если захочешь. Все, что мне нужно - это чтобы ты принес мне рыбу.
};

var int EddaTeachCook;

instance DIA_Edda_TeachCook(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_TeachCook_Condition;
	information = DIA_Edda_TeachCook_Info;
	permanent = FALSE;
	description = "А как насчет того, чтобы научить меня варить суп?";
};

func int DIA_Edda_TeachCook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Kochen))
	{
		return TRUE;
	};
};

func void DIA_Edda_TeachCook_Info()
{
	AI_Output(other,self,"DIA_Edda_TeachCook_01_00");	//А как насчет того, чтобы научить меня варить суп?
	AI_Output(self,other,"DIA_Edda_TeachCook_01_01");	//Хммм...(оценивающе) С этим будет посложнее! Но за пару золотых монет я готова тебе помочь.
	EddaTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Эдда может научить меня варить супы.");
};

instance DIA_Edda_TeachCookDone(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_TeachCookDone_Condition;
	information = DIA_Edda_TeachCookDone_Info;
	permanent = TRUE;
	description = "Научи меня варить супы.";
};

func int DIA_Edda_TeachCookDone_Condition()
{
	if((EddaTeachCook == TRUE) && ((Edda_Soup_01 == FALSE) || (Edda_Soup_02 == FALSE) || (Edda_Soup_03 == FALSE) || (Edda_Soup_04 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Edda_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_01_00");	//Научи меня варить супы.
	AI_Output(self,other,"DIA_Edda_TeachCookDone_01_01");	//Хорошо! Что ты хочешь сварить?
	Info_ClearChoices(DIA_Edda_TeachCookDone);
	Info_AddChoice(DIA_Edda_TeachCookDone,Dialog_Back,DIA_Edda_TeachCookDone_back);

	if(Edda_Soup_00 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Cуп из репы (Цена: 25 монет)",DIA_Edda_TeachCookDone_Beet);
	};
	if(Edda_Soup_01 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Рыбный суп (Цена: 50 монет)",DIA_Edda_TeachCookDone_fish);
	};
	if(Edda_Soup_02 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Черепаший суп (Цена: 200 монет)",DIA_Edda_TeachCookDone_shildkroetesoup);
	};
	if(Edda_Soup_03 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Грибной суп (Цена: 100 монет)",DIA_Edda_TeachCookDone_pilzsuppe);
	};
	if(Edda_Soup_04 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Мясной суп (Цена: 150 монет)",DIA_Edda_TeachCookDone_Meet);
	};
};

func void DIA_Edda_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Edda_TeachCookDone);
};

func void DIA_Edda_TeachCookDone_Beet()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 25)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,25);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_02");	//Варишь ее минут десять - и твой суп готов!
		AI_Print("Изучен рецепт готовки еды - 'Суп из репы'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить суп из репы. Для этого мне нужна репа и котел с водой.");
		Snd_Play("LevelUP");
		Edda_Soup_00 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_04");	//Извини. Но бесплатно я этого делать не стану.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_05");	//Сначала принеси золото.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_fish()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_fish_01_00");	//Рыбный суп.

	if(Npc_HasItems(hero,ItMi_Gold) >= 50)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_01");	//Это проще простого. (посмеивается) Берешь рыбу, чистишь ее от чешуи и бросаешь в котел с водой.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_02");	//Варишь ее минут десять - и твой суп готов!
		AI_Print("Изучен рецепт готовки еды - 'Рыбный суп'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить рыбный суп. Для этого мне нужна рыба и котел с водой.");
		Snd_Play("LevelUP");
		Edda_Soup_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_04");	//Извини. Но бесплатно я этого делать не стану.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_05");	//Сначала принеси золото.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_Meet()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 150)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,150);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_01");	//Хороший выбор! Если его правильно сготовить, то он получится очень вкусным!
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_03");	//Думаю, одного куска должно хватить. Бросаешь его в котел и варишь на медленном огне.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_04");	//Глазом не успеешь моргнуть, как твой суп будет готов. Запомнил?
		AI_Output(other,self,"DIA_Edda_TeachCookDone_shildkroetesoup_01_05");	//Конечно.
		AI_Print("Изучен рецепт готовки еды - 'Мясной суп'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить мясной суп. Для этого мне нужно кусок мяса и котел с водой.");
		Snd_Play("LevelUP");
		Edda_Soup_04 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_06");	//Извини. Но бесплатно я этого делать не стану.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_07");	//Сначала принеси золото.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_shildkroetesoup()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_shildkroetesoup_01_00");	//Черепаший суп.

	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,200);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_01");	//Хороший выбор! Если его правильно сготовить, то он получится очень вкусным!
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_02");	//Но для начала тебе придется отыскать черепашье мясо.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_03");	//Думаю, одного куска должно хватить. Бросаешь его в котел и варишь на медленном огне.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_04");	//Глазом не успеешь моргнуть, как твой суп будет готов. Запомнил?
		AI_Output(other,self,"DIA_Edda_TeachCookDone_shildkroetesoup_01_05");	//Конечно.
		AI_Print("Изучен рецепт готовки еды - 'Черепаший суп'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить черепаший суп. Для этого мне нужно кусок мяса черепахи и котел с водой.");
		Snd_Play("LevelUP");
		Edda_Soup_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_06");	//Извини. Но бесплатно я этого делать не стану.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_07");	//Сначала принеси золото.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};


func void DIA_Edda_TeachCookDone_pilzsuppe()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_pilzsuppe_01_00");	//Грибной суп.

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,100);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_01");	//Тут все просто. Тебе понадобится всего лишь один мясной гриб!
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_03");	//Бросаешь его в котел, варишь и буквально через пару минут твой суп будет готов.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_04");	//Вот собственно и все.
		AI_Print("Изучен рецепт готовки еды - 'Грибной суп'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить грибной суп. Для этого мне нужен один мясной гриб.");
		Snd_Play("LevelUP");
		Edda_Soup_03 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_05");	//Извини. Но бесплатно я этого делать не стану.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_06");	//Сначала принеси золото.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

instance DIA_Edda_Kochen_Compot(C_Info)
{
	npc = VLK_471_Edda;
	nr = 1;
	condition = DIA_Edda_Kochen_Compot_Condition;
	information = DIA_Edda_Kochen_Compot_Info;
	permanent = FALSE;
	description = "А кроме супов ты что-нибудь варишь?";
};

func int DIA_Edda_Kochen_Compot_Condition()
{
	if(EddaTeachCook == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Edda_Kochen_Compot_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_00");	//А кроме супов ты что-нибудь варишь?
	AI_Output(self,other,"DIA_Edda_Kochen_Compot_01_01");	//А что конкретно тебя интересует?
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_02");	//Ну, например, компоты или какие-нибудь нарезки.
	AI_Output(self,other,"DIA_Edda_Kochen_Compot_01_03");	//Нет, этого я делать не умею! Так что лучше поищи кого-нибудь другого.
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_04");	//Ясно.
};

instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "Ты можешь сварить для меня суп?";
};

func int DIA_Edda_Suppe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Kochen))
	{
		return TRUE;
	};
};

func void dia_edda_suppe_back()
{
	Info_ClearChoices(DIA_Edda_Suppe);
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//Ты можешь сварить для меня суп?

 	if(Wld_IsTime(8,0,13,0) || Wld_IsTime(15,0,20,0))
	{
		if(Wld_GetDay() == 0)
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//С завтрашнего дня ты можешь приходить и получать суп каждый день.
		}
		else if(Edda_Day != Wld_GetDay())
		{
			Info_ClearChoices(DIA_Edda_Suppe);
			Info_AddChoice(DIA_Edda_Suppe,Dialog_Back,dia_edda_suppe_back);
			Info_AddChoice(DIA_Edda_Suppe,"Рыбный суп (Требуется: 2 рыбы)",DIA_Edda_Suppe_Fish);

			if(MIS_EddaStatue == LOG_Success)
			{
				Info_AddChoice(DIA_Edda_Suppe,"Черепаший суп (Требуется: 2 куска мяса черепахи)",DIA_Edda_Suppe_Turtle);
				Info_AddChoice(DIA_Edda_Suppe,"Грибной суп (Требуется: 2 мясных гриба)",DIA_Edda_Suppe_Mushroom); 
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//Нет, не сегодня! Приходи завтра.
		};
	}
 	else if(Wld_IsTime(13,0,15,0))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_11");	//Сейчас уже ночь на дворе! Приходи завтра.
	};	
};

func void DIA_Edda_Suppe_Fish()
{
	if(B_GiveInvItems(other,self,ItFo_Fish,2))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//Нет ничего проще! Вот, держи тарелку.
		B_GiveInvItems(self,other,ItFo_FishSoup,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//Принеси мне рыбу, и я сварю тебе вкусную похлебку.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Edda_Suppe_Turtle()
{
	if(B_GiveInvItems(other,self,itfoschildkroeteraw,2))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Turtle_17_01");	//Нет ничего проще! Вот, держи тарелку.
		B_GiveInvItems(self,other,itfo_schildkroetesoup,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Turtle_17_04");	//Принеси мне два куска мяса черепахи, и я сварю тебе вкусную похлебку.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Edda_Suppe_Mushroom()
{
	if(B_GiveInvItems(other,self,ItPl_Mushroom_02,2))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Mushroom_17_01");	//Нет ничего проще! Вот, держи тарелку.
		B_GiveInvItems(self,other,itfo_pilzsuppe,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Mushroom_17_04");	//Принеси мне два мясных гриба, и я сварю тебе вкусную похлебку.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

instance DIA_Edda_Statue(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = "Посмотри, я принес статую Инноса для тебя.";
};

func int DIA_Edda_Statue_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Stadt) && (Npc_HasItems(other,ItMi_InnosStatue) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Edda_Statue_Info()
{
	B_GivePlayerXP(XP_Edda_Statue);
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//Посмотри, я принес статую Инноса для тебя.
	AI_Output(self,other,"DIA_Edda_Statue_17_01");	//Ох - огромное тебе спасибо. Да не оставит тебя свет Инноса...
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//Не стоит благодарностей.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	MIS_EddaStatue = LOG_Success;
	Log_SetTopicStatus(TOPIC_EddaStatue,LOG_Success);
	B_LogEntry(TOPIC_EddaStatue,"Я принес Эдде статуэтку Инноса.");
};

instance DIA_EDDA_UHA_SBORNAY(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_EDDA_UHA_SBORNAY_condition;
	information = DIA_EDDA_UHA_SBORNAY_info;
	permanent = FALSE;
	description = "Ты можешь сварить сборную уху?";
};

func int DIA_EDDA_UHA_SBORNAY_condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Hallo) && (MIS_FARIM_QUEST >= 1))
	{
		return TRUE;
	};
};

func void DIA_EDDA_UHA_SBORNAY_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_00");	//Ты можешь сварить сборную уху?
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_01");	//Конечно. Но у нее довольно сложный состав.
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_02");	//Если достанешь для меня все нужные ингредиенты - будет тебе сборная уха.
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_03");	//Что именно тебе нужно?
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_04");	//Хммм...(задумчиво) Запоминай! Для начала мне нужна рыба - думаю, десятка хватит.
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_05");	//Далее понадобится сыр, пять растений серафиса, красный перец и, самое главное - ром!
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_06");	//Ром?!
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_07");	//Да, только он! И никакого шнапса, если, конечно, ты хочешь, чтобы получилась уха, а не какая-нибудь бурда.
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_08");	//Ладно, я все понял.
	EddaCanMakeUhaSborka = TRUE;
	B_LogEntry(TOPIC_ADDON_FARIMFISH,"Эдда сможет сварить сборную уху для Фарима, но ей нужны ингредиенты. Десять кусков рыбы, сыр, красный перец, пять растений серафиса и бутылка рома.");
};


instance DIA_EDDA_UHA_SBORNAY_Done(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_EDDA_UHA_SBORNAY_Done_condition;
	information = DIA_EDDA_UHA_SBORNAY_Done_info;
	permanent = TRUE;
	description = "Я принес все, что ты просила.";
};

func int DIA_EDDA_UHA_SBORNAY_Done_condition()
{
	if((EddaCanMakeUhaSborka == TRUE) && (EddaCookFarim == FALSE) && (Npc_HasItems(other,ItFo_Addon_Pfeffer_01) >= 1) && (Npc_HasItems(other,ItFo_Fish) >= 10) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItPl_Blueplant) >= 5) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 1))
	{
		return TRUE;
	};
};

func void DIA_EDDA_UHA_SBORNAY_Done_info()
{
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_00");	//Я принес все, что ты просила. 
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_01");	//Теперь ты сваришь мне сборную уху?

 	if(Wld_IsTime(8,0,13,0) || Wld_IsTime(15,0,20,0))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_02");	//Конечно, как и обещала. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Addon_Pfeffer_01,1);
		Npc_RemoveInvItems(other,ItFo_Fish,10);
		Npc_RemoveInvItems(other,ItFo_Cheese,1);
		Npc_RemoveInvItems(other,ItPl_Blueplant,5);
		Npc_RemoveInvItems(other,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_03");	//Отлично! И ром тут, мой дорогой.
		B_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_04");	//Ну, вот...(довольно) Теперь точно получится настоящая сборная уха!
		AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_05");	//Эй! Ты же выпила всю бутылку рома!
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_06");	//А ты думал, что я его греть в руках буду?
		AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_07");	//Но как же уха? Ты же сказала, что он нужен для ее приготовления!
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_08");	//Ну да, все верно! И сейчас я его как раз использовала по назначению.
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_09");	//И кстати, пока ты тут трепался, твоя уха уже и сготовилась.
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_10");	//Вот, держи ее! Надеюсь, тебе понравится.
		B_GiveInvItems(self,other,itfo_schildkroetesoup_sborka,1);
		B_LogEntry(TOPIC_ADDON_FARIMFISH,"Эдда сварила мне сборную уху.");
		EddaCookFarim = TRUE;
	}
 	else if(Wld_IsTime(13,0,15,0))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_11");	//Сейчас уже ночь на дворе! Приходи завтра.
		AI_StopProcessInfos(self);
	};
};

instance DIA_EDDA_ASKFORDT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = dia_edda_askfordt_condition;
	information = dia_edda_askfordt_info;
	permanent = FALSE;
	description = "Ты не хотела бы поработать на меня?";
};

func int dia_edda_askfordt_condition()
{
	if((HURRAYICANHIRE == TRUE) && (MIS_EddaStatue == LOG_Success) && (EddaNeed == TRUE))
	{
		return TRUE;
	};
};

func void dia_edda_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Edda_AskforDT_15_00");	//Ты не хотела бы поработать на меня?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_01");	//Что ты имеешь ввиду?!
	AI_Output(other,self,"DIA_Edda_AskforDT_17_02");	//Мне нужен тот, кто смыслит в готовке. В моем лагере куча голодных парней, а приготовить им еду некому.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_03");	//Вот я и подумал, может быть ты смогла бы мне помочь в этом деле.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_04");	//Ты предлагаешь мне стать кухаркой в твоем лагере? Хммм... 
	AI_Output(self,other,"DIA_Edda_AskforDT_17_05");	//Хотя, почему бы и нет. В конце концов, жизнь в этой части города стала почти невыносимой. И я с радостью поменяла бы ее на что-нибудь другое.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_06");	//Значит ты согласна?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_07");	//Выходит, что так.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_08");	//Только я сразу предупреждаю, что если кто-то из твоих парней полезет ко мне со своими глупостями, то я за себя не отвечаю!
	AI_Output(other,self,"DIA_Edda_AskforDT_17_09");	//Об этом можешь не беспокоиться. У меня все там под контролем.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_10");	//Очень надеюсь на это! Так, где ты говоришь находится твой лагерь?
	AI_Output(other,self,"DIA_Edda_AskforDT_17_11");	//Неподалеку от фермы Онара, в старой башне. Ее трудно незаметить!
	AI_Output(self,other,"DIA_Edda_AskforDT_17_12");	//Хорошо, тогда я пожалуй пойду собирать свои вещи.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_13");	//Подожди! Давай хотя бы для начала обсудим твое жалованье.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_14");	//Мне ничего не надо, кроме крыши над головой и возможности заниматься тем, что мне нравится больше всего на свете. 
	AI_Output(other,self,"DIA_Edda_AskforDT_17_15");	//Это чем?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_16");	//Как чем?! Готовить разумеется.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_17");	//Эммм... Тогда позволь хотя бы проводить тебя до лагеря? Дорога туда довольно опасна.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_18");	//Не волнуйся за меня. Я сама справлюсь.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_19");	//Ну, раз так... Тогда увидимся в лагере. Паролем для входа туда является фраза "Драконовы сокровища". Запомнишь?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_20");	//Само собой. До встречи!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Эдда теперь будет заправлять кухней в моем лагере. Ее вкусные и наваристые похлебки наверняка придутся парням по душе!");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	EDDARECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_EDDA_INTOWER(C_Info)
{
	npc = VLK_471_Edda;
	nr = 22;
	condition = dia_edda_intower_condition;
	information = dia_edda_intower_info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int dia_edda_intower_condition()
{
	if((EDDARECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_edda_intower_info()
{
	AI_Output(other,self,"DIA_Edda_InTower_OrcKap_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Edda_InTower_OrcKap_01_01");	//Как видишь! Мне не на что жаловаться.
};

instance DIA_EDDA_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_471_Edda;
	nr = 22;
	condition = dia_edda_intower_orckap_condition;
	information = dia_edda_intower_orckap_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_edda_intower_orckap_condition()
{
	if((EDDARECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_edda_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Edda_InTower_OrcKap_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Edda_InTower_OrcKap_01_01");	//Да, и только благодаря тебе! Если бы не ты, не быть мне уже в живых...
};