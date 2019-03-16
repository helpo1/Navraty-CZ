var int GregCanPray;
var int FindPirate_01;
var int FindPirate_02;

instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	if((GregCanPray == TRUE) && (MIS_PiratePray == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_00");	//Počjek chvilku, mám ještě jednu otázku.
		AI_Output(other,self,"DIA_Addon_Greg_Pray_01_01");	//Jakou?
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_02");	//(Povzdechne si) Víš, nikdy jsem nebyl věřící.
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_03");	//Ale ten případ s prstenem mě donutil přemýšlet.
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_04");	//Takže. Mohl bys jít do kláštera a požádat někoho, aby se za mě a ostatní pomodlil?
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_05");	//Věř mi, dobře se ti odvděčím.
		AI_Output(other,self,"DIA_Addon_Greg_Pray_01_06");	//To nebude snadné, ale pokusím se.
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_07");	//Dobrá. (povzdechne si) Doufám, že uspěješ.
		MIS_PiratePray = LOG_Running;
		Log_CreateTopic(TOPIC_PiratePray,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_PiratePray,LOG_Running);
		B_LogEntry(TOPIC_PiratePray,"Greg mě požádal, ať jdu do kláštera a požádám někoho, ať se pomodlí za duši jeho a jeho bandy. Zdá se, že ten případ s prstenem na něj silně zapůsobil.");
	};

	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(hrozivě) Hej, ty! Co děláš v mé chatrči?!
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Já...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(rozčíleně) Jsem pryč sotva pár dní a lidi si už myslí, že si můžou dělat, co chtějí.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Co se to tu zatraceně děje?!
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Palisáda ještě není hotová, kaňon je plnej bestií, ale tady všichni sedí na prdeli a chlastaj.
	GregIsBack = TRUE;
	if(!Npc_IsDead(Francis))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(křičí) To je vše cos dokázal, Francisi?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(křičí) Zmiz z mé lavice!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A co ty? Co tys udělal?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"Nic moc.",DIA_Addon_Greg_ImNew_nich);
	if((Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0)) || (C_TowerBanditsDead() == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"Dřel jsem jak kůň.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//A nemysli si, že jsem na tebe zapomněl.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Ty věci, který jsem schoval v Khorinisu stojí několik stovek zlaťáků.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ty ses prostě napakoval a šel jsi dál co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Tady si to hezky všechno odpracuješ.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Ukážu ti, co to znamená pracovat.
	};
	if(!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Nic moc.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//To jsem si myslel. Najdu pro tebe nějakou práci, příteli.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Dřel jsem jak kůň.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Vážně? Co například jsi udělal?
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Vyhnal jsem bandity z věže.
	};
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Vyčistil jsem severní pláž od potvor.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Aspoň něco.
	B_UseRakeBilanz();
};

instance DIA_Addon_Greg_SmokePipe(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = DIA_Addon_Greg_SmokePipe_Condition;
	information = DIA_Addon_Greg_SmokePipe_Info;
	permanent = FALSE;
	description = "Vidím, že kouříš dýmku.";
};

func int DIA_Addon_Greg_SmokePipe_Condition()
{
	if((GregHasPipe == TRUE) && (MIS_JackSmokePipe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_SmokePipe_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_00");	//Vidím, že kouříš dýmku.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_01");	//(zasměje se) Dobrej postřeh.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_02");	//A proč se na to ptáš?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_03");	//Potřeboval bych taky takovou.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_04");	//Potřebuješ dýmku? A kčemu by ti tak asi byla?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_05");	//Nechci ji pro sebe, ale pro jednoho starého mořského vlka, jako jsi ty.
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_06");	//Jeho dýmka se rozbila a nemůže sehnat novou.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_07");	//Hmmmm. (zamyšleně) A jak se jmenuje ten námořník?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_08");	//Jack. Nyní je strážce majáku v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_09");	//Starej Jack? (překvapeně) Na něj si vzpomínám, kdysi jsme se spolu plavili.
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_10");	//On byl taky pirát?
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_11");	//To teda byl. (sarkasticky) A co se pamatuju, tak brilantní!
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_12");	//To, že teď nemá žádnou dýmku není moc v pořádku.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_13");	//Na tu svojí jsem si už zvyknul, jako by to byla součást mě samotného!
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_14");	//Tak jak on na svoji, myslím.
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_15");	//A co stím teď uděláme?
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_16");	//Tvoje štěstí je, že to není moje jediná dýmka.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_17");	//Dám ti ji za předpokladu, že je skutečně pro Jacka.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_18");	//A jestli se dozvím, že jsi ji dal někomu jinému, zaživa tě stáhnu z kůže, rozumíš?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_19");	//Samo sebou.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_20");	//Dobře. Tady ji máš. A pozdravuj ode mě Jacka!
	B_GiveInvItems(self,other,ItMi_Smoke_Pipe,1);
	B_LogEntry(TOPIC_JackSmokePipe,"Greg mě dal dýmku pro Jacka.");
	FindPirate_02 = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_DiscoverLH(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_DiscoverLH_Condition;
	information = DIA_Addon_Greg_DiscoverLH_Info;
	description = "Slyšel jsi někdy o pirátovi jménem Kelevra?";
};

func int DIA_Addon_Greg_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (CanGoGreg == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_DiscoverLH_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Greg_DiscoverLH_01_00");	//Slyšel jsi někdy o pirátovi jménem Kelevra?
	AI_Output(self,other,"DIA_Addon_Greg_DiscoverLH_01_01");	//Kdyby jen to. Plavili jsme se spolu.
	AI_Output(other,self,"DIA_Addon_Greg_DiscoverLH_01_02");	//Víš, kde je teď?
	AI_Output(self,other,"DIA_Addon_Greg_DiscoverLH_01_03");	//Nemám tušení. Neviděl ho už deset let.
	B_LogEntry(TOPIC_HauntedLighthouse,"Greg se kdysi plavil s pirátem jménem Kelevra, ale už ho dlouho neviděl, takže netuší, kde je.");
	FindPirate_01 = TRUE;
};

