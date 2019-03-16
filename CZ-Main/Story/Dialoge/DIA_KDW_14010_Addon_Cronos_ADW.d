
var int crontr;

instance DIA_Addon_Cronos_ADW_EXIT(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 999;
	condition = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	if((MIS_PirateDeal == LOG_Success) && (MIS_EscortToPirate == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_00");	//Počkej chvilku...
		AI_Output(other,self,"DIA_Addon_Cronos_EscortToPirate_01_01");	//Co ještě?!
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_02");	//Pořemýšlel jsem o tom a už jsem se rozhodl, koho poslat k pirátům.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_03");	//Ale pochybuji, že on sám najde cestu do jejich tábora.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_04");	//Proto tě chci požádat, jestli bys ho nedoprovodil. Ty už cestu znáš.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_05");	//Aspoň můžu doufat, že se vrátí v jednom kuse.
		AI_Output(other,self,"DIA_Addon_Cronos_EscortToPirate_01_06");	//Nemůžu ti nic slíbit. Jsou to dost nebezpečná místa.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_07");	//Nicméně se o to musíš pokusit. Je to pro nás všechny velmi důležité.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_08");	//Můj muž se jmenuje Severin.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_09");	//Najdeš ho nedaleko velkého chrámu, který je na druhé straně plošiny.
		MIS_EscortToPirate = LOG_Running;
		Log_CreateTopic(TOPIC_EscortToPirate,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_EscortToPirate,LOG_Running);
		B_LogEntry(TOPIC_EscortToPirate,"Cronos mě požádal, abych vzal jeho člověka do tábora pirátů.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(NDW_8161_Nort,"ADW_ENTRANCE_PLATEAU_15");
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Cronos_ADW_PICKPOCKET(C_Info)
{
	npc =KDW_14010_Addon_Cronos_ADW;
	nr = 900;
	condition = DIA_Addon_Cronos_ADW_PICKPOCKET_Condition;
	information = DIA_Addon_Cronos_ADW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Cronos_ADW_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET,Dialog_Back,DIA_Addon_Cronos_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
};


instance DIA_Addon_Cronos_ADWHello(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_ADWHello_Condition;
	information = DIA_Addon_Cronos_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Ještě že jsi tu. Měli jsme strašný strach.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//Nebylo to tak strašné. Co se stalo?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Měj očí otevřené a meč při ruce, je to tu velmi nebezpečné.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//Některá zvířata jsme předtím nikdy neviděli.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Nedaleko je rozlehlá bažina, může tam být už stovky let.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nebylo dne, kdy na nás bestie z bažiny neútočily.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Varuji tě, buď opatrný kdykoli kolem procházíš.
};

instance DIA_Addon_Cronos_NeedFood(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 2;
	condition = DIA_Addon_Cronos_NeedFood_Condition;
	information = DIA_Addon_Cronos_NeedFood_Info;
	description = "Je něco, co tě trápí?";
};

func int DIA_Addon_Cronos_NeedFood_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_NeedFood_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_00");	//Je něco, co tě trápí?
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_01");	//(Reptání) To si piš. Samozřejmě!
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_02");	//Zatímco ostatní mágové zkoumají kulturu Stavitelů, musím se starat o naléhavější záležitosti.
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_03");	//O co přesně?
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_04");	//Jsem zodpovědný za zásobování této expedice! Proviant, lektvary, zbraně, svítilny - je to všechno na mě.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_05");	//Saturas má v plánu zůstat tady ještě velmi dlouho a naše zásoby vystačí sotva na pár týdnů.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_06");	//A teď si lámu hlavu nad tím, jak zajistit, abychom měli vše, co potřebujeme.
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_07");	//Co potřebuješ?
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_08");	//(Zamyšleně) Do začátku zásoby! Ty věci se shání velmi špatně.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_09");	//V této části ostrova na mrchožrouta nenarazíš. Samé krvavé mouchy a jiné nepoživatelné potvory.
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_10");	//Možná bych vám s tím mohl pomoct? V lovu se opravdu vyznám.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_11");	//Doufal jsem, že to řekneš! Potom, pokud je to možné, přines mi alespoň padesát kusů masa.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_12");	//Na začátek to stačí! Ale je důležité pokusit se vyjednat obchod s piráty.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_13");	//Dohodnuto, určitě budou souhlasit s obchodem s námi. Po tom všem je nepravděpodobné, že by to zlato odmítli. 
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_14");	//Dobře! Seženu maso a pokusím se dohodnout s piráty.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_15");	//Chvála Adanovi! Doufám, že teď máme alespoň o jeden problém méně... (povzdechne si) Podívej se, neříkej o tom Saturasovi!
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_16");	//Věří, že spolupráce s takovými lidmi - není hodna důstojnoti mágů Vody.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_17");	//Ale to neřeší problém, kde já tady seženu jídlo a zásoby.
	MIS_NeedFood = LOG_Running;
	Log_CreateTopic(TOPIC_NeedFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedFood,LOG_Running);
	B_LogEntry(TOPIC_NeedFood,"Cronos potřebuje jídlo aby doplnil zásoby mágů Vody. Požádal mě, abych šel na lov a přivesl nejméně padesát kusů čerstvého masa.");
	MIS_PirateDeal = LOG_Running;
	Log_CreateTopic(TOPIC_PirateDeal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PirateDeal,LOG_Running);
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Cronos chce, abych se dohodnul s piráty o dodávkách zásob pro mágy Vody, jelikož Saturas plánuje zůstat v údolí na poměrně dlouhou dobu.");
};

