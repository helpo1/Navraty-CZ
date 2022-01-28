
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = None_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Co tady děláš?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && (Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Doufám, že co nejdřív připluje loď, kterou bych si mohl pronajmout.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Tohleto kolem mě mi vážně už začíná lézt na nervy.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Slyšel jsem, že hledáš lidi na svou loď?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//A?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Jdu do toho!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"V přístavní krčmě se se mnou dal do řeči bývalý námořník Mario, který se chce opět dostat na loď.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Proč bych tě měl s sebou brát?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Proč bych tě měl s sebou brát?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Prostě proto, že mě potřebuješ.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jsem... Byl jsem poručíkem v královském námořnictvu.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Sloužil jsem jako námořník na Králi Rhobarovi a Chloubě Myrtany.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//V bitvě o Východní souostroví jsem jednou rukou poslal zpátky do Beliarovy říše dva tucty skřetů.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Bohužel poté, co potopili naší vlajkovou loď, nás zbylo příliš málo a museli jsme se stáhnout.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "Tak proč jsi tady?";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Tak proč jsi tady?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flotila je poražená a truhla se žoldem prázdná.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Když mě propustili, zůstal jsem trčet v téhle díře. Tak hledám nějakou další práci.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Co umíš?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co umíš?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jsem zkušený námořník a válečník, navíc dokážu slušně zacházet s lodním dělem.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Určitě bych tě pár věcí dokázal naučit, než doplujeme k cíli.
	B_LogEntry(Topic_Crew,"Vypadá to, že Mario je ve věcech námořních docela zběhlý. Možná by se se mnou mohl o pár zkušeností podělit.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "Co za to chceš?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Co za to chceš?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Co bych chtěl? Budu rád, že odsud vypadnu.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Plácneme si. Já ti pomůžu a ty mě odsud dostaneš.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Ta cesta může být nebezpečná.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Ta cesta může být nebezpečná.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Na nebezpečí jsem zvyklý. Když jsi na moři, je každý den nebezpečný.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Příští bouře může být tvoje smrt a příšery z hlubin dokáží spolknout celou loď jako malinu.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//A o skřetích galérách snad ani mluvit nemusím, že? Věř mi, nenajde se nic, čeho bych se bál. Námořník, který se bojí, je už předem mrtvý.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "K ničemu bys mi nebyl.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//K ničemu bys mi nebyl.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Jsem nejlepší námořník, kterého tady můžeš sehnat.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Stačí se na tebe podívat a hned je jasné, že o navigaci nevíš, co by se za nehet vešlo.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Takže radši všechno dvakrát zvaž, než budeš někomu věřit.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Dobří pomocníci se vždycky hodí.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Dobří pomocníci se vždycky hodí.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Jasná věc, uvidíme se na lodi.
	B_GivePlayerXP(XP_Crewmember_Success);
	Mario_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Přece jenom bys mi k ničemu nebyl!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Přece jenom bys mi k ničemu nebyl!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak je libo. Víš, kde mě najít!
	Mario_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "Přece jenom bys mi k něčemu mohl být!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if(((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Přece jenom bys mi k něčemu mohl být!
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Věděl jsem to! Uvidíme se na lodi!
		Mario_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		AI_StopProcessInfos(self);
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Takhle se ke mně chovat nesmíš. Vykuchám tě!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = None_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return C_Beklauen(71,220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

//---------------------------epicheskiy danzh------------------------------------------------

instance DIA_NONE_1813_Ilesil_EXIT(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 999;
	condition = DIA_NONE_1813_Ilesil_EXIT_Condition;
	information = DIA_NONE_1813_Ilesil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1813_Ilesil_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1813_Ilesil_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_Job(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Job_Condition;
	information = DIA_NONE_1813_Ilesil_Job_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Job_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Job_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Job_15_00");	//No, no... Další ztracená duše. Co tady hledáš, cizinče?
};

instance DIA_NONE_1813_Ilesil_WhoYou(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhoYou_Condition;
	information = DIA_NONE_1813_Ilesil_WhoYou_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_NONE_1813_Ilesil_WhoYou_Condition()
{
	return TRUE;
};

func void DIA_NONE_1813_Ilesil_WhoYou_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_00");	//Kdo jsi a co tady hledáš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_01");	//Moje jméno zní Ile'Sil. Hledám zde odpovědi stejně jako ty.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_02");	//Jak dlouho je hledáš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_03");	//To nevím. Od chvíle, kdy jsem se sem dostal, se čas téměř zastavil.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_04");	//Vím, že to zní velmi divně, ale sám se brzy můžeš přesvědčit.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_05");	//Vlastně jsem neměl v úmyslu zůstat tady moc dlouho.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_06");	//Zrovna jsi přišel a už chceš jít? Obávám se, že tě zklamu, odsud jen tak neodejdeš.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_07");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_08");	//Odsud není cesta!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_09");	//(pro sebe) Vypadá to, že jsem se do toho znova zamotal.
};

instance DIA_NONE_1813_Ilesil_WhatPlace(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhatPlace_Condition;
	information = DIA_NONE_1813_Ilesil_WhatPlace_Info;
	permanent = FALSE;
	description = "Co to je za místo?";
};

func int DIA_NONE_1813_Ilesil_WhatPlace_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhatPlace_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhatPlace_15_00");	//Co to je za místo?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_01");	//Nevím o něm o moc víc než ty.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_02");	//Ale kdybych ho měl popsat nazval bych ho, příbytek ztracených duší.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhatPlace_15_03");	//A proč zrovna tak?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_04");	//Ten, kdo se sem dostane navždy bude uvězněn v kruhu událostí tohoto světa. A jeho duše bude navždy odsouzena zde bloudit.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhatPlace_15_05");	//Ale ty jsi zde už dlouho, nebo ne?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_06");	//Když jsi upoután an jednom místě, tak to není důležitý. Neptej se mě na to, stejně ti nemám co říct.
};

instance DIA_NONE_1813_Ilesil_WhyNotRun(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhyNotRun_Condition;
	information = DIA_NONE_1813_Ilesil_WhyNotRun_Info;
	permanent = FALSE;
	description = "A ty ses nezkoušel odsud dostat?";
};

func int DIA_NONE_1813_Ilesil_WhyNotRun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhyNotRun_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_00");	//A ty ses nezkoušel odsud dostat?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_01");	//Zkoušel. Ale jenom jedenkrát. Došel jsem až na úroveň toho velkého kamene.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_02");	//A co potom?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_03");	//Potom, jsem prostě umřel. Vzpomínám, něco velkého vyběhlo z poza toho kamene přímo na mě.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_04");	//A pak už jen tma. A neskutečná bolest po celém těle!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_05");	//Znamená to, že jsi duch?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_06");	//To sám nevím, kdo jsem. Ale možná ty, mě pomůžeš najít odpověď na mojí otázku.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_07");	//Možná, ale slíbit ti to nemůžu.
};

