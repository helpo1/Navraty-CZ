
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
	AI_Output(self,other,"DIA_Neoras_NoEnter_PissOff_01_00");	//Hmm... (naštvaně)
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
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Co... Co se děje? Proč mě vyrušuješ? Nevidím, že jsem uprostřed extremně komplikovaného experimentu?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Nechtěl jsem vyrušovat.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Ale vyrušuješ. (povzdech) Nuže, co chceš?
};

instance DIA_Neoras_Arbeit(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent = FALSE;
	description = "Máš pro mě nějaký úkol?";
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
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//Máš pro mě nějaký úkol?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Ano, potřebuji byliny pro své experimenty. Pěstujeme si je samy, ale momentálně nemáme žádné ohnivé kopřivy.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Mělo by stačit 7 květů. Přines mi je - ó, ještě něco – chybí mi recept na lektvary.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Kdybys ho našel, byl bych ti vděčný.
	MIS_NeorasPflanzen = LOG_Running;
	MIS_NeorasRezept = LOG_Running;
	Log_CreateTopic(Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen,LOG_Running);
	B_LogEntry(Topic_NeorasPflanzen,"Měl bych přinést alchymistovi Neorasovi 7 ohnivých kopřiv.");
	Log_CreateTopic(Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept,LOG_Running);
	B_LogEntry(Topic_Neorasrezept,"Mistr Neoras ztratil recept na výrobu lektvarů.");
	if(Npc_KnowsInfo(other,DIA_Opolos_beibringen))
	{
		B_LogEntry(Topic_Neorasrezept,"Je to určitě recept, který chce vidět Opolos.");
	};
};


instance DIA_Neoras_Rezept(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 6;
	condition = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent = TRUE;
	description = "Ohlédně receptu...";
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
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Ohlédně receptu...
	if(B_GiveInvItems(other,self,ItWr_ManaRezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Našel jsem ho.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Dobře. Bál jsem se, že se nadobro ztratil.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Vezmi si tenhle lektvar na znamení mé vděčnosti.
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Ještě jsem ho nenašel.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//V tom případě doufám, že ho najdeš.
	};
};


instance DIA_Neoras_Flieder(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 7;
	condition = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent = TRUE;
	description = "Mám pro tebe nějaké ohnivé kopřivy.";
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
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Mám pro tebe nějaké ohnivé kopřivy.
	if(B_GiveInvItems(other,self,ItPl_Mana_Herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Skvěle, s tímhle můžu pracovat. Vezmi si tenhle svitek Větrné pěsti za tvojí snahu.
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self,other,ItSc_Windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Vážně? Ale není to dost. Potřebuji sedm bylin.
	};
};


instance DIA_Neoras_TEACH(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_TEACH_Condition;
	information = DIA_Neoras_TEACH_Info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Můžeš mě něco naučit?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Budu tě učit tajemství alchymie.
		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH,Dialog_Back,DIA_Neoras_TEACH_BACK);
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Neoras_TEACH_Health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Neoras_TEACH_Health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Neoras_TEACH_Perm_Health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Neoras_TEACH_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Neoras_TEACH_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Neoras_TEACH_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Netrénuji novice. Možná když budeš jednou přijat do Kruhu Ohně -
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//Pak ti budu moci ukázat, jak vytvořit mocné lektvary.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Své vědomosti předávám jen členům naší církve.
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
	description = "Můžeš mi připravit nějaký lektvar?";
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
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Můžeš mi připravit nějaký lektvar?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Na novice jsi značně drzý. Jdi si plnit své povinnosti.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Vše potřebné si můžeš koupit u Goraxe.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Pochybuješ o mých schopnostech? Dokážu připravit jakýkoli lektvar.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Dobře.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Ne tak rychle, přirozeně mi musíš přinést všechny přísady a zaplatit malý poplatek za výdaje.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Kolik?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//Za samotnou přípravu si účtuji 10 zlatých.
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
	description = "Mám tady skřetí lektvar...";
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
	AI_Output(self,other,"DIA_Neoras_OrcPotion_01_17");	//Tady.
	AI_StopProcessInfos(self);
};

func void dia_neoras_orcpotion_pay()
{
	AI_Output(other,self,"DIA_Neoras_OrcPotion_15_15");	//Připrav mi lektvar.
	Info_ClearChoices(dia_neoras_orcpotion);
	if(Npc_HasItems(hero,ItMi_Gold) >= 300)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,300);
		dia_neoras_orcpotion_create();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_16");	//Naneštěstí při sobě nemáš dostatek zlata.
	};
};

