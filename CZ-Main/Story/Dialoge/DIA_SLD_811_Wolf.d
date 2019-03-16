/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Wolf_AboutCrawler_Info - opravena implementace proměnné (CanDoCrawlwerPlate)

*/




instance DIA_Wolf_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hallo(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_Hallo_Condition;
	information = DIA_Wolf_Hallo_Info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Jsi v pořádku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, já tě znám! Z kolonie.
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Co tady chceš?
};

instance DIA_Wolf_AboutSylvio(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_AboutSylvio_Condition;
	information = DIA_Wolf_AboutSylvio_Info;
	permanent = FALSE;
	description = "Co si myslíš o Sylviovi?";
};

func int DIA_Wolf_AboutSylvio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2) && (Sylvio_angequatscht >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutSylvio_01_00");	//Co si myslíš o Sylviovi?
	AI_Output(self,other,"DIA_Wolf_AboutSylvio_01_01");	//Vynikající člověk! On... rozdal by se pro ostatní! Neuvěřitelný... fantastický! Co ti mám povídat... krása.
	AI_Output(other,self,"DIA_Wolf_AboutSylvio_01_02");	//T-t... to jako co?!
	AI_Output(self,other,"DIA_Wolf_AboutSylvio_01_03");	//Víš přeci, že jsem přišel s Leem, tak co řešíš.
	AI_Output(other,self,"DIA_Wolf_AboutSylvio_01_04");	//Jen jsem chtěl...
	AI_Output(self,other,"DIA_Wolf_AboutSylvio_01_05");	//Poslouchej příteli! Bude lepší, když se vykašleš na ty otázky a začneš něco dělat.
};

instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = "Přišel jsem se k vám přidat.";
};

func int DIA_Wolf_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//Přišel jsem se k vám přidat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_01");	//Hmm...(zamyšleně) Chceš se k nám přidat? To je dobře!
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_02");	//Ale nepočítej s tím, že tě takhle snadno přijmou i ostatní.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_New_08_03");	//A co ty?
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_04");	//Jestli na mě chceš udělat dojem - tref všechny tři terče na střelnici.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_05");	//Udělej to a já ti dám můj souhlas.
	MIS_AppleTest = LOG_Running;
	Log_CreateTopic(TOPIC_AppleTest,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AppleTest,LOG_Running);
	B_LogEntry(TOPIC_AppleTest,"Wolf mi dá svůj hlas pokud trefím všechny tři terče na střelnici.");
	B_StartOtherRoutine(Sld_805_Cord,"WaitShoot");
};

instance DIA_Wolf_WannaJoin_Done(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Done_Condition;
	information = DIA_Wolf_WannaJoin_Done_Info;
	permanent = FALSE;
	description = "Udělal jsem, co jsi chtěl.";
};

func int DIA_Wolf_WannaJoin_Done_Condition()
{
	if((MIS_AppleTest == LOG_Running) && (AIMALLISDONE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Wolf_WannaJoin_Done_15_00");	//Udělal jsem, co jsi chtěl. Přimluvíš se teď za mě?
	AI_Output(self,other,"DIA_Wolf_WannaJoin_Done_08_01");	//Proč ne...(přátelsky) Potřebujem takový lidi, jako jsi ty!
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Ale nepočítej s tím, že tě takhle snadno přijmou i ostatní.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Poslední dobou sem přišla všelijaká sebranka. A mezi těma staršíma, ne všichni si tě budou pamatovat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//Sám jsem tě málem nepoznal, vypadáš strašně sešle.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Když padla bariéra, přežil jsem jen zázrakem.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Ale zdá se, že jsi měl štěstí.
	MIS_AppleTest = LOG_Success;
	Log_SetTopicStatus(TOPIC_AppleTest,LOG_Success);
	B_LogEntry(TOPIC_AppleTest,"Wolf pro mě bude hlasovat.");
	B_LogEntry_Quiet(TOPIC_SLDRespekt,"Wolf nemá nic proti tomu abych se přidal k žoldákům.");
	B_StartOtherRoutine(Sld_805_Cord,"Start");
};

instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = "Nemáš něco na prodej?";
};


func int DIA_Wolf_WannaBuy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Nemáš něco na prodej?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Ále, ani se neptej.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//O zbraně a zbroj se teď stará Bennet, jeden z těch nových chlápků.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//V kolonii jsem vedl celou Leeovu zbrojírnu a pak si přijde nějaký školený kovář a bác, jsem bez práce.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Zoufale potřebuju novou práci, i když tu nedělám nic jiného, než hlídám polnosti.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Ale nevadí mi to, aspoň tu nemusím sedět s rukama v klíně.
};


