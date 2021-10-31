
instance DIA_Igaranz_Kap1_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Hello(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaraz_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Hello_Info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Co pro tebe mohu udělat, bratře?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Co pro tebe mohu udělat?
	};
};


instance DIA_Igaraz_Wurst(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Wurst_Condition;
	information = DIA_Igaraz_Wurst_Info;
	permanent = FALSE;
	description = "Mám roznést klobásy.";
};


func int DIA_Igaraz_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Mám roznést klobásy.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//Pracuješ pro Goraxe, co? Tak sem s ní.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Igaranz_NotWork(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 3;
	condition = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent = FALSE;
	description = "Proč nepracuješ?";
};


func int DIA_Igaraz_NotWork_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_NotWork_Info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Proč nepracuješ?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Bylo mi dovoleno studovat učení Innose.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Jednou budu mágem.
};


instance DIA_Igaranz_Choosen(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent = TRUE;
	description = "Kdo se může stát mágem?";
};


func int DIA_Igaraz_Choosen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Choosen_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Kdo se může stát mágem?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Novicové, kteří projdou zkouškou.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Kdo ji splní, je přijat mezi mágy.
	Info_ClearChoices(DIA_Igaranz_Choosen);
	Info_AddChoice(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice(DIA_Igaranz_Choosen,"Co je to za zkoušku?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice(DIA_Igaranz_Choosen,"Jak můžu složit zkoušku?",DIA_Igaranz_Choosen_HowChoosen);
};

func void DIA_Igaranz_Choosen_back()
{
	Info_ClearChoices(DIA_Igaranz_Choosen);
};

func void DIA_Igaranz_Choosen_TestOfMagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Co je to za zkoušku?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//Je to test Nejvyšší rady pro novice.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Tento úkol má prověřit víru a moudrost novice.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Může se ho účastnit každý novic, ale jen jeden ho splní.
};

func void DIA_Igaranz_Choosen_HowChoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Jak můžu složit zkoušku?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Innos sám vyjeví jak, nemůžeš se rozhodnout sám od sebe.
};


instance DIA_Igaranz_StudyInnos(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent = FALSE;
	description = "Jak mohu začít studovat Písmo?";
};


func int DIA_Igaraz_StudyInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (Parlan_Erlaubnis == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_StudyInnos_Info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Jak mohu začít studovat Písmo?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Musíš dostat přístup ke knihovně.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Parlan ti dá klíč, když pro něj splníš všechny úkoly.
};


instance DIA_Igaraz_IMTHEMAN(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_IMTHEMAN_Condition;
	information = DIA_Igaraz_IMTHEMAN_Info;
	important = TRUE;
};


func int DIA_Igaraz_IMTHEMAN_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_IMTHEMAN_Info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//Stalo se to... Innos mne vybral pro svou zkoušku.
};


instance DIA_Igaraz_METOO(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 19;
	condition = DIA_Igaraz_METOO_Condition;
	information = DIA_Igaraz_METOO_Info;
	permanent = FALSE;
	description = "Mne také!";
};


var int DIA_Igaraz_METOO_NOPERM;

func int DIA_Igaraz_METOO_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_METOO_Info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//Mne také! Požádal jsem o Zkoušku ohně.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//Buď si tě vybral Innos nebo jsi blázen.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Povedlo se mi dost bláznivých věcí...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Innos mě podporuje a to já projdu touhle zkouškou!
	Info_ClearChoices(DIA_Igaraz_METOO);
	Info_AddChoice(DIA_Igaraz_METOO,Dialog_Back,DIA_Igaraz_METOO_BACK);
	Info_AddChoice(DIA_Igaraz_METOO,"Možná můžeme pokračovat spolu...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice(DIA_Igaraz_METOO,"A našel jsi něco?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice(DIA_Igaraz_METOO,"Viděl jsi Agona nebo Ulfa?",DIA_Igaraz_METOO_AGON);
};

func void DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices(DIA_Igaraz_METOO);
};

func void DIA_Igaraz_METOO_TELL()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//A našel jsi něco?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//No, něco ti řeknu.
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Kolem farmy nenajdeš nic.
};

func void DIA_Igaraz_METOO_HELP()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Možná můžeme pokračovat spolu...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Zapomeň, tento úkol splním sám.
};

func void DIA_Igaraz_METOO_AGON()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Viděl jsi Agona nebo Ulfa?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Rozdělili jsme se u hostince, kam šli dál, to nevím, ale šli spolu.
};


