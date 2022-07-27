
instance DIA_Brutus_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_AFTER_FIGHT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 1;
	condition = DIA_Brutus_AFTER_FIGHT_Condition;
	information = DIA_Brutus_AFTER_FIGHT_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Brutus_AFTER_FIGHT_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && Npc_IsInState(self,ZS_Talk) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_AFTER_FIGHT_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//Tak co, máš ještě pořád všechny zuby?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Chlape, ty jsi pěkný pořízek! Nechtěl bych se s tebou utkat, to teda ne.
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//Myslím, že bys mi zlomil všechny žebra, ne-li něco horšího.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//A já tě taky nemlátil plnou silou. No nevadí, mám rád chlapy, které nějaká ta rána hned tak nesklátí.
		if(Brutus_einmalig == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//Tenhle lektvar tě zase postaví na nohy a s útrobami dělá hotové zázraky!
			CreateInvItems(self,ItPo_Health_01,1);
			B_GiveInvItems(self,hero,ItPo_Health_01,1);
			Brutus_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//Nemám nic proti dobrému boji, ale když se začnu bít, tak taky vím, kdy skončit.
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Brutus_PRISONER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_PRISONER_Condition;
	information = DIA_Brutus_PRISONER_Info;
	description = "Co tu máš na práci?";
};


func int DIA_Brutus_PRISONER_Condition()
{
	if((Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PRISONER_Info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//Co tu máš na práci?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//Co mám na práci? Cvičím tyhle hošany. Učím je, jak získat ocelové svaly.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//Taky se starám o vězně, jsem pro ty bastardy něco jako zatraceně přísný otec.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//Ale opravdové umění je přimět je k hovoru. A věř mi - já rozvážu jazyk úplně každému.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//To zní děsivě hezky...
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//Ale ti zablešení zabedněnci, které jsme teď zabásli, nám toho moc neřeknou - ani nemají co.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//A tak se nebudu moci vypořádat s tím Gornem.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Brutus_PERM(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 90;
	condition = DIA_Brutus_PERM_Condition;
	information = DIA_Brutus_PERM_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_Brutus_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM_Info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//Něco nového?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//Všecko vypadá klidně. Žádní noví vězni - nikomu nemůžu pomáhat hledat správná slova - je to prostě zlé.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_Kasse(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Kasse_Condition;
	information = DIA_Brutus_Kasse_Info;
	permanent = FALSE;
	description = "Mohl bys mě cvičit?";
};


func int DIA_Brutus_Kasse_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Kasse_Info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Mohl bys mě cvičit?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Jasně - můžu ti pomoci zvýšit sílu, ale zadarmo ani kuře nehrabe.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//Kolik chceš?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Hmm, tys pobíhal kolem toho hradu, že jo? Tak ti navrhnu tohle.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//Můj asistent Den se při posledním útoku úplně vypařil - prostě nevydržel.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//Ale neodešel s prázdnou. Odnesl si i obsah naší pokladnice.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//Jaké pokladnice?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//V téhle truhle jsme schovávali zboží, které jsme časem, ehm, vybrali.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//Byla to pěkně zaokrouhlená sumička - 200 zlatých, a to nepočítám ještě vzácné klenoty.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//Jestli mi vrátíš to zlato, budeš si moci nechat ty klenoty a ještě k tomu tě budu cvičit.
	Log_CreateTopic(TopicBrutusKasse,LOG_MISSION);
	Log_SetTopicStatus(TopicBrutusKasse,LOG_Running);
	B_LogEntry(TopicBrutusKasse,"Brutův partner Den se ztratil i s 200 zlaťáky a nějakými klenoty. Když Brutovi přinesu aspoň ty dvě stovky, pomůže mi zvýšit sílu.");
};


instance DIA_Brutus_Den(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Den_Condition;
	information = DIA_Brutus_Den_Info;
	permanent = FALSE;
	description = "Nevíš, kam Den mířil?";
};


func int DIA_Brutus_Den_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Den_Info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Nevíš, kam Den mířil?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//Nejspíš co nejdál odsud. Možná se pokusil projít průsmykem.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//Díky, fakt jsi mi moc pomohl.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//No co můžu říct? Nemám ani potuchy, kam mohl jít.
	B_LogEntry(TopicBrutusKasse,"Den se snažil projít průsmykem.");
};


