
instance DIA_Neoras_Kap1_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Neoras_NoEnter_PissOff(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = DIA_Neoras_NoEnter_PissOff_Condition;
	information = DIA_Neoras_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Neoras_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Neoras_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Neoras_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

var int NeorasFT;

instance DIA_Neoras_Hallo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Neoras_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 6) && (NeorasFT == FALSE))
	{
		NeorasFT = TRUE;
		return TRUE;
	};
};

func void DIA_Neoras_Hallo_Info()
{
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Что... что-то случилось? Зачем ты беспокоишь меня, разве ты не видишь, я провожу очень сложный эксперимент?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Я не хотел побеспокоить тебя.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Ты уже побеспокоил...(вздыхает) Ладно, говори, чего ты хочешь?
};

instance DIA_Neoras_Arbeit(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};

func int DIA_Neoras_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Да, мне нужны травы для моих экспериментов. Мы сами выращиваем их, но у нас совсем закончилась огненная крапива.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Семи цветков будет достаточно. Принеси мне их - ох, да, еще - я потерял рецепт магических зелий.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Если ты найдешь его, я буду очень благодарен.
	MIS_NeorasPflanzen = LOG_Running;
	MIS_NeorasRezept = LOG_Running;
	Log_CreateTopic(Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen,LOG_Running);
	B_LogEntry(Topic_NeorasPflanzen,"Я должен принести семь кустов огненной крапивы мастеру Неорасу, алхимику.");
	Log_CreateTopic(Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept,LOG_Running);
	B_LogEntry(Topic_Neorasrezept,"Мастер Неорас потерял рецепт изготовления магического напитка.");
	if(Npc_KnowsInfo(other,DIA_Opolos_beibringen))
	{
		B_LogEntry(Topic_Neorasrezept,"Это определенно рецепт, который хочет видеть Ополос.");
	};
};


instance DIA_Neoras_Rezept(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 6;
	condition = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent = TRUE;
	description = "Насчет рецепта...";
};


func int DIA_Neoras_Rezept_Condition()
{
	if(MIS_NeorasRezept == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Rezept_Info()
{
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Насчет рецепта...
	if(B_GiveInvItems(other,self,ItWr_ManaRezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Я нашел его.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Хорошо. Я боялся, что он потерян для меня навсегда.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Вот, возьми в знак моей благодарности это магическое зелье.
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Я еще не нашел его.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//Ну, я все же надеюсь, что тебе удастся его найти.
	};
};


instance DIA_Neoras_Flieder(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 7;
	condition = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent = TRUE;
	description = "Я принес тебе огненную крапиву.";
};


func int DIA_Neoras_Flieder_Condition()
{
	if(MIS_NeorasPflanzen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Flieder_Info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Я принес тебе огненную крапиву.
	if(B_GiveInvItems(other,self,ItPl_Mana_Herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Превосходно, теперь я могу работать. Возьми этот свиток с заклинанием 'Кулак Ветра', надеюсь, он тебе пригодится.
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self,other,ItSc_Windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Ох, действительно? Но ты принес недостаточно. Мне нужно СЕМЬ экземпляров.
	};
};


instance DIA_Neoras_TEACH(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_TEACH_Condition;
	information = DIA_Neoras_TEACH_Info;
	permanent = TRUE;
	description = "Могу я чему-нибудь научиться у тебя?";
};


func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Могу я чему-нибудь научиться у тебя?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Я могу обучить тебя секретам алхимии.
		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH,Dialog_Back,DIA_Neoras_TEACH_BACK);
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Neoras_TEACH_Health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Neoras_TEACH_Health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Neoras_TEACH_Perm_Health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Neoras_TEACH_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Neoras_TEACH_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Neoras_TEACH_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Я не обучаю новичков. Если, однажды, ты будешь принят в Круг Огня...
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//...тогда я покажу тебе, как создавать сильные зелья.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Я передаю свои знания только членам нашей церкви.
	};
};

func void DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Neoras_TEACH);
};

func void DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Neoras_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Neoras_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Neoras_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Neoras_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};


instance DIA_Neoras_Kap2_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap2_EXIT_Condition;
	information = DIA_Neoras_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_Kap3_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap3_EXIT_Condition;
	information = DIA_Neoras_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_BrewPotion(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent = TRUE;
	description = "Не мог бы ты сварить мне зелье?";
};


