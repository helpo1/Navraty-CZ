
instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = "Čekal jsi něco takového?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Čekal jsi něco takového?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Ne. Jsem ohromený, jak velké muselo být toto město.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Většina budov je pohřbená pod kamením a zemí, ale ruiny, které přežily dlouhé věky, jsou roztroušené po celé krajině.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//Žilo tady tisíce lidí.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "Co už jste tu objevili?";
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//Co už jste tu objevili?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na východě leží velká pevnost v bažině.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Domníváme se, že se zde utábořili banditi.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Kdybych byl na tvém místě, nechodil bych tam. Je tam mnoho stráží.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Vyhýbej se tomu místu, dokud nebudeš mít více zkušeností... nebo si najdi bezpečný způsob, jak bandity oklamat.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Na západě jsme objevili pirátský tábor.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nejsem si jistý, ale mám dojem, že si nás také všimli.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Ale nezdá se, že by je naše přítomnost nějak zajímala.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "Pověz mi o tomto místě víc.";
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhatToFind) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Pověz mi o tomto místě víc.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co chceš vědět?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld_1) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"Je nějaká mapa oblasti?",DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Kde jsi viděl piráty?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Ještě jednou, kde jsou ti banditi?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Byl jsi už na západě?",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Co leží na východě?",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Kam se dostanu, když půjdu na jih?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Co je na severu?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Je nějaká mapa oblasti?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Cronos jednu nakreslil. Určite ti ji přenechá.
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Ještě jednou, kde jsou ti banditi?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Mají jakousi pevnost s velkým množstvím strážních věží na východě.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby ses tam dostal, musíš přejít přes velký močál.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Kde jsi viděl piráty?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Byli na západě.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Myslím, že lovili.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co je na severu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Pokud mám veřit záznamům Stavitelů, najdeš tam dlouhé údolí obklopené vysokými skálami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Tamější povrch je jen poušť.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Kam se dostanu, když půjdu na jih?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Krajina na jihu je velmi divoká.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Najdeš tam klikaté cestičky, vodopády a ruiny z kamene.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co leží na východě?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Velký močál, ta oblast je velmi nebezpečná.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Nestřetneš tam jen bandity, ale i velmi nebezpečnou zvěř.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Měl by sis dávat pozor.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Byl jsi už na západě?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Ne. Podle všeho tam musí být pobřeží.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Předpokládám, že piráti tam mají svůj tábor.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Našli jsme tělo rybáře nedaleko odtud.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Měl by ses tam jít podívat.
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = "Posílá mě Saturas.";
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(MIS_Saturas_LookingForHousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Posílá mě Saturas. Hledám pět sídel Jharkendaru.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Potřeboval jsem mnoho času, abych určil polohu sídel Stavitelů.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale teď ti to už můžu říct přesně.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "Kde můžu najít pět sídel Jharkendaru?";
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && (Saturas_SCBroughtAllToken == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};


var int B_WhreAreHousesOfRulersOneTime;

func void B_WhreAreHousesOfRulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Dům učenců je velká budova. Musí byt někde na severu.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Dům válečníků je pevnost obklopená kamením na východě.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Kněží a Strážci smrti měli svoje budovy blízko sebe. Měl bys je najít na jihozápadě.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//Léčitelé měli své obydlí na jihovýchodě.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Pokud tyto budovy ještě stojí, poznáš je podle stylu v jakém jsou postavené.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Všechny chrámy jsou vyvýšené. Dovnitř vedou strmé schody a vstup zdobí vysoké sloupy.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Doufám, že ti to pomůže.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Dům učenců je velká budova. Musí být někde na severu.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Dům válečníků je pevnost na východě, obklopená útesy.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Kněží a Strážci smrti byli blízko při sobě, měl bych je najít na jihozápadě.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Dům léčitelů byl na jihovýchodě.");
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Kde můžu najít pět sídel Jharkendaru?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "Hmm, k těm sídlům...";
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
	return FALSE;
};

