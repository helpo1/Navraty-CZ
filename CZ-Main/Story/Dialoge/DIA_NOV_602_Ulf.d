
instance DIA_Ulf_EXIT(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 999;
	condition = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Hallo(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = DIA_Ulf_Hallo_Condition;
	information = DIA_Ulf_Hallo_Info;
	permanent = FALSE;
	description = "Co tu děláš?";
};


func int DIA_Ulf_Hallo_Condition()
{
	if((other.guild != GIL_NOV) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Co tu děláš?

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Jestli to chceš vědět, tak dělám práci pro klášter.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Jsem novic kláštera, sloužím mágům a paladinům.

		if(Npc_GetDistToWP(self,"NW_CITY_BEER_04") < 1500)
		{
			AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//Nesl jsem víno do města.
		};
	};
};


instance DIA_Ulf_Wirte(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Wirte_Condition;
	information = DIA_Ulf_Wirte_Info;
	permanent = FALSE;
	description = "Komu jsi nesl to víno?";
};


func int DIA_Ulf_Wirte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (Npc_GetDistToWP(self,"NW_TAVERNE_GREGSBENCH") > 1500))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Wirte_Info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Komu jsi nesl to víno?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Hospodskému tady za pultem.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//A ještě Coragonovi a Kardiffovi.
};


instance DIA_Ulf_Kloster(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Kloster_Condition;
	information = DIA_Ulf_Kloster_Info;
	permanent = FALSE;
	description = "Co mi řekneš o klášteru?";
};


func int DIA_Ulf_Kloster_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Kloster_Info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Co mi řekneš o klášteru?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//My novicové hledáme osvícení pod vedením mágů.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//Sloužíme Innosovi a učíme se jeho vědění.
};


instance DIA_Ulf_Bringen(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 4;
	condition = DIA_Ulf_Bringen_Condition;
	information = DIA_Ulf_Bringen_Info;
	permanent = FALSE;
	description = "Vezmi mě do kláštera.";
};


func int DIA_Ulf_Bringen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Bringen_Info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Vezmi mě do kláštera.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Na to zapomeň, víš co za hovada je kolem cesty?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Všechny ty krvavé mouchy, ti goblini, vlci a tak...
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Kromě toho tě stejně nepustí do kláštera.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Proč?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Tam smí jen paladinové, novicové a mágové.
};


instance DIA_Ulf_Aufnahme(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Aufnahme_Condition;
	information = DIA_Ulf_Aufnahme_Info;
	permanent = FALSE;
	description = "Jak se mohu stát novicem?";
};


func int DIA_Ulf_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//Jak se mohu stát novicem?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Pokud člověk cítí touhu...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Jenom mi řekni, co musím udělat.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Musíš přinést dary, ovci a tisíc zlatých...
	B_Say_Gold(self,other,Summe_Kloster);
	Log_CreateTopic(Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus(Topic_Kloster,LOG_Running);
	B_LogEntry(Topic_Kloster,"Abych se stal novicem, potřebuji ovci a tisíc zlatých.");
};


instance DIA_Ulf_Gold(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 8;
	condition = DIA_Ulf_Gold_Condition;
	information = DIA_Ulf_Gold_Info;
	permanent = FALSE;
	description = "Jak můžu sehnat tolik zlata?";
};


func int DIA_Ulf_Gold_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Gold_Info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Jak můžu sehnat tolik zlata?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Pokud neznáš nikoho, kdo ti ho dá, musíš si ho vydělat.
};


instance DIA_Ulf_Schaf(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Schaf_Condition;
	information = DIA_Ulf_Schaf_Info;
	permanent = FALSE;
	description = "Kde najdu ovci?";
};


func int DIA_Ulf_Schaf_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Aufnahme) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Schaf_Info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Kde najdu ovci?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//U farmářů, ale zadarmo to nebude.
	B_LogEntry(Topic_Kloster,"Ovci můžu koupit na některé z farem.");
};


instance DIA_Ulf_Suche(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Suche_Condition;
	information = DIA_Ulf_Suche_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Suche_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Suche_Info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Hele, už jsi to slyšel?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Byl jsi vybrán do zkoušky.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//Přesně tak, zrovna jsem pil pivo, když přišel Daron a řekl mi to.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Kdo by si to pomyslel?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Požádal jsem o Zkoušku ohně.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//To máš asi odvahu, znamená to, že také hledáš víru na konci cesty?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Pravděpodobně.
};


instance DIA_Ulf_Rausgefunden(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Rausgefunden_Condition;
	information = DIA_Ulf_Rausgefunden_Info;
	permanent = FALSE;
	description = "Nic jsi nenašel?";
};


func int DIA_Ulf_Rausgefunden_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Rausgefunden_Info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//Nic jsi nenašel?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//Snažil jsem se sledovat novice přede mnou, ale zmizel mi.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//Celé to nechápu, co se po nás vlastně chce?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//No nic, jdu pokračovat v hledání.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_Ulf_Folgen(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Folgen_Condition;
	information = DIA_Ulf_Folgen_Info;
	permanent = FALSE;
	description = "Hele, ty mě sleduješ?";
};


func int DIA_Ulf_Folgen_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Folgen_Info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Hele, ty mě sleduješ?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Vůbec, prostě jdu stejným směrem.
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Stop(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Stop_Condition;
	information = DIA_Ulf_Stop_Info;
	permanent = FALSE;
	description = "Přestaň za mnou chodit!";
};