instance DIA_Wolf_WannaLearn(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = "Můžu se u tebe něčemu přiučit?";
};


func int DIA_Wolf_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Můžu se u tebe něčemu přiučit?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Jestli chceš, můžu ti poradit pár triků v zacházení s lukem. Nic lepšího teď stejně dělat nemůžu.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Wolf mě naučí zacházet s luky.");
};


var int Wolf_Merke_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = "Chtěl bych se trochu vylepšit ve střelbě.";
};


func int DIA_Wolf_TEACH_Condition()
{
	if((Wolf_TeachBow == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Chtěl bych se trochu vylepšit ve střelbě.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Co bych tě měl naučit?
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if(Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//A je to. Už máš zase o něco přesnější ruku.
	};
	Info_ClearChoices(DIA_Wolf_TEACH);
};

func void DIA_Wolf_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};


instance DIA_Wolf_PERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 9;
	condition = DIA_Wolf_PERM_Condition;
	information = DIA_Wolf_PERM_Info;
	permanent = TRUE;
	description = "Tak co? Už sis našel novou práci?";
};


func int DIA_Wolf_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Tak co? Už sis našel novou práci?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Ne, zatím ne. Dej mi vědět, jestli na něco natrefíš.
};


instance DIA_Wolf_Stadt(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = "Zkoušel sis něco najít ve městě?";
};


func int DIA_Wolf_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Zkoušel sis něco najít ve městě?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//Ve městě? (směje se) Tam by mě nedostali ani párem volů.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Nebo si myslíš, že bych tam měl dělat nějakého vojáka z domobrany? Nedovedu si představit, že bych nosil uniformu jak nějaký dvořan.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//A pak ta slepá poslušnost. Ne, zapomeň na to - možná tady na farmě nemám moc co na práci, ale aspoň si můžu dělat, co chci.
};


var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;

instance DIA_Wolf_AboutCrawler(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = DIA_Wolf_AboutCrawler_Condition;
	information = DIA_Wolf_AboutCrawler_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že umíš vykovat zbroj z červích krunýřů.";
};


func int DIA_Wolf_AboutCrawler_Condition()
{
	if(Wolf_ProduceCrawlerArmor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Slyšel jsem, že umíš vykovat zbroj z červích krunýřů.
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//To je fakt. Od koho ses to dozvěděl?

	if(HOKURN_ARMOR == TRUE)
	{
		AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_01A");	//Barem z táboru lovců mi to řekl.
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//Řekl mi to lovec jménem Gestath.
	};

	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Dokázal bys takovou zbroj vyrobit?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Jasně. Přines mi 10 červích krunýřů a já ti ji vyrobím.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//A kolik za ni budeš chtít?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Na placení zapomeň, udělám ti ji grátis, na památku starých dobrých časů.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates,"Wolf mi z 10 červích krunýřů vyková zbroj.");
	CanDoCrawlwerPlate = TRUE;
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit, jak červí krunýře oddělit?";
};

func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Můžeš mě naučit, jak červí krunýře oddělit?
	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
	Info_AddChoice(DIA_Wolf_TeachCrawlerPlates,Dialog_Back,DIA_Wolf_TeachCrawlerPlates_Back);
	Info_AddChoice(DIA_Wolf_TeachCrawlerPlates,b_buildlearnstringforsmithhunt("Vyjímání krunýřů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Wolf_TeachCrawlerPlates_Chest);
};

func void DIA_Wolf_TeachCrawlerPlates_Back()
{
	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
};

func void DIA_Wolf_TeachCrawlerPlates_Chest()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To je jednoduché. Zadní krunýře jsou totiž na těle pevně přichyceny pouze na okrajích. Stačí je ostrým nožem odříznout a je to.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Chápeš?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//To je jednoduché.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//Vždyť to povídám.
	};

	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
};

instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = "Sehnal jsem ty červí krunýře na zbroj.";
};