func int DIA_Neoras_BrewPotion_Condition()
{
	if(NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewPotion_Info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Не мог бы ты сварить мне зелье?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Для новичка ты слишком нетерпелив. Иди, занимайся своими обязанностями.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Ты можешь купить все, что тебе нужно, у Горакса.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Ты сомневаешься в моих способностях? Я могу сварить любое зелье.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Отлично!
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Не так быстро. Сначала ты должен принести мне необходимые ингредиенты и внести скромную плату за мои труды. А также за материалы.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Сколько ты хочешь?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//За само приготовление я беру десять золотых монет.
		NeorasBrewsForYou = TRUE;
	};
};


var int neoras_orcpotiononetime;

instance DIA_NEORAS_ORCPOTION(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = dia_neoras_orcpotion_condition;
	information = dia_neoras_orcpotion_info;
	permanent = TRUE;
	description = "У меня тут есть орочье зелье.";
};


func int dia_neoras_orcpotion_condition()
{
	if(Npc_HasItems(other,itpo_xorcpotion) > 0)
	{
		return TRUE;
	};
};

func void dia_neoras_orcpotion_back()
{
	AI_StopProcessInfos(self);
};

func void dia_neoras_orcpotion_create()
{
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	B_GiveInvItems(self,other,itpo_xorcpotion02,1);
	AI_Output(self,other,"DIA_Neoras_OrcPotion_01_17");	//Вот, уже готово.
	AI_StopProcessInfos(self);
};

func void dia_neoras_orcpotion_pay()
{
	AI_Output(other,self,"DIA_Neoras_OrcPotion_15_15");	//Сделай мне зелье.
	Info_ClearChoices(dia_neoras_orcpotion);
	if(Npc_HasItems(hero,ItMi_Gold) >= 300)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,300);
		dia_neoras_orcpotion_create();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_16");	//К сожалению, ты не запасся золотом.
	};
};

func void dia_neoras_orcpotion_info()
{
	AI_Output(other,self,"DIA_Neoras_OrcPotion_15_00");	//У меня тут есть орочье зелье.
	if(NEORAS_ORCPOTIONONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Neoras_OrcPotion_15_01");	//С ним можно что-нибудь сделать?
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_02");	//Хм, интересно. Я встречал такое раньше.
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_03");	//В него можно добавить одной природной соли и оно станет безвредным.
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_04");	//И добавит выпившему орочьей силы и ловкости.
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_05");	//Но, к сожалению, ослабит его магическую силу. И этот эффект никак нельзя устранить.
		AI_Output(other,self,"DIA_Neoras_OrcPotion_15_06");	//Ты можешь сделать это?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_07");	//Могу. Но будь острожен - тебе придется восполнять потери в своих способностях мага.
		}
		else
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_08");	//Конечно, только нужная соль - привозная, и стоит дорого. Особенно, сейчас.
			AI_Output(other,self,"DIA_Neoras_OrcPotion_15_09");	//Сколько?
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_10");	//Триста золотых.
		};
		NEORAS_ORCPOTIONONETIME = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_OrcPotion_15_11");	//Можешь добавить в него то, что нужно?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_12");	//Конечно, брат.
		}
		else
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_13");	//Конечно. Но, думаю, ты помнишь цену?
		};
	};
	if(hero.guild == GIL_KDF)
	{
		Info_ClearChoices(dia_neoras_orcpotion);
		Info_AddChoice(dia_neoras_orcpotion,Dialog_Back,dia_neoras_orcpotion_back);
		Info_AddChoice(dia_neoras_orcpotion,"Сделай мне зелье.",dia_neoras_orcpotion_create);
	}
	else
	{
		Info_ClearChoices(dia_neoras_orcpotion);
		Info_AddChoice(dia_neoras_orcpotion,Dialog_Back,dia_neoras_orcpotion_back);
		Info_AddChoice(dia_neoras_orcpotion,"Сделай мне зелье. (Цена: 300 золотых монет).",dia_neoras_orcpotion_pay);
	};
};


instance DIA_Neoras_BrewForMe(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent = TRUE;
	description = "Приготовь мне...";
};


