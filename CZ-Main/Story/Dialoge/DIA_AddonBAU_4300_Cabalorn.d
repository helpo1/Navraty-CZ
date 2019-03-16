
func int C_BragoBanditsDead()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Vítej v 'Kruhu', příteli.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras mi dal jinej úkol.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "Problémy?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	if(Kapitel < 6)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Problémy?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Zatraceně. Nevěděl jsem, kde se schovávaj. Dostaneš jednoho a za chvíli jsou zpátky.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(uličnicky) Moment. Já tě znám. Ty jsi ten chlápek, který u mě stále žebral v kolonii šípy.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Jmenuješ se Cavalorn, že?",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Nemohu si vzpomenout.",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Nemohu si vzpomenout.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//No tak! Učil jsem tě lukostřelbu a plížení v mé chatrči blízko Starého tábora. Už ti svítá?
	CAVALORNBONUSGOTIKA = TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	if(CAVALORNBONUSGOTIKA == FALSE)
	{
		CAVALORNBONUSGOTIKA = TRUE;
		B_GivePlayerXP(50);
	};
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Jmenuješ se Cavalorn, že?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Á. Vidím, že jsi na mě nezapomněl po tom všem, čím jsme prošli v té zatracené kolonii.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Kam jinak jdeš?
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Nemám žádný určitý cíl.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Zpátky do Hornického údolí.",DIA_Addon_Cavalorn_HALLO_Bauern);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Do města.",DIA_Addon_Cavalorn_HALLO_Stadt);
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do města.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(směje se) To vidím. Do města.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//Můžeš se dostat do problémů s městskou stráží. Nenechají kdekoho projít po tom, co bylo tohle místo zamořeno bandity.

	if(LESTER_TERRAININFO == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Jeden z těch starých Sektářů z Hornického údolí přišel před několika dny. Řekl, že se dostane do Khorinisu a ven kdy chce.
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Vydal se do údolí pod tou velkou věží. Někde tam blízko vodopádu musí být cesta.
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Možná by sis s ním měl promluvit.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Zpátky do Hornického údolí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(překvapeně) Opravdu? Hmm. Rád bych šel s tebou, ale musím tady ještě dodělat pár věcí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Pokud se dostaneš do Hornického údolí, mohl bys zjistit, jestli má chatrč ještě stojí? Rád bych se tam jednoho dne vrátil.
	MIS_Addon_Cavalorn_TheHut = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Lovec Cavalorn mě požádal, abych se v případě, že se dostanu do Hornického údolí, podíval, jestli ještě stojí jeho lovecká chata. Pokud si pamatuji, ležela na západ od bývalého Starého tábora. Zřejmě si tam něco zapomněl.");
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nemám žádný určitý cíl.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nechceš mi to říct, že? Žádný problém.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "Byl jsem v tvé chatrči v Hornickém údolí.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Byl jsem v tvé chatrči v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Takže ještě pořád stojí.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Ano. A také vím, co jsi tam chtěl.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Našel jsi to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Pokud myslíš tvůj měšec s rudou... ano, mám ho.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Ty starej lišáku.

	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//Co jiného bys asi z té staré chatrče chtěl? Nic tam nezbylo.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Máš ho s sebou? Dám ti za něj 100 zlaťáků.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);

	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Jasně.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Ne, ale mám tady tuhle hroudu rudy.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Ne.",DIA_Addon_Cavalorn_Beutel_no);
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Doufám, že ho brzy dostanu zpět.
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Ne, ale mám tady tuhle hroudu rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Taky dobře.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, proč sis to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Jasně.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, proč sis to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Ne.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Tak se vrať pro tu věc ZNOVU. Zatraceně, asi budu muset do toho prokletého údolí SÁM!
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Téměř jsi mě rozbrečel.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Strašné!
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, proč sis to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Tak jako tak, proč sis to nevzal?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kdo si mohl myslet, že ruda je tady v Khorinisu tak cenná?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//V kolonii jsi nedostal za takovouhle hrudku rudy ani místo na spaní.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//A teď ti v přístavu klidně rozbijou hlavu, pokud zjistí, že u sebe nějakou rudu máš.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "Dej mi 100 zlatých, pak ti vrátím rudu.";
};

