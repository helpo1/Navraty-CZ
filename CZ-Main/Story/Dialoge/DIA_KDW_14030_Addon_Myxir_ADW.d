
instance DIA_Addon_Myxir_ADW_EXIT(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 999;
	condition = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_ADWHello(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_ADWHello_Condition;
	information = DIA_Addon_Myxir_ADWHello_Info;
	description = "Máš nějaké zprávy?";
};


func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Máš nějaké zprávy?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Stavitelé těchto ruin mě fascinují!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Je to škoda, že jejich jazyk je mrtvý tak jako oni sami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//Ani jejich mocné rituály a duchové jejich předků je nemohli spasit.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Duchové předků?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Stavitelé byli úzce spjati se světem duchů.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Jestli jsem to pochopil správně, věřili, že byli v neustálém spojení s jejich předky.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Kvůli tomu pravidelně pořádali rituály a vyvolávali duchy. Duchové jim poté dávali rady a pomáhali jim dosáhnout osvícení.
	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Jak prováděli ty rituály?",DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Nemrtví, které jsem potkal já, toho moc nenamluvili.",DIA_Addon_Myxir_ADWHello_Watt);
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak prováděli ty rituály?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Strážci smrti měli svá speciální kouzla, kterými klidnili duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Nicméně texty, které jsem zde našel, jsou docela nejasné. Velmi zřídka se mi podaří najít jasné odpovědi na otázky, které mě zajímají.
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//Nemrtví, které jsem potkal já, toho moc nenamluvili.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Stavitelé ale nepřivolávali bezduché nemrtvé jako jsou zombie nebo kostlivci.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//Podařilo se jim přivolat duchy velkých válečníků, kněžích a vládců.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Není pochyb o tom, že opravdu existovali.
};


instance DIA_Addon_Myxir_PermADW(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_PermADW_Condition;
	information = DIA_Addon_Myxir_PermADW_Info;
	permanent = TRUE;
	description = "Pokud potkám ducha, dám ti vědět.";
};


func int DIA_Addon_Myxir_PermADW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Pokud potkám ducha, dám ti vědět
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(směje se) Ano, trvám na tom.
};

instance DIA_Addon_Myxir_AncientBook(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_AncientBook_Condition;
	information = DIA_Addon_Myxir_AncientBook_Info;
	permanent = FALSE;
	description = "Vypadáš trochu zmateně.";
};

func int DIA_Addon_Myxir_AncientBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_AncientBook_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBook_01_00");	//Vypadáš trochu zmateně.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_01");	//Víš, od té doby co jsem začal studovat kulturu Stavitelů, jsem neustále sužován jednou otázkou.
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBook_01_02");	//Jakou?
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_03");	//Již víme, že naši dávní předkové používali kamenné desky v podstatě jako formu zápisků.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_04");	//Zdá se mi ale, že museli mít plnohodnotné knihy, ve kterých uchovávali své znalosti a moudrost.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_05");	//Na sever od tohoto údolí se nachází velký chrám a vypadá to, že ho Stavitelé používali jako svou knihovnu.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_06");	//Bohužel teď nemám možnost se do toho chrámu vypravit a důkladně ho prozkoumat.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_07");	//Ale možná tobě by se to mohlo podařit?
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBook_01_08");	//A ty věříš, že knihy Stavitelů skutečně existují?
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_09");	//Nejsem si jistý. Ale jejich civilizace je více než tisíc let stará.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_10");	//A za tak dlouhou dobu se nedají všechny vědomosti zaznamenat pouze na kusy kamene.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_11");	//Tudíž je dost možné, že nevíme o existenci jiných zdrojů jejich znalostí.
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBook_01_12");	//Dobře. Při té příležitosti se na to podívám.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBook_01_13");	//Výborně. Pokud najdeš něco zajímavého, určitě mi to přijď ukázat.
	MIS_MyxirAncientBook = LOG_Running;
	Log_CreateTopic(TOPIC_MyxirAncientBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Running);
	B_LogEntry(TOPIC_MyxirAncientBook,"Myxir věří, že Stavitelé měli své skutečné knihy. Myslí si, že mohou být nalezeny v knihovně, která se nachází v severovýchodní části údolí.");
};

