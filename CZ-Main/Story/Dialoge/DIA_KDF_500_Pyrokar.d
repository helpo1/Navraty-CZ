/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)
MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)
(7x) TOPIC_ORcGREATWAR - TOPIC_ORCGREATWAR (cyrilice -> latinka)


v1.00:

func void DIA_Pyrokar_GIVEINNOSEYE_wer - opraven zápis do deníku

*/




instance DIA_Pyrokar_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_NoEnter_PissOff(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_NoEnter_PissOff_Condition;
	information = DIA_Pyrokar_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Pyrokar_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_NoEnter_PissOff_01_00");	//Hmm... (naštvaně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Pyrokar_WELCOME(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WELCOME_Condition;
	information = DIA_Pyrokar_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Pyrokar_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//Takže to ty jsi ten nový novic. Předpokládám, že ti již mistr Parlan dal něco na práci.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(lehce káravě) Jak jistě víš, každý člen řádu musí plnit povinnosti v souladu s Innosovou vůlí.
};


instance DIA_Pyrokar_Hagen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Hagen_Condition;
	information = DIA_Pyrokar_Hagen_Info;
	permanent = FALSE;
	description = "Mistře, potřebuji co nejrychleji mluvit s paladiny!";
};


func int DIA_Pyrokar_Hagen_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Hagen_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Mistře, potřebuji co nejrychleji mluvit s paladiny!
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//A hodláš nám sdělit, proč s němi chceš mluvit?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//Mám pro ně velice důležitou zprávu.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//Jakou zprávu?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//Armáda zla pod vedením draků se shromažďuje v Hornickém údolí! Musíme je zastavit, dokud ještě můžeme.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Hm. Promyslíme to s radou starších, to co jsi nám řekl a jakmile se rozhodneme, sdělíme ti to.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//Mezitím bys ses měl věnovat svým povinnostem jako každý novic.
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Můžeš jít, nebudeme tě nadále zdržovat od tvých povinností.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_Auge(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Auge_Condition;
	information = DIA_Pyrokar_Auge_Info;
	permanent = FALSE;
	description = "Hledám Innosovo oko.";
};


func int DIA_Pyrokar_Auge_Condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Auge_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//Hledám Innosovo oko.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Kdokoliv, kdo si myslí, že by mohl najít, natož nosit posvátný amulet, je hlupák.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//Amulet si sám vybírá svého nositele - jen ten, komu byl předurčen ho může nosit.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Jsem ochoten zkusit to.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Tvé povinnosti tě mají naučit pokoře, nikoliv touze a chtíči.
	B_LogEntry(TOPIC_INNOSEYE,"Čekal jsem, že to bude probíhat více podle mých představ, ale jak vidím, tak bez svolení od paladinů mi mistr Pyrokar Oko nepředá.");
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Nuže, nebudeme tě zdržovat. Běž se věnovat svým povinnostem.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Pyrokar_MissingPeople(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Addon_Pyrokar_MissingPeople_Condition;
	information = DIA_Addon_Pyrokar_MissingPeople_Info;
	description = "Někteří občané Khorinisu záhadně zmizeli.";
};


func int DIA_Addon_Pyrokar_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pyrokar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//Někteří občané Khorinisu záhadně zmizeli.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//Už o tom vím. Ale dohodli jsme se s mágy Vody, že se o to postarají.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//To samé se týká vyšetřování těch podivných zemětřesení v severo-východní oblasti.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//Zatím nic nenasvědčuje tomu, že by byl potřeba náš zásah. A proto se v blízké budoucnosti nebudeme do ničeho pouštět.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Dobře, ale...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//Žádné ALE! Děláme to co uznáváme za vhodné a doufám, že se to naučíš respektovat!
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Mágům Ohně je líto ztracených občanů, ale tímto problémem se již zabývají mágové Vody. Takže od kláštera nemohu očekávat žádnou pomoc.");
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_GOAWAY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_GOAWAY_Condition;
	information = DIA_Pyrokar_GOAWAY_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pyrokar_GOAWAY_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Pyrokar_MissingPeople) == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Pyrokar_Hagen) && Npc_KnowsInfo(other,DIA_Pyrokar_Auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(rozčíleně) Poslušnost je ctností, které se musíš ještě dosti učit!
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_FIRE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_FIRE_Condition;
	information = DIA_Pyrokar_FIRE_Info;
	permanent = FALSE;
	description = "Přál bych si podstoupit zkoušku ohně.";
};


func int DIA_Pyrokar_FIRE_Condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FIRE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Přál bych si podstoupit zkoušku ohně.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(překvapeně) Takže o zkoušce víš... a chceš ji podstoupit?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Ano, četl jsem Právo ohně, kde je psáno...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(přísně přeruší) Známe právo ohně. Také jsme ale viděli mnoho noviců při zkoušce zemřít. Měl by sis to ještě promyslet.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//Není co, už jsem rozhodnut. Chci být zkoušce podroben - a také ji splním.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(varujícně) Pokud na tom opravdu trváš, tak tě Rada starších zkoušce podrobí.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Trvám na tom, abyste mi zadali Zkoušku ohně.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//V tom případě - budiž. Až budeš připraven, každý člen Rady starších ti dá úkol, který budeš muset splnit.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Nechť Innos opatruje tvoji duši.
	B_LogEntry(TOPIC_FireContest,"Požádal jsem Pyrokara o podrobení se Zkoušce ohně. Nyní musím splnit tři úkoly, které mi Rada starších zadá.");
};


instance DIA_Pyrokar_TEST(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_TEST_Condition;
	information = DIA_Pyrokar_TEST_Info;
	permanent = FALSE;
	description = "Jsem připraven složit Vaši zkoušku, mistře.";
};


func int DIA_Pyrokar_TEST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEST_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Jsem připraven složit vaši zkoušku, mistře.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//A pouze Innos ví, jestli ji skutečně složíš. Podstoupíš stejnou zkoušku, který byla dána vyvoleným novicům.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//Zkouška magie... (odměřeně) Měl bys vědět, že pouze jeden novic může uspět.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//Ach tak, kdo jsou tedy moji soupeři?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//Innos ve své moudrosti zvolil tři novice, kteří jsou také podrobení zkoušce: Agon, Igaraz a Ulf. Už se vydali na cestu.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(úsečně) Ale už dost o tom! Teď slyš slova, která tě povedou: 'Následuj znamení Innose a dones nám to co věřící najde na konci cesty.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//Také budeš potřebovat tento klíč.
	Log_CreateTopic(TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Schnitzeljagd,LOG_Running);
	B_LogEntry(TOPIC_Schnitzeljagd,"Pyrokar mě podrobí zkoušce magie. Tato zkouška byla také zadána Agonovi, Igarazovi a Ulfovi.");
	B_LogEntry_Quiet(TOPIC_Schnitzeljagd,"Musím následovat Innosova znamení, najít a donést 'to, co věřící nalezne na konci cesty'. Klíč, který jsem obdržel by mi měl pomoct.");
	CreateInvItems(self,ItKe_MagicChest,1);
	B_GiveInvItems(self,other,ItKe_MagicChest,1);
	B_StartOtherRoutine(Igaraz,"CONTEST");
	AI_Teleport(Igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(Igaraz,ItKe_MagicChest,1);
	Igaraz.aivar[AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar[AIV_NewsOverride] = TRUE;
	B_StartOtherRoutine(Nov607,"EXCHANGE");
	B_StartOtherRoutine(Agon,"GOLEMDEAD");
	AI_Teleport(Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(Agon,ItKe_MagicChest,1);
	Agon.aivar[AIV_DropDeadAndKill] = TRUE;
	Agon.aivar[AIV_NewsOverride] = TRUE;
	B_StartOtherRoutine(Ulf,"SUCHE");
	AI_Teleport(Ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(Ulf,ItKe_MagicChest,1);
	Ulf.aivar[AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar[AIV_NewsOverride] = TRUE;
	MIS_SCHNITZELJAGD = LOG_Running;
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_RUNNING(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 20;
	condition = DIA_Pyrokar_RUNNING_Condition;
	information = DIA_Pyrokar_RUNNING_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Pyrokar_RUNNING_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_RUNNING_Info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Dokud nesplníš zkoušku, nemáme ti co říct.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Co tu okouníš? Jdi a splň svůj úkol!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Nastal čas abys dokázal svá velká slova stejně velkými skutky. Nemyslíš, novici?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_SUCCESS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SUCCESS_Condition;
	information = DIA_Pyrokar_SUCCESS_Info;
	permanent = FALSE;
	description = "Našel jsem tenhle runový kámen, mistře.";
};

func int DIA_Pyrokar_SUCCESS_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (MageFireChestOpen == TRUE) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",ItMi_RuneBlank) && ((Npc_HasItems(other,ItMi_RuneBlank) >= 1) || (Npc_HasItems(other,ItRu_FireBolt) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SUCCESS_Info()
{
	B_GivePlayerXP(XP_SCHNITZELJAGD);
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Našel jsem tenhle runový kámen, mistře.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(zaskočen) Ty... ty jsi to dokázal?! Následoval jsi znamení a objevil jsi skrytý portál...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... a také jsem, mimojiné, zabil všechna ta monstra, která si mnou chtěli spestřit jídelníček.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//A co ostatní novicové? Co je s Agonem? Neuspěl někdo již před tebou?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Selhali. Hádám, že zkrátka nebyli předurčeni k složení zkoušky.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Dobrá tedy. Vyhlašujeme, že jsi prošel zkouškou. Runový kámen si můžeš ponechat.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Schnitzeljagd,LOG_SUCCESS);
	B_LogEntry(TOPIC_Schnitzeljagd,"Prošel jsem Zkouškou Ohně, kterou mi zadal Pyrokar!");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Igaraz,"Start");
	Igaraz.aivar[AIV_DropDeadAndKill] = FALSE;
	Igaraz.aivar[AIV_NewsOverride] = FALSE;
	B_StartOtherRoutine(Nov607,"Start");
	B_StartOtherRoutine(Agon,"Start");
	Agon.aivar[AIV_DropDeadAndKill] = FALSE;
	Agon.aivar[AIV_NewsOverride] = FALSE;
	B_StartOtherRoutine(Ulf,"Start");
	Ulf.aivar[AIV_DropDeadAndKill] = FALSE;
	Ulf.aivar[AIV_NewsOverride] = FALSE;
};

instance DIA_Pyrokar_Todo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Todo_Condition;
	information = DIA_Pyrokar_Todo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Pyrokar_Todo_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Todo_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Prošel jsi mou zkouškou.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Ale...

	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... stále musíš splnit Ultharův úkol.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... nesplnil jsi ještě Serpentesovu zkoušku.
	};

	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_MAGICAN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_MAGICAN_Condition;
	information = DIA_Pyrokar_MAGICAN_Info;
	permanent = FALSE;
	description = "Budu teď přijat do řad mágů?";
};

func int DIA_Pyrokar_MAGICAN_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAGICAN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//Budu teď přijat do řad mágů?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Dokázal jsi to. Složil jsi Zkoušku ohně. Celou dobu jsme si byli jistí, že ty uspěješ!
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(naléhavě) Stejně jako bylo jisté, že se staneš skutečným Innosovým služebníkem.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Takže pokud jsi připraven složit Přísahu Ohně, budeš přijat mezi nás mágy.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_100_01");	//Ale teď mám pro tebe poslední úkol. Běž za Karrasem on ti řekne víc.
	MIS_KARRAS_BOOKS = LOG_Running;
	Log_CreateTopic(TOPIC_HELPKARRASBOOKS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPKARRASBOOKS,LOG_Running);
	B_LogEntry(TOPIC_HELPKARRASBOOKS,"Pyrokar řekl že budu mágem Ohně až splním poslední Karrasův úkol.");
};

instance DIA_Pyrokar_OATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_OATH_Condition;
	information = DIA_Pyrokar_OATH_Info;
	permanent = FALSE;
	description = "Jsem připraven vstoupit do Kruhu Ohně.";
};

func int DIA_Pyrokar_OATH_Condition()
{
	if((hero.guild == GIL_NOV) && (MIS_KARRAS_BOOKS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_OATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Jsem připraven vstoupit do Kruhu Ohně.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Dobrá, slož tedy Přísahu Ohně.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(vážně) Přísaháš před všemohoucím Innosem a jeho služebníky Posvátného plamene...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... že od nynějška a navždy bude tvůj život spjat s Ohněm...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... dokud tvé tělo a duše nenajdou odpočinku v jeho posvátných komnatách a tvůj plamínek života neuhasne?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//Přísahám.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Vyřčením slov přísahy jsi vstoupil do doživotního svazku s Ohněm.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Nos tohle roucho na znamení tohoto věčného pouta.
	CreateInvItems(self,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ItAr_KDF_L,1);

	if(CanTeachTownMaster == FALSE)
	{
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_KDF;
	other.protection[PROT_FIRE] += 10;
	REALPROTFIRE += 10;
	AI_PrintClr("Ochrana proti ohni + 10",83,152,48);
	CheckHeroGuild[0] = TRUE;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_1A");	//Dále přijmi tuto magickou hůl. Jen my - mágové Ohně jsme poctěni schopností používát její moc.
	Npc_ExchangeRoutine(Lothar,"START");
	Fire_Contest = TRUE;
	Snd_Play("GUILD_INV");
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 15;
	B_GivePlayerXP(XP_BecomeMage);
	CreateInvItems(self,ITMW_2H_G3_STAFFFIRE_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFFIRE_01,1);
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Teď, když jsi vstoupil do našich řad, můžeš promluvit s lordem Hagenem, nejvyšším velitelem paladinů.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Také by nás zajímalo, jak zhodnotí situaci. Takže běž, můžeš jít do Khorinisu.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//Očekáváme, že nám neprodleně doneseš jeho odpověď.
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_Lernen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Lernen_Condition;
	information = DIA_Pyrokar_Lernen_Info;
	permanent = FALSE;
	description = "Co vše se teď mohu naučit?";
};


func int DIA_Pyrokar_Lernen_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Lernen_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Co vše se teď mohu naučit?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Nejdůležitější jsou kruhy magie. Propůjčují ti moc pro používání run.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//Kruhů je dohromady šest a čím vyšší kruh ovládáš, tím mocnější kouzla budeš moct ovládnout.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_10");	//Bratr Parlan tě zasvětí do prvního kruhu magie a naučí tě nějaké užitečná kouzla. Ale magie není jen o kruzích, nezapomeň trénovat manu!
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry(Topic_KlosterTeacher,"Bratr Parlan mi pomůže ovládnout první kruh magie a zasvětí mě do tajů Ohně.");
};


instance DIA_Pyrokar_Wunsch(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Wunsch_Condition;
	information = DIA_Pyrokar_Wunsch_Info;
	permanent = FALSE;
	description = "Měl bych jedno přání...";
};


func int DIA_Pyrokar_Wunsch_Condition()
{
	if((other.guild == GIL_KDF) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Wunsch_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Měl bych jedno přání...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//Každý mág má po přijetí právo na svůj první čin.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Takže, co si přeješ aby bylo učiněno?
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
	Info_AddChoice(DIA_Pyrokar_Wunsch,"Nic.",DIA_Pyrokar_Wunsch_Nothing);
	if(MIS_HelpBabo == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"Babo by se měl stát novým zahradníkem.",DIA_Pyrokar_Wunsch_Babo);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"Opolosovi by mělo být dovoleno studovat v knihovně.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if(MIS_HelpDyrian == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"Rád bych, aby Dyrian nadále setrval v klášteře.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

func void DIA_Pyrokar_Wunsch_Nothing()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//Žádné.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(udiveně) Dobrá tedy. Nový mág se vzdal práva na svůj první čin.
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");

	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//Nechte novice Dyriana zůstat v klášteře.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Budiž.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Novic zůstanu v klášteře a bude dosazen na post zahradníka, který je teď volný.
	B_GivePlayerXP(XP_HelpDyrian);
	B_StartOtherRoutine(Dyrian,"FAVOUR");
	MIS_HelpDyrian = LOG_SUCCESS;
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Babo()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//Chtěl bych, aby Babo byl zahradníkem.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Jak si přeješ.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//Babo se s okamžitou platností stává hlavní opečovávatel klášterních zahrad.
	B_GivePlayerXP(XP_HelpBabo);
	B_StartOtherRoutine(Babo,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	MIS_HelpBabo = LOG_SUCCESS;
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Opolos()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//Opolos by měl mít přístup do knihovny.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Dobře.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//Od této chvíle může novic Opolos vstoupit a studovat Innosovy spisy v knihovně.
	B_GivePlayerXP(XP_HelpOpolos);
	B_StartOtherRoutine(Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	MIS_HelpOpolos = LOG_SUCCESS;
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};


instance DIA_Pyrokar_Nachricht(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Nachricht_Condition;
	information = DIA_Pyrokar_Nachricht_Info;
	permanent = FALSE;
	description = "Mám zprávy pro lorda Hagena!";
};


func int DIA_Pyrokar_Nachricht_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Nachricht_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//Nesu zprávy pro lorda Hagena. Chce důkaz o přítomnosti draků a armády zla v Hornickém údolí.
	if(EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport(Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//Takže vyražím do Údolí abych mu tento důkaz donesl.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Dobře, budeš se řídit tímto rozkazem, tedy. Paladin Sergio tě doprovodí k průsmyku.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Nechť tě Innost ochraňuje.
		Sergio_Follow = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Takže jdu přímo do Hornického údolí.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Dobře. A jelikož už znáš cestu, tak nepotřebuješ doprovod.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Postarej se o tuhle záležitost pro lorda Hagena - nechť tě Innos ochraňuje.
	};
};

instance DIA_Pyrokar_TEACH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 4;
	condition = DIA_Pyrokar_TEACH_Condition;
	information = DIA_Pyrokar_TEACH_Info;
	permanent = TRUE;
	description = "Nauč mě poslední kruh magie. (VB: 100)";
};

func int DIA_Pyrokar_TEACH_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && Npc_KnowsInfo(other,DIA_Pyrokar_Parlan))
	{
		if(CanLearnMagicCircleNext_ABCZ(6) == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_TEACH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Nauč mě poslední kruh magie.

	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if(B_TeachMagicCircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Hodně času uplynulo od tvého sjednocení s plamenem. Mnohé se událo a my neměli čas na odpočinek.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Jsi Innosův vyvolený. Proto budeš potřebovat veškerou svou sílu abys obstál v bitvách, které tě ještě čekají.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Nyní tě zasvětím, Vyvolený. Nyní vstupuješ do šestého kruhu - Nechť přineseš světlo a zaženeš temnotu.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Můžeš se teď ode mě naučit magické formule pro poslední kruh, přeješ-li si to.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Och, ještě jedna věc. Trvalo mi trochu déle tě poznat.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//Ty jsi ten, komu jsem předal dopis, když tě prohazovali bariérou.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Ano, ušetřil jsi mě spousty soudcových žvástů.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//A jsi Vyvoleným Innose.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Přijmi mé požehnání, Vyvolený!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Innosi, světlo slunce a ohni světa, požehnej tomuto muži, svému vyvolenému služebníkovi.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Dej mu odvahu, sílu a moudrost, aby mohl následovat cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//Ještě nepřišel tvůj čas. Jakmile ještě popojdeš po Innosově cestě, budu tě dále učit.
	};
};


instance DIA_Pyrokar_SPELLS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SPELLS_Condition;
	information = DIA_Pyrokar_SPELLS_Info;
	permanent = TRUE;
	description = "Nauč mě tvořit runy.";
};

func int DIA_Pyrokar_SPELLS_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && Npc_KnowsInfo(other,DIA_Pyrokar_Parlan) && ((PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE) || (PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPELLS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Uč mě.
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
	Info_AddChoice(DIA_Pyrokar_SPELLS,Dialog_Back,DIA_Pyrokar_SPELLS_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Pyrokar_SPELLS_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,b_buildlearnstringforrunes(NAME_SPL_FireMeteor,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FireMeteor)),DIA_Pyrokar_SPELLS_FireMeteor);
	};
};

func void DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
};

func void DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Pyrokar_SPELLS_FireMeteor()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FireMeteor);
};