func int DIA_Wolf_BringPlates_Condition()
{
	if((MIS_Wolf_BringCrawlerPlates == LOG_Running) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Sehnal jsem ty červí krunýře na zbroj.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Skvělé, tak je sem dej.
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};

var int Wolf_Armor_Day;

instance DIA_Wolf_ArmorReady(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_ArmorReady_Condition;
	information = DIA_Wolf_ArmorReady_Info;
	permanent = TRUE;
	description = "Prima, a kdy ta zbroj bude?";
};

func int DIA_Wolf_ArmorReady_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Prima, a kdy ta zbroj bude?

	if(Npc_HasItems(self,ItAt_CrawlerPlate) >= 10)
	{
		if(Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = Wld_GetDay() + 1;
			Wolf_MakeArmor = TRUE;
		};
		if((Wolf_MakeArmor == TRUE) && (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Jen co ji dám dohromady. Vrať se zítra.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Už jsem ji dokončil, tady je!
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//A docela dobře myslím.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Díky!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Není zač.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ty vtipálku, nejdřív potřebuju ty červí krunýře...
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_Running;
	};
};

instance DIA_Wolf_KAP3_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP3_EXIT_Condition;
	information = DIA_Wolf_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wolf_BENGAR(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 31;
	condition = DIA_Wolf_BENGAR_Condition;
	information = DIA_Wolf_BENGAR_Info;
	permanent = TRUE;
	description = "Možná jsem ti našel práci u Bengara na statku.";
};

func int DIA_Wolf_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (MIS_BengarsHelpingSLD == LOG_Running) && (Kapitel >= 3) && (Wolf_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE) && (ConcertLoaBonus == TRUE))
	{
		return TRUE;
	};
};


var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info()
{
	if(WOLFRECRUITEDDT == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Možná jsem ti našel práci u Bengara na statku.

		if(DIA_Wolf_BENGAR_oneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Tak povídej.
			AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Přímo u Bengarova statku ústí průsmyk do Hornického údolí, kterým se pořád snaží prodrat nějaké obludy. Nemusím ani dodávat, že z nich má ten farmář pěkně těžkou hlavu.
			AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Proto je třeba, aby Bengarův statek někdo střežil.
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Na tom by mohlo něco být. Aspoň budu venku na poli a nebudu muset pořád okounět tady u kovárny.
			DIA_Wolf_BENGAR_oneTime = TRUE;
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (RhetorikSkillValue[1] >= 25))
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Souhlasím. A když jsi teď jedním z nás, udělám ti dobrou cenu. Dej mi 300 zlatých a já tam hned vyrazím.
				Wolf_BENGAR_geld = 300;
			}
			else if(RhetorikSkillValue[1] >= 25)
			{
				AI_Output(self,other,"DIA_Wolf_BENGAR_New_08_05");	//Souhlasím. A protože se známe tak dlouho, udělám ti dobrou cenu. Dej mi 300 zlatých a já tam hned vyrazím.
				Wolf_BENGAR_geld = 300;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Dobře. Dělá to 800 zlatých.
			AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To je pořádný balík.
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//No, pro někoho z nás bych to udělal za babku, ale ty nejsi žoldák...
			Wolf_BENGAR_geld = 800;
		};

		Info_ClearChoices(DIA_Wolf_BENGAR);
		Info_AddChoice(DIA_Wolf_BENGAR,"Budu o tom přemýšlet.",DIA_Wolf_BENGAR_nochnicht);
		Info_AddChoice(DIA_Wolf_BENGAR,"Tady je to zlato.",DIA_Wolf_BENGAR_geld);
	}
	else
	{
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Možná jsem ti našel práci u Bengara na statku.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Tak povídej.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Přímo u Bengarova statku ústí průsmyk do Hornického údolí, kterým se pořád snaží prodrat nějaké obludy. Nemusím ani dodávat, že z nich má ten farmář pěkně těžkou hlavu.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Proto je třeba, aby Bengarův statek někdo střežil.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Fajn, a teď půjdu dohlídnout na ty nestvůry.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Tak se zatím měj.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Tady je zlato

	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Fajn, a teď půjdu dohlídnout na ty nestvůry. Uvidíme, jestli se mi na té farmě podaří ještě někoho naverbovat.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Tak se zatím měj.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//No, kdybys měl dost peněz, už bych byl dávno na cestě.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Fajn, ale ne abys mě shodil.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = "Tak co, všechno v cajku?";
};


func int DIA_Wolf_PERMKAP3_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_PERMKAP3_onetime;

func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Tak co, všechno v cajku?
	if(Npc_IsDead(Bengar) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//Můj zaměstnavatel je mrtvý! No, a já si vždycky přál mít vlastní statek.
		if(MIS_ORсGREATWAR == LOG_Running)
		{
			AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_03");	//S těmi skřety je to tu vo hubu!
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//No jasně! Všude ticho jako v chrámu!.
		if(MIS_ORсGREATWAR == LOG_Running)
		{
			AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_04");	//Jen kdyby okolo nebyli skřeti!
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP4_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP4_EXIT_Condition;
	information = DIA_Wolf_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP5_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP5_EXIT_Condition;
	information = DIA_Wolf_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int wolf_SaidNo;

instance DIA_Wolf_SHIP(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_SHIP_Condition;
	information = DIA_Wolf_SHIP_Info;
	description = "Nelíbilo by se ti odsud vyplout na lodi?";
};


func int DIA_Wolf_SHIP_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Nelíbilo by se ti odsud vyplout na lodi?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Ne, už ne. Konečně jsem si našel práci. Možná někdy jindy.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//No jasně, pojďme odsud. Můžu ti pomoct s obranou lodi. A kam máme namířeno?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"Wolf už má tohoto ostrova plné zuby a udělal by cokoliv, jen aby se odsud dostal. Je to dobrý bojovník.");
	};
};


instance DIA_Wolf_KnowWhereEnemy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_KnowWhereEnemy_Condition;
	information = DIA_Wolf_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Chci se dostat na ostrov nedaleko odsud.";
};


