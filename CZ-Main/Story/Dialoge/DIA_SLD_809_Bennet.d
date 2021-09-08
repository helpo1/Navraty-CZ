
instance DIA_Bennet_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_HALLO(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_HALLO_Condition;
	information = DIA_Bennet_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_HALLO_Condition()
{
	if((Kapitel < 3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Neprodávám žádné zbraně! Khaled je prodává. Je v domě s Onarem.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"Khaled prodává zbraně.");
};


instance DIA_Bennet_TRADE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 700;
	condition = DIA_Bennet_TRADE_Condition;
	information = DIA_Bennet_TRADE_Info;
	permanent = TRUE;
	description = "Můžeš mi prodat nějaké věci na kování?";
	trade = TRUE;
};


func int DIA_Bennet_TRADE_Condition()
{
	if(Wld_IsTime(8,0,22,0) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

var int bennetarrowsday;

func void DIA_Bennet_TRADE_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//Můžeš mi prodat nějaké věci na kování?
	daynow = Wld_GetDay();

	if(BENNETARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (BENNETARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - BENNETARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
			BENNETARROWSDAY = daynow;
		};
	}
	else
	{
		Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	};

	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Co potřebuješ?

	if(BennetLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Bennet prodává kovářské náčiní.");
		BennetLOG = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
};


instance DIA_Bennet_WhichWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = DIA_Bennet_WhichWeapons_Condition;
	information = DIA_Bennet_WhichWeapons_Info;
	permanent = FALSE;
	description = "Jaké zbraně vyrábíš?";
};


func int DIA_Bennet_WhichWeapons_Condition()
{
	if(((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)) && (MIS_Bennet_BringOre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Jaké zbraně vyrábíš?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//V tuhle chvíli obyčejné meče, nic jiného.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Ale kdybych měl trochu magické rudy, mohl bych ukovat zbraně, které jsou mnohem lepší než všechny srovnatelné zbraně vyrobené z normální staré oceli.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Nevíš náhodou, kde bych tady v okolí nějakou našel? (směje se) Mám na mysli kromě Hornického údolí samozřejmě.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Samozřejmě že ne.
};


instance DIA_Bennet_BauOrSld(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = DIA_Bennet_BauOrSld_Condition;
	information = DIA_Bennet_BauOrSld_Info;
	permanent = FALSE;
	description = "Jsi s rolníky, nebo žoldákama?";
};


func int DIA_Bennet_BauOrSld_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Jsi s rolníky, nebo s žoldákama?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ty si ze mě utahuješ, že jo?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Byl jsem jenom zvědavý.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Už jsi někdy viděl rolníka kovat zbraně?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Tak proč mi dáváš tak hloupé otázky?
};

instance DIA_Bennet_WannaJoin(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 4;
	condition = DIA_Bennet_WannaJoin_Condition;
	information = DIA_Bennet_WannaJoin_Info;
	permanent = TRUE;
	description = "Chci se přidat k žoldákům!";
};

func int DIA_Bennet_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_BauOrSld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Chci se přidat k žoldákům!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Přestaň žvanit, běž za Torlofem a nech ho, ať ti dá test.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Prošel jsem zkouškou.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Dobře, tak to pro tebe budu hlasovat.
	};
};


instance DIA_Bennet_WannaSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_WannaSmith_Condition;
	information = DIA_Bennet_WannaSmith_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit, jak ukovat meč?";
};


func int DIA_Bennet_WannaSmith_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Můžeš mě naučit, jak ukovat meč?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Jasně.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//To tě bude něco stát. Řekněme 30 zlatých.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Možná později.",DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Dobře. Tady máš 30 zlatých.",DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Dobře. Tady máš 30 zlatých.

	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//A to byla taky zatraceně dobrá cena! Můžeme začít jakmile budeš připraven.
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Bennet mě naučí kovářskému umění.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Přestaň se chovat jako naivka. Říkám 30 a ani o zlaťák míň.
	};
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Možná později.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};


instance DIA_Bennet_TeachCOMMON(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 6;
	condition = DIA_Bennet_TeachCOMMON_Condition;
	information = DIA_Bennet_TeachCOMMON_Info;
	permanent = TRUE;
	description = "Naučit se kovářství.";
};

func int DIA_Bennet_TeachCOMMON_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Nauč mne ukovat meč!
	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
	Info_AddChoice(DIA_Bennet_TeachCOMMON,Dialog_Back,DIA_Bennet_TeachCOMMON_Back);
	Info_AddChoice(DIA_Bennet_TeachCOMMON,b_buildlearnstringforsmithhunt("Naučit se základy kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_TeachCOMMON_WEAPON);
};

func void DIA_Bennet_TeachCOMMON_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
};

func void DIA_Bennet_TeachCOMMON_WEAPON()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Je to celkem jednoduché: Vezmi kus surového železa a drž ho v ohni do doby, než se rozžhaví.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Pak ho polož na kovadlinu a roztepej čepel do potřebného tvaru.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Hlavně musíš dávat pozor, aby čepel příliš nevychladla. Na opracování zbraně máš vždycky jenom pár minut času...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//Na zbytek přijdeš sám - je to jenom otázka praxe.
	};

	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
};

instance DIA_Bennet_WannaSmithORE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 7;
	condition = DIA_Bennet_WannaSmithORE_Condition;
	information = DIA_Bennet_WannaSmithORE_Info;
	permanent = TRUE;
	description = "Nauč mne kovat zbraně z magické rudy!";
};

func int DIA_Bennet_WannaSmithORE_Condition()
{
	if((Bennet_TeachSmith == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Nauč mne kovat zbraně z magické rudy!

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Ale ty neznáš vůbec ani základy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Nejdříve se musíš naučit ukovat obyčejný meč. Pak uvidíme.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Protože nejsi jedním z nás, tak bych byl v háji, kdybych ti vyzradil tajemství zbraní z magické rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Pouze velmi málo kováren tohle všechno umí, a já věřím, že to nedokáží dokonce ani kováři ve městě.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//A to je taky dobře. Jinak by všichni ty městský ochlastové ve stráži nosili magické meče.

		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nic proti tobě. (kření se) Vypadáš být v pohodě.
		};
	}
	else if(MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Kdybych měl magickou rudu, dokonce i já bych to tak udělal.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ale, no táák - jsem s žoldákama, a umím kovat - co jiného chceš?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Můžeš mi tedy potom říct, jak mám ukovat zbraň z magické rudy bez použití magické rudy?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Noooo...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//To jsem si myslel. Potřebuju nejméně 5 hroudek této rudy - nebo na to rovnou zapomeň.

		if(MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_Running;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Skvěle, přinesl jsi mi rudu a také víš, jak ukovat normální meč.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//No, tak tedy povídej...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Nejdůležitější věc je: Nezáleží na tom, zdali je tvá celá zbraň vyrobená z magické rudy, nebo jestli máš pokrytou jen obyčejnou ocelovou čepel vrstvou rudy. Povrch je to, na čem záleží.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//A protože je ten mizernej materiál tak drahej, popadni ocelovej prut a použij pár hrud rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Přirozeně z toho nevznikne nic jinýho, než že to jenom pokryje hotový meč magickou rudou. Budeš muset ukovat ten meč od začátku.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//Všechno ostatní závisí na zbrani, kterou chceš vyrobit.
		Bennet_TeachSmith = TRUE;
	};
};

instance DIA_Bennet_WhereOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhereOre_Condition;
	information = DIA_Bennet_WhereOre_Info;
	permanent = FALSE;
	description = "Kde můžu najít magickou rudu?";
};

