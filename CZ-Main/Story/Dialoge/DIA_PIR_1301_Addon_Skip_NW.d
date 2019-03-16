
instance DIA_Addon_Skip_NW_EXIT(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 999;
	condition = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToSkipNW = TRUE;
};

instance DIA_Addon_Skip_NW_PICKPOCKET(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 900;
	condition = DIA_Addon_Skip_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Skip_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
};

instance DIA_Addon_Skip_NW_Hallo(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_NW_Hallo_Condition;
	information = DIA_Addon_Skip_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_NW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//(podrážděně) Tady jsi, konečně. Čekal jsem tu hodiny.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//(zmateně) Počkat. Ty nakonec nejsi obchodník z města, že?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//(kysele) Kde je Baltram?
	SkipMeet = TRUE;
};


instance DIA_Addon_Skip_NW_WerBistDu(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_WerBistDu_Condition;
	information = DIA_Addon_Skip_NW_WerBistDu_Info;
	description = "Kdo jsi?";
};


func int DIA_Addon_Skip_NW_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Nevím, co ti je do toho. Ale... pokud to chceš opravdu vědět, moje jméno je Skip (hrdě). Zazvonil nějaký zvonec?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//(jako kdyby nepochopil) Kdo?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Neříkej mi, že jsi neslyšel jméno Skip. Bože, odkud vlastně jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Jsem jeden z nejhledanějších kriminálníků v Khorinisu. Já a mí hoši jsme se plavili těmito vodami okolo tohoto ostrůvku po mnoho let.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//(pobouřeně) Už jsi o tom musel slyšet.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ty jsi pirát?",DIA_Addon_Skip_NW_WerBistDu_pirat);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Měl bych tě znát?",DIA_Addon_Skip_NW_WerBistDu_keineAhnung);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ano, jasně. Už si vzpomínám...",DIA_Addon_Skip_NW_WerBistDu_ja);
};

func void DIA_Addon_Skip_NW_WerBistDu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//Ano, jasně. Už si vzpomínám...
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//(užasle) Čestně? Ty už jsi o mě slyšel?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Och, do prdele! Uvažoval jsem, jestli se nemám potloukat okolo města.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Pak je štěstí, že jsem to neudělal.

	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Domobrana by mě rychle někam zamkla.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Ty jsi mě nepřišel uvěznit, že?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Nooooo...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//Věř mi, to není moudré. Kdokoli, kdo si začne se starým Skipem skončí jako krmivo pro ryby.
	};
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//Měl bych tě znát?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Dej bacha na to, co říkáš chlapče, nebo poznáš nepřátelskou stranu starého Skipa.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ty jsi pirát?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//(rozlobeně) Ano, zatraceně. Je to tak. Hledaný ale slavný.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Můžu kousat do fošen jenom z nudy.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};


instance DIA_Addon_Skip_NW_Baltram(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Baltram_Condition;
	information = DIA_Addon_Skip_NW_Baltram_Info;
	description = "Baltram? Čekáš na obchodníka?";
};


func int DIA_Addon_Skip_NW_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Baltram_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Baltram? Čekáš na obchodníka?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Ty jsi mi ale chytrý, že?

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};

	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//To jsem řekl, nebo ne?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Vypadá to, že tenhle špatný podomní obchodník na mě zapomněl.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Rád bych na něj položil své ruce, to ti řeknu.
	Log_CreateTopic(TOPIC_Addon_BaltramSkipTrade,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade,LOG_Running);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Pirát Skip mi řekl, že obchodník Baltram z města dělá obchody s piráty.");
	SCKnowsBaltramAsPirateTrader = TRUE;
};