instance DIA_NONE_1813_Ilesil_WhyComeHere(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhyComeHere_Condition;
	information = DIA_NONE_1813_Ilesil_WhyComeHere_Info;
	permanent = FALSE;
	description = "Proč jsi sem přišel?";
};

func int DIA_NONE_1813_Ilesil_WhyComeHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhyComeHere_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_00");	//Proč jsi sem přišel?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_01");	//Nejsem zde ze své vůle, to všechno můj šílený bratr!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_02");	//Měl jsi bratra?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_03");	//Jmenoval se Il-Kirit, byli jsme lovci.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_04");	//Když nás všechny zachvátil strach a propuklo hromadné šílenství, řekl, že zná místo kde se můžeme schovat.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_05");	//Počkej, o jakém druhu šílenství to mluvíš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_06");	//Ach ano... Vždyť od té doby uplynulo tolik času, a ty samozřejmě nemůžeš vědět, co se tenkrát přihodilo.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_07");	//Ale nyní bych to rád věděl.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_08");	//Takže začnu od úplného začátku. Stejně není kam pospíchat. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_09");	//To místo odkud jsi přišel, bylo kdysi překrásné údolí, Adaros.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_10");	//V něm žilo mnoho lidí, kteří uctívali Adana, boha vody a rovnováhy. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_11");	//Podle slov našich kněží, to bylo místo kde on poprvé vstoupil na zem lidí. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_12");	//A potom Adanos požehnal zemi i lidem žijícím v údolí.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_13");	//Něco z toho už znám a co bylo dál?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_14");	//Jednoho krásného dne naši zemi zaplavily hordy strašlivých příšer a nemrtvých.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_15");	//Nevím kdo nebo co toho bylo příčinou, ale bylo to strašlivé období! Zemřelo opravdu mnoho lidí.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_16");	//Aby mě nepotkal stejný osud, tak mě můj bratr vzal sem.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_17");	//Z počátku toto místo připomínalo chrám, podobný těm, co jsme sami stavěli.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_18");	//Ale jak jsme se tam dostali, ze všech stran na nás vylezli neviditelné bytosti.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_19");	//Bili jsme se jak to jen šlo, ale v jeden moment jsme zjistili, že nemáme kam ustoupit.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_20");	//A v tu chvíli můj bratr uviděl v rohu místnosti, něco jako magický portál.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_21");	//Neměli jsme na výběr. Oba jsme do něj vběhli a tak jsem se ocitnul na tomhle místě.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_22");	//Ale bylo pozdě když jsem pochopil, že všechna ta stvoření, co napadli naše údolí, k nám přišli přes tento portál.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_23");	//Ale kdo to mohl tenkrát vědět.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_24");	//A co tvůj bratr?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_25");	//Nebyl tady. A tak jsem se rozhodl ho jít hledat.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_26");	//Ale to jen do té doby než jsem se dostal k tomu velkému kameni. Tam to skončilo stejně jako můj život.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_27");	//Od té doby jsem ztratil naději, že zjistím co se stalo s mým bratrem.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_28");	//A bojím se, že už se to nikdy nedovím. Od té doby uplynulo již tolik času...
};