instance DIA_Addon_Greg_GotPirate(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_GotPirate_Condition;
	information = DIA_Addon_Greg_GotPirate_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Greg_GotPirate_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindPirate_01 == TRUE) && (FindPirate_02 == TRUE) && (JackMainIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_GotPirate_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_GotPirate_01_00");	//Hej! Ty ses mě ptal na piráta jménem Kelevra?
	AI_Output(self,other,"DIA_Addon_Greg_GotPirate_01_02");	//Takže... Pokud si vzpomeneš komu jsi donesl mou starou dýmku, najdeš odpověď.
	GotPirate = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"To je ale zvrat! Vypadá to, že ten pirát, který zabil správce prokletého majáku nebyl nikdo jiný než sám Jack. Budu si s ním muset promluvit z očí do očí...");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "Co bych měl udělat?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co bych měl udělat?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Prvně musíme všechny donutit makat.
	if(Npc_IsDead(Morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//To líný prase Morgan bude řezat fošny.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//TY převezmeš morganovu práci a vyčistíš kaňon od těch zatracených potvor.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg po mně chce abych převzal Morganovu práci - Mám vyčistit kaňon od potvor.");
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"V tom případě musím jít.",DIA_Addon_Greg_JoinPirates_Leave);
	if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates,"To je mám pozabíjet sám?",DIA_Addon_Greg_JoinPirates_Compadres);
	};
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Jaké potvory?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//Ok.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Jo ještě jedna věc. Teď jsi jedním z nás.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Takže prvně si vem nějaký pořádný hadry na lov.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Tady je jedna z našich zbrojí. Doufám, že je to tvoje velikost.
	CreateInvItems(self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_L_Addon,1);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//A neflákej se!
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//To je mám pozabíjet sám?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Klidně si na to vem pár chlapů, jestli chceš.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Aspoň si pro změnu svůj plat jednou zaslouží.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg řekl, že si mám vzít na pomoc pár chlapů.");
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Jaké potvory?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//Břitvy v kaňonu jsou každým dnem blíž k našemu táboru.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nechci, aby sežrali jednoho z mých chlapů, jen protože se ožere a nedokáže se ubránit.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Máme zabít jen břitvy.");
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "Ohledně práci v kaňonu...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//Ohledně práci v kaňonu...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Co s tím?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,Dialog_Back,DIA_Addon_Greg_AboutCanyon_Back);
		if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Kdo mi s tím má pomoct?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Jaké potvory mám zabít?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Břitvy to mají za sebou.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Kdo mi s tím má pomoct?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Vem prostě nějaký chlapy z tábora.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Stejně tady nic nedělaj.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Jaké potvory mám zabít?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Postarej se o břitvy! Ostatní havěť je neškodná.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Břitvy to mají za sebou.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Dobře, aspoň někdo není úplný budižkničemu.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg mě dokonce pochválil za zabití těch břitev v kaňonu.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "Potřebuji zbroj banditů.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Potřebuji zbroj banditů.

	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Prvně si ho musíš zasloužit.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Nejprve zabij břitvy v kaňonu.
		};
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Greg po mně chce, abych mu pomohl dostat tábor na nohy. Poté si můžeme promluvit o zbroji.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Jseš fakt dobrej!
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Původně měl Bones dostat tu zbroj a jít k nim špehovat.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale ty na tuhle prácičku budeš asi lepší.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Možná že tam i přežiješ.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Jdi za Bonesem a řekni mu, ať ti dá tu zbroj. Potom si ji nasaď a jdi do tábora banditů.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Musím zjistit proč ti bastardi přišli do našeho údolí.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Ano kapitáne.
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Teď, když jsem skoncoval s břitvami, Bones mi dá zbroj banditů.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_ScoutBandits,"Mám pro Grega zjistit, proč banditi přišli do údolí.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "Je tu pro mě ještě něco na práci?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if((MIS_Greg_ScoutBandits != 0) && ((C_TowerBanditsDead() == FALSE) || ((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Je tu pro mě ještě něco na práci?
	if((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Pláž na severu je pořád zamořená různými bestiemi.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Vypadá to, že Morgan neudělal absolutně nic.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Greg po mně chce, abych se postaral o bestie na severní pláži.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//Věž na jižním útesu je stále obsazena bandity.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Francis se o ně měl postarat. Lenoch jeden.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Greg chce, abych zabil bandity ve věži na jih od tábora.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Jestli chceš, můžeš se o to postarat.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "Severní pláž opět bezpečná.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//Severní pláž opět bezpečná.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Výborně. Tady je tvá odměna.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Informoval jsem Grega o vyčištění severní pláže.");
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "Banditi z věže jsou pod drnem.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Banditi z věže jsou pod drnem.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Skvěle! Tady je tvůj plat.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_BanditsTower,"Banditi z věže jsou mrtví. Greg byl velice nadšen.");
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "Banditi našli zlatý důl.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Banditi našli zlatý důl.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Já to věděl! To proto se sem připlazili.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikdo by dobrovolně nežil v takové díře.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobrá práce. Tady, něco pro tebe mám.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits,"Řekl jsem Gregovi o zlatém dolu banditů.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Jsem Greg. Vůdce téhle bandy tupců.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Stačí?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "Jak ses sem vlastně dostal?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak ses sem vlastně dostal?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Nečekals mě tu, co?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Jenom si to vyjasníme. Já jsem Greg a tohle je můj tábor.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Šťastnej?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "Je tu ještě jedna věc, kterou bych chtěl vědět.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if(((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) == TRUE) || (Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou) == TRUE)) && (MIS_Greg_ScoutBandits != 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Je tu ještě jedna věc, kterou bych chtěl vědět.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co zas?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"Jak ses sem dostal?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"Kde máš loď?",DIA_Addon_Greg_Story_Ship);

	if(RavenAway == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"Co víš o Ravenovi?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak ses sem dostal?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Našel jsem tunel nedaleko starobylé pyramidy. Hlídali to tam nějací mágové.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Prostě jsem se jim proplížil pod ksichtem.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Prvně jsem si myslel, že jde o ňejakou pohřební síň, a že se pěkně napakuju.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Představ si jak jsem se tvářil, když jsem zjistil, že jsem zpět v mém milovaném údolí.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//Zrovna v tu chvíli, když jsem si myslel, že budu muset zdrhat domobráncům po zbytek svého života.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Kde máš loď?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Tomu neuvěříš. Měsíce vidu ani slechu po nějaké lodi od Khorinisu až po pevninu.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Měsíce! A první loď, která se objeví, je králova válečná galéra.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Plná paladinů, od podpalubí až po špičku stožáru.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//Tomu říkám smůla.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//Klidně to řekni znova. Okamžitě nás potopili. Jsem jedinej kdo se dostal na břeh.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Býval rudnej baron, aspoň co já vím. Velký eso v kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Neměl jsem ponětí, proč došel sem a proč ho lidi následovali.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale určitě má něco zalubem. Není to ten typ, kterej by se schovával v močálu jen tak.
};

instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "Raven patří minulosti...";
};

func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Raven patří minulosti...
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//To jsem teda nečekal. Načapals ho se staženýma kalhotama, co?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Za to ti dám aspoň 500 zlatejch.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Máš pro strach uděláno. Takových už je málo.
};

var int greg_cantradearmor;
var int greg_tradearmor_middle;
var int greg_tradearmor_heavy;

instance DIA_ADDON_GREG_CANTRADEARMOR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 8;
	condition = dia_addon_greg_cantradearmor_condition;
	information = dia_addon_greg_cantradearmor_info;
	permanent = TRUE;
	description = "Co třeba nějakou lepší zbroj?";
};


func int dia_addon_greg_cantradearmor_condition()
{
	if((GREG_CANTRADEARMOR == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_greg_cantradearmor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_CanTradeArmor_01_00");	//Co třeba nějakou lepší zbroj?
	AI_Output(self,other,"DIA_Addon_Greg_CanTradeArmor_01_01");	//(podrážděně) Co se ti jako nelíbí na té co máš?
	AI_Output(other,self,"DIA_Addon_Greg_CanTradeArmor_01_02");	//Tyhle hadry nejsou zrovna dvakrát odolný. Břitvy v kaňonu je pěkně poničily. Hodilo by se mi něco, co mě vážně ochrání.
	AI_Output(self,other,"DIA_Addon_Greg_CanTradeArmor_01_03");	//No dobře! Ty jseš teda výmluvnej, jen co je pravda. Navíc jsi prokázal, že narozdíl od těch flákačů tady, jsi užitečnej.
	AI_Output(self,other,"DIA_Addon_Greg_CanTradeArmor_01_04");	//Ale nemysli si, že ti ji jen tak dám!
	GREG_CANTRADEARMOR = TRUE;
};


instance DIA_ADDON_GREG_ARMOR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_armor_condition;
	information = dia_addon_greg_armor_info;
	permanent = TRUE;
	description = "Potřebuji pořádnou zbroj.";
};


func int dia_addon_greg_armor_condition()
{
	if((GREG_CANTRADEARMOR == TRUE) && ((GREG_TRADEARMOR_MIDDLE == FALSE) || (GREG_TRADEARMOR_HEAVY == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_armor_info()
{
	Info_ClearChoices(dia_addon_greg_armor);
	AI_Output(other,self,"DIA_Addon_Greg_Armor_01_00");	//Potřebuji pořádnou zbroj.
	Info_AddChoice(dia_addon_greg_armor,Dialog_Back,dia_addon_greg_armor_back);
	if(GREG_TRADEARMOR_MIDDLE == FALSE)
	{
		Info_AddChoice(dia_addon_greg_armor,"Zbroj piráta (cena: 2000 zlatých)",dia_addon_greg_armor_buy1);
	};
	if((RavenAway == TRUE) && (GREG_TRADEARMOR_HEAVY == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(dia_addon_greg_armor,"Těžká zbroj piráta (cena: 2500 zlatých)",dia_addon_greg_armor_buy2);
	};
};

func void dia_addon_greg_armor_back()
{
	Info_ClearChoices(dia_addon_greg_armor);
};

func void dia_addon_greg_armor_buy1()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_M_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy1_01_01");	//Skvěle!
		B_GiveInvItems(self,other,ITAR_PIR_M_Addon,1);
		GREG_TRADEARMOR_MIDDLE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy1_01_02");	//Bez peněz ke Gregovi nelez.
	};
	Info_ClearChoices(dia_addon_greg_armor);
};

func void dia_addon_greg_armor_buy2()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_H_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy2_01_01");	//Skvěle!
		B_GiveInvItems(self,other,ITAR_PIR_H_Addon,1);
		GREG_TRADEARMOR_HEAVY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy2_01_02");	//Bez peněz ke Gregovi nelez.
	};
	Info_ClearChoices(dia_addon_greg_armor);
};


instance DIA_ADDON_GREG_MISSGRHUSB(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_missgrhusb_condition;
	information = dia_addon_greg_missgrhusb_info;
	permanent = FALSE;
	description = "Znaš chlápka jménem Brendik?";
};


func int dia_addon_greg_missgrhusb_condition()
{
	if(MIS_FINDLOSTHUSB == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_missgrhusb_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Greg_MissGrHusb_01_00");	//Znaš chlápka jménem Brendik?
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_01");	//Brendik?! No sakra, že znám... zoufalý případ, ale pořádný rváč.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_03");	//Všichni jsou tu takoví.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_04");	//Teď ale není v táboře - před pár týdny odešel do močálu.
	AI_Output(other,self,"DIA_Addon_Greg_MissGrHusb_01_05");	//Aha. A jak se k vám vůbec dostal?
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_08");	//Před pár lety jsme se nalodili na jednu obchodní loď.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_09");	//No a potom co jsme je vyrabovali, jsme se rozhodli, že už odplujeme - najednou se ale nějakej chlápek od nich zeptal, jestli nemůže s náma.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_13");	//A tou dobou nás bylo málo a navíc znáš mou posádku. Všichni do jednoho to jsou líný prasata, takže se mi hodila každá pomocná ruka.
	AI_Output(other,self,"DIA_Addon_Greg_MissGrHusb_01_20");	//Co dělá v močálu?
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_21");	//Poslal jsem ho tam... a od té doby, co jsme ztratili loď se od nás nějak odvrátil.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_22");	//Tak jsem ho aspoň pověřil dohlížením na bandity.
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Měl jsem pravdu - Brendik se opravdu stal pirátem! Pověděl mi o tom Greg. Nicméně Brendik v táboře nebyl - prý ho poslal, aby dohlížel na bandity. Takže se tam po něm budu muset podívat.");
	Wld_InsertNpc(pir_6145_brendik,"ADW_BRENDIK_01");
};


instance DIA_ADDON_GREG_MISSGRHUSBAFTER(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_missgrhusbafter_condition;
	information = dia_addon_greg_missgrhusbafter_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_missgrhusbafter_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_greg_missgrhusb) && (MEETBRENDIK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_missgrhusbafter_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusbAfter_01_00");	//Jo málem bych zapomněl! Jestli potkáš Brendika, tak mu řekni, aby se už vrátil do tábora.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusbAfter_01_01");	//(mrzutě) Mám tady pro něj jednu prácičku.
	MEETBRENDIKGREG = TRUE;
};


instance DIA_ADDON_GREG_GATHERARMY(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmy_condition;
	information = dia_addon_greg_gatherarmy_info;
	permanent = FALSE;
	description = "Mám nabídku...";
};


func int dia_addon_greg_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmy_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_02");	//Paladinové chtějí osvobodit ostrov od skřetů. Hodila by jim tvá pomoc.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_03");	//(nevěřícně) Cože? Ty si ze mě děláš šoufky, že jo?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_07");	//Proč bych jim měl pomáhat?!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_08");	//Protože dříve či později se skřeti dostanou i sem. Na to jsi nepomysle, co?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_09");	//(škodolibě se usmívá) Ha! Pokud vím, tak jsou odsud na míle daleko.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_10");	//Asi ne tak daleko, když obsadili Khorinis. A tam zdaleka nekončí.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_13");	//(zamyšleně) Hmm... to není dobré.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_14");	//Sakra, kdybychom měli furt loď, tak už jsme dávno pryč.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_18");	//K věci! Pomůžeš jim teda?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_19");	//Pomůžu. (zamyšleně) Hmm... Ale nevím, co na to budou říkat chlapi.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_21");	//Nemůžu chlapy jen tak nutit do téměř sebevražedné mise, jen protože paladinové potřebujou pomoc.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_22");	//Takže by nám měli dát něco na oplátku.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_23");	//Co bys od nich chtěl?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_24");	//Dobrá otázka. (hluboce se zamyslí) Například jejich loď!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_25");	//Jejich loď?!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_29");	//Nemyslím si, že paladinové budou zrovna štěstím bez sebe, když jim řeknu, že chceš za pomoc jejich loď.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_30");	//V tom případě na nás nemusí čekat, protože jim na pomoc nepřijdeme.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_31");	//To je náš požadavek - něco s tím prostě udělej.
	MIS_PIRATENEEDSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_PIRATENEEDSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_Running);
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Greg chce novou loď. Takže pokud chtějí paladinové pomoc od pirátů, budou muset dát Gregovi a jeho pirátům svou galéru. Měl bych to asi jít říct Hagenovi...");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Rozhodl jsem se, že promluvím s piráty o pomoci paladinům. Uvidím co na to řeknou.");
};