instance DIA_Addon_Skip_BaltramPaket(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_BaltramPaket_Condition;
	information = DIA_Addon_Skip_BaltramPaket_Info;
	description = "Mám pro tebe balík od Baltrama.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition()
{
	if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_BaltramPaket_Info()
{
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//Mám pro tebe balík od Baltrama.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Co? Teď posílá poslíčka?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Zděsil se, že? Hehe, jo, co jiného jsem taky mohl čekat od všivého obchodníka?
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	Npc_RemoveInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//Říkal, že za to chce 3 láhve rumu.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(směje se) To by se mu líbilo, huh? Nechal mě tu čekat navždy, nepřišel k člověku, kterému na tom záleželo.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Tady, dej mu 2 láhve. Ta nula teď bude šťastná.
	CreateInvItems(self,ItFo_Addon_Rum,2);
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_NW_Woher(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Woher_Condition;
	information = DIA_Addon_Skip_NW_Woher_Info;
	description = "Odkud jsi přišel?";
};

func int DIA_Addon_Skip_NW_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Woher_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Chceš vědět, kde máme skrýš?

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Proč bych to měl říkat chlapovi z domobrany jen tak?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//Když ti to řeknu, bude to jako, kdybych se šel do Khorinisu dobrovolně vzdát.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//To ti nepomůže, pokud jsi pomýšlel o našem narušení.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Ostrov Khorinis je velký a to, kde jsme my, je pro ostatní nepřístupné tak jako tak. Jestliže nemáš loď.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Ani pak, musíš znát cestu skrz útesy. Nikdo se přes ně nedostal, pokud neznali tajnou cestu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Jsou jen dva lidé, kteří znají cestu a ty nejsi jeden z nich.
};


instance DIA_Addon_Skip_SCSawGreg(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_SCSawGreg_Condition;
	information = DIA_Addon_Skip_SCSawGreg_Info;
	description = "Znáš někoho se záplatou na oku?";
};


func int DIA_Addon_Skip_SCSawGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (SC_KnowsConnectionSkipGreg == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_SCSawGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Znáš někoho se záplatou na oku?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Znám mnoho mužů se záplatou na oku.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//Tady je někdo, kdo se potuluje po Khorinisu, a vypadá to, že tě dobře zná.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Nedovedu si to představit. Lidé, které znám nejsou farmáři.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Ale...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Nech to bejt, opravdu mě to nezajímá.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Skip_NW_MissingPeople(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_MissingPeople_Condition;
	information = DIA_Addon_Skip_NW_MissingPeople_Info;
	description = "Spousta lidí z města zmizela. A spouta lidí říká, že ty v tom máš taky prsty.";
};


func int DIA_Addon_Skip_NW_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Spousta lidí z města zmizela. A spouta lidí říká, že ty v tom máš taky prsty.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//(cítí se bezradný) Er... zatraceně. Ale není to tak, jak si myslíš.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Vypadám jako otrokář? Ne, já převážím věci. Co je to za věci, nebo odkud jsou, není moje věc.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Převážíme všechny možné věci pro ty prasata.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Na začátku to bylo jenom obyčejné zboží. Jasně, bylo to pašované zboží.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Poté ale začali unášet lidi z města. Nevím, co od nich chtěli.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//Prostě jsme je přeplavili.
};


instance DIA_Addon_Skip_NW_Dexter(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Dexter_Condition;
	information = DIA_Addon_Skip_NW_Dexter_Info;
	description = "O kom mluvíš?";
};


func int DIA_Addon_Skip_NW_Dexter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Dexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//O kom mluvíš?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//O banditech chlape. Kdo jiný? Ta spodina, která se teď rozlézá po celé zemi.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//A není to jen okolo Khorinisu.
};

func void B_Skip_SaysDextersName()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//Vzpomněl jsem si na jeho jméno. Dexter. Ano, myslím, že jeho jméno je Dexter.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Zmizelí lidé byli uneseni bandity na příkaz vůdce banditů Dextera. Říká se, že se skrývá někde na západě od Onarovy farmy.");
	SC_KnowsDexterAsKidnapper = TRUE;
	Ranger_SCKnowsDexter = TRUE;
};


instance DIA_Addon_Skip_NW_Name(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Name_Condition;
	information = DIA_Addon_Skip_NW_Name_Info;
	description = "Banditi! To nestačí. Chci jména...";
};


func int DIA_Addon_Skip_NW_Name_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Dexter) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Name_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Banditi! To nestačí. Chci jména...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Jména? Chceš vědět, kdo je vůdcem banditů? Zatraceně, jak se to psisko vlastně jmenovalo...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Hmm. Nemůžu si vzpomenout na jméno toho chlapa. I když myslím, že to bylo lehké na zapamatování.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Ale můžu ti ukázat, kde najít velitele banditů v této části ostrova.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//Máš s sebou dobrou mapu?

	if(Npc_HasItems(other,itwr_map_newworld_1) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon_1) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis_1) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis_1) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Tady, mám mapu.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//Už to bylo označeno. Je to sranda ti ničit mapu.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Ne.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//Tak ti to mám tedy popsat?
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Daleko na východě je rozlehlá farma. Myslím, že farmář se jmenuje Onar.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Má tam pěkně velká pole. Na západě od těch polí je malá pevnost na vršku vysokého útesu.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//A tam je tvůj muž.
		B_Skip_SaysDextersName();
	};
};