instance DIA_Pyrokar_Parlan(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_Parlan_Condition;
	information = DIA_Pyrokar_Parlan_Info;
	permanent = FALSE;
	description = "Posílá mě Parlan.";
};

func int DIA_Pyrokar_Parlan_Condition()
{
	if((hero.guild == GIL_KDF) && (Parlan_Sends == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Parlan_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Posílá mě Parlan. Chtěl bych navýšit své magické schopnosti.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Dobrá, hodně ses toho naučil a zesílil jsi. Od teď se budeš učit ode mě.
};


instance DIA_Pyrokar_TEACH_MANA(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_TEACH_MANA_Condition;
	information = DIA_Pyrokar_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Rád bych získal více magické energie.";
};


func int DIA_Pyrokar_TEACH_MANA_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pyrokar_Parlan))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Rád bych získal více magické energie.
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//Cítím, že tebou magická moc prochází ve vší síle. Ani já už ti nemohu ukázat jak být silnějším.
	};
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
};

func void DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};


instance DIA_Pyrokar_PERM(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PERM_Condition;
	information = DIA_Pyrokar_PERM_Info;
	permanent = TRUE;
	description = "(Požehnání)";
};


func int DIA_Pyrokar_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PERM_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Požehnej mi, mistře.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Co třeba nějaké požehnání? Určitě by se mi hodilo.
	};
	if((Kapitel == 5) && (MIS_PyrokarClearDemonTower == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Nechť ti Innos pomůže zažehnat nepřátele v tvé poslední bitvě.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Nechť je Innos tvým štítem proti všem pekelným stvůrám.
	};
};


instance DIA_Pyrokar_KAP3_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP3_EXIT_Condition;
	information = DIA_Pyrokar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_BACKFROMOW(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BACKFROMOW_Condition;
	information = DIA_Pyrokar_BACKFROMOW_Info;
	description = "Jsem zpět z Hornického údolí.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition()
{
	if((Kapitel >= 3) && (Kapitel < 6) && (MIS_OLDWORLD == LOG_SUCCESS) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//Přicházím zpět z Hornického údolí.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Jaké neseš zprávy?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Nepřítel se spolčil s draky a s armádou skřetů.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//To už nám řekl Milten - ale co je s rudnou dodávkou pro krále?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Doly, ve kterých se ještě může těžit, nemohou dostát královým požadavkům.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Dny se stále více zatemňují a svit slunce slábne.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//Napadli mě nějací mágové v černých kápích.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//Ano, to jsou Pátrači. Beliarovi nohsledi z podsvětí. Pokusí se ovládnout tvou mysl, dávej si na ně pozor.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Jakmile tě ovládnou, už to nebudeš nadále ty. Poté už ti pomůžeme jen my, zde v klášteře.

	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		B_LogEntry(TOPIC_DEMENTOREN,"Pyrokar mi řekl o Pátračích, chlápcích v černých kápích. Jsou to sluhové Beliara, kteří se mě budou pokoušet zmocnit. Jestli se jim to povede, musím se neprodleně dostat do kláštera.");
	};
	if((Npc_IsDead(Karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Požádal jsem Karrase, aby se na to podíval. Určitě brzy přijde na něco co nám pomůže.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"Pyrokar rozkázal Karrasovi, aby vytvořil nějaký druh ochrany proti pohledu Pátračů.");
	};

	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//A nezapomeň, musíme zůstat ostražití, jinak budeme odsouzeni ke zkáze.
};


instance DIA_Pyrokar_GIVEINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 31;
	condition = DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information = DIA_Pyrokar_GIVEINNOSEYE_Info;
	description = "Příšel jsem vyzvednout Innosovo oko.";
};


func int DIA_Pyrokar_GIVEINNOSEYE_Condition()
{
	if((Kapitel == 3) && (Npc_HasItems(hero,ItWr_PermissionToWearInnosEye_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//Přišel jsem si pro Innosovo oko!
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Vidím, že tě lord Hagen pověřil opatrovánín Innosova oka.

	if(DarkPathStartPyr == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Ale bojím se, že tě zklamu. Nepřítel v podobě přítele na nás nachystal zrádnou léčku.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Innosovo oko bylo násilím ukradeno z poza našich posvátných stěn.

		if(hero.guild == GIL_KDF)
		{
			Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE,"Kdo by to jen mohl udělat, mistře?",DIA_Pyrokar_GIVEINNOSEYE_wer);
		}
		else
		{
			Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE,"Kdo to byl?",DIA_Pyrokar_GIVEINNOSEYE_wer);
		};
	}
	else
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_01");	//Jak to vidíte?
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_02");	//Dobře! Než si to vemeš. Věz že nyní je to na tobě.
		B_GiveInvItems(self,other,ItMi_InnosEye_Bad,1);
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_03");	//Děkuji ti mistře.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_04");	//Postarej se o to! A pamatuj, že takové věci by se neměly dostat do rukou zlu.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_05");	//Teď jdi, můj synu. Innos tě bude doprovázet na tvé cestě.
		B_LogEntry(TOPIC_INNOSEYE,"Pyrokar mi dal artefakt. Měl bych jít ke kruhu Slunce a donést ho Temnému vyslanci. Tím dokážu že jsem hoden sloužit Beliarovi!");
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(DMT_2200_DarkSpeaker,"Circle");
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Kdo by to jen mohl udělat, mistře?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Kdo to byl?
	};

	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Zlo je vychytralé a většinou se skrývá ve stínech. Jen vzácně můžeš vidět jeho podlé intriky za denního světla.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//Ale v těchto dnech je to jinak. Nepřítel se ukazuje volně po ulicích, v lidských obydlích a na náměstích.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//To může znamenat jen to, že už se nezalekne žádného protivníka a před ničím se nezastaví.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Jeden z našich nejoddanějších následovníků, kandidát na nositele roucha Ohně náhle změnil svou víru ve zlo. Byl to Pedro.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Nepřítel nad tím převzal moc a způsobil nám obrovskou ztrátu.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Pedro se násilím dostal do našich posvátných komnat a ukradl Oko.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Obávám se, že zůstal moc dlouho v nebezpečí za stěnami kláštera.
	Pedro.flags = 0;
	Pedro_Traitor = TRUE;
	B_LogEntry(TOPIC_INNOSEYE,"No samozřejmě! Přišel jsem o něco později a ti tupci z kláštera nechají nějakého novice vyfouknout jim Innosovo oko pod nosem. A já teď mám vypátrat zrádce Pedra a doufat, že amulet někde nestřelil.");
	MIS_TraitorPedro = LOG_Running;
	Log_CreateTopic(TOPIC_TraitorPedro,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_Running);
	B_LogEntry(TOPIC_TraitorPedro,"Novic Pedro ukradl Innosovo oko z kláštera. Myslím, že mágové by byli rádi, kdyby se jim dostal do rukou.");
};

instance DIA_Pyrokar_NOVIZENCHASE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 34;
	condition = DIA_Pyrokar_NOVIZENCHASE_Condition;
	information = DIA_Pyrokar_NOVIZENCHASE_Info;
	description = "Jakým směrem ten zloděj utekl?";
};


func int DIA_Pyrokar_NOVIZENCHASE_Condition()
{
	if((Kapitel == 3) && (Pedro_Traitor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Jakým směrem ten zloděj utekl?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Pedro složil ostatní novice, kteří se ho snažili zastavit a utekl do ranní mlhy.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//Spousta noviců se za ním vydala, aby zachránili a donesli zpět Innosovo oko nepoškozené.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Jestli ho chceš chytit, tak musíš pospíchat, dokud Pedro nezmizí z tvého dosahu.
	MIS_NovizenChase = LOG_Running;
};


instance DIA_Pyrokar_FOUNDINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 35;
	condition = DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information = DIA_Pyrokar_FOUNDINNOSEYE_Info;
	description = "Našel jsem Innosovo oko.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Našel jsem Innosovo oko. Je rozbité.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Ale... to nemůže být pravda. Co se stalo?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Měli ho u sebe ti zakuklení chlápci. Každopádně jsem přišel pozdě.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//Prováděli na něm podivný rituál nahoře v lesích.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Innos s námi. Oni znesvětili kruh Slunce.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//Ani ve svých nejhorších nočních můrách jsem si nepředstavoval, že by se tohle mohlo stát.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"Co budeme dělat?",DIA_Pyrokar_FOUNDINNOSEYE_was);
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Nepřítel se stal velice mocným, ale i tak je pro něj tento amulet mocnou hrozbou.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Musíme Oko uzdravit a navrátit mu moc. Ale nemáme moc času.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Bojím se představit si co se s námi stane. Bez ochrany Oka jsme oddáni na milost a nemilost nepřítele.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Jdi za Vatrasem, mágem Vody co káže ve městě. V této strašné situaci jen on bude vědět co musím učinit. Vezmi Oko a jdi hned zaním.
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,Dialog_Back,DIA_Pyrokar_FOUNDINNOSEYE_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"Proč Vatras?",DIA_Pyrokar_FOUNDINNOSEYE_was_vatras);
	};
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"Co je to kruh Slunce?",DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis);
	B_LogEntry(TOPIC_INNOSEYE,"Pyrokar chce abych zašel za Vatrasem a zjistil co máme udělat s rozbitým Innosovým okem.");
	MIS_Pyrokar_GoToVatrasInnoseye = LOG_Running;
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Proč zrovna Vatras?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Privilegium roucha tě neopravňuje zpochybňovat mé příkazy, bratře.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Vatras je služebník Adanův. Vědomosti mága Vody nám přinesou plamínek světla do tohoto temného období.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//To je vše co potřebuješ vědět.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Co je to kruh Slunce?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Každý rok se mágové a novici z kláštera vydávají na tohle místo k oslavení slunovratu a nového cyklu.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//Kruh je naplněn obrovskou mocí slunce.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//Nikdy by mě nenapadlo, že se může obrátit proti nám. A právě to se stalo.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter()
{
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
};


instance DIA_Pyrokar_SPOKETOVATRAS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information = DIA_Pyrokar_SPOKETOVATRAS_Info;
	description = "Mluvil jsem s Vatrasem.";
};


func int DIA_Pyrokar_SPOKETOVATRAS_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//Mluvil jsem s Vatrasem.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//Ach, skvělé. Kde teď je?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//Připravuje rituál na obnovu moci Innosova oka.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Jestli je to pravda, pak je tu možná stále naděje.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Vatras chce, abyste mu ty a Xardas pomohli.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//COŽE?! Xardas tam bude také? To nemůžeš myslet vážně.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//Hele, já nejsem ten, kdo o tom rozhodoval. Vatras to tak chce.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Pořád ten Xardas, už jsem z toho unaven. Nemohlo to dopadnout hůře.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Jak mám vědět, že se Xardas nepaktuje s nepřítelem?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Ne, nemůžu Xardasovi věřit a nezáleží jak moc ho potřebujeme.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Je mi líto, ale nemohu Vatrasovi pomoct za těchto okolností.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Pyrokar_XARDASVERTRAUEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information = DIA_Pyrokar_XARDASVERTRAUEN_Info;
	description = "Bez tebe je nemožné pohnout se z místa.";
};


func int DIA_Pyrokar_XARDASVERTRAUEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_SPOKETOVATRAS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Bez tebe se neobejdeme. Vatras nebude moct uskutečnit rituál.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Budeš muset Xardasovi věřit.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Už jsem se rozhodl, rozumíš? Není žádný důkaz, že Xardas není na straně nepřítele.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//Co kdybych ti ten důkaz donesl?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//Obávám se, že to je nemožné. To by mě opravdu ohromilo.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//A velice pochybuji, že mě Xardas mile překvapí, i když je velice nevypočitatelný.
	B_LogEntry(TOPIC_INNOSEYE,"Pyrokar se bojí spolupracovat s Xardasem. Měl bych se tedy s Xardasem poradit o tom, jak Pyrokara přesvědčit k spolupráci na rituálu.");
	Pyrokar_DeniesInnosEyeRitual = TRUE;
};


instance DIA_Pyrokar_BUCHZURUECK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BUCHZURUECK_Condition;
	information = DIA_Pyrokar_BUCHZURUECK_Info;
	description = "Xardas mi pro tebe dal tuhle knihu.";
};


func int DIA_Pyrokar_BUCHZURUECK_Condition()
{
	if(Npc_HasItems(other,ItWr_XardasBookForPyrokar_Mis) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHZURUECK_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//Xardas mi pro tebe dal tuhle knihu.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//Je to důkaz o jeho důvěryhodnosti.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Ukaž.
	B_GiveInvItems(other,self,ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems(self,ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(ohromeně) To je neuvěřitelné. Máš vůbec nějaké ponětí cos mi to právě dal?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Ne.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(naštvaně) Tohle je pradávná, dlouho ztracená kniha z dávných časů.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//Všichni jsme si mysleli, že je nadobro ztracená, ale teď vidím, že Xardas celou dobu moc dobře věděl, co s ní je.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Takže, zúčastníš se rituálu?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Ano, zúčastním se. Ale rozhodně ne proto, že si myslím, že má Xardas dobré úmysly.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//Ve skutečnosti toho prašivého psa donutím, aby mi řekl kde tak dlouho tuhle knihu skrýval. Tentokrát vážně zašel příliš daleko.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Uvidíme se u kruhu Slunce.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	B_LogEntry(TOPIC_INNOSEYE,"No konečně! Pyrokar souhlasil, že se připojí k rituálu u kruhu Slunce.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};


instance DIA_Pyrokar_PRERITUAL(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_PRERITUAL_Condition;
	information = DIA_Pyrokar_PRERITUAL_Info;
	permanent = TRUE;
	description = "Myslíš, že dokážete Oko opravit?";
};


func int DIA_Pyrokar_PRERITUAL_Condition()
{
	if((Pyrokar_GoesToRitualInnosEye == TRUE) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PRERITUAL_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Myslíš, že dokážete Oko opravit?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Těžko říct. Uvidíme.
};


instance DIA_Pyrokar_AUGEGEHEILT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_AUGEGEHEILT_Condition;
	information = DIA_Pyrokar_AUGEGEHEILT_Info;
	description = "Dokázali jste to! Innosovo oko je zase v pořádku.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AUGEGEHEILT_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Dokázali jste to! Innosovo oko je zase v pořádku.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//Stále tomu nemohu uvěřit.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//Ano, mistře.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//Nejednou jsi prokázal, že jsi hoden vstoupit do řad Vyššího řádu ohně.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//A proto tě od této chvíle jmenuji členem Rady. Od teď budeš reprezentovat řád ve světě. Od teď jsi vyšší mág kruhu Ohně.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//Nos tohle roucho se ctí a přines řádu slávu a bohatství, můj bratře.
		CreateInvItem(hero,ItMW_Addon_Stab01);
		CreateInvItems(self,ItAr_KDF_H,1);
		B_GiveInvItems(self,other,ItAr_KDF_H,1);
		heroGIL_KDF2 = TRUE;
	};
};

instance DIA_Pyrokar_KAP3_READY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_KAP3_READY_Condition;
	information = DIA_Pyrokar_KAP3_READY_Info;
	description = "Co mám ještě udělat?";
};

func int DIA_Pyrokar_KAP3_READY_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Pyrokar_AUGEGEHEILT))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_READY_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Co mám ještě udělat?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Nenech se zdržovat maličkostmi - jdi a zabij draky! Zde máš Innosovo oko.
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Nezapomeň, že prvně s draky musíš promluvit, než zaútočíš.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Síla Oka draky přinutí s tebou mluvit a říct ti pravdu.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Také ti, pokud ho máš na sobě, poskytuje ochranu proti jejich útokům.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Nicméně, moc Oka nepřetrvává navždy. Musíš ho vždy znovu nabít magickou energií.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//K tomu budeš potřebovat esenci z dračího srdce, kterou spojíš s Okem pomocí alchymistické kolony.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Jedině pak budeš moci opět čelit dalšímu drakovi.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Děkuji, budu si to pamatovat.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Nyní máš vše co potřebuješ. Jdi, nemáme mnoho času.
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP(XP_Ambient);
	CreateInvItems(Gorax,ItMi_RuneBlank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_Running);
	B_LogEntry(TOPIC_DRACHENJAGD,"Nyní jsem připraven postavit se Drakům! Innosovo oko mi pomůže je porazit. Nicméně prvně bych si měl Oko nasadit a s draky promluvit než je zabiju. Je tu ale jeden problém - Oko ztrácí po každém rozhovoru s drakem svou moc a musím ho znovu nabít. K tomu potřebuji dračí srdce, laboratorní baňku, vybité Oko a alchymistickou kolonu. Až po znovunabití oka se bude moct opět postavit dalšímu drakovi.");
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_500_Pyrokar,"Start");
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	B_Chapter4_OneTime = TRUE;
	IntroduceCH_04 = TRUE;
};