instance DIA_NONE_1813_Ilesil_SeekBro(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_SeekBro_Condition;
	information = DIA_NONE_1813_Ilesil_SeekBro_Info;
	permanent = FALSE;
	description = "Mohl bych se po tvém bratru podívat.";
};

func int DIA_NONE_1813_Ilesil_SeekBro_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhyComeHere) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhyNotRun) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhatPlace) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_SeekBro_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_00");	//Mohl bych se po tvém bratru podívat.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_01");	//Ty mě nabízíš pomoc? To je úctyhodné.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_02");	//Ale tohle místo je velmi nebezpečné, na každém kroku zde na tebe dýchá smrt!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_03");	//Musel jsem se vypořádat i s horšíma. A ty mě přeci pomůžeš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_04");	//Jak jen budu moci. Ale bojovat se všema těma potvorama na tomto ostrově budeš muset sám.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_05");	//A co tě drží na tomto místě?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_06");	//Už velmi dlouhou dobu, mě nějaká magická síla spoutává k tomuto místu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_07");	//Těžko se to vysvětluje, ale cítím to v celém těle, když se snažím někam pohnout.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_08");	//A protože zde musím zůstat, tak tě můžu jenom sledovat. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_09");	//Když se ti podaří dostat hluboko do středu ostrova, možná tam najdeš řešení mého problému.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_10");	//A pak můžem pokračovat v pátrání společně.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_11");	//Nu dobrá. A jak tvůj bratr vypadal? Pověz mi něco, podle čeho bych ho poznal.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_12");	//V momentu našeho odloučení měl loveckou zbroj z kůže pantera a chitinový meč, který mu dal náš otec před tím než zemřel.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_13");	//To je vše, na co si vzpomínám.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_14");	//Dobře, budu si to pamatovat. Budu doufat, že kromě tvého bratra najdu i cestu z tohodle ostrova.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_15");	//Nerad bych zde zůstal na věčnost.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_16");	//Jsi velmi statečný chlapík. Doufám, že štěstí bude na tvé straně.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_17");	//Vezmi si tento amulet. On tě ochrání od smrtelného nebezpečí zdejšího kraje.
	B_GiveInvItems(self,other,ItMi_IlisilAmulet,1);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_18");	//Děkuji a teď už musím jít.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_19");	//Dávej na sebe pozor.
	EpicJorneyStart = TRUE;
	MIS_Miss_Brother = LOG_Running;
	Log_CreateTopic(TOPIC_Miss_Brother,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Miss_Brother,LOG_Running);
	B_LogEntry(TOPIC_Miss_Brother,"Po průchodu tajným portálem, jsem se setkal s neobvyklým duchem jménem Ile'Sil. Vyprávěl mi svůj příběh, jak on a jeho bratr Il-Kirit se snažili uniknout tímto portálem před monstry, které je pronásledovali. Nicméně, během teleportace se navzájem ztratili a on neví co je s jeho bratrem. Rozhodl jsem se pomoci mu s hledáním bratra, nebo alespoň toho, co z něj zbylo. Kromě toho, musím najít způsob, jak se dostat ven z tohoto místa, poněvadž podle Ile'Sila, to není možné.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PaleCrawler,"LOSTVALLEY_PALECRAWLER");
};

instance DIA_NONE_1813_Ilesil_FirstBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_FirstBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_FirstBossDown_Info;
	permanent = FALSE;
	description = "Vypadá to, že to monstrum co tě napadlo to už má za sebou.";
};

func int DIA_NONE_1813_Ilesil_FirstBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (PaleCrawlerIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_FirstBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_00");	//Vypadá to, že to monstrum co tě napadlo to už má za sebou.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_01");	//Opravdu? A co to bylo za zvíře?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_02");	//Něco jako důlní červ, jen mnohem nebezpečnější než jeho příbuzní.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_03");	//Kdo by si to pomyslel... Jsi opravdu dobrý bojovník, když sis s ním poradil.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_04");	//Kdo ví - možná tu je ještě nějaká šance na úspěch.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_05");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_06");	//Tobě se podaří odsud dostat a já možná najdu svého bratra a moje duše dojde klidu.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_07");	//Rozumím, tak já už zase půjdu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_08");	//Dobrá, tak buď ostražitý. Jsem si jistý, že ten důlní červ není nic proti tomu co tě čeká.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_09");	//Uvidíme.
	ReadyForBoss2 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Ile'Sil byl povzbuzen tím, že jsem byl schopen zabít monstrum co ho napadlo. Nicméně varoval mě, že přijdou mnohem těžší zkoušky.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(AraharPlague,"LOSTVALLEY_ARAHARPLAGUE");
};