func int DIA_Bennet_WhereOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Kde můžu najít magickou rudu?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//No, kdybych tohle jenom věděl. Nějaká určitě bude v trestanecké kolonii.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Ale možná budeš mít štěstí a najdeš tady v okolí pár zbytků.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Myslím, že v horách jižně odsud jsou nějaké doly. Možná, že bys tam měl větší štěstí.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Ale dávej bacha, slyšel jsem, že se to tam hemží banditama.
};

instance DIA_Bennet_BringOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_BringOre_Condition;
	information = DIA_Bennet_BringOre_Info;
	permanent = FALSE;
	description = "Tady máš těch pět kousků rudy!";
};

func int DIA_Bennet_BringOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Tady máš těch pět kousků rudy!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(směje se) Ukaž!
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItMi_Nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Skutečně! Tohle mě fakt srazilo k zemi!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Dvě si nech. Budeš je potřebovat, abys mohl ukovat svojí vlastní zbraň.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

func void B_SayBennetLATER()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Ne, ještě ne. Vrať se později.
};


instance DIA_Bennet_TeachSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 30;
	condition = DIA_Bennet_TeachSmith_Condition;
	information = DIA_Bennet_TeachSmith_Info;
	permanent = TRUE;
	description = "Chci vědět víc o kutí zbraní z magické rudy.";
};

func int DIA_Bennet_TeachSmith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Chci vědět víc o kutí zbraní z magické rudy.

	if(Wld_IsTime(8,0,22,0))
	{
		if((Kapitel == 1) && (Bennet_Kap2Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Mohu tě naučit, jak kovat meče z magické rudy nebo dokonce obouruční zbraně.
			Bennet_Kap2Smith = TRUE;
		}
		else if((Kapitel == 2) && (Bennet_Kap3Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Zdokonalil jsem svojí techniku. Nyní tě mohu naučit, jak vytvořit s pomocí rudy těžké meče nebo těžké obouruční meče.
			Bennet_Kap3Smith = TRUE;
		}
		else if((Kapitel == 3) && (Bennet_Kap4Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Myslím, že jsem se tentokrát překonal. Vytvořil jsem dvě bojové čepele. To je ta nejlepší věc, jakou jsem doteď viděl.
			Bennet_Kap4Smith = TRUE;
		}
		else if((Kapitel == 4) && (Bennet_Kap5Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Poslyš! Myslím, že jsem právě dostal dokonalý nápad. Zbraně z magické rudy, potřísněné dračí krví. A já přesně vím, jak na to půjdu!
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(zubí se) Chceš to vědět?
			Bennet_Kap5Smith = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Jaký druh zbraně bys chtěl vyrobit?
		};

		Info_ClearChoices(DIA_Bennet_TeachSmith);
		Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);

		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 4))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 4))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_02");	//Už jsem skončil práci v kovárně. Přijd zítra ráno.
	};
};

func void DIA_Bennet_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_04);
};

instance DIA_Bennet_KAP3_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP3_EXIT_Condition;
	information = DIA_Bennet_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP3_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_WhyPrison(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhyPrison_Condition;
	information = DIA_Bennet_WhyPrison_Info;
	permanent = FALSE;
	description = "Za co ses dostal do lochu?";
};

func int DIA_Bennet_WhyPrison_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (DarkPathStart == FALSE) && (MeetDarkRavenSpeaker == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Za co ses dostal do lochu?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Ty svině mě hodily do týhle díry. Prý jsem zavraždil paladina.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Ale já jsem to neudělal, oni se to jenom pokouší na mě hodit.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Proč by to dělali?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Jak to mám vědět? Měl bys mne odtud dostat.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Promluv s lordem Hagenem, probourej zeď, je to jedno - prostě něco udělej!
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet,"Bennet je v pěkné bryndě a teď by udělal cokoliv, jen aby se dostal z basy.");
};

instance DIA_Bennet_Victim(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Victim_Condition;
	information = DIA_Bennet_Victim_Info;
	permanent = FALSE;
	description = "Kdo byl zavražděn?";
};


func int DIA_Bennet_Victim_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Kdo byl zavražděn?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Nemám ponětí - jeden z paladinů, vůbec je neznám.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Jak se jmenoval?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Nějaký Lothar, myslím. No, nevím, opravdu si nejsem jistej.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Radši by ses měl zeptat lorda Hagena, on zná všechny detaily.
	B_LogEntry(TOPIC_RescueBennet,"Lothar, jeden z paladinů, byl zavražděn. Bližší informaci by mi mohl podat lord Hagen, který vede celé vyšetřování.");
};


instance DIA_Bennet_Evidence(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Evidence_Condition;
	information = DIA_Bennet_Evidence_Info;
	permanent = FALSE;
	description = "Mají proti tobě nějaký důkaz?";
};


func int DIA_Bennet_Evidence_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Mají proti tobě nějaký důkaz?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//Říkají, že mají nějakého svědka, který mne poznal.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Nevíš náhodou, kdo je ten svědek?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Ne. Všechno, co vím, je, že je to lhář.
	B_LogEntry(TOPIC_RescueBennet,"Jeden svědek tvrdí, že Benneta viděl. Musím ho najít a zjistit, jak to bylo doopravdy.");
	RescueBennet_KnowsWitness = TRUE;
};


instance DIA_Bennet_Investigation(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Investigation_Condition;
	information = DIA_Bennet_Investigation_Info;
	permanent = FALSE;
	description = "Kdo vede vyšetřování?";
};


func int DIA_Bennet_Investigation_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Kdo vede vyšetřování?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Sám lord Hagen. A protože obětí byl jeden z paladinů, spadá tenhle případ pod válečný soud.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Co to znamená?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//To je jednoduchý uhodnout. Pokud se odtud nedostanu, bez okolků mě pověsí.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Musíš mi pomoct, nebo tady bude válka. Lee to nenechá být jen tak.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Můžeš si dát dohromady sám, co to znamená.
};