instance DIA_Pyrokar_BUCHDERBESSENEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 39;
	condition = DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information = DIA_Pyrokar_BUCHDERBESSENEN_Info;
	description = "Našel jsem velice podivný almanach.";
};


func int DIA_Pyrokar_BUCHDERBESSENEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_BACKFROMOW) && Npc_HasItems(other,ITWR_DementorObsessionBook_MIS) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Našel jsem velice podivný almanach.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Vážně? Jaký almanach?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Nejsem si jistý. Myslel jsem, že snad budeš vědět ty.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//Opravdu, to je velice znepokojivé. Jsem rád, že jsi ho přinesl. To bylo velmi moudré.
	B_GivePlayerXP(XP_Ambient);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//Hádám, že jich je víc. Jdi a najdi více těchto knih zatracení.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//Domnívám se, že tohle je nástroj moci Pátračů.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Používají je k ovládání duší posednutých.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Očividně píšou jména těch, které plánují posednout do této knihy.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//Poslouchej. Dám ti tenhle magický svitek. Ukáže ti to jména, která jsou napsaná v knize.
		CreateInvItems(self,ItWr_PyrokarsObsessionList,1);
		B_GiveInvItems(self,other,ItWr_PyrokarsObsessionList,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Najdi posedlé a dones mi jejich knihy. Já se o ně postarám.
		if(Npc_IsDead(Karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Ale prvně bys měl aspoň jednu z nich ukázat Karrasovi. Možná by mu mohli pomoct s jeho studiem.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//Nepokoušej se je zničit sám. To by byla velká chyba, ještě nejsi připraven postavit se jejich moci.
		B_LogEntry(TOPIC_DEMENTOREN,"Pyrokar si přeje abych mu donesl, a on mohl poté zničit, almanachy posedlých. K tomuto účelu mi dal svitek s jmény těch, které Pátrači plánují posednout. Časem se může rozrůst o další jména.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Nepřibližuj se k Pátračům, nebo ovládnou i tebe.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	///Pokud si budeš myslet, že už jim nedokážeš odporovat přijď rychle za mnou.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Jedině zde v klášteře budeš v bezpečí.
	if((Npc_IsDead(Karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//Není možné se jejich útokům nějak ubránit?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Je. Karras by o tom mohl vědět něco víc.
		Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"Karras by mi měl pomoct s ochranou proti magickým útokům Pátračů.");
	};
};

instance DIA_Pyrokar_SCOBSESSED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 70;
	condition = DIA_Pyrokar_SCOBSESSED_Condition;
	information = DIA_Pyrokar_SCOBSESSED_Info;
	permanent = TRUE;
	description = "Vyleč mě, mistře, byl jsem proklet.";
};

func int DIA_Pyrokar_SCOBSESSED_Condition()
{
	if(SC_IsObsessed == TRUE)
	{
		return TRUE;
	};
};


var int Got_HealObsession_Day;

func void DIA_Pyrokar_SCOBSESSED_Info()
{
	if(((Got_HealObsession_Day <= (Wld_GetDay() - 2)) || (Got_HealObsession_Day == 0)) && (Npc_HasItems(other,ItPo_HealObsession_MIS) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Vyleč mě, mistře, byl jsem proklet.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//Budiž! Vem si tenhle lektvar. Zbaví tě tvých nočních můr.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Nechť je ti Innosova spása ochranou.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Jednej v jeho jménu a vyvaruj se prokletým pohledům Pátračů.
			if(SC_ObsessionTimes > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Ale pozor! Pokud budeš vystavavován jejich pohledům přílíš často, tak už ti nic nepomůže. Zapamatuj si to.
			};
			CreateInvItems(self,ItPo_HealObsession_MIS,10);
			B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
			Got_HealObsession_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Myslím, že jsem posedlý. Můžeš mě vyléčit?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//Ne bez znamení tvé úcty ke klášteru, synu. Tři sta zlatých.
			Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED,"To je příliš.",DIA_Pyrokar_SCOBSESSED_nein);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED,"Dobrá... Tady jsou.",DIA_Pyrokar_SCOBSESSED_ok);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Myslím, že jsem posedlý. Můžeš mě vyléčit?
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Vždyť jsi před chvílí lektvar dostal. Nechoď za mnou, pokud to opravdu nepotřebuješ.
	};
};

func void DIA_Pyrokar_SCOBSESSED_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Dobře, tady jsou peníze.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Zde, vypij to. Nechť je Innosův soucit tvou spásou.
		CreateInvItems(self,ItPo_HealObsession_MIS,10);
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
		Got_HealObsession_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Přines peníze a pomůžeme ti.
	};
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//To je moc.
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};


instance DIA_PYROKAR_GIVEHEALPOTIONS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 71;
	condition = dia_pyrokar_givehealpotions_condition;
	information = dia_pyrokar_givehealpotions_info;
	permanent = TRUE;
	description = "Musím získat lék na bolesti hlavy!";
};

func int dia_pyrokar_givehealpotions_condition()
{
	if(MIS_SEKTEHEILEN == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pyrokar_givehealpotions_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_00");	//Potřebuji se zbavit bolesti hlavy.
	if(FIRSTGIVEHEALPOTIONS == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_01");	//Hmmm... (naštvaně) Klášter není mastičkárna!
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_02");	//Připadá mi, že jde spíš o příznak posednutí, než o pouhou bolest hlavy.
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_03");	//Takhle... (zamyšleně) potom jsi přišel na správné místo. Máme prostředky, které tě zbaví této nemoci.
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_04");	//Myslím, že jich potřebuji spoustu.
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_05");	//To bys měl ale také zaplatit poplatek na znamení respektu klášteru.
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_06");	//A kolik?
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_07");	//Tři sta zlatých za jeden lektvar.
		FIRSTGIVEHEALPOTIONS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_08");	//Jak jsem ti již jednou řekl, stojí tři sta zlatých.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
	Info_AddChoice(dia_pyrokar_givehealpotions,"To je moc!",dia_pyrokar_givehealpotions_nein);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Dobře! Vezmu si jeden lektvar.",dia_pyrokar_givehealpotions_ok_1);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Dobře! Vezmu si pět lektvarů.",dia_pyrokar_givehealpotions_ok_5);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Dobře! Vezmu si deset lektvarů.",dia_pyrokar_givehealpotions_ok_10);
};

func void dia_pyrokar_givehealpotions_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_nein_01_00");	//To je příliš!
	AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_nein_01_01");	//Když to říkáš...
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_1()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_ok_1_01_00");	//Dobře, tak já si tedy jeden koupím.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_1_01_01");	//Tu máš. Zbaví tě tvých bolestí a nočních můr.
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_1_01_02");	//Dones poplatek a pomůžeme ti.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_5()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_ok_5_01_00");	//Vezmu si jich pět!.
	if(B_GiveInvItems(other,self,ItMi_Gold,1500))
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_5_01_01");	//Zde, vezmi si je. Zbaví tě té temné infekce.
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,5);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_5_01_02");	//Bez náležitého poplatku ti nemůžeme pomoct.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_10()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_ok_10_01_00");	//Tak já si jich vezmu deset!
	if(B_GiveInvItems(other,self,ItMi_Gold,3000))
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_10_01_01");	//Tady, vezmi si tychle lektvary. Zbaví tě té nákazy.
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_10_01_02");	//Prvně dej klášteru poplatek a poté ti pomůžeme.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};


instance DIA_Pyrokar_AlmanachBringen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Pyrokar_AlmanachBringen_Condition;
	information = DIA_Pyrokar_AlmanachBringen_Info;
	permanent = TRUE;
	description = "Můžu ti říct více o posednutí.";
};


func int DIA_Pyrokar_AlmanachBringen_Condition()
{
	if((Kapitel >= 3) && (DarkPathStart == FALSE) && (Npc_HasItems(other,ITWR_DementorObsessionBook_MIS) >= 1) && Npc_KnowsInfo(other,DIA_Pyrokar_BUCHDERBESSENEN))
	{
		return TRUE;
	};
};


var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info()
{
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//Můžu ti říct více o posednutí.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Mluv, bratře.
	PyrokarsAlmanachOffer = 400;
	AlmanachCount = Npc_HasItems(other,ITWR_DementorObsessionBook_MIS);
	if(AlmanachCount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Našel jsem další almanach.
		B_GivePlayerXP(XP_KDF_BringAlmanach);
		B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
		AlmanachCounter = AlmanachCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//Mám s sebou více almanachů Pátračů.
		B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,AlmanachCount);
		XP_KDF_BringAlmanachs = AlmanachCount * XP_KDF_BringAlmanach;
		AlmanachCounter = AlmanachCounter + AlmanachCount;
		B_GivePlayerXP(XP_KDF_BringAlmanachs);
	};
	if(AlmanachCounter <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//To je dobře. Nicméně se obávám, že jich je více.
	}
	else if(AlmanachCounter <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Našel jsi jich už mnoho, ale nemyslím si, že jsou už všechny.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//Donesl jsi mi velké množství těchto knih.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Překvapilo by mě, kdyby jich bylo ještě více.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Vem si tohle. Je to dar od kláštera za tvou pomoc. Měl by pomoct tobě proti nepříteli.
	if(DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//A nezapomeň se občas podívat do svitku.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Je možné, že se objeví další jména.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE;
	};
	AlmanachGeld = AlmanachCount * PyrokarsAlmanachOffer;
	CreateInvItems(self,ItMi_Gold,AlmanachGeld);
	B_GiveInvItems(self,other,ItMi_Gold,AlmanachGeld);
};


instance DIA_Pyrokar_KAP4_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP4_EXIT_Condition;
	information = DIA_Pyrokar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_KAP5_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP5_EXIT_Condition;
	information = DIA_Pyrokar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_DRACHENTOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DRACHENTOT_Condition;
	information = DIA_Pyrokar_DRACHENTOT_Info;
	description = "Porazil jsem všechny draky.";
};


func int DIA_Pyrokar_DRACHENTOT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//Porazil jsem všechny draky.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//To je vskutku výborná zpráva. Ale nic to nemění na téhle beznadějné situaci.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//Pátrači stále neodešli. Právě naopak. Během posledních dní mi bylo hlášeno, že se jejich počty stále zvyšují.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Zabití draků nepříteli způsobilo ránu, ale ne dostatečnou. Musíme zlo zničit i s kořeny.
};


instance DIA_Pyrokar_DERMEISTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DERMEISTER_Condition;
	information = DIA_Pyrokar_DERMEISTER_Info;
	description = "Mluvil jsem s draky.";
};


func int DIA_Pyrokar_DERMEISTER_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//Mluvil jsem s draky.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//Co říkali?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//Pořád mluvili o tom jak je jejich pán mocný, a že se usadil v Irdorathských síních.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Innos s námi. Temný chrám získal zpět svou moc a posílá své přisluhovače do našeho světa.
};


instance DIA_Pyrokar_WASISTIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WASISTIRDORATH_Condition;
	information = DIA_Pyrokar_WASISTIRDORATH_Info;
	description = "Co jsou to Irdorathské síně?";
};


func int DIA_Pyrokar_WASISTIRDORATH_Condition()
{
	if((Kapitel == 5) && Npc_KnowsInfo(other,DIA_Pyrokar_DERMEISTER))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Co jsou to Irdorathské síně?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//Beliarův chrám na východě. V celé Myrtaně jsou čtyři, ale tento je pravděpodobně ten nejhrůznější.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Asi před čtyřiceti lety byly severní a západní chrámy zničeny.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//Stateční rytíři těch časů vydali všechnu svou moc, aby ty místa nadobro zničili.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Tehdy byly nepřátelské hordy bezmocné vůči početní převaze a hrdinské odvaze rytířů a paladinů.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Bylo by snadné zničit i zbylé dva chrámy...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... ale po zničení druhého chrámu prostě zmizely.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(posměšně) Zmizely. Celé dva chrámy. Jasné.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Neposmívej se. Tohle je vážné. Jestli Irdorathské síně získali svou moc, tak nebude vůbec snadné nepřítele porazit.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//A proto bys je měl najít. Bude to tvá další a zatím nejtěžší úloha.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Uvidíme.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Irdorathské síně jsou podle Pyrokara ztracený Beliarův chrám. Měl bych tenhle chrám najít.");
};


instance DIA_Pyrokar_BUCHIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 54;
	condition = DIA_Pyrokar_BUCHIRDORATH_Condition;
	information = DIA_Pyrokar_BUCHIRDORATH_Info;
	description = "Kde je ta ztracená kniha od Xardase?";
};


func int DIA_Pyrokar_BUCHIRDORATH_Condition()
{
	if((Kapitel == 5) && (ItWr_HallsofIrdorathIsOpen == FALSE) && Npc_KnowsInfo(other,DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Kde je ta ztracená kniha od Xardase?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//Myslel jsem si, že se zeptáš. Obávám se však, že ti to nepomůže.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Je magicky zapečetěná. Ukryl jsem ji do jedné z našich podzemních skrýší. Pokoušeli jsme se ji otevřít, ale neuspěli jsme.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//To ukazuje, že Xardas si s námi zahrává.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Mohu ji vidět?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Když chceš. Nemyslím si, že uspěješ tam, kde nejmocnější mágové kláštera ne.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Ale jak chceš, zkus to. Talamon ti nebude bránit.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Xardasova kniha Irdorathské síně je ve sklepení kláštera, které ochraňuje Talamon. Mágům se nepodařilo knihu otevřít, protože je magicky zapečetěná.");
	Pyrokar_LetYouPassTalamon = TRUE;
};


instance DIA_Pyrokar_IRDORATHBOOKOPEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information = DIA_Pyrokar_IRDORATHBOOKOPEN_Info;
	description = "Otevřel jsem Xardasovu knihu.";
};


func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition()
{
	if((ItWr_HallsofIrdorathIsOpen == TRUE) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Otevřel jsem Xardasovu knihu.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Cože? Jak jsi to dokázal? Málem mě přivedla k zoufalství.
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN,"Xardas mi řekl jak ji otevřít.",DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN,"Řekl bych, že jsem měl prostě kliku.",DIA_Pyrokar_IRDORATHBOOKOPEN_glueck);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Asi prostě klika.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Nemluv nesmysly. Štěstí?!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Když ani já neuspěji v otevření této knihy a pak přijde někdo jako ty a začne si jí listovat jako by se nic nedělo...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... to mi dává podnět k zamyšlení.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//Každopádně jsi jediný kdo byl schopen knihu otevřít, tak hádám, že by ti měla být svěřena. Alespoň do té doby, než překonáme tuhle krizi.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Xardas mi řekl jak na to.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Ach, zajímavé. Jenom doufám, že tě Xardas svým špatným vlivem nezkazil.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Varuji tě. Nenech se obalamutit tím starým blázném. Mohl bys toho litovat.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};


instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;
	description = "V knize se zmiňují o tajné knihovně.";
};


func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition()
{
	if((ItWr_SCReadsHallsofIrdorath == TRUE) && (Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && Npc_KnowsInfo(other,DIA_Pyrokar_IRDORATHBOOKOPEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//V knize se zmiňují o tajné knihovně.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//Knihovna pod těmito zdmi. Nic ti to neříká?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Ne. Kde by měla tahle knihovna být?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Aha. Ty nevíš. Hmm.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Pyrokar nemá ponětí o žádné tajné knihovně. Zřejmě k ní měl přístup jen Xardas.");
};


instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;
	description = "Vím kde jsou Irdorathské síně.";
};


func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Pyrokar_IRDORATHBOOKOPEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Vím kde jsou Irdorathské síně.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//Chrám je na jednom ostrově. Našel jsem námořní mapu vedoucí k nim.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//To je úžasné. To znamená, že budeš potřebovat loď a posádku, abys mohl čelit nepříteli.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Ale nezapomeň, že musíš být absolutně připraven zahnat Pána Irdorathu.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Kde mohu najít posádku?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Tvá posádka by měla být sestavená z lidí, kterým můžeš věřit.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Promluv si s přáteli a promysli si kdo na ostrově by mohl být užitečný.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Budeš také potřebovat mága. Nicméně já nemohu v klášteře postrádat ani jednoho.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Budeš se muset zeptat mágů, kteří nejsou v klášteře.
};


instance DIA_Pyrokar_SCWILLJORGEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_SCWILLJORGEN_Condition;
	information = DIA_Pyrokar_SCWILLJORGEN_Info;
	description = "Jorgen je zkušený námořník.";
};


func int DIA_Pyrokar_SCWILLJORGEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Pyrokar_SCKNOWSWAYTOIRDORATH) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Jorgen je zkušený námořník. Mohl by mi pomoct dostat se na ostrov.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Obávám se, že to nebude tak jednoduché.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Uvázal se k práci pro bratrstvo. Také nezaplatil tribut a nedonesl nám ovci.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Jorgen musí prvně dokončit svou práci, potom si ho můžeš vzít s sebou.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Jak dlouho to potrvá?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Spotřeboval zásob za novice na tři týdny - a to během prvního dne!
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Takže dokud nebude tvrdě pracovat v zahradách aspoň tři měsíce, tak ho nemohu pustit.
};


instance DIA_Pyrokar_MACHDTFREI(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_MACHDTFREI_Condition;
	information = DIA_Pyrokar_MACHDTFREI_Info;
	description = "Co mám udělat, abych s sebou mohl vzít Jorgena?";
};


func int DIA_Pyrokar_MACHDTFREI_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_SCWILLJORGEN) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MACHDTFREI_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//Co mám udělat, abych s sebou mohl vzít Jorgena?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Hmm. Je zde jedna věc, kterou bys pro mě mohl udělat. Tvoje dobré vztahy s Xardasem by se mohli hodit.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//Všiml jsem si, že v posledních dnech se v jeho věži dějí divné věci.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Mnoho občanů v noci slyšelo hlasité výkřiky a vidělo podivné světlo vycházející z jeho věže.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Jako kdybychom neměli svých problémů dost. Jdi se podívat co se tam děje a zaraz to.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Potom s tebou Jorgena pustím.
	MIS_PyrokarClearDemonTower = LOG_Running;
	Log_CreateTopic(TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PyrokarClearDemonTower,LOG_Running);
	B_LogEntry(TOPIC_PyrokarClearDemonTower,"V Xardasově věži se dějí divné věci. Když se o to postarám, mohu s sebou vzít Jorgena.");
};