instance DIA_NONE_1813_Ilesil_SecondBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_SecondBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_SecondBossDown_Info;
	permanent = FALSE;
	description = "Podívej co jsem našel.";
};

func int DIA_NONE_1813_Ilesil_SecondBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (AraharPlagueIsDead == TRUE) && (Npc_HasItems(other,ItMi_ArahArEye_Unknown) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_SecondBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_00");	//Podívej co jsem našel.
	B_GiveInvItems(other,self,ItMi_ArahArEye_Unknown,1);
	Npc_RemoveInvItems(self,ItMi_ArahArEye_Unknown,1);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_01");	//Zajímavý předmět... Vypadá to trochu jako něčí oko. Kde jsi to našel?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_02");	//Zdá se, že patřil mocnému lichovi, který střežil něco na hřbitově nedaleko odtud.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_03");	//A tuhle věc měl ve své truhle.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_04");	//Musíme předpokládat, že to neměl schovaný jen tak. Že to mělo nějaký důvod.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_05");	//A ty dokážeš zjistit jaký?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_06");	//Možná. Být nemrtví někdy dává své výhody. Někdy jsme schopni vidět to, co živý ne.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_07");	//Tak se na to podívej pozorně a zkus mě říct jestli něco neobjevíš.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_08");	//Zkusím to, ale bude to chvíli trvat. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_09");	//No, času máme dost tak nemusíš spěchat. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_10");	//A co budeš dělat ty?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_11");	//Podívám se na ten hřbitov, možná tam najdu ještě něco zajímavého.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_12");	//Dobře a já se podívám na to oko.
	ReadyForBoss3 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Přinesl jsem Ile'Silovi podivný předmět, vypadal jako oko, našel jsem ho v truhle Liche. Ile'Sil slíbil, že se pokusí zjistit, co to je. Ale bude to nějakou dobu trvat. Raději se porozhlédnu kolem starého hřbitova. Možná budu mít štěstí a najdu něco zajímavého.");
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_ThirdBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_ThirdBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_ThirdBossDown_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_ThirdBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (LookAtDemonAltar == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_ThirdBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_01");	//A to jsi ty... už jsem na tebe čekal.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_02");	//Něco nového?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_03");	//Začni ty. Co se ti podařilo zjistit?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_04");	//Nic zvláštního. Nedaleko hřbitova jsem našel starý magický oltář. A pár přízraků co ho chránili.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_05");	//A jak vypadal?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_06");	//Byl celý posetý starověkými runami, a ve středu měl takové kruhové vybrání, jako obětní miska.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_07");	//To je vše?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_08");	//Ano. A co je s tím okem?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_09");	//Co jsem zjistil, tak tento předmět je vlastně klíč. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_11");	//Aspoň podle vzpomínek, které se mě podařilo získat, o tom svědčí.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_12");	//Jestli je to klíč - to znamená, že musí existovat zámek. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_13");	//Neber vše tak doslova. To co jsem měl na mysli, znamená spíš, že tento předmět má vliv na okolní objekty.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_14");	//Dobře a co s tím budeme teď dělat?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_15");	//Říkal jsi, že jsi našel nějaký obětní oltář. Zkus tu věc použít na něj.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_16");	//Možná to k něčemu bude.
	B_GiveInvItems(self,other,ItMi_ArahArEye,1);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_17");	//A jestli ne?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_18");	//Tak budeme pátrat dál.
	ReadyForBoss4 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Ile'Sil měl zvláštní pohled a žádal mě, abych oko použil na oltář, hlídaný duchy. Doufám, že to k něčemu bude.");
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_IsFree(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_IsFree_Condition;
	information = DIA_NONE_1813_Ilesil_IsFree_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_IsFree_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (LookAtDemonAltar == TRUE) && (SoulKeeperIsDead == TRUE) && (IlesilIsFree == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_IsFree_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_01");	//Vidím, že se ti přece jen podařilo nějak mě osvobodit z pout magie.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_02");	//Zřejmě - teď už jsi tady. Jak se cítíš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_03");	//Lépe, mnohem lépe. Poslední roky pobytu na tomto místě bylo prostě nesnesitelné.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_04");	//A teď v jediném momentu to skončilo. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_05");	//Osvobodil jsem tvoji duši, ale to asi nebude stačit, abych tě navrátil mezi živé.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_06");	//I tak jsi pro mě udělal hodně. Za což jsem ti velmi vděčný.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_07");	//Pojď nebudeme se rozptylovat zdvořilostmi.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_08");	//Musíme se nějak odsud dostat. Napadá tě něco?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_09");	//Hmm... Tohle místo smrdí prokletím. Velmi silným a velmi zlým!
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_10");	//Domnívám se, jestli se nám podaří najít jeho zdroj, najdeme odpověď na tuto otázku.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_11");	//A co tvůj bratr? Je tady něco co by nám pomohlo v pátrání? 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_12");	//Ne. Nic takového.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_13");	//Dobře. Tak co dál?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_14");	//Počkej, trochu se porozhlédnu...
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_15");	//Dobře, máme trochu času.
	IlesilCount = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Ile'Silova duše je volná, a teď se může bezpečně pohybovat po celém ostrově. Nyní se musíme rozhodnout, co dělat dál. Ile'Sil požádal o trochu času, aby se porozhlédl.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SearchPlace");
};