instance DIA_Bennet_ThankYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ThankYou_Condition;
	information = DIA_Bennet_ThankYou_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_ThankYou_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	if(hero.guild == GIL_SLD)
	{
		hero.guild = GIL_DJG;
		CheckHeroGuild[0] = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Chlape, už jsem si myslel, že mě vážně pověsí!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//No, nakonec to dobře dopadlo.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//To mi povídej. Měl jsi vidět ksicht toho vojáka, když mě musel pustit ven!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(směje se) Byl tak vystrašenej, že si skoro nadělal do kalhot.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Což mi připomíná, že pro tebe něco mám.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Co myslíš?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(kření se) Dáreček.!
};

var int BennetNeedSteel;

instance DIA_Bennet_Present(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Present_Condition;
	information = DIA_Bennet_Present_Info;
	permanent = FALSE;
	description = "Jaký dáreček?";
};

func int DIA_Bennet_Present_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Jaký dáreček?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Slyšeli jsme o dracích, kteří by měli prý bejt v údolí.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Oni tam skutečně jsou!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Dobře, já ti věřím.

	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//V každém případě se pár chlapců rozhodlo jít do údolí.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(zubí se) Mají v plánu to tam trochu uklidit.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//A co to má co dělat se mnou?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(pyšně) Vytvořil jsem nový typ zbroje. Zbroj drakobijců!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Je robustnější a lehčí než normální zbroj.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//A protože jsi mě zachránil, chci, abys dostal první kus. Je to dar!
		CreateInvItems(self,itar_djg_l,1);
		B_GiveInvItems(self,other,itar_djg_l,1);
		SHOW_DJG_ARMOR_L = TRUE;
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Myslel jsem, že by se ti to mohlo hodit. Budeš potřebovat to správné vybavení, než půjdeš tam dolů do údolí.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Také mě zajímají dračí šupiny. Opravdové dračí šupiny. Slušně ti za ně zaplatím!
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Kolik dostanu za jednu šupinu?
		B_Say_Gold(self,other,Value_DragonScale);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Kromě toho jsem si myslel, že by sis asi nechtěl nechat ten dračí hon ujít.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//A?
		AI_Output(self,other,"DIA_Bennet_Present_06_95");	//Tady, vezmi si tenhle amulet. Myslím, že ho budeš potřebovat víc než já.
		B_GiveInvItems(self,other,ItMi_Gold,1000);
	};

	BennetNeedSteel = TRUE;
};


var int Bennet_DragonScale_Counter;

instance DIA_Bennet_DragonScale(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DragonScale_Condition;
	information = DIA_Bennet_DragonScale_Info;
	permanent = TRUE;
	description = "Mám pro tebe pár dračích šupin.";
};


func int DIA_Bennet_DragonScale_Condition()
{
	if((Npc_HasItems(other,ItAt_DragonScale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Mám pro tebe pár dračích šupin.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Opravdové dračí šupiny!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Tady je tvé zlato!
	Bennet_DragonScale_Counter = Bennet_DragonScale_Counter + Npc_HasItems(other,ItAt_DragonScale);
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_DragonScale) * Value_DragonScale);
	B_GiveInvItems(other,self,ItAt_DragonScale,Npc_HasItems(other,ItAt_DragonScale));

	if((Bennet_DragonScale_Counter >= 20) && (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Dobře, to by stačilo. Mohl bych ti prodat novou, vylepšenou zbroj, pokud bys měl zájem.
		Show_DJG_Armor_M = TRUE;
	};
};


var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;

instance DIA_Bennet_DJG_ARMOR_M(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_M_Condition;
	information = DIA_Bennet_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "Středně těžká drakobijecká zbroj. (12000 zlatých)";
};

func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (Show_DJG_Armor_M == TRUE) && (Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Chci si koupit novou zbroj.

	if(Npc_HasItems(other,ItMi_Gold) >= 12000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,12000);
		Npc_RemoveInvItems(self,ItMi_Gold,12000);
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Velmi dobře. Bude se ti to líbit.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Za tu cenu by opravdu mělo.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Zjistíš, že ta zbroj stojí za každej zlaťák.
		CreateInvItems(self,itar_djg_m,1);
		B_GiveInvItems(self,other,itar_djg_m,1);
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//Nemáš dost zlata!
	};
};


instance DIA_Bennet_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Condition;
	information = DIA_Bennet_BetterArmor_Info;
	permanent = FALSE;
	description = "Vím, jak zbroj ještě víc vylepšit.";
};

func int DIA_Bennet_BetterArmor_Condition()
{
	if((DragonHigh == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Vím, jak zbroj ještě víc vylepšit.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(usmívá se) Tak mi to řekni.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Mohl bys pokrýt dračí šupiny magickou rudou.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(směje se) Tohle mě už taky napadlo. A máš pravdu.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Má nejnovější zbroj předčí všechno, co jsi doposud viděl. Je teď lehká a masivní.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Je PERFEKTNÍ!
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Můžeš ji koupit, jestli chceš. Nedávám tuhle nabídku jen tak někomu a navíc cena zahrnuje pouze výrobní náklady.
};


var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;

instance DIA_Bennet_DJG_ARMOR_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_H_Condition;
	information = DIA_Bennet_DJG_ARMOR_H_Info;
	permanent = TRUE;
	description = "Těžká drakobijecká zbroj. (15000 zlatých)";
};

func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Dej mi tu zbroj.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Tohle je nejlepší zbroj, jakou jsem kdy vyrobil.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Opravdový skvost.
		CreateInvItems(self,itar_djg_h,1);
		B_GiveInvItems(self,other,itar_djg_h,1);
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
		SHOW_DJG_ARMOR_H = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//Nemáš dost zlata!
	};
};

var int Bennet_DIA_Bennet_DJG_HELM_H_permanent;

instance DIA_Bennet_DJG_HELM_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_DJG_HELM_H_Condition;
	information = DIA_Bennet_DJG_HELM_H_Info;
	permanent = TRUE;
	description = "Koupit helmu drakobijce. (cena: 6000 zlatých)";
};

func int DIA_Bennet_DJG_HELM_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_HELM_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor) && (hero.guild == GIL_DJG))

	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_HELM_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_HELM_H_15_00");	//Dej mi helmu drakobijce.

	if(Npc_HasItems(other,ItMi_Gold) >= 6000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,6000);
		Npc_RemoveInvItems(self,ItMi_Gold,6000);
		AI_Output(self,other,"DIA_Bennet_DJG_HELM_H_06_01");	//Vyborná volba, tady ji máš!
		CreateInvItems(self,itar_djg_helm,1);
		B_GiveInvItems(self,other,itar_djg_helm,1);
		Bennet_DIA_Bennet_DJG_HELM_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_HELM_H_06_03");	//Nemáš dost zlata!
	};
};

instance DIA_Bennet_RepairNecklace(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_RepairNecklace_Condition;
	information = DIA_Bennet_RepairNecklace_Info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
};

