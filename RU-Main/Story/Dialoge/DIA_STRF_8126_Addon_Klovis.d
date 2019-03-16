
instance DIA_STRF_8126_Addon_Klovis_EXIT(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 999;
	condition = DIA_STRF_8126_Addon_Klovis_EXIT_Condition;
	information = DIA_STRF_8126_Addon_Klovis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8126_Addon_Klovis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8126_Addon_Klovis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8126_Addon_Klovis_Hearing(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_Hearing_Condition;
	information = DIA_STRF_8126_Addon_Klovis_Hearing_Info;
	permanent = FALSE;
	description = "Не устал еще стучать кайлом?";
};

func int DIA_STRF_8126_Addon_Klovis_Hearing_Condition()
{
	return TRUE;
};

func void DIA_STRF_8126_Addon_Klovis_Hearing_Info()
{
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Hearing_15_00");	//Не устал еще стучать кайлом?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Hearing_04_01");	//А ты как думаешь? (посмеиваясь) Но иного выбора у меня нет.
};

instance DIA_STRF_8126_Addon_Klovis_Ore(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_Ore_Condition;
	information = DIA_STRF_8126_Addon_Klovis_Ore_Info;
	permanent = FALSE;
	description = "Может быть, тебе нужна помощь?";
};

func int DIA_STRF_8126_Addon_Klovis_Ore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8126_Addon_Klovis_Hearing) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8126_Addon_Klovis_Ore_Info()
{
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_00");	//Может быть, тебе нужна помощь?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_01");	//(ехидно) Помощь? По мне, так она тут всем нужна!
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_02");	//Но вот, скажем, если бы ты принес мне с полсотни кусков железный руды, то я бы мог немного передохнуть.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_03");	//А то вкалывать у жилы целыми днями, как ты сам понимаешь, работа не из легких.
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_04");	//Полсотни?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_05");	//Именно столько руды мы все должны относить Хильдуру в плавильню каждый день.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_06");	//Если принесешь меньше, то на следующий день должен будешь добыть эту норму и то, что не донес в последний. 
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_07");	//И так без продыха! Спасает только одно...
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_08");	//Орк, который пересчитывает руду, иногда может, скажем так, не заметить недостачу.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_09");	//Но только в том случае, если у тебя при себе имеются золотые самородки.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_10");	//И ты, безусловно, с ним поделишься ими.

	if(VakurShakNeedGold == TRUE)
	{
		AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_11");	//Дай угадаю: этого орка зовут случайно не Вакур Шак?
		AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_12");	//Он самый, приятель...(посмеиваясь) Вижу, что и тебе уже приходилось с ним сталкиваться.
	};

	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_13");	//Значит, тут и золото можно добывать?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_14");	//Нет. Просто тут в рудной породе подчас встречаются небольшие золотые прожилки.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_15");	//(серьезно) Но об этом никому, понял?! Это наш небольшой секрет.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_16");	//Ибо если Ар Дагар прознает про все это, то тогда нам точно придет конец.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_17");	//Но что-то мы с тобой заболтались... Ну так что, принесешь мне руду?
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_18");	//Я постараюсь.
	MIS_KlovisOre = LOG_Running;
	Log_CreateTopic(TOPIC_KlovisOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KlovisOre,LOG_Running);
	B_LogEntry(TOPIC_KlovisOre,"Кловис попросил достать ему полсотни рудных самородков. Это норма руды, которую рудокопы должны ежедневно сдавать оркам. Тогда он сможет немного передохнуть от работы.");
};

instance DIA_STRF_8126_Addon_Klovis_OreDone(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_OreDone_Condition;
	information = DIA_STRF_8126_Addon_Klovis_OreDone_Info;
	permanent = FALSE;
	description = "Вот твои полсотни кусков.";
};

func int DIA_STRF_8126_Addon_Klovis_OreDone_Condition()
{
	if((MIS_KlovisOre == LOG_Running) && (Npc_HasItems(other,ITMI_SNUGGET) >= 50))
	{
		return TRUE;
	};
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_Info()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_00");	//Вот твои полсотни кусков.
	B_GiveInvItems(other,self,ITMI_SNUGGET,50);
	Npc_RemoveInvItems(self,ITMI_SNUGGET,50);
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_01");	//Отлично, приятель. С такой кучей руды мне теперь не надо трястись за свою задницу!
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_02");	//По крайней мере, денек-другой можно будет расслабиться.

	if(HERO_HACKCHANCEORE < 100)
	{
		AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_03");	//Хоть бы спасибо сказал!
		AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_04");	//Лучше я покажу тебе, как правильно добывать руду. Поверь мне, в этом деле я мастер!
		AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_05");	//Я что, похож на рудокопа?
		AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_06");	//Нет...(озадаченно) Но вдруг пригодится? К тому же мне просто нечем больше тебя отблагодарить.
	};

	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_07");	//А как насчет золотых самородков?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_08");	//Хех...(ехидно) Каков хитрец! А ты далеко не прост, как кажешься на первый взгляд. 
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_09");	//Ладно! Если хочешь, то могу дать несколько штук.
	RT_Respect = RT_Respect + 1;
	MIS_KlovisOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_KlovisOre,LOG_Success);
	B_LogEntry(TOPIC_KlovisOre,"Я принес Кловису полсотни кусков руды.");
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);

	if(HERO_HACKCHANCEORE < 100)
	{
		Info_AddChoice(DIA_STRF_8126_Addon_Klovis_OreDone,"Научи меня добывать руду.",DIA_STRF_8126_Addon_Klovis_OreDone_W1);
	};

	Info_AddChoice(DIA_STRF_8126_Addon_Klovis_OreDone,"Я предпочитаю золото.",DIA_STRF_8126_Addon_Klovis_OreDone_W2);
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_W1()
{
	if(KNOWHOWPICKORE == FALSE)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,1);
		AI_Print(PRINT_LEARNPICKORE);
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 10;

		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};

		KNOWHOWPICKORE = TRUE;
		Npc_SetTalentValue(hero,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		Snd_Play("Levelup");

		if(ORE_TOPIC_EXIST == TRUE)
		{
			B_LogEntry(TOPIC_MAGICORE,"Теперь я умею добывать магическую руду из породы.");
		}
		else
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			B_LogEntry(TOPIC_MAGICORE,"Теперь я умею добывать магическую руду из породы.");
			ORE_TOPIC_EXIST = TRUE;
		};
	}
	else
	{
		AI_Print(PRINT_LEARNPICKORE);
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 10;

		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};
		if(HERO_HACKCHANCEORE >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,4);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,3);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,1);
		};

		Npc_SetTalentValue(hero,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		Snd_Play("Levelup");
	};

	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_00");	//Научи меня добывать руду.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_01");	//Хорошо, слушай внимательно. Главное, это правильно держать кирку.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_02");	//Берешься за ее древко двумя руками чуть ниже его центра.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_03");	//Это даст тебе возможность нанести более сильный удар по жиле!
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_04");	//А дальше продолжаешь наносить равномерные удары. Запомнил?
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_05");	//Да, запомнил.
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_W2()
{
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_W2_01_00");	//Я предпочитаю золото.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W2_01_01");	//Тогда вот - держи. Как уж говорится, чем богаты!
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,3);
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);
};