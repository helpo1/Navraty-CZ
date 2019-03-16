instance DIA_Ass_128_Nrozas_EXIT(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 999;
	condition = dia_Ass_128_Nrozas_exit_condition;
	information = dia_Ass_128_Nrozas_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_128_Nrozas_exit_condition()
{
	return TRUE;
};

func void dia_Ass_128_Nrozas_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_PreHALLO(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PreHALLO_condition;
	information = dia_Ass_128_Nrozas_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PreHALLO_condition()
{
	if((MIS_OsairDemand == LOG_SUCCESS) && (NrozasMurid == FALSE))
	{
		return FALSE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (NrozasMurid == FALSE) && (MeetNrozas == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PreHALLO_01_00");	//(podrážděně) Proč mě obtěžuješ?
};


instance DIA_Ass_128_Nrozas_PreHALLO_Kill(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PreHALLO_Kill_condition;
	information = dia_Ass_128_Nrozas_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NrozasMurid == FALSE) && (PW_WelcomeToHram == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_128_Nrozas_HALLO(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_hallo_condition;
	information = dia_Ass_128_Nrozas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_hallo_condition()
{
	if((Npc_IsDead(SEK_168_SLAVEOBSSEK) == FALSE) && (PW_WelcomeToHram == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_hallo_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_00");	//(radostně) Hele, můj nový otrok! Konečně. Pojď sem, neboj se.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_01");	//Co se tebe týče, novici - nenechávej mě dlouho čekat. Jinak budeš na jeho místě!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_02");	//Abys odčinil svoji vinu, tak mi pomůžeš.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_03");	//Dochází mi modrý bez a léčivé rostliny.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_04");	//Tak jdi a přines mi deset stébel od každé rostliny. Rozumíš?
	B_LogEntry(TOPIC_MasiafStory,"Podařilo se mi vninknout do chrámu. O tom budu muset říct Gonzalesovi.");
	Info_ClearChoices(DIA_Ass_128_Nrozas_HALLO);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"(mlčet)",DIA_Ass_128_Nrozas_HALLO_Molchat);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"(přikývnout)",DIA_Ass_128_Nrozas_HALLO_Kivok);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"Dobře, seženu ti to.",DIA_Ass_128_Nrozas_HALLO_Yes);
};

func void DIA_Ass_128_Nrozas_HALLO_Molchat()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Molchat_01_00");	//Tak? Budeš na mě civět jako tupý beran?
};

func void DIA_Ass_128_Nrozas_HALLO_Kivok()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_00");	//Dobře. A ještě něco...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_01");	//Jestli budeš poblíž jeskyně mistra Osaira, řekni mu, aby mi příště poslal silnější otroky.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_02");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_03");	//Poslední dva dny mi totiž umírají jako mouchy!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_04");	//Jestli to tak půjde dál, tak v blízké době nebudu mít na kom testovat své jedy. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_05");	//To je prozatím vše. Jdi!
	MIS_NrozasFl = LOG_Running;
	MIS_NrozasToOsair = LOG_Running;
	Log_CreateTopic(TOPIC_NrozasFl,LOG_MISSION);
	Log_CreateTopic(TOPIC_NrozasToOsair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NrozasFl,LOG_Running);
	Log_SetTopicStatus(TOPIC_NrozasToOsair,LOG_Running);
	B_LogEntry(TOPIC_NrozasFl,"Mistr jedů, Nrozas, mi dal úkol přinést mu deset stébel léčivých rostlin a modrého bezu.");
	B_LogEntry_Quiet(TOPIC_NrozasToOsair,"Mistr Nrozas mě požádal, abych zašel do jeskyně k mistru Osairovi a řekl mu, aby příště posílal mistru Nrozasovi robustnější otroky pro jeho experimenty s jedy.");
	MeetNrozas = TRUE;
	AI_StopProcessInfos(self);
	SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"Nrozas");
};

func void DIA_Ass_128_Nrozas_HALLO_Yes()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HALLO_Yes_01_00");	//Dobře, seženu ti to.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Yes_01_01");	//Ty sis dovolil promluvit bez mého svolení?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Yes_01_02");	//Něco mi říká, že nejsi ten, za koho se vydáváš!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Yes_01_03");	//To tě bude stát život. Zbytečně jsi sem chodil!
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"Nrozas");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_NrozasFl(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_NrozasFl_condition;
	information = dia_Ass_128_Nrozas_NrozasFl_info;
	permanent = FALSE;
	description = "(dát všechny rostliny)";
};