func int DIA_Neoras_BrewForMe_Condition()
{
	if(NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"...напиток ускорения.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"...экстракт маны.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"...лечебный экстракт.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Свари мне зелье скорости.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Да. Вот, держи.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//Хорошо, спасибо. Сейчас я дам тебе зелье - тебе не придется ждать долго.
		B_GiveInvItems(self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне напиток ускорения. ",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне экстракт маны.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне лечебный экстракт.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Свари мне эликсир маны.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Хорошо. У тебя есть необходимые ингредиенты и золото?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Blueplant) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Да. Вот, держи.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Blueplant,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//Хорошо. Сейчас я дам тебе зелье - тебе не придется ждать долго.
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне напиток ускорения. ",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне экстракт маны.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне лечебный экстракт.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Свари мне лечебный эликсир.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Хорошо. У тебя есть необходимые ингредиенты и золото?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Blueplant) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Да. Вот, держи.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Blueplant,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//Хорошо, уже даю, тебе не придется долго ждать.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//Хорошо. Сейчас я дам тебе зелье - тебе не придется ждать долго.
	};
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне напиток ускорения. ",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне экстракт маны.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Приготовь мне лечебный экстракт.",DIA_Neoras_BrewForMe_Health);
};


instance DIA_Neoras_Kap4_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap4_EXIT_Condition;
	information = DIA_Neoras_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_DRACHENEIER(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 40;
	condition = DIA_Neoras_DRACHENEIER_Condition;
	information = DIA_Neoras_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Ты так усердно работаешь, что даже вспотел.";
};


func int DIA_Neoras_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_Neoras_DragonEgg == 0))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Ты так усердно работаешь, что даже вспотел.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//Да, я полностью истощен. Уже несколько дней я пытаюсь приготовить это чертово зелье. И ничего не получается.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Это не мои проблемы.",DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"А что это должно быть за зелье?",DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"В чем проблема?",DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//А в чем проблема?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//В рецепте говорится что-то о яйце дракона. Конечно же, у меня его нет.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Поэтому я пытался заменить этот ингредиент. Однако пока все тщетно.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Если однажды, в какой-нибудь пещере, ты наткнешься на одну из таких штук, пожалуйста, не забудь обо мне.
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"А что ты используешь вместо драконьего яйца?",DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Я попробую.",DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Я попробую что-рибудь сделать.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Эй. Я просто пошутил. Я не верю, что тебе действительно удастся найти яйцо дракона.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Давай лучше подождем.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Log_CreateTopic(TOPIC_DRACHENEIERNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras,LOG_Running);
	B_LogEntry(TOPIC_DRACHENEIERNeoras,"Неорасу для экспериментов нужно драконье яйцо. Он думает, что, возможно, я смогу найти его в какой-нибудь пещере.");
	MIS_Neoras_DragonEgg = LOG_Running;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//А что ты используешь вместо драконьего яйца?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Поверь мне, тебе лучше не знать.
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//А что это должно быть за зелье?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Я купил этот рецепт у странствующего торговца. В нем говорится о довольно странных, но очень интересных вещах.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Я не уверен, делает ли это зелье вообще что-нибудь, но жажда знаний заставляет меня продолжать этот эксперимент.
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//Меня эта проблема не касается.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//Тогда, пожалуйста, не беспокой меня больше.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};


instance DIA_Neoras_FOUNDDRAGONEGG(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information = DIA_Neoras_FOUNDDRAGONEGG_Info;
	description = "Вот, я нашел для тебя яйцо дракона.";
};


func int DIA_Neoras_FOUNDDRAGONEGG_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (MIS_Neoras_DragonEgg == LOG_Running))
	{
		return TRUE;
	};
};


var int Neoras_DragonEggDrink_Day;

func void DIA_Neoras_FOUNDDRAGONEGG_Info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Вот, я нашел для тебя яйцо дракона.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Ты издеваешься надо мной.
	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Оно настоящее! Я даже не думал, что это возможно. Где ты нашел его?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Тебе этого лучше не знать.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Превосходно. Что ты хочешь за него?
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Даже не знаю.",DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Как насчет нескольких лечебных зелий?",DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Дай мне немного этого зелья, когда оно будет готово.",DIA_Neoras_FOUNDDRAGONEGG_trank);
};


