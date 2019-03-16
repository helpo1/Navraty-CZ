
instance DIA_Talamon_KAP1_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP1_EXIT_Condition;
	information = DIA_Talamon_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Talamon_NoEnter_PissOff(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_NoEnter_PissOff_Condition;
	information = DIA_Talamon_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Talamon_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_Talamon_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Talamon_NoEnter_PissOff_01_00");	//Hmm...(naštvaně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

const string KDF_507_Checkpoint = "NW_MONASTERY_SEALROOM_01";
var int TalamonFM;

instance DIA_KDF_507_Talamon_FirstWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_KDF_507_Talamon_FirstWarn_Condition;
	information = DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (CanEnterKloster == TRUE) && (Kapitel < 6) && (Npc_RefuseTalk(self) == FALSE) && (hero.guild != GIL_KDF) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_TurnToNPC(hero,Garwig);
	AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_00");	//Nemůžeš jít dál. Otoč se a jdi!

	if(TalamonFM == FALSE)
	{
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_00");	//Pověz mistře, nemůžeš tu přeci stát bez přestávek a odpočinku na věky?
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_01");	//Stěžovat si na poslání mi svěřené Innosem - není mým údělem mága Ohně.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_02");	//A jsi pověřený Innosem nebo Nejvyšší radou?
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_03");	//Z úst Nejvyšší rady promlouvá Innos sám.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_04");	//Ano, ano hlas boží - omluví všechno. No podle mně z tebe udělali obětního beránka - nebo osla.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_05");	//Nejsem oprávněn s tebou diskutovat na toto téma.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_06");	//Tvoji bratři sedí nahoře v chrámu a rozdávají odpustky(požehnání). Zatím co ty tu obrůstáš pavučinou a přitom jsi taky vyšší mág.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_07");	//Ano, čert to vem!...(mimo sebe) No skoro jsi to trefil: no ne že já obrůstám pavučinou a uvadám zde, ale ti, kteří by toho tolik mohli udělat, díky své moudrosti - vrůstají do svých trůnů.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_08");	//Já že stojím jak nerozbitná skála, ale dřív nebo později vyjdu, abych se podíval na jejich nestydaté, prosebné tváře, až si uvědomí, že nic beze mě nemůžou.
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_09");	//Nic nemůžou? V jakém smyslu?
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_10");	//...(vzpamatoval se), o čem jsi to mluvil, můj synu?
		AI_Output(other,self,"DIA_KDF_507_Talamon_FirstWarn_01_11");	//Nu, o vyšších mázích, kteří si dříve nebo později uvědomí...
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_12");	//Jsi zdráv? Jestli ne, tak zajdi za mistrem Neorasem, on je alchymista. On je v protilehé části sklepení.
		AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_01_13");	//Zde je vstup uzavřen, odejdi!
		TalamonFM = TRUE;
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_SecondWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 2;
	condition = DIA_KDF_507_Talamon_SecondWarn_Condition;
	information = DIA_KDF_507_Talamon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (Kapitel < 6) && (Npc_RefuseTalk(self) == FALSE) && (hero.guild != GIL_KDF) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_TurnToNPC(hero,Garwig);
	AI_Output(self,other,"DIA_KDF_507_Talamon_SecondWarn_04_00");	//Když nepůjdeš, stihne tě Innosův hněv!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_Attack(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 3;
	condition = DIA_KDF_507_Talamon_Attack_Condition;
	information = DIA_KDF_507_Talamon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_Attack_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (Kapitel < 6) && (Npc_RefuseTalk(self) == FALSE) && (hero.guild != GIL_KDF) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (other.guild != GIL_MEATBUG))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	AI_TurnToNPC(hero,Garwig);
	self.aivar[AIV_EnemyOverride] = FALSE;
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Talamon_IgaranzNew(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_IgaranzNew_condition;
	information = DIA_Talamon_IgaranzNew_info;
	permanent = FALSE;
	description = "Potřebuji tvoji pomoc.";
};