func int dia_Ass_128_Nrozas_NrozasFl_condition()
{
	if((MIS_NrozasFl == LOG_Running) && (Npc_HasItems(other,ItPl_Blueplant) >= 10) && (Npc_HasItems(other,ItPl_Health_Herb_01) >= 10))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NrozasFl_info()
{
	B_GivePlayerXP(100);
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_Blueplant,10);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,10);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasFl_01_01");	//Výborně! Přesně to jsem potřeboval.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasFl_01_02");	//Nejsi takový budižkničemu, jak to vypadalo na první pohled. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasFl_01_03");	//Možná z tebe bude dobrý pomocník.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NrozasFl_01_04");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	MIS_NrozasFl = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasFl,LOG_SUCCESS);
	B_LogEntry(TOPIC_NrozasFl,"Přinesl jsem mistru Nrozasovi všechny rostliny.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_NrozasToOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_NrozasToOsair_condition;
	information = dia_Ass_128_Nrozas_NrozasToOsair_info;
	permanent = FALSE;
	description = "(dát dopis)";
};

func int dia_Ass_128_Nrozas_NrozasToOsair_condition()
{
	if((MIS_NrozasToOsair == LOG_Running) && (Npc_HasItems(other,ItWr_Osair) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NrozasToOsair_info()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItWr_Osair,1);
	Npc_RemoveInvItems(self,ItWr_Osair,1);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_00");	//Co to je? Aha, dopis od mistra Osaira.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_01");	//Dobře, dej ho sem. Podíváme se, co se v něm píše.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_02");	//Hmmm...(zamyšleně) On věří, že s tím budu souhlasit? No dobře...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_03");	//Jakmile pošle svého člověka pro další otrávené šipky, tak mu to připomenu.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_04");	//Co se týče tebe, dobře jsi pracoval.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_05");	//Jestli budeš i nadále splňovat moje pokyny, budu přemýšlet o tvém novicovském osudu.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_06");	//Teď jdi. Zatím tě nepotřebuji.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NrozasToOsair_01_07");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	MIS_NrozasToOsair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasToOsair,LOG_SUCCESS);
	B_LogEntry(TOPIC_NrozasToOsair,"Přinesl jsem Nrozasovi odpověď od mistra Osaira. Dopis se mu zřejmě nelíbil, no svoji práci jsem splnil.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItWr_Osair_Read,"FP_ITEM_NROZAS_LETTER");
};

instance DIA_Ass_128_Nrozas_NewSlaves(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_NewSlaves_condition;
	information = dia_Ass_128_Nrozas_NewSlaves_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_NewSlaves_condition()
{
	if(MIS_OsairDemand == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NewSlaves_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_01");	//(vážně) Stůj, novici. Odpověz mi na jednu otázku.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_02");	//Slyšel jsem, že jsi mistru Osairovi přinesl kůži černého jeskynního trola.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_03");	//Odkud jsi zjistil, že ji chtěl? Přečetl sis dopis, který jsi mi doručoval, že?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_04");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_05");	//Nech toho kývání! Odpovídej normálně, a nezkoušej mi zalhat!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_06");	//Ano, přečetl jsem si ho.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_07");	//Hmmm. Jsi ale odvážný! Ostatní by takovou odvahu neměli...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_08");	//Obyčejně bych tě měl za tuto drzost zabít na místě. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_09");	//Ale díky tvé službě mi mistr Osair dneska poslal celou partu nových otroků.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_10");	//Jak jistě chápeš, mění to okolnosti daného případu.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_11");	//Ukázalo se, že nejsi jen užitečný, ale tímto jsi nám pomohl vyřešit hodně dávný spor.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_12");	//Proto jsem se rozhodl. Od nynějška jsi můj murid! Oblíbenec mezi novici.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_13");	//Doufám, že sis vědom, že je to pro tebe velká čest. Nezklam mě.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_14");	//Děkuji ti, mistře!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_15");	//Neděkuj. Zasloužil sis to.
	NrozasMurid = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry(TOPIC_MasiafStory,"Mistr Nrozas byl velmi rád, že jsem mu pomohl vyřešit jeho dávný spor s mistrem Osairem, v ten samý čas jsem byl pro ně oba užitečný. Za to jsem se stal jeho muridem - oblíbencem mezi novici.");

	if((OsairMurid == TRUE) && (PlayerSendToTiamant == FALSE))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_16");	//A ještě něco...
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_17");	//Když už jsi překonal jeskynního trola, tak předpokládám, že jsi šikovný bojovník.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_18");	//Mistr Tiamant se zabývá bojovým tréninkem stínů, určitě ho to bude zajímat.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_19");	//Promluv si s ním. Pokud se bude ptát, řekni mu, že jsem tě poslal já.
		AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_20");	//Dobře, mistře.
		PlayerSendToTiamant = TRUE;
	};
};


instance DIA_Ass_128_Nrozas_Murid(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Murid_condition;
	information = dia_Ass_128_Nrozas_Murid_info;
	permanent = FALSE;
	description = "Co to znamená být vyvolený, mistře?";
};