var int Neoras_SCWantsDragonEggDrink;

func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Дай мне немного этого зелья, когда оно будет готово.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//Хорошо. Но, как я уже сказал, я понятия не имею, как оно действует.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Зайди попозже, когда я закончу его.
	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Как насчет нескольких лечебных зелий?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Хороший выбор. Вот, держи. Надеюсь, они тебе пригодятся.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Даже не знаю.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Ммм. Хорошо. Тогда возьми это магическое кольцо. Я уверен, оно поможет тебе в сражении с твоими врагами.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//Оно защитит тебя от атак магических созданий.
	CreateInvItems(self,ItRi_Prot_Mage_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_02,1);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};


instance DIA_Neoras_DRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_DRAGONEGGDRINK_Condition;
	information = DIA_Neoras_DRAGONEGGDRINK_Info;
	description = "Я пришел получить это загадочное зелье из яйца дракона.";
};


func int DIA_Neoras_DRAGONEGGDRINK_Condition()
{
	if((Neoras_DragonEggDrink_Day <= (Wld_GetDay() - 2)) && (Neoras_SCWantsDragonEggDrink == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Я пришел получить это загадочное зелье из яйца дракона.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Да. Я только что закончил его. Я еще не испытывал его и не несу никакой ответственности за его действие. Ты слышишь?
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Давай его сюда.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Хорошо. Надеюсь, это пойло не заставит твою голову взорваться.
	CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
	B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
};


instance DIA_Neoras_USEDDRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information = DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description = "Я попробовал твое зелье из яйца дракона. Отличная штука!";
};


func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition()
{
	if(Neoras_SCUsedDragonEggDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Я попробовал твое зелье из яйца дракона. Отличная штука!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Ммм. Очень интересно. Я должен продолжить свои исследования.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Ты не мог бы сделать мне еще?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Будет лучше, если мы повторим это через несколько недель. Иначе, боюсь, у тебя могут вырасти рога.
};


instance DIA_Neoras_Kap5_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap5_EXIT_Condition;
	information = DIA_Neoras_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_PICKPOCKET(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 900;
	condition = DIA_Neoras_PICKPOCKET_Condition;
	information = DIA_Neoras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Neoras_PICKPOCKET_Condition()
{
	return C_Beklauen(72,140);
};

func void DIA_Neoras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,Dialog_Back,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void b_endneorasreceptfortyon()
{
	KNOWABOUTRECEPTFORTYON = TRUE;
	Info_ClearChoices(dia_neoras_receptfortyon);
	AI_StopProcessInfos(self);
};

instance DIA_NEORAS_RECEPTFORTYON(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptfortyon_condition;
	information = dia_neoras_receptfortyon_info;
	permanent = FALSE;
	description = "(спросить про рецепт зелья)";
};

func int dia_neoras_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_neoras_receptfortyon_info()
{
	if(KNOWABOUTRECEPTFORTYON == FALSE)
	{
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_00");	//Я слышал, что существует зелье, способное воздействовать некоторым образом на сознание человека.
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_03");	//Ты слышал когда-нибудь о таком?
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_01_04");	//Хммм...(с недоверием) А почему тебя это интересует?
		Info_ClearChoices(dia_neoras_receptfortyon);
		Info_AddChoice(dia_neoras_receptfortyon,"Мне очень нужен этот рецепт!",dia_neoras_receptfortyon_wants);
		Info_AddChoice(dia_neoras_receptfortyon,"Мне бы хотелось узнать больше об этом эликсире.",dia_neoras_receptfortyon_alchimik);
		Info_AddChoice(dia_neoras_receptfortyon,"Просто так спросил.",dia_neoras_receptfortyon_interest);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_07");	//Я слышал, что существует зелье, способное воздействовать некоторым образом на сознание человека.
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_08");	//Я также слышал, что именно вы - маги Огня - возможно, располагаете знаниями об этом эликсире.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_01_11");	//(с недоверием) А почему тебя это интересует?
		Info_ClearChoices(dia_neoras_receptfortyon);
		Info_AddChoice(dia_neoras_receptfortyon,"Мне очень нужен этот рецепт!",dia_neoras_receptfortyon_wants);
		Info_AddChoice(dia_neoras_receptfortyon,"Мне бы хотелось узнать больше о свойствах этого эликсира.",dia_neoras_receptfortyon_alchimik);
		Info_AddChoice(dia_neoras_receptfortyon,"Просто так спросил.",dia_neoras_receptfortyon_interest);
	};
};

func void dia_neoras_receptfortyon_wants()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Wants_01_00");	//Мне очень нужен этот рецепт!

	if(KNOWABOUTRECEPTFORTYON == TRUE)
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_02");	//Даже если бы маги Огня и располагали такого рода знаниями, неужели ты думаешь, что они доверили бы этот секрет такому оборванцу, как ты?
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_03");	//Столь ценные познания доступны лишь избранным, и я не думаю, что ты относишься к этой категории.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_05");	//Не трать свое время в тщетной попытке овладеть тем, что тебе не под силу.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_06");	//А теперь закончим этот разговор. Мои исследования не оставляют мне много времени на болтовню.
		b_endneorasreceptfortyon();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_07");	//Я даже понятия не имею, где тебе раздобыть этот рецепт.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_08");	//Возможно, в городе ты сможешь узнать больше об этом.
		b_endneorasreceptfortyon();
	};
};