func int DIA_Talamon_IgaranzNew_condition()
{
	if((Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && (IS_PYROKAR_IGORANZINFO == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_IgaranzNew_info()
{
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_01");	//Potřebuji tvoji pomoc.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_02");	//V čem je problém, bratře?
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_03");	//Novic Igaraz je odhodlaný stát se mágem Ohně, a já si myslím, že by měl dostat ještě jednu šanci.
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_04");	//Pyrokar řekl, že to rozhodnutí je na tobě.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_05");	//Hmmm... (zamyšleně) Je tomu velmi dávno co se někdo zabýval tímto zákonem.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_06");	//Je třeba se zamyslet. Z jedné strany, Igaraz už jednou neprošel zkouškou.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_07");	//Na druhou stranu, já ho velmi dlouho znám jako schopného studenta a věrného služebníka Innose.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_09");	//No, dobře. Ať má druhou šanci, ale tentokrát poslední!
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_01_10");	//Rozumím, a jakým úkolem ho pověříš?
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_11");	//Nemožným. Ať mě novic Igaraz přinese srdce démona.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_12");	//Pak mu bude cesta do kruhu Ohně otevřena!
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_01_13");	//Budu velmi rád, když mu tyto zprávy předáš.
	IS_TALAMON_IGORANZCONDITION = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Talamon chce po Igarazovi srdce démona. Mám mu tu zprávu předat.");
};

instance DIA_Talamon_IgaranzNew_DemonHeart(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_IgaranzNew_DemonHeart_condition;
	information = DIA_Talamon_IgaranzNew_DemonHeart_info;
	permanent = FALSE;
	description = "Novic Igaraz mě požádal, abych ti předal toto srdce.";
};


func int DIA_Talamon_IgaranzNew_DemonHeart_condition()
{
	if((Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && Npc_HasItems(hero,ItAt_DemonHeart) && ((IgaranzMakeHappyGold == TRUE) || (IgaranzMakeHappyMagic == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Talamon_IgaranzNew_DemonHeart_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_DemonHeart_01_01");	//Novic Igaraz mě požádal, abych ti předal toto srdce.
	B_GiveInvItems(other,self,ItAt_DemonHeart,1);
	Npc_RemoveInvItem(self,ItAt_DemonHeart);
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_02");	//(Překvapeně) Doufám, že jsi mu s tím úkolem nepomáhal?
	AI_Output(other,self,"DIA_Talamon_IgaranzNew_DemonHeart_01_03");	//Ne, jen jsem souhlasil, že ti to srdce předám.
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_04");	//No, dobře. Jednou složil mojí zkoušku, tak může od této chvíle nosit roucho mága Ohně!
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_05");	//Zde, předej mu to.
	B_GiveInvItems(self,other,itar_kdf_m_new,1);
	AI_Output(self,other,"DIA_Talamon_IgaranzNew_DemonHeart_01_06");	//Všechno ostaní si musí zařídit u mistra Parlana.
	B_LogEntry(TOPIC_IGARANZ_NEW,"Donesl jsem Talamonovi srdce démona. Nyní můžu tuhle dobrou zprávu sdělit Igarazovi a nakonec mu dát roucho mága Ohně.");
	IgaranzMakeHappyOk = TRUE;
};


instance DIA_Talamon_KAP5_Stop(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 50;
	condition = DIA_Talamon_KAP5_Stop_Condition;
	information = DIA_Talamon_KAP5_Stop_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Talamon_KAP5_Stop_Condition()
{
	if(Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_00");	//Nemůžeš jít dál. Otoč se a jdi!
	AI_Output(other,self,"DIA_Talamon_KAP5_Stop_15_01");	//Pyrokar mi řekl že můžu vzít Xardasovu knihu. 
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_02");	//Vážně? V pořádku, můžeš vstoupit. Kniha, kterou hledáš, je na alchymistickém stolku.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Talamon řekl, že Xardasova kniha je na alchymistickém stolku v podzemí.");
	self.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_Talamon_FoundSecretDoor(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_FoundSecretDoor_Condition;
	information = DIA_Talamon_FoundSecretDoor_Info;
	permanent = FALSE;
	description = "Našel jsem tajné dveře.";
};


func int DIA_Talamon_FoundSecretDoor_Condition()
{
	if(SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_00");	//Našel jsem tajné dveře.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_01");	//(překvapen) Co? Kde?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_02");	//Za poličkou na knihy.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_03");	//Co je za nimi?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_04");	//Vypadá to jako stará podzemní chodba.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_05");	//Tohle je důležitá zpráva, musím o tom okamžitě informovat Pyrokara.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_06");	//Mezitím je nutno zjistit, kam to vede.
	MIS_ScoutLibrary = LOG_Running;
};


instance DIA_Talamon_ScoutSecretLibrary(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_ScoutSecretLibrary_Condition;
	information = DIA_Talamon_ScoutSecretLibrary_Info;
	permanent = TRUE;
	description = "Byl jsem ve sklepě.";
};


func int DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if((MIS_ScoutLibrary == LOG_Running) && (HeroWasInLibrary == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_00");	//Byl jsem tam.
	AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_01");	//A cos našel?
	if(Npc_IsDead(SecretLibrarySkeleton))
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_02");	//Kostlivý válečník střežil dveře. Zabil jsem ho.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_03");	//Výborně.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_04");	//Vypořádáme se s tím, jakmile porazíme ostatní zlo.
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP(XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_05");	//Hemží se to tam monstrami.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_06");	//Hledej dál, něco tam být musí. A neměj s nimi milosti.
	};
};


instance DIA_Talamon_PICKPOCKET(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 900;
	condition = DIA_Talamon_PICKPOCKET_Condition;
	information = DIA_Talamon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Talamon_PICKPOCKET_Condition()
{
	return C_Beklauen(87,140);
};

func void DIA_Talamon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,Dialog_Back,DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,130);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};


instance DIA_TALAMON_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = dia_talamon_runemagicnotwork_condition;
	information = dia_talamon_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_talamon_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_talamon_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Talamon_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Talamon_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(other,self,"DIA_Talamon_RuneMagicNotWork_01_02");	//A co ostatní?
	AI_Output(self,other,"DIA_Talamon_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechni! Ostatnim mágům Ohně se také nic nedaří.
	AI_Output(other,self,"DIA_Talamon_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};


var int talamon_teach_d_1;

instance DIA_TALAMON_TEACHBLROBS(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 5;
	condition = dia_talamon_teachblrobs_condition;
	information = dia_talamon_teachblrobs_info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};

func int dia_talamon_teachblrobs_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_HasItems(hero,ItAr_KDF_H) >= 1))
	{
		return TRUE;
	};
};

func void dia_talamon_teachblrobs_info()
{
	TALAMON_TEACH_D_1 = TRUE;
	AI_Output(other,self,"DIA_Talamon_TeachBlRobs_01_01");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_02");	//Jestli myslíš magii, tak ne, bratře
	AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_03");	//Já neučím nováčky našeho řádu. Ale mohu ti říct o starověkém rituálu posvěcení roucha mága Ohně.
	AI_Output(other,self,"DIA_Talamon_TeachBlRobs_01_04");	//Zajímavé...
};


instance DIA_TALAMON_TEACHBLROBS2(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 800;
	condition = dia_talamon_teachblrobs2_condition;
	information = dia_talamon_teachblrobs2_info;
	permanent = TRUE;
	description = "Nauč mě posvětit roucho vysokého mága Ohně. (VB: 5, cena: 2000 zlatých)";
};


func int dia_talamon_teachblrobs2_condition()
{
	if((hero.guild == GIL_KDF) && (TALAMON_TEACH_D_1 == TRUE) && (HEROKNOWS_BLESSED_ROBS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talamon_teachblrobs2_info()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 2000) && (hero.lp >= 5))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_05");	//Již dlouhou dobu nejvyšší mágové Ohně světí své roucha tak, že je kropí svěcenou vodou.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_06");	//Aby bylo možné provést rituál, stačí pouze najít sochu našeho pána - Innose!
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_07");	//Jestli ti bude Innos dostatečně nakloněn, tvé roucho se stane silnější a bude tě lépe chránit.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_08");	//Pamatuj, jedno roucho můžeš posvětit jen jedenkrát, ale zeptej se nikdy není pozdě.
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_09");	//To je vše, co potřebuješ znát. Teď jdi bratře, a ať je s tebou svatý oheň Innose!
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Už vím, jak posvětit své roucho! Budu na to potřebovat 35 láhví svěcené vody.");
		hero.lp = hero.lp - 5;
		RankPoints = RankPoints + 5;
		B_GiveInvItems(hero,self,ItMi_Gold,2000);
		Npc_RemoveInvItems(self,ItMi_Gold,2000);
		Snd_Play("LevelUP");
		HEROKNOWS_BLESSED_ROBS = 1;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) <= 2000)
	{
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_10");	//Nyní mě přines malý dar!
		AI_StopProcessInfos(self);
	}
	else if(hero.lp < 5)
	{
		AI_Output(self,other,"DIA_Talamon_TeachBlRobs_01_11");	//Nejprve musíš získat zkušenosti!
		AI_StopProcessInfos(self);
	};
};