instance DIA_Igaraz_ADD(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 23;
	condition = DIA_Igaraz_ADD_Condition;
	information = DIA_Igaraz_ADD_Info;
	permanent = FALSE;
	description = "Víš něco o 'živé skále'?";
};


func int DIA_Igaraz_ADD_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE) && (Npc_KnowsInfo(other,DIA_Igaraz_Stein) == FALSE) && Npc_KnowsInfo(other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_ADD_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Víš něco o 'živé skále'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//Ne! (směje se) Takže ty jsi dostal úkol od Serpentese?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Ano, a co?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//Myslím, že vím, co myslel...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Nejsi první, kdo neprošel zkouškou...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Kde ji najdu?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Stačí jít touto cestou, po chvíli uvidíš řeku.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Drž se po cestě do hor.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Pokud se dostaneš k mostu, už jsi moc daleko.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//Ale pochybuji, že tak daleko dojdeš.
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//To je vše, co ti můžu říct!
};

instance DIA_Igaraz_Pruefung(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 22;
	condition = DIA_Igaraz_Pruefung_Condition;
	information = DIA_Igaraz_Pruefung_Info;
	description = "Něco nového?";
};

func int DIA_Igaraz_Pruefung_Condition()
{
	if((other.guild == GIL_NOV) && (MageFireChestOpen == FALSE) && (Npc_KnowsInfo(other,DIA_Igaraz_METOO) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Pruefung_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Něco nového?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Zatím ne, ale stále hledám.
	AI_StopProcessInfos(self);

	if(Igaraz_Wait == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};


instance DIA_Igaraz_Stein(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = DIA_Igaraz_Stein_Condition;
	information = DIA_Igaraz_Stein_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Igaraz_Stein_Condition()
{
	if((other.guild == GIL_NOV) && (Kapitel == 1) && (MageFireChestOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Stein_Info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hej, počkej! Musíme si promluvit.
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//Já nemám o čem.
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Na tuto zkoušku jsem čekal mnoho let a musím jí projít.

	if(Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//Nevím, jak jsi na to přišel.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Nejsi první, kdo to říkal.
	};

	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Přestaň, chci to, co jsi našel!
	AI_TurnToNPC(self,other);
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_01");	//Notak, uklidni se, jsi směšný!
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_02");	//Nemám na výběr, musím projít touto zkouškou!
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_03");	//Přivoláš na sebe Innosův hněv, stojí ti to za to?
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_05");	//Ale... O tom jsem nepřemýšlel.
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_06");	//Innos si vybere své oblíbence, ale jen pokud jsou toho hodni...
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_07");	//Odlož zbraň a vrať se do kláštera.
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_08");	//Ano, máš pravdu... Nechápu, co do mně vjelo.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_09");	//Co teď?
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_10");	//Modli se. Tak můžeš získat přízeň Innose.
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_11");	//Jestli se stanu mágem, pomohu ti.
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_12");	//Vážně bys mi pomohl...? No, díky... Vrácím se do kláštera, zatím ahoj...
	MIS_Igaraz_OneMoreChance = LOG_Running;
	Log_CreateTopic(TOPIC_IGARANZ_NEW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_Running);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Igaraz mne chtěl zabít kvůli Zkoušce Ohně, ale přesvědčil jsem ho, že to Innose nepotěší. Slíbil jsem mu, že o něm promluvím s představenstvem mágů, pokud se stanu mágem.");
	AI_StopProcessInfos(self);
};

instance DIA_Igaranz_TalkAboutBabo(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent = FALSE;
	description = "Musíme si promluvit o Babovi.";
};

func int DIA_Igaraz_TalkAboutBabo_Condition()
{
	if(MIS_BabosDocs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Musíme si promluvit o Babovi.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//Co se děje?
};


instance DIA_Igaranz_BabosBelongings(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent = FALSE;
	description = "Máš něco, co je jeho.";
};

func int DIA_Igaraz_BabosBelongings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//Máš něco, co je jeho.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//Co to může být?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Nějaké papíry, Babo by je chtěl zpět.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//Vážně? Raději bych si je nechal.
};

instance DIA_Igaranz_WhereDocs(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent = FALSE;
	description = "Tak kde jsou ty papíry?";
};


func int DIA_Igaraz_WhereDocs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_WhereDocs_Info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Tak kde jsou ty papíry?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//No, já je nemám u sebe, je mi líto.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Kde jsou?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//Mám je ve své truhle a bez klíče máš smůlu.
};


instance DIA_Igaranz_BabosJob(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent = FALSE;
	description = "Co po Babovi chceš?";
};


func int DIA_Igaraz_BabosJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosJob_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Co po Babovi chceš?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Kdybych věděl, co bude za problémy kvůli trošce trávy, našel jsem si někoho jiného.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//On pěstuje trávu?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Samozřejmě. A kvůli zničené bariéře cena za trávu stoupla.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//Mohli bychom z toho mít dobrý prachy, ale on do toho nechce.
};

var int IgaranzLowPrice;

instance DIA_Igaranz_Price(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent = FALSE;
	description = "Kolik chceš za ty papíry?";
};

func int DIA_Igaraz_Price_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Price_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Kolik chceš za ty papíry?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//No, lze říci, že jsou k nezaplacení, nic tak cenného tu neseženeš.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Ale nebudu riskovat svou pověst.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//Tři sta zlatých a můžeš si s nima dělat co chceš.

	if(RhetorikSkillValue[1] >= 35)
	{
		AI_Output(other,self,"DIA_Igaranz_Price_13_04");	//To je dost za kus papíru, nemyslíš?!
		AI_Output(self,other,"DIA_Igaranz_Price_13_05");	//Tak dvě stě, ale to je mé poslední slovo.
		IgaranzLowPrice = TRUE;
	};
};

instance DIA_Igaranz_BuyIt(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent = FALSE;
	description = "Chci ty papíry koupit.";
};

func int DIA_Igaraz_BuyIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_Price) && (MIS_BabosDocs != LOG_SUCCESS))
	{
		if((IgaranzLowPrice == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 200))
		{
			return TRUE;
		}
		else if(Npc_HasItems(other,ItMi_Gold) >= 300)
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_BuyIt_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Chci ty papíry koupit.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Dám ti klíč k té truhle, posluž si.

	if(IgaranzLowPrice == TRUE)
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(other,self,ItMi_Gold,200);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,300);
	};
	
	B_GiveInvItems(self,other,ItKe_IgarazChest_Mis,1);
};