func void dia_neoras_receptfortyon_alchimik()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_00");	//Мне бы хотелось узнать больше о свойствах этого эликсира.

	if(Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0)
	{
		if(KNOWABOUTRECEPTFORTYON == TRUE)
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_01");	//Так ты - искатель знаний!
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_02");	//Но боюсь, я ничем не смогу тебе помочь в этом вопросе.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_03");	//Почему?
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_04");	//Эти знания я смогу передать лишь члену нашего ордена. А ты пока таковым не являешься.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_05");	//Если вдруг эта тайна попадет не в те руки, то последствия могут быть просто катастрофическими.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_06");	//Поэтому вы, маги Огня, храните рецепт приготовления этого зелья в строжайшем секрете.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_07");	//Да. Но даже не пытайся добраться до него. Он хранится в таком месте, куда тебе никогда не попасть.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_08");	//Это сокровище принадлежит только избранным Инноса! И только им разрешается использовать его по назначению.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_10");	//А теперь закончим этот разговор. Мои исследования не оставляют мне много времени на болтовню.
			B_LogEntry(TOPIC_RECEPTFORTYON,"Неорас признался, что этот рецепт храниться здесь, у магов Огня в монастыре. Теперь только осталось найти то место, где они его прячут.");
			B_LogEntry_Quiet(TOPIC_RECEPTFORTYON,"Неорас также отметил, что он откроет тайну эликсира трансформации сознания только Магу Огня.");
			b_endneorasreceptfortyon();
		}
		else
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_11");	//Так ты искатель знаний! Что ж, я готов поделиться тем, что знаю сам.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_12");	//Я слышал об этом эликсире, и он действительно обладает рядом поистине необычных алхимических свойств.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_13");	//Воздействие на сознание - лишь одно из них. При этом каждое из этих свойств способно время от времени меняться непредсказуемым образом.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_14");	//Также еще надо отметить, что приготовление этого зелья - процесс достаточно сложный, и справиться с этим сможет только очень опытный алхимик.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_15");	//Ко всему прочему, его состав включает в себя очень редкие ингредиенты.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_16");	//А у тебя есть этот состав?
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_17");	//Нет...(смеется) Я только слышал про этот эликсир, но не обладаю его секретом.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_18");	//А кто может знать, как приготовить это зелье?
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_19");	//Понятия не имею. В городе полно алхимиков - возможно, кто-нибудь сможет рассказать тебе об этом больше.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_20");	//А теперь закончим этот разговор. Мои исследования не оставляют мне много времени на разного рода болтовню.
			b_endneorasreceptfortyon();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_22");	//Скажи, как эти знания могут помочь тебе, если ты даже в приготовлении зелий толком не разбираешься?
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_24");	//Ты попусту тратишь мое время!
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_25");	//На этом закончим наш разговор. Мои исследования не оставляют мне много времени на болтовню.
		b_endneorasreceptfortyon();
	};
};