func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (wolf_SaidNo == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (Wolf_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Chci se dostat na ostrov nedaleko odsud.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No tak na co ještě čekáme? Na moři tě můžu trochu pocvičit ve střelbě z luku a kuše.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Vlastně jsem si zrovna uvědomil, že už mám dost lidí.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(naštvaně) Tak TAKHLE to je! Nejdřív prudíš, ať se pohnu, a pak z toho nic není, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Jdi do hajzlu! Doufám, že se ta tvoje kocábka brzo potopí.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Musím o tom ještě trochu popřemýšlet.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Vítej na palubě!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Vítej na palubě!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//Přijď dolů do přístavu, už brzo vyplujeme.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Už jdu.
	B_GivePlayerXP(XP_Crewmember_Success);
	Wolf_IsOnBoard = LOG_SUCCESS;
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

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Musím o tom ještě trochu popřemýšlet.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Hele, víš co si myslím? Že se jenom tak vytahuješ. Nevěřím ti ani slovo, vysmahni.
	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};


instance DIA_Wolf_LeaveMyShip(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 55;
	condition = DIA_Wolf_LeaveMyShip_Condition;
	information = DIA_Wolf_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Stejně už mi nejsi k ničemu.";
};


func int DIA_Wolf_LeaveMyShip_Condition()
{
	if((Wolf_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Stejně už mi nejsi k ničemu.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Nejprve mi dáš naději a pak mě takhle odmítneš. Ty svině, za tohle zaplatíš!
	Wolf_IsOnBoard = LOG_FAILED;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Wolf_SHIPOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 56;
	condition = DIA_Wolf_SHIPOFF_Condition;
	information = DIA_Wolf_SHIPOFF_Info;
	permanent = TRUE;
	description = "Poslouchej.";
};


func int DIA_Wolf_SHIPOFF_Condition()
{
	if((Wolf_IsOnBoard == LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//Poslouchej.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Jdi do prdele, ty hajzle.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Wolf_KAP6_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP6_EXIT_Condition;
	information = DIA_Wolf_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 900;
	condition = DIA_Wolf_PICKPOCKET_Condition;
	information = DIA_Wolf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wolf_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,Dialog_Back,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};


instance DIA_WOLF_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = dia_wolf_bonusminecrawlerplates_condition;
	information = dia_wolf_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = "Mám jednu otázku.";
};


func int dia_wolf_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_AboutCrawler) && (BONUSMINECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wolf_BonusMineCrawlerPlates_01_00");	//Mám jednu otázku.
	AI_Output(self,other,"DIA_Wolf_BonusMineCrawlerPlates_01_01");	//Tak mě nenapínej!
	AI_Output(other,self,"DIA_Wolf_BonusMineCrawlerPlates_01_02");	//Slyšel jsem, že pláty červů se dají získávat účinněji, je to pravda?
	AI_Output(self,other,"DIA_Wolf_BonusMineCrawlerPlates_01_03");	//Ne, chlape - to jsou jen pohádky! (směje se) Staré bajky od starých lovců.
	AI_Output(self,other,"DIA_Wolf_BonusMineCrawlerPlates_01_04");	//Na tvém místě bych tomu moc nevěřil.
};


instance DIA_WOLF_ABOUTCRAWLERAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_aboutcrawleragain_condition;
	information = dia_wolf_aboutcrawleragain_info;
	permanent = FALSE;
	description = "Potřebuji další zbroj z důlního červa.";
};


func int dia_wolf_aboutcrawleragain_condition()
{
	if((Player_GotCrawlerArmor == TRUE) && (GIVECRAWLERARMOR == FALSE) && ((MIS_BAREMCRAWLERARMOR == LOG_Running) || (MIS_BAREMCRAWLERARMOR == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_wolf_aboutcrawleragain_info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawlerAgain_01_00");	//Potřebuji další zbroj z důlního červa.
	AI_Output(self,other,"DIA_Wolf_AboutCrawlerAgain_01_01");	//To jich potřebuješ tolik? (překvapeně)No, mě je to jedno, ale znáš pravidla - nejdříve mi musíš přinést jejich krunýře.
	AI_Output(self,other,"DIA_Wolf_AboutCrawlerAgain_01_02");	//Pak ti ji udělám.
};


instance DIA_WOLF_BRINGPLATESAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = dia_wolf_bringplatesagain_condition;
	information = dia_wolf_bringplatesagain_info;
	permanent = FALSE;
	description = "Sehnal jsem ty červí krunýře na zbroj.";
};


func int dia_wolf_bringplatesagain_condition()
{
	if(Npc_KnowsInfo(hero,dia_wolf_aboutcrawleragain) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10) && (GIVECRAWLERPLATE == FALSE) && (GIVECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_bringplatesagain_info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Sehnal jsem ty červí krunýře na zbroj.
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Skvělé, tak je sem dej.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	GIVECRAWLERPLATE = TRUE;
	WOLF_ARMOR_DAY_AGAIN = Wld_GetDay();
};


instance DIA_WOLF_ARMORREADYAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_armorreadyagain_condition;
	information = dia_wolf_armorreadyagain_info;
	permanent = TRUE;
	description = "Prima, a kdy ta zbroj bude?";
};

func int dia_wolf_armorreadyagain_condition()
{
	if((GIVECRAWLERPLATE == TRUE) && (GIVECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_armorreadyagain_info()
{
	var int currentday;
	currentday = Wld_GetDay();
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Prima, a kdy ta zbroj bude?
	if(WOLF_ARMOR_DAY_AGAIN <= (currentday - 1))
	{
		Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Už jsem ji dokončil, tady je.
		B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Snad ti dobře padne...
		AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Díky!
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Není zač.
		GIVECRAWLERARMOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Jen co ji dám dohromady. Vrať se zítra.
	};
};


instance DIA_WOLF_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_kapitelorcattack_condition;
	information = dia_wolf_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Co budeš dělat?";
};


func int dia_wolf_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (WOLFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_01_00");	//Co budeš dělat?
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_01_01");	//Zmizím odsud jakmile to bude možné!
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_01_02");	//Nevím jak to udělám, ale každopádně nezůstanu zde!
	Info_ClearChoices(dia_wolf_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_wolf_nw_kapitelorcattack,"Nabídnout runu na Onarovu farmu.",dia_wolf_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_wolf_nw_kapitelorcattack,"Já také ne.",dia_wolf_nw_kapitelorcattack_nogiverune);
};

func void dia_wolf_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_01");	//Mám tu runu na Onarovu farmu.
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_02");	//Jestli chceš, použij ji.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_03");	//Runu?!
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_05");	//Dobrá, dej mi ji.
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_06");	//Tu máš.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_07");	//Eh! Doufám, že se ještě uvidíme.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_11");	//Kdyžtak budu na farmě!
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_12");	//Samozřejmě.
	WOLFNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Wolfovi runu na Onarovu farmu!");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_wolf_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Já také ne.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_02");	//(povzdech) Pokusíme se prosekat městem.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Asi je to ejdiná šance na přežití!
	B_LogEntry(TOPIC_HELPCREW,"Wolf se pokusí dostat z města, ale nemyslím, že má moc velké šance.");
	WOLFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_811_WOLF_FUCKOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = dia_sld_811_wolf_fuckoff_condition;
	information = dia_sld_811_wolf_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_811_wolf_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (MIS_HUNTERSARMOR != LOG_Running) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_811_WOLF_YOURFREE(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_sld_811_wolf_yourfree_condition;
	information = dia_sld_811_wolf_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_811_wolf_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_yourfree_info()
{
	AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_08");	//Co tu děláš?
	AI_Output(other,self,"DIA_SLD_811_Wolf_YourFree_01_00");	//Jsi volný!
	AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_01");	//Hmm... (udiveně) Takže jsi skřety vyhnal z města?!
	AI_Output(other,self,"DIA_SLD_811_Wolf_YourFree_01_02");	//Už to tak bude.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_03");	//Výborně příteli! Už jsem myslel že se odsud nedostanu.
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_04");	//Otevři prosím ty mříže.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_05");	//Výborně příteli! Už jsem myslel že se odsud nedostanu.
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_06");	//Otevři prosím ty mříže.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_811_WOLF_OPENGATENOW(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_sld_811_wolf_opengatenow_condition;
	information = dia_sld_811_wolf_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_811_wolf_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (WOLFISFREE == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_opengatenow_info()
{
	AI_Output(self,other,"DIA_SLD_811_Wolf_OpenGateNow_01_00");	//No tak, kamaráde...(prosí) Pusť mě ven!
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_NW_WOLFNOTCAPTURED(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfnotcaptured_condition;
	information = dia_wolf_nw_wolfnotcaptured_info;
	permanent = FALSE;
	description = "Mám pro tebe prácičku.";
};


func int dia_wolf_nw_wolfnotcaptured_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFCAPTURED == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfnotcaptured_info()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_00");	//Mám pro tebe prácičku.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_01");	//Prácičku?! Hmm...(se zájmem) O co jde?
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_02");	//Nezbytně potřebuji zbroje z důlního červa.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_03");	//Dobrá, přines další pláty a ještě jednu bych ti udělal.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_04");	//Ale já potřebuji alespoň deset...
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_05");	//Deset?!... (udiveně) Ale na co tolik?
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_06");	//To je na dlouho. Uděláš to pro mě?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_07");	//Hmm...(zamyšleně) No, tak asi ano, ale potřebuji materiál a hlavně hodně času.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_09");	//Alespoň jeden měsíc.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_10");	//To je moc, potřebuji je rychle.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_11");	//V tom případě... Ti nemohu pomoci!
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_12");	//Nemůžeš mě alepoň naučit, jak se dělají?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_13");	//Naučit tě to?! Hmm...(zamyšleně) Dobrá ale toto tajemství bude velmi drahé!
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_14");	//Kolik?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_15");	//Alespoň 5000 a podělím se o něj.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Wolfovi by výroba zbrojí trvala celý měsíc! Požádal jsem ho, jestli by mě to nenaučil. Souhlasil, ale chce 5000 zlatých!");
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
	Info_AddChoice(dia_wolf_nw_wolfnotcaptured,"Nemám tolik zlata.",dia_wolf_nw_wolfnotcaptured_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_wolf_nw_wolfnotcaptured,"Dobře! Tady ho máš.",dia_wolf_nw_wolfnotcaptured_heremoney);
	};
};