func int DIA_Ulf_Stop_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Folgen))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Stop_Info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Přestaň za mnou chodit!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//Nejdu za tebou, ale jestli si to myslíš, prostě půjdu jinam.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_Ulf_Abrechnung(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Abrechnung_Condition;
	information = DIA_Ulf_Abrechnung_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Abrechnung_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_HasItems(other,ItMi_RuneBlank) >= 1) && (Npc_KnowsInfo(other,DIA_Agon_GolemDead) || Npc_KnowsInfo(other,DIA_Agon_GolemLives)))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Abrechnung_Info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Znovu se setkáváme. Touha stát se mágem je ve mně silná.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Nedělej to...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//Nemám na výběr, život novice pro mě nemá cenu.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Až se stanu mágem, vše bude zase dobré.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Poslední slova?
	Info_ClearChoices(DIA_Ulf_Abrechnung);
	Info_AddChoice(DIA_Ulf_Abrechnung,"Nech toho, nechci tě zabít.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice(DIA_Ulf_Abrechnung,"Musím se vrátit do kláštera.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice(DIA_Ulf_Abrechnung,"Nemáš hulení?",DIA_Ulf_Abrechnung_Rauch);
};

func void DIA_Ulf_Abrechnung_Lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Nech toho, nechci tě zabít.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Nesmysl, nemáš šanci!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Musím se vrátit do kláštera.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//Nebudeš muset nic!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//Nemáš hulení?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//Máš štěstí, něco jo.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Tak pojď.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Ulf_Troll(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Troll_Condition;
	information = DIA_Ulf_Troll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Troll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Troll_Info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Fakt si myslíš, že jdeme správně?
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Myslím, že musíme jinudy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_RING(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = dia_ulf_ring_condition;
	information = dia_ulf_ring_info;
	permanent = FALSE;
	description = "Proč tak smutně?";
};


func int dia_ulf_ring_condition()
{
	if((Kapitel >= 2) && (ULFTAVERNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_ulf_ring_info()
{
	AI_Output(other,self,"DIA_Ulf_Ring_01_00");	//Proč tak smutně?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Ring_01_01");	//Promiň, já...
		AI_Output(other,self,"DIA_Ulf_Ring_01_02");	//Tak řekneš mi to?
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Ring_01_03");	//Neptej se!
	};
	AI_Output(self,other,"DIA_Ulf_Ring_01_05");	//Ztratil jsem svůj prsten.
	AI_Output(self,other,"DIA_Ulf_Ring_01_07");	//Má pro mě velkou cenu, zdědil jsem ho po otci.
	AI_Output(other,self,"DIA_Ulf_Ring_01_08");	//Kde jsi ho ztratil?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Ring_01_09");	//Šel jsem z kláštera a u mostu poblíž Akilovy farmy mě napadli banditi.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Ring_01_10");	//Šel jsem z kláštera a u mostu poblíž Akilovy farmy mě napadli banditi.
	};
	AI_Output(self,other,"DIA_Ulf_Ring_01_11");	//Snažili se mě zabít! Tak jsem prostě začal utíkat a běžel jsem do lesa.
	AI_Output(self,other,"DIA_Ulf_Ring_01_12");	//Běžel jsem tak rychle, že mě hned ztratili.
	AI_Output(self,other,"DIA_Ulf_Ring_01_13");	//Ale pak jsem zjistil, že jsem ztratil prsten.
	AI_Output(self,other,"DIA_Ulf_Ring_01_14");	//Možná jsem ho vytratil v lese, ale já už tam nejdu!
	AI_Output(other,self,"DIA_Ulf_Ring_01_15");	//Něco vymyslím.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Ring_01_16");	//Budu ti velmi vděčný!
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Ring_01_17");	//Budu ti velmi vděčný!
	};
	MIS_ULFRING = LOG_Running;
	Log_CreateTopic(TOPIC_ULFRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ULFRING,LOG_Running);
	B_LogEntry(TOPIC_ULFRING,"Novic Ulf ztratil prsten, když ho honili banditi poblíž mostu u Akilovy farmy. Ulf utekl do lesa, ale prsten tam někde vytratil. Rozhodl jsem se mu pomoct.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItRi_Ulf,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
};

instance DIA_ULF_RINGHERE(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = dia_ulf_ringhere_condition;
	information = dia_ulf_ringhere_info;
	permanent = FALSE;
	description = "Je to tvůj prsten?";
};


func int dia_ulf_ringhere_condition()
{
	if((MIS_ULFRING == LOG_Running) && (Npc_HasItems(hero,itri_ulf) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_ringhere_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ulf_RingHere_01_00");	//Je to tvůj prsten?
	AI_Output(self,other,"DIA_Ulf_RingHere_01_01");	//Jo, to je on!
	B_GiveInvItems(other,self,itri_ulf,1);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_RingHere_01_03");	//Díky, nevím, co bych bez tebe dělal.
		AI_Output(self,other,"DIA_Ulf_RingHere_01_04");	//Tady, vezmi si tenhle elixír.
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_RingHere_01_05");	//Díky, nevím, co bych bez tebe dělal.
		AI_Output(self,other,"DIA_Ulf_RingHere_01_06");	//Tady, vezmi si tenhle elixír.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	};
	AI_Output(self,other,"DIA_Ulf_RingHere_01_07");	//Vím, že je to málo, ale je to vše, co mám!
	MIS_ULFRING = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ULFRING,LOG_SUCCESS);
	B_LogEntry(TOPIC_ULFRING,"Ulf byl rád, když získal svůj prsten zpět.");
};


instance DIA_Ulf_PICKPOCKET(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 900;
	condition = DIA_Ulf_PICKPOCKET_Condition;
	information = DIA_Ulf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ulf_PICKPOCKET_Condition()
{
	return C_Beklauen(34,50);
};

func void DIA_Ulf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
	Info_AddChoice(DIA_Ulf_PICKPOCKET,Dialog_Back,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