instance DIA_Addon_Cronos_NeedFood_Done(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 2;
	condition = DIA_Addon_Cronos_NeedFood_Done_Condition;
	information = DIA_Addon_Cronos_NeedFood_Done_Info;
	description = "Máš to maso!";
};

func int DIA_Addon_Cronos_NeedFood_Done_Condition()
{
	if((MIS_NeedFood == LOG_Running) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 50))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_NeedFood_Done_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_Done_01_00");	//Máš to maso! Jak jsem tě požádal - padesát kusů.
	B_GiveInvItems(other,self,ItFoMuttonRaw,50);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,50);
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_Done_01_01");	//Výborně! Aspoň teď nebudeme umírat hlady.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_Done_01_02");	//Tady, vem si tyto magické nápoje za odměnu.
	B_GiveInvItems(self,other,ItPo_Mana_02,3);
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_Done_01_03");	//Víc ti teď dát nemůžu.
	MIS_NeedFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_NeedFood,LOG_Success);
	B_LogEntry(TOPIC_NeedFood,"Získal jsem pro Cronose potřebné potraviny.");
};

instance DIA_Addon_Cronos_PirateDeal_Done(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 2;
	condition = DIA_Addon_Cronos_PirateDeal_Done_Condition;
	information = DIA_Addon_Cronos_PirateDeal_Done_Info;
	description = "Pokud jde o dodávky zásob...";
};

func int DIA_Addon_Cronos_PirateDeal_Done_Condition()
{
	if((MIS_PirateDeal == LOG_Running) && (PirateDealOk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_PirateDeal_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Cronos_PirateDeal_Done_01_00");	//Pokud jde o dodávky zásob...
	AI_Output(other,self,"DIA_Addon_Cronos_PirateDeal_Done_01_01");	//Podařilo se mi dohodnou se s piráty.
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_02");	//Dobrá zpráva! Právě včas. Naše zásoby jsou téměř u konce.
	AI_Output(other,self,"DIA_Addon_Cronos_PirateDeal_Done_01_03");	//Takže, jejich kapitán Greg tě pověřil, abys poslal člověka do jejich tábora, který podrobně projedná harmonogram a objem dodávek.
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_04");	//Dobře, pošlu jednoho z našich lidí. Ale nezapomeň, Saturasovi o tom ani slovo!
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_05");	//Tady, vem si tyto svitky a lektvary jako odměnu za svoji práci.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItPo_Perm_Health,1);
	CreateInvItems(other,ItPo_Health_02,3);
	CreateInvItems(other,ItSc_Icebolt,2);
	CreateInvItems(other,ItSc_ThunderBall,1);
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_06");	//Myslím, že to by ti mělo vynahradit tvoje problémy.
	MIS_PirateDeal = LOG_Success;
	Log_SetTopicStatus(TOPIC_PirateDeal,LOG_Success);
	B_LogEntry(TOPIC_PirateDeal,"Cronos byl spokojen s tím, že jsem se byl schopen dohodnout s piráty.");
};

instance DIA_Addon_Cronos_Escort_Done(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_Escort_Done_Condition;
	information = DIA_Addon_Cronos_Escort_Done_Info;
	description = "Přivedl jsem Severina do tábora pirátů.";
};

func int DIA_Addon_Cronos_Escort_Done_Condition()
{
	if(MIS_EscortToPirate == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_Escort_Done_Info()
{
	KronosKnowEscort = TRUE;
	AI_Output(other,self,"DIA_Addon_Cronos_Escort_Done_01_00");	//Přivedl jsem Severina do tábora pirátů.
	AI_Output(self,other,"DIA_Addon_Cronos_Escort_Done_01_01");	//Dobře! Teď už jen musíme počkat na první dodávky.
};

instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "Víš něco nového ohledně kamenných strážců?";
};

func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Víš něco nového ohledně kamenných strážců?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Část jsme jich zneškodnili.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stojí jako kamenné sochy a za boha se nepohnou.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Vzhled dokáže oklamat. Ocitneš-li se moc blízko, zaútočí na tebe!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//O tom nejsou pochybnosti. Zdroj jejich síly musí být někde tady v okolí.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Pojďme obchodovat.";
};

func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};

var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};
	if((hero.guild == GIL_KDW) && (CRONTR == FALSE))
	{
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC1,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC2,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC3,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC4,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC5,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC6,1);
		CRONTR = TRUE;
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