instance DIA_NONE_1813_Ilesil_Move(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Move_Condition;
	information = DIA_NONE_1813_Ilesil_Move_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Move_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (IlesilCountDone == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Move_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_01");	//Tak co, našel jsi něco?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_02");	//Vidíš ten chrám na hoře?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_03");	//Temná magie tohoto místa pochází odtamtud.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_04");	//Jak to víš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_05");	//Já to nevím, já to cítím. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_06");	//Tak nebudem ztrácet čas a vydáme se tam.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_07");	//Pravda, je to jediné co nám zbývá. Buď připravený. Cesta tam bude střežená.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_08");	//To se uvidí, jdeme!
	ReadyForBoss5 = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Musíme se dostat do chrámu ve středu ostrova, odkud se temná magie šíří po celém ostrově.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowTemple");
};

instance DIA_NONE_1813_Ilesil_FireCave(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_FireCave_Condition;
	information = DIA_NONE_1813_Ilesil_FireCave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_FireCave_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (ReadyForBoss5 == TRUE) && (Npc_GetDistToWP(self,"WDS_LAVA_CEMETRY_07") < 1000))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_FireCave_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_01");	//Ty tudy neprojdeš.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FireCave_15_02");	//To jsem už zjistil. A co budeme dělat? 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_03");	//Vidíš ten malý oltář vedle mříží, jsem přesvědčen, že je to klíč ke vstupu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_04");	//Zkus s ním něco udělat. Uvidíme co se stane.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_05");	//Budu tě čekat na druhé straně průchodu. Jak vidíš být duchem se někdy hodí.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	WaitForHero = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Cestu blokovala masivní mřížka. Ile'Sil mi poradil používat oltář, který je umístěn vedle ní. Bude na mě čekat na opačné straně průchodu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitForHero");
};

instance DIA_NONE_1813_Ilesil_NextMove(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_NextMove_Condition;
	information = DIA_NONE_1813_Ilesil_NextMove_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_NextMove_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (FiarasIsDead == TRUE) && (FiarasHeartInPlace == TRUE))
	{
		if((Hlp_GetHeroStatus() != HERO_THREATENED) && (Hlp_GetHeroStatus() != HERO_FIGHTING))
		{
			return TRUE;
		};
	};
};

func void DIA_NONE_1813_Ilesil_NextMove_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_01");	//Vidím, že se ti podařilo dostat se sem.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_NextMove_15_02");	//Co to je za místo?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_03");	//Nevím, ale připomíná mě Druidský kruh. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_NextMove_15_04");	//Ale Druidové tu nejsou. Místo nich plno nemrtvých.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_05");	//Ať to bylo cokoli, toto místo má velmi silnou magickou auru. Myslím, že musíme pátrat tady, než budeme pokračovat dál.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_NextMove_15_06");	//Podle mě ztrácíme čas. Chrám je už blízko!
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_07");	//Možná máš pravdu, ale něco mi napovídá, že bychom to místo měli prozkoumat.
	SearchCircle = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Po projití podhorským průchodem jsem se opět setkal s Ile'Silem. Čekal na mě na poněkud podivném místě. Podle něj má silnou magickou auru. Ile'Sil navrhoval se zde porozhlédnout. Pro mě je to ztráta času, i když radu ducha stojí poslechnout...");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InspectCircle");
};

instance DIA_NONE_1813_Ilesil_EnterHram(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_EnterHram_Condition;
	information = DIA_NONE_1813_Ilesil_EnterHram_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_EnterHram_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (EkronIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_EnterHram_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_01");	//Tvůj boj s tou horou dřeva... to bylo něco neuvěřitelného.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_02");	//Po pravdě řečeno jsem tak trochu doufal v tvou pomoc.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_03");	//Odpusť mi můj příteli... Ale co zmůže prostý duch proti takové koncentraci nenávisti a hněvu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_04");	//A k tomu jsem součástí tohoto místa a nedokážu dlouho odolávat jeho vůli.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_05");	//Pravda, zapomněl jsem na to. Co je před námi?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_06");	//Jsme téměř v chrámu. Ale vstup blokují mocní duchové.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_07");	//Cítím je. Cítím jejich bolest, strach i nenávist! Už tě čekají.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_08");	//Tak je nenecháme čekat.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_09");	//Mimochodem, není divné, že cestou jsme ještě nezjistili nic o tvém bratrovi?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_10");	//Máš pravdu... Ale myslím, že odpověď je blízko. Možná leží v tomto chrámu.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_11");	//Znamená to, že se tam musíme podívat.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_12");	//Jiné cesty u nás není.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_13");	//Dobře, tak jdem.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_14");	//Ty běž... já zůstanu zde. A budu tě sledovat.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_15");	//A proč?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_16");	//Nemůžu se přiblížit k těm přízrakům. Když mě uvidí pochopí co se děje.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_17");	//A to bude můj konec. Pozřou mou duši a mé kosti se změní v prach.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_18");	//Tak tady počkej, za chvíli jsem zpět.
	B_LogEntry(TOPIC_Miss_Brother,"Už jsme téměř v chrámu. Podle Ile'Sila, je vchod střežen několika mocnými duchy. Ile'Sil se neodvažuje přiblížit k nim, neboť ho můžou zničit. To znamená, že zase bude muset dělat všechnu práci sám...");
	ReadyForBoss6 = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Skeleton_Bro_Dex,"LV_SKELETON_DEX_01");
	Wld_InsertNpc(Skeleton_Bro_Str,"LV_SKELETON_STR_01");
	Wld_InsertNpc(Skeleton_Bro_Mag,"LV_SKELETON_MAG_01");
};