instance DIA_Brutus_Gold(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Gold_Condition;
	information = DIA_Brutus_Gold_Info;
	permanent = TRUE;
	description = "Něco tu pro tebe mám. (dát 200 zlatých)";
};


func int DIA_Brutus_Gold_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (NpcObsessedByDMT_Brutus == FALSE) && (Brutus_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Gold_Info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//Něco tu pro tebe mám.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//Výborně. Nyní tě můžu vycvičit, jestli tedy chceš.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"S pomocí Bruta se mohu stát silnějším.");
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//Poslyš, prostě mi přines 200 zlatých. Nezajímá mě, kde si je opatříš - zlaťák jako zlaťák.
	};
};

instance DIA_Brutus_Baby(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Baby_Condition;
	information = DIA_Brutus_Baby_Info;
	important = TRUE;
};

func int DIA_Brutus_Baby_Condition()
{
	if((Kapitel < 3) && (Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Baby_Info()
{
	AI_Output(self,other,"DIA_Brutus_Baby_01_00");	//Počkat!
	AI_Output(other,self,"DIA_Brutus_Baby_01_01");	//Co je?
	AI_Output(self,other,"DIA_Brutus_Baby_01_02");	//Poslouchej, už nějakou dobu se tě chci na něco zeptat, nebo ne. (zaváhal) Nebo možná jo.
	AI_Output(other,self,"DIA_Brutus_Baby_01_03");	//Poslouchám.
	AI_Output(self,other,"DIA_Brutus_Baby_01_04");	//Vypadá to, že jsme na hradě přilepeni na zatraceně dlouhou dobu. Určitě sis všiml těch skřetů za bránou.
	AI_Output(other,self,"DIA_Brutus_Baby_01_05");	//Ne, ničeho jsem si nevšiml.
	AI_Output(self,other,"DIA_Brutus_Baby_01_06");	//Och, nech toho. Nech mě to dokončit. Takže jsme uvízli v tomhle hradě na dlouho...
	AI_Output(self,other,"DIA_Brutus_Baby_01_07");	//... jestli se nám podaří vypadnout - což o tom někdy pochybuju.
	AI_Output(other,self,"DIA_Brutus_Baby_01_08");	//Můžeš přejít rovnou k věci?
	AI_Output(self,other,"DIA_Brutus_Baby_01_09");	//Dobře, dobře! Klid. Kde jsem to?... Ach, ano. Dlouho jsem neobcoval se ženou.
	AI_Output(self,other,"DIA_Brutus_Baby_01_10");	//To je důvod proč se ptám. No, přesněji řečeno jsem se ptal i spousty kluků tady. 
	AI_Output(other,self,"DIA_Brutus_Baby_01_11");	//Chceš abych ti dovedl do tohohle zámku princeznu? Myslíš si že je to možné?
	AI_Output(self,other,"DIA_Brutus_Baby_01_12");	//Ne, ne samozřejmě - ne. Ale jistý Milten by mi mohl pomoct. 
	AI_Output(other,self,"DIA_Brutus_Baby_01_13");	//A proč Milten?
	AI_Output(self,other,"DIA_Brutus_Baby_01_14");	//No, je to pořádný mág... a tvůj přítel. Možná když mu řekneš aby mi vykouzlil ženu, bude tě poslouchat.
	AI_Output(other,self,"DIA_Brutus_Baby_01_15");	//Myslíš, že je to možné?
	AI_Output(self,other,"DIA_Brutus_Baby_01_16");	//Nevím, ale za zkoušku nic nedáme. Pokud to zvládneš, tak mi věř, že nebudeš litovat. No co říkáš?
	Info_ClearChoices(DIA_Brutus_Baby);
	Info_AddChoice(DIA_Brutus_Baby,"Máš pravdu. Zeptám se.",DIA_Brutus_Baby_Yes);
	Info_AddChoice(DIA_Brutus_Baby,"Ne.",DIA_Brutus_Baby_No);
};

func void DIA_Brutus_Baby_Yes()
{
	AI_Output(other,self,"DIA_Brutus_Baby_Yes_01_01");	//Máš pravdu. Zeptám se.
	AI_Output(self,other,"DIA_Brutus_Baby_Yes_01_02");	//Díky kámo! Věřím ti.
	MIS_BrutusBaby = LOG_Running;
	Log_CreateTopic(TOPIC_BrutusBaby,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Running);
	B_LogEntry(TOPIC_BrutusBaby,"Brutus mě požádal o neobvyklou věc. On i ostatní chlapci v zámku by se chtěli trochu uvolnit. Brutus po mě chce abych zašel za Miltenem a požádal ho o trochu té ženštiny. Rozhodl jsem se klukům pomoci.");
	AI_StopProcessInfos(self);
};

func void DIA_Brutus_Baby_No()
{
	AI_Output(other,self,"DIA_Brutus_Baby_No_01_01");	//Ne. To co chceš je abnormální nesmysl. Milten by se mi vysmál.
	AI_Output(self,other,"DIA_Brutus_Baby_No_01_02");	//(vztekle) Jak si teda přeješ. Už jsme se s tím vyrovnali.
	AI_StopProcessInfos(self);
};

instance DIA_Brutus_Baby_Wait(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 101;
	condition = DIA_Brutus_Baby_Wait_Condition;
	information = DIA_Brutus_Baby_Wait_Info;
	permanent = FALSE;
	description = "Co se týče tvého přání...";
};

func int DIA_Brutus_Baby_Wait_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Baby_Wait_Info()
{
	AI_Output(other,self,"DIA_Brutus_Baby_Wait_01_00");	//Co se týče tvého přání...
	AI_Output(self,other,"DIA_Brutus_Baby_Wait_01_01");	//Co? Milten má pro nás vykouzlenou ženu? Tak rychle?!
	AI_Output(other,self,"DIA_Brutus_Baby_Wait_01_02");	//Ještě ne. Potřebuje trochu času, aby to stálo za to. Podívej se na něj zítra večer.
	AI_Output(self,other,"DIA_Brutus_Baby_Wait_01_05");	//Dobře, kámo! Díky tobě jsem nejšťastnější muž na tomhle hradu.
	AI_Output(self,other,"DIA_Brutus_Baby_Wait_01_06");	//Určitě přijdu.
	BrutusBabyDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Brutus_Teach(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 7;
	condition = DIA_Brutus_Teach_Condition;
	information = DIA_Brutus_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát silnějším.";
};


func int DIA_Brutus_Teach_Condition()
{
	if((Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Teach_Info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//Chtěl bych se stát silnějším.
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_Back()
{
	Info_ClearChoices(DIA_Brutus_Teach);
};

func void DIA_Brutus_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};


instance DIA_Brutus_KAP3_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP3_EXIT_Condition;
	information = DIA_Brutus_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_DUSCHONWIEDER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 30;
	condition = DIA_Brutus_DUSCHONWIEDER_Condition;
	information = DIA_Brutus_DUSCHONWIEDER_Info;
	permanent = TRUE;
	description = "Mučil jsi dneska někoho?";
};


func int DIA_Brutus_DUSCHONWIEDER_Condition()
{
	if((Kapitel == 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Mučil jsi dneska někoho?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Copak nevidíš, že mám práci? Vrať se později.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_KAP4_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP4_EXIT_Condition;
	information = DIA_Brutus_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_WARUMNICHTARBBEIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 40;
	condition = DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information = DIA_Brutus_WARUMNICHTARBBEIT_Info;
	description = "Jak to, že nejsi v práci?";
};


func int DIA_Brutus_WARUMNICHTARBBEIT_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Jak to, že nejsi v práci?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(úzkostně) To je ale nechutné!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Viděls, jak to u mě vypadá? Ty hnusný žravý štěnice jsou úplně všude.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//Nemám ani šajna, kdo tam co dělal, ale já se tam určitě nevrátím, dokud tam bude ten hnusný hmyz.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//Já ty potvory prostě nesnáším. A přestaň se tak blbě křenit.
	Log_CreateTopic(TOPIC_BrutusMeatbugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs,LOG_Running);
	B_LogEntry(TOPIC_BrutusMeatbugs,"Hradní mučitel Brutus se mi svěřil, že mu neškodné žravé štěnice v mučírně nahánějí husí kůži. Je to prostě drsňák každým coulem.");
};


instance DIA_Brutus_MEATBUGSWEG(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 31;
	condition = DIA_Brutus_MEATBUGSWEG_Condition;
	information = DIA_Brutus_MEATBUGSWEG_Info;
	description = "Už je po štěnicích. Můžeš se vrátit a leštit všechny ty palečnice a ostatní mučící nástroje.";
};


func int DIA_Brutus_MEATBUGSWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_WARUMNICHTARBBEIT) && Npc_IsDead(Meatbug_Brutus1) && Npc_IsDead(Meatbug_Brutus2) && Npc_IsDead(Meatbug_Brutus3) && Npc_IsDead(Meatbug_Brutus4) && (Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_MEATBUGSWEG_Info()
{
	B_GivePlayerXP(XP_BrutusMeatbugs);
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//Už je po štěnicích. Můžeš se vrátit a leštit všechny ty palečnice a ostatní mučící nástroje.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//Víš opravdu jistě, že tam ani jedna z těch potvor nezbyla?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Naprosto jistě.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//No tak tedy dobře. Tumáš, za odměnu si vezmi tohle zlato.
	B_GiveInvItems(self,other,ItMi_Gold,150);
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//Uá, jenom mě tu nerozbreč.
	TOPIC_END_BrutusMeatbugs = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_PERM4(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 32;
	condition = DIA_Brutus_PERM4_Condition;
	information = DIA_Brutus_PERM4_Info;
	permanent = TRUE;
	description = "Jsi v pořádku?";
};


func int DIA_Brutus_PERM4_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Brutus_MEATBUGSWEG) || (MIS_OCGateOpen == TRUE)) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM4_Info()
{
	if((MIS_OCGateOpen == TRUE) || ((hero.guild == GIL_KDF) && (Kapitel >= 5)))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Jsi v pořádku?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(znepokojeně) A víš určitě, že už tam žádné žravé štěnice nejsou?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ehm, podívej, jednu máš přímo za sebou.
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(ječí) Cože?!
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Flee,0,"");
	};
};


instance DIA_Brutus_BESSEN(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 55;
	condition = DIA_Brutus_BESSEN_Condition;
	information = DIA_Brutus_BESSEN_Info;
	permanent = TRUE;
	description = "Ty jsi posedlý!";
};


func int DIA_Brutus_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Brutus == TRUE) && (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//Ty jsi posedlý!

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDW))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//Běž do kláštera, ať tě tam vyléčí.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//Mně už není pomoci, běž pryč!
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//Někdo ti musí z hlavy vypudit ty démony.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(křičí) NE!
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_xardasritual_xardas,0,"");
	};
};


instance DIA_Brutus_KAP5_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP5_EXIT_Condition;
	information = DIA_Brutus_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_PICKPOCKET(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 900;
	condition = DIA_Brutus_PICKPOCKET_Condition;
	information = DIA_Brutus_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Brutus_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Brutus_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,Dialog_Back,DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};

func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};