func int DIA_Bennet_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Záleží na tom, jaké. Nejdřív mi ukaž, co máš na mysli.
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Taky se odsud musím nejdřív dostat.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Předtím ti tu věc zřejmě neopravím.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_ShowInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ShowInnosEye_Condition;
	information = DIA_Bennet_ShowInnosEye_Info;
	permanent = FALSE;
	description = "Můžeš se podívat na tenhle amulet?";
};


func int DIA_Bennet_ShowInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Můžeš se podívat na tenhle amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Jasně, ukaž mi ho.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmm, to je skutečně nádherná práce. Oprava bude záhul. Ale myslím si, že jsem schopnej to opravit.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Jak dlouho ti to potrvá?
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//No, teď jsem se zaseknul tady. Nebo tu snad vidíš někde dílnu?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Kdybych byl ve své kovárně, byl bych schopnej to všechno udělat za jeden den. Ale samozřejmě se musím nejdřív dostat ven.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Pokud mi ho tu necháš, bude hotovej do doby, než se sem zítra vrátíš.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//A dokonce ti to ani nebudu účtovat. Vždyť jsi mě dostal ven z lochu.
	};
	B_LogEntry(TOPIC_INNOSEYE,"Bennet je ten pravý kovář, který mi opraví ten amulet.");
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_GiveInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GiveInnosEye_Condition;
	information = DIA_Bennet_GiveInnosEye_Info;
	permanent = FALSE;
	description = "Tady je ten amulet, oprav mi ho, prosím.";
};


func int DIA_Bennet_GiveInnosEye_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) >= 1) && (MIS_SCKnowsInnosEyeIsBroken == TRUE) && (MIS_RescueBennet == LOG_SUCCESS) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Tady je ten amulet, oprav mi ho, prosím.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Dobře. Budu to mít opravené do zítřka.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Můžeš potom ke mně přijít a dostat ho.
	Npc_RemoveInvItems(other,ItMi_InnosEye_Broken_Mis,1);
	AI_Print(Print_InnoseyeGiven);
	Bennet_RepairDay = Wld_GetDay();
};


instance DIA_Bennet_GetInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GetInnosEye_Condition;
	information = DIA_Bennet_GetInnosEye_Info;
	permanent = TRUE;
	description = "Je amulet hotový?";
};


func int DIA_Bennet_GetInnosEye_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Je amulet hotový?
	if(Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Ano, tady.
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other,ItMi_InnosEye_Broken_Mis,1);
		AI_Print(Print_InnosEyeGet);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Musel jsem tam zasadit nový kámen.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Pracoval jsem na něm celou noc a teď vypadá jako nový.
		B_LogEntry(TOPIC_INNOSEYE,"Amulet je opět celý, Bennet odvedl skvělou práci.");
		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;
		B_GivePlayerXP(XP_InnosEyeIsRepaired);
	}
	else
	{
		B_SayBennetLATER();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Pokud mě budeš zdržovat, bude to trvat déle.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bennet_KAP4_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP4_EXIT_Condition;
	information = DIA_Bennet_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP4_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DRACHENEIER(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_DRACHENEIER_Condition;
	information = DIA_Bennet_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Je něco, co můžeš udělat s dračími vejci?";
};


func int DIA_Bennet_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && (BennetsDragonEggOffer == 0) && (Npc_HasItems(other,ItAt_DragonEgg_MIS) >= 1))
	{
		return TRUE;
	};
};


var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;

func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Je něco, co můžeš udělat s dračími vejci?

	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Dračími vejci? Jak jsi k nim krucinál přišel?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Vzal jsem je ještěranům.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Ukaž mi ho.
	};

	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);

	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Hmm. Velmi šikovný materiál. Ideální k dokončení zbroje. Teda pokud se mi je podaří rozlousknout.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Takže co bude? Chceš je?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Jasně! Dej je sem.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Jak dlouho tu budeš s tou věcí mávat? Chceš, abych to koupil, nebo ne?
	};

	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Zaplatím ti, hmm, řekněme, 300 zlatých za každé dračí vejce, které mi přineseš.
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Tak si nech svoje zlato. Myslím, že si to nechám.",DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Toto jsou dračí vejce, ne bezcenná slepičí vejce!",DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Dohodnuto!",DIA_Bennet_DRACHENEIER_ok);

	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_DRACHENEIER,"Bennet je připraven mi za dračí vejce které najdu dobře zaplatit.");
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Dohodnuto!
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Dobře.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Tak tyhle věcičky nos dál, pokud je budeš schopen dostat.

	if(BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};

	B_GiveInvItems(self,other,ItMi_Gold,BennetsDragonEggOffer);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Ehm. Říkáš, že jsi je vzal ještěranům?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Správně.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Z toho, co jsem slyšel, tak většina ještěranů bydlí v jeskyních.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Nepřekvapilo by mě, kdybys našel víc těchhle věcí v jeskyních tady v okolí.
	B_LogEntry(TOPIC_DRACHENEIER,"Bennet si myslí, že bych se po vejcích měl podívat v khoriniských jeskyních, kde by měli ještěrani přebývat.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Tady. Vem si tuhle mapu. Ta ti pomůže najít ty jeskyně.
	B_GiveInvItems(self,other,itwr_map_caves_mis_1,1);
	B_LogEntry(TOPIC_DRACHENEIER,"Bennet mi dal mapu jeskyní, která by mi měla pomoci.");
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Tohle jsou dračí vejce, ne bezcenná slepičí vajíčka.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(podrážděně) Dobře. Tak 350. Ale víc ti za ně už dát nemůžu - pak by se mi to nevyplatilo.
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Tak si nech svoje zlato. Myslím, že si to nechám.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Dej mi vědět, až si to rozmyslíš.
	B_GiveInvItems(self,other,ItAt_DragonEgg_MIS,1);
	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};


instance DIA_Bennet_EierBringen(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_EierBringen_Condition;
	information = DIA_Bennet_EierBringen_Info;
	permanent = TRUE;
	description = "Zajímají tě ještě další dračí vejce?";
};

func int DIA_Bennet_EierBringen_Condition()
{
	if((BennetsDragonEggOffer > 0) && (Kapitel >= 4) && (Npc_HasItems(other,ItAt_DragonEgg_MIS) >= 1))
	{
		return TRUE;
	};
};