func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Dej mi 100 zlatých, pak ti vrátím rudu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Ujednáno. Tady máš.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1) == FALSE)
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Jsi opravdový přítel. Děkuji ti.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Uvízl jsem. Kdyby nebylo těch zatracených banditů, asi bych tady už nebyl.
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "Co banditi?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Co banditi?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Zaspal jsi snad celý minulý týden?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ehm...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Mluvím o té havěti z trestanecké kolonie - rozlézají se po krajině, drancují a vraždí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(povzdech) Mám štěstí, že mě nechali naživu. Jednou nedávám pozor a oni mě praští zezadu do hlavy.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nenapadá mě žádný způsob, jak dostat své věci zpět.
	};
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "Ty jsi byl okraden bandity?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Ty jsi byl okraden bandity?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(zachmuřeně) Jo. Srazili mě a nechali jako jídlo pro gobliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Byly tam zatraceně důležité věci. Dopis a všechny moje peníze. Prostě to musím dostat zpět.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nicméně, bez podpory tam nejdu. Ta zbabělá tlupa kriminálníků...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "Můžu ti s bandity pomoci?";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Můžu ti s bandity pomoci?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(uličnicky) Možná. Ale z tvého ztrápeného zjevu hned můžu říct, že jsi nedržel opravdový meč už celé týdny.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Dobrá. Pravděpodobně nemám jinou volbu než přijmout tvoji nabídku. Nemám moc času.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Takže poslouchej. Dole po téhle cestě je jedna z těch špinavých děr, ve kterých se banditi rádi schovávají.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Právě tihle lotři jsou ti, kteří mi ukradli mé věci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Řekni mi, až budeš připraven, a půjdem na tu pakáž.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"Cavalorn byl okraden bandity o velmi důležité věci. Odmítá s nimi ale bojovat sám a tak mě požádal o pomoc.");
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "Potřebuju lepší vybavení.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != 0) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Potřebuju lepší vybavení.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Ty svině mi toho moc nenechali.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Můžu ti dát vlčí nůž. Stačí to?
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Tomuhle říkáš nůž?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//A co takhle nějaké lektvary?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zbyly mi dva léčivé lektvary. Máš zájem?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Jasně. Vezmu si je.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "Pojďme zabít ty flákače.";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	var C_Npc bandit1;
	var C_Npc bandit2;
	var C_Npc bandit3;

	bandit1 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	bandit2 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	bandit3 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Pojďme zabít ty flákače.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobrá. Prostě mi hlídej záda, jasný?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//To mají za to sprosté přepadení.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	CAVALORNGOBANDITS = TRUE;

	if(Bdt_1013_Away == FALSE)
	{
		bandit1.aivar[AIV_EnemyOverride] = FALSE;
		b_changeguild(Bdt_1013_Bandit_L,GIL_BDT);
	};

	bandit2.aivar[AIV_EnemyOverride] = FALSE;
	bandit3.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	var C_Item itm;

	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Konečně můžu svoje poslání dokončit. Stejně jsem už ztratil moc času.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jaké poslání?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(pro sebe) Ach. Ano. Musím se dostat do města a pak...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(povzdech) Jenom nevím, jak to splnit včas.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co já?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(přemýšlí) Hmm. Proč ne. Můžeš doručit do města dopis.
	};

	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//To mi dá trochu času, abych se mohl podívat po svém vybavení.

	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z banditů by měl mít ten dopis v kapse.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Dones ho Vatrasovi, mágovi Vody ve městě. Zastihneš ho v Adanově chrámu, kde celý den káže.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Řekni mu, že jsem to nezvládl včas.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A když se zeptá, kde jsem - řekni mu, že mířím na místo setkání.
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Mága Vody, Vatrase, můžu najít v přístavním městě Khorinis. Káže v Adanově chrámu.");
	};

	itm = Npc_GetEquippedArmor(other);

	if((hero.guild == GIL_NONE) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//A ještě jedna věc: Kup si od farmářů nějaký vhodný oděv.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Jinak si budou myslet, že jsi bandita. Tady máš trochu peněz.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};

	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if(MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
	};

	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};