instance DIA_Addon_Skip_NW_Landkarte(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Landkarte_Condition;
	information = DIA_Addon_Skip_NW_Landkarte_Info;
	description = "Tady, mám mapu.";
};


func int DIA_Addon_Skip_NW_Landkarte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Name) && Npc_HasItems(other,itwr_map_newworld_1) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Landkarte_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Tady, mám mapu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//To je dobře. Vyznačím ti, kde asi ten chlap pobývá.
	B_GiveInvItems(other,self,itwr_map_newworld_1,1);
	B_Skip_SaysDextersName();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Tady. Tvoje mapa.
	Npc_RemoveInvItems(self,itwr_map_newworld_1,1);
	CreateInvItems(self,itwr_map_newworld_dexter_1,1);
	B_GiveInvItems(self,other,itwr_map_newworld_dexter_1,1);
};


instance DIA_Addon_Skip_NW_Wohin(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 99;
	condition = DIA_Addon_Skip_NW_Wohin_Condition;
	information = DIA_Addon_Skip_NW_Wohin_Info;
	permanent = FALSE;
	description = "Kam jsi odvezl lidi?";
};


func int DIA_Addon_Skip_NW_Wohin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Wohin_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Kam jsi odvezl lidi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//Už jsem ti řekl, že ti neřeknu, kde máme přístav.
};

instance DIA_Addon_Skip_NW_Sable(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Sable_Condition;
	information = DIA_Addon_Skip_NW_Sable_Info;
	description = "Vypadáš ponuře, kámo.";
};


func int DIA_Addon_Skip_NW_Sable_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Sable_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_00");	//Vypadáš ponuře.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_01");	//Ech... Je tu něco, kámo.
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_02");	//Copak, nejaké problémy?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_03");	//Ale... to všechno má zbraň.
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_04");	//Co je s ní?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_05");	//Však posuď sám. Vypadá snad tenhle rezavý kus oceli jako zbraň?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_06");	//Hmmm... Myslím, že s tebou souhlasím.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_07");	//No, tak vidíš.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_08");	//Jak už to chodí, při posledním boji jsem přišel o svou starou pirátskou šavli. 
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_09");	//Abych se vyzbrojil, popadl jsem první co bylo pod rukou.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_10");	//Až pak jsem si všim, že je to jen rezavý kus kovu!
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_11");	//Po pravdě řečeno, nevím, jak s tím zacházet.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_12");	//Jsem toho názoru, že se při prvním úderu zlomí jako stožár lodi!
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_13");	//A proč si nenajdeš jinou zbraň?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_14");	//Predstava to samozřejmě hezká... (směje se) Jen se mi moc nechce k obchodníkům do města!
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_15");	//Pořádné zbraňe jen tak na cestě neleží. Zvlášť pirátské meče!
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_16");	//No jo, to může být opravdu problém.
	MIS_Skip_NW_Sable = LOG_Running;
	Log_CreateTopic(TOPIC_Skip_NW_Sable,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_Running);
	B_LogEntry(TOPIC_Skip_NW_Sable,"Skip potřebuje dobrou zbraň. Věřím, že nová pirátská šavle by mu vyhovovala perfektně.");
};


instance DIA_Addon_Skip_NW_Sable_Done(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Sable_Done_Condition;
	information = DIA_Addon_Skip_NW_Sable_Done_Info;
	description = "Mám pro tebe meč.";
};

func int DIA_Addon_Skip_NW_Sable_Done_Condition()
{
	if((MIS_Skip_NW_Sable == LOG_Running) && (Npc_HasItems(other,ItMw_Piratensaebel) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Sable_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_Done_01_00");	//Mám pro tebe meč.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_01");	//Děláš si srandu?
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_Done_01_02");	//Ne, doopravdy. Tady, vem si svou novou přítelkyni.
	B_GiveInvItems(other,self,ItMw_Piratensaebel,1);
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_03");	//No, díky, kamaráde. To je jiná věc! Skutečná zbraň pro skutečného piráta.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_05");	//Za takový velkorysý dar, ani nejdražšího není škoda.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_06");	//Tak si vezmi tuto láhev rumu.
	B_GiveInvItems(self,other,ItFo_Addon_Rum_Skip,1);
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_07");	//Takovou nikde nenajdeš! Věř mi.
	MIS_Skip_NW_Sable = LOG_Success;
	Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_Success);
	B_LogEntry(TOPIC_Skip_NW_Sable,"Skip byl šťastný, že získal novou pirátskou šavli.");
	AI_StopProcessInfos(self);
	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Addon_Skip_About_Drink(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_Condition;
	information = DIA_Addon_Skip_About_Drink_Info;
	permanent = FALSE;
	description = "Máš ještě chlast?";
};