var int gregtellstocrew;

instance DIA_ADDON_GREG_GATHERARMYDONE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmydone_condition;
	information = dia_addon_greg_gatherarmydone_info;
	permanent = FALSE;
	description = "Mám pro tebe odpověď od paladinů.";
};


func int dia_addon_greg_gatherarmydone_condition()
{
	if((MIS_PIRATENEEDSHIP == LOG_Running) && (HAGENINVITEPIRATES == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmydone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_01_00");	//Mám pro tebe odpověď od paladinů.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_01");	//Vážně? A co říkali?
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_01_02");	//Lord Hagen souhlasí, že vám dá loď, pokud se stanete paladiny.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_03");	//(zaskočen) Cože? Stát se paladiny?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_04");	//Vždyť jsme piráti! A to ho napadlo něco takového?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_06");	//Co to je za kravinu, abychom vstoupili do služeb paladinů?!
	Info_ClearChoices(dia_addon_greg_gatherarmydone);

	if(RhetorikSkillValue[1] >= 80)
	{
		Info_AddChoice(dia_addon_greg_gatherarmydone,"Tak co?",dia_addon_greg_gatherarmydone_tell);
	};

	Info_AddChoice(dia_addon_greg_gatherarmydone,"Když to říkáš.",dia_addon_greg_gatherarmydone_no);
};