func void dia_neoras_orcpotion_info()
{
	AI_Output(other,self,"DIA_Neoras_OrcPotion_15_00");	//Mám tady skřetí lektvar...
	if(NEORAS_ORCPOTIONONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Neoras_OrcPotion_15_01");	//Je s ním možné něco udělat?
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_02");	//Hm, zajímavé. Již jsem se s takovým střetl.
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_03");	//Když přidáš sůl, stane se neškodným.
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_04");	//Taktéž dodá sílu a obratnost.
		AI_Output(self,other,"DIA_Neoras_OrcPotion_01_05");	//Ale naneštěstí, oslabí magické schopnosti. A tenhle efekt nemůže být nijak odstraněn.
		AI_Output(other,self,"DIA_Neoras_OrcPotion_15_06");	//Můžeš ho vyrobit?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_07");	//Ano, ale buď ostražitý – mohl bys ztratit své dovednosti mága.
		}
		else
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_08");	//Určitě, jenom... dovezená sůl je drahá. Obzvlášť teď.
			AI_Output(other,self,"DIA_Neoras_OrcPotion_15_09");	//Kolik?
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_10");	//300 zlatých.
		};
		NEORAS_ORCPOTIONONETIME = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_OrcPotion_15_11");	//Můžeš tam přidat potřebné ingredience?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_12");	//Jistě, bratře.
		}
		else
		{
			AI_Output(self,other,"DIA_Neoras_OrcPotion_01_13");	//Jistě, ale pamatuješ si cenu.
		};
	};
	if(hero.guild == GIL_KDF)
	{
		Info_ClearChoices(dia_neoras_orcpotion);
		Info_AddChoice(dia_neoras_orcpotion,Dialog_Back,dia_neoras_orcpotion_back);
		Info_AddChoice(dia_neoras_orcpotion,"Připrav mi lektvar.",dia_neoras_orcpotion_create);
	}
	else
	{
		Info_ClearChoices(dia_neoras_orcpotion);
		Info_AddChoice(dia_neoras_orcpotion,Dialog_Back,dia_neoras_orcpotion_back);
		Info_AddChoice(dia_neoras_orcpotion,"Připrav mi lektvar. (300 zlatých)",dia_neoras_orcpotion_pay);
	};
};