instance DIA_Addon_Myxir_AncientBookDone(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_AncientBookDone_Condition;
	information = DIA_Addon_Myxir_AncientBookDone_Info;
	permanent = FALSE;
	description = "Podívej se na toto.";
};

func int DIA_Addon_Myxir_AncientBookDone_Condition()
{
	if((MIS_MyxirAncientBook == LOG_Running) && (Npc_HasItems(hero,ItWr_AncientBook_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_AncientBookDone_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBookDone_01_00");	//Podívej se na toto. 
	B_GiveInvItems(other,self,ItWr_AncientBook_01,1);
	Npc_RemoveInvItems(self,ItWr_AncientBook_01,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_01");	//U Adana... (udiveně) Kde jsi našel tento starobylý rukopis?
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBookDone_01_02");	//Tam kam jsi mě poslal, abych se podíval - v knihovně Stavitelů.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_03");	//Neuvěřitelné! Takže jsem měl pravdu a skutečně uchovali některé ze svých záznamů zde v těchto knihách.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_04");	//Tyto záznamy by měly být co nejdříve důkladně prozkoumány.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_05");	//Možná, že je to kniha, kde se skrývají odpovědi na naše otázky.
	MIS_MyxirAncientBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Success);
	B_LogEntry(TOPIC_MyxirAncientBook,"Dal jsem Myxirovi knihu Stavitelů, kterou jsem našel v troskách knihovny.");
};

instance DIA_Addon_Myxir_GeistTafel(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistTafel_Condition;
	information = DIA_Addon_Myxir_GeistTafel_Info;
	description = "Saturas mě poslal.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if((Saturas_RiesenPlan == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Saturas mě poslal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Raven se ukryl do chrámu a zavřel za sebou bránu zevnitř.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas se domnívá, že se od ducha dozvěděl jak se dostat do chrámu!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(zdrcený) Ó, Adane!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Musíme zjistit, jak otevřít bránu. Musel vyvolat vrchního kněze Khardimona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Podle záznamů byl jeho hrob v jeskyních pod pevností!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Měl bys udělat to samé.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale Khardimona se už nebudeš schopen zeptat...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//Hrobka vůdce válečníků Quarhodrona leží na západě údolí.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Musíš hrobku najít... a probudit Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//Je tu napsáno, že ten kdo má víru v Adana, může ducha přivolat.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Myslíš, že to bude fungovat?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//Prošlo mi rukama mnoho nesmyslných rukopisů.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Například Y'Berionovy zápisy, vůdce Bratrstva Spáče.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale autorovi těchto spisů věřím!
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_Running;
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Myslíš to vážně?",DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Proč Quarhodron? Proč ne vrchní kněz Khardimon osobně?",DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Bratrstvo Spáče nešířilo jenom lži.",DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Proč Quarhodron? Proč ne vrchní kněz Khardimon osobně?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Raven znesvětil Khardimonovu hrobku svým rituálem.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Musíš se tedy podívat po jiném duchovi.
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bratrstvo Spáče nešířilo jenom lži.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//Nebylo to jen to o čem mluvili, co mě utrvdilo v nepravdivosti, ale slova která použili.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//Řeči členů Bratrstva byly zmatené a nepochopitelné. Jejich mysli byly zatemněny trávou z bažin, kterou kouřili bez přestávky.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Ale text napsaný na této tabulce byl napsán rozvážným a rozumným člověkem. A to mě utvrzuje v pravdivosti jeho slov.
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Myslíš to vážně?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Musíme využít všechny možnosti.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//I kdybychom měli jen mizivou šanci se setkat s jedním ze Stavitelů, pak toho musíme využít.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Nakonec, i Raven to dokázal.
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"A co mám tedy udělat, abych mohl přivolat toho ducha?",DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//A co mám tedy udělat, abych mohl přivolat toho ducha?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Najdi Quarhodronův hrob na západě údolí.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Duch může být vývolán za pomocí zaklínadla Strážců smrti. Tady jsem ti to napsal.
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//Toť vše. Teď už jen musíš najít jeho hrob.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Hodně štěstí synu!
	B_LogEntry(TOPIC_Addon_Quarhodron,"Myxir chce, abych probudil ducha pradávného krále válečníků Quadrohona a požádal ho o radu. Dal mi dokument s magickou formulí, kterou mám přečíst v Quarhodronově hrobce, která se nachází na západě.");
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};

instance DIA_Addon_Myxir_GeistPerm(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistPerm_Condition;
	information = DIA_Addon_Myxir_GeistPerm_Info;
	description = "Pověz mi ještě jednou o tom, jak přivolat Quarhodronova ducha.";
};


func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if(MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Pověz mi ještě jednou o tom, jak přivolat Quarhodronova ducha.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//Měl bys najít jeho hrob a přivolat ho pomocí slov Strážců smrti.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Napsal jsem ty slova. Musíš je jenom nahlas přečíst.
};


instance DIA_Addon_Myxir_TalkedToGhost(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_TalkedToGhost_Info;
	description = "Promluvil jsem s Quarhodronem.";
};


func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Promluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(nadšeně) Tobě se ho opravdu povedlo probudit z království mrtvých?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//Neuvěřitelné! Tito Stavitelé mě udivují čím dál víc.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kdo ví, čeho mohli dosáhnout, pokud by nevymřeli...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
	if((Saturas_KnowsHow2GetInTempel == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co ten duch říkal?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Řekl mi o tom, jak se dostat do chrámu.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//V tom případě zamiř přímo k Saturasovi. Nepochybně ho bude velmi zajímat, co mu řekneš.
		B_LogEntry(TOPIC_Addon_Quarhodron,"Měl bych ohlásit Saturasovi, že jsem probudil Quarhodrona.");
	};
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

instance DIA_Addon_Myxir_ADW_Teach(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 90;
	condition = DIA_Addon_Myxir_ADW_Teach_Condition;
	information = DIA_Addon_Myxir_ADW_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě jazyk Stavitelů.";
};

func int DIA_Addon_Myxir_ADW_Teach_Condition()
{
	if((DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nauč mě jazyk Stavitelů.

	if(DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,Dialog_Back,DIA_Addon_Myxir_ADW_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Už není nic, co bych ti mohl ukázat. Mistrovsky jsi ovládl jazyk Stavitelů.
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Dobře, začneme s něčím jednoduchým. Nejdřív se budeme zabývat jazykem rolníků.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty psané v jazyce rolníků většinou pojednávají o světských zájmech jako práce, láska a opatřování potravin.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to nejrozšířenější jazyk ve společnosti. Pokud si ho osvojíš, budeš rozumět většině textů, které se zde nacházejí.
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//S jazykem rolníků ses už seznámil. Jazyk válečníků je trochu komplikovanější.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Jak asi tušíš, texty psané v jazyce válečníků většinou obsahují informace příbuzné válkám a zbraním. Myslím si, že pro tebe to bude velmi užitečné.
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vznešenému jazyku kněží je velice těžké porozumět, ale já ti ho s radostí vysvětlím.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//V jazyku kněží jsou mimo jiné všechny posvátné texty, které vysvětlují příběh a magii Stavitelů.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Každý z těchto textů je pro člověka, který jim rozumí, opravdový poklad.
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

instance DIA_ADDON_MYXIR_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 1;
	condition = dia_addon_myxir_adw_prayforgomez_condition;
	information = dia_addon_myxir_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_myxir_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Myxir_ADW_PrayForGomez_01_02");	//Promluv si o tom se Saturasem.
	AI_Output(self,other,"DIA_Addon_Myxir_ADW_PrayForGomez_01_03");	//Myslím, že ti pomůže.
	SENTTOSATURASGOMEZ = TRUE;
};