func void dia_addon_greg_gatherarmydone_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_No_01_00");	//Když to říkáš.
	MIS_PIRATENEEDSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
	PIR_JOINHAGENREFUSE = TRUE;
	ALLFRACTIONS = ALLFRACTIONS - 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
	};
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Greg odmítl nabídli lorda Hagena a nepodařilo se mi ho přesvědčit k pomoci paladinům. Zdá se, že s nimi tedy nemůžeme počítat.");
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_gatherarmydone_tell()
{
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_00");	//Tak co?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_01");	//(udiveně) Jedině idiot by za takových podmínek souhlasil.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_04");	//Dostaneš loď a budeš moct potápět nepřátelské lodě!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_06");	//A všechny dřívější prohřešky budou tobě i celé posádce prominuty.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_07");	//Nebo chceš snad, aby tě pověsili?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_16");	//(pochmurně) No dobře. Přesvědčil jsi mě. Ale to ještě nic neznamená!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_17");	//Prvně se musím poradit s posádkou a až potom se rozhodne.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_18");	//Kdy budu znát odpověď?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_19");	//Zítra.
	GREGFLAGCONTI = TRUE;
	GREGTELLSTOCREW = Wld_GetDay();
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Podařilo se mi přesvědčit Grega k přistoupení na Hagenovy podmínky. Teď jen musím počkat 1 den, aby se poradil se zbytkem posádky.");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_GATHERARMYDONEEXTR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmydoneextr_condition;
	information = dia_addon_greg_gatherarmydoneextr_info;
	permanent = FALSE;
	description = "Tak co, jak jste se rozhodli?";
};


func int dia_addon_greg_gatherarmydoneextr_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_PIRATENEEDSHIP == LOG_Running) && (GREGFLAGCONTI == TRUE) && (GREGTELLSTOCREW < daynow))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmydoneextr_info()
{
	var int countpir;
	var int overallpir;
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDoneExtr_01_00");	//Tak co, jak jste se rozhodli?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_01");	//No... (zamyšleně) Mluvil jsem s chlapy a...
	countpir = 15;
	overallpir = 50;

	if(MIS_AlligatorJack_BringMeat == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Addon_Bill_SearchAngusMurder == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_ADDON_GARett_BringKompass == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Owen_FindMalcom == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(RavenAway == TRUE)
	{
		countpir = countpir + 5;
	};
	if(countpir >= overallpir)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_02");	//... A rozhodli jsme se, že paladinům teda pomůžem.
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_04");	//(zívá) Doufám, že toho nebudeme litovat.
		PIR_JOINHAGEN = TRUE;
		MIS_PIRATENEEDSHIP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
		B_LogEntry(TOPIC_PIRATENEEDSHIP,"Greg a jeho lidé přijali nabídku lorda Hagena.");
		B_LogEntry_Quiet(TOPIC_ORсGREATWAR,"Greg a jeho posádka přijali nabídku lorda Hagena. Piráti se postaví na stranu paladinů.");
	}
	else
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_06");	//... A rozhodli jsme se, že paladinům nepomůžeme.
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_07");	//To není nic pro nás. Radši budeme doufat, že nějak přežijeme, než že budeme bojovat pro ty zabedněnce.
		MIS_PIRATENEEDSHIP = LOG_SUCCESS;
		PIR_JOINHAGENREFUSE = TRUE;
		ALLFRACTIONS = ALLFRACTIONS - 1;
		Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
		if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
		{
			PREGATHERALLONBIGFARM = TRUE;
		};
		B_LogEntry(TOPIC_PIRATENEEDSHIP,"Greg a jeho posádka odmítli nabídku lorda Hagena. Piráti se tedy nepostaví na stranu paladinů.");
		B_LogEntry_Quiet(TOPIC_ORсGREATWAR,"Lord Hagen by neměl počítat s pomocí pirátů.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_ADDON_GREG_DOOMRING(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_DOOMRING_condition;
	information = dia_addon_greg_DOOMRING_info;
	permanent = FALSE;
	description = "Mám ještě jednu otázku.";
};