instance DIA_Neoras_BrewForMe(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent = TRUE;
	description = "Připrav mi...";
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
	Info_AddChoice(DIA_Neoras_BrewForMe,"... lektvar rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... extrakt many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... extrakt zdraví.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Připrav mi lektvar rychlosti.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//V pořádku. Máš všechny potřebné ingredience a zlato?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Ano, tady.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//Děkuji. Dám ti ten lektvar ihned, abys nemusel dlouho čekat.
		B_GiveInvItems(self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//Nemáš potřebné věci. Vrať se, až je budeš mít všechny.
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi lektvar rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi extrakt many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi extrakt zdraví.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Připrav mi extrakt many.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//V pořádku. Máš všechny potřebné ingredience a zlato?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Blueplant) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Ano, tady.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Blueplant,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//Děkuji. Dám ti ten lektvar ihned, abys nemusel dlouho čekat.
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//Nemáš potřebné věci. Vrať se, až je budeš mít všechny.
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi lektvar rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi extrakt many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi extrakt zdraví.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Připrav mi extrakt zdraví.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//V pořádku. Máš všechny potřebné ingredience a zlato?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Blueplant) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Ano, tady.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Blueplant,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//Děkuji. Dám ti ten lektvar ihned, abys nemusel dlouho čekat.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//Nemáš potřebné věci. Vrať se, až je budeš mít všechny.
	};
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi lektvar rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi extrakt many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Připrav mi extrakt zdraví.",DIA_Neoras_BrewForMe_Health);
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
	description = "Vypadáš zmateně.";
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
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Vypadáš zmateně.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//Ano, jsem úplně vyčerpaný. Celé dni se snažím přimět tento odvar účinkovat. A nemůžu.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"To není můj problém.",DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Jaký to bude nápoj?",DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"V čem je problém?",DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//V čem je problém?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//V receptu se píše něco o dračím vejci. Samozřejmě, žádné nemám.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Tak jsem se ho snažil napodobit. Zatím s téměř žádným úspěchem.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Když jedno náhodou najdeš v nějaké jeskyni, mysli na mně.
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"A co jsi použil místo dračího vejce?",DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Uvidím, co můžu udělat.",DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Uvidím, co můžu udělat.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Hej. Byl to jenom vtip. Nevěřím, že skutečně najdeš dračí vejce.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Jenom počkej.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Log_CreateTopic(TOPIC_DRACHENEIERNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras,LOG_Running);
	B_LogEntry(TOPIC_DRACHENEIERNeoras,"Neoras potřebuje pro své pokusy dračí vejce. Myslí si, že bych nějaké mohl najít v jeskyních.");
	MIS_Neoras_DragonEgg = LOG_Running;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//A co jsi použil místo dračího vejce?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Věř mi, to nechceš vědět.
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//Jaký lektvar to má být?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Recept jsem koupil od jednoho obchodníka-cestovatele. Jsou se tam zvláštní, ale vesměs zajímavé věci.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Nejsem si jistý, jestli ten lektvar vůbec něco dělá, ale moje žízeň po poznání mě pohání vpřed.
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//To není můj problém.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//Pak mě dál neruš.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};


instance DIA_Neoras_FOUNDDRAGONEGG(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information = DIA_Neoras_FOUNDDRAGONEGG_Info;
	description = "Mám pro tebe dračí vejce.";
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
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Tady pro tebe mám jedno dračí vejce.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Děláš si ze mě srandu.
	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Je pravé! Nemyslel jsem si, že je to možné. Kdes ho našel?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//To si radši nechám pro sebe.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Skvěle. Co za to chceš?
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Nějaký dárek.",DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Několik léčivých lektvarů by mohlo stačit.",DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Dej mi ten lektvar, až bude hotový.",DIA_Neoras_FOUNDDRAGONEGG_trank);
};


var int Neoras_SCWantsDragonEggDrink;

func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Dej mi trochu z toho lektvaru, až ho dokončíš.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//Dobře. Ale jak jsem řekl, netuším, jaké bude mít účinky.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Vrať se později.
	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Co tak několik léčivých lektvarů?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Vybral sis dobře. Tady jsou. Najdeš pro ně vhodné použití.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Překvap mě.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Hmm. Dobře. Seber si tenhle magický prsten. Určitě ti pomůže přemoct spoustu nepřátel.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//Ochrání tě před magickými útoky.
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
	description = "Přišel jsem si pro ten dračí nápoj.";
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
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Přišel jsem si pro ten dračí nápoj.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Ano. Právě jsem ho dokončil. Nezkoušel jsem ho a nenesu žádnou odpovědnost, rozumíš?
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Ano.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//V pořádku. Doufám, že ti nevybouchne hlava.
	CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
	B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
};


instance DIA_Neoras_USEDDRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information = DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description = "Vypil jsem ten dračí lektvar!";
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
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Vyzkoušel jsem ten tvůj dračí nápoj. Velice dobrý!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Hmm. Velmi zajímavé. Musím pokračovat v mým výzkumu.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Mohl bys mi připravit i trochu víc?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Bylo by lepší, kdybychom to zkusili až o několik týdnů. Jinak by ti mohly narůst rohy.
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
	description = "(Zeptat se na recept na lektvar)";
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
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_00");	//Hledám recept na jeden velmi zajímavý lektvar.
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_03");	//Říká se, že je schopný ovlivnit a rozšířit vědomí osoby, která ho užije. Slyšel jsi někdy o něčem podobném?
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_01_04");	//Hmm... (nedůvěřivě) A proč se o to zajímá někdo jako ty?
		Info_ClearChoices(dia_neoras_receptfortyon);
		Info_AddChoice(dia_neoras_receptfortyon,"Tento recept je pro mne nesmírně důležitý!",dia_neoras_receptfortyon_wants);
		Info_AddChoice(dia_neoras_receptfortyon,"Chtěl bych se naučit více o jeho vlastnostech.",dia_neoras_receptfortyon_alchimik);
		Info_AddChoice(dia_neoras_receptfortyon,"Jenom jsem se zeptal.",dia_neoras_receptfortyon_interest);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_07");	//Říká se, že je schopný ovlivnit a rozšířit vědomí osoby, která ho užije.
		AI_Output(other,self,"DIA_Neoras_ReceptForTyon_01_08");	//Taky jsem slyšel, že vy mágové Ohně víte, jak ho připravit.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_01_11");	//Hmmm... (nedůvěřivě) A proč se o to zajímá někdo jako ty?
		Info_ClearChoices(dia_neoras_receptfortyon);
		Info_AddChoice(dia_neoras_receptfortyon,"Tento recept je pro mne nesmírně důležitý!",dia_neoras_receptfortyon_wants);
		Info_AddChoice(dia_neoras_receptfortyon,"Chtěl bych se naučit více o jeho vlastnostech.",dia_neoras_receptfortyon_alchimik);
		Info_AddChoice(dia_neoras_receptfortyon,"Jenom jsem se zeptal.",dia_neoras_receptfortyon_interest);
	};
};