func void dia_neoras_receptfortyon_interest()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Interest_01_00");	//Я просто спросил.
	AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Interest_01_01");	//Тогда я понятия не имею, о чем ты говоришь.
	AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Interest_01_02");	//И закончим на этом наш разговор. Мои исследования не оставляют мне много времени на пустую болтовню.
	b_endneorasreceptfortyon();
};

instance DIA_NEORAS_RECEPTFORKDF(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptforkdf_condition;
	information = dia_neoras_receptforkdf_info;
	permanent = FALSE;
	description = "Открой мне тайну эликсира трансформации сознания.";
};

func int dia_neoras_receptforkdf_condition()
{
	if((other.guild == GIL_KDF) && (NEORASCANTEACHRECEPTFORKDF == TRUE))
	{
		return TRUE;
	};
};

func void dia_neoras_receptforkdf_info()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForKDF_01_00");	//Открой мне тайну эликсира трансформации сознания.
	AI_Output(other,self,"DIA_Neoras_ReceptForKDF_01_01");	//Теперь, когда я стал магом Огня, ты бы мог это сделать?
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_02");	//Поскольку ты теперь один из избранных Инноса, я могу передать тебе эти тайные знания.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_03");	//Зелье, которое ты называешь эликсиром трансформации сознания, проще зовется напитком Амун-Су.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_04");	//В древности так звали создателя этого божественного раствора - могущественного мага Света, чье имя уже вряд ли кто-то помнит.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_05");	//Хочу сразу предупредить тебя, что приготовление этого зелья - процесс достаточно сложный, и справиться с этим сможет только очень опытный алхимик.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_06");	//От тебя потребуется куда более глубокие познания в алхимии, нежели знание основ.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_07");	//Это нелегкая задача, но также это одно из условий постижения тайны эликсира трансформации сознания.

	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_0A");	//Ты многое знаешь в области алхимии...

		if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_SUPERMANA))
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_08");	//И, как я вижу, ты вполне готов постичь ее.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_09");	//Хорошо. Слушай внимательно и запоминай.
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_MONASTERY_ALCHEMY_01");
			AI_AlignToWP(self);
			AI_UseMob(self,"LAB",5);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_10");	//Прежде всего, тебе требуется подготовить все необходимые компоненты для этого зелья.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_11");	//Для приготовления этого эликсира их потребуется очень много, поэтому надо быть внимательным и не упустить ни один из них.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_12");	//Далее на алхимическом столе последовательно добавляешь каждый из этих компонентов в нужной пропорции к солевому раствору.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_13");	//И здесь самое главное не ошибиться. Необходимо соблюсти правильную последовательность добавления.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_14");	//После доводишь полученный раствор до получения однородной массы и нагреваешь его до стадии кипения...
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_15");	//Видишь, как я это делаю? Еще немного, и...
			AI_UseMob(self,"LAB",-1);
			B_TurnToNpc(self,other);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_16");	//Вот и все! Божественный эликсир Амун-Су готов.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_17");	//Теперь ты можешь попробовать сделать это сам.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_18");	//Да, и еще. Суть эликсира такова, что все его магические свойства раскрываются в полной мере только при первом употреблении.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_19");	//Последующее применение этого напитка будет иметь эффект намного слабее, чем предыдущее. Помни об этом.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_21");	//И, насколько я могу судить, тебе еще не хватает опыта для ее постижения.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_22");	//Ты еще не обладаешь некоторыми знаниями в деле алхимика, которые являются основополагающими моментами в изучении приготовления этого зелья.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_23");	//Постигни их - тогда ты сможешь прикоснуться и к этой тайне.
	};
};


instance DIA_NEORAS_RECEPTFORKDFAGAIN(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptforkdfagain_condition;
	information = dia_neoras_receptforkdfagain_info;
	permanent = TRUE;
	description = "Открой мне тайну напитка Амун-Су.";
};

func int dia_neoras_receptforkdfagain_condition()
{
	if((other.guild == GIL_KDF) && (NEORASCANTEACHRECEPTFORKDF == TRUE) && Npc_KnowsInfo(hero,dia_neoras_receptforkdf) && (PLAYER_TALENT_ALCHEMY[16] == FALSE))
	{
		return TRUE;
	};
};