func int dia_addon_greg_DOOMRING_condition()
{
	if(MIS_PirateRing == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_DOOMRING_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_00");	//Mám ještě jednu otázku.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_01");	//Tak ven s tím, nezdržuj se!
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_02");	//Slyšel jsem, že máš u sebe jeden velmi zajímavý prsten.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_03");	//Možné to je. A co má jako být?
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_04");	//Jeden mocný mág má o něj zájem a požádal mě, abych se s tebou dohodl na ceně.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_06");	//Mág říkáš? (zamyšleně) Ten by mi mohl pomoct.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_07");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_08");	//Moc rád bych ti ten prsten dal, ale nejde to!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_09");	//Vypadá to, že je v tom prstenu nějaké mocné prokletí.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_10");	//Obávám se, že kdybych ti ho dal, nedopadne to se mnou dobře.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_11");	//Jak se to stalo?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_12");	//To bylo tak...(drbe se na hlavě)
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_13");	//Jednou jsme vydrancovali velký obchodní konvoj někde u města Bakaresh.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_14");	//Bakaresh?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_15");	//Je to jedno z hlavních měst asasínů, nachází se ve východní části Varantu.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_16");	//Mimo jiné kořisti mě hlavně upoutal jeden prsten. Nebyl nijak krásný, ale něco mě k němu přitahovalo.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_17");	//Bez přemýšlení jsem si ho vzal.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_18");	//Zpočátku se nám dařilo, líp to ani nešlo.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_19");	//Naše nájezdy na karavany a lodě byly velmi úspěšné, vždycky jsme se vrátili s bohatou kořistí.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_20");	//Ale pak jsem se rozhodl skrýt většinu pokladů.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_21");	//Šli jsme do jeskyně jihovýchodně odsud.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_22");	//Zakopali jsme zlato a chystali se jít zpěto do tábora, ale pak se začali dít podivbné věci.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_23");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_24");	//Drake a pár dalších chlapů úplně zešílel.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_25");	//Vrhli se na mě, jako by je posedl sám Beliar.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_26");	//Jenom mně se povedlo dostat z jeskyně naživu.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_27");	//O několik dní později jsem poslal další chlapy, aby jeskyni prozkoumali, ale už se nevrátili.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_28");	//Potom jsem si uvědomil, že to zlato už nikdy neuvidím. V té jeskyni se usadilo zlo.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_29");	//Není to pěkný příběh.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_30");	//Ale to ještě není všechno, můj příteli... (smutně) Tohle byla ještě procházka růžovým sadem v porovnání s tím, co nás čekalo dál.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_32");	//Budeš se smát, ale zdá se mi, že se od nás od té doby odvrátilo štěstí.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_33");	//Všechny naše další nájezdy skončili zklamáním.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_34");	//Každý obchodník jako kdyby plul bez nákladu...(vrtí hlavou)
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_35");	//... hodnota zboží byla taková, že to ani nestačilo na pokrytí nákladů.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_36");	//A poslední kapka byla, jak jsme přišel o svoji loď, když jsme na otevřeném moři narazily na paladinskou galéru! Beliar aby je spral...
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_37");	//(Nervózně) Ale nejhorší věc, kterí se děje, je to, že v noci ve snech se mě zjevují duchové těch, kteří zůstali v jeskyni.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_38");	//Tyhle noční můry má už dlouho a jsou každou noc horší.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_39");	//Pak mi došlo, že je to všechno kvůli tomu prstenu.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_40");	//Snažil jsem se ho zbavit, ale nešlo to!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_41");	//Jakmile jsem se ho pokusil sundat, zkroutil jsem se v příšerných bolestech.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_42");	//... Tak jsem to nechal být, abych měl klid.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_43");	//Takže poraď, jak se ho zbavit?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_44");	//Co kdyby se tvůj přítel mág, trošku nezamysle a nepřišel na to, jak země sejmout tohle prokletí...
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_45");	//Dal bych mu ten prsten zadarmo! Požádáš ho?
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_46");	//Dobře, pokusím se ho na to zeptat.
	B_LogEntry(TOPIC_PirateRing,"Nebylo to tak jednoduché jak se zdálo. Prsten, který hledal Xardas je zřejmě prokletý, podle tvrzení jeho posledního majitele - kapitána Grega, je očarován temnou magií! Síla té kledby zabila několik jeho lidí a přinesla jemu a jeho posádce smůlu. Mimoto nemůže ten prsten sundat aniž by nezemřel. Musím o tom promluvit s Xardasem.");
	GregCurse = TRUE;
};

instance DIA_ADDON_GREG_DRAKE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_DRAKE_condition;
	information = dia_addon_greg_DRAKE_info;
	permanent = FALSE;
	description = "A kdo je Drake?";
};

func int dia_addon_greg_DRAKE_condition()
{
	if((MIS_PirateRing == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Greg_DOOMRING)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_DRAKE_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Greg_DRAKE_01_01");	//A kdo je ten Drake?
	AI_Output(self,other,"DIA_Addon_Greg_DRAKE_01_02");	//Jeden z kapitánů, který plul pod mým vedením. Byli jsme dobří přátelé.
	AI_Output(other,self,"DIA_Addon_Greg_DRAKE_01_03");	//Řekni mi o něm něco.
	AI_Output(self,other,"DIA_Addon_Greg_DRAKE_01_04");	//Co můžu říct? Byl to velmi spolehlivý člověk, svěšřil bych mu vlastní život.
	AI_Output(self,other,"DIA_Addon_Greg_DRAKE_01_05");	//Jednou mě dokonce zachránil život... A to je něco!
	B_LogEntry(TOPIC_PirateRing,"V noci když Greg usne, zjevují se mu duchové těch které zahubila kletba prstenu. Mezi těmi duchy je i jeden Gregův starý přítel kapitán Drake. Právě díky němu se začly dít podivné věci.");
};

instance DIA_ADDON_GREG_NOMORECURSE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_NOMORECURSE_condition;
	information = dia_addon_greg_NOMORECURSE_info;
	permanent = FALSE;
	description = "Zkus si sundat ten prsten.";
};