instance DIA_Pyrokar_DTCLEARED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_DTCLEARED_Condition;
	information = DIA_Pyrokar_DTCLEARED_Info;
	description = "Problémy v Xardasově věži jsou minulostí.";
};


func int DIA_Pyrokar_DTCLEARED_Condition()
{
	if(Npc_IsDead(Xardas_DT_Demon1) && Npc_IsDead(Xardas_DT_Demon2) && Npc_IsDead(Xardas_DT_Demon3) && Npc_IsDead(Xardas_DT_Demon4) && Npc_IsDead(Xardas_DT_Demon5) && Npc_IsDead(Xardas_DT_DemonLord) && (MIS_PyrokarClearDemonTower == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DTCLEARED_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Problémy v Xardasově věži jsou minulostí.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//A co se tedy děl... ne počkat, nechci to vědět.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Pokud s sebou stále chceš vzít Jorgena, tak ti nebudu bránit.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Nechť tě Innos opatruje.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_PyrokarClearDemonTower);
};


var int Pyro_Gives_Aura;

instance DIA_Pyrokar_AmulettofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_AmulettofDeath_Condition;
	information = DIA_Pyrokar_AmulettofDeath_Info;
	permanent = TRUE;
	description = "V proroctví je zmíňována jakási posvátná Innosova aura.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition()
{
	if((PlayerGetsAmulettOfDeath == TRUE) && (Pyro_Gives_Aura == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//V proroctví je zmíňována jakási posvátná Innosova aura.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Innosova aura je amulet, který mohou nosit jen ti největší mágové své doby.
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,Dialog_Back,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,"Můžu ho dostat?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,"Co je to za amulet?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

func void DIA_Pyrokar_AmulettofDeath_BAck()
{
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
};

func void DIA_Pyrokar_AmulettofDeath_CanHaveIt()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Můžu ho dostat?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//Cože? Co s ním chceš dělat?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Bojovat proti drakům.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Ano, jistě. Dám ti ten amulet, ale dobře ho opatruj.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Jasný.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Nepřeji si ho kupovat zpět od nějakého obchodníka.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//Používej ho moudře a nechť nad tebou Innos bdí.
	CreateInvItems(self,ItAm_AmulettOfDeath_Mis,1);
	B_GiveInvItems(self,other,ItAm_AmulettOfDeath_Mis,1);
	Pyro_Gives_Aura = TRUE;
};

func void DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Co je to za amulet?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//Amulet, který vykoval sám Innos a dal ho lidstvu jako dar.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Ochraňuje nositele vůči jakékoliv újmě.
};


instance DIA_Pyrokar_PotionofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_PotionofDeath_Condition;
	information = DIA_Pyrokar_PotionofDeath_Info;
	permanent = TRUE;
	description = "Co jsou to Innosovy slzy?";
};


func int DIA_Pyrokar_PotionofDeath_Condition()
{
	if(Npc_HasItems(other,ItPo_PotionOfDeath_01_Mis))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//Co jsou to Innosovy slzy?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//Innosovy slzy nejsou nic jiného, než pohádka pro děti. Vypraví o tom, jak na počátku věků začala bitva mezi Innosem a Beliarem.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Aha.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Našel jsem tenhle lektvar.",DIA_Pyrokar_PotionofDeath_Potion);
};

func void DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Aha.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Nejsem si jistý, jestli si plně uvědomuješ naši situaci, ale nemyslím si, že věříš tomu, že naši nepřátelé budou zahnáni pohádkou.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Našel jsem tenhle lektvar.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//Nemožné. Nemohu tomu uvěřit.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//Co se děje?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Jestli tohle jsou skutečně Innosovy slzy, pak...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(přeruší) To těžko.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Neskákej mi do řeči. Jestli tohle jsou skutečně Innosovy slzy, pak máme velice mocnou zbraň proti nepříteli.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,Dialog_Back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Co jsou teda ty Innosovy slzy?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Jak to myslíš, zbraň?",DIA_Pyrokar_PotionofDeath_Weapon);
};

func void DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Co jsou teda ty Innosovy slzy?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Když si Innos uvědomil, že aby zachranil svět, tak musí bojovat se svým vlastním bratrem, Beliarem, jeho smutek byl nevyslovitelný.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Začal plakat a jeho slzy padaly dolů na svět. Bylo jich mnoho, protože jeho srdce bylo tak plné zármkutku, že plakal celých 13let.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Jdi k věci.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//Lidé, kteří nalezli jeho slzy a ochutnali je, získali najednou nadpřirozenou sílu a hbitost. Poznali Innosovu moudrost a začali mu sloužit.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Byli to zakladatelé Společenstva Ohně. Slzy jim dali sílu, odvahu a moudrost. Ale to už je velice dávno. Je to více než čtvrt století, co naposledy někdo spatřil Innosovy slzy.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Jak to myslíš, zbraň?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Legenda vypráví, že pod vlivem této látky dokázali Innosovi válečníci vykonávat nadlidské úkony.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Nikdy se neunavili a sílu měli za dva medvědy.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Nejhrdinější skutky ve starých dobách byly možné jen s pomocí Innosových slz.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Zajímavé.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Ale slzy mohou také přinést utrpení a smrt. Jen členové našeho řádu se jich mohou napít.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Kdokoliv jiný - dokonce paladinové našeho Pána - v nich najde krutou smrt.
	Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
};

instance DIA_Pyrokar_KAP6_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP6_EXIT_Condition;
	information = DIA_Pyrokar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_PICKPOCKET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PICKPOCKET_Condition;
	information = DIA_Pyrokar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Pyrokar_PICKPOCKET_Condition()
{
	return C_Beklauen(108,550);
};

func void DIA_Pyrokar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,Dialog_Back,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};

func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};


instance DIA_PYROKAR_KAPITELORCATTACK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_kapitelorcattack_condition;
	information = dia_pyrokar_kapitelorcattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_kapitelorcattack_condition()
{
	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kapitelorcattack_info()
{
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_01_00");	//Chvála Innosovi!... (šťastně) Konečně ses ukázal!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_01_01");	//Začínal jsem se bát, že už se nevrátíš.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_01_02");	//Abych řekl pravdu, my jsme se vlastně nechtěli vrátit. Ale situace nás k tomu donutila.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_01_04");	//Máme velice důležité zprávy pro paladiny. A proto potřebuji co nejdříve mluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_01_08");	//(udiveně) Zprávy pro paladiny? Doufám, že dobré. Protože zatímco jste byli pryč, nám se nic dobrého nestalo.
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack,"Co se stalo?!",dia_pyrokar_kapitelorcattack_what);
};

func void dia_pyrokar_kapitelorcattack_what()
{
	PlayVideo("RET2_OrcSiege.BIK");
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_01");	//Khorinis padl! (sklíčeně) Nyní jsou tam jen skřeti.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_What_01_02");	//Jak se to mohlo stát?
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_03");	//Pár dní po vašem odjezdu jejich hordy prošly průsmykem a napadly město.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_04");	//Zpočátku ho jen obklíčily, ale další noc začly útočit.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_05");	//Ani si nedokážeme představit, co se tam dělo... Ani se nebojovalo, prostě masakr.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_07");	//Lord Hagen a jeho lidé dělali co mohli... (sklíčeně) statečně bojovali do posledního dechu, ale obrovská početní přesila skřetů byla prostě příliš velká.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_08");	//Těch pár co přežilo uteklo do pevnosti Azgan a skřeti nakonec ovládli celé město.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_What_01_09");	//Hmm... (zničeně) Situace je vážně kritická!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_12");	//A to je jen malá část toho hororu, který skřeti způsobili.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_13");	//Klášter Ohně je už delší dobu obléhán a jen Innos ví, jak dlouho to ještě vydrží.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_14");	//Všechny cesty jsou hlídány Urukskými jednotkami a většina farem je prostě zlikvidována.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_What_01_15");	//A co Onarova farma?!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_16");	//Skřeti se k ní ještě nedostali! Ale nemyslím si, že zbývá příliš času.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_17");	//Poblíž farmy rozbili obří tábor a nejspíš ji brzy vyplení.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_18");	//Poslední nadějí je pevnost Azgan, kde jsou zbylí paladinové.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_19");	//Ale už delší dobu od nich nepřišla žádná zpráva. Takže situace je o to horší.
	KAPITELORCATC = TRUE;
	MIS_ORCGREATWAR = LOG_Running;
	Log_CreateTopic(TOPIC_ORCGREATWAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCGREATWAR,LOG_Running);
	B_LogEntry(TOPIC_ORCGREATWAR,"Pyrokar mi sdělil příšerné noviny - hned po našem odjezdu na Irdorath hordy skřetů zaútočili na Khorinis. Boj byl beznadějný a tak lord Hagen zavelil k ústupu do pevnosti Azgan. Město padlo a je teď plné skřetů...");
	Log_AddEntry(TOPIC_ORCGREATWAR,"Mágové na tom také nejsou zrovna dobře - klášter už několik týdnů obléhají skřeti a nikdo neví jak dlouho ještě vydrží. Naštěstí aspoň zatím zůstala Onarova farma. Skřeti k ní sice ještě nedošli, ale rozbili poblíž tábor a pravděpodobně čekají na příležitost k útoku.");
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack,"Co teď budeme dělat?!",dia_pyrokar_kapitelorcattack_do);
};

func void dia_pyrokar_kapitelorcattack_do()
{
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_01");	//Co teď budeme dělat?!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_02");	//(zamyšleně) Zatím si nejsem jistý... ale pro začátek se musíme nějak pokusit napravit vzniklou situaci.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_07");	//Myslím, že bys měl prvně zajít za lordem Hagenem!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_11");	//Takže se vydej co nejdříve do pevnosti Azgan a zjisti jak jsou na tom.
	B_GiveInvItems(self,other,itwr_pyrorderfort,1);
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_12");	//A ještě jedna věc... (vážně)
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_13");	//Jak jsi již zjistil, město je plné skřetů, takže bude extrémně složíté se z něj dostat.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_15");	//Jsem si ale jistý, že TY to nějak zvládneš.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_16");	//Ale tvá posádka je v pasti.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_17");	//Nikdy nevíš, kdy se dostanou skřeti na loď a pak najednou... Jsou tam (vzrušeně) Myslím, že víš o čem mluvím.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_18");	//Chápu, co mám teda dělat?
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_19");	//Jediné co mě napadá, je použít teleportační runy, jestli je máš stále s sebou.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_20");	//Je to asi nejjednodušší a nejbezpečnější cesta odsud.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_99");	//Vem si tohle. To je vše co teď mám.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItMi_TeleportFarm,1);
	CreateInvItems(other,ItMi_TeleportTaverne,1);
	CreateInvItems(other,ItMi_TeleportPsicamp,1);
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_21");	//Nicméně, asi nebudou runy pro všechny, takže někteří se budou muset probojovat.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_22");	//Takže si vážně promysli, komu dáš runu.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_23");	//A také... (vážně) nesmíš jim dát runu teleportace do kláštera nebo Hornického údolí.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_24");	//Podepsal bys jím tím rozsudek smrti.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_26");	//Klášter i údolí jsou velmi dobře chráněny skřety.
	if((VATRASBACKNW == TRUE) || (MAGEBACKNW == TRUE))
	{
		if((VATRASBACKNW == TRUE) && (MAGEBACKNW == TRUE))
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_29");	//To by bylo... O Vatrase a Miltena se neboj jsou to mágové a postarají se o sebe.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_30");	//Půjdou se mnou do kláštera.
		}
		else if((VATRASBACKNW == FALSE) && (MAGEBACKNW == TRUE))
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_31");	//To by bylo... O Miltena se neboj je to mág a postará se o sebe.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_32");	//Půjde se mnou do kláštera.
		}
		else if((VATRASBACKNW == TRUE) && (MAGEBACKNW == FALSE))
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_33");	//To by bylo... O Vatrase neboj je to mág a postará se o sebe.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_34");	//Půjde se mnou do kláštera.
		};
	};
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_35");	//To by bylo... Ale měl bys promluvit s ostatními.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_36");	//Potřebovali by zvednout sebevědomí.
	if(PEDROBACKNW == TRUE)
	{
		AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_37");	//A co Pedro?
		AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_38");	//(rozčíleně) Cože?! Ten zrádce je tam s tebou?! Myslel jsem, že je mrtvý.
		AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_39");	//Našel jsem ho v jedné skřetí cele v síních Irdorathu.
		AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_40");	//(zamyšleně) Hmm... Tak to bych ho s sebou měl asi vzít do kláštera.
		AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_41");	//Tam zaplatí za svůj čin.
		if(MIS_HELPPEDRO == LOG_Running)
		{
			B_GivePlayerXP(150);
			AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_42");	//Pokus se být k němu trochu ohleduplnější.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_43");	//Proč bych měl?!
			AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_44");	//Jsem si téměř jistý, že Pedro je vlastně nevinný.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_45");	//(velice udiveně) Vážně? A proč si to myslíš?
			AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_46");	//Řeknu ti to potom, teď na to není nejvhodnější chvíle.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_47");	//(zamyšleně) Hmm... dobře. Poslechnu tě a zatím ho nepotrestám.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_48");	//Ale budeš mi potom muset dokázat jeho nevinnu.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_49");	//Jinak víš jaký trest ho v klášteře čeká.
			PEDROCANSAVE = TRUE;
			Log_AddEntry(TOPIC_HELPPEDRO,"Jak jsem slíbil tak jsem učinil. Přimluvil jsem se za Pedra u Pyrokara. Ale teď budu muset říct, proč ho považuji za nevinného a dokázat to i Pyrokarovi.");
		}
		else
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_50");	//Dál už ti nemám co říct. Snad jen... jdi a zachraň nás!
		};
	};
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_51");	//Dobře, rozumím všemu.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_52");	//Dobře. (vážně) Já jdu tedy zpět do kláštera, má přítomnost je tam potřebná.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_53");	//Takže jestli se mnou o něčem budeš potřebovat mluvit, víš kde mě najdeš.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_54");	//Nechť tě Innos ochraňuje.
	MIS_HELPCREW = LOG_Running;
	PYROKARSENTTOHAGEN = TRUE;
	Log_CreateTopic(TOPIC_HELPCREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_Running);
	B_LogEntry(TOPIC_HELPCREW,"Pyrokar mi řekl, že bych měl pomoct ostatním členům posádky dostat se ze skřety obsazeného Khorinisu. Nejlepší bude použít runové kameny, ale ne na všechny se dostane, takže někteří se budou muset pokusit městem probojovat. Měl bych si tedy vážně promyslet, komu teleportační runu dám a komu ne.");
	Log_AddEntry(TOPIC_ORCGREATWAR,"Očividně mám zase zachránit svět. Pyrokar si myslí, že já jediný jsem dostatečně silný. Doufám, že se nemýlí.");
	Log_AddEntry(TOPIC_ORCGREATWAR,"Prvně bych měl jít do pevnosti Azgan. Musím promluvit s velitelem paladinů, lordem Hagenem, o stavu jeho jednotek. Paladinové jsou asi jediní na ostrově, kdo ještě dokáže vzdorovat skřetům.");
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack,"... (KONEC)",dia_pyrokar_kapitelorcattack_away);
};

func void dia_pyrokar_kapitelorcattack_away()
{
	if((VATRASBACKNW == TRUE) || (MAGEBACKNW == TRUE))
	{
		if((VATRASBACKNW == TRUE) && (MAGEBACKNW == TRUE))
		{
			AI_Teleport(VLK_439_Vatras,"NW_MONASTERY_GRASS_VATRAS");
			AI_Teleport(PC_Mage_NW,"NW_MONASTERY_GRASS_05");
			Npc_ExchangeRoutine(VLK_439_Vatras,"OrcAtcNW");
			Npc_ExchangeRoutine(PC_Mage_NW,"OrcAtcNW");
		}
		else if((VATRASBACKNW == FALSE) && (MAGEBACKNW == TRUE))
		{
			AI_Teleport(PC_Mage_NW,"NW_MONASTERY_GRASS_05");
			Npc_ExchangeRoutine(PC_Mage_NW,"OrcAtcNW");
		}
		else if((VATRASBACKNW == TRUE) && (MAGEBACKNW == FALSE))
		{
			AI_Teleport(VLK_439_Vatras,"NW_MONASTERY_GRASS_VATRAS");
			Npc_ExchangeRoutine(VLK_439_Vatras,"OrcAtcNW");
		};
	};
	if(PEDROCANSAVE == TRUE)
	{
		AI_Teleport(NOV_600_Pedro,"NW_MONASTERY_CHAPELL_02");
		Npc_ExchangeRoutine(NOV_600_Pedro,"OrcAtcNW");
	};

	IntroduceCH_07 = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,0,0);
};


instance DIA_PYROKAR_PEDROCANSAVE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_pedrocansave_condition;
	information = dia_pyrokar_pedrocansave_info;
	permanent = FALSE;
	description = "Promluvme si o Pedrovi.";
};


func int dia_pyrokar_pedrocansave_condition()
{
	if((MIS_HELPPEDRO == LOG_Running) && (PEDROCANSAVE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_pedrocansave_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_01_00");	//Promluvme si o Pedrovi.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_01_01");	//(velice vážně) Nuže, co můžeš říct na jeho obhajobu?
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Nevím.",dia_pyrokar_pedrocansave_dontknow);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Věřím, že je nevinný.",dia_pyrokar_pedrocansave_innocent);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Dej na mé slovo že je nevinný!",dia_pyrokar_pedrocansave_trustme);
};

func void dia_pyrokar_pedrocansave_dontknow()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_DontKnow_01_00");	//Nevím.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_DontKnow_01_01");	//V tom případě své rozhodnutí nezměním.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_DontKnow_01_02");	//Novic Pedro bude potrestán za zradu a sám Innos tomu bude svědkem.
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	MIS_HELPPEDRO = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_HELPPEDRO);
};