func void dia_wolf_nw_wolfnotcaptured_nomoney()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_00");	//Nemám tolik zlata.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_01");	//Tak si nějaké najdi a pak si promluvíme!
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_02");	//Dobrá.
	WOLFNOTTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
};

func void dia_wolf_nw_wolfnotcaptured_heremoney()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_00");	//Tady ho máš.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_01");	//Dobrá... (úsměv) Tady máš klíč.
	B_GiveInvItems(self,other,itke_wolfarmor,1);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_02");	//Je od mé staré truhly, kde jsem schovával postupy výroby.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_04");	//A kde je?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_05");	//V mé staré chatce v Hornickém údolí.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_06");	//Snad se s ní nic nestalo.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Wolf mi dal klíč od jeho staré truhly v Hornickém údolí. Měl bych zajít do starého Nového tábora a najít ji!");
	WOLFTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
};


instance DIA_WOLF_NW_WOLFNOTCAPTUREDPERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfnotcapturedperm_condition;
	information = dia_wolf_nw_wolfnotcapturedperm_info;
	permanent = TRUE;
	description = "Prodej mi to tajmeství.";
};


func int dia_wolf_nw_wolfnotcapturedperm_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFNOTTEACHMEARMOR == TRUE) && (WOLFTEACHMEARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfnotcapturedperm_info()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_01_00");	//Prodej mi to tajmeství.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_01_01");	//Jak sem řekl za 5000, jasné?
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
	Info_AddChoice(dia_wolf_nw_wolfnotcapturedperm,"Tolik nemám.",dia_wolf_nw_wolfnotcapturedperm_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_wolf_nw_wolfnotcapturedperm,"Dobře! Tady ho máš.",dia_wolf_nw_wolfnotcapturedperm_heremoney);
	};
};

