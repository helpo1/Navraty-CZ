
instance DIA_Addon_Lares_Patch(C_Info)
{
	npc = VLK_449_Lares;
	nr = 99;
	condition = DIA_Addon_Lares_Patch_Condition;
	information = DIA_Addon_Lares_Patch_Info;
	description = "(žádat zlomek z ornamentu)";
};


func int DIA_Addon_Lares_Patch_Condition()
{
	if(Npc_HasItems(self,ItMi_Ornament_Addon_Vatras) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Patch_Info()
{
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
};


instance DIA_Lares_Kap1_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap1_EXIT_Condition;
	information = DIA_Lares_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_HaltsMaul(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_HaltsMaul_Condition;
	information = DIA_Addon_Lares_HaltsMaul_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_HaltsMaul_Condition()
{
	if((Lares_HaltsMaul == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_HaltsMaul_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Uvidíme se později v docích.
	AI_StopProcessInfos(self);
};


instance DIA_Lares_PICKPOCKET(C_Info)
{
	npc = VLK_449_Lares;
	nr = 900;
	condition = DIA_Lares_PICKPOCKET_Condition;
	information = DIA_Lares_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lares_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET,Dialog_Back,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};


instance DIA_Lares_HALLO(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Lares_HALLO_Condition;
	information = DIA_Lares_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_HALLO_Condition()
{
	if((RangerMeetingRunning == 0) && (KAPITELORCATC == FALSE) && (Npc_CanSeeNpc(self,hero) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lares_HALLO_Info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Já musím být blázen. Co tady děláš?

	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (SkipMeet == TRUE))
	{
		B_GivePlayerXP(500);
		ComeThrowSea = TRUE;
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Ty jsi sem PŘIPLAVAL?!
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//Je to jediná cesta, jak obejít stráže u brány!
		B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,1);
	}
	else if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (SkipMeet == FALSE))
	{
		B_GivePlayerXP(300);
	}
	else
	{
		B_GivePlayerXP(100);
	};
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Neviděli jsme se už?",DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO,"Hej, Laresi, ty starej pardále!",DIA_Lares_HALLO_YES);
};

func void DIA_Lares_HALLO_NO()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//My už jsme se viděli?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Chlape, to si mě vážně nepamatuješ? Poflakoval jsem se kolem Novýho tábora.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Seznam pro doly... Chlape, užili jsme si spolu spoustu srandy. Pamatuješ si Leeho?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Samozřejmě, že si pamatuju na Leeho!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee?",DIA_Lares_HALLO_NOIDEA);
};

func void DIA_Lares_HALLO_YES()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej, Laresi, ty starej mizero, jak ses sem dostal?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Podařilo se mi utýct z Hornickýho údolí právě včas. Spolu s Leem a ještě několika dalšíma chlapama.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pamatuješ si přece Leeho, ne?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Samozřejmě, že si pamatuju na Leeho!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee?",DIA_Lares_HALLO_NOIDEA);
};

func void B_Lares_AboutLee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Tak s ním jsem se dostal z kolonie. Hned po zničení bariéry.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Je se svejma klukama na Onarově farmě.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Má s tím farmářem dohodu. On se svými chlapci brání farmu a Onar je na oplátku živí.
};

func void DIA_Lares_HALLO_LEE()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Samozřejmě, že si pamatuju na Leeho!
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DIA_Lares_HALLO_NOIDEA()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Ty ses trochu praštil, co? Lee byl velitelem žoldáků v Novém táboře.
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};


instance DIA_Addon_Lares_Vatras(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Vatras_Condition;
	information = DIA_Addon_Lares_Vatras_Info;
	description = "Vatras mě poslal!";
};

func int DIA_Addon_Lares_Vatras_Condition()
{
	if(Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Vatras_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras mě poslal. Říkal, že bys mi mohl pomoct.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//(překvapeně) Ty už ses setkal s Vatrasem. Jistě jsi na něj udělal dojem.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//On by ti jinak jistě mé jméno nedal. Obzvláště dokud se nevyřeší případ s mizením lidí.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Dobrá, co potřebuješ?
	Lares_RangerHelp = TRUE;
	if(GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine(BAU_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine(Greg_NW,"Taverne");
	};
};


instance DIA_Addon_Lares_WhatAreYouGuys(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information = DIA_Addon_Lares_WhatAreYouGuys_Info;
	description = "Co máš na práci s Vatrasem?";
};


func int DIA_Addon_Lares_WhatAreYouGuys_Condition()
{
	if((Lares_RangerHelp == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WhatAreYouGuys_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Co máš na práci s Vatrasem?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//Řekněmě, že mám malou dohodu s mágy Vody. Stačí?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Jakou dohodu?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//Pracujeme pro ně a oni se starají, abychom se nedostali do průseru, však to znáš z trestanecké kolonie.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//Mluvíš o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//(překvapeně) Co o tom víš?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras mi o něm řekl.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Proč ses o tom nezmínil už na začátku našeho rozhovoru?
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Lares patří ke 'Kruhu Vody'.");
};


instance DIA_Addon_Lares_Ranger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Ranger_Condition;
	information = DIA_Addon_Lares_Ranger_Info;
	description = "Řekni mi víc o 'Kruhu Vody'.";
};


func int DIA_Addon_Lares_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//Řekni mi víc o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//'Kruh' je mágům Vody tím, čím jsou paladinové mágům Ohně.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//Narozdíl od paladinů 'Kruh' raději stojí v pozadí.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//'Kruh' je mocnou zbraní proti nebezpečím, která hrozí lidem v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Ale můžeme pracovat pouze pokud nikdo neví, kdo ke 'Kruhu' patří.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Prostě o tom nemluv!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Jasně.
	B_LogEntry(TOPIC_Addon_RingOfWater,"'Kruh' je pro mágy Vody jako to, co jsou paladinové pro mágy Ohně, jen 'Kruh' pracuje tajně. Mimo to, nikdo by neměl vědět, kdo tam PATŘÍ. Proto zůstává jejich síla skryta.");
};


instance DIA_Addon_Lares_WannaBeRanger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_WannaBeRanger_Condition;
	information = DIA_Addon_Lares_WannaBeRanger_Info;
	description = "Rád bych se připojil ke 'Kruhu Vody'...";
};


func int DIA_Addon_Lares_WannaBeRanger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ranger) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//Rád bych se připojil ke 'Kruhu Vody'...
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//To zní dobře. Nicméně, o tom rozhodují mágové Vody.
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Aha.",DIA_Addon_Lares_WannaBeRanger_BACK);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Tak co obnáší být členem 'Kruhu'?",DIA_Addon_Lares_WannaBeRanger_HowIsIt);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Cos udělal ty, abys zaujal mágy Vody?",DIA_Addon_Lares_WannaBeRanger_AboutYou);
};

func void DIA_Addon_Lares_WannaBeRanger_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Aha.
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
};

func void DIA_Addon_Lares_WannaBeRanger_AboutYou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Cos udělal ty, abys zaujal mágy Vody?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Chránil jsem je dlouho, zatímco jsme žili ještě v bariéře.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//(usmívá se) A je určitě ještě mnoho důvodů, aby mi byli vděční.
};

func void DIA_Addon_Lares_WannaBeRanger_HowIsIt()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//Tak co obnáší být členem 'Kruhu'?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//My jsme velice odlišní od ostatních obvyklých cechů, které můžeš najít v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Jakmile jsi jedním z nás, už si nemůžeš dělat, co bys chtěl.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Nejdůležitější je držet hubu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Pracujeme skrytě, neodhaleni. Ostatní neví, kdo k nám patří.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Budeme tě sledovat. Pak uvidíme.
};