var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;

	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Zajímají tě ještě další dračí vejce?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Jistě!
	DragonEggCount = Npc_HasItems(other,ItAt_DragonEgg_MIS);

	if(DragonEggCount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Tady. Mám další.
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);
		DragonEggCounter = DragonEggCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//Mám tady ještě nějaký.
		B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,DragonEggCount);
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,DragonEggCount);
		XP_DJG_BringDragonEggs = DragonEggCount * XP_DJG_BringDragonEgg;
		DragonEggCounter = DragonEggCounter + DragonEggCount;
		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};
	if(DragonEggCounter <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Skvěle. Dej to sem. Díval ses po nich všude? Jistě musí někde být ještě nějaké.
	}
	else if(DragonEggCounter <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Kde tyhle věcičky vůbec pořád nacházíš? Vsadím se, že už jich tady moc nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Nemyslím si, že teď nějaké další najdeš. A já už jich mám tolik, že ani nevím, co s nimi budu dělat.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Jo, správně. Tady máš peníze.
	DragonEggGeld = DragonEggCount * BennetsDragonEggOffer;
	B_GiveInvItems(self,other,ItMi_Gold,DragonEggGeld);
};


instance DIA_Bennet_KAP5_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP5_EXIT_Condition;
	information = DIA_Bennet_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP5_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_KnowWhereEnemy(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_KnowWhereEnemy_Condition;
	information = DIA_Bennet_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Potřebuju se dostat na ostrov. Kovář by se mi mohl hodit.";
};


func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Bennet_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Potřebuju se dostat na ostrov. Kovář by se mi mohl hodit.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//A to si myslel jako mne?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Jo. Co na to říkáš? V každém případě by tě to dostalo odtud pryč.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Je to lepší než Onarova farma. Chlapče, dokonce i peklo nemůže být tak špatné. Počítej se mnou.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Bennet by mohl odejít klidně hned teď. Jeho kovářskému umění se hned tak někdo nevyrovná a já se od něj mohu lecos přiučit.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Má posádka je v tuto chvíli již kompletní.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Pak tedy jednoho z nich pošli zase pryč.
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Dám ti včas vědět až tě budu potřebovat.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Tak buď tedy mým kovářem. Sejdeme se v přístavu.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Tak buď tedy mým kovářem. Sejdeme se v přístavu.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Dobře. Uvidíme se později.
	B_GivePlayerXP(XP_Crewmember_Success);
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Dám ti včas vědět až tě budu potřebovat
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Fajn. Budu tady.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};


instance DIA_Bennet_LeaveMyShip(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_LeaveMyShip_Condition;
	information = DIA_Bennet_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Budu si muset najít jiného kováře.";
};


func int DIA_Bennet_LeaveMyShip_Condition()
{
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Budu si muset najít jiného kováře.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Jednou je to takhle a za chvíli zase jinak. Dej si to v hlavě dohromady, jo? A až budeš vědět, co vlastně chceš, dej mi potom vědět.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bennet_StillNeedYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_StillNeedYou_Condition;
	information = DIA_Bennet_StillNeedYou_Info;
	permanent = TRUE;
	description = "Pojď zpátky. Nemůžu najít jinýho kováře.";
};


func int DIA_Bennet_StillNeedYou_Condition()
{
	if(((Bennet_IsOnBoard == LOG_OBSOLETE) || (Bennet_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Pojď zpátky. Nemůžu najít jinýho kováře.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(naštvaně) Správně! Jsem tu jenom já, tak nikoho nehledej! Uvidíme se později v docích.
	Bennet_IsOnBoard = LOG_SUCCESS;
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


instance DIA_Bennet_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 900;
	condition = DIA_Bennet_PICKPOCKET_Condition;
	information = DIA_Bennet_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bennet_PICKPOCKET_Condition()
{
	return C_Beklauen(35,45);
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,Dialog_Back,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};


instance DIA_BENNET_ARMORCANTEACH(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = dia_bennet_armorcanteach_condition;
	information = dia_bennet_armorcanteach_info;
	permanent = TRUE;
	description = "Můžeš vykovat zbroj?";
};

func int dia_bennet_armorcanteach_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((BENNET_TEACHARMOR == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			return TRUE;
		};
	};
};

func void dia_bennet_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_00");	//Můžeš vykovat zbroj?
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_01");	//Ano, na farmě kovám stále.
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_02");	//A můžeš mi prodat lepší zbroj než teď mám?
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_03");	//Ne chlape, nemohl. Lee rozhoduje co kdo může koupit.
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_05");	//Škoda, počítal jsem s tebou.
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_06");	//No, jestli je to tak nutné, možná ti pomohu.
	AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_07");	//Jak?
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_08");	//No, můžu ti ukázat jak tvou zbroj vylepšit.
	AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_09");	//Ale pro začátek musíš trochu porozumět kovařině.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_10");	//Já rozumím kovařině.
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_11");	//To nám trochu ulehčí dost práce.
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_12");	//Něco tě naučím, ale budeš za to muset zaplatit!
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_13");	//Pak tě můžu naučit něco o tom, jak tu tvou zbroj vystužit.
		AI_Output(other,self,"DIA_Bennet_ArmorCanTeach_01_14");	//Chápu.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_15");	//Ale ty nemáš ani představu co to je!
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_16");	//Najdi někoho, kdo tě do toho zasvětí a pak se vrať.
		AI_Output(self,other,"DIA_Bennet_ArmorCanTeach_01_17");	//A budeš za to muset zaplatit!
	};
	BENNET_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Bennet mě může naučit, jak vylepšit žoldácké zbroje.");
};

func void b_bennet_teacharmor_1()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_01");	//Ták, budeme potřebovat ten správný materiál...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_02");	//... Na kovadlinu si položíš žhavou ocel...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_03");	//... Pak jí dáš potřebný tvar a připevníš ke zbroji...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_04");	//... Asi takto (ukazuje) ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_05");	//... Toť vše!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_06");	//Nyní víš, jak to udělat.
	};
};

func void b_bennet_teacharmor_2()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_01");	//Zapamatuj si to, co ti tu ukazuji. Hlavně měj správný materiál...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_02");	//... Vezmi si rozžhavenou ocel a rozbij ji na části...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_03");	//... V určitém pořadí ji míchej s dalším materiálem...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_04");	//... Na místě, kde jsou spoje je skuj (ukazuje) ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_05");	//... A to je vše!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_2_01_06");	//Nic těžkého, chce to jen zapamatovat si správný postup.
	};
};

func void b_bennet_teacharmor_3()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_01");	//Sleduj to a pamatuj si vše ci to tady ukážu. Ve skutečnosti na tom zas tak nic těžkého neni...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_02");	//... S žhavou ocelí na kovadlině smíchej magickou a černou rudu...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_03");	//... Tyto látky pak smíchej s dalšími složkami...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_04");	//... Pak výsledek přikuj ke spojům tvé zbroje... Vidíš jak to dělám?
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_05");	//... A je to!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_3_01_06");	//Vše je jednoduché.
	};
};

func void b_bennet_teacharmor_4()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_01");	//Můžem začít. Zkontroluj si vždy jestli máš po ruce veškerý materiál...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_02");	//... Na kovadlinu polož kus magické rudy...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_03");	//... Opatrně ji spoj s ocelí...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_04");	//... A pak ji opatrně napoj na zbroj... Podívej se (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_05");	//... A máš to!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_06");	//To je vše co potřebuješ vědět o tomhle vylepšení.
	};
};