func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((C_BragoBanditsDead() == TRUE) && (Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Hotovo. Hehe. Neměli si se mnou začínat.
	CavSendVatras = TRUE;
	B_Addon_Cavalorn_VatrasBrief();
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_02");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_02");
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = "Banditi jsou minulostí.";
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if((CavSendVatras == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Banditi jsou minulostí.
	B_Addon_Cavalorn_VatrasBrief();
};

instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "Zajímavá zbroj, co nosíš.";
};

func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Zajímavá zbroj, co nosíš. Už nepatříš ke Stínům?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Stínové? Po pádu bariéry už neexistují.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//V momentě, kdy jsme mohli opustit Hornické údolí, nebyl žádný důvod lpět na starých zásadách.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Teď pracuji pro mágy Vody. Patřím do 'Kruhu Vody'.
	SC_KnowsRanger = TRUE;
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Cavalorn mi řekl o tajné organizaci, do které sám patří. O takzvaném 'Kruhu Vody'.");
	Cavalorn_RangerHint = TRUE;
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = "Řekni mi více o 'Kruhu Vody'.";
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Řekni mi více o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nemám povolení se o tom s tebou bavit.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Všechno, co můžu udělat, je poslat tě za Vatrasem. Je zástupcem mágů Vody v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Bude nejlepší, když si s ním promluvíš. Řekni mu, že jsem tě poslal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Možná, že tě přijme do Kruhu. Zoufale potřebujeme dobré lidi...
	B_LogEntry(TOPIC_Addon_RingOfWater,"Mág Vody, Vatras, mi může říct více o 'Kruhu Vody'.");
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = "Nebyl jsi ty a vaši lidé nepřáteli mágů Vody?";
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Nebyl jsi ty a vaši lidé nepřáteli mágů Vody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Ta hloupá minulost skončila. Už není žádný 'Nový' nebo 'Starý' tábor.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//Teď - protože už není žádná trestanecká kolonie, každý je zodpovědný sám za sebe.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Mnoho z bývalých trestanců je ale pořád ještě stíháno.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Mágové Vody byli schopní pro mě sehnat odpuštění - takže se teď můžu volně pohybovat.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "Co dělají mágové Vody teď?";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co dělají mágové Vody teď?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Jdou po něčem velkém. Něčem ohledně neznámé části ostrova.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Neznámá část? Kde může být?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nemůžu ti říct víc. Promluv si s Vatrasem v Khorinisu.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "Dal jsem Vatrasovi tvůj dopis.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Dal jsem Vatrasovi tvůj dopis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Nic jiného jsem od tebe ani neočekával. Děkuju ti.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "Hledáš něco?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Hledáš něco?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//To je to tak zřejmé? Ano, poslali mě mágové Vody, abych našel ztracený ornament.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//To je náhoda. Dostal jsem ten samý úkol od Nefaria.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Ty tedy patříš do 'Kruhu Vody'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Ano.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Zatím ne, ale pracuji na tom.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To je dobře. Pak to nemusím dělat sám.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Už jsi našel ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Našel jsem místo, kde pravděpodobně jeden najdeme.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Tyhle kamenné kruhy můžou být jedny z těch stavení, které Nefarius popisoval.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Teď potřebujeme jen najít mechanismus.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = "Aktivoval jsem mechanismus, ale nic se nestalo.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Aktivoval jsem mechanismus, ale nic se nestalo.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Potom měli Lobartovi rolníci pravdu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Říkali, že někdo jiný se potloukal okolo těch kamenů.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Najednou se objevil kamenný strážce a zaútočil na ně.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farmáři zavolali domobranu, vojáci domobrany paladiny, kteří přišli a zničili to monstrum.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//Už jsem prohledal celé okolí. Jestli tady ornament byl, mají ho teď paladinové.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Pak se jeden z nás musí dostat do horní čtvrti.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Pak za nimi zajdu a získám ornament.",DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Půjdu teď do města. Setkáme se u Vatrase.
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Jeden ze ztracených ornamentů mají paladinové v horní čtvrti.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");

	if(Kapitel < 3)
	{
		if(!Npc_IsDead(Ambusher_1013))
		{
			B_StartOtherRoutine(Ambusher_1013,"AWAY");
			Wld_InsertNpc(Wolf,"NW_XARDAS_MONSTER_INSERT_01");
		}
		else
		{
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
		};
	};

	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Pak za nimi zajdu a získám ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Skvěle!
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Pak se jeden z nás musí dostat do horní čtvrti.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//Já na to nemám čas. Musíš to udělat ty.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "Získal jsem ornament od paladinů.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Získal jsem ornament od paladinů.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Vidíš? Já věděl, že ho mají paladinové.
	B_GivePlayerXP(XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Jasně, chápu. Už nejsi, cos býval.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Nic si nepamatuješ, že?
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,"Cavalorn souhlasil, že mě bude učit lukostřelbě a boji s jednoručními zbraněmi. Taky mi může pomoci s mou výdrží a vitalitou.");
};