func void dia_neoras_receptforkdfagain_info()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForKDFAgain_01_00");	//Открой мне тайну напитка Амун-Су.

	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_0A");	//Ты многое знаешь в области алхимии...

		if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_SUPERMANA))
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_01");	//Я вижу, ты вполне готов постичь эту тайну!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_02");	//Хорошо. Слушай внимательно и запоминай.
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_MONASTERY_ALCHEMY_01");
			AI_AlignToWP(self);
			AI_UseMob(self,"LAB",5);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_03");	//Прежде всего, тебе требуется подготовить все необходимые компоненты для этого зелья.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_04");	//Для приготовления этого эликсира их потребуется очень много, поэтому надо быть внимательным и не упустить ни один из них.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_05");	//Далее на алхимическом столе добавляешь последовательно каждый из этих компонентов в нужной пропорции к солевому раствору.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_06");	//И здесь самое главное не ошибиться. Необходимо соблюсти правильную последовательность добавления.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_07");	//После доводишь полученный раствор до получения однородной массы и нагреваешь его до стадии кипения...
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_08");	//Видишь, как я это делаю? Еще немного, и...
			AI_UseMob(self,"LAB",-1);
			B_TurnToNpc(self,other);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_09");	//Вот и все! Божественный эликсир Амун-Су готов.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_10");	//Теперь ты можешь попробовать сделать это сам.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_11");	//Да, и еще. Суть эликсира такова, что все его магические свойства раскрываются в полной мере только при первом употреблении.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_12");	//Последующее применение этого напитка будет иметь эффект намного слабее, чем предыдущее. Помни об этом.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_14");	//Тебе все еще не хватает опыта для постижения этой тайны.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_15");	//Ты еще не обладаешь некоторыми знаниями в деле алхимика, которые являются основополагающими моментами в изучении приготовления этого зелья.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_16");	//Постигни их - тогда ты сможешь прикоснуться и к ней.
	};
};

instance DIA_NEORAS_KAP6_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = dia_neoras_kap6_exit_condition;
	information = dia_neoras_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_neoras_kap6_exit_condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void dia_neoras_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = dia_neoras_runemagicnotwork_condition;
	information = dia_neoras_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_neoras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_neoras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Neoras_RuneMagicNotWork_01_00");	//Твои магические руны еще действуют?
	AI_Output(self,other,"DIA_Neoras_RuneMagicNotWork_01_01");	//В том-то и дело, что нет! И я никак не пойму причину, по которой не могу их использовать.
	AI_Output(other,self,"DIA_Neoras_RuneMagicNotWork_01_02");	//А что насчет остальных?
	AI_Output(self,other,"DIA_Neoras_RuneMagicNotWork_01_03");	//По всей видимости, это коснулось нас всех! У других магов Огня тоже ничего не получается сделать.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_NEORAS_TRADE(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = dia_neoras_trade_condition;
	information = dia_neoras_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои товары";
};