func int dia_Ass_128_Nrozas_Murid_condition()
{
	if((NrozasMurid == TRUE) && (MuridTells == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Murid_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_01");	//Co to znamená být vyvolený, mistře?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_02");	//Něco ti objasním. Poslouchej bedlivě.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_03");	//Jednou za čtyři roky se jednomu z našich noviců dostává cti stát se stínem Masyafu.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_04");	//Stínové jsou naši bojovníci, kteří nesou smrt všem, kteří pochybují o naší moci, a hlavně o moci samotného Beliara!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_05");	//Každý převor Masyafu, včetně mě, vybírá z noviců toho, kdo je podle něj toho hoden.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_06");	//Nazývá ho svým muridem, a tím ukazuje jeho kvalitu pro rituál Obrácení.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_07");	//Až nastane čas, všichni muridové podstupují řadu obtížných i života nebezpečných zkoušek.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_08");	//A ten jediný, který zůstane živý projde rituálem zasvěcení a stane se bojovníkem Beliara. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_09");	//Já jsem si vybral tebe jako svého murida. Ale ostatní, co vím, svůj výběr ještě neudělali. 
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_10");	//A co když si všichni převorové vyberou toho samého novice?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_11");	//Hmmm. Co vím, to se zatím ještě nikdy nestalo.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_12");	//No, s největší pravděpodobností, jeho osud už bude řešit samotný mistr Haniar Slepý - nejmocnější a nejmoudřejší z nás.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_13");	//A to jak se rozhodne, ví jen samotný Beliar.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_14");	//Rozumím.
	MuridTells = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Mistr Nrozas mi pověděl o rituálu Obrácení vyvolených noviců v řádu stínů, bojovníků bratrstva Masyaf. Každý převor si musí vybrat svého murida, a ti si budou dělat konkurenci mezi sebou. Jestli si všichni převorové vyberou jednoho a toho samého člověka, osud toho murida bude řešit nejmoudřejší z nich - mistr Haniar Slepý.");
};