instance DIA_Igaranz_Perm(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent = FALSE;
	description = "Máš ještě něco, co by mě mohlo zajímat?";
};


func int DIA_Igaraz_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF) && (MIS_BabosDocs != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Perm_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//Máš ještě něco, co by mě mohlo zajímat?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Hmm... ne.
	AI_StopProcessInfos(self);
};


var int is_igaranz_condition;

instance DIA_Igaranz_OneMoreChance_News(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaranz_OneMoreChance_News_condition;
	information = DIA_Igaranz_OneMoreChance_News_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaranz_OneMoreChance_News_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Igaraz_OneMoreChance == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaranz_OneMoreChance_News_info()
{
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_01_01");	//Blahopřeji, vidím, že je z tebe mág Ohně.
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_01_02");	//Ano, jak vidíš. Neměl by ses zajímat o povinnosti novice? 
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_01_03");	//Promiň, mágu, máš pravdu.
	Info_ClearChoices(DIA_Igaranz_OneMoreChance_News);
	Info_AddChoice(DIA_Igaranz_OneMoreChance_News,"Asi ti neudělám radost.",DIA_Igaranz_OneMoreChance_News_yes);
	Info_AddChoice(DIA_Igaranz_OneMoreChance_News,"Rozmyslel jsem si to, nepomůžu ti.",DIA_Igaranz_OneMoreChance_News_no);
};

func void DIA_Igaranz_OneMoreChance_News_yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_yes_01_01");	//Asi ti neudělám radost.
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_yes_01_02");	//Zkus zatím trávit čas učením...
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_yes_01_03");	//Pracuj na sobě a vše bude dobré.
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_yes_01_04");	//Jasně, chápu.
	B_LogEntry(TOPIC_IGARANZ_NEW,"Igaraz není smířen se svým osudem novice...");
	Info_ClearChoices(DIA_Igaranz_OneMoreChance_News);
};

func void DIA_Igaranz_OneMoreChance_News_no()
{
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_no_01_01");	//Rozmyslel jsem si to, nepomůžu ti.
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_no_01_02");	//Proč bych měl pomáhat někomu, kdo mě chtěl zabít?
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_no_01_03");	//Za to zaplatíš, to přísahám!
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_no_01_04");	//Neopovažuj se pozvednout ruku proti mágovi!
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_no_01_05");	//(nasraně) Pozvednout ruku? Já tě rovnou zabiju!
	MIS_Igaraz_OneMoreChance = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_IGARANZ_NEW);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


