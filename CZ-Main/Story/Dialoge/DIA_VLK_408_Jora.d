
instance DIA_Jora_EXIT(C_Info)
{
	npc = VLK_408_Jora;
	nr = 999;
	condition = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jora_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Jora_Sperre(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_Sperre_Condition;
	information = DIA_Jora_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Jora_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jora_Sperre_Info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Jsi bývalý trestanec z důlní kolonie, nic ti neprodám!
	AI_StopProcessInfos(self);
};

instance DIA_Jora_HowsMoney(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_HowsMoney_Condition;
	information = DIA_Jora_HowsMoney_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Jora_HowsMoney_Condition()
{
	if((Jora_Gold == LOG_Running) && (Canthar_Sperre == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jora_HowsMoney_Info()
{
	AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Hej! A co moje prachy?
};

instance DIA_Jora_WAREZ(C_Info)
{
	npc = VLK_408_Jora;
	nr = 700;
	condition = DIA_Jora_WAREZ_Condition;
	information = DIA_Jora_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Jora_WAREZ_Condition()
{
	if(Wld_IsTime(5,15,20,4))
	{
		return TRUE;
	};
};

func void DIA_Jora_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Jora_GREET(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_GREET_Condition;
	information = DIA_Jora_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jora_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jora_GREET_Info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Innos tě provázej, cizinče. Jestli si chceš pořídit dobrou cestovatelskou výbavu, pak jsi na tom správném místě.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Ale varuji tě: jestli máš v plánu si inventář vylepšit nějak pokoutně bez placení, zavolám stráže!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Počkej, copak vypadám jako nějaký chmaták?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(pohrdavě) Pche! Dneska bys nebyl první, kdo by se mi snažil něco čmajznout.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Jora prodává na tržišti všechny možné zbraně.");
};


instance DIA_Jora_Bestohlen(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_Bestohlen_Condition;
	information = DIA_Jora_Bestohlen_Info;
	permanent = FALSE;
	description = "Někdo tě okradl?";
};


func int DIA_Jora_Bestohlen_Condition()
{
	return TRUE;
};

func void DIA_Jora_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//Někdo tě okradl?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Nemůžu to dokázat, ten maník byl zatraceně chytrý. Představil se jako Rengaru - pokud to tedy je jeho skutečné jméno.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//Posledních pár dní jen tak zevloval na tržišti.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//A každý večer se přímo na ulici nalívá pivem. Vsadím boty, že ten šmejd chlastá za MOJE peníze!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Jen jsem se na chvilku podíval jinam a už jsem byl bez portmonky!
};

func void B_Jora_GoldForClue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//Poslyš - jestli se ti povede z toho Rengaru vytřískat moje prachy, povím ti všechno, co vím.
};


instance DIA_Jora_HolDeinGold(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_HolDeinGold_Condition;
	information = DIA_Jora_HolDeinGold_Info;
	permanent = FALSE;
	description = "Mohl bych se pokusit získat zpátky tvoje peníze.";
};


func int DIA_Jora_HolDeinGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};

func void DIA_Jora_HolDeinGold_Info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//Mohl bych se pokusit získat zpátky tvoje peníze.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(nedůvěřivě) Fakt? A jak to chceš udělat?
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Ale za odměnu chci část zlata!",DIA_Jora_HolDeinGold_WillBelohnung);
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		Info_AddChoice(DIA_Jora_HolDeinGold,"Rád bych se dozvěděl, jak se dostat do cechu zlodějů.",DIA_Jora_HolDeinGold_GHDG);
	};
	if((other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		Info_AddChoice(DIA_Jora_HolDeinGold,"Přijde na to - můžu se s tvou pomocí dostat do horní čtvrti?",DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//Přijde na to - můžu se s tvou pomocí dostat do horní čtvrti?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(směje se) To jsi na špatné adrese, já vůbec nejsem z města - jako většina kupců na tržišti.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Jestli se chceš dostat do horní čtvrti, promluv si v dolní čtvrti s některými místními obchodníky
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//Rád bych se dozvěděl, jak se dostat do cechu zlodějů.
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Možná, že ti mohu pomoci.
	B_Jora_GoldForClue();
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Uvidím, co se dá dělat.",DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Kolik peněz to bylo?",DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Proč jsi nezavolal stráže?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Ale za odměnu chci část zlata!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//První chci vidět svůj mešec zpátky - pak se budeme bavit o odměně!
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Uvidím, co se dá dělat.",DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Kolik peněz to bylo?",DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Proč jsi nezavolal stráže?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Proč jsi nezavolal stráže?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Stráže jsou něco platné, pouze pokud zloděje přistihneš při činu.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//A když jsem zjistil, že jsem bez portmonky, ten parchant už byl dávno v prachu!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Kolik peněz to bylo?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 zlatých - v téhle mizerné době je to víc než dost.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Dej si pozor. Jestli toho lotra jen tak zmlátíš, vloží se do toho stráže.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Poslední dobou je to tu pěkně drsné. Od chvíle, co do města přibyli paladinové, stráže každého rváče bez milosti sejmou.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Budeš si muset něco vymyslet.
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//Jasně.
	Jora_Dieb = LOG_Running;
	Jora_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JoraDieb,LOG_Running);
	Log_CreateTopic(TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Jora,LOG_Running);
	B_LogEntry(TOPIC_Jora,"Obchodníka Jora okradl chlapík jménem Rengaru, který se přes den potuluje po tržišti.");
	B_LogEntry_Quiet(TOPIC_JoraDieb,"Obchodníka Jora okradl chlapík jménem Rengaru - jestli ho chytím, možná z toho bude koukat i nějaká odměna.");
	Info_ClearChoices(DIA_Jora_HolDeinGold);
};


instance DIA_Jora_WegenDieb(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_WegenDieb_Condition;
	information = DIA_Jora_WegenDieb_Info;
	permanent = TRUE;
	description = "K tomu zloději...";
};


func int DIA_Jora_WegenDieb_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jora_WegenDieb_Info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//K tomu zloději...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Tak jak to vypadá? Chytils ho, a co je důležitější, máš to moje zlato?
	Info_ClearChoices(DIA_Jora_WegenDieb);
	if(Npc_IsDead(Rengaru))
	{
		Info_AddChoice(DIA_Jora_WegenDieb,"No, stala se mu taková tragická nehoda.",DIA_Jora_WegenDieb_Tot);
	}
	else if(Rengaru_InKnast == TRUE)
	{
		Info_AddChoice(DIA_Jora_WegenDieb,"Už jsem ho dostal. Je to v klidu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice(DIA_Jora_WegenDieb,"Utekl mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	Info_AddChoice(DIA_Jora_WegenDieb,"Ještě stále na tom pracuji!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//Ještě stále na tom pracuji!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Tak koukej, ať už to zlato mám zpátky!
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Utekl mi.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//A co moje zlato? To se taky ztratilo s ním?
	Jora_Dieb = LOG_SUCCESS;
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Ano, lapil jsem ho, jak se patří. Teď bude chvíli bručet v base.
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//A co moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//No, stala se mu taková tragická nehoda.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//Aspoň už nikomu nic neukradne. Innosova spravedlnost zvítězila!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Kde je moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	Info_ClearChoices(DIA_Jora_WegenDieb);
};


instance DIA_Jora_BringGold(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_BringGold_Condition;
	information = DIA_Jora_BringGold_Info;
	permanent = TRUE;
	description = "Tady je těch 50 zlatých, co ti ukradl.";
};


func int DIA_Jora_BringGold_Condition()
{
	if(((Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS)) && (Jora_Gold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jora_BringGold_Info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Tady je těch 50 zlatých, co ti ukradl.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Innos buď pochválen! Tak přece je tady ve městě ještě nějaká spravedlnost!
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Hej, tohle není 50 zlatých! Snažíš se mě taky oškubat, nebo co?
	};
};


var int Jora_GhdgHinweis;

instance DIA_Jora_GHDgInfo(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_GHDgInfo_Condition;
	information = DIA_Jora_GHDgInfo_Info;
	permanent = TRUE;
	description = "Co víš o cechu zlodějů?";
};


func int DIA_Jora_GHDgInfo_Condition()
{
	if((MIS_Andre_GuildOfThieves == LOG_Running) && Npc_KnowsInfo(other,DIA_Jora_Bestohlen) && (Jora_GhdgHinweis == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jora_GHDgInfo_Info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Co víš o cechu zlodějů?
	if(Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//No dobře, tak poslouchej- ale jako bych ti nic neřekl, kapišto?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//Do krčmy v docích chodí pár podezřelých týpků.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//Vsadím se, že i sám hospodský jich několik zná.
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Jestli chceš vystopovat zloděje, zkus si promluvit právě s NÍM.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//Můžeš třeba předstírat, že ses zapletl do něčeho nekalého. Na to by mohl naletět.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Ale měj přitom oči otevřené - s těmi lidmi si není radno zahrávat.
		Jora_GhdgHinweis = TRUE;
	};
};


instance DIA_Jora_Belohnung(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_Belohnung_Condition;
	information = DIA_Jora_Belohnung_Info;
	permanent = FALSE;
	description = "Ale za odměnu chci část zlata!";
};


func int DIA_Jora_Belohnung_Condition()
{
	if(Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Jora_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Ale za odměnu chci část zlata!
	if(Jora_GhdgHinweis == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Ale já už jsem ti dal cennou radu.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//Tohle by jako odměna mělo stačit.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//Jestli chceš zlato, tak vypátrej zloděje a pak si u lorda Andreho vyzvedni odměnu.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//Teď se musím zase věnovat zákazníkům.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jora_AlriksSchwert(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_AlriksSchwert_Condition;
	information = DIA_Jora_AlriksSchwert_Info;
	permanent = FALSE;
	description = "Alrik tvrdí, že máš jeho meč.";
};


func int DIA_Jora_AlriksSchwert_Condition()
{
	if(MIS_Alrik_Sword == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jora_AlriksSchwert_Info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Alrik tvrdí, že máš jeho meč.
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Myslíš toho otrhance, co mi prodal svou zbraň za pár pochodní a kousků masa?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Jo, to je on.

	if(Npc_HasItems(self,ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Jeho meč pořád ještě mám.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//A kolik za něj budeš chtít?

		if(Jora_Gold == LOG_SUCCESS)
		{
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//No, že jsi to ty...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//Ále, víš co? Vem si ho zadarmo. Když už nic jiného, vrátils mi moje peníze.
			B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//No, že jsi to ty - 50 zlatých.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(mrzutě) Já už ho ale nemám! Čert ví, kam se poděl.
	};
};


instance DIA_Jora_BUYAlriksSchwert(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_BUYAlriksSchwert_Condition;
	information = DIA_Jora_BUYAlriksSchwert_Info;
	permanent = TRUE;
	description = "Tady je 50 zlatých, a teď mi dej Alrikův meč.";
};


func int DIA_Jora_BUYAlriksSchwert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jora_AlriksSchwert) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) > 0))
	{
		return TRUE;
	};
};

func void DIA_Jora_BUYAlriksSchwert_Info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Tady je 50 zlatých, a teď mi dej Alrikův meč.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Tumáš - (vychytrale) byl to dobrý obchod.
		B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//Nemáš sice dost zlata, ale to nevadí - nějaký čas ti tu ten meč odložím. Takže se můžeš vrátit později.
	};
};


instance DIA_Jora_PICKPOCKET(C_Info)
{
	npc = VLK_408_Jora;
	nr = 900;
	condition = DIA_Jora_PICKPOCKET_Condition;
	information = DIA_Jora_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jora_PICKPOCKET_Condition()
{
	return C_Beklauen(31,45);
};

func void DIA_Jora_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
	Info_AddChoice(DIA_Jora_PICKPOCKET,Dialog_Back,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jora_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};

func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};


instance DIA_JORA_BENGARGOODS(C_Info)
{
	npc = VLK_408_Jora;
	nr = 700;
	condition = dia_jora_bengargoods_condition;
	information = dia_jora_bengargoods_info;
	permanent = FALSE;
	description = "Mám tu balíček od Bengara.";
};


func int dia_jora_bengargoods_condition()
{
	if((MIS_BENGARORDER == LOG_Running) && (Npc_HasItems(other,itmi_bengarpacket) >= 1))
	{
		return TRUE;
	};
};

func void dia_jora_bengargoods_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jora_BengarGoods_01_00");	//Mám tu balíček od Bengara.
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_01");	//Už jsem se nemohl dočkat!... (potěšeně)
	B_GiveInvItems(other,self,itmi_bengarpacket,1);
	Npc_RemoveInvItems(self,itmi_bengarpacket,1);
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_02");	//Takže je tu vše...
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_03");	//Hmmm, to vážně není špatné!
	AI_Output(other,self,"DIA_Jora_BengarGoods_01_06");	//A co teď?
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_07");	//A teď jdi za Luterem - bude s tebou chtít mluvit.
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_09");	//A řekni mu to.
	AI_Output(other,self,"DIA_Jora_BengarGoods_01_11");	//Tak ty ses vlastně přidal k cechu?
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_12");	//Samozřejmě, jinak by tě Lutero neposlal s balíčkem za mnou.
	AI_Output(other,self,"DIA_Jora_BengarGoods_01_16");	//Chápu, ale teď už raději jdu za Luterem.
	AI_Output(self,other,"DIA_Jora_BengarGoods_01_17");	//Ano, Ano! Jen jdi, ještě se uvidíme!
	AI_StopProcessInfos(self);
	JORATAKEPACK = TRUE;
	MIS_BENGARORDER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_SUCCESS);
	B_LogEntry(TOPIC_BENGARORDER,"Předal jsem Jorovi balíček od Bengara - byl velmi šťastný. Měl bych se vrátit za Luterem.");
};