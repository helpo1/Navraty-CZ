
instance DIA_Oric_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_HALLO(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_HALLO_Condition;
	information = DIA_Oric_HALLO_Info;
	permanent = FALSE;
	description = "Jaké jsou tvoje povinnosti?";
};


func int DIA_Oric_HALLO_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Oric_HALLO_Info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//Jaké jsou tvoje povinnosti?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//Jsem Garondův strategický poradce.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//Jsme poslední paladinové na hradě. Ostatní odešli, nebo padli.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//Je naší povinností dovést tuto výpravu ke zdárnému konci a u Innose, uděláme to.
};


instance DIA_Oric_Bruder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Bruder_Condition;
	information = DIA_Oric_Bruder_Info;
	permanent = FALSE;
	description = "Mám pro tebe zprávu.";
};


func int DIA_Oric_Bruder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_Bruder_Info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//Mám pro tebe zprávu.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//Jakou zprávu?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//Tvůj bratr je mrtev. Zemřel u průchodu do Hornického údolí.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//(chmurně) ... můj bratr...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//Innos mě těžce zkouší... Ale on zemřel v jeho službách...
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//Tato zpráva je jako šíp, který protíná srdce. Budu hledat sílu v modlitbě.
	OricBruder = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Oric_Statue(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Statue_Condition;
	information = DIA_Oric_Statue_Info;
	permanent = FALSE;
	description = "Vypadá to, že máš pěknou depku.";
};

func int DIA_Oric_Statue_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Oric_HALLO) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_Statue_Info()
{
	AI_Output(other,self,"DIA_Oric_Statue_01_00");	//Vypadá to, že máš pěknou depku.
	AI_Output(self,other,"DIA_Oric_Statue_01_01");	//(chmurně) Doopravdy, je to tak zřejmé?
	AI_Output(other,self,"DIA_Oric_Statue_01_02");	//Proč, co tě žere?
	AI_Output(self,other,"DIA_Oric_Statue_01_03");	//Co nato říct? Je to na nic, proti zlu v tomhle hradě není ani jedna socha Innose.
	AI_Output(other,self,"DIA_Oric_Statue_01_04");	//A co má být? Je to hrad rudobaronů, a je nepravděpodobné že by se starali o svoji duši.
	AI_Output(self,other,"DIA_Oric_Statue_01_05");	//No a co? Já jsem paladin! A každý den bych se měl k němu modlit. 
	AI_Output(self,other,"DIA_Oric_Statue_01_06");	//Tohle vše činí moji duši odolnou a tělo - silné.
	AI_Output(self,other,"DIA_Oric_Statue_01_07");	//A v tomhle zatraceném hradě se nenašla ani malinká figurka našeho Pána!
	MIS_OricStatue = LOG_Running;
	Log_CreateTopic(TOPIC_OricStatue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OricStatue,LOG_Running);
	B_LogEntry(TOPIC_OricStatue,"Paladin Oric je v depresi, protože v zámku není žádná socha Innose, a díky tomu se nemůže modlit.");
};

instance DIA_Oric_Statue_Done(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Statue_Done_Condition;
	information = DIA_Oric_Statue_Done_Info;
	permanent = FALSE;
	description = "Tady máš sošku Innose.";
};

func int DIA_Oric_Statue_Done_Condition()
{
	if((MIS_OricStatue == LOG_Running) && (Npc_HasItems(other,ItMi_InnosStatue) >= 1) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_Statue_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Oric_Statue_Done_01_00");	//Tady máš sošku Innose.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	AI_Output(self,other,"DIA_Oric_Statue_Done_01_01");	//Och! Je to skutečně ona, musím se hned pomodlit jinak se ode mně Innos odvrátí.
	AI_Output(self,other,"DIA_Oric_Statue_Done_01_03");	//Och, promiň! Děkuji. Nedovedeš si předszavit jak je to pro mně důležité.
	AI_Output(other,self,"DIA_Oric_Statue_Done_01_04");	//Je to na tobě vidět.
	MIS_OricStatue = LOG_Success;
	Log_SetTopicStatus(TOPIC_OricStatue,LOG_Success);
	B_LogEntry(TOPIC_OricStatue,"Získal jsem pro paladina Orika sošku Innose... byl šťastný.");
};

instance DIA_Oric_ScoutMine(C_Info)
{
	npc = PAL_251_Oric;
	nr = 1;
	condition = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent = FALSE;
	description = "Mám najít stanoviště kopáčů.";
};

func int DIA_Oric_ScoutMine_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel < 3) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Fajeth_Ore == FALSE) && (Marcos_Ore == FALSE) && (Silvestro_Ore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_ScoutMine_Info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//Mám najít stanoviště kopáčů.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//Nebude to žádná hračka. Hledej paladiny. Vedli tři skupinky.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//Promluv si s Parcivalem, jestli chceš vědět víc.
};