var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "Chci se naučit tvoje schopnosti.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if(Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_TEACH_Choices()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_addon_cavalorn_teach_stamina_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_addon_cavalorn_teach_stamina_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_addon_cavalorn_teach_hp_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_addon_cavalorn_teach_hp_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Cavalorn_Teach_1H_5);
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chci se naučit tvoje schopnosti.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Jasně, co chceš vědět?
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Addon_Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Mnohem lepší. Zapomněl jsi toho hodně, ale dostaneme tě zpět do formy.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};


instance DIA_ADDON_CAVALORN_ESCAPEFROMTOWN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_escapefromtown_condition;
	information = dia_addon_cavalorn_escapefromtown_info;
	permanent = FALSE;
	description = "Rád tě zase vidím, Cavalorne!";
};


func int dia_addon_cavalorn_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_escapefromtown_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_00");	//Rád tě zase vidím, Cavalorne!
	AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_01");	//Vypadá to, že se ti podařilo dostat se z města živý.
	MEETCAVALORNAGAIN = TRUE;
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_02");	//Jak vidíš, tak ano... (usmívá se) A nejen mně!

		if((THORUSHERE == TRUE) && (SCATTYHERE == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_03");	//Pokud máš na mysli Thoruse a Scattyho, tak už jsem je navštívil.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_04");	//V tom případě nemusím zabíhat do detailů. Určitě ti už všechno řekli.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_05");	//Samo sebou.
		}
		else if((THORUSHERE == TRUE) && (SCATTYHERE == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_06");	//Pokud máš na mysli Thoruse, tak už jsem ho navštívil.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_07");	//V tom případě nemusím zabíhat do detailů. Určitě ti už všechno řekl.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_08");	//Samo sebou.
		}
		else if((THORUSHERE == FALSE) && (SCATTYHERE == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_09");	//Pokud máš na mysli Scattyho, tak už jsem ho navštívil.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_10");	//V tom případě nemusím zabíhat do detailů. Určitě ti už všechno řekl.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_11");	//Samo sebou.
		};
	}
	else
	{
		if((THORUSINSERTED == TRUE) && !Npc_IsDead(vlk_6022_thorus))
		{
			THORUSHERE = TRUE;
		};
		if((SCATTYINSERTED == TRUE) && !Npc_IsDead(vlk_6024_scatty))
		{
			SCATTYHERE = TRUE;
		};
		if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_12");	//Jak vidíš, tak ano... (usmívá se) A nejen mě!
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_13");	//O kom to mluvíš?
			if((THORUSHERE == TRUE) && (SCATTYHERE == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_14");	//Byli se mnou ještě Scatty a Thorus! Myslím, že je najdeš v Akilově domě.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_15");	//Takže se vám všem povedlo opustit obležený Khorinis?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_16");	//Jasně! Po všech těch letech v kolonii bych si nedovolil je opustit.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_17");	//Zvykli jsme si v případě nouze držet při sobě a krýt si záda.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_18");	//Chápu.
			}
			else if((THORUSHERE == TRUE) && (SCATTYHERE == FALSE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_19");	//Byl se mnou i Thorus! Myslím, že ho najdeš v Akilově domě.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_20");	//Takže se vám oběma povedlo opustit obležený Khorinis?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_21");	//Jasně! Po všech těch letech v kolonii bych si nedovolil ho opustit.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_22");	//Zvykli jsme si v případě nouze držet při sobě a krýt si záda.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_23");	//Chápu.
			}
			else if((THORUSHERE == FALSE) && (SCATTYHERE == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_24");	//Byl se mnou i Scatty! Myslím, že ho najdeš v Akilově domě.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_25");	//Takže se vám oběma povedlo opustit obležený Khorinis?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_26");	//Jasně! Po všech těch letech v kolonii bych si nedovolil ho opustit.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_27");	//Zvykli jsme si v případě nouze držet při sobě a krýt si záda.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_28");	//Chápu.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_29");	//Jak vidíš, tak ano... (smutně) Všichni ostatní jsou ale mrtví. Skřeti nikoho nešetřili.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_30");	//Možná tam venku někdo přežil, ale upřímně si nemyslím, že takových bude zrovna moc.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_31");	//Doufám, že máš pravdu.
		};
	};
};