instance DIA_NONE_1813_Ilesil_OpenHram(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHram_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHram_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHram_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (SkelBrosFightWin == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHram_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_01");	//Přesto jsme se dostali do chrámu, už jsem nedoufal, že se nám to podaří.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHram_15_02");	//Příliš brzy jsem se radoval. Teď se tam musí nějakým způsobem dostat. Napadá tě něco?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_03");	//Nejprve bych se zaměřil na tyto kamenné přepínače.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHram_15_04");	//Je jich zde hodně.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_05");	//A nejspíš se musí otočit ve správném pořadí.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHram_15_06");	//A v jakém přesně? 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_07");	//Tak to nevím. Musíš to zjistit sám, snad budeš mít štěstí...
	StartLvStory = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Vstup do chrámu blokovali pevné tyče. Podle Ile'Sila, ho lze otevřít pomocí kamenných přepínačů umístěných na malé plošině v přední části chrámu. To mě dřív praskne hlava, než pochopim, v jakém pořadí je aktivovat.");
	AI_StopProcessInfos(self);
};

var int NeedIlesilStory;
var int HintIlesilDone;

instance DIA_NONE_1813_Ilesil_OpenHramHint(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHint_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHint_Info;
	permanent = FALSE;
	description = "(prozkoumat pulpit)";
};

func int DIA_NONE_1813_Ilesil_OpenHramHint_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (StartLvStoryFR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_15_01");	//Vidíš ty staré pulpity umístěné po celém chrámovém nádvoří? Na každém z nich jsou divné nápisy.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_15_02");	//(zamyšleně) Možná je to stopa, která pomůže otevřít vchod do chrámu. Pověz mi, co je v nich napsáno?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_15_03");	//A to přesně, do posledního slova. V opačném případě nepochopíme jejich přesný význam.
	Info_ClearChoices(DIA_NONE_1813_Ilesil_OpenHramHint);

	if((LV_Story_01 == TRUE) && (LV_Story_02 == TRUE) && (LV_Story_03 == TRUE) && (LV_Story_04 == TRUE) && (LV_Story_05 == TRUE) && (LV_Story_06 == TRUE))
	{
		Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHint,"Tak poslouchej...",DIA_NONE_1813_Ilesil_OpenHramHint_Yes);
	};

	Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHint,"Bohužel jsem je ještě nepřečetl do konce.",DIA_NONE_1813_Ilesil_OpenHramHint_No);
};

instance DIA_NONE_1813_Ilesil_OpenHramHintAgain(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHintAgain_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHintAgain_Info;
	permanent = TRUE;
	description = "Co se týká těch nápisů...";
};

