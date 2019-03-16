
instance DIA_Addon_Riordian_EXIT(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 999;
	condition = DIA_Addon_Riordian_EXIT_Condition;
	information = DIA_Addon_Riordian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_Hallo(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_Hallo_Condition;
	information = DIA_Addon_Riordian_Hallo_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Riordian_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//Я изучаю культуру древнего народа.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Судя по их записям, они жили здесь в далеком прошлом.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//Я точно не знаю, когда именно они возвели эти залы, но уже в то время их цивилизация была достаточно высокоразвитой.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//На другой стороне гор они построили свой город и, по-видимому, воздвигли храм Аданоса.
};


instance DIA_Addon_Riordian_Alter(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 6;
	condition = DIA_Addon_Riordian_Alter_Condition;
	information = DIA_Addon_Riordian_Alter_Info;
	description = "Как ты думаешь, сколько лет этому зданию?";
};


func int DIA_Addon_Riordian_Alter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_Alter_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//Как ты думаешь, сколько лет этому зданию?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//Не могу сказать точно. Несколько сотен.
};


instance DIA_Addon_Riordian_Atlantis(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 4;
	condition = DIA_Addon_Riordian_Atlantis_Condition;
	information = DIA_Addon_Riordian_Atlantis_Info;
	description = "Затерянный город на Хоринисе?";
};


func int DIA_Addon_Riordian_Atlantis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_Atlantis_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//Затерянный город на Хоринисе?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Да. До последнего времени мы были уверены, что знаем об острове все.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//Мы считали, что весь северо-восток острова - один большой горный массив.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//Но мы ошибались.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//За этими горами лежит долина. Там и располагается этот древний город.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(вздыхает) Я бы очень хотел взглянуть на его старинные здания, но они наверняка давно рассыпались в прах...
	B_LogEntry(TOPIC_Addon_KDW,"Маги воды считают, что за порталом находится древний затерянный город.");
};


instance DIA_Addon_Riordian_SaturasWantYou(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_SaturasWantYou_Condition;
	information = DIA_Addon_Riordian_SaturasWantYou_Info;
	description = "Сатурас хочет тебя видеть.";
};


func int DIA_Addon_Riordian_SaturasWantYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && (MIS_Addon_Saturas_BringRiordian2Me == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_SaturasWantYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Сатурас хочет тебя видеть.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Ему удалось добиться прогресса в исследованиях? В таком случае я отправляюсь к нему немедленно.
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//Если ты хочешь узнать об этих строениях больше, поговори с Нефариусом.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//Ты найдешь его в дальней части залов.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Сатурас");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Riordian_PermNews;

instance DIA_Addon_Riordian_Perm(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 99;
	condition = DIA_Addon_Riordian_Perm_Condition;
	information = DIA_Addon_Riordian_Perm_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новое?";
};


func int DIA_Addon_Riordian_Perm_Condition()
{
	if(MIS_Addon_Saturas_BringRiordian2Me == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//Есть что-нибудь новое?
	if(Riordian_PermNews == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//Да! Я нашел подтверждение, что эта древняя цивилизация действительно поклонялась Аданосу!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Нет, пока нет. Приходи позже.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 1;
	condition = dia_addon_riordian_prayforgomez_condition;
	information = dia_addon_riordian_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_riordian_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Riordian_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Riordian_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_RIORDIAN_TEACHPRE(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = "Ватрас дал мне этот амулет ищущего огонька...";
};

func int dia_addon_riordian_teachpre_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Ватрас дал мне этот амулет ищущего огонька...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ага! (заинтересованно) Это редкий артефакт... Ты знаешь, что ты можешь обучать своего огонька?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Ты можешь научить меня этому?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Да, конечно. Я долгое время занимался этой областью магии.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};

instance DIA_ADDON_RIORDIAN_TEACH(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 90;
	condition = dia_addon_riordian_teach_condition;
	information = dia_addon_riordian_teach_info;
	permanent = TRUE;
	description = "(обучение ищущего огонька)";
};

var int dia_addon_riordian_teach_noperm;

func int dia_addon_riordian_teach_condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teach_info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if((player_talent_wispdetector[WISPSKILL_NF] == FALSE) || (player_talent_wispdetector[WISPSKILL_FF] == FALSE) || (player_talent_wispdetector[WISPSKILL_NONE] == FALSE) || (player_talent_wispdetector[WISPSKILL_RUNE] == FALSE) || (player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE) || (player_talent_wispdetector[WISPSKILL_FOOD] == FALSE) || (player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_teach);
		Info_AddChoice(dia_addon_riordian_teach,Dialog_Back,dia_addon_riordian_teach_back);
		B_DIA_Addon_Riordian_Teach_10_01();

		if(player_talent_wispdetector[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Поиск оружие дальнего боя, стрел и болтов (Требуется: 10 кусков магической руды)",dia_addon_riordian_teach_wispskill_ff);
		};
		if(player_talent_wispdetector[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Поиск золота и различной утвари (Требуется: 20 кусков магической руды)",dia_addon_riordian_teach_wispskill_none);
		};
		if(player_talent_wispdetector[WISPSKILL_RUNE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Поиск магических свитков (Требуется: 30 кусков магической руды)",dia_addon_riordian_teach_wispskill_rune);
		};
		if(player_talent_wispdetector[WISPSKILL_FOOD] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Поиск еды и растений (Требуется: 50 кусков магической руды)",dia_addon_riordian_teach_wispskill_food);
		};
		if(player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Поиск магических колец и амулетов (Требуется: 75 кусков магической руды)",dia_addon_riordian_teach_wispskill_magic);
		};
		if(player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Поиск магических зелий (Требуется: 100 кусков магической руды)",dia_addon_riordian_teach_wispskill_potions);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_ADDON_RIORDIAN_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_teach_wispskill_x()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void dia_addon_riordian_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF,10))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE,20))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE,30))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC,75))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD,50))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS,100))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};