func void B_Lares_Geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Brzy bude tajné setkání v Orlanově hostinci.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//Přijď hned, jakmile budeš moci. Dostaneš tam své vybavení.	
};


instance DIA_Addon_Lares_RingBack(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack_Condition;
	information = DIA_Addon_Lares_RingBack_Info;
	description = "Nyní jsem členem 'Kruhu Vody'.";
};

func int DIA_Addon_Lares_RingBack_Condition()
{
	if((SC_IsRanger == TRUE) && (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Nyní jsem členem 'Kruhu Vody'.

	if((Lares_GotRingBack == FALSE) && (SC_GotLaresRing == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Skvělé! Můžu nyní dostat svůj akvamarínový prsten?

		if(B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Jistě. Tady je.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Doufám, že ti bude užitečný. Rád vidím, že jsi nyní jedním z nás.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP(XP_Ambient);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Dobře, se mnou se ti teď nic nestane.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Neztrať ho! Stále ho potřebuji.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Nyní bys určitě rád dostal nové vybavení do svých rukou, že? 
	B_Lares_Geheimtreffen();
	B_LogEntry(TOPIC_Addon_RingOfWater,"Lares mě pozval na tajné setkání 'Kruhu Vody' do Orlanova hostince.");
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
};

instance DIA_Addon_Lares_RingBack2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack2_Condition;
	information = DIA_Addon_Lares_RingBack2_Info;
	description = "Tady je tvůj akvamarínový prsten.";
};

func int DIA_Addon_Lares_RingBack2_Condition()
{
	if((SC_IsRanger == TRUE) && (Npc_HasItems(other,ItRi_Ranger_Lares_Addon) >= 1) && (Lares_GotRingBack == FALSE) && (SC_GotLaresRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack2_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Toto je tvůj akvamarínový prsten.
	B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//No. Máš štěstí. Už jsem myslel, že jsi ho ztratil.
	Lares_GotRingBack = TRUE;
};

instance DIA_Addon_Lares_Geduld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Geduld_Condition;
	information = DIA_Addon_Lares_Geduld_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition()
{
	if((RangerMeetingRunning == LOG_Running) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Geduld_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Počkej chvíli. Stále čekáme na některé další členy.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GetRangerArmor(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_GetRangerArmor_Condition;
	information = DIA_Addon_Lares_GetRangerArmor_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GetRangerArmor_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") < 200) && (RangerMeetingRunning == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GetRangerArmor_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//Takže můj mladý příteli, jsme tu proto abychom oslavili tvůj vstup do společnosti 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Tihle chlápci nyní na tebe budou dohlížet a starat se o tebe.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Ne všichni členové 'Kruhu Vody' dorazili. Tak buď opatrný.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Bez ohledu na tvé úspěchy či neúspěchy - budeme o tom vědět.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Nyní ti také dám tvou zbroj.
	CreateInvItem(hero,ITAR_RANGER_Addon);
	AI_EquipArmor(hero,ITAR_RANGER_Addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Nos ho s pýchou, ale neukazuj se v něm ve městě nebo jiných veřejných lokalitách.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Pamatuj, naše společenství nesmí být prozrazeno. Nikdo nesmí vědět, že patříš do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nikdo nemluví o 'Kruhu Vody'. To je první a nejdůležitější pravidlo. Nezapomeň.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Nějaké další otázky?
	JOINWATERRING = TRUE;
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Musím už jít.",DIA_Addon_Lares_GetRangerArmor_end);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"A jak mi můžeš pomoci?",DIA_Addon_Lares_GetRangerArmor_Learn);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Co zbraně?",DIA_Addon_Lares_GetRangerArmor_weapons);
};

func void DIA_Addon_Lares_GetRangerArmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//Co zbraně?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//Hůl je zbraň 'Kruhu'. Ale každý může používat jakou zbraň chce.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Zde je tvá zbraň, nikdy jsem ji ve skutečnosti nepoužil. Možná ti poslouží lépe.
	CreateInvItems(self,ItMw_RangerStaff_Addon,1);
	B_GiveInvItems(self,other,ItMw_RangerStaff_Addon,1);
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_09_03");	//A co nějaká lepší zbroj?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_04");	//Tahle zbroj, co jsem ti dal je dobrá. Spolehlivě tě ochrání, nosíme ji všichni. Ale pokud bys chtěl lepší...(přemýšlí)
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_05");	//V Khorinisu, mezi čtvrtí mistrů a přístavem je jeden z našich členů, jmenuje se Carl.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_06");	//Je to kovář. Už ses s ním pravděpodobně setkal, promluv si o tom s ním. Možná ti s tím pomůže.
	RANGERCARL = TRUE;
};

func void DIA_Addon_Lares_GetRangerArmor_end()
{
	B_MakeRangerReadyToLeaveMeetingALL();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Musím už jít.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Dobře, nechceme tě zdržovat.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//Běž za Vatrasem a on ti dá první úkol.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//Členové 'Kruhu', vraťte se ke svým povinnostem.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Banditi ještě nepřestali útočit. Musíme vyřešit tento problém.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Nechť Adanos udrží rovnováhu světa.
	Lares_TakeFirstMissionFromVatras = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,Dialog_Ende,DIA_Addon_Lares_GetRangerArmor_weiter);
};

func void DIA_Addon_Lares_GetRangerArmor_weiter()
{
	B_LogEntry(TOPIC_Addon_RingOfWater,"Dostal jsem svou zbroj na tajném setkání 'Kruhu Vody' v Orlanově hostinci. Měl bych nyní jít za Vatrasem pro svůj první úkol jako člen 'Kruhu'.");
	AI_StopProcessInfos(self);
	B_RangerMeetingParking();
};

func void DIA_Addon_Lares_GetRangerArmor_Learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//A jak mi můžeš pomoci?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//Můžu ti pomoci zlepšit se v obratnosti.
	if(Npc_IsDead(Sld_805_Cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Jestli chceš zlepšit své schopnosti v boji se zbraněmi nablízko, promluv si s Cordem. On je pán meče.
	};
	if(Npc_IsDead(BAU_961_Gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gann tě naučí, jak získat ze zvěře trofeje.
	};
	if(Npc_IsDead(Mil_350_Addon_Martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Jestli chceš vědět více o paladinech, promluv si s Martinem.
	};
	if(Npc_IsDead(BAU_4300_Addon_Cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn tě naučí, jak se plížit a boji s jednoručními zbraněmi. Také tě naučí zacházet s lukem.
	};
	if(Npc_IsDead(BAU_970_Orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Promluv si s Orlanem, pokud zde budeš chtít strávit noc.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//A jestli tě zajímá magie, můžeš se na něco zeptat Vatrase.
};


instance DIA_Addon_Lares_Teleportstation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Teleportstation_Condition;
	information = DIA_Addon_Lares_Teleportstation_Info;
	description = "Už jsi někdy použil teleport?";
};


func int DIA_Addon_Lares_Teleportstation_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SCUsed_TELEPORTER == TRUE) && (MIS_Lares_BringRangerToMe != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Teleportstation_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//Už jsi někdy použil teleport?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Ne, ale slyšel jsem o tom. Mágové Vody neví přesně, co si o těchto věcech mají myslet.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//Už jsem jeden vyzkoušel.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//(směje se) Mohlo mě to napadnout. Je vůbec něco, co bys neudělal?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Dobře, jestli chceš použít jednu z těchto věcí, zeptej se Orlana - hospodského - jestli ti povolí vstup do jeskyně, která je zamklá.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//Myslím, že jeden teleport k mágům Vody je skyrtý nedaleko jeho hostince.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Opusť město východní branou a prostě běž po cestě. Nevím, jak bys to mohl minout.
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Lares mi řekl, že blízko Orlanova hostince je skrytý jeden z teleportů.");
	Orlan_Hint_Lares = TRUE;
};


instance DIA_Addon_Lares_Ornament(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Ornament_Condition;
	information = DIA_Addon_Lares_Ornament_Info;
	description = "Vatras mi pro tebe dal tento ornament.";
};


func int DIA_Addon_Lares_Ornament_Condition()
{
	if(Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras mi pro tebe dal tento ornament. Řekl, že ho máš vrátit.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//(povzdechne si) Jaké překvapení. Zase je to na mně. Mohl jsem si to myslet.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Nyní musím jít přes celý ostrov, abych to vrátil mágům Vody.
};


instance DIA_Addon_Lares_OrnamentBringJob(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_OrnamentBringJob_Condition;
	information = DIA_Addon_Lares_OrnamentBringJob_Info;
	description = "Udělám to pro tebe!";
};


func int DIA_Addon_Lares_OrnamentBringJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Addon_Lares_Ornament2Saturas == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_OrnamentBringJob_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Udělám to pro tebe!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//(uvažuje) Hmm. Myslím, že bude lepší, když tam ten ornament donesu osobně. Nicméně se ke mně můžeš přidat.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Bohužel, nemůžu opustit toto místo. Musím sledovat doky.
	B_LogEntry(TOPIC_Addon_KDW,"Donesl jsem Laresovi Vatrasův ornament. Chce, abychom ho donesli mágům Vody a Lares by mě měl doprovázet.");
	MIS_Addon_Lares_Ornament2Saturas = LOG_Running;
};


instance DIA_Addon_Lares_YourMission(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_YourMission_Condition;
	information = DIA_Addon_Lares_YourMission_Info;
	permanent = TRUE;
	description = "Co přesně děláš tady v přístavu?";
};


func int DIA_Addon_Lares_YourMission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Lares_BringRangerToMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_YourMission_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Co přesně děláš v přístavu?

	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//To ti nemůžu říct.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras by mě zabil.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//Dělám, co děláme my všichni. Plníme úkoly, které dostaneme od mágů Vody.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//Někteří ze zmizelých lidí jsou rybáři. Dokonce i jejich lodě zmizely.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//To je, proč jsem zde a sleduji doky. Možná zde něco najdu.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Ale mohl bys mi pomoci.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Poslouchej, dám ti svůj akvamarínový prsten. Je to znak 'Kruhu Vody'.
		CreateInvItems(self,ItRi_Ranger_Lares_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Lares_Addon,1);
		SC_GotLaresRing = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Nasaď si ho a ostatní poznají, že pracuješ pro mě.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Najdi za mě náhradu a tak budeme moci vrátit ornament.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//Jeden z nás obvykle sleduje tržiště. Není tam právě zapotřebí.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Prostě mluv s lidmi. Správná osoba tě pozná díky mému prstenu na tvém prstě.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//Řekni mu, že hledám náhradu v přístavu.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Lares nemůže opustit přístav. Měl bych prozkoumat tržiště s nasazeným akvamarínovým prstenem, abych našel za Larese náhradu.");
		Log_CreateTopic(TOPIC_Addon_BringRangerToLares,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_BringRangerToLares,"Lares nemůže opustit přístav. Měl bych prozkoumat tržiště s nasazeným akvamarínovým prstenem, abych našel za Larese náhradu.");
		MIS_Lares_BringRangerToMe = LOG_Running;
	};
};


instance DIA_Addon_Lares_BaltramAbloese(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_BaltramAbloese_Condition;
	information = DIA_Addon_Lares_BaltramAbloese_Info;
	description = "Mluvil jsem s Baltramem.";
};


func int DIA_Addon_Lares_BaltramAbloese_Condition()
{
	if((MIS_Lares_BringRangerToMe == LOG_Running) && (Baltram_Exchange4Lares == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Mluvil jsem s Baltramem. Najde někoho, kdo tě nahradí.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Velmi dobře. Alespoň odsud můžeme vypadnout.

	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//Můžeš si nyní nechat můj akvamarínový prsten.
		if(Npc_KnowsInfo(other,DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//(směje se) Řekl bych, že se ti bude hodit, dokud nedostaneš svůj vlastní.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//(směje se) Možná se k nám nakonec rozhodneš i přidat...
		};
	};
	Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares,LOG_SUCCESS);
	B_LogEntry(TOPIC_Addon_BringRangerToLares,"Informoval jsem Larese, že jsem za něj našel náhradu. Teď už může konečně opustit přístav.");
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};


var int Lares_PeopleMissing_PERM;

instance DIA_Addon_Lares_PeopleMissing(C_Info)
{
	npc = VLK_449_Lares;
	nr = 3;
	condition = DIA_Addon_Lares_PeopleMissing_Condition;
	information = DIA_Addon_Lares_PeopleMissing_Info;
	permanent = TRUE;
	description = "O zmizelých lidech...";
};


func int DIA_Addon_Lares_PeopleMissing_Condition()
{
	if((Lares_RangerHelp == TRUE) && (Lares_PeopleMissing_PERM == FALSE) && ((SC_IsRanger == FALSE) || (MissingPeopleReturnedHome == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//O zmizelých lidech...
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice(DIA_Addon_Lares_PeopleMissing,Dialog_Back,DIA_Addon_Lares_PeopleMissing_BACK);

	if(MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Udělal jsem to, abych zachránil některé ze zmizelých lidí.",DIA_Addon_Lares_PeopleMissing_SAVED);
	}
	else if((MIS_Lares_BringRangerToMe != 0) && (SCKnowsMissingPeopleAreInAddonWorld == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Vím, kde jsou zmizelí lidé teď!",DIA_Addon_Lares_PeopleMissing_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"A není to náhodou práce domobrany?",DIA_Addon_Lares_PeopleMissing_MIL);
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Řekni mi, co o nich víš.",DIA_Addon_Lares_PeopleMissing_TellMe);
	};
};

func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//Řekni mi, co o nich víš.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Rybář tady z Khorinisu - William - byl první. Prostě se jednoho dne nevrátil.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Prvně jsme si mysleli, že se stal obětí i s jeho loďkou nějaké mořské obludy, když rybařil venku.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Ale brzy začali mizet další. A zdá se, že by za tím bylo něco jiného.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Dosud jsme byli celkem bezradní. Vypadá to, že musíme čekat na nějakou náhodu či důkaz, který objevíme.

	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
		SC_HearedAboutMissingPeople = TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//A není to náhodou práce domobrany?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//Kdyby byli schopní něco udělat.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Nenašli jediný důkaz. Lidé mizeli beze stopy.
};

func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//Vím, kde zmizelí lidé jsou.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//(Překvapeně) Opravdu?!
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//Bývalý rudobaron RAVEN je unesl.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Jsi si jistý? Musíme je tedy nějak zachránit.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Pracuji na tom.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//Dobrá. Víš, kde mě hledat, kdybys potřeboval pomoc...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//... vím, kde je najít. Dostaneme je.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_SAVED()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Zvládl jsem to. Osvobodil jsem všechny pohřešované lidi.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//Věděl jsem, že to dokážeš. Konečně se mohu soustředit na svou práci.
	B_GivePlayerXP(XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};


var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;

instance DIA_Addon_Lares_RangerHelp(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_RangerHelp_Condition;
	information = DIA_Addon_Lares_RangerHelp_Info;
	permanent = TRUE;
	description = "Potřebuji tvou pomoc.";
};


func int DIA_Addon_Lares_RangerHelp_Condition()
{
	if(((Lares_RangerHelp == TRUE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)) || Npc_IsInState(Moe,ZS_Attack))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RangerHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Potřebuji tvou pomoc.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//Jak ti mohu posloužit?
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice(DIA_Addon_Lares_RangerHelp,Dialog_Back,DIA_Addon_Lares_RangerHelp_nix);
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Potřebuji lepší zbraň.",DIA_Addon_Lares_RangerHelp_waffe);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"A co tak lepší zbroj?",DIA_Addon_Lares_RangerHelp_ruestung);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Potřebuji peníze.",DIA_Addon_Lares_RangerHelp_geld);
	};
};

func void DIA_Addon_Lares_RangerHelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//A co takhle lepší zbroj?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//Hmm. Myslím, že Matteo prodává nějakou zbroj, ale není zrovna levná...
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Existuje pravděpodobně levnější cesta, pokud ti nevadí malé trable s domobranou...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//A to jak?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Za Matteovým obchodem je skladiště. Ale všechno zboží bylo skonfiskováno domobranou.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Navštiv Zurise na tržišti, kup si od něj svitek Spánku a použij ho na stráž u skladu.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//Řekl bych, že kolem Matteova obchodu se válela pěkná zbroj.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Potřebuji lepší zbraň.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Promiň, ale s tímto ti nepomohu. Už jsi byl na tržišti?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Potřebuji peníze.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//Proč ne? Promiň, nemůžu ti půjčit. Ale Lehmar - lichvář - mi dluží laskavost.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Jen mu řekni a dostaneš peníze, které potřebuješ. Já se už o zbytek postarám. Najdeš ho po cestě k dokům u vstupu do dolní čtvrti.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

func void DIA_Addon_Lares_RangerHelp_nix()
{
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};


instance DIA_Lares_Paladine(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_Paladine_Condition;
	information = DIA_Lares_Paladine_Info;
	permanent = FALSE;
	description = "Musím za každou cenu mluvit s paladiny!";
};


func int DIA_Lares_Paladine_Condition()
{
	if((other.guild == GIL_NONE) && (RangerHelp_gildeMIL == FALSE) && (RangerHelp_gildeSLD == FALSE) && (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Musím za každou cenu mluvit s paladiny!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Co od NICH chceš?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Mají mocný amulet, Innosovo oko. Musím ho mít.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//A to si myslíš, že ti ho dají? Nikdy se nedostaneš ani do horní čtvrti.
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Nějaký způsob se najde.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasně, jestli chceš podlejzat měšťanům nebo dělat poskoka domobraně...
	};
};


instance DIA_Lares_WhyPalHere(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_WhyPalHere_Condition;
	information = DIA_Lares_WhyPalHere_Info;
	permanent = FALSE;
	description = "Víš, proč tu jsou paladinové?";
};


func int DIA_Lares_WhyPalHere_Condition()
{
	if(other.guild == GIL_NONE)
	{
		if(Npc_KnowsInfo(other,DIA_Lares_Paladine) || (RangerHelp_gildeMIL == TRUE) || (RangerHelp_gildeSLD == TRUE) || (RangerHelp_gildeKDF == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Ty víš, proč tu paladinové jsou?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikdo to neví jistě. Hodně lidí si myslí, že to je kvůli skřetům, ale já si myslím, že tu je jinej důvod.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Nejspíš to má co dělat se starou trestaneckou kolonií.
};


instance DIA_Addon_Lares_Gilde(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Gilde_Condition;
	information = DIA_Addon_Lares_Gilde_Info;
	permanent = TRUE;
	description = "Vatras se zmínil, že bys mi mohl pomoct přidat se k jedné gildě.";
};


func int DIA_Addon_Lares_Gilde_Condition()
{
	if((Lares_RangerHelp == TRUE) && (other.guild == GIL_NONE) && (RangerHelp_gildeMIL == FALSE) && (RangerHelp_gildeSLD == FALSE) && (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Gilde_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras se zmínil, že bys mi mohl pomoct přidat se k jedné gildě.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//(směje se) Horlivá pracovní posila, že?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Dobrá, poslouchám.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//Můžu zkusit domluvit žoldákům, kdyby ses chtěl připojit k Leemu.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Samozřejmě, že je rychlejší cesta, jak se dostat do kláštera.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//Nejjednodušší bude přidat se k domobraně.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Tak které gildě dáš přednost?
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Musím si to celé ještě jednou promyslet...",DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Mágové Ohně.",DIA_Addon_Lares_Gilde_KDF);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Žoldáci.",DIA_Addon_Lares_Gilde_SLD);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Domobrana.",DIA_Addon_Lares_Gilde_MIL);
};

func void DIA_Addon_Lares_Gilde_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Musím si to celé ještě jednou promyslet...
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_SLD()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//Žoldáci.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Jsem si jistý, že Lee tě přivítá.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Nicméně, je tam test, zda-li jsi použitelný.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Navrhnul bych si pohovořit si s žoldákem Cordem.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//Může ti pomoct se zkouškou.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//Řekni mu, že 'žiješ pod mými ochranými křídly'. On to pochopí.
	RangerHelp_gildeSLD = TRUE;
	Log_CreateTopic(TOPIC_Addon_RangerHelpSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Lares věří, že Cord mi pomůže s přijetím mezi žoldáky na farmě.");
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_MIL()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Domobrana.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//(baví se) Á, opravdu si to dokážu představit, jak si to užiješ. Říkat jiným lidem o zákonech, zatímco bereš jejich peníze.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//Paladinové mají svůj sklad na molu. Důstojník je můj dobrý kamarád.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Možná by ti pomohl. Jmenuje se Martin.
	Log_CreateTopic(TOPIC_Addon_RangerHelpMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Lares mi řekl, že důstojník Martin mi pomůže přidat se k domobraně mnohem rychleji. Obvykle bývá v přístavu tam, jak mají paladinové svůj sklad.");
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_KDF()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//Mágové Ohně.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//(směje se) Že to Vatras neočekával? Jinak by tě za mnou asi neposlal.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Když se chceš přidat ke klášteru, vyjde tě to dost draho.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Ti chlápíci tě nepustí dovnitř, pokud jim nezaplatíš poplatek.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//A jediná osoba, která to může změnit je Vatras. Myslím, že bys s ním měl promluvit.
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Vatras ví, jak se snadno připojit ke klášteru.");
	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};


var int Lares_WorkForLee;
var int Lares_WayToOnar;

instance DIA_Lares_AboutSld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_AboutSld_Condition;
	information = DIA_Lares_AboutSld_Info;
	permanent = TRUE;
	description = "Řekni mi více o Leem a jeho žoldácích.";
};


func int DIA_Lares_AboutSld_Condition()
{
	if((other.guild == GIL_NONE) && (Lares_WayToOnar == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//Řekni mi více o Leem a jeho žoldácích.
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Co bys rád věděl?
	Info_ClearChoices(DIA_Lares_AboutSld);
	Info_AddChoice(DIA_Lares_AboutSld,Dialog_Back,DIA_Lares_AboutSld_BACK);
	Info_AddChoice(DIA_Lares_AboutSld,"Proč nejsi s Leem a jeho žoldákama?",DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice(DIA_Lares_AboutSld,"Řekni mi o žoldácích víc.",DIA_Lares_AboutSld_Sld);
	Info_AddChoice(DIA_Lares_AboutSld,"Jak najdu farmu velkostatkáře?",DIA_Lares_AboutSld_WayToOnar);
};

func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices(DIA_Lares_AboutSld);
};

func void DIA_Lares_AboutSld_Sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Řekni mi o žoldácích víc.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Fajn, jestli jseš pořád tak tvrdej, jako jsi bejval, neměl bys s nima mít žádnej problém.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Většina z nich jsou rváči, a jestli se jim nebudeš umět postavit, daleko se nedostaneš.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(smích) Jestli jseš krapet přecitlivělej, tak nemáš šanci s nima vydržet.
};

func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//Proč teda nejsi s Leem a jeho žoldákama?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale vždyť jsem! Jenom ne na farmě.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Dá se říct, že ho tady ve městě zastupuju. Nechceme, aby ta loď odplula bez nás.
	Lares_WorkForLee = TRUE;
	Info_AddChoice(DIA_Lares_AboutSld,"O jaké lodi jsi to mluvil?",DIA_Lares_AboutSld_Schiff);
};

func void DIA_Lares_AboutSld_Schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jaké lodi jsi to mluvil?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Je na otevřené části přístavu za útesem. Lee se chce se svejma pár lidma odsud vážně dostat.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale bude to chvíli trvat.
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Proč?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Měl by ses na to raději zeptat Leeho, když ho potkáš... On má ten plán.
};

func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak najdu farmu velkostatkáře?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//Je to velmi jednoduché. Opusť město východní branou a pak běž na sever.

	if(RealMode[2] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//Můžu ti ukázat cestu, jestli chceš.
		Lares_WayToOnar = TRUE;
	};
};

instance DIA_Lares_GuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 14;
	condition = DIA_Lares_GuildOfThieves_Condition;
	information = DIA_Lares_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Víš něco o zlodějském cechu ve městě?";
};


func int DIA_Lares_GuildOfThieves_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Víš něco o zlodějském cechu ve městě?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Ty tvoje otázky...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Samozřejmě, máme tady zlodějskej cech. Jako v každým větším městě.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//A každej malej zlodějíček nebo šmelinář je s ní nějak propojenej.
};


instance DIA_Lares_WhereGuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 15;
	condition = DIA_Lares_WhereGuildOfThieves_Condition;
	information = DIA_Lares_WhereGuildOfThieves_Info;
	permanent = FALSE;
	description = "Víš, kde bych ten cech našel?";
};


func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GuildOfThieves) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Víš, kde bych ten cech našel?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(smích) Bez urážky, ale vím jen to, že ti nesmím nic říct.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Tihle lidé na takové věci většinou reagují VELMI citlivě.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Jestli se s nima chceš zaplést, měl bys být hodně opatrný.
};


instance DIA_Lares_GotKey(C_Info)
{
	npc = VLK_449_Lares;
	nr = 16;
	condition = DIA_Lares_GotKey_Condition;
	information = DIA_Lares_GotKey_Info;
	permanent = FALSE;
	description = "Mám tady tenhle klíč. Je celej zrezlej od mořský vody.";
};


func int DIA_Lares_GotKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_WhereGuildOfThieves) && Npc_HasItems(other,ItKe_ZhiefGuildKey_MIS) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Mám tady tenhle klíč. Je celej zrezlej od mořský vody.
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//Takže?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Mám dojem, že by mě mohl dovést k úkrytu zlodějskýho cechu.
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Fajn, to by moh bejt klíč od stok.
};


instance DIA_Lares_Kanalisation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 17;
	condition = DIA_Lares_Kanalisation_Condition;
	information = DIA_Lares_Kanalisation_Info;
	permanent = FALSE;
	description = "Kde najdu ty stoky?";
};


func int DIA_Lares_Kanalisation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GotKey) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Kanalisation_Info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Kde najdu ty stoky?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Co já vím... většinou ústí do moře.
};