func int DIA_NONE_1813_Ilesil_OpenHramHintAgain_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (StartLvStoryFR == TRUE) && (NeedIlesilStory == TRUE) && (HintIlesilDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHintAgain_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHintAgain_15_01");	//Co se týká těch nápisů...
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintAgain_15_02");	//Přečetl jsi je všechny?
	Info_ClearChoices(DIA_NONE_1813_Ilesil_OpenHramHintAgain);

	if((LV_Story_01 == TRUE) && (LV_Story_02 == TRUE) && (LV_Story_03 == TRUE) && (LV_Story_04 == TRUE) && (LV_Story_05 == TRUE) && (LV_Story_06 == TRUE))
	{
		Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHintAgain,"Tak poslouchej...",DIA_NONE_1813_Ilesil_OpenHramHint_Yes);
	};

	Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHintAgain,"Bohužel jsem je ještě nepřečetl do konce.",DIA_NONE_1813_Ilesil_OpenHramHint_No);
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_Yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_01");	//To je všechno, co tam bylo napsáno.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_02");	//(zamyšleně) Pradávní dokázali dobře skrýt pravý význam slov.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_03");	//Trvalo by ti věčnost rozluštit tuto hádanku. Ale já ti s tím pomůžu.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_04");	//To by bylo dobrý.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_05");	//Jinak každý z těchto kamenných přepínačů označuje jednu světovou stranu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_06");	//A text je vodítkem k jejich aktivaci.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_07");	//Tady se musím malinko zamyslet... dej mě trochu času.
	B_LogEntry(TOPIC_Miss_Brother,"Ile'Sil potřebuje nějaký čas, aby dekódoval tyto tajné spisy Pradávných. Doufám, že bude úspěšný.");
	HintIlesilDone = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TransText");
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_No()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_No_15_01");	//Bohužel jsem je ještě nepřečetl do konce.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_No_15_02");	//Takže ti nemohu pomoci.

	if(NeedIlesilStory == FALSE)
	{
		B_LogEntry(TOPIC_Miss_Brother,"Musím přečíst všechny nápisy na pradávných pulpitech, aby mě Ile'Sil mohl vysvětlit jejich smysl.");
		NeedIlesilStory = TRUE;
	};

	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_OpenHramHintDone(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHintDone_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHintDone_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHramHintDone_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (HintIlesilDone == TRUE) && (IlesilCountNextDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHintDone_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_01");	//Myslím, že jsem se naučil něco z toho, co je zapsáno v pulpitech.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_02");	//Kámen, který je nejblíže k mříži ukazuje k severu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_03");	//Ale první v pořadí označuje jiho-východ.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_04");	//Třetí na jiho-západ, pátý jasně ukazuje na sever, a osmý na jih.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_05");	//Pořadí dalších kamenů budeš muset zjistit sám.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_06");	//No, alespoň něco. Děkuju.
	B_LogEntry(TOPIC_Miss_Brother,"Podle Ile'Sila nejbližší kámen od mříží ukazuje na sever, ale první v pořadí označuje jiho-východ. Třetí - na jiho-západ, pátý - na sever a osmý - na jih. Zbytek kamenů a jejich pořadí musím zjistit sám...");
};

instance DIA_NONE_1813_Ilesil_OpenHramDone(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramDone_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramDone_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHramDone_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (OpenHramDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramDone_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_01");	//Mříž chrámu je otevřena, už zbývá jen prozkoumat chrám.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramDone_15_02");	//Ty se mnou nepůjdeš?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_03");	//Zůstanu venku, toto místo je pro mě příliš nebezpečné.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramDone_15_04");	//Mluvíš, jako bys mohl znovu umřít.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_05");	//Poté, co jsi mi vrátil zpět mou duši, po tolika letech zatracení a nesmyslné existenci, jsem znovu dostal chuť do života.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_06");	//A nechci ji znovu ztratit...
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramDone_15_07");	//Rozumím ti. Dobře, zůstaň zde a já půjdu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_08");	//Hodně štěstí, cizinče...
	B_LogEntry(TOPIC_Miss_Brother,"Ile'Sil zůstal mimo chrám, bál se jít dovnitř. Co mám dělat, když se chci odsud dostat. Tak půjdu sám.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Skeleton_Lord_LV,"LOSTVALLEY_CHELDRAK");
};

instance DIA_NONE_1813_Ilesil_Die(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Die_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (FinalDialogeLv == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_01");	//A konečně, po tolika staletí čekání a strádání...
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_15_02");	//Jsi tady?! Ale říkal jsi, že toto místo je pro tebe nebezpečné.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_03");	//Bylo to nebezpečné, pokud byl naživu Chel'Drak.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_04");	//Ale teď, díky tobě jeho duch je mrtvý. To znamená, že mohu uskutečnit to, kvůli čemu jsem sem přišel.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_05");	//A ty mě v tom pomůžeš.
};