instance DIA_Oric_Perm(C_Info)
{
	npc = PAL_251_Oric;
	nr = 99;
	condition = DIA_Oric_Perm_Condition;
	information = DIA_Oric_Perm_Info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int DIA_Oric_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Oric_Perm_Info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//Jaká je situace?
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//Musíš najít kopáče a rudu. Pak budeme přemýšlet co dál.
	}
	else if(MIS_ScoutMine == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//Situace se vyhrotila do krajnosti. My neustoupíme. Innos je s námi on nás od tud vyvede.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//Tvoje přítomnost tady, nám přináší naději.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//Potřebujeme tvou pomoc. Promluv s Garondem, vše ti vysvětlí.
	};
};


instance DIA_Oric_KAP3_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP3_EXIT_Condition;
	information = DIA_Oric_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP4_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP4_EXIT_Condition;
	information = DIA_Oric_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_IAmBack(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;
	description = "Jsem zpět.";
};


func int DIA_Oric_IAmBack_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_IAmBack_Info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//Jsem zpět.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//Nikdy jsem nemyslel, že tě ještě uvidím.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//Vítám tě ve jménu řádu
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//Vidím, že jsi mág. Máš můj respekt.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//Tvůj návrat je dobré znamení.
};


instance DIA_Oric_CanHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;
	description = "Můžu nějak pomoci?";
};


func int DIA_Oric_CanHelp_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//Můžu nějak pomoci?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//Nic moc toho není.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//Ale něco přece jen. Něco velmi důležitého, co můžeš udělat mimo tyto zdi.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//Plánujeme hadovi uříznout hlavu.
	Info_ClearChoices(DIA_Oric_CanHelp);
	Info_AddChoice(DIA_Oric_CanHelp,"Myslím, že najdeš někoho jiného.",DIA_Oric_CanHelp_NotYourMan);
	Info_AddChoice(DIA_Oric_CanHelp,"Co tím myslíš?",DIA_Oric_CanHelp_WhatYouMean);
};

func void DIA_Oric_CanHelp_NotYourMan()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//Myslím, že najdeš někoho jiného.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//Nemůžu nikoho postrádat - ty jsi naše poslední naděje.
};

func void DIA_Oric_CanHelp_WhatYouMean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//Víme o jednom z jejich vůdců. Hosh-Pak.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//Je to jeden z největších skřetích šamanů.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//Co já s ním?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Zabí ho.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//Ty žertuješ?!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//Jsi jediný, koho můžeme uvolnit. Všechny ostatní potřebujeme zde.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//Není to lehké, ale jsi nejlepší volba pro tento úkol.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//Chceš nám pomoci, ne? Nebo snad ne...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//Hosh-Pakův stan je umíštěn na útesu nad obléhacím kruhem. Je to na jihu.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//Můžeš ho vidět z okna.
	Info_ClearChoices(DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};


instance DIA_Oric_NeedStuff(C_Info)
{
	npc = PAL_251_Oric;
	nr = 6;
	condition = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;
	description = "Potřebuji vybavení.";
};