var int igoranz_task;

instance DIA_Igaraz_New_OfferHelp(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_New_OfferHelp_condition;
	information = DIA_Igaraz_New_OfferHelp_info;
	permanent = FALSE;
	description = "Mluvil jsem o tobě s mágy.";
};


func int DIA_Igaraz_New_OfferHelp_condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && (IS_TALAMON_IGORANZCONDITION == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_New_OfferHelp_info()
{
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_01_01");	//Mluvil jsem o tobě s mágy.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_01_02");	//Talamon chce, abys našel a zabil démona. Jako důkaz chce jeho srdce.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_01_03");	//Takže Talamon mě pošle do boje s démonem...?!
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_01_04");	//Je to tvá jediná šance.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_01_05");	//Nikdy jsem žádné stvoření Beliara nezabil, ani nevím, kde ho najít!
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_01_06");	//Pomoz mi, udělám cokoliv!
	Info_ClearChoices(DIA_Igaraz_New_OfferHelp);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Promiň, s tím ti nepomůžu.",DIA_Igaraz_New_OfferHelp_peace);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Za svoji pomoc budu chtít zlato!",DIA_Igaraz_New_OfferHelp_gold);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Hodily by se mi nějaké magické předměty nebo recepty.",DIA_Igaraz_New_OfferHelp_magic);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Neudělám to pro tebe.",DIA_Igaraz_New_OfferHelp_no);
};

func void DIA_Igaraz_New_OfferHelp_peace()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_peace_01_01");	//Promiň, s tím ti nepomůžu.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_peace_01_02");	//Musíš to udělat sám, abys dokázal svou oddanost Innosovi.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_peace_01_03");	//Ano, pane... Ale může to trvat věčnost, než ho najdu. A může to být poslední okamžik mého život až se mu postavím.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_peace_01_04");	//Ale pokusím se o to!
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Odmítl jsem Igarazovi pomoct, měl by svou zkoušku splnit sám.");
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_gold_01_01");	//Za svoji pomoc budu chtít zlato!
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_gold_01_02");	//Lov démonů není sranda a budu potřebovat výbavu.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_gold_01_03");	//To není problém, v klášteře mi dluží skoro každá myš.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_gold_01_04");	//Snad bych mohl dát dohromady tři nebo čtyři tisíce, bude to dost?
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_gold_01_05");	//To postačí, seženu ti to srdce.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_gold_01_06");	//Budu čekat... A zatím vyberu to zlato.
	IgaranzMakeHappyGold = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Řekl jsem Igarazovi, že mu pomůžu dostat srdce démona. Slíbil mi tři nebo čtyři tisíce. No, peníze nesmrdí...");
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_magic()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_magic_01_01");	//Hodily by se mi nějaké magické předměty nebo recepty. 
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_02");	//No, něco bych pro tebe měl.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_03");	//Stěny tohoto kláštera ukrývají mnohá tajemství a ta jsou mi dostupnější než lov na démona.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_magic_01_04");	//Snad to nebude jen nějaký levný svitek.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_05");	//Nebudeš litovat!
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_magic_01_06");	//Dobře, seženu ti to srdce.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_07");	//Počkám na tebe.
	IgaranzMakeHappyMagic = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Slíbil jsem Igarazovi, že mu seženu srdce démona. Za odměnu mi slíbil nějaký magický předmět nebo recept, prý nebudu litovat, tak uvidíme...");
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_no()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_no_01_01");	//Neudělám to pro tebe.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_no_01_02");	//Myslím, že bych neměl.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_no_01_03");	//U Innose, co budu dělat? Tohle nikdy sám nezvládnu!
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Odmítl jsem pomoci Igarazovi.");
	AI_StopProcessInfos(self);
};


instance DIA_Igaraz_New_MakeMage(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_New_MakeMage_condition;
	information = DIA_Igaraz_New_MakeMage_info;
	permanent = FALSE;
	description = "Mám tu pro tebe něco, co z tebe udělá mága!";
};