func void dia_pyrokar_pedrocansave_trustme()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_02");	//Dej na mé slovo že je nevinný!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_03");	//Co?! (naštvaně) Jak se opovažuješ mi něco takového vůbec navrhnout?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_05");	//Je sice pravda, že většinou jsi vážně sebevědomý, ale... tohle nezná mezí! Nemáš právo rozhodovat o osudu toho zloděje a zrádce.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_06");	//Mýlíte se. Měl bych ti snad připomenout, komu se všichni odpovídáme?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_09");	//Ale teď se mi zdá, že žádáš příliš.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_10");	//Vůbec ne! Prostě jen stáhněte z Pedra všechna obvinění a nechte ho jít. To je vše co žádám.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_11");	//Jsem připraven svědčit v jeho prospěch, to nestačí?!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_12");	//Hmm... (neochotně) Dobře, když trváš na tom, že je Pedro nevinný, tak to tak je.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_13");	//Nakonec, jsi toho pro nás udělal tolik, že nemáme právo zpochybňovat jakékoliv tvé činy.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_14");	//Tak tedy zbavuji Pedra obvinění z krádeže a zrady.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPPEDRO,"Přesvědčil jsem Pyrokara, aby nechal Pedra žít tak, jak jsem mu slíbil.");
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_innocent()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_00");	//Věřím, že je nevinný.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_03");	//Myslím, že k tomu byl prostě donucen.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_04");	//Přeci jen mysl noviců není natolik silná, aby odolala vlivu temné magie Pátračů.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_08");	//Dej mu šanci, aby se vrátil ke své víře. Když ho potrestáš, tak ji ztratí nadobro.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_10");	//Máš naprostou pravdu. (vážně) Ale krádež ve společenství!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_11");	//Vážně věříš, že přihmouřím oči nad svatokrádeží?
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_12");	//To nechci, chci jen abys ho ušetřil.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_17");	//Jestli na tom trváš, tak ho tedy ušetřím.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_18");	//Nicméně, měl bys za jeho život zaplatit.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_19");	//Věřím, že malý příspěvek našemu klášteru pomůže zkrotit zášť vůči němu.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_20");	//Kolik chceš?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_21");	//(panovačně) Pět tisíc zlatých! Jsem si jistý, že to je dost.
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Nemám teď tolik zlata.",dia_pyrokar_pedrocansave_nomoney);
	Info_AddChoice(dia_pyrokar_pedrocansave,"To mi za to nestojí.",dia_pyrokar_pedrocansave_tomuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_pyrokar_pedrocansave,"Dobře, tady máš zlato.",dia_pyrokar_pedrocansave_money);
	};
};

func void dia_pyrokar_pedrocansave_nomoney()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_NoMoney_01_00");	//Teď tolik zlata nemám.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_NoMoney_01_01");	//Tak si promluvíme, až budeš mít.
	GIVEPEDROCHANCE = TRUE;
	B_LogEntry(TOPIC_HELPPEDRO,"Pyrokar souhlasil, že Pedra nechá, ale jen když dám klášteru obnos 5000 zlatých.");
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_tomuch()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_ToMuch_01_00");	//To mi za to nestojí.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_ToMuch_01_01");	//V tom případě své rozhodnutí nezměním.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_ToMuch_01_02");	//Novic Pedro bude potrestán za zradu a sám Innos tomu bude svědkem.
	MIS_HELPPEDRO = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_HELPPEDRO);
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_money()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Money_01_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Money_01_01");	//(vážně) Dobře... v tom případě přehodnocuji názor a zbavuji Pedra obvinění.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Money_01_02");	//Jen doufám, že jsem zvolil správné řešení.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPPEDRO,"Zachránil jsem Pedrovi život přesně tak, jak jsem mu slíbil. Stálo mě to 'jen' pořádnou haldu zlata.");
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};


instance DIA_PYROKAR_PEDROCANSAVEFORMONEY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_pedrocansaveformoney_condition;
	information = dia_pyrokar_pedrocansaveformoney_info;
	permanent = FALSE;
	description = "Nesu zlato za Pedra.";
};


func int dia_pyrokar_pedrocansaveformoney_condition()
{
	if((MIS_HELPPEDRO == LOG_Running) && (GIVEPEDROCHANCE == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		return TRUE;
	};
};

func void dia_pyrokar_pedrocansaveformoney_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSaveForMoney_01_00");	//Nesu zlato za Pedra.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSaveForMoney_01_03");	//Takže... (trochu udiven) v tom případě zbavuji Pedra obvinění z krádeže a zrady.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPPEDRO,"Zachránil jsem Pedrovi život přesně tak, jak jsem mu slíbil. Stálo mě to 'jen' pořádnou haldu zlata.");
};


instance DIA_PYROKAR_ABOUTGUARDIANS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_aboutguardians_condition;
	information = dia_pyrokar_aboutguardians_info;
	permanent = FALSE;
	description = "Co víš o Strážcích?";
};


func int dia_pyrokar_aboutguardians_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_aboutguardians_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AboutGuardians_01_00");	//Co víš o Strážcích?
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_01");	//Strážcích? Obávám se, že ne moc.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_02");	//A to málo co o nich vím jsou stejně nejspíš povídačky.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_04");	//(vážně) Mnozí z těch, co o Strážcích slyšeli věří, že byli vychováni samotnými bohy.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_05");	//Nicméně, jsou zde také ti, kdo si myslí, že byli stvořeni ještě mocnějšími silami, dlouho před objevením tohoto světa.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_06");	//Nevím co z toho je a není pravda. Již velice dlouhou dobu jsme o nich nic neslyšeli.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_07");	//Takže nikdo neví jestli vůbec existují, protože jsou považováni za mýtus.
};


instance DIA_PYROKAR_GUARDIANSEXISTS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_guardiansexists_condition;
	information = dia_pyrokar_guardiansexists_info;
	permanent = FALSE;
	description = "Stážci existují!";
};


func int dia_pyrokar_guardiansexists_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_aboutguardians))
	{
		return TRUE;
	};
};

func void dia_pyrokar_guardiansexists_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_00");	//Stážci existují!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_02");	//Jednoho jsem potkal v Irdorathských síních.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_03");	//(zamyšleně) Hmm... Abych byl upřímný, nevím jestli tomu mám věřit. Ještě nikdo je v našem světě neviděl.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_06");	//A co po tobě chtěl?
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_07");	//Nic zvláštního... jen mě zabít.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_08");	//Zabít?! Hmm... To je docela nečekaný vývoj událostí.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_14");	//Před tím, než mě jeho služebníci napadli, Strážce mi řekl proč jsou vlastně v tomhle světě.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_15");	//A zřejmě má přítomnost zde může přerušit jejich plány.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_16");	//(zaujatě) Jaké plány?
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_17");	//Chtějí zničit všechny bohy a společně s nimi celý svět.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_18");	//(vyděšen) Innos nás ochraňuj! Ale jak je to možné?! Proč by to vůbec dělali?!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_19");	//Strážci věří, že věčné válčení mezi Innosem a Beliarem s sebou nese jen chaos a destrukci.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_20");	//A proto chtějí ten boj ukončit, nadobro.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_21");	//Ale vážně si myslí, že je bohové nechají to udělat?!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_22");	//Obávám se, že bohové jsou teď příliš slabí, aby se ubránili moci Strážců.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_23");	//A částečně je to moje vina. Strážci mě jen využili jako svůj nástroj.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_24");	//Nevědomky jsem každým svým činem sám oslaboval jejich moc v tomhle světě
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_25");	//Takže teď už nám jen stěží pomohou.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_26");	//Ach, Innosi! To nesmí být! Kdo by řekl, že všechny naše činy se obrátí proti nám.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_27");	//Jestli je to pravda, tak jsme odsouzeni k záhubě. Bez pomoci bohů Strážce nemůžeme porazit.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_28");	//Navíc když tu jsou skřeti.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_29");	//Ano, ti zatracení skřeti... Nemůžeme se vypořádat ani s nima, natož pak s touhle hrozbou.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_30");	//To nevíš to nejlepší - Strážci vedou skřety!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_31");	//S jejich pomocí chtějí zničit lidstvo a tím ještě více oslabit vliv bohů.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_32");	//A to je důvod přoč tak moc potřebujeme pomoc paladinů.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_33");	//Cože? (zmateně) Zdá se, že se opravdu vše obrátilo proti nám a tento svět je odsouzen k záhubě...
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_34");	//Pořád se můžeme pokusit přijít na nějaké řešení!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_35");	//Máš pravdu, musíme na něco přijít, jinak nás Strážci všechny zabijí.
	B_LogEntry(TOPIC_GUARDIANS,"Mluvil jsem s Pyrokarem o mém setkání se Strážcem Dagothem na Irdorathu. Je nezbytné vymyslet nějaký způsob jak se ochránit před hrozbou Strážců.");
};

instance DIA_PYROKAR_WHATDOUS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdous_condition;
	information = dia_pyrokar_whatdous_info;
	permanent = FALSE;
	description = "Nenapadá tě, jak bychom mohli porazit Strážce?";
};

func int dia_pyrokar_whatdous_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_guardiansexists))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdous_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WhatDoUs_01_00");	//Nenapadá tě, jak bychom mohli porazit Strážce?
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_01");	//(vážně) Obávám se, že ne.
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_02");	//Jedině snad... Teď mě napadla jedna věc... Podívat se do starověkých spisů které jsou drženy v tajné knihovně kláštera.
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_03");	//Možná je tam něco co by nám mohlo pomoct.
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_04");	//Ale prostudování všech spisů bude nějaký čas trvat. Potřebuji nejméně dva dny.
	B_LogEntry(TOPIC_GUARDIANS,"Pyrokar se vydal do tajné knihovny v klášteře, aby našel v starodávných spisech něco co by nám mohlo pomoci proti Strážcům.");
	DAYDISCOVERANSWER = Wld_GetDay();
	PYROKARBEGINSEARCH = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_500_Pyrokar,"SearchAnswer");
};

instance DIA_PYROKAR_WHATDOUSNOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdousnot_condition;
	information = dia_pyrokar_whatdousnot_info;
	permanent = TRUE;
	description = "Podařílo se ti najít něco o Strážcích?";
};

func int dia_pyrokar_whatdousnot_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(((daynow - 2) >= DAYDISCOVERANSWER) && (PYROKARBEGINSEARCH == TRUE) && (GATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdousnot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WhatDoUsNot_01_00");	//Podařílo se ti najít něco o Strážcích?

	if(PYROKARMESSAGEPAL == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_01");	//(vážně) Ještě ne... vypadá to, že to bude trvat déle než jsem si myslel.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_04");	//(vážně) Ano. Objevil jsem nějaké staré spisy, ve kterých se tvrdí, že všichni Strážci mohou být poraženi.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_05");	//Tedy ne úplně poraženi, jelikož mají nesmrtelné duše. Ale můžeme je zbavit jejich moci a tím je vykázat z našeho světa.
		AI_Output(other,self,"DIA_Pyrokar_WhatDoUsNot_01_06");	//A jak to mám udělat?
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_07");	//Poslouchej pečlivě. Jak jistě víš, Strážci nepocházejí z tohoto světa. Ale co asi nevíš je, že jejich skutečným domovem jsou jisté Vakhanské síně.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_08");	//To znamená, že jejich moc není neomezená, tak jak se může zdát.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_09");	//Když Strážci opustí Síně Temnot, aby oslabili bohy, tak se jejich síla nemůže ani zdaleka měřit moci bohů.
		AI_Output(other,self,"DIA_Pyrokar_WhatDoUsNot_01_10");	//Takže bohové je mohou zničit?
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_11");	//(vážně) To je ten problém, nemohou. Za normálních okolností by mohli, ale teď je jiná situace.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_12");	//Zdá se, že brzy padnou vinou vlastní neprozíravosti, takže na jejich pomoc se spolehnout nemůžeme.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_17");	//(vážně) Třeba najdeš nějaké řešení toho všeho.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_18");	//To, že zrovna tebe si Strážci přejí zabit znamená, že jsi pro ně velká hrozba.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_19");	//Takže dokud jsi naživu, tak máme aspoň nějakou naději.
		GATHERALLONBIGFARM = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Pyrokar mi vyprávěl o všem co bylo ve starověkých spisech o Strážcích. Síla Strážců není tak velká, jak sme si mysleli... Síla bohů je plně schopná je zničit. To je důvod proč byli tak dychtiví a snažili se oslabit vliv Beliara, Adana a Innose v tomto světě. Myslím si, že útok skřetů na Khorinis s tím také souvisí. Třeba najdu odpovědi tam.");

		if(PyrokarTellAboutCreatures == TRUE)
		{
			B_LogEntry_Quiet(TOPIC_GUARDIANS,"Pyrokar mi řekl vše, co mohl najít ve starodávných spisech. Zdá se, že Strážci nejsou všemocní v našem světě, takže by je mohli bohové snadno zničit. Proto se jejich vliv na náš svět snaží co nejvíce omezit, což se jim také podařilo. Takže naší jedinou nadějí je najít nějakou jinou entitu schopnou postavit se jejich moci. Ale kde jí najít?");
		};

		Npc_ExchangeRoutine(self,"Start");
	};
};

instance DIA_PYROKAR_ORCSECRET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_PYROKAR_ORCSECRET_condition;
	information = DIA_PYROKAR_ORCSECRET_info;
	permanent = FALSE;
	description = "Lee mě poslal.";
};

func int DIA_PYROKAR_ORCSECRET_condition()
{
	if(MIS_ORCSECRET == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_PYROKAR_ORCSECRET_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_01");	//Lee mě poslal...
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_02");	//V posledním střetnutí se skřety, si všiml, že někteří z nich byli téměř nezranitelní.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_04");	//To mu dělá velké starosti, protože lidé by v takovém případě neměli šanci proti skřetům v nadcházející bitvě.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_05");	//(zamyšleně) Myslím, že všechny ty odkazy jsou jeden velký řetěz!
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_06");	//Určitě tam nebyli bez zásahu Strážců.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_07");	//Dokuď je nezníčíme, všechny naše akce jsou bezvýznamné?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_08");	//Obávám se, že ano.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_09");	//Nicméně, měli bychom pochopit, že Strážci - jsou stále božím stvořením.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_10");	//Jsou tak silní, je to marné!
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_11");	//Ale je nepravděpodobné, že by sestoupili na tento svět pomáhat těm zeleným nestvůrám.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_12");	//Oni to už udělali! Jsem si jistý, protože...
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_13");	//Možná máš pravdu. Ve skutečnosti sem přišli v touze ovládnout svět lidí.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_14");	//Ale nedává to celé moc smysl, jejich činy jsou tak nejasné.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_15");	//Koneckonců, bohové tohoto světa jsou stále příliš silní a Strážci ještě nejsou připraveni je otevřeně napadat.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_16");	//Tak jak tedy pomáhají skřetům?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_17");	//Možná, že postupují prostřednictvím svých služebníků na tomto světě... (zamyšleně) Například velcí draci z Hornického údolí.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_18");	//Magická aura obklopující tyto prastaré a mocné stvoření, že by byla schopná posílit skřety, aby se z nich stali silnější a nebezpečnější nepřátelé.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_19");	//Opět draci?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_20");	//Ty jsi to úplně nepochopil. Uvedl jsem je jen jako příklad.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_21");	//Ve skutečnosti to může být jakýkoliv jiný tvor, poslouchající vůli Strážců.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_22");	//Nicméně to je jen můj odhad. Nechtěl bych to říkat s naprostou jistotou.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_23");	//Co je to za bytosti a kde je najdu?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_24");	//Je mi líto, ale neznám odpověď na tuto otázku. Pokus se co možná nejlépe hledat jinde.
	B_LogEntry(TOPIC_ORCSECRET,"Pyrokar si myslí že Strážci pomáhají skřetům skrze nějaké silné bytosti.");
	PyrokarTellAboutCreatures = TRUE;

	if(GATHERALLONBIGFARM == TRUE)
	{
		B_LogEntry_Quiet(TOPIC_GUARDIANS,"Snad jediná šance, jak překonat Strážce - pokusit se najít nějaké božstvo, které má tu moc jim odolat.");
	};
};

instance DIA_PYROKAR_GATHERALLONBIGFARMTWO(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_gatherallonbigfarmtwo_condition;
	information = dia_pyrokar_gatherallonbigfarmtwo_info;
	permanent = FALSE;
	description = "Mám pro tebe noviny.";
};