func void b_bennet_teacharmor_5()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_01");	//Je pro to potřeba hodně času...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_02");	//... vezmi rozžhavenej ocelovej prut a rozděl ho na dvě stejné části...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_03");	//... pak vem každou část a postupně ji opracuj za pomocí kousků rudy... Skuj obě části dohromady...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_04");	//... a výsledný kus připevni k zbroji na stranách s pomocí kovového plátu...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_05");	//... zesílíš pevnost kovových čepů, a...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_06");	//... hotovo!
	};
};

func void b_bennet_teacharmor_6()
{
	AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_01");	//Díky těmto znalostem, budeš moci vyrobit zbroj, které se v síle a spolehlivosti nevyrovná žádná jiná...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_02");	//... vezmi rozžhavený ocelový prut a na kovadlině mu dej tvar plátu...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_03");	//... poté výsledný plát pokryješ vrstvou magické rudy a z vrchu naneseš opět vrstvu železné rudy...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_04");	//... spojíš dva ocelové pláty nýty, a připevníš k tělu zbroje...
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_05");	//... to zesílí místa všech spojů zbroje... Trochu tím zbroj nabyde na objemu...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_06");	//... A zbroj je hotova!
		AI_Output(self,other,"DIA_Bennet_TeachArmor_6_01_07");	//Nemám tě co víc naučit. Jdi a vyzkoušej své dovednosti.
	};
};

func void b_bennetarmorchoices()
{
	Info_ClearChoices(dia_bennet_armorteach);
	Info_AddChoice(dia_bennet_armorteach,Dialog_Back,dia_bennet_armorteach_back);

	if(PLAYER_TALENT_SMITH[17] == FALSE)
	{
		Info_AddChoice(dia_bennet_armorteach,"Lehká zbroj žoldáka (cena: 500 zlatých)",dia_bennet_armorteach_itar_sld_l_v1);
	};
	if((PLAYER_TALENT_SMITH[18] == FALSE) && (Lee_SldMGiven == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,"Zbroj žoldáka (cena: 1000 zlatých)",dia_bennet_armorteach_itar_sld_m_v1);
	};
	if((PLAYER_TALENT_SMITH[19] == FALSE) && (Lee_SldHGiven == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,"Těžká zbroj žoldáka (cena: 2000 zlatých)",dia_bennet_armorteach_itar_sld_h_v1);
	};
	if((PLAYER_TALENT_SMITH[20] == FALSE) && (SHOW_DJG_ARMOR_L == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx("Lehká zbroj drakobijce (cena: 3000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_L_V1)),dia_bennet_armorteach_itar_djg_l_v1);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (Show_DJG_Armor_M == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx("Zbroj drakobijce (cena: 4000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_M_V1)),dia_bennet_armorteach_itar_djg_m_v1);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (SHOW_DJG_ARMOR_H == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx("Těžká zbroj drakobijce (cena: 5000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_H_V1)),dia_bennet_armorteach_itar_djg_h_v1);
	};
};


instance DIA_BENNET_ARMORTEACH(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = dia_bennet_armorteach_condition;
	information = dia_bennet_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};

func int dia_bennet_armorteach_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (BENNET_TEACHARMOR == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			if((PLAYER_TALENT_SMITH[17] == FALSE) || (PLAYER_TALENT_SMITH[18] == FALSE) || (PLAYER_TALENT_SMITH[19] == FALSE) || (PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE))
			{
				return TRUE;
			};
		};
	};
};

func void dia_bennet_armorteach_info()
{
	AI_Output(other,self,"DIA_Bennet_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.

	if(Wld_IsTime(8,0,22,0))
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_01");	//Co chceš přesně vědět?
		b_bennetarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_02");	//Dnes jsem už skončil s prací v kovárně. Dojdi zítra ráno.
	};
};

func void dia_bennet_armorteach_back()
{
	Info_ClearChoices(dia_bennet_armorteach);
};

func void dia_bennet_armorteach_itar_sld_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_bennet_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Asi jsi zapomněl, že to nedělám zadarmo.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_sld_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			b_bennet_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Asi jsi zapomněl, že to nedělám zadarmo.
	};

	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_sld_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,2000);
			b_bennet_teacharmor_3();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Asi jsi zapomněl, že to nedělám zadarmo.
	};

	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_bennet_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Asi jsi zapomněl, že to nedělám zadarmo.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 4000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,4000);
			b_bennet_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Asi jsi zapomněl, že to nedělám zadarmo.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_bennet_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachArmor_01_00");	//Asi jsi zapomněl, že to nedělám zadarmo.
	};
	b_bennetarmorchoices();
};


instance DIA_BENNET_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_bennet_nw_kapitelorcattack_condition;
	information = dia_bennet_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Město obsadili skřeti!";
};


func int dia_bennet_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BENNETBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_01_00");	//Město obsadili skřeti!
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_01_01");	//Ano?! (vystrašeně) To je velkej malér! Co budeme dělat?
	Info_ClearChoices(dia_bennet_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_bennet_nw_kapitelorcattack,"Nabídnout runu teleportace na Onarovu farmu.",dia_bennet_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_bennet_nw_kapitelorcattack,"To nevím.",dia_bennet_nw_kapitelorcattack_nogiverune);
};