func int DIA_Oric_NeedStuff_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NeedStuff_Info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//Potřebuji vybavení
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//Nemáme toho moc, co bychom ti mohli dát.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//Můžu ti nabídnout toto.
	Info_ClearChoices(DIA_Oric_NeedStuff);
	Info_AddChoice(DIA_Oric_NeedStuff,"Elixír obratnosti",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice(DIA_Oric_NeedStuff,"Elixír síly",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice(DIA_Oric_NeedStuff,"3 lektvary many",DIA_Oric_NeedStuff_Mana);
	Info_AddChoice(DIA_Oric_NeedStuff,"3 léčivé lektvary",DIA_Oric_NeedStuff_Health);
};

func void DIA_Oric_NeedStuff_Health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//Vezmu si léčivé lektvary.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//Dobrá volba, budou se ti hodit.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//Vezmu si ty lektvary many.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//Dobrá volba, budou se ti hodit. Ať tě Innos ochraňuje.
	CreateInvItems(self,ItPo_Mana_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//Lektvar síly.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//Tady, je velmi užitečný. Přeji ti hodně štěstí.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//Lektvar obratnosti.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//Ať tvé střely nikdy neminou cíl.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};


instance DIA_Oric_NoMurder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 7;
	condition = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;
	description = "Nemůžu zabít Hosh-Paka takovím podlím způsobem.";
};


func int DIA_Oric_NoMurder_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NoMurder_Info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//Nemůžu zabít Hosh-Paka takovím podlím způsobem
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//Víš jak je naše situace špatná?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//Jsme obleženi armádou skřetů a naše zásoby jsou stále menší!
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//Pokud neuspějeme, bude to mít dopad na celé království!
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//Vše bude ztraceno.
};


instance DIA_Oric_WillHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent = FALSE;
	description = "Dobře, zabiju Hosh-Paka.";
};


func int DIA_Oric_WillHelp_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_WillHelp_Info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//Dobře, zabiju Hosh-Paka.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//To rád slyším.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//Hosh-Pakův stan leží na útesu na jihu. Je to nad obléhacím kruhem.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//Přímo ve stínu té velké hory.
	Log_CreateTopic(TOPIC_KillHoshPak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak,LOG_Running);
	B_LogEntry(TOPIC_KillHoshPak,"Oric chce, abych zabil Hosh-Paka. Jeho tábor je na útesu kousek od hradu nad obléhacím kruhem. Jižně a ve stínu velké hory.");
	MIS_KillHoshPak = LOG_Running;
};


instance DIA_ORIC_CANHELPAGAIN(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = dia_oric_canhelpagain_condition;
	information = dia_oric_canhelpagain_info;
	permanent = FALSE;
	description = "Nějaké nápady?";
};


func int dia_oric_canhelpagain_condition()
{
	if((KAPITELORCATC == FALSE) && (MIS_KillHoshPak == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_oric_canhelpagain_info()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_01_00");	//Máš pro mě nějaké pokyny?
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_01");	//Ano, ale jen blázen by ho dokázal realizovat.
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_01_02");	//Výborně, v čen je problém?
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_04");	//(smích) Pokud je mi známo, nedaleko od hradu se utábořilo několika skřetích velitelů.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_05");	//Když byl Hosh-Pak na živu, zodpovídali se jemu. Nyní otěže celé chlupaté hordy, která obléhá hrad, mají ve svých rukách.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_09");	//Bylo by hezké, kdyby je stihnul stejný osud jako jejich vůdce.
	Info_ClearChoices(dia_oric_canhelpagain);
	Info_AddChoice(dia_oric_canhelpagain,"Je to příliš riskantní!",dia_oric_canhelp_nosorry);
	Info_AddChoice(dia_oric_canhelpagain,"Ta myšlenka je opravdu dobrá, i když tak trochu šílená.",dia_oric_canhelpagain_stuff);
};

func void dia_oric_canhelp_nosorry()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NoSorry_01_01");	//Je to příliš riskantní! Nesouhlasím.
	AI_Output(self,other,"DIA_Oric_CanHelp_NoSorry_01_02");	//Hmmm. No, to je tvoje rozhodnutí.
	AI_Output(self,other,"DIA_Oric_CanHelp_NoSorry_01_05");	//(se smutným úsměvem) Musím najít jiného šílenece. I když pochybuji, že se tady někdo takový najde.
	Info_ClearChoices(dia_oric_canhelpagain);
};