func int dia_addon_greg_NOMORECURSE_condition()
{
	if((MIS_PirateRing == LOG_Running) && (XarCurseClear == TRUE) && (Npc_IsDead(Skeleton_Capitan_Drake) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_NOMORECURSE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_01");	//Zkus si sundat ten prsten.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_02");	//Co?! To neudělám!
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_03");	//Hned ho sundej! Teda pokud se chceš zbavit svého prokletí.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_04");	//Hele kámo...(výhružně). Jestli se pleteš, tak nebudeš mít ode mě klid v tomnto životě.
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_05");	//Sundej ho.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_06");	//(Sundává prsten)
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_07");	//No, jak se cítíš?
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_08");	//(Překvapeně) Zdá se, že máš pravdu. Prsten už není prokletý.
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_09");	//Vidíš, obavy byly zbytečné.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_10");	//Chtěl bych vidět tebe na mém místě.
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_11");	//No dobře, dej mi ten prsten.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_12");	//Tady, odnes tu zatracenou věc. Už ji nechci ani vidět!
	B_GiveInvItems(self,other,ItRi_DarkCurse,1);
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_13");	//Díky.
	GregCanPray = TRUE;
	B_LogEntry(TOPIC_PirateRing,"Přesně, jak mi řekl Xardas, prokletí zesláblo a Greg, i když s mou pomocí, byl schopen prsten sundat. Teď ho ještě odnesu Xardsovi.");
};

instance DIA_ADDON_GREG_PiratePray_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_PiratePray_Done_condition;
	information = dia_addon_greg_PiratePray_Done_info;
	permanent = FALSE;
	description = "Pokud jde o tvou žádost o modlitby...";
};

func int dia_addon_greg_PiratePray_Done_condition()
{
	if((MIS_PiratePray == LOG_Success) || (PyrNotAgreePray == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PiratePray_Done_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_00");	//Pokud jde o tvou žádost o modlitby...
	AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_01");	//Podařilo se ti dohodnout s mágy?

	if(MIS_PiratePray == LOG_Success)
	{
		AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_02");	//Ano, budou se modlit za tebe a tvou posádku.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_03");	//(Radostně) Výborně, chlape. Myslím, že tohle kluky trochu rozveselí.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_04");	//Pravděpodobně z tebe vytáhli soustu zlata, že?
		AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_05");	//Nemůžu říct, že to bylo zrovna levné.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_06");	//(zasměje se) Co od nich taky čekat. Vidím, že jsi lepší, než ti zazobanci.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_07");	//Vezmi si tohle jako odměnu.

		if(GregBonusPray == 1)
		{
			B_GivePlayerXP(100);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		}
		else if(GregBonusPray == 2)
		{
			B_GivePlayerXP(200);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ITMI_QUICKSILVER,1);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		}
		else if(GregBonusPray == 3)
		{
			B_GivePlayerXP(300);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ITMI_QUICKSILVER,1);
			CreateInvItems(other,ItFo_Addon_SchnellerHering,3);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		};

		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_08");	//Bohužel to není zlato, ale i tak budeš spokojený.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_09");	//Jsem si jistý, že tyhle předměty využiješ.
	}
	else
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_11");	//Bohužel ne.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_12");	//K čertu s nimi! No dobrá. Ale Innos je mi svědkem, skutečně jsem chtěl změnit svůj život.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_13");	//Vidíš - není to osud! Takže, budu i nadále špatný člověk.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_14");	//Loupit, zabíjet, potápět lodě... to není život, ale pohádka. (směje se)
		MIS_PiratePray = LOG_Success;
		Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	};
};

var int PirateDealDay;
var int PirateDealFlag;
var int PirateDealCost;

instance DIA_ADDON_GREG_PirateDeal(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_condition;
	information = dia_addon_greg_PirateDeal_info;
	permanent = FALSE;
	description = "Ještě něco bych pro tebe měl...";
};

func int dia_addon_greg_PirateDeal_condition()
{
	if(MIS_PirateDeal == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_00");	//Ještě něco bych pro tebe měl...
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_01");	//Hmm... Tak ven s tím.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_02");	//Přinesl jsem návrh na dohodu s mágy Vody.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_03");	//?ágové vody?!
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_04");	//Je třeba jim poskytnout veškeré zásoby. Potraviny a zbraně.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_05");	//A já myslím, že jste toho schopní, nemám pravdu?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_06");	//Zajímalo by mě, proč najednou uzavírají dohody s takovou spodinou, jako jsme my.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_07");	//V této části ostrova jste jen vy a banditi.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_08");	//A ti by o nějaké dohodě jen těžko chtěli mluvit, takže zbýváte jen vy.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_09");	//To dává smysl. Dobře, dobře, můžu o tom uvažovat.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_10");	//Co z téhle dohody získáme?
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_11");	//To mi řekni ty. Za jakých podmínek bys souhlasil s poskytováním všeho potřebného mágům?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_12");	//Hmmm...(zamyšleně) Musím si to promyslet.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_13");	//Jak dlouho to bude trvat?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_14");	//Vrať se zítra, musím to probrat se zbytkem bandy. Pak se uvidí.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_15");	//Dobrá.
	PirateDealDay = Wld_GetDay();
	PirateDealFlag = TRUE;
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Greg si musí nabídku od mágů Vody rozmyslet. Mám se za ním stavit zítra.");
};

instance DIA_ADDON_GREG_PirateDeal_Choice(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_Choice_condition;
	information = dia_addon_greg_PirateDeal_Choice_info;
	permanent = FALSE;
	description = "Tak jak ses rozhodl?";
};

func int dia_addon_greg_PirateDeal_Choice_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((MIS_PirateDeal == LOG_Running) && (PirateDealFlag == TRUE) && (PirateDealDay <= (Daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_Choice_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_01_00");	//Tak jak ses rozhodl?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_01_01");	//Tak jsme nad tím s klukama přemýšleli a rozhodli jsem se, že nám nejdřív musíte zaplatit...
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_01_02");	//... řekněme pět tisíc zlatých. Teprve potom budeme připraveni zásobovat mágy Vody.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_01_03");	//Pět tisíc? Zblaznil ses?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_01_04");	//To jsou naše podmínky. V opačném případě není o čem mluvit.
	PirateDealCost = 5000;
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);

	if(RhetorikSkillValue[1] >= 45)
	{
		Info_AddChoice(DIA_Addon_Greg_PirateDeal_Choice,"Možná bys mohl slevit na polovinu?",DIA_Addon_Greg_PirateDeal_Choice_Cheap);
	};

	Info_AddChoice(DIA_Addon_Greg_PirateDeal_Choice,"Možná, se můžem dohodnout?",DIA_Addon_Greg_PirateDeal_Choice_Yes);
};