func void dia_bennet_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_01");	//S touto runou se dostaneš na Onarovu farmu.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_02");	//Jestli chceš, použij ji!
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_03");	//Runa?! Neměli bychom si to první promyslet?!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_04");	//Není o čem přemýšlet!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_05");	//Ostatní mají větší šanci probít se než ty, takže neodporuj!
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_06");	//Ano, ale... Dobrá, dej ji sem!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_07");	//Chytej.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_08");	//Eh! Doufám, že se ještě potkáme.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_09");	//A že z vás skřeti neudělaj kousky!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_11");	//My máme mnohem větší šanci, že se vyhneme jejich sekerám, než ty.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_12");	//Tak to je jasný... (směje se) Budu čekat na farmě. Potkáme se tam!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_13");	//Samozřejmě.
	BENNETNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Bennetovi runu na Onarovu farmu.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_bennet_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_01");	//To nevím
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Ale nejpravděpodobněji se zkusíme probít městem. Jiná možnost není!
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Ano... (smutně) Nejsem sice žádný zbabělec, ale jako voják jsem nezkušený.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Nemyslím si, že budu mít v tom zmatku mnoho šancí.
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_05");	//To zvládneš.
	AI_Output(self,other,"DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_06");	//Podívej! Už čekáme moc dlouho.
	B_LogEntry(TOPIC_HELPCREW,"Bennet se pokusí prorazit s ostatními městem. Snad vyvázne živ.");
	BENNETBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_809_BENNET_FUCKOFF(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = dia_sld_809_bennet_fuckoff_condition;
	information = dia_sld_809_bennet_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_809_bennet_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_809_BENNET_YOURFREE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_sld_809_bennet_yourfree_condition;
	information = dia_sld_809_bennet_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_809_bennet_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_yourfree_info()
{
	AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_08");	//Co tu děláš?
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_00");	//Ále, jen jdu tak okolo a řekl jsem si, že bych ti mohl sdělit, že jsi volný!
	AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_01");	//Hmm... (udiveně) Vyhnal jsi skřety z města?
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_02");	//Už to tak bude.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_03");	//Výborně! Věděl jsem, že někdo přijde.
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_04");	//Otevři ty mříže!
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_05");	//Výborně! Věděl jsem, že někdo přijde.
		AI_Output(self,other,"DIA_SLD_809_Bennet_YourFree_01_06");	//Otevři ty mříže!
	};
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_07");	//Jasně
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_809_BENNET_OPENGATENOW(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_sld_809_bennet_opengatenow_condition;
	information = dia_sld_809_bennet_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_809_bennet_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (BENNETISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_opengatenow_info()
{
	AI_Output(self,other,"DIA_SLD_809_Bennet_OpenGateNow_01_00");	//Otevři ty mříže!
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_ABOUTSWBL(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = dia_bennet_aboutswbl_condition;
	information = dia_bennet_aboutswbl_info;
	permanent = FALSE;
	description = "Kde sháníš ocelové ingoty?";
};


func int dia_bennet_aboutswbl_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ABOUTSWBL == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_bennet_aboutswbl_info()
{
	AI_Output(other,self,"DIA_BENNET_aboutswbl_15_00");	//Kde sháníš ocelové ingoty?
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_01");	//Poslední dobou se těžko shání - v Hornickém údolí je stále obtížnější těžit rudu a odlévat ingoty.
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_02");	//Můžeš se poptat u obchodníků a nebo můžeš tavit rudu.
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_03");	//Pravda, musíš nejprve získat rudu a pak najít někoho kdo rozumí tavení.
	AI_Output(self,other,"DIA_BENNET_aboutswbl_06_04");	//Můžeš se pokusit najít učitele u bývalých trestanců z kolonie - po pádu bariéry se jich hodně potuluje po Khorinisu.
	AI_Output(other,self,"DIA_BENNET_TellsMarduk_01_04");	//Děkuju za radu.
	ABOUTSWBL = TRUE;
	Log_CreateTopic(TOPIC_STEELDRAW,LOG_NOTE);
	Log_SetTopicStatus(TOPIC_STEELDRAW,LOG_Running);
	B_LogEntry(TOPIC_STEELDRAW,"Bennet mi řekl, že ocelové ingoty lze buď koupit od obchodníků, nebo se můžu pokusit si je odlít sám. To bych ale musel nejprve nějakou železnou rudu vytěžit a pak mezi bývalými trestanci najít někoho, kdo mě naučí ji tavit. A jak rudu těžit jsem už také téměř zapomněl.");
};

instance DIA_Bennet_PrioratBlade(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_PrioratBlade_condition;
	information = DIA_Bennet_PrioratBlade_info;
	permanent = FALSE;
	description = "Vyznáš se dobře ve zbraních?";
};

func int DIA_Bennet_PrioratBlade_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_01");	//Vyznáš se dobře ve zbraních?
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_02");	//Docela dobře. A proč tě to zajímá?
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_03");	//Mám velmi zajímavý kousek.
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_04");	//A rád bych zjistil, kde a kým byl vykován.
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_05");	//Máš ho tady?
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_06");	//Ano, zde.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_07");	//(vážně) Na první pohled je vidět že to nekoval žádný učedník. Ten kdo to vykoval, může být hrdý na svou práci!
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_08");	//Čepel je mistrovky vyvážená, co vím - tak tohle by žádný místní kovář nesvedl.
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_09");	//A ty?
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_10");	//Abych řek pravdu... (sarkasticky) Včetně mě! Takže podle toho co vidím, ta čepel sem přicestovala z Myrtany, chlapče.
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_11");	//Pouze tam najdeš skutečného mistra kováře, schopného vykovat takovédle věci.
	AI_Output(self,other,"DIA_Bennet_PrioratBlade_01_12");	//Zde, vem si ji zpět a dobře se o ni starej. Tato zbraň má mnohem větší hodnotu než zlato!
	B_LogEntry(TOPIC_PrioratStart,"Když Bennet prozkoumal čepel, řekl že ji musel vykovat kovář z Myrtany. Ale víc nezjistil.");
};

instance DIA_Bennet_NeedSteel(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_NeedSteel_condition;
	information = DIA_Bennet_NeedSteel_info;
	permanent = FALSE;
	description = "Vypadáš trochu frustrovaný.";
};

func int DIA_Bennet_NeedSteel_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if(BennetNeedSteel == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_NeedSteel_info()
{
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_01");	//Vypadáš trochu frustrovaný.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_02");	//Ano, mám pro todůvod. Lee mi zadal velkou objednávku na nové zbroje.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_03");	//A nemám na to dost oceli. A ani nevím kde ji sehnat!
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_04");	//A co koupit ocel jednoduše ve městě?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_05");	//Je nepravděpodobné, že by ve městě se mnou někdo obchodoval. A i kdyby tak jsem slyšel, že mají taky nedostatek.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_06");	//A kolik oceli potřebuješ?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_07");	//Myslím, že na první várku zbrojí by sto ingotů mohlo stačit.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_08");	//No pak už budu mít lepší představu, kolik budu potřebovat materiálu. A proč ty se o to zajímáš?
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_09");	//Možná, ji pro tebe mohu získat.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_10");	//(překvapeně) Ty víš kde získat tolik oceli? 
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_11");	//Možná.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_12");	//No, jseš mazanej. (zasměje se) Dobře! Vidím, že víš co chceš, že nejsi blázen.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_13");	//Proto ti říkám tohle:
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_14");	//Pokud mě pomůžeš zrealizovat tu objednávku, můžeš počítat s mojí bezmeznou vděčností!
	AI_Output(self,other,"DIA_Bennet_NeedSteel_01_15");	//A znáš mě, že nezůstávám nic dlužen. Ruku na to?
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_16");	//Dobře dohodnuto.
	MIS_NeedSteel = LOG_Running;
	Log_CreateTopic(TOPIC_NeedSteel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Running);
	B_LogEntry(TOPIC_NeedSteel,"Bennet potřebuje hodně oceli. Stovku ingotů na výrobu nových zbrojí pro žoldáky. Kdybych mu pomohl uskutečnit tuto objednávku, a přinesl mu ocel, bude mi nezkonale vděčný.");
};