func int dia_neoras_trade_condition()
{
	if((hero.guild == GIL_KDF) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void dia_neoras_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_NEORAS_TRADE_01_01");	//Покажи свои товары
	B_GiveTradeInv(self);
};


instance DIA_neoras_LOKIPOTION(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_neoras_LOKIPOTION_Condition;
	information = DIA_neoras_LOKIPOTION_Info;
	permanent = FALSE;
	description = "Это ты недавно купил у торговца Зуриса редкое растение?";
};


func int DIA_neoras_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (FindCactus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_neoras_LOKIPOTION_Info()
{
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_00");	//Это ты недавно купил у торговца Зуриса одно редкое растение?
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_01");	//(замялся) Я часто покупаю у него различного рода ингредиенты для своих экспериментов.
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_02");	//Я имею в виду цветок кактуса.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_03");	//Ах, ты про это. Да, это была большая удача, что у него оказался один экземпляр этого чудесного цветка.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_04");	//Видишь ли, я работаю над одним магическим эликсиром, который позволит выработать некоторый иммунитет к огню.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_05");	//И, по моим расчетам, мне срочно понадобился природный экстракт из цветка этого растения.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_06");	//А почему ты, собственно, этим интересуешься?
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_07");	//Мне тоже очень нужно это растение. Но твой экземпляр, похоже, единственный на всем острове.
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_08");	//Может, продашь мне его?
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_09");	//Забудь об этом! Деньги меня мало интересуют.

	if(hero.guild == GIL_PAL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_10");	//Тогда скажи, что может заставить тебя отдать его мне?
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_11");	//Или, быть может, мне следует воспользоваться своим статусом паладина...
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_12");	//...и потребовать его на благо дел во имя Инноса?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_13");	//Ладно, ладно...(растерянно) И право, этого делать не стоит.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_14");	//Хорошо, я отдам тебе его просто так.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_15");	//Вот, возьми. Надеюсь, ты действительно используешь это растение на благие дела.
		B_GiveInvItems(self,other,ItPl_CactusFlower,1);
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_16");	//Можешь в этом не сомневаться.
		B_LogEntry(TOPIC_PrioratStart,"Использовав свой статус паладина, я заставил мага Неораса отдать нужное мне растение. Пора возвращаться к идолу Тиону.");
	}
	else if(hero.guild == GIL_KDF)
	{
		B_GivePlayerXP(750);
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_17");	//Тогда скажи, что может заставить тебя отдать его мне?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_18");	//Не думаю, что это возможно. Даже несмотря на то, что ты принадлежишь к нашему ордену.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_19");	//Послушай, я прошу его не просто так.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_20");	//Поверь мне, твой эликсир сейчас не столь важен по сравнению с тем, какую пользу сможет принести это растение, если ты отдашь его мне.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_21");	//Подумай хорошенько над моими словами.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_22");	//В противном случае я буду вынужден обратиться за помощью к Пирокару и другим высшим магам Огня.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_23");	//Хммм...(задумчиво) Ну хорошо, хорошо... Я отдам его тебе... Просто так.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_24");	//Вот, держи. Надеюсь, в дальнейшем я не пожалею о том, что сейчас сделал.
		B_GiveInvItems(self,other,ItPl_CactusFlower,1);
		B_LogEntry(TOPIC_PrioratStart,"Использовав свой статус мага Огня, я убедил мага Неораса отдать нужное мне растение. Пора возвращаться к идолу Тиону...");
	}
	else
	{
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_26");	//Но, может быть, есть что-то еще, что заинтересовало бы тебя больше, чем твой эликсир?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_27");	//Хммм...(задумчиво) Возможно, такая вещь действительно есть.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_28");	//И что же?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_29");	//Ну, например, черная руда. Говорят, ее магические свойства намного сильнее, чем у обычной руды, добываемой здесь на острове.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_30");	//Правда, достать образец этой породы довольно сложно.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_31");	//Но если сможешь достать ее для меня, то я отдам нужное тебе растение.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_32");	//Договорились.
		B_LogEntry(TOPIC_PrioratStart,"Маг Неорас согласился отдать нужное мне растение, если я принесу ему кусок черной руды.");
		BringNeorasBlackOre = TRUE;
	};
};


instance DIA_neoras_BringNeorasBlackOre(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_neoras_BringNeorasBlackOre_Condition;
	information = DIA_neoras_BringNeorasBlackOre_Info;
	permanent = FALSE;
	description = "Вот твоя черная чуда.";
};

func int DIA_neoras_BringNeorasBlackOre_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BringNeorasBlackOre == TRUE) && (Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_neoras_BringNeorasBlackOre_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_neoras_BringNeorasBlackOre_01_00");	//Вот твоя черная чуда.
	B_GiveInvItems(other,self,ItMi_Zeitspalt_Addon,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,Npc_HasItems(self,ItMi_Zeitspalt_Addon));
	AI_Output(self,other,"DIA_neoras_BringNeorasBlackOre_01_01");	//Хммм. Это и вправду она?
	AI_Output(other,self,"DIA_neoras_BringNeorasBlackOre_01_02");	//Посмотри сам, если не веришь.
	AI_Output(self,other,"DIA_neoras_BringNeorasBlackOre_01_03");	//Ну да, похоже на то.
	AI_Output(self,other,"DIA_neoras_BringNeorasBlackOre_01_04");	//Хорошо. Вот твое растение, как мы и договаривались.
	B_GiveInvItems(self,other,ItPl_CactusFlower,1);
	B_LogEntry(TOPIC_PrioratStart,"Я принес магу Неорасу черную руду, а он в свою очередь отдал мне растение.");
};