func void dia_neoras_receptfortyon_wants()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Wants_01_00");	//Tento recept je pro mne nesmírně důležitý!

	if(KNOWABOUTRECEPTFORTYON == TRUE)
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_02");	//Myslíš, že i kdyby to mágové Ohně věděli, svěřili by to TOBĚ?
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_03");	//Takto důležité vědomosti jsou přístupné jenom vybraným osobám a ty mezi ně nepatříš.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_05");	//Proto ti dám dobrou radu. Neplýtvej časem na věci nad tvojí úroveň a nevěř povídačkám.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_06");	//A tebe teď žádám, abychom skončili tuto konverzaci. Mé výzkumy mi nenechávají mnoho času na kecání.
		b_endneorasreceptfortyon();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_07");	//Pro každého je něco důležité! Ale já netuším, kde sehnat tento recept a ani nic nevím o tom lektvaru.
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Wants_01_08");	//Možná se o něm dozvíš víc ve městě.
		b_endneorasreceptfortyon();
	};
};

func void dia_neoras_receptfortyon_alchimik()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_00");	//Chtěl bych se naučit víc o vlastnostech toho lektvaru.

	if(Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0)
	{
		if(KNOWABOUTRECEPTFORTYON == TRUE)
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_01");	//Takže hledáš poznání...
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_02");	//Obávám si, že ti s tím nebudu moci pomoct.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_03");	//Proč?
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_04");	//Tyhle dovednosti můžu předat jenom členům našeho rádu. A ty ním nejsi!
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_05");	//Jistě chápeš, že kdyby se dostali do nesprávných rukou, důsledky by byly ničivé.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_06");	//Čili vy, mágové Ohně, ten recept držíte na přísně střeženém místě...
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_07");	//Ano. Ale nesnaž se k němu dostat! Nikdy se k němu nedostaneš.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_08");	//Tento poklad patří jen Innosovým nejlepším! A jen ti ho můžou použít.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_10");	//A tebe teď žádám, abychom skončili tuto konverzaci. Mé výzkumy mi nenechávají mnoho času na kecání.
			B_LogEntry(TOPIC_RECEPTFORTYON,"Neoras přiznal, že recept je uložen v kláštere. Teď jenom musím najít to místo.");
			B_LogEntry_Quiet(TOPIC_RECEPTFORTYON,"Neoras taktéž poznamenal, že tajemství elixíru proměny mysli odhalí jenom mágům Ohně.");
			b_endneorasreceptfortyon();
		}
		else
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_11");	//Takže hledáš poznání! Jsem připraven podělit se o to, co vím.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_12");	//(přemýšlivě) Slyšel jsem o něm a má vážně neobyčejné alchymistické vlastnosti.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_13");	//Ovlivnění mysli je jenom jedním z účinků. Každý z dalších může vést k nepředvídatelným následkům.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_14");	//Taky třeba poznamenat, že příprava je tak složitá, že by se o ní měl pokoušet jen zkušený alchymista.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_15");	//Třeba poznamenat, že recept obsahuje několik nevšedních ingrediencí.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_16");	//A máš tento recept?
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_17");	//Momentálně ne!... Řekl jsem, že jsem o něm slyšel, ale ne, že poznám výrobní tajemství.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_18");	//A kdo by ho mohl poznat?
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_19");	//Nevím. Zkus se zeptat někoho ve městě – možná by ti o něm mohli říct víc.
			AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_20");	//A tebe teď žádám, abychom skončili tuto konverzaci. Mé výzkumy mi nenechávají mnoho času na kecání.
			b_endneorasreceptfortyon();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_22");	//Řekni mi, jak by ti to mohlo pomoct, i kdybys věděl dost na to, abys lektvar připravil!
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_24");	//Mrháš mým časem!
		AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Alchimik_01_25");	//A tebe teď žádám, abychom skončili tuto konverzaci. Mé výzkumy mi nenechávají mnoho času na kecání.
		b_endneorasreceptfortyon();
	};
};