instance DIA_Bennet_NeedSteel_Done(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_NeedSteel_Done_condition;
	information = DIA_Bennet_NeedSteel_Done_info;
	permanent = FALSE;
	description = "Získal jsem pro tebe ocel.";
};

func int DIA_Bennet_NeedSteel_Done_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_NeedSteel == LOG_Running) && (Npc_HasItems(hero,ItMiSwordraw) >= 100))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_NeedSteel_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_01");	//Získal jsem pro tebe ocel.
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_02");	//Opravdu? (nedůvěřivě) Tak mě jí dej!
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_03");	//Tady jí máš.
	B_GiveInvItems(other,self,ItMiSwordraw,100);
	Npc_RemoveInvItems(self,ItMiSwordraw,100);
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_04");	//Hej, hej... (překvapeně) Ne všechny najednou! Víš jak je to těžký.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_05");	//Tak co, bude to stačit?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_06");	//Uf... (ztěžka oddechuje) Tak jo! Myslím, žes toho přines až, až.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_07");	//Jak jsi chtěl. Sto ocelových ingotů
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_08");	//Dobře. Ocel - je zboží, co se vždycky hodí.
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_09");	//A co tvoje vděčnost?
	AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_10");	//No, myslíš že jsem na to zapomněl? (naštvaně) To mě uráží, kamaráde!

	if((hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY]) && (hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_MANA_MAX]))
	{
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_11");	//Tady, vezmi si tento meč, jako odměnu za svoji práci.
		B_GiveInvItems(self,other,ItMw_Drachen_Sword_02,1);
		AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_12");	//Co?! Obyčejný meč?
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_13");	//(vztekle) To není obyčejný meč! Takový nenajdeš na celém světě!
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_14");	//Koval jsem ho skoro rok podle speciálního výkresu, který jsem koupil od jednoho obchodníka v Monterey za velké peníze.
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_15");	//(hrdě) Ale věřím, že to stálo za to! Meč je lehký, odolný a smrtící.
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_16");	//Pravdou je, že jsem ho ještě nevytáh z pochvy... (směje se) Zatím nebyla příležitost!
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_17");	//Ale myslím, že ty oceníš jeho kvality.
		AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_18");	//Dobře, podívám se.
		MIS_NeedSteel = LOG_Success;
		Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Success);
		B_LogEntry(TOPIC_NeedSteel,"Přinesl jsem Bennetovi ocel a dostal jsem za to od něho meč. Prý je nejlepší jaký kdy viděl.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_19");	//Tady, vem si to zlato jako jeho odměnu.
		B_GiveInvItems(self,other,ItMi_Gold,2000);
		AI_Output(self,other,"DIA_Bennet_NeedSteel_Done_01_20");	//Myslím, že pro něj najdeš využití.
		MIS_NeedSteel = LOG_Success;
		Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Success);
		B_LogEntry(TOPIC_NeedSteel,"Přinesl jsem Bennetovi ocel.");
	};
};

instance DIA_Bennet_DoCrossBow(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_DoCrossBow_condition;
	information = DIA_Bennet_DoCrossBow_info;
	permanent = FALSE;
	description = "Umíš vyrobit kuši?";
};

func int DIA_Bennet_DoCrossBow_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bennet_DoCrossBow_01_01");	//Umíš vyrobit kuši?
	AI_Output(self,other,"DIA_Bennet_DoCrossBow_01_02");	//Kuši? (překvapeně) Ne, kamaráde.
	AI_Output(self,other,"DIA_Bennet_DoCrossBow_01_03");	//Dobrý tesař nebo truhlář - to je člověk, kterého hledáš.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Vyrobit kuši mě může naučit pouze tesař nebo truhlář. Kde někoho takového najít?");
};

instance DIA_Bennet_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Done_Condition;
	information = DIA_Bennet_BetterArmor_Done_Info;
	permanent = FALSE;
	description = "Mám všechno o co jsi mě žádal.";
};

func int DIA_Bennet_BetterArmor_Done_Condition()
{
	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 50) && (Npc_HasItems(other,ItAt_XragonSkull) >= 4) && (Npc_HasItems(other,ItMi_Nugget) >= 20) && (Npc_HasItems(other,ItMi_Sulfur) >= 10) && (Npc_HasItems(other,ItMi_Pitch) >= 2) && (Npc_HasItems(other,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_00");	//Mám všechno o co jsi mě žádal.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItAt_DragonScale,50);
	Npc_RemoveInvItems(hero,ItAt_XragonSkull,4);
	Npc_RemoveInvItems(hero,ItMi_Nugget,20);
	Npc_RemoveInvItems(hero,ItMi_Pitch,2);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);

	if(Trophy_DragonSkull  == TRUE)
	{
		if(Npc_HasItems(other,ItAt_XragonSkull) == FALSE)
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_DragonSkull,Npc_HasItems(other,ItUt_DragonSkull));
			Trophy_DragonSkull  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_01");	//Dobře. Tak se hned pustím do práce.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_02");	//Kolik budeš potřebovat času?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_03");	//Těžko říct. Ale dám ti vědět až to bude hotové.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Dobře.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor,"Dal jsem Bennetovi všechny potřebné materiály pro zbroj a on se dal okamžitě do práce. Je pravda, že neví, kolik bude potřebovat času.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Finish_Condition;
	information = DIA_Bennet_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_BetterArmor_Finish_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_00");	//O tvém zbroji... (unaveně) Je hotová!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_01");	//Tady, vem si ji. Ochrání tě před jakýmkoli nepřítelem.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor,"Bennet pro mě vykoval zbroj.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_DarkWeb(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_DarkWeb_Condition;
	information = DIA_Bennet_DarkWeb_Info;
	permanent = FALSE;
	description = "Mám na tebe jeden dotaz.";
};

func int DIA_Bennet_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(other,DIA_Bennet_ThankYou) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DarkWeb_Info()
{
	AI_Output(other,self,"DIA_Bennet_DarkWeb_01_00");	//Mám na tebe jeden dotaz.
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_01");	//Zeptejte se jestli je skutečný.
	AI_Output(other,self,"DIA_Bennet_DarkWeb_01_02");	//S kým jsi byl ve městě když tě zatkli?
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_03");	//S Hodgesem, mím asistentem.
	AI_Output(other,self,"DIA_Bennet_DarkWeb_01_04");	//Kde byl Hodges v době tvého zatčení?
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_05");	//Nevím, když jsme dokončili svou práci pravil že musí jít svlažit hrdlo ke Coragonovi.
	AI_Output(self,other,"DIA_Bennet_DarkWeb_01_06");	//Tak tam šel, jak jsem pochopil. Více nevím.
	B_LogEntry(TOPIC_DarkWeb,"Osoba s níž šel Bennet do města se jmenuje Hodges, budu se muset zeptat co se stalo.");
	HodjesTalk = TRUE;
};