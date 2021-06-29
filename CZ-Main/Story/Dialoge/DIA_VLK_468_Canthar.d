
instance DIA_Canthar_PICKPOCKET(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 900;
	condition = DIA_Canthar_PICKPOCKET_Condition;
	information = DIA_Canthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Canthar_PICKPOCKET_Condition()
{
	return C_Beklauen(20,25);
};

func void DIA_Canthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
	Info_AddChoice(DIA_Canthar_PICKPOCKET,Dialog_Back,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Canthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};

func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};


instance DIA_Canthar_EXIT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 999;
	condition = DIA_Canthar_EXIT_Condition;
	information = DIA_Canthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Canthar_EXIT_Info()
{
	//AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Mne nuzhno idti!
	//AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Kak znayesh'.
	AI_StopProcessInfos(self);
};

instance DIA_Canthar_PersonalCRIMES(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_PersonalCRIMES_Condition;
	information = DIA_Canthar_PersonalCRIMES_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Canthar_PersonalCRIMES_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PersonalCRIMES_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//Útočit na mě nebylo zrovna moudré.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//To sis myslel, že mě porazíš tak lehce?
	};

	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Buď mi to nějak vynahradíš, nebo počítej s tím, že toho budeš litovat.
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//Jak ti to mám vynahradit?
	B_Say_Gold(self,other,100);
	Info_ClearChoices(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice(DIA_Canthar_PersonalCRIMES,"Tolik zlata nemám!",DIA_Canthar_PersonalCRIMES_NotEnough);
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Canthar_PersonalCRIMES,"Vem si to zlato a budeme zase přátelé.",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Vem si to zlato a budeme zase přátelé.
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//Velmi rozumné.
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//Tolik zlata nemám!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//Tak proč mě okrádáš o můj drahocenný čas?
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Hallo(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_Hallo_Condition;
	information = DIA_Canthar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Hallo_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisonel) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed))
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Kohopak to tu máme?
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//Chceš se dostat do města, že ano?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Možná.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Hm! (odfrkne) Vypadáš jako uprchlík. Všichni uprchlíci chtějí do města.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//Možná že jsi dokonce bývalý trestanec z Hornického údolí.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//Je mi jedno odkud jsi, ale věřím, že pro tebe mám velmi zajímavou nabídku...
		Canthar_GotMe = TRUE;
	}
	else if(Hlp_IsItem(itm,ITAR_Bau_L) || Hlp_IsItem(itm,ITAR_Bau_M))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//Jak jde práce, rolníku?
		Info_ClearChoices(DIA_Canthar_Hallo);
		Info_AddChoice(DIA_Canthar_Hallo,"Vypadám snad jako rolník?",DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice(DIA_Canthar_Hallo,"Nemůžu si stěžovat.",DIA_Canthar_Hallo_Bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//Co pro tebe můžu udělat?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nemůžu si stěžovat.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//Co pro tebe mohu udělat?
	Info_ClearChoices(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Vypadám snad jako rolník?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//Úplně. Akorát nemluvíš jako rolník.
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//Myslím, že bych pro tebe měl jednu zajímavou nabídku...
	Canthar_GotMe = TRUE;
	Info_ClearChoices(DIA_Canthar_Hallo);
};


instance DIA_Canthar_WhatOffer(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_WhatOffer_Condition;
	information = DIA_Canthar_WhatOffer_Info;
	permanent = FALSE;
	description = "Jakou nabídku?";
};


func int DIA_Canthar_WhatOffer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Canthar_WhatOffer_Info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//Jakou nabídku?
	if(Canthar_GotMe == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//Podle toho jak vypadáš, tě stráže nepustí do města.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//Jestli budeš tak přesvědčivý i u brány, tak se do města asi nikdy nedostaneš.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//Můžu ti pomoct dostat se do města.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//Mám tady jeden papírek. Má královskou pečeť a podpis místodržícího. Propustku.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//S tímhle papírem si můžeš vypadat jak se ti zlíbí a stráže tě stejně nechají na pokoji.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//Máš zájem?
		Info_ClearChoices(DIA_Canthar_WhatOffer);
		Info_AddChoice(DIA_Canthar_WhatOffer,"Ne, nech si ten papír pro sebe.",DIA_Canthar_WhatOffer_No);
		Info_AddChoice(DIA_Canthar_WhatOffer,"Co za to chceš?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice(DIA_Canthar_WhatOffer,"A jak se ty dostaneš do města?",DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice(DIA_Canthar_WhatOffer,"V čem je háček?",DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//Jsem obchodní cestující. Mohu ti prodat pár věcí.
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Canthar obchoduje se spoustou zboží.");
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//V čem je háček?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//Nikde. Jen mi budeš dlužit menší laskavost.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//A jak se ty dostaneš do města?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//Stráže mě znají. Prostě řeknu, že jsem svou propustku ztratil.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//Co za to chceš?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//JÁ VĚDĚL, že ty jsi ten pravý!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Takže poslouchej. Dostaneš teď ode mě tu propustku.
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Jen tak?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Jen tak. ALE až tě potkám ve městě, budeš mi dlužit jednu laskavost.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Dohodnuto?
	Info_AddChoice(DIA_Canthar_WhatOffer,"Jasně, dej to sem.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Jasně, dej mi tu propustku.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Tady ji máš. Ale dej si pozor, je to velice cenný papír.
	CreateInvItems(self,ItWr_Passierschein,1);
	B_GiveInvItems(self,other,ItWr_Passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//Ještě něco. Ať tě ani nenapadne mě podrazit!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//Jakožto obchodník mám docela velký vliv ve městě, nelíbilo by se ti to.
	Canthar_Gefallen = TRUE;
	Info_ClearChoices(DIA_Canthar_WhatOffer);
	Log_CreateTopic(TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City,LOG_Running);
	B_LogEntry(TOPIC_City,"Od obchodníka Canthara jsem dostal propustku, s jejíž pomocí mohu vejít do města. Až ho tam potkám, dlužím mu za to protislužbu.");
};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//Ne! Nech si ten papír!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Hm. Vypadá to, že jsem se v tobě spletl, co?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//Dobrá. Chceš ještě něco? Můžu ti ukázat své zboží?
	Info_ClearChoices(DIA_Canthar_WhatOffer);
};


instance DIA_Canthar_TRADE(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 888;
	condition = DIA_Canthar_TRADE_Condition;
	information = DIA_Canthar_TRADE_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Canthar_TRADE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Canthar_WhatOffer) == TRUE) && Wld_IsTime(7,45,19,45))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Ukaž mi své zboží.
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Vyber si.
	B_GiveTradeInv(self);
};


instance DIA_Canthar_PAYPRICEINCITY(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_PAYPRICEINCITY_Condition;
	information = DIA_Canthar_PAYPRICEINCITY_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Canthar_PAYPRICEINCITY_Condition()
{
	if((Canthar_InStadt == TRUE) && (Npc_IsDead(Sarah) == FALSE) && (Canthar_GotMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PAYPRICEINCITY_Info()
{
	if(Canthar_Gefallen == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//Pořád mi dlužíš laskavost. Je načase splatit dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Hej, ty. Mám pro tebe nabídku.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//Co chceš?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//Chci svůj starý stánek na tržišti. Sarah mi ho sebrala.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//Ale už je tam dost dlouho. Chci aby mi to místo vrátila.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//Co já s tím?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//Dám ti dopis, který jí strčíš do kapsy.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Potom půjdeš za Andrem a řekneš mu, že Sarah prodává Onarovi zbraně.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//Ona poputuje do vězení, ty shrábneš zlato za odměnu a já budu mít svůj stánek.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//Máš na to dva dny.
	if(Canthar_Gefallen == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//Co za to?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//Až budu mít svůj stánek zpět, dostaneš ode mě zbraň - a ne ledajakou, zatraceně dobrou zbraň.
	};
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"Ne, nechci s tím mít co do činění.",DIA_Canthar_PAYPRICEINCITY_Nein);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"Dobře, udělám to.",DIA_Canthar_PAYPRICEINCITY_Ok);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"Co bude, když to neudělám?",DIA_Canthar_PAYPRICEINCITY_If);
};

func void DIA_Canthar_PAYPRICEINCITY_If()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//Co bude, když to neudělám?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//To by nebylo moc moudré, jelikož vím, že jsi uprchlý trestanec.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//Pokud se to dostane na veřejnost, mohlo by to tvé reputaci velice uškodit.
};

func void DIA_Canthar_PAYPRICEINCITY_Nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//Ne, nechci s tím mít co do činění.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//Špatná odpověď, chlapče. Ještě si promluvíme.
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	CantarMissSara = TRUE;
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

func void DIA_Canthar_PAYPRICEINCITY_Ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//Dobře, udělám to.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//Chytrej chlapík. Tady je ten dopis.
	CreateInvItems(self,ItWr_Canthars_KomproBrief_MIS,1);
	B_GiveInvItems(self,other,ItWr_Canthars_KomproBrief_MIS,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//Jak jí ten dopis mám podstrčit?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Nech ji, ať ti ukáže své zboží - a během toho k ní ten dopis schovej.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//A nezapomeň, že mám ve městě značný vliv, takže žádné hlouposti.
	MIS_Canthars_KomproBrief = LOG_Running;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay();
	Log_CreateTopic(TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Canthar,LOG_Running);
	if(Canthar_Gefallen == TRUE)
	{
		B_LogEntry(TOPIC_Canthar,"Canthar po mně nyní chce tu laskavost, kterou mu dlužím.");
	}
	else
	{
		B_LogEntry(TOPIC_Canthar,"Canthar mi slíbil dobrou zbraň, pokud se postarám o Sarah.");
	};
	B_LogEntry(TOPIC_Canthar,"Mám Sarah, obchodnici na tržišti, nenápadně podstrčit dopis, ve kterém je napsáno, že ilegálně obchoduje s Onarem. Potom to mám jít ohlásit lordu Andre.");
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

instance DIA_Canthar_SARAHERLEDIGT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SARAHERLEDIGT_Condition;
	information = DIA_Canthar_SARAHERLEDIGT_Info;
	permanent = TRUE;
	description = "Nemáš pro mne nějakou práci?";
};

func int DIA_Canthar_SARAHERLEDIGT_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && (Npc_IsDead(Sarah) == FALSE) && (Canthar_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAHERLEDIGT_Info()
{
	AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_09_00");	//Nemáš pro mne nějakou práci?
	AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//Nejdřív podstrč Sarah ten dopis a pak jdi za Andrem a obviň ji.
	AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Udělej to! A ať tě ani nenapadne mě podrazit, nebo to olituješ.
	AI_StopProcessInfos(self);
};

instance DIA_Canthar_SARAISDEAD(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SARAISDEAD_Condition;
	information = DIA_Canthar_SARAISDEAD_Info;
	permanent = TRUE;
	description = "Sarah je mrtvá!";
};

func int DIA_Canthar_SARAISDEAD_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && (Npc_IsDead(Sarah) == TRUE) && (Canthar_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAISDEAD_Info()
{
	AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Sarah je mrtvá!
	AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Vážně? Skvělé. V tom případě jsi splnil svou část naší malé dohody.
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MARKTSTAND");
};

instance DIA_Canthar_Success(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Success_Condition;
	information = DIA_Canthar_Success_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Canthar_Success_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Ausgeliefert == FALSE) && (MIS_Canthars_KomproBrief == LOG_SUCCESS) && (CantarMissSara == FALSE) && (Npc_IsDead(Sarah) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Success_Info()
{
	B_GivePlayerXP(XP_Canthars_KomproBrief);
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Výborně! Sarah je tam, kde být má.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//Mám teď její zboží, takže jestli potřebuješ nějakou zbraň, přijď za mnou.

	if(Kapitel >= 1)
	{
		CreateInvItems(self,ItMw_1h_Vlk_Dagger,20);
		CreateInvItems(self,ItLsTorch,20);
		CreateInvItems(self,ItRw_Arrow,50);
		CreateInvItems(self,ItMw_2H_Axe_L_01,1);
		CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(self,ItMw_1H_Sword_L_03,1);
		CreateInvItems(self,ItMw_ShortSword2,1);
		CreateInvItems(self,ItRi_HP_01,1);
	};
	if(Kapitel >= 2)
	{
		CreateInvItems(self,ItLsTorch,5);
		CreateInvItems(self,ItRw_Arrow,50);
	};
	if(Canthar_Gefallen == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//Měl jsi mi za to dát zbraň.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Správně. Tady, tahle zbraň je mistrovský kousek.
		B_GiveInvItems(self,other,ItMw_1H_Mace_L_01,1);
	};

	AI_StopProcessInfos(self);
};

instance DIA_Canthar_Again(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Again_Condition;
	information = DIA_Canthar_Again_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Again_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Again_Info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Och, tady jsi.

	if(MIS_Canthars_KomproBrief == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Jak to, že nejsi ve vězení?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//Pustili mě. Já ti říkal, že mám ve městě značný vliv.
	}
	else if(MIS_Canthars_KomproBrief == LOG_Running)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//Mezitím jsem se postaral o tu záležitost se Sarah sám. Můžeš na tu věc s dopisem zapomenout.
	}
	else if(MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Copak jsem tě nevaroval? Měl jsi udělat to, co jsem po tobě chtěl.
	};

	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//Teď se mezi obchodníky šušká, že jsi trestanec.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//Politováníhodná věc - teď ti neprodají na tržišti ani kousek chleba.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//Samozřejmě bych mohl věci urovnat, řekněme...
	B_Say_Gold(self,other,Canthar_Gold);
	KnowCantarFree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Canthar_Pay(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_Pay_Condition;
	information = DIA_Canthar_Pay_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Canthar_Pay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Again) && (Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Pay_Info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Přišel jsi zaplatit?
	Info_ClearChoices(DIA_Canthar_Pay);
	if(Npc_HasItems(other,ItMi_Gold) >= Canthar_Gold)
	{
		Info_AddChoice(DIA_Canthar_Pay,"Dobře, zaplatím.",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice(DIA_Canthar_Pay,"Nemám tolik zlata...",DIA_Canthar_Pay_Nein);
	Info_AddChoice(DIA_Canthar_Pay,"Kolik že mám zaplatit?",DIA_Canthar_Pay_Wieviel);
};

func void DIA_Canthar_Pay_Ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//Dobře, zaplatím. Zdá se, že nemám na výběr.
	B_GiveInvItems(other,self,ItMi_Gold,Canthar_Gold);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//Skvěle. Postarám se o to, aby tvá reputace u obchodníků zase stoupla.
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE;
	Info_ClearChoices(DIA_Canthar_Pay);
};

func void DIA_Canthar_Pay_Nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//Nemám tolik zlata...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Tak ho sežeň.
	Info_ClearChoices(DIA_Canthar_Pay);
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_Pay_Wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//Kolik že to bylo?
	B_Say_Gold(self,other,Canthar_Gold);
};


instance DIA_Canthar_CANTHARANGEPISST(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_CANTHARANGEPISST_Condition;
	information = DIA_Canthar_CANTHARANGEPISST_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Canthar_CANTHARANGEPISST_Condition()
{
	if((Canthar_Ausgeliefert == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_CANTHARANGEPISST_Info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//Varoval jsem tě, ale tys mě neposlechl. Promluvíme si o tom později.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//Teď zmizni, chci si odpočinout.
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_MinenAnteil(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = DIA_Canthar_MinenAnteil_Condition;
	information = DIA_Canthar_MinenAnteil_Info;
	description = "Prodáváš falešné důlní akcie!";
};


func int DIA_Canthar_MinenAnteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Canthar_WhatOffer) && (Npc_HasItems(self,ItWr_MinenAnteil_Mis) > 0))
	{
		return TRUE;
	};
};

func void DIA_Canthar_MinenAnteil_Info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//Prodáváš falešné důlní akcie!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//No a? Kdybych je neprodával já, dělal by to někdo jiný.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_CANTHAR_KILLNOW(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = dia_canthar_killnow_condition;
	information = dia_canthar_killnow_info;
	description = "Obávám se, že pro tebe mám špatné zprávy.";
};


func int dia_canthar_killnow_condition()
{
	if(MIS_KILLTARGET3 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_canthar_killnow_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Canthar_KillNow_01_00");	//Obávám se, že pro tebe mám špatné zprávy.
	AI_Output(other,self,"DIA_Canthar_KillNow_01_02");	//Brzy zemřeš.
	AI_Output(self,other,"DIA_Canthar_KillNow_01_03");	//Cože?! (směje se) Proč si to myslíš?
	AI_Output(self,other,"DIA_Canthar_KillNow_01_05");	//Co jsi zač, nějaký věštec? (směje se)
	AI_Output(other,self,"DIA_Canthar_KillNow_01_12");	//Ne, nejsem Canthare. Někteří lidé si přejí tvou smrt.
	AI_Output(self,other,"DIA_Canthar_KillNow_01_15");	//Zatraceně! (vyděšeně) Co to má znamenat? Stráže!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