instance DIA_ADDON_CAVALORN_WHATNEXT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_whatnext_condition;
	information = dia_addon_cavalorn_whatnext_info;
	permanent = FALSE;
	description = "Co dál?";
};


func int dia_addon_cavalorn_whatnext_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_whatnext_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_00");	//Co dál?

	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_01");	//Eh! To bychom taky rádi věděli.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_02");	//Jedno víme jistě - déle už tady zůstat nemůžeme. Je to příliš nebezpečné.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_03");	//Skřeti na farmu můžou zavítat každou chvíli.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_05");	//Eh! To bych taky rád věděl.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_06");	//Jedno vím jistě - déle už tady zůstat nemůžu. Je to příliš nebezpečné.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_07");	//Skřeti na farmu můžou zavítat každou chvíli.
	};

	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_09");	//Nevšiml jsem si, že by se připravovali zaútočit.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_10");	//A právě to mě děsí! (nervózně) Je zřejmé, že něco plánují. Nebo na něco čekají.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_11");	//A to je ten problém - nevím, co se děje. Ty o tom taky nic nevíš?
	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_12");	//Obávám se, že ne.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_13");	//To jsem si myslel. No nic, škoda.
};


instance DIA_ADDON_CAVALORN_BIGFARMFREE(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_bigfarmfree_condition;
	information = dia_addon_cavalorn_bigfarmfree_info;
	permanent = FALSE;
	description = "Slyšel jsem, že Onarova farma je stále svobodná.";
};


func int dia_addon_cavalorn_bigfarmfree_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_whatnext))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bigfarmfree_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_00");	//Slyšel jsem, že Onarova farma je stále svobodná.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_01");	//No a co?
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_02");	//No, možná byste mohli jít tam.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_03");	//Hmm... (zamyšleně) To není špatný nápad! Jenže jak to udělat?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_04");	//Na všech cestách k farmě hlídkují skřetí patroly.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_05");	//Nemůžeme udělat ani krok, aniž bychom na ně nenarazili.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_06");	//No, možná bys mohl jít tam.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_07");	//Hmm... (zamyšleně) To není špatný nápad! Jenže jak to udělat?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_08");	//Na všech cestách k farmě hlídkují skřetí patroly.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_09");	//Nemůžu udělat ani krok, aniž bych na ně nenarazil.
	};
	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
	Info_AddChoice(dia_addon_cavalorn_bigfarmfree,"Můžu pomoct!",dia_addon_cavalorn_bigfarmfree_go);
	Info_AddChoice(dia_addon_cavalorn_bigfarmfree,"Asi máš pravdu.",dia_addon_cavalorn_bigfarmfree_notgo);
};

func void dia_addon_cavalorn_bigfarmfree_go()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_01");	//Můžu pomoct!
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_02");	//(udiveně) Chceš říct, že nám pomůžeš dostat se přes skřetí hlídky?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_03");	//Proč ne? Znám to tu docela dobře.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_04");	//Jsem si jistý, že se nám povede kolem nich proklouznout bez povšimnutí.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_05");	//Hmm... (zamyšleně) No, když myslíš, že to vyjde, tak to za to riziko možná stojí...
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_06");	//Stejně se o to nakonec jednou budeme muset pokusit. Tak proč ne teď?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_07");	//Takže souhlasíš?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_08");	//Jistě, vždyť sám vidíš. (rozhodně) Tak už neztrácejme čas zbytečným tlacháním!
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_09");	//Řekni, až budeš připraven. Budeme tě následovat. Snad se na nás zase pro jednou usměje štěstí.
		MIS_OLDGUARDGOWAR = LOG_Running;
		Log_CreateTopic(TOPIC_OLDGUARDGOWAR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_Running);
		B_LogEntry(TOPIC_OLDGUARDGOWAR,"Nabídl jsem Cavalornovi a ostatním klukům, že jim pomůžu dostat se na Onarovu farmu přes pozice skřetů. Doufám, že se to povede...");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_11");	//(udiveně) Chceš říct, že mi pomůžeš dostat se přes skřetí hlídky?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_12");	//Proč ne? Znám to tu docela dobře.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_13");	//Jsem si jistý, že se nám povede kolem nich proklouznout bez povšimnutí.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_14");	//Hmm... (zamyšleně) No, když myslíš, že to vyjde, tak to za to riziko možná stojí.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_15");	//Stejně se o to nakonec budu muset pokusit. Tak proč ne teď?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_16");	//Takže souhlasíš?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_17");	//Jistě, vždyť sám vidíš. (rozhodně) Tak už neztrácejme čas zbytečným tlacháním!
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_18");	//Řekni, až budeš připraven. Budu tě následovat. Snad se na nás zase pro jednou usměje štěstí.
		MIS_OLDGUARDGOWAR = LOG_Running;
		Log_CreateTopic(TOPIC_OLDGUARDGOWAR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_Running);
		B_LogEntry(TOPIC_OLDGUARDGOWAR,"Nabídl jsem Cavalornovi, že mu pomůžu dostat se na Onarovu farmu přes pozice skřetů. Doufám, že se to povede...");
	};

	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
};