var int foundhouseinfo[6];
const int Library = 1;
const int heiler = 2;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Hmm, k těm sídlům...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Ano?

	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Skřeti mají zjevně zájem o knihovnu učenců.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Myslíš si, že umí číst ve starém jazyce?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nemyslím si, ale kdo ví.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Takže by ses měl raději postarat, aby zmizli.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"Mág Vody Riordian by se raději zbavil skřetů v kaňonu.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Dům léčitelů je uprostřed močálu a hlídá ho mnoho kamenných strážců.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Stále stojí?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Ano, ale dokdy...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Bolí mě, když vidím důkazy o minulosti v takovém stavu.
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//Sídlo válečníků použil Raven jako úkryt.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(cynicky) Vybral si dobře.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Je to nejbezpečnější pevnost v této oblasti.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//V domě kněží je mnoho důlních červů...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Není tato oblast nepřirozená pro tato zvířata?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Rozhodně.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Ó, Adane, strašné věci se dějí v tomto kraji.
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Obydlí Strážců smrti ovládla síla zla.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Myslím, že jsem ještě neviděl tolik zombií jako tam.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Toto je neštěstí. Strážci smrti se jistě stali obětmi svých schopností.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Jejich solidarita k světu mrtvých jim uškodila. Doufám, že jsi jim ulevil z jejich utrpení.
		FOUNDHOUSEINFO[5] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount = RiordianHousesFoundCount + RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Pověz mi ještě jednou, kde je každá čast.
		B_WhreAreHousesOfRulers();
	};
};

instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "Skřeti již brzy ztratí zájem o tuto oblast.";
};

func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if(Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Skřeti již brzy ztratí zájem o tuto oblast.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Co tím myslíš?
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabil jsem jejich velitele.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Jejich vůdce je mrtvý.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Doufám, že máš pravdu.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Opravdu si nemůžeme dovolit takové nepokoje.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "Našel jsem všechna sídla.";
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if((RiordianHousesFoundCount >= 5) && (MIS_Riordian_HousesOfRulers == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Našel jsem všechna sídla.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Byla všechna tam, kde jsem ti řekl?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ano, víceméně.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Vynikající, má práce nebyla marná.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Děkuji.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};

instance DIA_Addon_Riordian_SpeedPotion(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_SpeedPotion_Condition;
	information = DIA_Addon_Riordian_SpeedPotion_Info;
	description = "Můžu ti ještě s něčím pomoci?";
};

func int DIA_Addon_Riordian_SpeedPotion_Condition()
{
	if(MIS_Riordian_HousesOfRulers == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SpeedPotion_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_00");	//Můžu ti ještě s něčím pomoci?
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_01");	//Možná... (zamyšleně) Nedávno jsem dostal nápad na nový elixír rychlosti.
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_02");	//A co tě trápí?
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_03");	//Skutečnost, že účinky jeho působení jsou příliš dlouhé.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_04");	//Nicméně slyšel jsem, že v táboře pirátů mají alchymistu, který ví, jak vařit speciální lektvar rychlosti.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_05");	//A přitom jeho výroba není tak složitá jako u běžných elixírů.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_06");	//Tak jsem si myslel, že by bylo dobré, kdybys ho nějak obstaral.
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_07");	//Chceš, abych ho pro tebe získal?
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_08");	//Správně. A pokud se ti to podaří, dlužen ti nezůstanu.
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_09");	//Dobře, zkusím to.
	MIS_SpeedPotion = LOG_Running;
	Log_CreateTopic(TOPIC_SpeedPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SpeedPotion,LOG_Running);
	B_LogEntry(TOPIC_SpeedPotion,"Riordian chce, abych mu přinesl recept na nápoj rychlosti, který vaří alchymista v táboře pirátů.");
};

instance DIA_Addon_Riordian_SpeedPotionDone(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_SpeedPotionDone_Condition;
	information = DIA_Addon_Riordian_SpeedPotionDone_Info;
	description = "Mám pro tebe ten recept.";
};

func int DIA_Addon_Riordian_SpeedPotionDone_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (Npc_HasItems(hero,ITWr_Addon_Piratentod) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SpeedPotionDone_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotionDone_01_00");	//Mám pro tebe ten recept.
	B_GiveInvItems(other,self,ITWr_Addon_Piratentod,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Piratentod,1);
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_01");	//Výborně! Podívám se na něj.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_02");	//No, jak jsem si myslel. Je to docela jednoduché.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_03");	//Dobře, děkuji ti. Vezmi si tyto lektvary.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItPo_Health_Addon_04,2);
	CreateInvItems(other,ItPo_Mana_Addon_04,2);
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_04");	//Budou se ti na tvých cestách určitě hodit.
	MIS_SpeedPotion = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SpeedPotion,LOG_SUCCESS);
	B_LogEntry(TOPIC_SpeedPotion,"Dal jsem Riordianovi recept.");
};

instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit něco z tvých schopnosti?";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	if((Riordian_ADW_ADDON_TeachAlchemy == FALSE) && (Riordian_ADW_ADDON_TeachWisp == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Můžeš mě naučit něco z tvých schopnosti?

	if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Můžu tě naučit alchymii.
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
		Riordian_ADW_ADDON_TeachAlchemy = TRUE;
		Riordian_ADW_ADDON_TeachWisp = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_03");	//Učím jenom členy našeho řádu. A ty nejsi mágem Vody!
	};
};

var int DIA_Riordian_ADW_TeachAlchemy_permanent;

instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = "Nauč mě něco z alchymie.";
};

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE) && (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Nauč mě něco z alchymie.

	if(Alchemy_Explain == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Magické lektvary se připravují v alchymistické koloně, jedna je ve tvém obydlí v poschodí.
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Potřebuješ ale také prázdnou nádobu, ingredience a vědomosti jak magický lektvar připravit.
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Ode mě můžeš mít vědomosti, ale ostatní věci si musíš opatřit sám.
		Alchemy_Explain = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chceš připravit?
	};

	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
	Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);

	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Elixír obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nemůžu tě naučit už nic, co bys již neuměl.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

instance DIA_RIORDIAN_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = dia_riordian_adw_prayforgomez_condition;
	information = dia_riordian_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};

func int dia_riordian_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Riordian_ADW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Riordian_ADW_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Riordian_ADW_PrayForGomez_01_03");	//Ten ti dokáže pomoci.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_RIORDIAN_ADW_TEACHPRE(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = dia_addon_riordian_ADW_teachpre_condition;
	information = dia_addon_riordian_ADW_teachpre_info;
	description = "Vatras mi dal tento amulet pátrající bludičky...";
};

func int dia_addon_riordian_ADW_teachpre_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW) && (Riordian_Addon_TeachPlayer == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_ADW_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Vatras mi dal tento amulet pátrající bludičky...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ach! Velmi vzácný artefakt. Víš o tom, že svou bludičku můžeš trénovat?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Můžeš mi s tím pomoci?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Jistě. Zabývám se tímto druhem magie už dlouho.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};

instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = dia_addon_riordian_ADW_teach_condition;
	information = dia_addon_riordian_ADW_teach_info;
	permanent = TRUE;
	description = "Ukaž mi, jak mám trénovat bludičku.";
};

var int dia_addon_riordian_ADW_teach_noperm;