func int dia_pyrokar_gatherallonbigfarmtwo_condition()
{
	if(HAGENNOMORETIMEWAIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_gatherallonbigfarmtwo_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_00");	//Mám pro tebe noviny.
	AI_Output(other,self,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_02");	//Paladinové jsou připraveni postavit se skřetům v Khorinisu. Hagenovi lidé postavili tábor u Onarovi farmy a doufájí, že se k nim připojíš.
	AI_Output(self,other,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_03");	//Proč se tak rozhodl?
	AI_Output(other,self,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_04");	//Podle něj se skřeti připravují k útoku na tuto farmu. A proto se rozhodl, že jim tam přichystá překvapení.
	AI_Output(self,other,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_05");	//Dobře! Uvidíme se tedy na farmě.
	PYROKARMESSAGEPAL = TRUE;
};


instance DIA_PYROKAR_TELLTOHAGENFORT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_telltohagenfort_condition;
	information = dia_pyrokar_telltohagenfort_info;
	permanent = FALSE;
	description = "Mluvil jsem s Hagenem.";
};


func int dia_pyrokar_telltohagenfort_condition()
{
	if((KAPITELORCATC == TRUE) && (TELLTOHAGENFORT == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_telltohagenfort_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_TellToHagenFort_01_00");	//Mluvil jsem s Hagenem.
	AI_Output(self,other,"DIA_Pyrokar_TellToHagenFort_01_01");	//A co říkal? Jak hodnotí tuhle situaci?
	AI_Output(other,self,"DIA_Pyrokar_TellToHagenFort_01_02");	//Myslí si, že situace by nemohla být horší! Když bránili město proti skřetům tak měli obrovské ztráty.
	AI_Output(other,self,"DIA_Pyrokar_TellToHagenFort_01_03");	//Proto zůstane v pevnosti, dokud nevymyslí nějaký plán na protiútok.
	AI_Output(self,other,"DIA_Pyrokar_TellToHagenFort_01_12");	//(zoufale) No dobře. Doufám, že si toho je vědom. Ostatně je to vůdce paladinů, snad to nějak vyřeší.
};


instance DIA_PYROKAR_KDFANSWER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_kdfanswer_condition;
	information = dia_pyrokar_kdfanswer_info;
	permanent = FALSE;
	description = "Paladinové potřebují tvou pomoc.";
};


func int dia_pyrokar_kdfanswer_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (KDF_JOINHAGEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kdfanswer_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_KDFAnswer_01_00");	//Paladinové potřebují tvou pomoc.
	AI_Output(other,self,"DIA_Pyrokar_KDFAnswer_01_02");	//Lord Hagen sbírá všechny bojeschopné pod svou vlajku a plánuje zaútočit na skřety.
	AI_Output(self,other,"DIA_Pyrokar_KDFAnswer_01_03");	//To je dobré slyšet. (vážně) Musíme ho podpořit v tomhle boji s těmi bestiemi.
	AI_Output(self,other,"DIA_Pyrokar_KDFAnswer_01_04");	//Nicméně, nesmíme zapomenout na náš hlavní problém - Strážce.
	AI_Output(self,other,"DIA_Pyrokar_KDFAnswer_01_05");	//A proto musíš prvně vyřešit tenhle problém, jinak bude boj se skřety zbytečný.
	KDF_JOINHAGEN = TRUE;
	Log_AddEntry(TOPIC_ORCGREATWAR,"Mágové Ohně podpoří paladiny v boji proti skřetům.");
};


instance DIA_PYROKAR_STRANGETHINGS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_strangethings_condition;
	information = dia_pyrokar_strangethings_info;
	permanent = FALSE;
	description = "Začali se dít podívné věci...";
};


func int dia_pyrokar_strangethings_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_guardiansexists) && (MIS_STRANGETHINGS == LOG_Running) && (GUARDIANSISDEFEATED == FALSE) && ((FIRSTLOOKONTOTEM == TRUE) || (FIRSTSTRIKEME == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_strangethings_info()
{
	AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_00");	//Začali se dít podívné věci...
	AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_01");	//Co tím myslíš?

	if((FIRSTLOOKONTOTEM == TRUE) && (FIRSTSTRIKEME == TRUE))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_02");	//Když jsem cestoval po ostřově, objevil jsem podivnou obří sochu.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_03");	//Jsem si jistý, že jsem ji nikdy předtím neviděl.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_04");	//(zamyšleně) Hmm... To je vskutku zvláštní, nedaleko kláštera se také jedna objevila.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_05");	//Zdálo se mi, že vyzařuje podivnou magickou energii, z které jsem byl trochu nesvůj.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_06");	//Nevíš co by to mohlo znamenat?
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_07");	//Obávám se, že ne. (starostlivě) Ale měl by ses od nich držet dál! Alespoň dokud nebude jasné, co je to za magii, kterou vyzařují.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_08");	//Myslím si, že je to práce Strážců. A proto bys s těmito sochami neměl za žádnou cenu komunikovat.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_09");	//Dobře... ale to není vše.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_10");	//Nedávno, když jsem se pokusil zabít skřeta, jako by do mě uhodil blesk. Málem mě to zabilo.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_12");	//Hmm... (zamyšleně) To je velice nepředvídatelné. Ale asi tomu začínám rozumět.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_15");	//Myslím si, že ty sochy, které jsi viděl jsou ve skutečnosti jakési ochrané totemy pro skřety.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_16");	//A očividně, když jsou jim skřeti poblíž, tak jsou prakticky neporazitelní.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_17");	//Ale jelikož skřeti nejsou schopni ovládat tak silné magické schopnosti, je zde jen jedna možnost - Pomáhají jim Strážci.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_20");	//Teď je naše jediná šance, jak porazit skřety, zbavit je podpory Strážců.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_23");	//Ještě jedna věc! Neznáme dosah těchto podpůrných soch.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_24");	//Takže by ses měl asi vyhýbat větším skupinám skřetů... mohlo by ti to zachránit život.
		MIS_STRANGETHINGS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
	}
	else
	{
		if(FIRSTLOOKONTOTEM == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_27");	//Když jsem cestoval po ostřově, objevil jsem podivnou obří sochu.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_28");	//Jsem si jistý, že jsem ji nikdy před tím neviděl.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_29");	//(zamyšleně) Hmm... To je vskutku zvláštní, nedaleko kláštera se také jedna objevila.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_30");	//Zdálo se mi, že vyzařuje podivnou magickou energii, z které jsem byl trochu nesvůj.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_31");	//Nevíš co by to mohlo znamenat?
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_32");	//Obávám se, že ne. (starostlivě) Ale měl by ses od nich držet dál! Alespoň dokud nebude jasné, co je to za magii, kterou vyzařují.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_33");	//Myslím si, že je to práce Strážců. A proto bys s těmito sochami neměl za žádnou cenu komunikovat.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_34");	//Dobře.
			STRIKENODISCOVER = TRUE;
			B_LogEntry(TOPIC_STRANGETHINGS,"Řekl jsem Pyrokarovi o prapodivných sochách, které se objevily na ostrově. Poradil mi, abych se od nich držel dál, protože si myslí, že jde o práci Strážců. Hlavně bych se s nimi neměl snažit komunikovat, protože nevíme co za pradávnou magii vyzařují.");
		};
		if(FIRSTSTRIKEME == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_35");	//Nedávno, když jsem se pokusil zabít skřeta, jako by do mě uhodil blesk. Málem mě to zabilo.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_37");	//To se mi zrovna dvakrát nelíbí.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_38");	//Měl by ses nejspíš držet od skřetů dál.
			B_LogEntry(TOPIC_STRANGETHINGS,"Zmínil jsem se Pyrokarovi o podivném výboji, který mnou prošel, když jsem se pokusil zaútočit na skřeta. Poradil mi, abych se jim zatím vyhýbal.");
		};
	};
};

instance DIA_PYROKAR_STRANGETHINGSAGAIN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_strangethingsagain_condition;
	information = dia_pyrokar_strangethingsagain_info;
	permanent = FALSE;
	description = "Co se těch divných věcí týče...";
};

func int dia_pyrokar_strangethingsagain_condition()
{
	if((MIS_STRANGETHINGS == LOG_Running) && (FIRSTLOOKONTOTEM == TRUE) && (FIRSTSTRIKEME == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_strangethings) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_strangethingsagain_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_00");	//Co se těch divných věcí týče...
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_01");	//(zaujatě) Ano?
	if(STRIKENODISCOVER == TRUE)
	{
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_02");	//Nedávno, když jsem se pokusil zabít skřeta, jako by do mě uhodil blesk. Málem mě to zabilo.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_04");	//Hmm... (zamyšleně) To je velice nepředvídatelné. Ale asi tomu začínám rozumět.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_06");	//A když jsem cestoval po ostrově, objevil jsem podivnou obří sochu.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_07");	//Jsem si jistý, že jsem ji nikdy předtím neviděl.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_08");	//(zamyšleně) Hmm... To je vskutku zvláštní, nedaleko kláštera se také jedna objevila.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_09");	//Zdálo se mi, že vyzařuje podivnou magickou energii, z které jsem byl trochu nesvůj.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_10");	//(zamyšleně) V tom případě tomu asi začínám rozumět.
	};
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_13");	//Myslím si, že ty sochy, které jsi viděl, jsou ve skutečnosti jakési ochranné totemy pro skřety.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_14");	//A očividně, když jsou jim skřeti poblíž, tak jsem prakticky neporazitelní.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_15");	//Ale jelikož skřeti nejsou schopni ovládat tak silné magické schopnosti, je zde jen jedna možnost - Pomáhají jim Strážci.
	AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_16");	//Jak se s tím vypořádáme?
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_18");	//Je jasné, že skřety musíme nějak připravit o podporu od Strážců, jinak nebudeme mít šanci je porazit.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_21");	//Teď je naše jediná šance, jak porazit skřety, zbavit je podpory Strážců.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_22");	//Takže by ses měl asi vyhýbat větším skupinám skřetů... mohlo by ti to zachránit život.
	MIS_STRANGETHINGS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
};

instance DIA_PYROKAR_TRANSENERGY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_transenergy_condition;
	information = dia_pyrokar_transenergy_info;
	permanent = FALSE;
	description = "Potřebuji tvou pomoc.";
};

func int dia_pyrokar_transenergy_condition()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_transenergy_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_TransEnergy_01_00");	//Potřebuji tvou pomoc.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_01");	//(udiven) S čím?
	AI_Output(other,self,"DIA_Pyrokar_TransEnergy_01_02");	//Potřebuji svitek, který dokáže přenést magickou energii z jedné věci na druhou.
	AI_Output(other,self,"DIA_Pyrokar_TransEnergy_01_03");	//Mohl bys mi něco takového vyrobit?
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_04");	//(zamyšleně) Hmm... myslím, že... Ano, asi ano. Nebude to jednoduché, ale zvládnu to.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_07");	//Dobrá tedy. Ale bude to chvíli trvat.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_12");	//Formule k tomuto kouzlu je natolik složitá, že musím mít vše předem bezchybně vypočítáno. Kdyby tomu tak nebylo, následky by byly otřesné.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_15");	//Dobře, přijdi tedy za tři dny a vše bude hotovo.
	TRANSENERGYDAY = Wld_GetDay();
	B_LogEntry(TOPIC_GUARDIANS,"Požádal jsem Pyrokara o vytvoření svitku, který přenese energii z artefaktů do rudné zbraně. Pro tak zkušeného mága to není příliš složité, nicméně je to zdlouhavé. Musím počkat minimálně tři dny.");
	AI_StopProcessInfos(self);
};

instance DIA_PYROKAR_TRANSENERGYDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_transenergydone_condition;
	information = dia_pyrokar_transenergydone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pyrokar_transenergydone_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((daynow > TRANSENERGYDAY) && (NETBEKLEADME_STEP2DONE == FALSE) && (Npc_KnowsInfo(other,dia_pyrokar_transenergy) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_transenergydone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Pyrokar_TransEnergyDone_01_00");	//Dobře, že jsi přišel. Svitek je hotov.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergyDone_01_01");	//Tady, vezmi si ho. Ale nezapomeň, musíš ho použít správně.
	B_GiveInvItems(self,other,itwr_transferenergy,1);
};


instance DIA_PYROKAR_RUNEMAGIC(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagic_condition;
	information = dia_pyrokar_runemagic_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pyrokar_runemagic_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (ORCSWINSBB == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagic_info()
{
	AI_Output(self,other,"DIA_Pyrokar_RuneMagic_01_00");	//(šťastně) Díky Innosovi, jsi naživu!
	AI_Output(self,other,"DIA_Pyrokar_RuneMagic_01_01");	//Začínal jsem se bát, že tě skřeti dostali.
	AI_Output(other,self,"DIA_Pyrokar_RuneMagic_01_02");	//Ne, jsem v pořádku.

 	if(HERONOTJOINBIGBATTLE == FALSE)
	{
		AI_Output(other,self,"DIA_Pyrokar_RuneMagic_01_03");	//Mimochodem, právě jsme pozabíjeli obrovskou armádu skřetů.
	};

	AI_Output(other,self,"DIA_Pyrokar_RuneMagic_01_04");	//A to není vše.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagic_01_06");	//Jaké další zrávy pro mě máš?
};

instance DIA_PYROKAR_GUARDIANSKILLED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_guardianskilled_condition;
	information = dia_pyrokar_guardianskilled_info;
	permanent = FALSE;
	description = "Hrozba Strážců byla zvrácena!";
};

func int dia_pyrokar_guardianskilled_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (ORCSWINSBB == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_guardianskilled_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pyrokar_GuardiansKilled_01_00");	//Hrozba Strážců byla zvrácena!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_01");	//(opravdu velmi udiveně) Co... co tím myslíš?
	AI_Output(other,self,"DIA_Pyrokar_GuardiansKilled_01_02");	//To, že je mohu vykázat z našeho světa.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_03");	//Ó, Innosi! (neví co říct) Myslíš to vážně?
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_05");	//To je ta nejlepší zpráva, kterou jsem kdy slyšel!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_11");	//Důležité je, že jsi nás zachránil. Vlastně jsi zachránil celý svět.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_12");	//Proto prosím přijmi mé nejhlubší díky za všechno co jsi pro nás udělal.
};

instance DIA_PYROKAR_LOOKUNUSUAL(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_lookunusual_condition;
	information = dia_pyrokar_lookunusual_info;
	permanent = FALSE;
	description = "Tváříš se nějak zvláštně.";
};

func int dia_pyrokar_lookunusual_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_guardianskilled))
	{
		return TRUE;
	};
};

func void dia_pyrokar_lookunusual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_00");	//Tváříš se nějak zvláštně.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_04");	//Zkrátka se mi zdá, že se od posledně, co jsme spolu mluvili, něco změnilo. Něco v tobě.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_05");	//Najednou se mi zdá, že je v tobě neskutečná moc, která tam předtím nebyla.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_06");	//Jako... jako kdybys v sobě nebyl jen ty, ale i (nevěřícně) sám Innos.
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_07");	//Zdá se, že ti nic neunikne.
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_08");	//Ano, bohové mi darovali moc, abych mohl porazit naše nepřátele.
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_09");	//Všichni.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_10");	//Dokonce i Beliar, Temný bůh?!
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_12");	//Nemožné. (ohromeně) Nikdy jsem si nemyslel, že se může něco takového stát.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_16");	//Bohové z tebe udělali VYVOLENÉHO jako ochránce jejich světa a ty jsi zažehnal zlo.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_17");	//Nemohli zvolit lépe.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_19");	//A proto si před tebou opět musím kleknout na kolena, náš hrdino.
};

instance DIA_PYROKAR_WHATDO(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdo_condition;
	information = dia_pyrokar_whatdo_info;
	permanent = FALSE;
	description = "Co budeš dělat?";
};

func int dia_pyrokar_whatdo_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (MONASTERYISFREE == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_guardianskilled))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdo_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_01_00");	//Co budeš dělat?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_01_01");	//Spolu s ostatními přeživšími mágy se vrátím do kláštera.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_01_02");	//Stále ho obléhají skřeti, takže ho nebudeme moct delší dobu opustit.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_01_03");	//Novicové, kteří tam zůstali, nebudou schopní skřetům vzdorovat, jestli se rozhodnou zaútočit.
	RUNEMAGICNOTWORK = TRUE;
	Info_ClearChoices(dia_pyrokar_whatdo);
	Info_AddChoice(dia_pyrokar_whatdo,"... (KONEC)",dia_pyrokar_whatdo_away);
};

func void dia_pyrokar_whatdo_away()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_00");	//Zatraceně! Co se to děje?! (velice zmatený) Nerozumím tomu!
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_02");	//Teleportační runa - zkrátka nefunguje!
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_03");	//Jak, nefunguje?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_04");	//Před několika vteřinami jsem se měl objevit v klášteře, ale nestalo se tak.
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_08");	//Tak to zkus znova. Třeba to už půjde.
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_10");	//Ne, nic se neděje! (zmateně) Jak je to vůbec možné?
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_12");	//Co ostatní runy, fungují?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_13");	//(zamyšleně) Počkej, zkusím to.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_14");	//Ne! Nemohu používat runovou magii.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_15");	//Zdá se, že ztratili svou moc... (zmateně) Ale jak je to možné?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_17");	//(nervózně) Ach, Innosi! To nám tak scházelo.
	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_18");	//Bez run nebudeme schopni zachránit klášter před skřety.
	};
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_19");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_20");	//(vážně) Bedlivě poslouchej. Najdi ostatní mágy a zjisti, jestli jejich runy fungují.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_21");	//Zeptej se také paladinů. Musíme co nejdřív zjistit, co se to děje.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_24");	//Jdi!
	MIS_RUNEMAGICNOTWORK = LOG_Running;
	Log_CreateTopic(TOPIC_RUNEMAGICNOTWORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNEMAGICNOTWORK,LOG_Running);
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Něco je špatně! Pyrokar nemůže používat magické runy. Použil několik run, ale žádná nefungovala. Musím co nejdříve zjistit, jestli jsou na tom paladinové a zbylí mágové stejně.");
	AI_StopProcessInfos(self);
};


var int frdnw;
var int wrdnw;
var int grdnw;
var int prdnw;

instance DIA_PYROKAR_RUNEMAGICNOTWORKDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicnotworkdone_condition;
	information = dia_pyrokar_runemagicnotworkdone_info;
	permanent = TRUE;
	description = "Mám noviny o runové magii.";
};


func int dia_pyrokar_runemagicnotworkdone_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == FALSE) && ((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicnotworkdone_info()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_01_00");	//Mám noviny o runové magii.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_01_01");	//(netrpělivě) Co jsi zjistil?! Mluv!
	Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
	if((FIREMAGERUNESNOT == TRUE) && (FRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Ostatní mágové Ohně také nemohou používat runy.",dia_pyrokar_runemagicnotworkdone_fire);
	};
	if((WATERMAGERUNESNOT == TRUE) && (WRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Mágové Vody také již nadále nemohou kouzlit.",dia_pyrokar_runemagicnotworkdone_water);
	};
	if((GURUMAGERUNESNOT == TRUE) && (GRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Guru Bratrstva také nedokážou vytvářet žádná kouzla pomocí run.",dia_pyrokar_runemagicnotworkdone_guru);
	};
	if((PALADINRUNESNOT == TRUE) && (PRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Runy paladinů také nefungují!",dia_pyrokar_runemagicnotworkdone_paladin);
	};
	Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"To je zatím vše.",dia_pyrokar_runemagicnotworkdone_no);
};

func void dia_pyrokar_runemagicnotworkdone_fire()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Fire_01_00");	//Ostatní mágové Ohně také nemohou používat runy.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Fire_01_01");	//Hmm... (zamyšleně) toho jsem se obával. Ještě něco?
	FRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_water()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Water_01_00");	//Mágové Vody také již nadále nemohou kouzlit.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Water_01_01");	//To je velice podivné... Zjistil jsi ještě něco?
	WRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_guru()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Guru_01_00");	//Guru Bratrstva také nedokážou vytvářet žádná kouzla pomocí run.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Guru_01_01");	//I oni? Co dál?
	GRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_paladin()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_00");	//Runy paladinů také nefungují.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_01");	//Myslel jsem si to... (zamyšleně) zdá se, že máme vážný problém.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_02");	//To je vše?
	PRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_no()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_00");	//Zatím vše.
	if((FRDNW == TRUE) && (WRDNW == TRUE) && (GRDNW == TRUE) && (PRDNW == TRUE))
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_01");	//(vážně) Myslím, že to stačí.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_02");	//Asi vím, co se stalo.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_03");	//Ale prvně si musím být jistý...
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_04");	//... takže musíš udělat ještě jednu věc.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_06");	//Měl bys zkusit, jestli můžeš použít runu ty.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_07");	//A potom mi říct, jak to dopadlo.
		ALLMAGESRUNEMAGICNOTWORK = TRUE;
		if(TESTRUNEME == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_08");	//Už jsem to zkusil.
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_09");	//A?
			AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_10");	//Mohu stále používat runovou magii.
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_11");	//Tak je mi to jasné.
			KNOWNHOWDESTROYRUNE = TRUE;
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Řekl jsem Pyrokarovi vše co jsem mohl zjistil. Také jsem mu řekl, že já magii používat mohu. Vypadá to, že na něco přišel.");
			Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
		}
		else
		{
			B_GivePlayerXP(100);
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Řekl jsem Pyrokarovi vše co jsem mohl zjistil. Nicméně po mně chce abych ještě já sám vyzkoušel nějakou runu a poté ho informoval o výsledku.");
			AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_12");	//Dobře, zkusím to.
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_13");	//Budu čekat.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_14");	//To nestačí. Zjisti toho víc.
	};
	Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
};