instance DIA_Lares_OtherGuild(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_OtherGuild_Condition;
	information = DIA_Lares_OtherGuild_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_OtherGuild_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_NONE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Ty jsi teď v domobraně?!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(smích) To mě poser - bejvalej trestanec je v domobraně...!
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Tak ty jseš teď jedním z královských paladinů!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(uličnicky) Něco takovýho můžeš províst jenom ty.
		if(Lares_WorkForLee == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(starostlivě) Nepráskneš mě kvůli mojí spolupráci s Leem?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Vždyť mě znáš...(přátelsky)
		};
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nerozumím tomu. Vstoupil jsi do kláštera. Jaké to tam je?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Jiné.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Nedovedu si to představit.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Slyšel jsem, že tě Lee přijal.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratuluju.
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_11");	//Vidím, že ses dal cestou mága Vody. No, mě se ta možnost celkem zamlouvá!
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_12");	//Gratuluju.
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_12");	//Přidal ses k mágům Temnoty?!... (Podezíravě)
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_13");	//Někdy, prostě nerozumím tvým záměrům. A to je většinou děláš pořád.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_13");	//Znovu si se přidal k Bratrstvu?! Víš jistě, že na to máš?!
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_14");	//Ale je to tvoje volba, a já ji respektuju!
	};
};