instance DIA_Ass_128_Nrozas_HasimVine(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_HasimVine_condition;
	information = dia_Ass_128_Nrozas_HasimVine_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_HasimVine_condition()
{
	if(HasimNeedRareWine == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_HasimVine_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_01_01");	//Á, muride! Konečně jsi tu!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_01_02");	//Potřebuji, abys šel do spíže a přinesl mi balíček se sírou a uhlím.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_01_03");	//Tady máš klíč. Ale nic jiného tam neber!
	B_GiveInvItems(self,other,ItKe_PW_Sklad,1);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_01_04");	//Samozřejmě, mistře.
	MIS_NrozasPacket = LOG_Running;
	Log_CreateTopic(TOPIC_NrozasPacket,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NrozasPacket,LOG_Running);
	B_LogEntry(TOPIC_NrozasPacket,"Musím jít do skladu a přinést mistru Nrozasovi balík se sírou a uhlím.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_HasimVine_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_HasimVine_Done_condition;
	information = dia_Ass_128_Nrozas_HasimVine_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem balíček s uhlím.";
};

func int dia_Ass_128_Nrozas_HasimVine_Done_condition()
{
	if((MIS_NrozasPacket == LOG_Running) && (Npc_HasItems(other,ItMi_PacketColesulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_HasimVine_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_Done_01_01");	//Přinesl jsem balíček s uhlím.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_02");	//Dobře. Dej ho sem.
	B_GiveInvItems(other,self,ItMi_PacketColesulfur,1);

	if(Npc_HasItems(other,ItKe_PW_Sklad) >= 1)
	{
		Npc_RemoveInvItems(other,ItKe_PW_Sklad,1);
	};

	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_03");	//Podívejme se. Hmmm... to jsem si i myslel.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_04");	//Toto množství síry mi nestačí pro mé experimenty.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_05");	//Potřebuji ještě tak 20 kusů další síry.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_Done_01_06");	//Kde ji můžu získat, mistře?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_07");	//Tím si nejsem jistý. No, v podhorském průchodu se nacházely malé usazeniny síry.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_08");	//Poohlédni se tam. Nemusíš spěchat. Množství, které jsi mi přinesl mi postačí na nějaký čas.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_Done_01_09");	//Rozumím, mistře.
	NrozasNeedMoreSulfur = TRUE;
	B_LogEntry(TOPIC_NrozasPacket,"Dal jsem mistru Nrozasovi balíček, ale síry je prý nedostatek. Musím nakopat ještě 20 kusů síry. Podle mistra Nrozase se v podhorském průchodu nachází několik sirných usazenin.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_Sulfur_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Sulfur_Done_condition;
	information = dia_Ass_128_Nrozas_Sulfur_Done_info;
	permanent = FALSE;
	description = "Tady je těch dvacet kousků síry.";
};

func int dia_Ass_128_Nrozas_Sulfur_Done_condition()
{
	if((MIS_NrozasPacket == LOG_Running) && (Npc_HasItems(other,ItMi_Sulfur) >= 20) && (NrozasNeedMoreSulfur == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Sulfur_Done_info()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Sulfur_Done_01_01");	//Tady je těch dvacet kousků síry.
	B_GiveInvItems(other,self,ItMi_Sulfur,20);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_02");	//Skvěle. Teď je to úplně o něčem jiném.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_03");	//Takové množství mi pro mé experimenty prozatím postačí.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_04");	//Dobře jsi pracoval, muride. Teď jdi.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_05");	//Jestli tě budu potřebovat, dám ti vědět.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Sulfur_Done_01_06");	//Ano mistře.
	MIS_NrozasPacket = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasPacket,LOG_SUCCESS);
	B_LogEntry(TOPIC_NrozasPacket,"Přinesl jsem síru mistru Nrozasovi. Je velmi nadšený z mé práce.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_condition;
	information = dia_Ass_128_Nrozas_Poison_info;
	permanent = FALSE;
	description = "Něco od tebe potřebuji, mistře.";
};

func int dia_Ass_128_Nrozas_Poison_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_01");	//Něco od tebe potřebuji, mistře.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_02");	//(udiveně) Ode mě? Málokdy slyším, že někdo něco ode mě potřebuje.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_03");	//A co přesně potřebuješ?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_04");	//Mistr Osair mi řekl, že se ti povedlo připravit velmi silný jed.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_05");	//(radostně) Aha. Takže ho to přeci jen zajímá!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_06");	//Ano, proto chce dostat vzorek toho elixíru. Samozřejmě s tvým povolením.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_07");	//Hmm, proč by ne. Ale zpočátku musím otestovat jeho účinky.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_08");	//Jestli něco nebude v pořádku, tak moje reputace v bratrstvu rychle klesne, to určitě chápeš.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_09");	//Nemůžu si to dovolit...
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_10");	//Jistě.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_11");	//Už dávno jsem chtěl poslat pomocníka Kaduina splnit tento úkol.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_12");	//Ale dostal jsem lepší nápad. Uděláš to ty.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_13");	//Pomoz mi vyzkoušet tento jed na nějaké silné příšeře.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_14");	//Mistr Osair pak na znamení mé vděčnosti dostane vzorek tohoto elixíru.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_15");	//Ale musí to být opravdu silná a tuhá zvěř.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_16");	//Například, horský trol. Nebo něco tomu podobného.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_17");	//A nezkoušej ho na otrocích. Toto zbytečné stádo zhyne, jen se toho nadechne.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_18");	//Potřebuji vyhodnotit jeho účinky co nejpodrobněji.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_19");	//Věřím, že ti nemusím připomínat, že potřebuji důkazy o využití mého jedu.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_20");	//Samozřejmě. Všechno jsem pochopil, mistře. Můžeš se na mě spolehnout.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_21");	//Dobře. Tady, vem si tuto lahvičku.
	B_GiveInvItems(self,other,ItMi_NrozasPoison,1);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_22");	//Zacházej s ním opatrně! Jestli teda nechceš být mrtvý...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_23");	//Dobře, nyní jdi. Očekávám tvoji odpověď co nejrychleji.
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Nrozas chce vyzkoušet účinky jeho jedu. Jestli si s tím poradím, dá mi vzorek tohoto jedu pro mistra Osaira. Potřebuju vyzkoušet jeho účinky na nějaké velmi silné potvoře, například na horském trolovi. Ale jak nalákám trola na tu lahvičku s jedem? Možná bych si o tom měl promluvit s Gonzalesem.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_Done_condition;
	information = dia_Ass_128_Nrozas_Poison_Done_info;
	permanent = FALSE;
	description = "Ohledně tvého jedu, mistře...";
};

func int dia_Ass_128_Nrozas_Poison_Done_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (OsairGetsNrozasPoison == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_Done_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_00");	//Ohledně tvého jedu, mistře...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_01");	//Poslouchám. Podařilo se ti ho vyzkoušet?

	if(PoisonDoneFull == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_02");	//Bohužel, nepovedlo se mi to.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_03");	//Cože? Hlupáku! Jak mohly vzniknout s tak jednoduchým úkolem takové potíže?
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_04");	//Ach, zbytečně jsem ti věřil! Co už, dej mi můj jed - a ať tě nemám na očích!
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_05");	//Obávám se, že jed u sebe taky nemám.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_06");	//(nahněvaně) Jak to? A kde je?
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_07");	//Já... omylem jsem ho vylil.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_08");	//Cože? Máš mě za idiota?
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_09");	//No, tohle ti jen tak neprojde!
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Jak jsem očekával, Nrozas je rozzuřený. Teď mi jen zbývá bojovat s celým bratrstvem.");
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else if(PoisonDoneHalf == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_10");	//Jak jsi mi přikázal. Otestoval jsem ho na mladém horském trolovi.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_11");	//Hmm... Lepší by bylo ho vyzkoušet na dospělém člověku, ale to nevadí.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_12");	//A co se stalo poté?
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_13");	//Trol okamžitě zemřel.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_14");	//A kde jsou důkazy?

		if(Npc_HasItems(other,ItAt_TrollPoisonTongue) >= 1)
		{	
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_15");	//Tady je jeho jazyk.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_16");	//Hmm... Ano, to opravdu vypadá, že zemřel na otravu.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_17");	//No, výtečná práce! Jako vždy, jsi mě nepodvedl.
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_18");	//A jak s tou menší dávkou jedu pro mistra Osaira?
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_19");	//(zvědavě) Můj jed ti náhodou nezůstal?
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_20");	//Prosím, odpusť mi, mistře. Využil jsem totiž všechen jed, který byl v lahvičce.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_21");	//Dobrá. Jak jsem sliboval, mistr Osair dostane ten jed.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_22");	//Potřebuji však trochu času, abych udělal další.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_23");	//To zabere zhruba den. Takže přijď zítra.
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_24");	//Jak si přeješ, mistře.
			DayOsairPoisonReady = Wld_GetDay();
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Jak jsem očekával, mistr Nrozas byl šťastný z mého úspěchu. Teď mi jen zbývá počkat, než uvaří nový jed. Pak ho můžu odnést mistru Osairovi.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_25");	//Ehm... nemám je.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_26");	//(rozhněvaně) Jak je to možné? Myslím, že jsem ti řekl, abys přinesl důkazy o účincích jedu!
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_27");	//Nebo se mě pokoušíš podvést?
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_28");	//Ne, v žádném případě se o to nepokouším.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_29");	//Víš, že se mi nelíbí, když se mé příkazy neplní přesně do puntíku.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_30");	//Také nemůžu vystát, když ze mě někdo má za hlupáka!
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_31");	//Takže mi odpusť...
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Nrozas byl rozzuřen, protože jsem mu nepřinesl důkazy o účinku jedu. Moje nedbalost mě teď může stát život.");
			PlayerIsPrioratFakeTemp = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		};
	}
	else if(PoisonDoneOneTear == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_32");	//Bohužel, nepodařilo se mi to udělat.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_33");	//Cože?! Tupče! Jak mohly vzniknout s tak jednoduchým úkolem takové potíže? 
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_34");	//Ach, zbytečně jsem ti věřil! Co už, dej mi moji lahvičku s jedem - a ať tě nemám na očích!
		
		if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
		{	
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_35");	//Tady je.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_36");	//(rozdrážděně) Alespoň je můj jed celý. Dobrá, teď jdi pryč!
			PlayerSafeFromNrozasNo = TRUE;
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Nrozas byl rozčilený, protože se mi nepovedlo otestovat jeho jed. Chvála Innosovi, hlavu mám stále na místě.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_37");	//Nemám ho.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_38");	//Jak to?! A kde je?
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_39");	//Nepamatuju si, kam jsem ho dal.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_40");	//Hmmm...(zuří) Děláš ze mě hlupáka?
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_41");	//Tohle ti jen tak neprojde...
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Nrozas je rozzuřený. Nevrátil jsem mu jed, protože ho nemám. Teď mi zbývá jen bojovat s celým bratrstvem.");
			PlayerIsPrioratFakeTemp = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		};
	};

	TellNrozasAboutTest = TRUE;
};