func int DIA_Addon_Skip_About_Drink_Condition()
{
	if(Skip_Rum4Baltram == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_About_Drink_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_01");	//Máš ještě chlast?
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_02");	//O co přesně máš zájem? Grog, rum nebo něco silnějšího?
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_03");	//Radši něco silnějšího.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_04");	//Hmmm... (zamyšleně) Zůstala mi tu poslední láhev vskutku nevšedního nápoje.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_05");	//Říká se mu 'Rychlý sleď'! Dělá ho jeden můj starý přítel.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_06");	//Jistě mi ale rozumíš, že se ním nechci rozloučit jen tak.
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_07");	//A kolik chceš?
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_08");	//V tomto případě mě zlato příliš nezajímá...
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_09");	//Tak co chceš?
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_10");	//Hmmm... (zamyšleně) Chci děvku! Skutečnou děvku z přístavu, hrome!
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_11");	//Byl jsem příliš dlouho na moři, a teď to je přesně to, co potřebuji.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_12");	//Do bordelu ale sám nemůžu jít. Domobrana mě sebere hned jak skočím na první suku.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_13");	//Co kdybys ji přivedl sem? Pak dostaneš svůj chlast.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_14");	//Dumluv se s ní, že tu zůstane minimálně tři dny.
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_15");	//Dobře! Pokusím se to zařídit.
	MIS_WomanForSkip = LOG_Running;
	Log_CreateTopic(TOPIC_WomanForSkip,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_Running);
	B_LogEntry(TOPIC_WomanForSkip,"Skipovi zůstala jedna láhev mimořádně dobré kořalky. Dá mi ji, když mu přivedu děvku z přístavního bordelu.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_About_Drink_Done(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_Done_Condition;
	information = DIA_Addon_Skip_About_Drink_Done_Info;
	permanent = FALSE;
	description = "Přivedl jsem ti Sonju.";
};

func int DIA_Addon_Skip_About_Drink_Done_Condition()
{
	var int daynow;
	var C_Npc Sonja;

	daynow = Wld_GetDay();
	Sonja = Hlp_GetNpc(VLK_436_Sonja);

	if((MIS_WomanForSkip == LOG_Running) && (Npc_GetDistToWP(VLK_436_Sonja,"NW_CITY_PIRATESCAMP_04") <= 1000) && (Sonja.aivar[AIV_PARTYMEMBER] == TRUE) && (SonyaGoWithMe == TRUE) && (SonyaJob == FALSE) && (SonyaJobDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_About_Drink_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_Done_01_00");	//Přivedl jsem ti Sonju.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_Done_01_01");	//Hmmm... (uznale) A udělá to? No, víš co myslím...
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_Done_01_02");	//Nemám tušení.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_Done_01_03");	//Hmmm... No dobře! Tady, vezmi si tu kořalku.
	B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering_Ext,1);
	SkipGetWoman = TRUE;
	B_LogEntry(TOPIC_WomanForSkip,"Přivedl jsem Sonju a Skip mi dal láhev kořalky jak slíbil. Za tři dny se musím vrátit a přivést Sonju zpátky k Bromorovi. Jako by se nic nestalo...");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_About_Drink_None(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_None_Condition;
	information = DIA_Addon_Skip_About_Drink_None_Info;
	permanent = FALSE;
	description = "Obávám se, že z toho nic nebude.";
};

func int DIA_Addon_Skip_About_Drink_None_Condition()
{
	if(MIS_WomanForSkip == LOG_Running) 
	{
		if(SonyaNoGoWithMe == TRUE)
		{
			return TRUE;
		}
		else if((Npc_IsDead(VLK_436_Sonja) == TRUE) && (SonyaGoWithMe == TRUE))
		{
			return TRUE;
		};
	};

	return FALSE;
};

func void DIA_Addon_Skip_About_Drink_None_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_None_01_00");	//Obávám se, že z toho nic nebude.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_None_01_01");	//Zatraceně! Pak můžeš taky zapomenout na tu kořalku.
	MIS_WomanForSkip = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_WomanForSkip);
	AI_StopProcessInfos(self);
};