func void dia_neoras_receptfortyon_interest()
{
	AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Interest_01_00");	//Jenom jsem se zeptal.
	AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Interest_01_01");	//Tak ti jenom říkám, že nemám ani potuchy, o čem mi tu povídáš.
	AI_Output(self,other,"DIA_Neoras_ReceptForTyon_Interest_01_02");	//A tebe teď žádám, abychom skončili tuto konverzaci. Mé výzkumy mi nenechávají mnoho času na kecání.
	b_endneorasreceptfortyon();
};

instance DIA_NEORAS_RECEPTFORKDF(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptforkdf_condition;
	information = dia_neoras_receptforkdf_info;
	permanent = FALSE;
	description = "Odhal mi tajemství elixíru proměny mysli.";
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
	AI_Output(other,self,"DIA_Neoras_ReceptForKDF_01_00");	//Odhal mi tajemství elixíru proměny mysli.
	AI_Output(other,self,"DIA_Neoras_ReceptForKDF_01_01");	//Myslíš si, že teď, když jsem se stal mágem Ohně, bych ho mohl zvládnout připravit?
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_02");	//Teď když jsi jedním z Innosových nejlepších, bych ti tuto dovednost mohl předat.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_03");	//Lektvar, který jsi nazval elixírem proměny mysli – se jednoduše nazývá elixír Amun-Su.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_04");	//V starověku ho vynalezl mocný mág Ohně, jehož jméno si nikdo nepamatuje.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_05");	//Nejprve bych tě chtěl varovat, že tenhle elixír zvládne vyrobit jen velmi zručný alchymista.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_06");	//Jsou od tebe vyžadovány mnohem větší vědomosti než základy.
	AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_07");	//Je to nelehké, ale je to jedna z podmínek přípravy tohoto lektvaru.

	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_0A");	//Víš mnoho na poli alchymie...

		if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_SUPERMANA))
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_08");	//A vidím, že jsi připraven zvládnout to.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_09");	//Tak přistup blíž a dávej pozor!
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_MONASTERY_ALCHEMY_01");
			AI_AlignToWP(self);
			AI_UseMob(self,"LAB",5);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_10");	//Prvně si musíme připravit všechny nezbytné věci.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_11");	//Na přípravu tohoto nápoje je třeba mnoho – a je zapotřebí dávat pozor, abychom nic nevynechali.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_12");	//Na alchymistickém stolíku pak postupně přidáváš všechno do soli.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_13");	//Je velice důležité přidávat je tam v správném pořadí!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_14");	//Potom, co tam přidáš všechny ingredience, směs přivedeš do varu...
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_15");	//Jako já teď... (ukazuje) Ještě pak trochu a...
			AI_UseMob(self,"LAB",-1);
			B_TurnToNpc(self,other);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_16");	//To je všechno! Mocný elixír Amun-Su je hotový!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_17");	//Teď si to můžeš zkusit sám.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_18");	//A málem jsem zapomněl. Plné účinky elixíru se projeví jenom při prvním použití!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_19");	//Opakované užívání bude mít slabší efekt. Pamatuj na to.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_21");	//Vidím, že ještě nemáš dostatečné zkušenosti na přípravu tohoto lektvaru.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_22");	//Nemáš některé vědomosti, které jsou esenciální při jeho preparaci.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDF_01_23");	//Douč se je, a pak budeš moci ovládnout toto tajemství.
	};
};