instance DIA_Ass_128_Nrozas_Poison_DoneForOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_DoneForOsair_condition;
	information = dia_Ass_128_Nrozas_Poison_DoneForOsair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_Poison_DoneForOsair_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (OsairGetsNrozasPoison == FALSE) && (DayOsairPoisonReady != FALSE) && (DayOsairPoisonReady < daynow))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_DoneForOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_00");	//Počkej. Vem si tuto lahvičku.
	B_GiveInvItems(self,other,ItMi_NrozasPoisonOsair,1);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_01");	//Je v ní dostatek jedu, aby potěšil mistra Osaira.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_02");	//Děkuji ti, mistře.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_03");	//No jo, tak už jdi.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison_NoDone(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_NoDone_condition;
	information = dia_Ass_128_Nrozas_Poison_NoDone_info;
	permanent = FALSE;
	description = "Ohledně tvého jedu, mistře...";
};

func int dia_Ass_128_Nrozas_Poison_NoDone_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == FALSE) && (OsairGetsNrozasPoison == FALSE) && ((NoTrollPoison == TRUE) || (TrollSeeMe == TRUE)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_NoDone_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_00");	//Ohledně tvého jedu, mistře...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_01");	//Poslouchám tě. Povedlo se ti otestovat můj jed?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_02");	//Bohužel, nezvládl jsem to.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_03");	//Cože? Hlupáku! Jak mohly vzniknout s tak jednoduchým úkolem takové potíže?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_04");	//Ach, zbytečně jsem ti věřil! Co už, dej mi ten jed - a zmiz mi z očí!
		
	if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
	{	
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_05");	//Tady to je.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_06");	//(rozdrážděně) Aspoň mám ten jed celý. Tak a teď zmiz!
		PlayerSafeFromNrozasNo = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Nrozas byl rozčilený, protože se mi nepovedlo otestovat jeho jed. Chvála Innosovi, hlavu mám stále na místě.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_07");	//Nemám ho.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_08");	//Jak to?! A kde je?
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_09");	//Nepamatuju si, kam jsem ho dal.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_10");	//Hmmm...(rozhněvaně) Děláš si ze mě blázny?
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_11");	//Noo, to ti tak lehko neprojde...
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Nrozas je rozzuřený. Nevrátil jsem mu jed, protože ho nemám. Teď mi zbývá jen bojovat s celým bratrstvem.");
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};

	TellNrozasAboutTest = TRUE;
};