func void dia_wolf_nw_wolfnotcapturedperm_nomoney()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_00");	//Tolik nemám.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_01");	//Tak ti nic neřeknu.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_02");	//Dobře.
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
};

func void dia_wolf_nw_wolfnotcapturedperm_heremoney()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_00");	//Tady ho máš.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_01");	//Dobrá... (úsměv) Tu máš klíč.
	B_GiveInvItems(self,other,itke_wolfarmor,1);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_02");	//Je od mé staré truhly, kde jsem schovával postupy výroby.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_04");	//A kde je?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_05");	//V mé staré chatce v Hornickém údolí.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_06");	//Snad se s ní nic nestalo.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Wolf mi dal klíč od jeho staré truhly v Hornickém údolí. Měl bych zajít do starého Nového tábora a najít ji.");
	WOLFTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
};


instance DIA_WOLF_NW_WOLFCAPTURED(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfcaptured_condition;
	information = dia_wolf_nw_wolfcaptured_info;
	permanent = FALSE;
	description = "Kde se tu bereš?";
};


func int dia_wolf_nw_wolfcaptured_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFCAPTURED == TRUE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfcaptured_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_00");	//Kde se tu bereš?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_01");	//Skřeti mě zajali, když jsem se snažil probít městem s ostatními.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_02");	//Nevím, proč mě nezabili. K čemu jim jsem?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_04");	//Jaktože si tady?
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_05");	//Mám pro tebe práci.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_06");	//Práci?! Hmm...(se zájmem) O co jde?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_07");	//O co přesně jde?
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_08");	//Potřebuji další zbroj z červů.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_09");	//Aha... Ale jak ji mohu udělat zde?!
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_10");	//Skřeti mě nepustí na čestné slovo.
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_11");	//A řekneš mi jak to mohu udělat?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_15");	//Tady, vem si tento klíč.
	B_GiveInvItems(self,other,itke_wolfarmor,1);
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_16");	//Je od mé staré truhly, kde jsem schovával postupy výroby.
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_17");	//Kde přesně je?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_18");	//V mé staré chatce v Hornickém údolí.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_19");	//Snad se s ní nic nestalo.
	WOLFMEETINPRISON = TRUE;
	WOLFTEACHMEARMOR = TRUE;
	B_LogEntry(TOPIC_HUNTERSARMOR,"Našel jsem Wolfa! Řekl mi jak se dostanu k nákresům zbroje. Dal mi klíč od jeho staré truhly v Hornickém údolí. Měl bych zajít do starého Nového tábora a najít ji.");
};