func int DIA_Igaraz_New_MakeMage_condition()
{
	if((MIS_Igaraz_OneMoreChance == LOG_Running) && (IgaranzMakeHappyOk == TRUE) && Npc_HasItems(hero,itar_kdf_m_new))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_New_MakeMage_info()
{
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_01");	//Mám tu pro tebe něco, co z tebe udělá mága!
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_02");	//Tady, vezmi so to srdce.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_03");	//Zbytek se dozvíš od Parlana.
	Snd_Play("LEVELUP");
	B_GiveInvItems(other,self,itar_kdf_m_new,1);
	AI_EquipArmor(NOV_601_Igaraz,itar_kdf_m_new);
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_04");	//Konečně! Tak dlouho jsem čekal na tento okamžik!

	if(IgaranzMakeHappyGold == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_05");	//No, tak co zlato?
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_06");	//Samozřejmě, vybral jsem úplně všechno.
		B_GiveInvItems(self,other,ItMi_Gold,5000);
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_07");	//Hmm... To není špatné.
		MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
		B_LogEntry(TOPIC_IGARANZ_NEW,"Pomohl jsem Igarazovi a dal mi pět tisíc zlatých. To je víc, než slíbil.");
	}
	else if(IgaranzMakeHappyMagic == TRUE)
	{
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_05");	//Tak co odměna?
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_08");	//Mám magickou runu, svitek s receptem nebo magický elixír.
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_09");	//Co si vybereš?
		Info_ClearChoices(DIA_Igaraz_New_MakeMage);
		Info_AddChoice(DIA_Igaraz_New_MakeMage,"Beru runu.",DIA_Igaraz_New_MakeMage_Rune);
		Info_AddChoice(DIA_Igaraz_New_MakeMage,"Beru recept.",DIA_Igaraz_New_MakeMage_Rezept);
		Info_AddChoice(DIA_Igaraz_New_MakeMage,"Beru elixír.",DIA_Igaraz_New_MakeMage_UnknownBook);
	}
	else
	{
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_10");	//Ano, a další. Musím prodat nějaké zboží.
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_11");	//Podívej se, pokud je to zajímavé.
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_12");	//Pokud nechceš zapomenout.
		MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
		B_LogEntry(TOPIC_IGARANZ_NEW,"Pomohl jsem Igarazovi. Za tímto účelem by mi mohl prodat své zboží.");
		IG_TRADE_COND = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Trade");
	};
};

func void DIA_Igaraz_New_MakeMage_Rune()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rune_01_01");	//Beru runu.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_02");	//Tady je ta runa.
	B_GiveInvItems(self,other,ItRu_Sleep,1);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rune_01_03");	//No, díky.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_04");	//Já díky! 
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_05");	//Ale to není vše, mám něco na prodej.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_06");	//Koukni.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rune_01_07");	//Hmm...
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Pomohl jsem Igarazovi, dal mi magickou runu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

func void DIA_Igaraz_New_MakeMage_Rezept()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rezept_01_01");	//Beru recept.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_02");	//Tady je.
	B_GiveInvItems(self,other,ITWR_MAGICDEFENCE_02,1);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rezept_01_03");	//Jsem rád, že jsem mohl pomoct.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_04");	//Děkuji ti!
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_05");	//Ale to není vše, mám něco na prodej. 
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_06");	//Koukni.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rezept_01_07");	//Hmm...
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Pomohl jsem Igarazovi, dal mi nějaký recept.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

func void DIA_Igaraz_New_MakeMage_UnknownBook()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_UnknownBook_01_01");	//Beru elixír.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_UnknownBook_01_02");	//Tady je.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_UnknownBook_01_03");	//To není špatné.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_UnknownBook_01_04");	//Ale to není vše, mám něco na prodej. 
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_UnknownBook_01_05");	//Koukni se.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_UnknownBook_01_06");	//Hmm...
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Pomohl jsem Igarazovi, dal mi elixír many.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

instance DIA_IGARAZ_TRADE(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = dia_igaraz_trade_condition;
	information = dia_igaraz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int dia_igaraz_trade_condition()
{
	if(IG_TRADE_COND == TRUE)
	{
		return TRUE;
	};
};

func void dia_igaraz_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Igaraz_TRADE_01_01");	//Ukaž mi své zboží.

	if(Npc_HasItems(self,ItKe_IgarazChest_Mis) > 0)
	{
		Npc_RemoveInvItems(self,ItKe_IgarazChest_Mis,Npc_HasItems(self,ItKe_IgarazChest_Mis));
	};

	B_GiveTradeInv(self);
};