func void dia_oric_canhelpagain_stuff()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_01");	//Ta myšlenka je opravdu dobrá, i když tak trochu šílená.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_02");	//Souhlasíš?!
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_03");	//Samozřejmě. Nicméně, jak víš... bude to mimořádně obtížné.
	if(other.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_04");	//Myslím, že budu potřebovat vybavení.
		AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_05");	//O zlato se neboj, dostaneš ho.
	}
	else
	{
		AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_06");	//Budu potřebovat výbavu.
		AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_07");	//Výborně, příteli. Věděl jsem, že se na tebe můžu spolehnout.
	};
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_08");	//Ohledně vzbavení... tady je to poslední, co máme.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_09");	//Vyber to, co nejvíce potřebuješ.
	MIS_KILLOCELITE = LOG_Running;
	Log_CreateTopic(TOPIC_KILLOCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLOCELITE,LOG_Running);
	B_LogEntry(TOPIC_KILLOCELITE,"Paladin Oric chce, abych to skončil se čtyřmi skřetími velitely, kteří se nacházejí v kruhu obléhatelů kolem hradu.");
	Info_ClearChoices(dia_oric_canhelpagain);
	Info_AddChoice(dia_oric_canhelpagain,"Elixír obratnosti.",dia_oric_canhelpagain_dexterity);
	Info_AddChoice(dia_oric_canhelpagain,"Elixír síly.",dia_oric_canhelpagain_strength);
	Info_AddChoice(dia_oric_canhelpagain,"Elixír ducha.",dia_oric_canhelpagain_mana);
	Info_AddChoice(dia_oric_canhelpagain,"Elixír života.",dia_oric_canhelpagain_health);
};

func void dia_oric_canhelpagain_health()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Health_15_00");	// Vezmu si elixír života.
	CreateInvItems(self,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Health_11_01");	//Dobrý výběr, snad tě udrží při životě.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Health_11_02");	//A teď jdi, Innos tě ochraňuj.
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_mana()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Mana_15_00");	//Vezmu si elixír ducha.
	CreateInvItems(self,ItPo_Perm_Mana,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Mana_11_01");	//Dobře! Na síle ducha závisí odvaha a hrdinství, bez nich v boj nevyhraješ... ale co ti mám říkat?
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Mana_11_02");	//Innos tě neopustí.
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_dexterity()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Dexterity_15_00");	//Vezmu si elixír obratnosti.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Dexterity_11_01");	//Výborně! Mám pocit, že zemřou dřív než tě spatří.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Dexterity_11_02");	//Ať Innos směřuje tvé střely přímo na cíl.
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_strength()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Strength_15_00");	//Vezmu si elixír síly.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Strength_11_01");	//Ano je to tak! Skřeti jsou velmi silní, ale ten co jim přináší smrt musí být silnější.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Strength_11_02");	//Innos tě ochraňuj!
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_WHEREFARROK(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = dia_oric_wherefarrok_condition;
	information = dia_oric_wherefarrok_info;
	permanent = FALSE;
	description = "Kde přesně jsou?";
};