var int CanDoCrawlwerPlateDay;
var int Player_GotCrawlerShield;

instance DIA_Wolf_CaracustPlate(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_CaracustPlate_Condition;
	information = DIA_Wolf_CaracustPlate_Info;
	permanent = FALSE;
	description = "Mám tady jeden neobvyklej krunýř.";
};

func int DIA_Wolf_CaracustPlate_Condition()
{
	if((CanDoCrawlwerPlate == TRUE) && (Npc_HasItems(other,ItAt_ZaracustPlate) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wolf_CaracustPlate_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_00");	//Mám tady jeden neobvyklej krunýř.
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_01");	//(se smíchem) A proč si myslíš, že je neobvyklej?
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_02");	//Tady, sám se podívej.
	B_GiveInvItems(other,self,ItAt_ZaracustPlate,1);
	Npc_RemoveInvItems(self,ItAt_ZaracustPlate,1);

	if(Trophy_CaracustPlate == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_CaracustPlate,Npc_HasItems(other,ItUt_CaracustPlate));
		Trophy_CaracustPlate = FALSE;
	};

	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_03");	//Spravedlivý Innosi! (ohromený) Je úžasnej!
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_04");	//Co překvapil jsem tě?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_05");	//To je slabé slovo kamaráde, něco takového jsem ještě neviděl! 
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_06");	//Jen se můžu dohadovat, jak velká bylo to monstrum, co ho nosilo.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_07");	//Věř mi, nechtěl bys to potkat.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_08");	//Ale chtěl jsem se zeptat na něco jiného. Dá se z toho vyrobit něco užitečného?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_09");	//Hmm... (zamyšleně) Na zbroj to moc vhodný není, ale štít by z toho mohl být dobrej.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_11");	//To zní dobře a dokázal bys to?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_12");	//Samozřejmě. Ale musím si s tím pohrát, abych krunýř opracoval správným způsobem.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_13");	//A kolik času potřebuješ, abys z něho vytvořil štít?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_14");	//Když mě nic nebude rozptylovat, může to být za pár dní. 
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_15");	//Dobře, tak se vrátím později.
	CanDoCrawlwerPlateDay = Wld_GetDay();
};

instance DIA_Wolf_CaracustPlate_Ready(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_CaracustPlate_Ready_Condition;
	information = DIA_Wolf_CaracustPlate_Ready_Info;
	permanent = TRUE;
	description = "Jak je na tom můj štít?";
};