instance DIA_ADDON_CRONOS_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = dia_addon_cronos_adw_prayforgomez_condition;
	information = dia_addon_cronos_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};

func int dia_addon_cronos_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_ADW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Cronos_ADW_PrayForGomez_01_02");	//Promluv si se Saturasem.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_CRONOS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = dia_addon_cronos_adw_duringritual_condition;
	information = dia_addon_cronos_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cronos_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

//---------------------------Nort--------------------------------------------------------

instance DIA_NDW_8161_Nort_EXIT(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 999;
	condition = DIA_NDW_8161_Nort_EXIT_Condition;
	information = DIA_NDW_8161_Nort_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NDW_8161_Nort_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NDW_8161_Nort_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NDW_8161_Nort_Hello(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 1;
	condition = DIA_NDW_8161_Nort_Hello_Condition;
	information = DIA_NDW_8161_Nort_Hello_Info;
	permanent = FALSE;
	description = "Zdravím! Poslal mně Cronos.";
};

func int DIA_NDW_8161_Nort_Hello_Condition()
{
	if(MIS_EscortToPirate == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_NDW_8161_Nort_Hello_Info()
{
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_00");	//Zdravím! Poslal mně Cronos.
	AI_Output(self,other,"DIA_NDW_8161_Nort_Hello_01_01");	//Vynikající... (zívání) Pak jste ten, kdo mě má doprovodit do tábora pirátů.
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_02");	//Ve skutečnosti jsem zde jen pro.
	AI_Output(self,other,"DIA_NDW_8161_Nort_Hello_01_03");	//Pak nebudeme ztrácet čas, příteli! Jdu za tebou.
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_04");	//Dobře! hlavně se drž nablízku, aby tě nesežrali nějaké potvory.
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_05");	//Cronos mě nepochválí, jestli se ti něco stane.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowPir");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_09");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_2_CANYON_02");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_09");
	Wld_InsertNpc(Spider,"ADW_ENTRANCE_2_PIRATECAMP_16");
	Wld_InsertNpc(Spider,"ADW_PIRATECAMP_WAY_SPAWN_01");
};

instance DIA_NDW_8161_Nort_InCamp(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 1;
	condition = DIA_NDW_8161_Nort_InCamp_Condition;
	information = DIA_NDW_8161_Nort_InCamp_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NDW_8161_Nort_InCamp_Condition()
{
	if((MIS_EscortToPirate == LOG_Running) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_04") <= 1000) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NDW_8161_Nort_InCamp_Info()
{
	B_GivePlayerXP(400);
	AI_Output(self,other,"DIA_NDW_8161_Nort_InCamp_01_01");	//Výborně! Už vidím jejich tábor. Myslím, že příště už dojdu sám.
	AI_Output(self,other,"DIA_NDW_8161_Nort_InCamp_01_02");	//Děkuji za doprovod.
	AI_Output(other,self,"DIA_NDW_8161_Nort_InCamp_01_03");	//Nemáš za co.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_EscortToPirate = LOG_Success;
	Log_SetTopicStatus(TOPIC_EscortToPirate,LOG_Success);
	B_LogEntry(TOPIC_EscortToPirate,"Doprovodil jsem Severina do tábora pirátů.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PirateCamp");
};

instance DIA_NDW_8161_Nort_Perm(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 1;
	condition = DIA_NDW_8161_Nort_Perm_Condition;
	information = DIA_NDW_8161_Nort_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_NDW_8161_Nort_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_EscortToPirate == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_NDW_8161_Nort_Perm_Info()
{
	if(KronosKnowEscort == FALSE)
	{
		AI_Output(self,other,"DIA_NDW_8161_Nort_Perm_01_00");	//Na tvém místě bych řekl Cronosovi, že jsme v pořádku dorazily.
	}
	else
	{
		AI_Output(self,other,"DIA_NDW_8161_Nort_Perm_01_01");	//Teď ne!
	};

	AI_StopProcessInfos(self);
};