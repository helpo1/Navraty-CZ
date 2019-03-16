
instance DIA_Opolos_Kap1_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Hello(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Hello_Info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Zdravím, musíš tu být nový.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//Já jsem Opolos! Starám se o ovce.
};


instance DIA_Opolos_Wurst(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_Wurst_Condition;
	information = DIA_Opolos_Wurst_Info;
	permanent = FALSE;
	description = "Mám pro tebe jehněčí klobásu.";
};


func int DIA_Opolos_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//Mám pro tebe jehněčí klobásu.
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//Fantastické! Konečně chutná klobása.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Opolos_HowLong(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent = FALSE;
	description = "Jsi v klášteře dlouho?";
};


func int DIA_Opolos_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowLong_Info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//Jsi v klášteře dlouho?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//Už tři roky... Ale ještě nemůžu do knihovny. Strašně bych chtěl...
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//Proč?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//Má práce je pást ovce, ne studovat Písmo.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//A dokud mne Parlan neosvobodí od této povinnosti, nemůžu do knihovny.
	MIS_HelpOpolos = LOG_Running;
	Log_CreateTopic(Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosStudy,LOG_Running);
	B_LogEntry(Topic_OpolosStudy,"Opolos hlídá ovce v klášteře, ale chtěl by studovat svitky v knihovně...");
};


instance DIA_Opolos_Monastery(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent = FALSE;
	description = "Jak se mám chovat v klášteře?";
};


func int DIA_Opolos_Monastery_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Monastery_Info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//Jak se mám chovat v klášteře?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Nikdy nelži mágům a respektuj své bratry a společenství.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Respektuj majetek kláštera. Pokud tato pravidla porušíš, budeš se zodpovídat Parlanovi.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Kromě toho pozor na Agona, jinak skončíš jako Babo.
};


instance DIA_Opolos_beibringen(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_beibringen_Condition;
	information = DIA_Opolos_beibringen_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Opolos_beibringen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Opolos_beibringen_Info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Můžu ti ukázat, jak se stát silnějším.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//Měl bych zájem o alchymii, jestli mi s ní pomůžeš, budu tě učit...
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//A jak ti s ní můžu pomoct?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//No, pokud budeš pracovat pro Neorase, určitě ti 'zapůjčí' jeden ze svých receptů... Jestli víš, co myslím.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//Přines mi ho a budu tě učit.
	Log_CreateTopic(Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_Running);
	B_LogEntry(Topic_OpolosRezept,"Opolos chce recept na lektvar many. Měl bych ho sehnat u Neroase... Za odměnu mě bude učit, jak být silný.");
};


instance DIA_Opolos_rezept(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_rezept_Info;
	permanent = TRUE;
	description = "O tom receptu...";
};


var int DIA_Opolos_rezept_permanent;

func int DIA_Opolos_rezept_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_Opolos_rezept_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_rezept_Info()
{
	if(Npc_HasItems(other,ItWr_ManaRezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//Mám ten recept, jak jsi chtěl.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Skvěle, ukaž mi ho.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Jo... Ehm, ano... Aha. Takže...
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Dobře, moc děkuji! Pokud chceš, budu tě učit.
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Opolos mě bude učit, jak být silnější.");
	}
	else if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//Vrátil jsem ten recept Neorasovi
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//Sakra, teď už se k němu nedostanu... Ale co, stejně tě můžu trénovat.
		Opolos_Rezept = LOG_FAILED;
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Opolos mě bude učit, jak být silnější.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//Vrátíme se k tomu později.
	};
};


instance DIA_Opolos_TEACH_STR(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 99;
	condition = DIA_Opolos_TEACH_STR_Condition;
	information = DIA_Opolos_TEACH_STR_Info;
	permanent = TRUE;
	description = "Chcí být silnější.";
};


func int DIA_Opolos_TEACH_STR_Condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (Opolos_TeachSTR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_TEACH_STR_Info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//Chcí být silnějš.
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//Jsi už hodně silný, já tě víc nenaučím.
	};
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
};

func void DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};


instance DIA_Opolos_Agon(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 4;
	condition = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent = FALSE;
	description = "Kdo jsou Agon a Babo?";
};