instance DIA_Ass_128_Nrozas_PoisonGiveOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PoisonGiveOsair_condition;
	information = dia_Ass_128_Nrozas_PoisonGiveOsair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PoisonGiveOsair_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_PW_PoisonNrozas == LOG_Success) && (OsairGetsNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PoisonGiveOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonGiveOsair_01_01");	//Jak sis mohl dovolit dát můj jed mistru Osairovi bez mého povolení?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonGiveOsair_01_02");	//Za tuto drzost zemřeš v mukách, o kterých se ti ani nezdálo.
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_128_Nrozas_PoisonTellOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PoisonTellOsair_condition;
	information = dia_Ass_128_Nrozas_PoisonTellOsair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PoisonTellOsair_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_PW_PoisonNrozas == LOG_Success) && (OsairTellNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PoisonTellOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_01");	//Počkej!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_02");	//Řekni mi: nejsi náhodou ty ten zrádce, který mluvil o mém neúspěchu s jedem?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_03");	//Ne, já to nebyl.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_04");	//Zkoušíš mě tady oblbnout?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_05");	//Já na sto procent vím, že jsi to byl TY! Nikdo jiný to být nemůže.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_06");	//Teď v bratrstvu o mně mluví jako o nějakém vychloubajícím se nemehlu.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_07");	//Tak to zkus dokázat.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_08");	//(rozzuřeně) Cože? Ty drzej pse! Teď ti vyjmu srdce a nakrmím s ním šakaly!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_09");	//Nemyslím si, že se podobný přístup bude líbit ostatním převorům.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_10");	//Beliar tě vem! Máš sice pravdu, no mám jiný způsob jak umlčet tvá lživá ústa... 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_11");	//Proto tě vyzývám na duel Pravdy! Mistr Haniar nás rozsoudí.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_12");	//Co to je?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_13");	//Je to jednoduché. Budeš muset dokázat svoji pravdu v boji proti mně, nebo zemřeš se svou lží na jazyku.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_14");	//Budu tě čekat u arény bratrstva. Doufám, že máš dostatek odvahy se tam ukázat. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_16");	//A jestli ne, tak moji bratři si tě najdou a udělají s tebou to, o čem se ani Beliarovi nezdálo!
	MIS_TrueBattle = LOG_Running;
	Log_CreateTopic(TOPIC_TrueBattle,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrueBattle,LOG_Running);
	B_LogEntry(TOPIC_TrueBattle,"Za mou lež mě mistr Nrozas vyzval na duel Pravdy. Teď vše závisí jen na mně.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_128_Nrozas,"TrueBattle");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TrueBattle");
	Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
};

instance DIA_Ass_128_Nrozas_TrueBattle(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 2;
	condition = dia_Ass_128_Nrozas_TrueBattle_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Running) && (NrozasStartTrueBattle == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_01_00");	//Za chvíli se budeš topit ve své krvi, prašivej pse!
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_TrueBattle_Ready(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_TrueBattle_Ready_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_Ready_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_Ready_condition()
{
	if((MIS_TrueBattle == LOG_Running) && (Npc_GetDistToWP(hero,"PW_HANIAR_DEATHMATCH") <= 500) && (NrozasStartTrueBattle == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_Ready_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_00");	//Vidím, že máš dostatek odvahy na to se tu ukázat.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_01");	//Tak se podíváme, jestli je tvůj meč tak stejně dobrý, jako tvůj plesnivý jazyk.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_02");	//A ještě jedna věc... jestli překročíš hranici arény, tak prohraváš! To pro tebe znamená smrt.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_03");	//Teď zemřeš, šerednej pse!
	NrozasStartTrueBattle = TRUE;
	AI_StopProcessInfos(self);
	Wld_SendTrigger("EVT_TRUEBATTLE_DEATHMATCH");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_TrueBattle_Repeat(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_TrueBattle_Repeat_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_Repeat_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_Repeat_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NrozasStartTrueBattle == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_Repeat_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Repeat_01_01");	//Pojď sem, ty podlý šakale!
	NrozasStartTrueBattle = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_Poison_KillNrozas(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_KillNrozas_condition;
	information = dia_Ass_128_Nrozas_Poison_KillNrozas_info;
	permanent = FALSE;
	description = "Mistr Osair ti posílá láhev vína, mistře.";
};

func int dia_Ass_128_Nrozas_Poison_KillNrozas_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && ((Npc_HasItems(hero,ItFo_BeliarTear) >= 1) || (Npc_HasItems(hero,ItFo_BeliarTear_Haniar) >= 1)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_KillNrozas_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_00");	//Mistr Osair ti posílá láhev vína, mistře.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_01");	//Je to vděk za tvůj jed.

	if(HaniarGetGift == FALSE)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItFo_BeliarTear,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
		B_LogEntry(TOPIC_NrozasPoisonGift,"Doručil jsem láhev vína, kterou mistr Osair chtěl předat mistru Nrozasovi.");
	}
	else
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ItFo_BeliarTear_Haniar,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear_Haniar,1);
		B_LogEntry(TOPIC_NrozasPoisonGift,"Doručil jsem láhev vína, kterou mistr Osair chtěl předat mistru Nrozasovi - tak jak po mně chtěl mistr Haniar.");
	};
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_02");	//(diví se) Nevěřím svým očím! Není to Slza Beliara?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_03");	//Nevyznám se moc ve vínech.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_04");	//(nedbale) To je patrné. Slza Beliara - to není jen tak nějaké víno.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_05");	//Je podobné božskému nektaru! Takové nápoje pijí jen vyvolení!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_06");	//Dokonce sám Zuben by záviděl...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_07");	//Mistr Osair zjevně uznal můj geniální nápad, když mi dal takový drahý dárek.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_08");	//Dobrá, je to přeci pití a ne žádný hřích! Nemám pravdu?
	MIS_NrozasPoisonGift = LOG_Success;
	Log_SetTopicStatus(TOPIC_NrozasPoisonGift,LOG_Success);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WineDrink");
};