func int DIA_Wolf_CaracustPlate_Ready_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_CaracustPlate) && (Player_GotCrawlerShield == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_CaracustPlate_Ready_Info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	AI_Output(other,self,"DIA_Wolf_CaracustPlate_Ready_01_00");	//Jak je na tom můj štít?

	if(CanDoCrawlwerPlateDay >= (DayNow - 2))
	{
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_01");	//Zatím není hotov, tak mě nezdržuj jestli ho chceš mít co nejdřív.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_02");	//Je hotový! Tady ho máš.
		B_GiveInvItems(self,other,ItAr_Shield_Caracust,1);
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_03");	//Podle mě - se to celkem povedlo...(zvažuje) Nade vší pochybnost, samozřejmě, musíš ho prověřit v boji!
		AI_Output(other,self,"DIA_Wolf_CaracustPlate_Ready_01_04");	//Paráda, co jsem dlužen za práci?
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_05");	//Ne - peníze od tebe za tu práci nechci. 
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_06");	//Stačí, že jsem strávil čas něčím užitečným, když jsem to pro tebe vyráběl.
		Player_GotCrawlerShield = TRUE;
	};
};

instance DIA_WOLF_NW_RECRDT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 23;
	condition = dia_wolf_nw_recrdt_condition;
	information = dia_wolf_nw_recrdt_info;
	permanent = FALSE;
	description = "Vzpomínam si, že jsi hledal práci.";
};

func int dia_wolf_nw_recrdt_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD != LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (ConcertLoaBonus == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_recrdt_info()
{
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_15_00");	//Vzpomínam si, že jsi hledal práci.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_15_01");	//A uspokojí tě zaměstnavatel jako já?
	AI_Output(self,other,"DIA_WOLF_NW_RecrDT_01_02");	//Všichni platí jedním a tím samým zlatem, otazka ale zní kolik, takže mě je jedno pro koho pracuji. Ale vás ja trochu znám. Má to něco společného s tvým přistěhováním k nám do okolí?
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_15_03");	//Přímo. Potřebuji strážce do věže v době mé nepřítomnosti. Co myslíš? 
	AI_Output(self,other,"DIA_WOLF_NW_RecrDT_01_04");	//Fajn. Souhlasím. Ale já potřebuji zaplatit dopředu za pár měsíců.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_01_05");	//Kolik?
	AI_Output(self,other,"DIA_WOLF_NW_RecrDT_15_06");	//Dva tisíce zlatých mincí!
};

instance DIA_WOLF_NW_RECRDTFINALLY(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 23;
	condition = dia_wolf_nw_recrdtfinally_condition;
	information = dia_wolf_nw_recrdtfinally_info;
	permanent = FALSE;
	description = "Tady máš prachy!";
};

func int dia_wolf_nw_recrdtfinally_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_KnowsInfo(other,dia_wolf_nw_recrdt) && (MIS_BengarsHelpingSLD != LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_recrdtfinally_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_WOLF_NW_RecrDTFinally_15_00");	//Tady máš prachy! A teď zvedni prdel a praskej makat!
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_WOLF_NW_RecrDTFinally_01_01");	//Och, zapnul šéfa! Mě se líbi! Ano šéfe, už běžím!
	AI_Output(self,other,"DIA_WOLF_NW_RecrDTFinally_01_02");	//Jo, mimochodem... budeš proti, když naverbuju pro ochranu pár bojovníku?
	AI_Output(other,self,"DIA_WOLF_NW_RecrDTFinally_01_03");	//Jasně, že ne. Ochrana navíc ještě nikdy nikomu neublížila. Tedy jen pokud mě nebude stát jako několik dalších Wolfů, a taky jestli ti budou pomahat v práci a ne v pití.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDTFinally_01_04");	//Aha, ano, heslo k průchodu do tábora je fráze 'dračí poklad'. Nezapomeň!
	AI_Output(self,other,"DIA_WOLF_NW_RecrDTFinally_01_05");	//Och, tak originální heslo nikdy nezapomenu. Uvidime se v táboře!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Naverboval jsem Wolfa na ochranu věže.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	WOLFRECRUITEDDT = TRUE;
	WolfDayHire = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
	Wld_InsertNpc(SLD_8111_Soeldner,"NW_CASTLEMINE_TOWER_NAVIGATION");
	Wld_InsertNpc(SLD_8112_Soeldner,"NW_CASTLEMINE_TOWER_NAVIGATION2");
};

instance DIA_Wolf_Bonus(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_Bonus_Condition;
	information = DIA_Wolf_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Wolf_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,10,7,54) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Bonus_Info()
{
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_BOW,1);
	AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Přesnost střelby závisí na tvé obratnosti. Čím větší je tvá obratnost, tím přesněji doletí šíp do cíle.
	AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Tvoje schopnost určuje vzdálenost, vekteré je možné cíl zasahnout. Aby ses stal dobrým střelcem, musíš zlepšovat to a i to.
	AI_StopProcessInfos(self);
};