func int dia_addon_riordian_ADW_teach_condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_ADW_teach_info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if((player_talent_wispdetector[WISPSKILL_NF] == FALSE) || (player_talent_wispdetector[WISPSKILL_FF] == FALSE) || (player_talent_wispdetector[WISPSKILL_NONE] == FALSE) || (player_talent_wispdetector[WISPSKILL_RUNE] == FALSE) || (player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE) || (player_talent_wispdetector[WISPSKILL_FOOD] == FALSE) || (player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_ADW_teach);
		Info_AddChoice(dia_addon_riordian_ADW_teach,Dialog_Back,dia_addon_riordian_ADW_teach_back);
		B_DIA_Addon_Riordian_Teach_10_01();

		if(player_talent_wispdetector[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Vyhledávání zbraní, šípů a šipek (vyžaduje 10 kusů magické rudy).",dia_addon_riordian_ADW_teach_wispskill_ff);
		};
		if(player_talent_wispdetector[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Vyhledávání zlata a různého nádobí (vyžaduje 20 kusů magické rudy).",dia_addon_riordian_ADW_teach_wispskill_none);
		};
		if(player_talent_wispdetector[WISPSKILL_RUNE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Vyhledávání magických svitků (vyžaduje 30 kusů magické rudy).",dia_addon_riordian_ADW_teach_wispskill_rune);
		};
		if(player_talent_wispdetector[WISPSKILL_FOOD] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Vyhledávání rostlin a potravin (vyžaduje 50 kusů magické rudy).",dia_addon_riordian_ADW_teach_wispskill_food);
		};
		if(player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Vyhledávání magických prstenů a amuletů (vyžaduje 75 kusů magické rudy).",dia_addon_riordian_ADW_teach_wispskill_magic);
		};
		if(player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Vyhledávání magických lektvarů (vyžaduje 100 kusů magické rudy).",dia_addon_riordian_ADW_teach_wispskill_potions);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_ADW_teach_wispskill_x()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void dia_addon_riordian_ADW_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF,10))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE,20))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE,30))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC,75))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD,50))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS,100))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

instance DIA_Addon_Riordian_LostPower(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = DIA_Addon_Riordian_LostPower_Condition;
	information = DIA_Addon_Riordian_LostPower_Info;
	important = TRUE;
};

func int DIA_Addon_Riordian_LostPower_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_LostPower == LOG_Running) && (SaturasKnowPortalOpenDay > 0) && (SaturasKnowPortalOpenDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Info()
{
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_00");	//Počkej! Slyšel jsem, že se ti podařilo otevřít magický portál vedoucí do neznámé oblasti.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_03");	//Saturas si myslí, že by to mohlo být posvátné místo samotného Adana!
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_04");	//Na základě této úvahy, zakázal dál studovat toto místo...
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_05");	//No, nejspíš ale jeho zákaz pro tebe neplatí...
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_01_06");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_07");	//Mohl bys to místo prozkoumat. A přinést mi něco, co by mi poskytlo důkaz týkající se spojitosti onoho místa a zdejší civilizací.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_08");	//Pomohlo by mi to lépe pochopit jak se zdejší civilizace rozvíjela, než toto údolí uzavřeli...
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_01_09");	//Ale co když to místo vytvořil někdo jiný?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_10");	//Ano, je to možné. Ale vytvořili ten portál. Museli vědět kam vede.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_01_11");	//No, stejně tam půjdu...
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_12");	//Skvělé! Neříkej to však Saturasovi - bude proti!
	B_LogEntry(TOPIC_LostPower,"Riordian si přeje, abych zjistil souvislosti mezi Adanovou zemí a civilizací Stavitelů.");
};

instance DIA_Addon_Riordian_LostPower_Done(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_LostPower_Done_Condition;
	information = DIA_Addon_Riordian_LostPower_Done_Info;
	permanent = TRUE;
	description = "K té naší věci...";
};

func int DIA_Addon_Riordian_LostPower_Done_Condition()
{
	if((MIS_LostPower == LOG_Running) && (Npc_HasItems(other,ItMi_LP_StonePlate_01) >= 1) && (Npc_KnowsInfo(other,DIA_Addon_Riordian_LostPower) == TRUE) && (RiordianDayStory == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Done_01_00");	//K té naší věci...
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Done_01_01");	//Ano? Našel jsi něco zajímavého?
	Info_ClearChoices(DIA_Addon_Riordian_LostPower_Done);
	Info_AddChoice(DIA_Addon_Riordian_LostPower_Done,Dialog_Back,DIA_Addon_Riordian_LostPower_Done_Back);

	if(Npc_HasItems(other,ItMi_LP_StonePlate_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Riordian_LostPower_Done,"(dát kamenné tabulky)",DIA_Addon_Riordian_LostPower_Done_StnAll);
	};
};

func void DIA_Addon_Riordian_LostPower_Done_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_LostPower_Done);
};

func void DIA_Addon_Riordian_LostPower_Done_StnAll()
{
	var int TakeStonePlate;

	TakeStonePlate = Npc_HasItems(other,ItMi_LP_StonePlate_01);
	B_GiveInvItems(other,self,ItMi_LP_StonePlate_01,TakeStonePlate);
	Npc_RemoveInvItems(self,ItMi_LP_StonePlate_01,TakeStonePlate);
	B_GivePlayerXP(TakeStonePlate * 100);

	if(TakeStonePlate > 1)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_00");	//Podívej se na tohle. Určitě tam něco najdeš.
		AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_01");	//Dobrá. Tak se podívejme.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_02");	//Podívej se na tohle. Určitě tam něco najdeš.
		AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_03");	//Dobrá. Tak se podívejme.
	};

	AllTakeStonePlate = AllTakeStonePlate + TakeStonePlate;

	if(AllTakeStonePlate >= 15)
	{
		RiordianDayStory = TRUE;
	};
};