instance DIA_PYROKAR_RUNEMAGICNOTWORKDONEAFTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicnotworkdoneafter_condition;
	information = dia_pyrokar_runemagicnotworkdoneafter_info;
	permanent = FALSE;
	description = "Dej mi nějakou runu.";
};


func int dia_pyrokar_runemagicnotworkdoneafter_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == TRUE) && (TESTRUNEME == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicnotworkdoneafter_info()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_00");	//Dej mi nějakou runu.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_01");	//(udiveně) Vždyť jsi mág! Věřím, že u sebe nějakou máš.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_03");	//(zamyšleně) Hmm... Vem si tuhle.
		B_GiveInvItems(self,other,ItRu_Light_Pyr,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNEMAGICTESTMERESULT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagictestmeresult_condition;
	information = dia_pyrokar_runemagictestmeresult_info;
	permanent = FALSE;
	description = "Udělal jsem oč jsi žádal.";
};


func int dia_pyrokar_runemagictestmeresult_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == TRUE) && (TESTRUNEME == TRUE) && (KNOWNHOWDESTROYRUNE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagictestmeresult_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicTestMeResult_01_00");	//Udělal jsem oč jsi žádal.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicTestMeResult_01_01");	//A?
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicTestMeResult_01_02");	//Pořád mohu ovládat runou magii.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicTestMeResult_01_03");	//To jsem si myslel. Teď je mi to jasné.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Řekl jsem Pyrokarovi, že stále mohu využívat runovou magii. Vypadá to, že na něco přišel.");
	KNOWNHOWDESTROYRUNE = TRUE;
};


instance DIA_PYROKAR_RUNEMAGICEXPLAIN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicexplain_condition;
	information = dia_pyrokar_runemagicexplain_info;
	permanent = FALSE;
	description = "Co se tedy stalo?";
};


func int dia_pyrokar_runemagicexplain_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (KNOWNHOWDESTROYRUNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicexplain_info()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicExplain_01_00");	//Co se tedy stalo?
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicExplain_01_01");	//Proč už nemůžeš ovládat runovou magii?
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_02");	//Protože už neexistuje. Tedy ne taková, jakou jsme znali.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_03");	//Obávám se, že je to zčásti tvá vina.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_05");	//Hmm... (zamyšleně) Věřím, že to souvisí s mocí, kterou ti dali bohové.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_06");	//Myslím, že ti jí dali příliš a proto teď nemohou poskytovat moc runám.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_07");	//Spojení struktury magie mezi bohy a člověkem bylo velice křehké a nestabilní.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_08");	//A nějaký malý magický výboj ji nakonec uplně zničil.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_11");	//Myslím že to souvisí s tím, že jsi vyhnal Strážce z našeho světa.
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicExplain_01_13");	//Ale jak to, že já runy používat můžu?
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_14");	//To je jednoduché. Máš v sobě neuvěřitelnou moc.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_15");	//Tvé spojení s bohy je ohromně silné.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_16");	//Takže stále můžeš používat magické runy.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_23");	//Ještě něco než odejdeš. Prosím, informuj lorda Hagena, že runová magie byla zničena.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_24");	//Určitě to bude pro něj těžké přijmout, ale vůdce paladinů by o tom vědět měl.
	MIS_RUNEMAGICNOTWORK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUNEMAGICNOTWORK,LOG_SUCCESS);
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Podle Pyrokara to, že jsem dostal od bohů takovou moc, oslabilo pouto mezi nimi a ostatními lidmi natolik, že téměř cokoliv by zničilo runovou magii. Nakonec byla magie zničena vyhnáním Strážců z našeho světa.");
	if(MONASTERYISFREE == TRUE)
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_MONASTERYSIEDGE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_monasterysiedge_condition;
	information = dia_pyrokar_monasterysiedge_info;
	permanent = FALSE;
	description = "Jak se vrátíš do kláštera?";
};


func int dia_pyrokar_monasterysiedge_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_SUCCESS) && (MONASTERYISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_monasterysiedge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedge_01_00");	//Jak se vrátíš do kláštera?
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_01");	//(nervózně) Ano, to je problém. Bez magie se tam nedostaneme.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_02");	//Skřeti ho stále obléhají ze všech stran.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_03");	//Bez mágů nebude klášter moci vzdorovat.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_04");	//(zoufale) Ach, Innosi! Co jen bude se všemi novici?
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedge_01_05");	//Co budeme tedy dělat?
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_06");	//(zoufale) Já nevím... sami to neubrání.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_07");	//Můžeš jim pomoct jen ty!
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_09");	//(vážně) Ano, ty jakožto vyvolený bohů jsi jediný, kdo se může skřetům postavit.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_10");	//Naštěstí ztratili podporu Strážců.
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedge_01_14");	//Dobře, udělám to.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_15");	//V tom případě spěchej! Každá minuta je vzácná.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_18");	//(s nadějí) Doufám, že uspěješ můj synu. Nechť tě Innos opatruje.
	MIS_MONASTERYSIEDGE = LOG_Running;
	Log_CreateTopic(TOPIC_MONASTERYSIEDGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_Running);
	B_LogEntry(TOPIC_MONASTERYSIEDGE,"Poté co mágové ztratili svou moc mě Pyrokar požádal o záchranu kláštera. Takže se teď musím vypořádat s armádou skřetů, která ho obléhá.");
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MONASTERYSIEDGEDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_monasterysiedgedone_condition;
	information = dia_pyrokar_monasterysiedgedone_info;
	permanent = FALSE;
	description = "Obléhání skončilo.";
};


func int dia_pyrokar_monasterysiedgedone_condition()
{
	if((MONASTERYISFREE == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_monasterysiedgedone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedgeDone_01_00");	//Obléhání skončilo.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedgeDone_01_02");	//Chvála Innosovi! Jsem tak rád, že jsi to dokázal.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedgeDone_01_03");	//Teď, když nic neohrožuje novice, se tam co nejrychleji vydám.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedgeDone_01_04");	//(vděčně) Děkuji ti, můj synu. Za vše co jsi pro nás udělal. Nikdy to nezapomeneme.
	if((MIS_RUNEMAGICNOTWORK == FALSE) && (RUNEMAGICNOTWORK == FALSE))
	{
		RUNEMAGICNOTWORK = TRUE;
		Info_ClearChoices(dia_pyrokar_monasterysiedgedone);
		Info_AddChoice(dia_pyrokar_monasterysiedgedone,"... (KONEC)",dia_pyrokar_whatdo_away);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_ALLGREATVICTORY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_allgreatvictory_condition;
	information = dia_pyrokar_allgreatvictory_info;
	permanent = FALSE;
	description = "Zbavil jsem Khorinis všech skřetů!";
};


func int dia_pyrokar_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_allgreatvictory_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_AllGreatVictory_01_00");	//Zbavil jsem Khorinis všech skřetů.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_03");	//(usmívá se) Úchvatná novina, synu. Nikdy jsem o tobě nepochyboval.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_04");	//Celý ostrov ti je vděčný za vše, co jsi pro nás vykonal.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_05");	//Ukázal jsi nám, že i malý člověk je schopen velkých činů a dal jsi nám naději, že zvítězíme tuhle dlouhou a krvavou válku.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_07");	//(s úctou) Ještě jednou ti děkujeme. Nechť nad tebou Innos nikdy nepřihmouří oči.
	if((MIS_RUNEMAGICNOTWORK == FALSE) && (RUNEMAGICNOTWORK == FALSE))
	{
		RUNEMAGICNOTWORK = TRUE;
		Info_ClearChoices(dia_pyrokar_allgreatvictory);
		Info_AddChoice(dia_pyrokar_allgreatvictory,"... (KONEC)",dia_pyrokar_whatdo_away);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_BELIARCURSE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_beliarcurse_condition;
	information = dia_pyrokar_beliarcurse_info;
	permanent = FALSE;
	description = "Beliar mě proklel!";
};


func int dia_pyrokar_beliarcurse_condition()
{
	if((MIS_BELIARCURSE == LOG_Running) && (BELIARCURSEYOU == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_beliarcurse_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_BeliarCurse_01_00");	//Beliar mě proklel! Můžeš mi pomoct?
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_01");	//Cože? (zamyšleně) To není dobré.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_02");	//Bojím se, čeho by byl Beliar schopen, kdyby tě ovládl.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_03");	//Jakožto Innosův služebník tě musím uzdravit.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_05");	//Potřebuješ Innosovo požehnání, aby ses toho prokletí zbavil.
	AI_Output(other,self,"DIA_Pyrokar_BeliarCurse_01_06");	//A ty mi požehnat nemůžeš?
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_07");	//(vážně) Ne. Jen samotný Innos tě může zbavit toho prokletí. Já jsem v tomhle ohledu bezmocný.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_08");	//Takže jdi a pomodli se u některého z jeho svatyň.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_09");	//Modli se do té doby, dokud ti Innos nepožehná.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_12");	//Myslím, že se budeš muset modlit mnoho dní a nocí než ti požehná.
	AI_Output(other,self,"DIA_Pyrokar_BeliarCurse_01_14");	//Dobře, budu se modlit.
	B_LogEntry(TOPIC_BELIARCURSE,"Nejvyšší mág kruhu Ohně mi řekl, že abych se zbavil prokletí potřebuji požehnání od samotného Innose. Ten mi ale prý nedá požehnání hned, takže se budu muset delší dobu modlit u jeho svatyní.");
	PYRIKARSENDALTAR = TRUE;
};


instance DIA_Pyrokar_IgaranzNew(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_IgaranzNew_condition;
	information = DIA_Pyrokar_IgaranzNew_info;
	permanent = FALSE;
	description = "Novici Igarazovi bylo určeno, aby se stal mágem Ohně.";
};

func int DIA_Pyrokar_IgaranzNew_condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && (IgarazIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IgaranzNew_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Pyrokar_IgaranzNew_01_01");	//Novic Igaraz je plně rozhodnut stát se mágem Ohně.
	AI_Output(other,self,"DIA_Pyrokar_IgaranzNew_01_02");	//Já věřím, že je hodný toho aby dostal ještě jednu šanci.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_03");	//(zamyšleně) Igaraz? Možná je hodný... no já teď na to nemám čas.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_04");	//Jen ve výjimečných situacích se může opakovat zkouška!
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_05");	//V takových případech novic musí přesvědčit čtvrtého člena rady - strážce klášterních sklepení.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_06");	//Jak ty už nejspíš pochopil, mluvím o Talamonovi. K němu se obrať!
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_07");	//Teď jdi, víc už mě nevyrušuj takovýma maličkostima.
	IS_PYROKAR_IGORANZINFO = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Pyrokar souhlasil provést zkoušku pro Igaraze ještě jednou. Ale on je velmi zaneprázdněný a pravidla kláštera ukazují na to, že úkol v takovém případě musí zadat Talamon. Stojí teď za to navštívit staříka.");
};

instance DIA_PYROKAR_PiratePray(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_PiratePray_condition;
	information = dia_pyrokar_PiratePray_info;
	permanent = FALSE;
	description = "Potřebuji vaši pomoc.";
};

func int dia_pyrokar_PiratePray_condition()
{
	if(MIS_PiratePray == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pyrokar_PiratePray_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_00");		//Potřebuji vaši pomoc.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_01");		//O co tady jde?
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_02");		//O věc velmi choulostivou. Musím se vymodlit za srdce lidí, jejichž zločiny proti Innosovi byly velké.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_03");		//(zvědavě) A co je to za lidi?

	if(RhetorikSkillValue[1] >= 60)
	{
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_04");		//Piráti! Ale chtějí začít nový život, a proto jim chci vymodlit odpuštění.
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_05");		//Samozřejmě, je to chvályhodné, z jejich strany... (zamyšleně)
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_06");		//Jenže lidé tohoto druhu jsou obvykle příliš zatíženi vahou svých zločinů.
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_07");		//Takže se nedá nic dělat?
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_08");		//Proč, může, samozřejmě! Ale musíš dát klášteru nějaký velmi velkorysý dar.
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_09");		//Aby Innos přijal výkupnou modlitbu za vaše duše.
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_10");		//Kolik?
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_11");		//To závisí na vaší štědrosti. Ale tento dar musí být nejméně tisíc zlatých!
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_12");		//Chápu.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		PyrAgreePray = TRUE;
		B_LogEntry(TOPIC_PiratePray,"Pyrokar souhlasil, že se bude modlit za duše Gregových mužů, ale budu muset dát velkorysý dar do kláštera, ne menší než tisíc zlatých...");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_13");		//Piráti! Ale chtějí začít nový život, a proto jim chci vymodlit odpuštění.
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_14");		//Piráti? To je vyloučeno!
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_15");		//Ale...
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_16");		//Žádné ale! A už mě s tím nevyrušuj!
		PyrNotAgreePray = TRUE;
		B_LogEntry(TOPIC_PiratePray,"Pyrokar odmítl, že se bude modlit za duše Gregových mužů.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_PYROKAR_PiratePray_Gold(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_PiratePray_Gold_condition;
	information = dia_pyrokar_PiratePray_Gold_info;
	permanent = TRUE;
	description = "Tak pomodlete se za ně. Dal jsem dar.!";
};

func int dia_pyrokar_PiratePray_Gold_condition()
{
	if((MIS_PiratePray == LOG_Running) && (PyrAgreePray == TRUE)) 
	{
		return TRUE;
	};
};

func void dia_pyrokar_PiratePray_Gold_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_01_00");		//Tak, pomodlete se za ně. Dal jsem dar.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_01_01");		//A jak si vyděláte zlato na tento dobrý obchod?
	Info_ClearChoices(DIA_Pyrokar_PiratePray_Gold);
	Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Budu o tom přemýšlet.",DIA_Pyrokar_PiratePray_Gold_Back);

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Tisíc zlatých.",DIA_Pyrokar_PiratePray_Gold_One);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Dva tisíce zlatých.",DIA_Pyrokar_PiratePray_Gold_Two);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Tři tisíce zlatých.",DIA_Pyrokar_PiratePray_Gold_Three);
	};
};

func void DIA_Pyrokar_PiratePray_Gold_Back()
{
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_Back_01_00");		//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Back_01_01");		//Dobře, můj synu. Tak se ještě rozhodni.
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_One()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_One_01_00");		//Tisíc zlatých.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_One_01_01");		//Dobře, můj synu.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_One_01_02");		//Přijmu váš dar a vykonáme modlitbu za duše těchto lidí.
	GregBonusPray = 1;
	B_LogEntry(TOPIC_PiratePray,"Pyrokar se bude modlit za duše mužů Grega.");
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_Two()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_Two_01_00");		//Dva tisíce zlatých.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Two_01_01");		//To je od tebe velmi velkorysé, můj synu.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Two_01_02");		//Přijmu váš dar a vykonáme modlitbu za duše těchto lidí.
	GregBonusPray = 2;
	B_LogEntry(TOPIC_PiratePray,"Pyrokar se bude modlit za duše mužů Grega.");
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_Three()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_Three_01_00");		//Tři tisíce zlatých.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Three_01_01");		//Co... (respekt) srdečně děkuji za tento velkorysý dar, můj synu!
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Three_01_02");		//Zařídím hodinu modliteb za očištění duše těchto lidí a to okamžitě.
	GregBonusPray = 3;
	B_LogEntry(TOPIC_PiratePray,"Pyrokar se bude modlit za duše mužů Grega.");
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

instance DIA_PYROKAR_DarkOrden(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrden_condition;
	information = dia_pyrokar_DarkOrden_info;
	permanent = FALSE;
	description = "Poslal mě lord Hagen.";
};

func int dia_pyrokar_DarkOrden_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToPyro == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrden_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_00");		//Poslal mě lord Hagen.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_01");		//Nepokračuj ani. Už vím co mi chceš říct.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_02");		//Pak potřebuji vaši svatou radu!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_03");		//Mám-li být upřímný, vůbec netuším jak bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_04");		//Všechny naše výzkumy kolem toho co se děje, nedávají žádné jednoznačné odpovědi na tvoji otázku.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_05");		//Ale je tu jedna věc, která by tě mohla zajímat.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_07");		//Ve starých rukopisech, které se nám podařilo najít v knihovně jsme našli, že se něco podobného v minulosti už stalo.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_08");		//Důvodem je nějaký velmi mocný artefakt, který probudilo k životu nějaké hrozné zlo!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_09");		//Co je to za artefakt?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_10");		//Zdá se, že je to jen obyčejná kniha... (tajemně) V rukopisech je nazýván Chromanin!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_11");		//Přijde mi, že jsem o tom někdy už slyšel. Nicméně si nepamatuji kdy.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_12");		//Ať to bylo cokoli, je to naše jediná stopa! Takže budeš muset zjistit o tom vše, co jen bude možné.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_13");		//Jak na to? Koneckonců, ani nevím kde to hledat.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_14");		//Já... (zamyšleně) Avšak tento artefakt je bezpochyby dílem Beliara a jeho služebníků!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_15");		//Takže pokud chceme hledat odpovědi na naše otázky, odpovědí je jeden z nich.
	DO_SendToKriol = TRUE; 
	B_LogEntry(TOPIC_DarkOrden,"Pyrokar opravdu nemohl odpovědět, proč je Khorinis napaden nemrtvými. Nicméně mi vyprávěl příběh, že se něco takového stalo. Důvodem byl velmi starý artefakt, a to - kniha. Říkal jí Chromanin. Pyrokar mi poradil, abych se dozvěděl vše o této knize. Podle něj tento artefakt je dílem Beliara. Tak co hledat odpovědi na mé otázky u jednoho z jeho služebníků?");
};