instance DIA_Addon_Lares_Forest(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Addon_Lares_Forest_Condition;
	information = DIA_Addon_Lares_Forest_Info;
	description = "Můžeš mě doprovázet na cestě tamtím hustým lesem?";
};

func int DIA_Addon_Lares_Forest_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && (RealMode[2] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//Můžeš mě doprovázet na cestě tamtím hustým lesem?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Jistě, ale co chceš dělat na takovém místě?
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius mi řekl, abych se porozhlédl po dalších ornamentech.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Jedno z míst, abych ti řekl pravdu, je tam na východě v tomto lese.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Vidím, je to dost nebezpečné pro jednoho, že?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Bez problému, prostě mi řekni, kam chceš jít.
	RangerHelp_OrnamentForest = TRUE;
};

instance DIA_Lares_GoNow(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_GoNow_Condition;
	information = DIA_Lares_GoNow_Info;
	permanent = TRUE;
	description = "Fajn, jdeme.";
};

func int DIA_Lares_GoNow_Condition()
{
	if((LaresGuideForest == TRUE) && (LaresGuideMage == TRUE) && (LaresGuideOnar == TRUE))
	{
		return FALSE;
	};
	if(((Lares_WayToOnar == TRUE) || (MIS_Addon_Lares_Ornament2Saturas == LOG_Running) || (RangerHelp_OrnamentForest == TRUE)) && ((LaresGuide_ZumPortal == 0) || (LaresGuide_ZumPortal == 8)) && ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS)) && ((LaresGuide_OrnamentForest == 0) || (LaresGuide_OrnamentForest == 3)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Dobře, pojďme.

	if(Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Nemůžu opustit své místo, dokud nebudu mít náhradu za sebe nebo nevyřešíme záhadu s mizením lidí.
	}
	else if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running)
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Kam?
		Info_ClearChoices(DIA_Lares_GoNow);
		Info_AddChoice(DIA_Lares_GoNow,Dialog_Back,DIA_Lares_GoNow_warte);

		if((Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS))
		{
			Info_AddChoice(DIA_Lares_GoNow,"Na Onarovu farmu.",DIA_Lares_GoNow_Onar);
		};
		if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Lares_Angekommen == FALSE))
		{
			Info_AddChoice(DIA_Lares_GoNow,"Ok, vraťme Vatrasův ornament.",DIA_Lares_GoNow_Maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
		{
			Info_AddChoice(DIA_Lares_GoNow,"K hustému lesu na východ.",DIA_Lares_GoNow_Forest);
		};
	};
};