func void DIA_Addon_Greg_PirateDeal_Choice_Cheap()
{
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_00");	//Možná bys mohl slevit na polovinu? Kdo ví, jak to bude pokračovat.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_02");	//No dobře! Můžeš teď zaplatit jen část.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_03");	//Ale nemysli si, že na ten zbytek zapomenu.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	PirateDealCost = 2500;
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Greg předložil své požadavky. Chce 5000 zlatých! Pak bude obchodovat s mágy Vody. Chamtivý bastard. Ale dohodnul jsem se, že dostane polovinu hned a zbytek později.");
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);
};

func void DIA_Addon_Greg_PirateDeal_Choice_Yes()
{
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_Yes_01_00");	//Možná, se můžem dohodnout?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Yes_01_01");	//Ne, vyjednávání není na místě.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Yes_01_02");	//Nakul pět tisíc, nebo běž za Beliarem!
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Greg předložil své požadavky. Chce 5000 zlatých! Pak bude obchodovat s mágy Vody. Chamtivý bastard...");
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);
};

instance DIA_ADDON_GREG_PirateDeal_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_Done_condition;
	information = dia_addon_greg_PirateDeal_Done_info;
	permanent = TRUE;
	description = "Tady máš peníze.";
};

func int dia_addon_greg_PirateDeal_Done_condition()
{
	if((MIS_PirateDeal == LOG_Running) && (PirateDealCost > 0) && (PirateDealOk == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_Done_info()
{
	var int Xp_Temp;

	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Done_01_00");	//Tady máš peníze.

	if(Npc_HasItems(hero,ItMi_Gold) >= PirateDealCost)
	{
		Xp_Temp = 100 -(PirateDealCost / 100);
		Xp_Temp = Xp_Temp * 10;
		B_GivePlayerXP(Xp_Temp);
		B_GiveInvItems(other,self,ItMi_Gold,PirateDealCost);
		Npc_RemoveInvItems(self,ItMi_Gold,PirateDealCost);
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_01");	//(Dychtivě) Výborně, můžeš vzkázat svým čarodějům, že jsme uzavřeli dohodu a poskytneme jim vše potřebné.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_02");	//Nyní musíme jen dojednat jaké zásoby máme poslat.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_03");	//Ať sem pošlou jednoho z jejich lidí. Necítil bych se u nich dobře.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_04");	//S ním to všechno vyřeším.
		PirateDealOk = TRUE;
		B_LogEntry(TOPIC_PirateDeal,"Sjednal jsem dohodu s piráty ohledně zásobování.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_06");	//Vážně? A kde? Nějak nevidím tu částku, na které jsme se dohodli.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_08");	//Nedělej si ze mě blázny!
	};
};

instance DIA_Addon_Greg_FoundTreasure(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_FoundTreasure_Condition;
	information = DIA_Addon_Greg_FoundTreasure_Info;
	permanent = TRUE;
	description = "Našel jsem ty věci, cos zakopal.";
};

func int DIA_Addon_Greg_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Našel jsem ty věci, cos zakopal.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Pak bys měl mít asi sto zlaťáků, zlatý pohár, stříbrný kalich a amulet. Dej to sem!
	Info_ClearChoices(DIA_Addon_Greg_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_FoundTreasure,"Nemám je u sebe.",DIA_Addon_Greg_FoundTreasure_not);

	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_CupGold) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_FoundTreasure,"Tady to máš.",DIA_Addon_Greg_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Tady to máš.

	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Měšec se sto zlatými.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//Sto zlatých.
	};
	if(B_GiveInvItems(other,self,ItMi_CupGold,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Zlatý pohár.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Stříbrný kalich.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//A amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Velmi dobře. Máš štěstí, že nejsi tak blbej, abys s tím utekl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Tady je tvůj podíl.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nemám je u sebe.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Tak pro to dojdi, než se naštvu.
	AI_StopProcessInfos(self);
};

//------------------------Drakiya-----------------------------------------------------

var int GregCanTalkAboutElsa;

instance DIA_Addon_Greg_TalkAboutElza(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Info;
	permanent = TRUE;
	description = "Kde prodáváš svoje zboží?";
};

func int DIA_Addon_Greg_TalkAboutElza_Condition()
{
	if((GregIsBack == TRUE) && (GregCanTalkAboutElsa == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_00");	//Kde prodáváš svoje zboží?

	if(RavenAway == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_01");	//To tě nemusí zajímat!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_02");	//Hmmm... Proč tě to zajímá?
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_03");	//Jen jsem přemýšlel, kam vlastně jdeš.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_04");	//Koneckonců, než Vám paladinové potopili loď, nakradli jste hodnotné věci.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_05");	//Jo, v logice jsi nepřekonatelný, kamaráde.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_06");	//Přirozeně, že naše řemeslo by nemělo cenu ani zlámané grešle, kdybychom nedokázali dostat dobrou cenu za naše zboží.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_07");	//Část zboží jsme vzali do Khorinis pro ty obchodníky, kteří se nestydí jednat s námi. A věř mi, není jich málo.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_08");	//Bohužel je to teď složitý. Kvůli těm zatraceným paladinům, co nedávno přijeli do města.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_09");	//A co zbytek? 
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_10");	//Zbytek dovezeme obchodníkům na Drakiu! Za veškeré zboží nám s radostí zaplatí velmi hodně.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_11");	//A to vše bez rizika! Místní baron se řídí královskými dekrety. Naštěstí jen na oko.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_12");	//Je to stejnej zloděj, jako my.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_13");	//Drakiu?! Co je to za město?
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_14");	//Chceš říst, že jsi o něm ještě neslyšel?!
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_15");	//Ne, neslyšel. Ale rád si o něm poslechnu.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_16");	//Drakia je západní provincie ostrova Khorinis a město se jmenuje stejně jako ostrov. Pravda, není tak velké jako Khorinis.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_17");	//Pokud vím, všemu tam velí baron Lockhart.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_18");	//Tak jako tak je Drakia je součást Myrtany, ale ve skutečnosti je ovládána pouze baronem. Celé to tam vlastní.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_19");	//Je mu jedno jestli jsi pirát nebo ne. Hlavní je mít v kapse zlato.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_20");	//Hmmm... to není špatný.
		GregCanTalkAboutElsa = TRUE;
	};
};

instance DIA_Addon_Greg_TalkAboutElza_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Done_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Done_Info;
	permanent = FALSE;
	description = "A jak se tam dostanu?";
};