func int DIA_Opolos_Agon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Agon_Info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//Kdo jsou Agon a Babo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Agon řídí zahradu, je taky novic, ale chová se, jako kdyby už byl mág.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//A Babo přišel do kláštera chvilku před tebou a pomáhal Agonovi.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//Ale měli nějakou neshodu a od té doby Babo zametá dvůr.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//Víš, co se stalo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Nejsem si jistý, zeptej se jich. Ale Agonovo slovo má větší váhu, je to synovec místodržícího...
};


instance DIA_Opolos_LIESEL(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_LIESEL_Condition;
	information = DIA_Opolos_LIESEL_Info;
	permanent = TRUE;
	description = "Koukej, přivedl jsem Betsy.";
};


func int DIA_Opolos_LIESEL_Condition()
{
	if((other.guild == GIL_NOV) && (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_LIESEL_Info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Koukej, přivedl jsem Betsy. Můžu ji tu nechat?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler;
		Liesel_Giveaway = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Jasně, je to krásný kus jehněčího. Postarám se o ni.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Díky, přijdu později.
	};
};


instance DIA_Opolos_Biblothek(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 98;
	condition = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Biblothek_Info;
	permanent = TRUE;
	description = "O knihovně...";
};


func int DIA_Opolos_Biblothek_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Opolos_HowLong))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Biblothek_Info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//O knihovně...
	if(Parlan_Erlaubnis == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//Je to ta uzamčená místnost na levé straně od brány.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//Klíč můžeš dostat pouze tehdy, když Parlan rozhodne, že můžeš studovat Písmo.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//Máš štěstí, máš klíč od knihovny a nejsi tu ani několik dní!
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Nenech si utéct šanci studovat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HelloAgain(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_HelloAgain_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_HelpOpolos == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Zdravím, díky za pomoc. Nenechám si to utéct.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//Ale teď přece není vhodný čas k tomu, abyste se bavil s obyčejným novicem, mistře.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HowIsIt(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent = TRUE;
	description = "Jak je?";
};


func int DIA_Opolos_HowIsIt_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//Jak je?
	if(MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//Výborně, od té doby, co můžu do knihovny, je vše skvělé.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//Pokorně dělám všechny úkoly, mistře.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Každý den pracuji ve jménu Innose.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap2_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_PERM(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 39;
	condition = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent = TRUE;
	description = "Jak se daří ovcím?";
};


func int DIA_Opolos_Kap3_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//Jak se daří ovcím?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//Co myslíš? Stojí kolem a žvýkají trávu.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//Rád bych věděl, co se děje venku. Mágové vypadají nervózně.
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,Dialog_Back,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,"V Hornickém údolí byli draci.",DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,"Na každém rohu stojí zvláštní lidé v černých hábitech.",DIA_Opolos_Kap3_PERM_DMT);
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Opolos_Kap3_PERM,"Pedro nás zaprodal.",DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

func void DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
};


var int Opolos_Dragons;

func void DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//V Hornickém údolí byli draci. Spolu s armádou skřetů, která obléhá královské vojsko.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Draci... Myslel jsem, že existují jen v pohádkách.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//Jsou tu, věř tomu.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//Ale paladinové si s nimi poradí, že?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//Uvidíme.
	if(Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Dragons = TRUE;
	};
};


var int Opolos_DMT;

func void DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Na každém rohu stojí zvláštní lidé v černých hábitech.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//Co tím myslíš? Co to je za lidi?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Nikdo neví, okdud jsou. Nosí dlouhé černé hábity a mají zakrytou tvář.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//Vypadají jako nějací mágové. Kouzlit rozhodně umí.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//To je dost znepokojivé, ale jsem si jistý, že Nejvyšší rada si s tím poradí.
	if(Opolos_DMT == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_DMT = TRUE;
	};
};


var int Opolos_Pedro;

func void DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Pedro nás zaprodal.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//Slyšel jsem o tom, myslel jsem, že to víš, tak jsem nic neříkal.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Jestli je nepřítel silnější než my... Můžeme vyhrát?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//Ještě nejsme mrtví.
	if(Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Pedro = TRUE;
	};
};


instance DIA_Opolos_Kap4_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap5_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_PICKPOCKET(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 900;
	condition = DIA_Opolos_PICKPOCKET_Condition;
	information = DIA_Opolos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Opolos_PICKPOCKET_Condition()
{
	return C_Beklauen(54,70);
};

func void DIA_Opolos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,Dialog_Back,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};


instance DIA_OPOLOS_KAP6_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = dia_opolos_kap6_exit_condition;
	information = dia_opolos_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_opolos_kap6_exit_condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void dia_opolos_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