func void DIA_Lares_GoNow_Maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Vraťme Vatrasův ornament!
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Dobrá... Následuj mě.
	LaresGuide_ZumPortal = TRUE;
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");

	if(Npc_KnowsInfo(other,DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_Onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//Na Onarovu farmu.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Dobrá... Následuj mě.
	LaresGuide_ZuOnar = TRUE;
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");

	if(Npc_KnowsInfo(other,DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_Forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//Do východních lesů.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Dobrá... Následuj mě.
	LaresGuide_OrnamentForest = TRUE;
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");

	if(Npc_KnowsInfo(other,DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_warte()
{
	Info_ClearChoices(DIA_Lares_GoNow);
};

instance DIA_Lares_GUIDE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GUIDE_Condition;
	information = DIA_Lares_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_GUIDE_Condition()
{
	if((LaresGuide_ZuOnar == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	if(Lares_Guide > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//Tak jsme tady.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Tak tady jsi. Už jsem si začínal myslet, že tě sežrali vlci.
	};

	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Takže dál už trefíš sám. Musím se vrátit do města, mám tam ještě nějaké vyřizování.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Prostě pokračuj po téhle cestě dál a pamatuj - važ si sám sebe a nepodělej se z každý blbosti, pak to pro tebe bude hračka.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS;
	LaresGuideOnar = TRUE;
};


instance DIA_Addon_Lares_ArrivedPortalInter1(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important = TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11") && (LaresGuide_ZumPortal == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Nyní, když jsme z města venku a nikdo nás nesleduje, rád bych ti něco řekl.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Ornament předpokládám vrátíme Saturasovi. Vzpomínáš si na něj, ne?
	LaresGuide_ZumPortal = 2;
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1,"Jistě.",DIA_Addon_Lares_ArrivedPortalInter1_ja);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1,"Saturas? Kdo je to?",DIA_Addon_Lares_ArrivedPortalInter1_wer);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Podívej, my chlapi z Nového tábora máme stále dobré vztahy s mágy Vody.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Dokonce i Lee bude chránit mágy Vody, bude-li to nezbytné.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Strávil jsem mnoho času tady ve městě a spolupracoval s Vatrasem a udržoval kontakt s mágy Vody.
	B_MakeRangerReadyForMeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//A toto je zbroj, kterou jsme dostali od mágů Vody. 'Kruh Vody' ho nosil ještě před válkou se skřety.

	if(Cavalorn_RangerHint == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//Jak se dostal Cavalorn k vám? Nevzpomínám si, že by patřil k Novému táboru.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//Máš pravdu, naše společenství se rozrostlo. Dokonce ani já nevím, kolik nás už je.
	};

	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Ale pojďme už. Rád bych se dostal z tohoto města. Mluvit můžeme cestou.
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Kdo je to?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//Hmm, nejvyšší mág Vody v Novém táboře. Vrátil se zpět z Hornického údolí, když bariéra padla.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Lee a moje maličkost jsme udělali dohodu s mágy Vody a spojili své síly, abychom mohli vzdorovat Starému táboru.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Jistě. On byl nejvyšším mágem Vody v Novém táboře.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

instance DIA_Addon_Lares_ArrivedPortalInterWeiter(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important = TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02") && (LaresGuide_ZumPortal == 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//Děje se něco?! Nestačíš mi?
	LaresGuide_ZumPortal = 3;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14") && (LaresGuide_ZumPortal == 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Chlape, nevypršela už naše dohoda?
	LaresGuide_ZumPortal = 4;
};


instance DIA_Addon_Lares_ArrivedPortalInter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58") && (LaresGuide_ZumPortal == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//Mágové Vody jsou úplně napjatí. Kopou na severovýchodě už týdny. Nemám potuchy, co tam hledají.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Celá zem se začala otřásat, jako když padla bariéra.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Jako ve zlém snu se probudily kamenné bytosti a zaútočili na vše, co se ocitlo v jejich blízkosti.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//Mágové Vody na to dohlíží a zničili všechny nepřátelské potvory. A nyní kopají kolem a hledají vysvětlení těch událostí.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Ale brzy to uvidíš na vlastní oči.
	LaresGuide_ZumPortal = 5;
	B_LogEntry(TOPIC_Addon_KDW,"Lares mi řekl o vykopávkách mágů Vody. Zaznamenali tam divné věci. Nejspíš tam je zdroj tajemných zemětřesení a kamenných monster.");
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter3(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LaresGuide_ZumPortal == 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Jsi v pohodě?
	LaresGuide_ZumPortal = 6;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter4(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02") && (LaresGuide_ZumPortal == 6))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Buď opatrný, může to tady být nebezpečné.
	LaresGuide_ZumPortal = 7;
};


instance DIA_Addon_Lares_ArrivedPortal(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortal_Condition;
	information = DIA_Addon_Lares_ArrivedPortal_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortal_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41") && (LaresGuide_ZumPortal == 7))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortal_Info()
{
	B_MakeRangerReadyToLeaveMeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//Tak, a jsme tu.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//Vem ten ornament. Mágové Vody tam někde musí být. Dones ho k nim.
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//Měl bys bežet rovnou za Saturasem, pokud bys narazil na potvoru, která je silnější než ty, a to tak rychle, jak jen budeš moci.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//On už ti potom pomůže. Musím se nyní vrátit.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//A hlavně se s tím tady nikde nepotloukej a bež s tím rovnou za Saturasem.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//Uvidíme se.
	B_LogEntry(TOPIC_Addon_KDW,"Lares mi dal ornament do rukou. Měl bych ho doručit mágu Vody Saturasovi.");
	LaresGuide_ZumPortal = 8;
	Lares_Angekommen = TRUE;
	LaresGuideMage = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Addon_Lares_Albern(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Albern_Condition;
	information = DIA_Addon_Lares_Albern_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_Albern_Condition()
{
	if((Lares_Angekommen == TRUE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000) && (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//(vážně) Konec srandy! Doruč ten ornament!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GOFORESTPRE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFORESTPRE_Condition;
	information = DIA_Addon_Lares_GOFORESTPRE_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GOFORESTPRE_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") && (LaresGuide_OrnamentForest == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GOFORESTPRE_ja()
{
	B_MakeRangerReadyForMeeting(self);
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_ja_15_00");	//Ano
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Dobře můj příteli. Následuj mě. Bude to jízda.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2;
};

func void DIA_Addon_Lares_GOFORESTPRE_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Ne, můžeš nyní odejít.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//Hádám, že jsme tu skončili. Dobrá, uvidíme se později.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LaresGuide_OrnamentForest = 3;
};

func void DIA_Addon_Lares_GOFORESTPRE_Info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Chceš, abych s tebou šel do lesa?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Myslíš to vážně? Určitě tam chceš jít?
	};
	Info_ClearChoices(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE,"Ne, můžeš nyní odejít.",DIA_Addon_Lares_GOFORESTPRE_nein);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE,"Ano.",DIA_Addon_Lares_GOFORESTPRE_ja);
};

instance DIA_Addon_Lares_GOFOREST(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFOREST_Condition;
	information = DIA_Addon_Lares_GOFOREST_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Lares_GOFOREST_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_FOREST_PATH_62") && (LaresGuide_OrnamentForest == 2) && Npc_IsDead(Stoneguardian_Ornament))
	{
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
		if(ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		B_MakeRangerReadyToLeaveMeeting(self);
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Dobře, vypadá to, že jsem tu skončil. Myslím, že už to zvládneš i beze mě. Čas, abych oděšel.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LaresGuide_OrnamentForest = 3;
		LaresGuideForest = TRUE;
		Wld_InsertNpc(orc_8519_warrior,"NW_FOREST_PATH_38");
		Wld_InsertNpc(orc_8520_warrior,"NW_TROLLAREA_RITUALFOREST_09");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Pospěšme, raději bych tu dlouho nezůstával.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Lares_PortalInterWEITER(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_PortalInterWEITER_Condition;
	information = DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent = TRUE;
	description = "Přestaň žvanit!";
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition()
{
	if((LaresGuide_ZumPortal != 0) && (LaresGuide_ZumPortal != 8))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Pojďme na to.
	AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Zůstaň za mnou.
	AI_StopProcessInfos(self);

	if(LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
	}
	else if(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};

instance DIA_Lares_DEX(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_DEX_Condition;
	information = DIA_Lares_DEX_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};

func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Jistě, můžu tě naučit, jak se stát obratnějším a silnějším.
	Lares_TeachDEX = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Lares mi může vylepšit obratnost a sílu.");
};


var int Lares_MerkeDEX;
var int Lares_MerkeSTR;

instance DIA_Lares_TEACH(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_TEACH_Condition;
	information = DIA_Lares_TEACH_Info;
	permanent = TRUE;
	description = "Uč mě.";
};


func int DIA_Lares_TEACH_Condition()
{
	if(Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//Uč mě.
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Už ses stal obratnějším.
	};
	if(other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//(pochvalně) Dobře, tvá síla se zlepšila.
	};
	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};


instance DIA_Lares_Kap2_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap2_EXIT_Condition;
	information = DIA_Lares_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap3_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap3_EXIT_Condition;
	information = DIA_Lares_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_AnyNews(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_AnyNews_Condition;
	information = DIA_Lares_AnyNews_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Lares_AnyNews_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Co je nového?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Za ty nejlepší zprávy můžeš ty sám. Nechali Benneta jít, je zpátky na farmě.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Běž za ním, mám dojem, že by ti chtěl poděkovat osobně.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Dalo by se to tak říct. Paladinové zabásli Benneta, našeho kováře.
		if(MIS_RescueBennet == LOG_Running)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Slyšel jsem. Tak to je zlý.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//To mi povídej.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak se to stalo?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet odjel do města pro zásoby. No a už se nevrátil.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Jestli se chceš dozvědět víc, promluv si s Hodgesem, byl ve městě s Bennetem.
			MIS_RescueBennet = LOG_Running;
		};
	};
};


instance DIA_Lares_NewsAboutBennet(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_NewsAboutBennet_Condition;
	information = DIA_Lares_NewsAboutBennet_Info;
	permanent = FALSE;
	description = "Nějaký zprávy o Bennetovi?";
};


func int DIA_Lares_NewsAboutBennet_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Nějaký zprávy o Bennetovi?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Vypadá to, že ho vzali do kasáren a strčili do žaláře.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak ho odtamtud můžeme dostat?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Tak to vůbec netuším. Nemůžu se dostat ani k němu do cely, abych si s ním promluvil.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Všechno, co zmůžu, je mít oči na stopkách. Ale asi toho stejně moc nevykoukám.
};


instance DIA_Lares_Kap4_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap4_EXIT_Condition;
	information = DIA_Lares_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap4_PERM(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_Kap4_PERM_Condition;
	information = DIA_Lares_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Proč taky nejsi venku a nelovíš draky?";
};


func int DIA_Lares_Kap4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Proč nejsi venku a nelovíš draky?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//O takové věci se nestarám, přenechávám je ostatním.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Hmmm. Čerstvý mořský vzduch - to je přesně to, co jsem potřeboval.
};


instance DIA_Lares_Kap5_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap5_EXIT_Condition;
	information = DIA_Lares_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_KnowWhereEnemy(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_KnowWhereEnemy_Condition;
	information = DIA_Lares_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Nechtěl bys opustit tenhle ostrov?";
};


func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lares_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Nechtěl bys opustit tenhle ostrov?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Víc než cokoli jinýho. Cos myslel?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Zjistil jsem, kde se ukrývá vůdce draků. Je na ostrově, nedaleko odsud.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Chci se ho jednou provždy zbavit.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Správná slova. Jestli mě budeš potřebovat, jdu do toho.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Můžeš na svých cestách potřebovat někoho, kde tě naučí posilovat obratnost nebo boj jednoručními zbraněmi?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Loď už je plná, ale kdyby se něco změnilo, dám vědět.
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"K ničemu bys mi nebyl.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Věděl jsem, že se na tebe můžu spolehnout.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Věděl jsem, že se na tebe můžu spolehnout.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Všichni se sejdeme na lodi.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Muž činu, tak to mám rád. Ještě se uvidíme.
	Lares_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	CreateInvItems(self,itar_sld_M,1);
	AI_EquipArmor(self,itar_sld_M);
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Cením si tvé nabídky, ale nemám pro tebe využití.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Sám musíš vědět, co chceš. Pokud si o tom budeš chtít promluvit později, víš, kde mě najdeš.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};


instance DIA_Lares_LeaveMyShip(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_LeaveMyShip_Condition;
	information = DIA_Lares_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Bude lepší, když zůstaneš tady.";
};


func int DIA_Lares_LeaveMyShip_Condition()
{
	if((Lares_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Bude lepší, když zůstaneš tady.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak chceš, ale pak si vzpomeň, kdo komu co sliboval.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lares_StillNeedYou(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_StillNeedYou_Condition;
	information = DIA_Lares_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ještě pořád bys měl zájem o tu cestu?";
};


func int DIA_Lares_StillNeedYou_Condition()
{
	if(((Lares_IsOnBoard == LOG_OBSOLETE) || (Lares_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Ještě pořád bys měl zájem o tu cestu?
	if(Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Normálně nenechávám jen tak někoho, aby se mnou takhle jednal, ale jelikož jsi jedním z nás, nechám to být.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Uvidíme se na lodi.
		Lares_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
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
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Neber si to nějak osobně, ale asi jsi měl pravdu.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Bude lepší, když zůstanu tady.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_LARES_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_addon_lares_nw_kapitelorcattack_condition;
	information = dia_addon_lares_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Jak bys zhodnotil tuto situaci?";
};


func int dia_addon_lares_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (LARESBACKNW == TRUE) && (LEEBATTLETHROUGTH == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_00");	//Jak bys zhodnotil tuto situaci?
	AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_01");	//Abych ti řekl pravdu, vzhledem k celkem jasné situaci, ti toho nemám moc co říct...
	AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_02");	//Řekl bych, že jenom blázen by si myslel, že skřeti dřív nebo později na město nezaútočí. Byla to jenom otázka času.
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_03");	//A co tedy budem dělat dál?!
	if(LEEBACKNW == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_04");	//Myslím si, že na tohle se bude lepší zeptat Leeho. On už určitě bude vědět, jak z toho ven.
		AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_05");	//Dobrá, promluvím s ním.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_06");	//To nevím, ale pro začátek bychom se měli trochu zamyslet... (Přemýšlí nahlas) jak bychom se tak mohli dostat z této pasti...?
		AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_01_07");	//Pokud máme na výběr, a jakože nejspíš nemáme. Bude nutné se odsud dostat bojem, jiné východisko nevidím...
		Info_ClearChoices(dia_addon_lares_nw_kapitelorcattack);

		if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
		{
			Info_AddChoice(dia_addon_lares_nw_kapitelorcattack,"Nabídnout teleportační runu na Onarovu farmu.",dia_addon_lares_nw_kapitelorcattack_farm);
		};
		Info_AddChoice(dia_addon_lares_nw_kapitelorcattack,"Dobrá, asi máš pravdu.",dia_addon_lares_nw_kapitelorcattack_nogiverune);
	};
};

func void dia_addon_lares_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_01");	//Počkej chvíli. Má tady u sebe teleportační runu na Onarovu farmu.
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_02");	//Takže, jestli chceš, můžeš ji použít.
	AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_03");	//Runa?! Hmmm... (Zamyslí se) No, nevím co na to... Možná bych mohl...?!
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_05");	//A krom toho, otevřený boj se skřety přes ulice města, to je celkem šílenej plán.
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_06");	//Skřeti z tebe nadělají sekanou, než bys vůbec dosáhl čtvrti mistrů.
	AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_09");	//Dobrá... (skepticky) Dej ji sem, použiju ji.
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_10");	//To jsem chtěl slyšet!
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_11");	//Eh! Doufám, že po ní nebudu mít zase týden kocovinu jako posledně.
	LARESNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem teleportační runu na Onarovu farmu Laresovi. Už se o něj nemusí bát.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_addon_lares_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Lares_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Dobrá, pokud to chceš takhle, není o čem diskutovat.
	B_LogEntry(TOPIC_HELPCREW,"Lares zkusí projít městem a dostat se pryč. Bojím se, že s ním skřeti vytřou podlahu.");
	LARESBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_FUCKOFF(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = dia_vlk_449_lares_fuckoff_condition;
	information = dia_vlk_449_lares_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_449_lares_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (LARESCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_VLK_449_LARES_YOURFREE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_yourfree_condition;
	information = dia_vlk_449_lares_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_449_lares_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (LARESCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_yourfree_info()
{
	AI_Output(self,other,"DIA_VLK_449_Lares_YourFree_01_08");	//Ještě pořád jsem ti nechyběl?!
	AI_Output(other,self,"DIA_VLK_449_Lares_YourFree_01_00");	//Jak jinak to říct... jsi volný!
	AI_Output(self,other,"DIA_VLK_449_Lares_YourFree_01_01");	//Hmmm... (Překvapeně) chceš mi říct, že je město čistý?!
	AI_Output(other,self,"DIA_VLK_449_Lares_YourFree_01_02");	//Ano je.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_VLK_449_Lares_YourFree_01_03");	//Tak to je skvělé kámo...(radostně) A to už jsme si mysleli, že je tohle náš konec!
		AI_Output(self,other,"DIA_VLK_449_Lares_YourFree_01_04");	//Tak už otevřy ty mříže, ať už se můžem nadýchat čerstvého vzduchu.
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_449_Lares_YourFree_01_05");	//Tak to je skvělé kámo...(radostně) A to už jsme si mysleli, že je tohle můj konec!
		AI_Output(self,other,"DIA_VLK_449_Lares_YourFree_01_06");	//Tak už otevřy ty mříže, ať už se můžu nadýchat čerstvého vzduchu.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_OPENGATENOW(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_opengatenow_condition;
	information = dia_vlk_449_lares_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_449_lares_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (LARESCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (LARESISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_opengatenow_info()
{
	AI_Output(self,other,"DIA_VLK_449_Lares_OpenGateNow_01_00");	//Pustíš mě už konečně?!...(nervózně) nebo mě tady necháš hnít celou věčnost?!
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_GOONORKSHUNT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_goonorkshunt_condition;
	information = dia_vlk_449_lares_goonorkshunt_info;
	permanent = FALSE;
	description = "Nechceš se jít projít?";
};


func int dia_vlk_449_lares_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (LARESCAPTURED == FALSE) && (ALLGREATVICTORY == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (LARESTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_VLK_449_Lares_GoOnOrksHunt_01_00");	//Nechceš se jít pobavit?
	AI_Output(self,other,"DIA_VLK_449_Lares_GoOnOrksHunt_01_01");	//Hmmm... (Lstivě) Chceš snad něčím pomoct?!
	AI_Output(other,self,"DIA_VLK_449_Lares_GoOnOrksHunt_01_02");	//Nic zvláštního! Prostě si to jít vyřídt účty s pár skřety.
	AI_Output(self,other,"DIA_VLK_449_Lares_GoOnOrksHunt_01_03");	//Tak to jo! Jdu s tebou kámo.
	LARESJOINMEHUNT = TRUE;
};


instance DIA_VLK_449_LARES_FOLLOWME(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_followme_condition;
	information = dia_vlk_449_lares_followme_info;
	permanent = TRUE;
	description = "Za mnou!";
};


func int dia_vlk_449_lares_followme_condition()
{
	if((LARESJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (LARESTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_followme_info()
{
	AI_Output(other,self,"DIA_VLK_449_Lares_FollowMe_01_00");	//Za mnou!
	AI_Output(self,other,"DIA_VLK_449_Lares_FollowMe_01_01");	//Dobrá.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_STOPHERE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_stophere_condition;
	information = dia_vlk_449_lares_stophere_info;
	permanent = TRUE;
	description = "Počkej tady!";
};


func int dia_vlk_449_lares_stophere_condition()
{
	if((LARESJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (LARESTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_stophere_info()
{
	AI_Output(other,self,"DIA_VLK_449_Lares_StopHere_01_00");	//Počkej tady!
	AI_Output(self,other,"DIA_VLK_449_Lares_StopHere_01_01");	//Dobrá, víš kde mě najít!
	Npc_ExchangeRoutine(self,"OrcAtcNW");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_TRAVELONBIGLAND(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_travelonbigland_condition;
	information = dia_vlk_449_lares_travelonbigland_info;
	permanent = FALSE;
	description = "Nechceš se se mnou plavit na kontinent?";
};


func int dia_vlk_449_lares_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_VLK_449_Lares_TravelOnBigLand_01_00");	//Nechceš se se mnou plavit na kontinent?
	AI_Output(self,other,"DIA_VLK_449_Lares_TravelOnBigLand_01_01");	//To myslíš vážně?!... To bych řekl, že chci!
	AI_Output(other,self,"DIA_VLK_449_Lares_TravelOnBigLand_01_02");	//Dobrá tedy! Za nedlouho vyplouváme.
	AI_Output(self,other,"DIA_VLK_449_Lares_TravelOnBigLand_01_03");	//Ok, pospíším si.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LARESTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Lares se mnou popluje na kontinent. Lidé jako je on, tam určitě najdou uplatnění. A já jsem za to rád.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