instance DIA_NEORAS_RECEPTFORKDFAGAIN(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptforkdfagain_condition;
	information = dia_neoras_receptforkdfagain_info;
	permanent = TRUE;
	description = "Odhal mi tajemství elixíru Amun-Su.";
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
	AI_Output(other,self,"DIA_Neoras_ReceptForKDFAgain_01_00");	//Odhal mi tajemství elixíru Amun-Su.

	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_0A");	//Víš mnoho na poli alchymie...

		if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_SUPERMANA))
		{
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_01");	//A vidím, že jsi připraven zvládnout to.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_02");	//Tak přistup blíž a dávej pozor!
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_MONASTERY_ALCHEMY_01");
			AI_AlignToWP(self);
			AI_UseMob(self,"LAB",5);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_03");	//Prvně si musíme připravit všechny nezbytné věci.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_04");	//Na přípravu tohoto nápoje je třeba mnoho – a je zapotřebí dávat pozor, abychom nic nevynechali.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_05");	//Na alchymistickém stolíku pak postupně přidáváš všechno do soli.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_06");	//Je velice důležité přidávat je tam v správném pořadí!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_07");	//Potom, co tam přidáš všechny ingredience, směs přivedeš do varu...
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_08");	//Jako já teď... (ukazuje) Ještě pak trochu a...
			AI_UseMob(self,"LAB",-1);
			B_TurnToNpc(self,other);
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_09");	//To je všechno! Mocný elixír Amun-Su je hotový!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_10");	//Teď si to můžeš zkusit sám.
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_11");	//A málem jsem zapomněl. Plné účinky elixíru se projeví jenom při prvním použití!
			AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_12");	//Opakované užívání bude mít slabší efekt. Pamatuj na to.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_14");	//Vidím, že ještě nemáš dostatečné zkušenosti na přípravu tohoto lektvaru.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_15");	//Nemáš některé vědomosti, které jsou esenciální při jeho preparaci.
		AI_Output(self,other,"DIA_Neoras_ReceptForKDFAgain_01_16");	//Douč se je, a pak budeš moci ovládnout toto tajemství.
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
	description = "Tvé magické runy - stále fungují?";
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
	AI_Output(other,self,"DIA_Neoras_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Neoras_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(other,self,"DIA_Neoras_RuneMagicNotWork_01_02");	//A co ostatní?!
	AI_Output(self,other,"DIA_Neoras_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatním mágům Ohně se také nic nedaří.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
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
	description = "Ukaž mi své zboží.";
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

	AI_Output(other,self,"DIA_NEORAS_TRADE_01_01");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_neoras_LOKIPOTION(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_neoras_LOKIPOTION_Condition;
	information = DIA_neoras_LOKIPOTION_Info;
	permanent = FALSE;
	description = "Je to pravda, že jsi v poslední době zakoupili od prodejce Zurise vzácné rostliny?";
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
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_00");	//Je to pravda, že jsi v poslední době zakoupili od prodejce Zurise vzácné rostliny?
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_01");	//(váhavě) Já u něj často kupují různé druhy přísad pro své experimenty.
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_02");	//Myslím květ kaktusu.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_03");	//Ach, o tomdle mluvíš. Ano, to byl velký úspěch, když se ukázalo, že má jeden exemplář této nádherné květiny.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_04");	//Víš, pracoval jsem na magickém elixíru, který vytvoří po pozření, určitou imunitu vůči ohni...
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_05");	//A podle mých výpočtů, jsem naléhavě potřeboval přírodní extrakt z květu této rostliny.
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_06");	//A proč se o to zajímáš?
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_07");	//Také nutně potřebuji tuto rostlinu. Ale tadle je dle všeho, jediná na ostrově.
	AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_08");	//Neprodáš mě ji?
	AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_09");	//Zapomeň na to! O peníze nemám zájem.

	if(hero.guild == GIL_PAL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_10");	//Tak mě řekni, jak tu rostlinu můžu získat?
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_11");	//Nebo možná bych měl využít svého postavení paladina...
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_12");	//... A to vyžadují ku prospěchu věci ve jménu Innose?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_13");	//Dobře, dobře... (zmateně) Opravdu, ji tak potřebuješ!
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_14");	//Dobře, dám ti ji jen tak.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_15");	//Tady, vem si ji. Doufám, že ji opravdu použiješ k dobrým účelům.
		B_GiveInvItems(self,other,ItPl_CactusFlower,1);
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_16");	//O tom nemusíš pochybovat.
		B_LogEntry(TOPIC_PrioratStart,"Využil jsem své postavení paladina, aby mě mág Neoras dal rostlinu kterou jsem potřeboval. Je čas vrátit se k Baalu Tyonovi.");
	}
	else if(hero.guild == GIL_KDF)
	{
		B_GivePlayerXP(750);
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_17");	//Teď mě řekni co mám udělat, abys mě ji dal?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_18");	//Nemám v úmyslu ti ji dát i když patříš do našeho řádu.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_19");	//Podívej se, potřebuju ji ze závažných důvodů.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_20");	//Věř mi, tvůj elixír není tak důležitý, ve srovnání s tím, jak může být prospěšná, pokud mi ji přenecháš.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_21");	//Pečlivě přemýšlej nad tím, co jsem ti řek.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_22");	//Jinak budu nucen požádat o pomoc Pyrokara a další vyšší mágy Ohně.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_23");	//Hmmm... (zamyšleně) No, no, no... Dám ti ji... a jenom tak.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_24");	//Tady ji máš. Doufám, že v budoucnu toho nebudu litovat.
		B_GiveInvItems(self,other,ItPl_CactusFlower,1);
		B_LogEntry(TOPIC_PrioratStart,"Využil jsem svého postavení mága Ohně a přesvědčil Neorase aby mi ji dal. Je čas vrátit se k Baalu Tyonovi.");
	}
	else
	{
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_26");	//Ale možná je tu něco jiného, co tě zajímá víc, než tvůj elixír?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_27");	//Hmmm... (zamyšleně) Možná, že taková věc ve skutečnosti existuje.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_28");	//A co to je?
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_29");	//No, například černá ruda, říká se, že má mnohem silnější magické vlastnosti, než ruda co se zde těží na ostrově.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_30");	//Ale získat její vzorek je velmi obtížné.
		AI_Output(self,other,"DIA_neoras_LOKIPOTION_01_31");	//Ale pokud ji pro mě získáš, je rostlina tvoje.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_32");	//Souhlasím.
		B_LogEntry(TOPIC_PrioratStart,"Mág Neoras souhlasil, že mi dá rostlinu, pokud mu přinesu černou rudu.");
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
	description = "Zde máš černou rudu.";
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
	AI_Output(other,self,"DIA_neoras_BringNeorasBlackOre_01_00");	//Zde máš černou rudu.
	B_GiveInvItems(other,self,ItMi_Zeitspalt_Addon,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,Npc_HasItems(self,ItMi_Zeitspalt_Addon));
	AI_Output(self,other,"DIA_neoras_BringNeorasBlackOre_01_01");	//Hmmm. Je to opravdu ona?
	AI_Output(other,self,"DIA_neoras_BringNeorasBlackOre_01_02");	//Podívej se sám jestli nevěříš.
	AI_Output(self,other,"DIA_neoras_BringNeorasBlackOre_01_03");	//No vypadá jako...
	AI_Output(self,other,"DIA_neoras_BringNeorasBlackOre_01_04");	//Dobře, tady máš rostlinu jak jsme se dohodli.
	B_GiveInvItems(self,other,ItPl_CactusFlower,1);
	B_LogEntry(TOPIC_PrioratStart,"Přinesl jsem mágovi Neorasovi černou rudu a on mě na oplátku dal rostlinu.");
};