instance DIA_PYROKAR_DarkOrdenKnown(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrdenKnown_condition;
	information = dia_pyrokar_DarkOrdenKnown_info;
	permanent = FALSE;
	description = "Zjistil jsem důvod invaze nemrtvých.";
};

func int dia_pyrokar_DarkOrdenKnown_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_KnowAboutDO == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrdenKnown_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_00");		//Zjistil jsem důvod invaze nemrtvých.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_01");		//No, to je dobrá zpráva! Řekni mi všechno co víš, můj synu.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_02");		//Dobře, ale nejdřív mi odpovězte na jednu otázku. Jaký ušlechtilý paladin byl pohřben v Khorinisu?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_03");		//To mě žádaš o těžkou odpověď. Nech mě přemýšlet...
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_04");		//(zamyšleně) V mé paměti... byli tam jen tři - lordové Inubis, Mirat a Ulzar.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_05");		//Všichni byli členy svatého řádu paladinů! A jejich hroby jsou rozmístěny po ostrově.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_06");		//Proč se ptáš?
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_07");		//Po jejich smrti se tito paladinové staly silnými nemrtvými.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_08");		//Oni na Khorinis sesílají hordy nemrtvých. A jen osvobozením jejich duší, budeme moci zastavit invazi.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_09");		//Jsi zdravé mysli?! Ó, Innosi! To je špinavé rouhání.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_10");		//Chápu vaše pocity, ale není.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_11");		//Musíme prohledat ty hrobky. Jinak bude příliš pozdě!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_12");		//(překvapeně) Musím se zbláznit, abych tě nechal něco takového udělat.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_13");		//Ale zdá se, že máš pravdu a my si nemůžeme dovolit riskovat.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_14");		//Klíče potřebné k otevření těch hrobů se nachází zde v klášteře.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_15");		//Tady vem si to...
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItKe_Hagen_Innubis,1);
	CreateInvItems(other,ItKe_Hagen_DarkOrder_01,1);
	CreateInvItems(other,ItKe_Hagen_DarkOrder_02,1);
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_16");		//Nicméně stále doufám, že jsi udělal chybu ve svých výpočtech. A nebudeme je muset obviňovat!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_17");		//Chtěl bych věřit.
	B_LogEntry(TOPIC_DarkOrden,"Pyrokar mi neochotně předal klíče od hrobů paladinů. Je na čase je navštívit.");
	AI_StopProcessInfos(self);

	Wld_InsertNpc(DARKTOWER_SKELETON_LORD,"NW_FARM2_TAVERNCAVE1_09");
	Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TAVERNCAVE1_10");
	Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TAVERNCAVE1_08");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM2_TAVERNCAVE1_07");

	Wld_InsertNpc(SKELETON_LORD_MIRAT,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_MAIN");
	Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_10_01");
	Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_07_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_TROLLROCKCAVE_06");

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(skeleton_dark,"FP_ITEM_STONETPLATETEACH_25");
		Wld_InsertNpc(skeleton_dark,"FP_ITEM_FOREST_STPLATE_04");
		Wld_InsertNpc(skeleton_dark,"NW_FARM2_TAVERNCAVE1_06");
		Wld_InsertNpc(skeleton_dark,"NW_FARM2_TAVERNCAVE1_04");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_09");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_08");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_04");

		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_02");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_03_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_03_01");
		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_03");
		Wld_InsertNpc(skeleton_warrior,"NW_TROLLAREA_TROLLROCKCAVE_01");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_04");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_02");

		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM2_TO_TAVERNCAVE1_05");

		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_04");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_05");

		Wld_InsertNpc(skeleton,"NW_CRYPT_01");
		Wld_InsertNpc(skeleton_warrior,"CRYPT");
		Wld_InsertNpc(skeleton_dark,"NW_CRYPT_10");
		Wld_InsertNpc(skeleton,"NW_CRYPT_05");
		Wld_InsertNpc(skeleton_warrior,"NW_CRYPT_03");
		Wld_InsertNpc(skeleton_dark,"NW_CRYPT_02");
	};
};

instance DIA_PYROKAR_DarkOrdenWhere(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrdenWhere_condition;
	information = dia_pyrokar_DarkOrdenWhere_info;
	permanent = FALSE;
	description = "Kde mohu najít ty hrobky?";
};

func int dia_pyrokar_DarkOrdenWhere_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (Npc_KnowsInfo(other,DIA_Pyrokar_DarkOrdenKnown) == TRUE) && (KillDeadPalAll == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrdenWhere_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenWhere_01_00");		//Kde mohu najít ty hrobky?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenWhere_01_01");		//Jedna z nich je nedaleko Onarovy farmy.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenWhere_01_02");		//Druhá je v jeskyni, v blízkosti hostince 'U Mrtvé harpyje'.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenWhere_01_03");		//Třetí najdeš vedle kruhu Slunce, v malé rokli.
};

instance DIA_PYROKAR_DarkOrden_SLK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrden_SLK_condition;
	information = dia_pyrokar_DarkOrden_SLK_info;
	permanent = FALSE;
	description = "Navštívil jsem všechny tři hroby.";
};

func int dia_pyrokar_DarkOrden_SLK_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (KillDeadPalAll == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrden_SLK_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_00");		//Navštívil jsem všechny tři hroby.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_01");		//A co jsi zjistil?
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_02");		//Jak se dalo očekávat, prostě se rojili nemrtvými! Takže jsem je musel trochu pročistit.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_03");		//Ó, Innosi! Takže se vaše obavy potvrdily. Co samotní paladinové?
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_04");		//Doufám, že jejich duše nalezly věčný odpočinek! Moc se neobtěžovali z odchodem z ostrova.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_05");		//Nechť jim požehná Innos. Přesto byli za svého života hodní lidé!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_06");		//Každopádně není času pro radování. Nedávno jsem dostal zprávu od lorda Hagena.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_07");		//Podle něj je město neustále pod útokem nemrtvých.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_08");		//A zdá se, že je jich stále více a více!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_09");		//Jak to?! Proč náš plán nefungoval?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_10");		//Na tuto otázku nemám odpověď.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_11");		//Ale zdá se, že naše akce přiměly nepřítele bojovat ještě s větším zápalem, aby si na nás vybil zuřivost.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_12");		//Pokud to takhle půjde dále, město padne. A za ním celý ostrov!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_13");		//Pak co můžeme teď dělat?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_14");		//(depresivně) Zdá se mi, že jsme jednali správným směrem. Nicméně, stále něco chybí.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_15");		//Něco, co se skrývá před našim zrakem a znemožňuje nám ukončit situaci.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_16");		//Takže jediná věc, která mě teď napadá, je zajít do města a promluvit si se samotným lordem Hagenem.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_17");		//Koneckonců, on je hlavou řádu paladinů. A určitě nám může řict více o těch lidech.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_18");		//Dobře, vydám se hned za ním.
	DO_SendToHagen = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Řekl jsem Pyrokarovi, že jsem vyčistil kobky paladinů. Nicméně, podle něj je příliš brzké se radovat. Útoky Nemrtvých se nezastavily, naopak jsou ještě silnější. Vypadá to, že jsme je rozzuřili. Musím si o paladinech promluvit s Hagenem. Možná o nich ví něco, co my ne.");
	AI_StopProcessInfos(self);

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(skeleton_warrior,"FP_CAMPFIRE_NW_ATC_ORC_50");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_NW_ATC_ORC_177");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_ATC_ORC_176");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_178");
		Wld_InsertNpc(Zombie02,"FP_ROAM_NW_ATC_ORC_179");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_CONNECT_FOREST");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_CAMPFIRE_NW_ATC_ORC_124");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_101");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_102");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_104");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM1_CONNECT_CITY");
	};

	Wld_InsertNpc(KDW_1406_Mitras,"NW_MITRAS_JARCURSE");
	B_StartOtherRoutine(KDW_140300_Addon_Myxir_CITY,"JarCurse");
};

instance DIA_Pyrokar_MAXROBE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_MAXROBE_condition;
	information = DIA_Pyrokar_MAXROBE_info;
	permanent = FALSE;
	description = "Co takhle lepší roucho?";
};

func int DIA_Pyrokar_MAXROBE_condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDF == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAXROBE_01_00");	//Co takhle lepší roucho?
	AI_Output(self,other,"DIA_Pyrokar_MAXROBE_01_01");	//Protože ovládáš všech šest kruhů magie, jsi hoden nosit roucho arcimága Ohně!
	AI_Output(self,other,"DIA_Pyrokar_MAXROBE_01_02");	//Nicméňe, budeš za to muset zaplatit! Její výroba nás stojí draho, takže ti ji nemůžem darovat.
	LastRobeKDF = TRUE;
};

instance DIA_Pyrokar_MAXROBE_Buy(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_MAXROBE_Buy_condition;
	information = DIA_Pyrokar_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Prodej mi roucho arcimága Ohně (cena: 25000 zlatých)";
};

func int DIA_Pyrokar_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDF) && (LastRobeKDF == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAXROBE_Buy_01_00");	//Prodej mi roucho arcimága Ohně.

	if(Npc_HasItems(hero,ItMi_Gold) >= 25000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,25000);
		Npc_RemoveInvItems(self,ItMi_Gold,25000);
		AI_Output(self,other,"DIA_Pyrokar_MAXROBE_Buy_01");	//Výborně! Tady, vem si to.
		AI_Output(self,other,"DIA_Pyrokar_MAXROBE_Buy_02");	//Je to velká čest, nosit takové oblečení. Pamatuj si to!
		CreateInvItems(self,itar_kdf_sh,1);
		B_GiveInvItems(self,other,itar_kdf_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_MAXROBE_Buy_01_03");	//Je mi líto, ale nemáš dost zlata.
	};
};
	
instance DIA_Pyrokar_Fregarah(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Fregarah_Condition;
	information = DIA_Pyrokar_Fregarah_Info;
	permanent = FALSE;
	description = "Mám jednu otázku.";
};

func int DIA_Pyrokar_Fregarah_Condition()
{
	if(MIS_XRANFREG == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_00");	//Mám jednu otázku.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_01");	//Ptej se!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_02");	//V knihovně kláštera jsem našel záznam o expedici do hor Khorinisu.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_03");	//A jak jsem pochopil, někteří mágové Ohně, včetně vás, se na tom podíleli.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_04");	//Ano, máš pravdu. Tu expedici řešila Nejvyšší rada mágů Ohně.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_05");	//Museli jsme přijít na to, jak je ta oblast bohatá na naleziště magické rudy.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_06");	//A taky trošku nastínit obraz země, doposud pro nás neznámé.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_07");	//V záznamech bylo řečeno, že jste našli nějaký starověký chrám, který hlídal kamenný golem.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_08");	//To nebyl jenom golem, ale skutečná oživlá hora!
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_09");	//Což mimo jiné, mělo také neuvěřitelnou sílu.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_10");	//Paladinové ho rozptýlili a my jsme se ho pokusili zastavit.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_11");	//Ale bylo to jen tak, tak. Ještě chvíli a začali bychom se odebírat do říše Innosovy.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_12");	//Co se stalo pak?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_13");	//Jen zázrak nás zachránil před smrtí! Měl jsem čas vyvolat kouzlo teleportace, které mě zaneslo zpět do Khorinisu.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_14");	//Od toho incidentu, si na to moc nepamatuji.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_15");	//Avšak obraz té hory mám stále v mé hlavě!
	B_LogEntry(TOPIC_XRANFREG,"Pyrokar mi řekl o expedici s kamennými obry. Podle něj to byly bytosti s ohromnou velikosti a velkou silou.");
};
	
instance DIA_Pyrokar_Fregarah_Mage(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Fregarah_Mage_Condition;
	information = DIA_Pyrokar_Fregarah_Mage_Info;
	permanent = FALSE;
	description = "Kdo ještě další z mágů ví o té expedici?";
};

func int DIA_Pyrokar_Fregarah_Mage_Condition()
{
	if((MIS_XRANFREG == LOG_Running) && (Npc_KnowsInfo(other,DIA_Pyrokar_Fregarah) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Mage_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Mage_01_00");	//Kdo ještě další z mágů ví o té expedici?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Mage_01_01");	//Moc jich není. Corristo, Damarok, Drago a odpadlík - Xardas.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Mage_01_02");	//Jenom většina z nich zůstala v Hornickém údolí, po vytvoření magické bariéry.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Mage_01_03");	//Takže příběh žije s nimi, to co se stalo.
	B_LogEntry(TOPIC_XRANFREG,"Ze slov Pyrokara, jsem dospěl k závěru, že jediným člověkem naživu je Xardas, který by si byl vědom co se tenkrát stalo.");
	XRANFREGXAR = TRUE;

	if((Kapitel >= 5) && (XarGiveFirstTome == FALSE))
	{
		Wld_InsertItem(ItWr_Fregarah,"FP_ITEM_XARDAS_07");
		Wld_InsertItem(itke_xardasowt,"FP_ITEM_XARDAS_05");
	};
};

var int PyrokarRuneDay;
var int PyrokarRuneDo;
	
instance DIA_Pyrokar_Fregarah_Know(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_Fregarah_Know_Condition;
	information = DIA_Pyrokar_Fregarah_Know_Info;
	permanent = FALSE;
	description = "O tom kamenném golemovi...";
};

func int DIA_Pyrokar_Fregarah_Know_Condition()
{
	if((MIS_XRANFREG == LOG_Running) && (StonnosHrAll == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Know_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_00");	//O tom kamenném golemovi...
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_01");	//Zjistil jsem co je to za stvoření a odkud to přišlo.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_02");	//Opravdu jsi zjistil všechno? (překvapen) Ale jak?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_03");	//Je to dlouhý příběh. Radši přejdu k věci.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_04");	//Takže to stvoření je božského původu.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_05");	//A zdrojem jeho síly je obyčejná magie rudy.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_06");	//Ach, Innos... (váhá) A máš pravdu.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_07");	//Pokud si vzpomínám, vše, co je opravdu zdroj bylo pokryto kameny, velmi podobně jako u rudy.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_08");	//My jsme tomu nepřikládali význam, ale teď je mi všechno jasné.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_09");	//Je taky jasné, že jsme neměli žádnou šanci ho zneškodnit.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_10");	//Pouze obrovský proud energie, který má stejné vlastnosti, by mu měl být schopen způsobit zranění.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_11");	//Myslíte magii obsaženou v samotné rudě?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_12");	//To je ono! Jen aby jí bylo hodně. Ale to stejně není vše...
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_13");	//Zůstává tu hlavní otázka - co je to za věc, že je schopna absorbovat takové obrovské množství magické energie?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_14");	//Pouze magická runa... (sebevědomě) Ano, to je ono.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_15");	//A co zbraně?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_16");	//Nejsem si jistý, že ve světě existuje taková zbraň.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_17");	//Ale pokud existuje, bude se to muset použít jako runa pro ukládání magické energie.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_18");	//Bez ní meč prostě nic neudělá.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_19");	//A dokážete mi sehnat takovou runu?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_20");	//Takže jsi vážně připraven vypořádat se se silami kamenných obrů?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_21");	//Samozřejmě.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_22");	//Ale to je čisté šílenství!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_23");	//Takže máte tu runu pro mě, nebo ne?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_24");	//Dobře, je to tvoje věc... (vrtí hlavou) Samozřejmě budu mít! Řeknu ti ještě teda více.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_25");	//Ty potřebuješ nejen runu, ale i svitek přenosu energie.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_26");	//Dám ti runu, která je schopná absorbovat svou vlastní.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_27");	//Hlavní věc je být blízko ke zdroji magie!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_28");	//Vynikající! A jak dlouho to potrvá?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_29");	//Věřím, že to bude hotové do zítřejšího rána.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_30");	//Skvělé! Pak se podívám na vás zítra.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_31");	//Jak pravíš, můj synu.
	B_LogEntry(TOPIC_XRANFREG,"Řekl jsem Pyrokarovi všechno, co jsem zjistil o golemovi. Slíbil mi runu, která by mohla absorbovat velké množství magické energie se kterou mohu bojovat proti stvoření kamene... Samozřejmě, pokud budu mít příležitost setkat se s ním.");
	PyrokarRuneDay = Wld_GetDay();
	PyrokarRuneDo = TRUE;
};

instance DIA_Pyrokar_Fregarah_RuneDo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_Fregarah_RuneDo_Condition;
	information = DIA_Pyrokar_Fregarah_RuneDo_Info;
	permanent = FALSE;
	description = "Jak je to s tou runou?";
};

func int DIA_Pyrokar_Fregarah_RuneDo_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_XRANFREG == LOG_Running) && (PyrokarRuneDo == TRUE) && (PyrokarRuneDay <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_RuneDo_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_RuneDo_01_00");	//Jak je to s tou runou?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_01");	//Je hotová! Tady, vem si ji.
	B_GiveInvItems(self,other,ItMi_PyroRune,1);
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_02");	//Nicméně, já tě přesto chci zastavit, dokud není příliš pozdě
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_03");	//Setkání s NÍM tě může stát život!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_RuneDo_01_04");	//Budu o tom přemýšlet. Samozřejmě, díky za runu.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_05");	//Jsi...
	B_LogEntry(TOPIC_XRANFREG,"Pyrokar mi dal runu! Nyní zbývá jen najít magickou rudu, použít vedle ní kámen a absorbovat energii. Něco mi říká, že budu muset najít ne zrovna málo...");
};