instance DIA_Ass_128_Nrozas_PRETEACH(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 10;
	condition = DIA_Ass_128_Nrozas_PRETEACH_Condition;
	information = DIA_Ass_128_Nrozas_PRETEACH_Info;
	permanent = FALSE;
	description = "Můžu se od tebe něco naučit, mistře?";
};

func int DIA_Ass_128_Nrozas_PRETEACH_Condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_PRETEACH_Info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PRETEACH_01_00");	//Můžu se od tebe něco naučit, mistře?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PRETEACH_01_01");	//Samozřejmě. Můžu tě naučit tajemstvím největšího umění - alchymii.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PRETEACH_01_02");	//Ale budeš potřebovat nějaké zkušenosti pro osvojení.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PRETEACH_01_03");	//Jinak z našich pokusů nic nevyjde.
	NrozasTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Mistr Nrozas mě bude učit umění alchymie.");
};

instance DIA_Ass_128_Nrozas_TEACH(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 10;
	condition = DIA_Ass_128_Nrozas_TEACH_Condition;
	information = DIA_Ass_128_Nrozas_TEACH_Info;
	permanent = TRUE;
	description = "Nauč mě alchymii, mistře.";
};

func int DIA_Ass_128_Nrozas_TEACH_Condition()
{
	if(NrozasTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_TEACH_Info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_TEACH_01_00");	//Nauč mě alchymii, mistře.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TEACH_01_01");	//Dobře. Co chceš umět?

	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
	Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,Dialog_Back,DIA_Ass_128_Nrozas_TEACH_BACK);

	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ass_128_Nrozas_TEACH_HEALTH_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Ass_128_Nrozas_TEACH_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Ass_128_Nrozas_TEACH_Health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Ass_128_Nrozas_TEACH_Perm_Health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ass_128_Nrozas_TEACH_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Ass_128_Nrozas_TEACH_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Ass_128_Nrozas_TEACH_Mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Ass_128_Nrozas_TEACH_Perm_Mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Elixír síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Ass_128_Nrozas_TEACH_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Elixír obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Ass_128_Nrozas_TEACH_Perm_DEX);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ass_128_Nrozas_TEACH_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Elixír výdrže",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),DIA_Ass_128_Nrozas_TEACH_perm_stamina);
	};
};

func void DIA_Ass_128_Nrozas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_perm_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