func int dia_oric_wherefarrok_condition()
{
	if((MIS_KILLOCELITE == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_wherefarrok_info()
{
	AI_Output(other,self,"DIA_Oric_WhereFarrok_11_00");	//Kde přesně jsou?
	AI_Output(self,other,"DIA_Oric_WhereFarrok_11_01");	//To ti asi nepovím...
	AI_Output(self,other,"DIA_Oric_WhereFarrok_11_02");	//... vím jen, že jsou čtyři. Více nevím!
	AI_Output(other,self,"DIA_Oric_WhereFarrok_11_03");	//Hmm... tak já je najdu.
};


instance DIA_ORIC_FARROKDEAD(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = dia_oric_farrokdead_condition;
	information = dia_oric_farrokdead_info;
	permanent = FALSE;
	description = "Je po velitelích!";
};


func int dia_oric_farrokdead_condition()
{
	if((MIS_KILLOCELITE == LOG_Running) && (KAPITELORCATC == FALSE) && (ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
	{
		return TRUE;
	};
};

func void dia_oric_farrokdead_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Oric_FarrokDead_01_00");	//Je po velitelích!
	AI_Output(self,other,"DIA_Oric_FarrokDead_01_01");	//Věděl jsem, že ty to dokážeš.
	AI_Output(self,other,"DIA_Oric_FarrokDead_01_03");	//Nic moc, ale v jejich řadách to vyvolá paniku!
	AI_Output(self,other,"DIA_Oric_FarrokDead_01_05");	//Jednoduše to zvětší naše šance na výhru...
	MIS_KILLOCELITE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLOCELITE,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLOCELITE,"Řekl jsem Oricovi, že jsem zabil skřetí velitele kolem hradu.");
};


instance DIA_ORIC_ELITEPAY(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = dia_oric_elitepay_condition;
	information = dia_oric_elitepay_info;
	permanent = FALSE;
	description = "A co moje odměna?!";
};


func int dia_oric_elitepay_condition()
{
	if((MIS_KILLOCELITE == LOG_SUCCESS) && (hero.guild == GIL_DJG) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_elitepay_info()
{
	AI_Output(other,self,"DIA_Oric_ElitePay_15_00");	//A co moje odměna?
	AI_Output(self,other,"DIA_Oric_ElitePay_11_01");	//Můžu ti dát jen 1000 zlatých... Více prostě nemám.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
};


instance DIA_Oric_HoshDead(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent = FALSE;
	description = "Hosh-Pak je mrtev!";
};


func int DIA_Oric_HoshDead_Condition()
{
	if(Npc_IsDead(Hosh_Pak) && (MIS_KillHoshPak == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_HoshDead_Info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//Hosh-Pak je mrtev!
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//Skvěle! Teď jsou naše šance zase lepší!.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//Myslím, že nám to dalo alespoň týden času na odpočinek a doplnění zásob!
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillHosh_Pak);
};


instance DIA_Oric_AnyNews(C_Info)
{
	npc = PAL_251_Oric;
	nr = 9;
	condition = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent = TRUE;
	description = "Nějaké novinky?";
};


func int DIA_Oric_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//Nějaké novinky?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//Kromě skřetího obležení?
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//Ano. Jsi náš hrdina. Zbavit se všech draků najednou není v silách smrtelnika a ty jsi to dokázal.
	}
	else if(MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//Skřeti se zdají být neklidní od Hosh-Pakovi smrti.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//Přicházejí stále další skřeti. To není dobré.
	};
};


instance DIA_Oric_DragonPlettBericht(C_Info)
{
	npc = PAL_251_Oric;
	nr = 3;
	condition = DIA_Oric_DragonPlettBericht_Condition;
	information = DIA_Oric_DragonPlettBericht_Info;
	permanent = TRUE;
	description = "Potřebuji více informací o dracích.";
};


func int DIA_Oric_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_AllDragonsDead == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};


var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;

func void DIA_Oric_DragonPlettBericht_Info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//Potřebuji více informací o dracích.
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//Jednoho jsem zabil, kde bych měl hledat ostatní?
	}
	else if(MIS_KilledDragons != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//Mám pocit, že jsem je ještě nezabil všechny. Možná jsem nějakého přehlédl.
	};
	if(((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE)) && ((Oric_SwampdragonInfo_OneTime == FALSE) || (Oric_RockdragonInfo_OneTime == FALSE) || (Oric_FiredragonInfo_OneTime == FALSE) || (Oric_IcedragonInfo_OneTime == FALSE)))
	{
		if((Npc_IsDead(SwampDragon) == FALSE) && (Oric_SwampdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//Nezdá se ti podezřelý ten močál, který vyrostl kousek od hradu?
			B_LogEntry(TOPIC_DRACHENJAGD,"Oric se domnívá, že bažina kousek od hradu, která vznikla za pár týdnů je velmi podezřelá...");
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(RockDragon) == FALSE) && (Oric_RockdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//Za sopkou je jakási skalní pevnost...
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//Naši zvědové hlásí, že je velmi střežená...
			B_LogEntry(TOPIC_DRACHENJAGD,"Oricovi zvědi říkají, že skalní pevnost za sopkou na jihu je velmi chráněna. Možná je tam drak.");
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(FireDragon) == FALSE) && (Oric_FiredragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//Po posledním dračím útoku jeden z nich zmizel na jihu nad sopkou...
			B_LogEntry(TOPIC_DRACHENJAGD,"Při posledním dračím útoku jeden drak zmizel nad sopkou na jihu...");
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(IceDragon) == FALSE) && (Oric_IcedragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//Na západě se vytvořila podezřelá ledová oblast. Možná je drak tam.
			B_LogEntry(TOPIC_DRACHENJAGD,"Podle informací, které mi dal Oric, sněhem pokrytou oblast na západě může být doupětem draka.");
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//V současné době mě nic nenapadá.
	};
};


instance DIA_Oric_KAP5_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP5_EXIT_Condition;
	information = DIA_Oric_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP6_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP6_EXIT_Condition;
	information = DIA_Oric_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORIC_CAPTURED(C_Info)
{
	npc = PAL_251_Oric;
	nr = 2;
	condition = dia_oric_captured_condition;
	information = dia_oric_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_oric_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_captured_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};