func void dia_addon_cavalorn_bigfarmfree_notgo()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_00");	//Asi máš pravdu.
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_01");	//Bylo by hloupé spoléhat na to, že si nás skřeti nevšimnou.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_02");	//To by tedy bylo, příteli... (posmutněle) Ale tak to je.
	REFUSEHELPCAVALORN = TRUE;

	if(MIS_DIEGOOLDFRIENS == LOG_Running)
	{
		MIS_DIEGOOLDFRIENS = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_DIEGOOLDFRIENS);
	};

	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWAR(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowar_condition;
	information = dia_addon_cavalorn_oldguardgowar_info;
	permanent = TRUE;
	description = "Za mnou!";
};

func int dia_addon_cavalorn_oldguardgowar_condition()
{
	if(MIS_OLDGUARDGOWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWar_01_00");	//Za mnou!

	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_01");	//V pořádku. Jen nezapomeň na ostatní hochy!
		AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWar_01_02");	//Pamatuju na ně.
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_03");	//Dobrá, tak tedy vpřed!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_04");	//Dobrá... (rozhodně) Vpřed!
	};

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWARDONE(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowardone_condition;
	information = dia_addon_cavalorn_oldguardgowardone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cavalorn_oldguardgowardone_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowardone_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_00");	//Úžasné! Vypadá to, že už jsme na místě.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_01");	//Tak vidíš - jak jsem slíbil.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_02");	//Jsem si jistý, že tady bude bezpečněji než na Akilově farmě.
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_03");	//Díky za pomoc! (vděčně) Bez tebe bych rozhodně tak snadno mezi skřety neprošel.
	MIS_OLDGUARDGOWAR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_OLDGUARDGOWAR,"Zavedl jsem jen Cavalorna na Onarovu farmu. Teď je v bezpečí.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	ORCAKILINSERTED = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWARDONEPOTION(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowardonepotion_condition;
	information = dia_addon_cavalorn_oldguardgowardonepotion_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cavalorn_oldguardgowardonepotion_condition()
{
	if(MIS_OLDGUARDGOWAR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowardonepotion_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_01");	//Ještě počkej! Tady, vem si tenhle elixír jako mé poděkování.
	CreateInvItems(self,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_02");	//Jsem si jistý, že ti pomůže.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_03");	//Dobrá, díky.
	AI_StopProcessInfos(self);
	if(SCATTYINSAFE == TRUE)
	{
		B_StartOtherRoutine(scatty_nw,"FarmRest");
	};
	if(THORUSINSAFE == TRUE)
	{
		B_StartOtherRoutine(thorus_nw,"FarmRest");
	};
};

instance DIA_ADDON_CAVALORN_WHEREPEASANT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_wherepeasant_condition;
	information = dia_addon_cavalorn_wherepeasant_info;
	permanent = FALSE;
	description = "Kam zmizeli rolníci ze dvora?";
};


func int dia_addon_cavalorn_wherepeasant_condition()
{
	if(Npc_KnowsInfo(other,dia_thorus_nw_escapefromtown) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WherePeasant_01_00");	//Kam zmizeli rolníci ze dvora?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WherePeasant_01_01");	//Nemám zdání... (pokrčí rameny) Asi se někde rozutekli.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WherePeasant_01_02");	//Je to tady vlastně příliš nebezpečné. Tahle farma je příliš významná, než aby ji skřeti nechali být.
	KNOWWHEREAKIL = TRUE;
};