instance Ass_129_DeadNrozas_PreHALLO(C_Info)
{
	npc = Ass_129_DeadNrozas;
	nr = 1;
	condition = Ass_129_DeadNrozas_PreHALLO_condition;
	information = Ass_129_DeadNrozas_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int Ass_129_DeadNrozas_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void Ass_129_DeadNrozas_PreHALLO_info()
{
	Snd_Play("MYSTERY_04");
	AI_StopProcessInfos(self);
};

var int NrozasTeachMakePoison;

instance DIA_Ass_128_Nrozas_TeachPoisonMake(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 10;
	condition = DIA_Ass_128_Nrozas_TeachPoisonMake_Condition;
	information = DIA_Ass_128_Nrozas_TeachPoisonMake_Info;
	permanent = FALSE;
	description = "Můžu se od tebe naučit něco speciálního, co umíš jen ty?";
};

func int DIA_Ass_128_Nrozas_TeachPoisonMake_Condition()
{
	if(NrozasTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_TeachPoisonMake_Info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_00");	//Můžu se od tebe naučit něco speciálního, co umíš jen ty?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_01");	//Hmmm (oceňujíc) jak sis možná všiml, můj koníček - je příprava různých jedů.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_02");	//V tom se mi nikdo nevyrovná, protože jakýkoliv můj jed je uměleckým dílem.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_03");	//Mužu ti ukázat, jak mužeš udělat ty nejprostější z nich.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_04");	//Nebo tě mužu naučit otrávit jedem čepel nebo šípy.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_05");	//Ale budeš u toho muset dávat velký pozor.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_06");	//Jakákoli chyba tě totiž muže při tvých experimentech zabít.
	NrozasTeachMakePoison = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Mistr Nrozas mě muže naučit připravovat jedy. Také mi ukáže, jak otrávit jedem čepel nebo šípy.");
};

instance DIA_Ass_128_Nrozas_TeachPoison(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 800;
	condition = dia_Ass_128_Nrozas_TeachPoison_condition;
	information = dia_Ass_128_Nrozas_TeachPoison_info;
	permanent = TRUE;
	description = "Nauč mě zacházet s jedy.";
};

func int dia_Ass_128_Nrozas_TeachPoison_condition()
{
	if((NrozasTeachMakePoison == TRUE) && ((PoisonArrowKnow == FALSE) || (PoisonBladeKnow == FALSE) || (MakePoisonKnow == FALSE)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TeachPoison_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_01_01");	//Nauč mě zacházet s jedy.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_01_02");	//Co bys chtěl umět?
	Info_ClearChoices(DIA_Ass_128_Nrozas_TeachPoison);
	Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,Dialog_Back,DIA_Ass_128_Nrozas_TeachPoison_BACK);
	
	if(PoisonArrowKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Nauč mě dělat otrávené šípy. (VB: 5, cena: 2500 zlatých)",DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow);
	};
	if(PoisonBladeKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Nauč mě otrávit zbraň jedem. (VB: 5, cena: 3000 zlatých)",DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade);
	};
	if(MakePoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Nauč mě připravovat jedy. (VB: 3, cena: 1500 zlatých)",DIA_Ass_128_Nrozas_TeachPoison_MakePoison);
	};
	if(ResistPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Nauč mě odolnosti vůči jedům. (VB: 10, cena: 3000 zlatých)",DIA_Ass_128_Nrozas_TeachPoison_Resist);
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_BACK()
{
	Info_ClearChoices(DIA_Ass_128_Nrozas_TeachPoison);
};

func void DIA_Ass_128_Nrozas_TeachPoison_Resist()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Constantino_TeachPoison_Resist_01_00");	//Nauč mě odolnosti vůči jedům.

	kosten = 10;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_01");	//Omlouvám se, ale na to ještě nemáš dost zkušeností!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_02");	//Omlouvám se, ale zadarmo to dělat nebudu!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_03");	//Jed je špatný. Zvlášt pokud se ti dostal do těla.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_04");	//Musíš se ujistit, že tvoje tělo jed co nejdříve rozloží.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_05");	//Musíš být neustále v pohybu a hodně se potit. Pak ti jed neublíží.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Naučeno: Odolnost proti jedu");
		ResistPoisonKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_00");	//Nauč mě dělat otrávené šípy.

	kosten = 5;
	money = 2500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01");	//Nemáš dostatek zkušeností!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02");	//Nemáš dost zlata!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_03");	//Potřebuješ jed a několik šípů.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_04");	//Opatrně namočíš konec šípu do lahvičky.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_05");	//Ruka se nesmí třást. Proto nespěchej.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Naučeno: Výroba otrávených šípů");
		PoisonArrowKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro výrobu OTRÁVENÝCH ŠÍPŮ: dvacet šípů a lahvička s jedem.");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_00");	//Nauč mě otrávit zbraň jedem.

	kosten = 5;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01");	//Nemáš dostatek zkušeností.
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02");	//Nemáš dost zlata!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_03");	//Především potřebuješ jed a zbraň.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_04");	//Nepotápěj celou čepel do jedu.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_05");	//Na špičku čepele nanes tenkou vrstvu.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_06");	//Dávej pozor, ať se nepořežeš!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Naučeno: Otrávení zbraně");
		PoisonBladeKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro otrávení zbraně: čepel a lahvička s jedem.");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_MakePoison()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_00");	//Nauč mě dělat jedy!

	kosten = 3;
	money = 1500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01");	//Nemáš dostatek zkušeností!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02");	//Nemáš dost zlata!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_03");	//Ve skutečnosti - výroba jedu není moc odlišná od výroby obyčejných léčivých lektvarů.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_04");	//Potřebuješ recept a ingredience.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_05");	//Opatrně smícháš vše najednou. Jakmile se směs stane lepkavá - je vše hotové.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Naučeno: Alchymie - 'Jed'");
		MakePoisonKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro JED: láhev vody, tráva z bažin a kusadla pavouka nebo žihadlo krvavé mouchy.");
	
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};