instance DIA_NONE_1813_Ilesil_Die_Ans_01(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_01_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_01_Info;
	permanent = FALSE;
	description = "Když už mluvíme o pomoci, máš na mysli svého bratra?";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_01_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_01_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_01");	//Když už mluvíme o pomoci, máš na mysli svého bratra?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_02");	//Ale vždyť jsme ho nenašli.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_03");	//Problém nebyl najít ho, ale dostat se k němu.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_04");	//Co tím chceš říct?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_05");	//Rozhlédni se a pochopíš.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_06");	//Ty zmrzlé ostatky v obětí Beliarovy sochy, to je Il-Kirit.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_07");	//Ale brzy se společně vrátíme. A tvá duše nám v tom pomůže.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_02(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_02_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_02_Info;
	permanent = FALSE;
	description = "Jak ses dozvěděl o Chel'Drakovi?";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_02_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_02_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_01");	//Jak ses dozvěděl o Chel'Drakovi? Vždyť jsi nikdy nebyl v chrámu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_02");	//Tak to je. Pradávní se pečlivě ujistili, že žádný cizinec se sem nedostane.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_03");	//Ale narozdíl od mnohých se to tobě povedlo.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_04");	//A co ti ostatní co se sem chtěli dostat?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_05");	//Věř mi, že jich byla spousta. Ale už jsou dávno mrtví... a ty - no.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_06");	//Zdá se, že bohové jsou ti nakloněni cizinče. To tě však nezachrání.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_07");	//Beliar s radostí přijme tvoji duši do svého náručí - ovšem výměnou za duši mého bratra.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_08");	//Spravedlivá a výhodná výměna, nemám pravdu?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_09");	//Mně to tak nepřipadá.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_03(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_03_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_03_Info;
	permanent = FALSE;
	description = "Kdo vlastně jsi?";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_03_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_01) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_02) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_03_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_01");	//Kdo vlastně jsi?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_02");	//Ten, s kým by bylo se lepší nepotkat.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_03");	//Já a můj bratr Il-Kirit jsme kdysi byli mocnými pány stínů.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_04");	//Po mnoho let jsme oba věrně sloužili Beliarovi. A pak... pak nás ten falešný bůh zradil.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_05");	//Beliar vás zradil, to je mu podobné.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_06");	//Poté, co naše početná armáda zdevastovala posvátné půdy Adana, já a můj bratr, místo slibované odměny, kterou jsme měli obdržet, jsme dostali trvalý exil a zapomnění.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_07");	//A to všechno proto, že Adanos ve své snaze pomstít se Beliarovi byl odhodlán zničit jednoho z jeho vyvolených.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_08");	//Tmavý bůh rozhodl, že můj bratr a já už pro něj nemáme žádnou cenu a prostě nás vydal do Adanových rukou.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_09");	//A proto a za trest, byl můj bratr uvězněný v tomto chrámu a já přišel o duši a poté jsem byl odsouzen k věčnému utrpení.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_10");	//Nic jiného bych od něj ani nečekal. Ale neví jak jste se mohli dostat na náhorní plošinu pradávných.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_11");	//A ještě sebou přivést armádu příšer.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_12");	//Bylo to jednoduché, pomohla nám chamtivost a hloupost samotných Stavitelů.
	B_LogEntry(TOPIC_Miss_Brother,"Ile'Sil nebyl ten, za koho se prohlašoval, že je. On a jeho bratr kdysi sloužili Beliarovi, a na jeho rozkaz zničili národ Stavitelů. A za to je Adanos navždy uvěznil na tomto místě.");
};

instance DIA_NONE_1813_Ilesil_Die_Ans_04(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_04_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_04_Info;
	permanent = FALSE;
	description = "Pověz mě o tom.";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_04_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_03) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_04_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_01");	//Pověz mě o tom.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_02");	//Ve své posvátné zemi Adanos jednou schoval velmi mocný artefakt vytvořený Beliarem pro svého požírače duší - démona Senyaka.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_03");	//Myslíš Beliarův dráp?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_04");	//Ano. On ho daroval jednomu ze svých vyvolených - Er'Hazirovi, aby ho hlídal.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_05");	//Po smrti Er'Hazira byl meč pohřben společně s ním v jednom z Adanových chrámů v údolí.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_06");	//Stavitelé našli tento chrám a vzali Dráp sami, věřili, že jim dává moc a slávu.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_07");	//Ale sami si nedokázali ani představit, k čemu tato zbraň byla určena.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_08");	//Dráp byl nejen silný meč, který může absorbovat duše mrtvých, ale také klíč ke království Beliara!
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_09");	//Poté, co zjistil, že meč je v rukou obyčejných smrtelníků, Beliar využil této příležitosti.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_10");	//Přinutil majitele použít sílu meče, a tím otevřít magický portál, přes který jsme prošli s naší armádou.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_11");	//Když zjistil že byl takto zrazen, Adanos nejprve proklel své oblíbené lidi a potom zcela smyl jejich odkaz z povrchu země.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_12");	//A s pomocí Drápu zapečetil místo, kde jsme teď.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_13");	//Mimochodem, ten meč nyní musí být tvůj. V opačném případě by ses sem nikdy nedostal.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_14");	//Máš pravdu, Dráp mám já.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_15");	//Ale ne na dlouho. Jakmile si vezmu tvoji duši a osvobodím svého bratra najdu pro Dráp lepší využití.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_16");	//No to se ještě uvidí.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_05(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_05_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_05_Info;
	permanent = FALSE;
	description = "Vypadá to, že budu muset dokončit co Adanos začal.";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_05_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_03) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_05_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_01");	//Vypadá to, že budu muset dokončit co Adanos začal.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_02");	//Myslíš, že mě porazíš hlupáku? To je od tebe dost naivní.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_03");	//Dokonce i teď po tolika letech věznění, jsem schopen rozdrtit tě jednou ranou.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_04");	//Tak to vyzkoušej.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_05");	//Agrrrrr...
	AI_StopProcessInfos(self);
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
	IlesilCanFight = TRUE;
};