instance DIA_Addon_Riordian_LostPower_Know(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 3;
	condition = DIA_Addon_Riordian_LostPower_Know_Condition;
	information = DIA_Addon_Riordian_LostPower_Know_Info;
	permanent = FALSE;
	description = "Zjistil jsi už něco?";
};

func int DIA_Addon_Riordian_LostPower_Know_Condition()
{
	if((MIS_LostPower == LOG_Running) && (RiordianDayStory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Know_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_00");	//Zjistil jsi už něco?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_01");	//Trochu. Něco byl však nepoužitelný odpad.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_02");	//Například tahle byla recept na maso.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_03");	//Nebo jsem našel zamilovanou báseň, umíš si to představit?
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_04");	//Takže to bylo zbytečné?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_05");	//Ne tak docela. Jiné tabulky trochu objasnily situaci.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_06");	//(slavnostně) Starověká náhorní plošina. Tak Stavitelé nazvali ono místo!
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_07");	//A co se tedy stalo?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_08");	//Zdá se, že nějaké hrozivé prokletí padlo na zdejší lid.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_09");	//Zemi zaplavily legie nemrtvých. Lidé nevěděli co mají dělat.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_10");	//Velitel Stavitelů, Quarhodron, velký válečník, sebral všechny síly a pokusil se zastavit tu hrůzu.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_11");	//Bitva se konala poblíž místa nazývaného Khar Aram. Bohužel, Quarhodron a jeho válečníci byli poraženi. Jejich nepřítel byl příliš silný.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_12");	//Přeživší zapečetili portál a zůstali napospas svému osudu.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_13");	//Zajímavé. Ale co není jasné, kdo byl ten nepřítel.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_14");	//Ano. A také proč jim nepomohl Adanos? Ti lidé ho uctívali po staletí...
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_15");	//Možná to prokletí seslal sám Adanos?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_16");	//Nemyslím si. Prokletí spíše přišlo s nějakým artefaktem.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_17");	//V záznamech chybí jeho jméno. Snad sám Adanos ho zde ukryl před Beliarem.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_18");	//(se strachem) Artefakt Beliara... Snad ne... Opravdu... Dráp...
	MIS_LostPower = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPower,LOG_Success);
	B_LogEntry(TOPIC_LostPower,"Přinesl jsem Riordianovi dostatek tabulek, aby si udělal obrázek o minulosti.");
};