func int DIA_Addon_Greg_TalkAboutElza_Done_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE) && (GregCanTalkAboutElsa == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_00");	//A jak se tam dostanu?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Done_01_01");	//Jenom po moři. Je nutné plavat po severním obvodu celého ostrova.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_02");	//Proč?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Done_01_03");	//Na jihu je příliš mnoho skal, které trčí z vodní hladiny. Bez pořádného lodníka tam neprojedeš.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_04");	//Jistě nějakýho znáš.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Done_01_05");	//Jistě, znám, ale jeho loď tady není! A s malou lodí se tam stejně nedostaneš.
};

instance DIA_Addon_Greg_TalkAboutElza_Ship(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Ship_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Ship_Info;
	permanent = FALSE;
	description = "Nedaleko odtud jsem viděl jednu loď.";
};

func int DIA_Addon_Greg_TalkAboutElza_Ship_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Greg_TalkAboutElza_Done) == TRUE) && (ViewElza == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Ship_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_00");	//Nedaleko odtud jsem viděl jednu loď.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_01");	//Cože?! Nedělej si ze mě srandu... 
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_02");	//Myslím to vážně! Je za těma skalama, nedaleko tvého tábora.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_03");	//Áááá... (šklebí se) Myslím že vím o čem mluvíš. Myslíš 'Jednookou Elsu'. 
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_04");	//'Jednookou Elsu'?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_05");	//Ano, naší starou galeonu. Je to dlouho, co jsme se na ní plavili.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_06");	//A proč? Co je s ní?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_07");	//Je v pořádku. Pokud nepočítáš ulomené kormidlo a díru v levém boku. Zázrak, že je ještě na vodě. 
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_08");	//Nedá se opravit?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_09");	//Už jsme to zkoušeli, ale nevyšlo to. Potřebovali bychom dobrého tesaře, ale takové štěstí nemáme.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_10");	//Lepší bude když se na to zeptáš Skipa. Ten se zabýval opravou lodě.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_11");	//Ten chlap si skoro sedřel kůži, aby mohla Elza znovu plout. Nakonec se na to taky vykašlal.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_12");	//Svoje nejlepší léta má již za sebou...
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_13");	//To je smutný co?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_14");	//Vypadá to, že mu ta stará loď přirostla k srdci.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_15");	//Na to se musíš zeptat jeho.
	MIS_OldElza = LOG_Running;
	Log_CreateTopic(TOPIC_OldElza,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OldElza,LOG_Running);
	B_LogEntry(TOPIC_OldElza,"Zeptal jsem se Grega na tu loď v zálivu. Zasmál se a řekl mi, že je to 'Jednooká Elsa', na které se dlouho, co se na ní plavili. Loď je poškozená a pirátům se jí nepodařilo opravit. Jednomu z pirátů na té lodi záleží víc než je zdrávo.");
};

instance DIA_Addon_Greg_OldRumors(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_OldRumors_Condition;
	information = DIA_Addon_Greg_OldRumors_Info;
	permanent = FALSE;
	description = "Potkal jsem Lou.";
};

func int DIA_Addon_Greg_OldRumors_Condition()
{
	if(MIS_OldRumors == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_OldRumors_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_00");	//Potkal jsem Lou.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_01");	//Jakou Lou...(podrážděně)
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_02");	//No, holka. Co přišla s prosbou jestli jí vezmem na Drakiu!
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_03");	//S prosbou?! Baliáre vem si jí! Znám ji. Je jako vzteklá vlčice a vloupala se mi do domu!
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_04");	//Začala na mě ječet, že když jí nevezmu na loď tak mi udělá ze života peklo.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_05");	//Chápu, že ta ženská to nemá lehký. Skoro jako Abigail.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_06");	//Vyhrožovala mi, mě Gregovi, pirátskému kapitánovi, v mém domě! To je na mě moc kamaráde.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_07");	//Vyhodil jsem jí ven se slovy, že ženská na lodi je jeden velkej malér.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_08");	//Musíš pochopit, že je pro mě velmi důležité, aby Elsa dorazila na břehy Drakii v pořádku a jednom kuse.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_09");	//A tenhle malej ďábel s těma manýrama by na palubě dělal jenom zle.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_10");	//Klid, klid... Uklidni se! Možná jenom přehání. Asi jako ty.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_11");	//Můžu se za ní zaručit.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_12");	//Už ani slovo! Podle toho, co jsem viděl je prostě hloupost jí věřit.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_13");	//Prostě se musí dostat na Drakiu! V opačném případě vyhodí tábor do vzduchu.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_14");	//Hmmm... Dobře. Zaplať mi půlku toho co stojí moje zboží a plácnem si.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_15");	//Jinak se její nohy nedotknou paluby Elsy.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_16");	//O jaké sumě se bavíme?
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_17");	//Podle mých výpočtů, cesta na Drakiu stojí nějakých 20 000 zlatých.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_18");	//Takže chceš alespoň 10 000 zlatých. Není to trochu moc za takovou službu?
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_19");	//Pochop, musím ochránit svoje zboží. Ať se ti to líbí nebo ne tohle je náš byznys.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_20");	//Dobře, popřemýšlím o tvé nabídce.
	B_LogEntry(TOPIC_OldRumors,"Greg je připraven vzít na loď Lou za předpokladu, že mu zaplatím polovinu hodnoty jeho zboží.");
};

instance DIA_Addon_Greg_OldRumors_Agreed(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_OldRumors_Agreed_Condition;
	information = DIA_Addon_Greg_OldRumors_Agreed_Info;
	permanent = FALSE;
	description = "Tady máš to zlato.";
};

func int DIA_Addon_Greg_OldRumors_Agreed_Condition()
{
	if((MIS_OldRumors == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Greg_OldRumors) == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_OldRumors_Agreed_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_00");	//Tady máš to zlato.
	B_GiveInvItems(other,self,ItMi_Gold,10000);
	Npc_RemoveInvItems(self,ItMi_Gold,10000);
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_Agreed_01_01");	//Je příjemné s tebou obchodovat.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_Agreed_01_02");	//Každopádně, teď můžeš říct své kamarádce, že ji dovozeme na Drakiu.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_03");	//Zkus nedodržet slovo.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_Agreed_01_04");	//Neboj se! Já své slovo dodržím.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_05");	//To doufám.
	MIS_OldRumors = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OldRumors,LOG_SUCCESS);
	B_LogEntry(TOPIC_OldRumors,"Dal jsem Gregovi peníze. Teď může Loa na palubu Elsy.");
};