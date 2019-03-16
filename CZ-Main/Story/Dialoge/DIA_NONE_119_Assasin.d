instance DIA_NONE_119_Assasin_EXIT(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 999;
	condition = DIA_NONE_119_Assasin_EXIT_Condition;
	information = DIA_NONE_119_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_119_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_119_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_119_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 900;
	condition = DIA_NONE_119_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_119_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_119_Assasin_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_119_Assasin_PICKPOCKET,Dialog_Back,DIA_NONE_119_Assasin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_119_Assasin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_119_Assasin_PICKPOCKET_DoIt);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
};


instance DIA_NONE_119_Assasin_PreHallo(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PreHallo_Condition;
	information = DIA_NONE_119_Assasin_PreHallo_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_NONE_119_Assasin_PreHallo_Condition()
{
	return TRUE;
};

func void DIA_NONE_119_Assasin_PreHallo_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PreHallo_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PreHallo_01_01");	//Jmenuji se Gonzales. Víc vědět nepotřebuješ.
};

instance DIA_NONE_119_Assasin_Hallo(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_Hallo_Condition;
	information = DIA_NONE_119_Assasin_Hallo_Info;
	permanent = FALSE;
	description = "Nevypadáš na obyvatele tohoto města.";
};

func int DIA_NONE_119_Assasin_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_119_Assasin_PreHallo))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_Hallo_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_Hallo_01_00");	//Nevypadáš na obyvatele tohoto města.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_01");	//Nevypadám, že?
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_02");	//Majitel krčmy mě taky ze začátku podezříval.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_03");	//Avšak, když jsem mu ukázal měšec plný mincí, rychle změnil názor.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_04");	//A teď jsem jedním z jeho nejlepších zákazníků.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_05");	//Každý má rád zlato. (úškrn) A ty nejspíš taky.
	AI_Output(other,self,"DIA_NONE_119_Assasin_Hallo_01_06");	//A co tady pohledávaš?
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_07");	//Pokud to jde, snažím se držet stranou od problémů.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_08");	//A tobě bych doporučil totéž.
};


instance DIA_NONE_119_Assasin_WorkFor(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_WorkFor_Condition;
	information = DIA_NONE_119_Assasin_WorkFor_Info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};

func int DIA_NONE_119_Assasin_WorkFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_119_Assasin_Hallo))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_WorkFor_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkFor_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_01");	//Hmmm... (zamyšleně) Práci jako takovou pro tebe nemám.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_02");	//Ale mám jeden problém a možná bys mi ho mohl pomoct vyřešit.
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkFor_01_03");	//Co máš tedy za problém?
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_04");	//Víš, na mých cestách po Khorinise jsem ztratil svůj meč.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_05");	//Možná mi ho ukradli. Těžko říct.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_06");	//Zdejší zbraně nejsou nic moc. Velmi nekvalitní a rychle se opotřebovávají.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_07");	//Vypadáš jako někdo, kdo hodně cestuje. Možná najdeš nejaký, který se mi bude líbit.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_08");	//Jistě se ti štědře odměním. Tomu věř.
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkFor_01_09");	//Dobře, pokusím se ti najít něco vhodného.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_10");	//Skvěle! Pokus se.
	Log_CreateTopic(TOPIC_AssasinHelp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AssasinHelp,LOG_Running);
	B_LogEntry(TOPIC_AssasinHelp,"V krčmě v přístavní čtvrti jsem potkal divného chlápka jménem Gonzales. Chtěl abych vyřešil jeho problém - najít zbraň, která se mu bude líbit. Podle něj zdejší meče za moc nestojí.");
	MIS_AssasinHelp = LOG_Running;
};

instance DIA_NONE_119_Assasin_WorkForDone(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_WorkForDone_Condition;
	information = DIA_NONE_119_Assasin_WorkForDone_Info;
	permanent = FALSE;
	description = "Něco pro tebe mám.";
};

func int DIA_NONE_119_Assasin_WorkForDone_Condition()
{
	if((MIS_AssasinHelp == LOG_Running) && (Npc_HasItems(other,ItMw_2H_Katana) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_WorkForDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_00");	//Něco pro tebe mám.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_01");	//Tak to vyndej a nenapínej mě. Co jsi přinesl?
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_02");	//Pomalu! Myslím, že mám zbraň, která se ti bude líbit.
	AI_UnequipWeapons(self);
	B_ClearNpcInventory(self);
	B_GiveInvItems(other,self,ItMw_2H_Katana,1);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_03");	//Neuvěřitelné! Kde jsi ho získal?
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_04");	//Dostal jsem ho od jednoho paladina. Tento meč byl jednou z jeho válečných trofejí, kterou si přinesl z Varantu.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_05");	//Hmm, paladin? No, to je možné.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_06");	//Co se meče týče - myslím, že ti nebude vadit, když si ho nechám.
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_07");	//A co slíbená odměna?
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_08");	//Jak jsme se dohodli - 1000 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_09");	//Věřím, že je to dostatečné množství pro kompenzaci tvé snahy.
	MIS_AssasinHelp = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AssasinHelp,LOG_SUCCESS);
	B_LogEntry(TOPIC_AssasinHelp,"Přinesl jsem Gonzalesovi obouručák, který jsem získal od Percivala. Byl z něj nadšený.");
};

instance DIA_NONE_119_Assasin_PrioratBlade(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBlade_Condition;
	information = DIA_NONE_119_Assasin_PrioratBlade_Info;
	permanent = FALSE;
	description = "Ty jsi asasín, že?";
};

func int DIA_NONE_119_Assasin_PrioratBlade_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratKnowsAssasins == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBlade_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_00");	//Ty jsi asasín, že?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_01");	//Hmmm. (arogantně) To jsi uhodl sám, nebo ti to někdo řekl?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_02");	//Vidím, že mám pravdu. Potom jsi přesně ten, koho potřebuju.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_03");	//Musím se tě zeptat otázku, na kterou, doufám, znáš odpověď.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_04");	//Skutečně?! Tak se ptej.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_05");	//Můžeš se podívat na jeden meč? Slyšel jsem, že pochází ze země, odkud pocházíš.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_06");	//Hmmm. Zaujal si mě. Ukaž.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_07");	//Na, tady je.
	B_GiveInvItems(other,self,ItMw_1H_AssBlade,1);
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_08");	//Neuveřitelné, kde jsi ho našel?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_09");	//Po pravdě je to hodně dlouhý příbeh a...
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_10");	//(vážně) Já mám dost času si ho vyslechnout.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_11");	//A pak, když mi ho řekneš, zasypu tě horou zlata, jakou jsi ještě nikdy neviděl.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_12");	//Vidím, že tě meč zaujal. Mimochodem, ta zbraň má na rukojeti nějaké zvláštní symboly.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_13");	//To je pravda! Obvykle, takovéto čepele nejsou v naší oblasti běžné.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_14");	//Ale tyto symboly... (vážně) Tak mi pověz - jak se tato zbraň ocitla ve tvých rukách?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_15");	//No dobře. Tuto zbraň jsem sebral jednomu zvláštnímu člověku.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_16");	//Jak vypadal?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_17");	//Jeho tvář jsem neviděl - měl na sobě masku.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_18");	//Měl zvláštně vypadající tetovaní?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_19");	//Přesně.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_20");	//Pak je vše jasné. A kde jsi ho potkal?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_21");	//Narazil jsem na něj v jeskyni. Krvácel.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_22");	//I přesto jsem měl celkem potíže zabránit mu, aby mě zabil.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_23");	//Máš štěstí, že jsi pořád naživu! Obvykle je střetnutí s těmito lidmi to poslední, co člověk zažije.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_24");	//A co jsou zač? Vypadá to, že o nich něco víš.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_25");	//Víc, než si myslíš.

	if(MIS_AssasinHelp == LOG_SUCCESS)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_26");	//Možná mi o nich můžeš něco říct.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_27");	//Hmmm... (zamyšleně) A je to pro tebe důležité?
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_28");	//Neumíš si představit jak.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_29");	//Dobrá. Pomohl jsi mi s mým problémem - teď pomůžu já tobě...
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_30");	//Tak poslouchej pozorně. Ten, na kterého jsi narazil, patří k stínům Masyafu.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_31");	//Je to prastaré bratrstvo nelítostných vrahů, které po celém Varantu šíří strach už jen svým jménem.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_32");	//Myslím, že sám chápeš, jak mocní a nelítostní jsou.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_33");	//Místní vrahové jsou jen děti, když je postavíš vedle stínů Masyafu.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_34");	//A to se nikdo nepokusil je zlikvidovat?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_35");	//Není to tak lehké kamaráde. (sarkasticky) Dostat i jednoho z nich je téměř nemožné.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_36");	//Ale to, co se stalo tobě, mě skutečně překvapuje!
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_37");	//Někteří mocní občas využívají služby asasínů, aby své problémy vyřešili pomocí jejich dýky.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_38");	//Kolují zvěsti, že i sám Zuben využil služby bratrstva.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_39");	//Zuben?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_40");	//(uctivě) Zuben. To je ten, který právem nejsilnějšího asasína vládne Varantu po mnoho let.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_41");	//Uhm, chápu.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_42");	//Málokdo se odváží jít proti nim. Každý si cení svého života.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_43");	//Stínové nikomu nikdy nic neodpustí!
		B_LogEntry(TOPIC_PrioratStart,"Gonzales, asasín z Varantu, na první pohled věděl, komu meč patří. Jeho majitel byl jedním z prastarého bratrstva vrahů z Varantu, stínů Masyafu.");
		AssBlaseHistory = TRUE;
	}
	else
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_44");	//Nevěřím ti dostatečně na to, abych s tebou rozebíral takovéto věci.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_45");	//Na vezmi si svůj meč. Vše, co jsem chtěl vědět. jsem se už dověděl.
		B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
		B_LogEntry(TOPIC_PrioratStart,"Gonzales, asasín z Varantu, na první pohled věděl, komu meč patří. Avšak nevěří mi dostatečně na to, aby si se mnou o tom pohovořil.");
		AssDoNotTrust = TRUE;
	};
};

instance DIA_NONE_119_Assasin_PrioratBladeTrust(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBladeTrust_Condition;
	information = DIA_NONE_119_Assasin_PrioratBladeTrust_Info;
	permanent = FALSE;
	description = "Možná teď už mi můžeš říct, co jsou zač?";
};


func int DIA_NONE_119_Assasin_PrioratBladeTrust_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (MIS_AssasinHelp == LOG_SUCCESS) && (AssDoNotTrust == TRUE) && (AssBlaseHistory == FALSE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBladeTrust_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_00");	//Možná teď už mi můžeš říct, co jsou zač?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_01");	//Hmmm... (zamyšleně) A je to pro tebe důležité?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_02");	//Neumíš si představit jak.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_03");	//Dobrá. Pomohl jsi mi s mým problémem - teď pomůžu já tobě...
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_04");	//Tak poslouchej pozorně. Ten, na kterého jsi narazil, patří k stínům Masyafu.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_05");	//Je to prastaré bratrstvo nelítostných vrahů, které po celém Varantu šíří strach už jen svým jménem.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_06");	//Myslím, že sám chápeš, jak mocní a nelítostní jsou.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_07");	//Místní vrahové jsou jen děti, když je postavíš vedle stínů Masyafu.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_08");	//A to se nikdo nepokusil je zlividovat?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_09");	//Není to tak lehké kamaráde. (sarkasticky) Dostat i jednoho z nich je téměř nemožné.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_10");	//Ale to, co se stalo tobě, mě skutečně překvapuje!
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_11");	//Někteří mocní občas využívají služby asasínů, aby své problémy vyřešili pomocí jejich dýky.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_12");	//Kolují zvěsti, že i sám Zuben využil služby bratrstva.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_13");	//Zuben?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_14");	//(uctivě) Zuben. To je ten, který právem nejsilnějšího asasína vládne Varantu po mnoho let.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_15");	//Uhm, chápu.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_16");	//Málokdo se odváží jít proti nim. Každý si cení svého života.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_17");	//Stínové nikomu nikdy nic neodpustí!
	B_LogEntry(TOPIC_PrioratStart,"Podle Gonzalese tajemná zbraň patřila jednomu z bojovníků prastarého bratrstva Varantských vrahů - stínů Masyafu.");
	AssBlaseHistory = TRUE;
};

instance DIA_NONE_119_Assasin_TellAboutVarrant(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 2;
	condition = DIA_NONE_119_Assasin_TellAboutVarrant_Condition;
	information = DIA_NONE_119_Assasin_TellAboutVarrant_Info;
	permanent = FALSE;
	description = "Pověz mi o Varantu.";
};

func int DIA_NONE_119_Assasin_TellAboutVarrant_Condition()
{
	if(AssBlaseHistory == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_TellAboutVarrant_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_TellAboutVarrant_01_00");	//Pověz mi o Varantu.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_01");	//Co ti mám říct. Typická poušť. Všude samý horký písek a na nebi pražící slunce.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_02");	//To horko může nepřipravenou osobu přivést do šílenství.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_03");	//Ale za ta léta jsme se to my -místní obyvatelé, naučili nějak přežívat.
	AI_Output(other,self,"DIA_NONE_119_Assasin_TellAboutVarrant_01_04");	//Jasně.
};

instance DIA_NONE_119_Assasin_HotReduce(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 2;
	condition = DIA_NONE_119_Assasin_HotReduce_Condition;
	information = DIA_NONE_119_Assasin_HotReduce_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit jak vydržet horko?";
};

func int DIA_NONE_119_Assasin_HotReduce_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_NONE_119_Assasin_TellAboutVarrant) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_HotReduce_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduce_01_00");	//Můžeš mě naučit jak vydržet horko?
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_01");	//Hmmm. Nevím. Je to studium na celé roky.
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_02");	//Ale můžu ti dát pár tipů, jak vydržet trochu tepla a pálivého slunečního světla.
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_03");	//Avšak potřebuješ nějaké zkušenosti. A také nějaké zlaťáky.
	GonsaCanTeachMeHot = TRUE;
};

instance DIA_NONE_119_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 800;
	condition = DIA_NONE_119_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_119_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Nauč mě vydržet horko. (VB: 10, cena: 5000 zlatých)";
};

func int DIA_NONE_119_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_HotReduceTeach_Info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Nauč mě vydržet horko.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Je mi líto, ale nemáš dostatek zkušeností.
		AI_StopProcessInfos(self);
	};

	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_02");	//Je mi líto, ale nebude to zadarmo.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Nedělej zbytečné pohyby.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Pohybuj se co nejméně, šetři energii.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Horko může být mnohem více vyčerpávající než boj s celou smečkou nestvůr.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_NONE_119_Assasin_PrioratBladeKnown(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBladeKnown_Condition;
	information = DIA_NONE_119_Assasin_PrioratBladeKnown_Info;
	permanent = FALSE;
	description = "Co víš o zbraních?";
};

func int DIA_NONE_119_Assasin_PrioratBladeKnown_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBladeKnown_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_00");	//Co víš o zbraních?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_01");	//My, asasíni, je nazýváme qama. Lehké, velice odolné a smrtící pro ty, kteří se proti nim postaví. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_02");	//Buď opatrný, jestli se rozhodneš nějakou z nich použít. Čepel je otrávená poměrně silným jedem.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_03");	//To je potom velká výhoda.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_04");	//Chápu.
	Npc_RemoveInvItems(other,ItMw_1H_AssBlade,Npc_HasItems(other,ItMw_1H_AssBlade));
	CreateInvItems(other,ItMw_1H_AssBlade_Known,1);
	B_LogEntry(TOPIC_PrioratStart,"Zbraně asasínů se nazývají qama. Jestli se je rozhodnu je použít, musím počítat s tím, že čepel je otrávená silným jedem, který zabije všechno živé.");
};


instance DIA_NONE_119_Assasin_PrioratNeedFind(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratNeedFind_Condition;
	information = DIA_NONE_119_Assasin_PrioratNeedFind_Info;
	permanent = FALSE;
	description = "Ohledně bratrstva...";
};


func int DIA_NONE_119_Assasin_PrioratNeedFind_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratNeedFind_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_01");	//Ohledně bratrstva...
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_02");	//Nenapadá tě, proč jsou na ostrově?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_03");	//Očividně je sem něco přitáhlo. Jen tak by bratrstvo nikdy neopustilo Varant.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_04");	//Pravda, nedávno jsem slyšel, že Masyaf se stal příliš prahnoucím po krvi a to se Zubenovi moc nelíbilo.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_05");	//Ve výsledku se stínové pod jeho tlakem museli ukrývat.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_06");	//A očividně se jim zalíbil ostrov.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_07");	//Myslíš, že mám šanci je tady najít?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_08");	//Nuže, jestli jsi zvládl najít jednoho, myslím, že máš. (úškrn) Beliar nežertuje.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_09");	//Ale měl by sis uvědomit, že ty sám proti nim moc nezmůžeš.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_10");	//Takže jestli je najdeš - nezapomeň mi o tom říct.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_11");	//Proč tobě?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_12");	//To teď není důležité. (Vážně) Prostě mi dej vědět jestli najdeš místo jejich úkrytu.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_13");	//Dobře.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_14");	//Nezapomeň.
	GonsalesRemind = TRUE;
};


instance DIA_NONE_119_Assasin_AmuletFind(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_AmuletFind_Condition;
	information = DIA_NONE_119_Assasin_AmuletFind_Info;
	permanent = FALSE;
	description = "Myslím, že mám pro tebe něco zajímavého.";
};


func int DIA_NONE_119_Assasin_AmuletFind_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssInvasionStop == TRUE) && (NamibAmuletResearch == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_AmuletFind_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_01");	//Myslím, že mám pro tebe něco zajímavého.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_02");	//Co přesně?
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_03");	//Tady, podívej se na tenhle amulet.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_04");	//Hmmm. (zamyšleně) Amulet? Ne chlape, tohle není amulet. I když vypadá podobně.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_05");	//A co to je?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_06");	//Tento medailon, který mi ukazuješ, není nic jiného než tajné znamení bratrstva Masyaf!
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_07");	//Jsi si jistý?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_08");	//Je těžké si ho s něčím splést.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_09");	//A když jeden máš, znamená to, že se k nim můžeš dostat blíž, než by sis dokázal představit.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_10");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_11");	//Vidíš tenhle kovový vzor ve středu medailonu? Je tam z nějakého důvodu.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_12");	//Jestli věříš zvěstím, stínové Masyafu ho používají jako klíč k je tajnému doupěti.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_13");	//(Nepřítomně) Pravda nebo ne... kdo ví.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_14");	//Ale dostat se k takové věci je téměř nemožné, semozřejmě pokud nejsi jedním z nich.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_15");	//Mám prostě štěstí.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_16");	//Nikdy nevíš. (úsměv) Mnozí se drží stranou od takových věcí.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_17");	//Ale očividně nejsi jedním z nich.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_18");	//(Vážně) Pokud najdeš něco zajímavého, přijď mi o tom říct.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_19");	//Dobře.
	PlayerKnowsMasiafKey = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Ukázal jsem Gonzalesovi amulet, který jsem našel u jednoho z vrahů. Podle něj je to tajný znak bratrstva Masyaf. Stínové používají tenhle medailon jako klíč. Avšak nikdo neví, co se skutečně dá tímto klíčem otevřít. Gonzales mi řekl, že jestli přidju na něco zajímavého, mám mu dát vědět.");
};

instance DIA_NONE_119_Assasin_PrioratFindOk(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratFindOk_Condition;
	information = DIA_NONE_119_Assasin_PrioratFindOk_Info;
	permanent = FALSE;
	description = "Mám novinky.";
};

func int DIA_NONE_119_Assasin_PrioratFindOk_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (GonsalesRemind == TRUE) && (ReadyGoForMasiafLair == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratFindOk_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_01");	//Mám novinky.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_02");	//Hmmm... (sarkasticky) Tak to nemůže být zlé.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_03");	//Našel jsem tajný průchod v hoře.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_04");	//A co já s tím?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_05");	//Ten průchod se otevřel, když jsem použil medailon, který jsem našel u tvého starého známeho.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_06");	//No! Hned je to zajímavější! Už si ním prošel?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_07");	//Ještě ne. Ale mám v plánu tam jít a zjistit, co se skrývá na druhé straně.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_08");	//Dobře. Ale ještě předtím bych chtěl, abys mi to místo ukázal.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_09");	//Samozřejmě.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_10");	//Pak tedy pojďme! Konečně si trochu protáhnu nohy. Už mě to v téhle krčmě stejně přestávalo bavit.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_11");	//Pojď tedy za mnou.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowMasiafLair");
	Log_CreateTopic(TOPIC_FollowMasiafLair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FollowMasiafLair,LOG_Running);
	B_LogEntry(TOPIC_FollowMasiafLair,"Gonzales po mě chce, abych ho vzal do tajného průchodu, který jsem byl schopný otevřít.");
	MIS_FollowMasiafLair = LOG_Running;
};


instance DIA_NONE_119_Assasin_ANGEKOMMEN(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 55;
	condition = DIA_NONE_119_Assasin_ANGEKOMMEN_Condition;
	information = DIA_NONE_119_Assasin_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_NONE_119_Assasin_ANGEKOMMEN_Condition()
{
	if((MIS_FollowMasiafLair == LOG_Running) && (Npc_GetDistToWP(self,"NW_ASSASINS_ENTRANCE_01") < 2000))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_ANGEKOMMEN_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_00");	//Moment! Už to vidím...
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_01");	//Jo, to je průchod o kterém jsem ti říkal.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_02");	//Díky. Dál už si poradím sám.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_03");	//Co plánuješ?
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_04");	//Nejdřív si trochu odpočinu a pak půjdu dál - musím prozkoumat kam ta jeskyně vede.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_05");	//A mimochodem, jestli plánuješ to samé, být tebou tak se nejdřív pořádně připravím.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_06");	//Protože jestli tam je to, co si myslím... nemusí to být, uhm, jednoduché.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_07");	//Beru na vědomí.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_08");	//Není zač příteli! Uvidíme se později...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_FollowMasiafLair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FollowMasiafLair,LOG_SUCCESS);
	B_LogEntry(TOPIC_FollowMasiafLair,"Dovedl jsem Gonzalese na to místo.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};


//--------------------Gonsales v PRIORAT-------------------------------



instance DIA_NONE_1190_Assasin_EXIT(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 999;
	condition = DIA_NONE_1190_Assasin_EXIT_Condition;
	information = DIA_NONE_1190_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1190_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1190_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 900;
	condition = DIA_NONE_1190_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_1190_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1190_Assasin_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1190_Assasin_PICKPOCKET,Dialog_Back,DIA_NONE_1190_Assasin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1190_Assasin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1190_Assasin_PICKPOCKET_DoIt);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
};


instance DIA_NONE_1190_Assasin_PreHallo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PreHallo_Condition;
	information = DIA_NONE_1190_Assasin_PreHallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_PreHallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_PreHallo_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreHallo_01_00");	//Aha tady jsi. (úsměv) Pojď sem, sedni si k ohni, ohřej se.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreHallo_01_01");	//Nikam nespěcháme.
};


instance DIA_NONE_1190_Assasin_Hallo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Hallo_Condition;
	information = DIA_NONE_1190_Assasin_Hallo_Info;
	permanent = FALSE;
	description = "Co je to za místo?";
};

func int DIA_NONE_1190_Assasin_Hallo_Condition()
{
	return TRUE;
};

func void DIA_NONE_1190_Assasin_Hallo_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_00");	//Co je to za místo?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_01");	//Jak to mám vědět? Jsem tady poprvé, stejně jako ty.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_02");	//Ale být tebou - nešel bych tam.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_03");	//Proč?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_04");	//Protože tam nic kromě smrti není. Teda jestli jsi sebevrah směle vpřed...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_05");	//Co by tam mohlo být tak nebezpečné?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_06");	//Před námi je svatyně bratrstva Masyaf. (vážně) A skutečně si nemyslím, že tě přivítají s otevřenou náručí.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_07");	//Takže jsme našli jejich doupě?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_08");	//Jo ale... Otázka je - co s tím uděláme?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_09");	//Co navrhuješ?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_10");	//Nuže, podle mě jsou... Hmm... tři řešení tohoto problému.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_11");	//Pokud si na to věříš, můžeme zkusit přístup hrubou silou a rozběhnout se na ně.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_12");	//Ale podle mě je to hloupý nápad. Pravděpodobně se nedostaneme ani k branám.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_13");	//Vzhledem k tomu, že převaha jednoznačně není na naší straně.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_14");	//Druhá možnost je, že odsud zmizíme, budeme se tvářit, že jsme tady nikdy nebyli a zapomeneme na tuto noční můru.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_15");	//Ale abych byl přesný, ty můžeš. Já jsem nepřekročil oceán abych se takhle lehce vzdal svých plánů.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_16");	//Zachráníš si život. To se celkem vyplatí, nemyslíš?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_17");	//Můžeš to zkusit sám, ale cesta zpět je zasypaná kameny, takže jednoduše odkráčet pryč už není možné.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_18");	//Tím lépe! Takže není cesty zpět.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_19");	//Dobře. A co ta třetí možnost?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_20");	//Třetí možnost je ještě horší než první dvě. Musíme se nějak dostat do chrámu, ale bez zbytečného hluku.

	if((PlayerIsPrioratFake == FALSE) && (InsMasiafKillers == FALSE))
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_21");	//Víš jak to udělat?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_22");	//Ne. Ale mám jiný nápad. A ten by mohl fungovat.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_23");	//No tak mluv, jaký nápad?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_24");	//Dobře. Takže (vážně) Trčím tady už několik dní a za ten čas jsem stihl cosi zpozorovat.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_25");	//Někdy z chrámu směrem k útesům chodí jeden z noviců bratrstva.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_26");	//Nejdřív mě to moc nezajímalo, dokud jsem neviděl, s kým se vrací zpět.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_27");	//A s kým?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_28");	//Vedl s sebou do chrámu několik otroků...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_29");	//Rozhodl jsem se to místo prozkoumat a jak se ukázalo - ve skále je jeskyně.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_30");	//Nešel jsem hluboko dovnitř, ale zdá se, že někde tam drží své zajatce.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_31");	//Co tedy navrhuješ?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_32");	//Jediný způsob jak se dostat do chrámu, aniž bychom na sebe upoutali pozornost, je tvářit se jako jeden z nich.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_33");	//Plán je to samozřejmě skvělý, ale proč jsi to už neudělal sám?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_34");	//Ne! Někteří z nich mě už předtím viděli. Ale teď jsi tady ty!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_35");	//Zabiješ ho, vezmeš si jeho zbroj a místo něj odvedeš otroky do chrámu.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_36");	//Jsem si celkem jistý, že jednoho přemoci zvládneš.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_37");	//A zbytek vymyslíme za pochodu.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_38");	//Tak co říkáš?
		Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Raději budu bojovat, nemám čas na hrátky.",DIA_NONE_1190_Assasin_Hallo_Fight);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Doufám, že tvůj plán bude fungovat.",DIA_NONE_1190_Assasin_Hallo_Spy);
	}
	else
	{
		Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Raději budu bojovat, nemám čas na hrátky.",DIA_NONE_1190_Assasin_Hallo_Fight);
	};
};

func void DIA_NONE_1190_Assasin_Hallo_Fight()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_Fight_01_01");	//Raději budu bojovat, nemám čas na hrátky.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_02");	//Ach, vidím, že jsi nedočkavý...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_03");	//Ale jestli si tak věříš, tak nebudeme ztrácet čas.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_04");	//Běž a já tě budu následovat.
	PlayerChooseFight_PW = TRUE;
	PlayerIsPrioratFake = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_MasiafStory = LOG_Running;
	Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	B_LogEntry(TOPIC_MasiafStory,"Opět jsem potkal Gonzalese. Podle něj je v tomhle údolí chrám stínů Masyafu. Myslím, že jsem našel, co jsem hledal. Teď musíme vymyslet, co dál. Bez rozmyslu jsem navrhl, abychom na chrám zaútočili. Gonzalesovi se to zdá trochu absurdní ale podpoří mě. Je načase zlikvidovat tenhle temný kult.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

func void DIA_NONE_1190_Assasin_Hallo_Spy()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_Spy_01_01");	//Doufám, že tvůj plán bude fungovat.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_02");	//Jestli nebude, tak budeme oba zanedlouho mrtví, takže žádný strach.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_03");	//Stínové si uvědomí, že tady nejsou sami a pravděpodobně vyšlou ostatní aby nás našli.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_04");	//Je to jen otázka času.
	MIS_MasiafStory = LOG_Running;
	Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	B_LogEntry(TOPIC_MasiafStory,"Opět jsem potkal Gonzalese. Podle něj je v tomhle údolí chrám stínů Masyafu. Myslím, že jsem našel, co jsem hledal. Teď musíme vymyslet, co dál. Gonzales navrhl, že se v tichosti vkrademe do chrámu. Každé ráno se jeden z noviců vydá na cestu k vysokým horám a vrací se s uvězněnými otroky. Pokud přerušíme konvoj, možná se mi povede proniknout dovnitř jako jeden z noviců bratrstva.");
	PlayerChooseSpy_PW = TRUE;
	Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
};

var int PW_BeginFakeOnceAgainQuest;

instance DIA_NONE_1190_Assasin_When(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_When_Condition;
	information = DIA_NONE_1190_Assasin_When_Info;
	permanent = TRUE;
	description = "Kdy začneme?";
};

func int DIA_NONE_1190_Assasin_When_Condition()
{
	if((PlayerChooseSpy_PW == TRUE) && (PW_BeginFake == FALSE) && (PlayerIsPrioratFake == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_When_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_00");	//Kdy začneme?

	if(Wld_IsTime(7,0,8,0))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_01");	//Teď! Myslím, že je přesně čas, kdy by měl táhnout otroky zpět do chrámu.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_02");	//Ale dávej si pozor, máš jen jednu šanci.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_03");	//Jestli ti uteče, tak vyvolá poplach. A pak je vše ztraceno...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_04");	//Tak buď opatrný.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_05");	//Vynasnažím se.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_06");	//A ještě jedna věc. Nic se nesnaž dělat sám!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_07");	//Pokud vím, stínové Masyafu mají svá vlastní pravidla.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_08");	//Jestli uděláš něco špatně, okamžitě poznají, že nejsi jedním z nich.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_09");	//A neodejdeš odtamtud živý. Rozumíš?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_10");	//Dobře. A kam to mám vlastně jít?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_11");	//Jdi rovně, hluboko do údolí, dokud nenarazíš na malou stezku.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_12");	//Tam na ně počkej. Ale už běž!
		B_LogEntry(TOPIC_MasiafStory,"Tak, je načase jednat. Potřebuju vystopovat novice a jeho otroky. Následně získat jeho zbroj a dostat se do chrámu. Doufám, že to vyjde, jinak se budu muset prosekat dovnitř.");
		PW_BeginFake = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Ass_167_Adept_Convoy,"PW_CONVOY_START_01");
		Wld_InsertNpc(SEK_168_SLAVEOBSSEK,"PW_CONVOY_START_01");
	}
	else
	{
		if(PW_BeginFakeOnceAgainQuest == FALSE)
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_13");	//Je třeba počkat do rána, tak do sedmi hodin. (zívnutí) Předtím nikdo ven nevyjde.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_14");	//Chápu.
			PW_BeginFakeOnceAgainQuest = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_15");	//Řekl jsem ti - čekáme do rána! Neposloucháš nebo co?
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_NONE_1190_Assasin_WhatYourGoal(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatYourGoal_Condition;
	information = DIA_NONE_1190_Assasin_WhatYourGoal_Info;
	permanent = FALSE;
	description = "Co máš společné s bratrstvem Masyaf?";
};

func int DIA_NONE_1190_Assasin_WhatYourGoal_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatYourGoal_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatYourGoal_01_00");	//Co máš společné s bratrstvem Masyaf?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatYourGoal_01_01");	//Och, je to dlouhý příběh, možná ti ho řeknu jindy.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatYourGoal_01_02");	//Teď bude lepší to nerozebírat.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatYourGoal_01_03");	//Dobře.
};


instance DIA_NONE_1190_Assasin_WhatAbout(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatAbout_Condition;
	information = DIA_NONE_1190_Assasin_WhatAbout_Info;
	permanent = FALSE;
	description = "Co mi ještě můžeš říct o Masyafu?";
};

func int DIA_NONE_1190_Assasin_WhatAbout_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatAbout_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAbout_01_00");	//Co mi ještě můžeš říct o Masyafu?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_01");	//Hmmm... (zamyšleně) Moc ne.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_02");	//Ve zkratce stínové Masyafu - slepí fanatici, kteří neznají lítost ani vděčnost.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_03");	//Za ta léta si vybudovali pověst, která vyvolává strach a hrůzu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_04");	//Tito lidé, jestli je tak můžu vůbec nazývat... nic je na jejich cestě nezastaví.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_05");	//Jsou z Varantu, takže uctívají Beliara, jako všichni asasíni.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_06");	//Avšak místo zlata mu obětují lidské životy.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_07");	//Říká se, že sám Beliar nad nimi drží ochrannou ruku. Ale to je jen fámy.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_08");	//Jejich zákony jsou kruté a přísné.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_09");	//Železná disciplína a těžký trénink z nich dělají nejlepší bojovníky jaké jsem kdy viděl.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_10");	//Já osobně jsem viděl jak jeden elitní stín Masyafu překonal ochranu několika lidí kolem jednoho z místodržících jmenovaných Zubenem.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_11");	//Pak očividně začali mít problémy, kvůli kterým se museli přesunout z kontinentu sem.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_12");	//Takže je před námi je nebezpečný nepřítel, kterého bys neměl podceňovat.
};

instance DIA_NONE_1190_Assasin_WhatAdvise(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatAdvise_Condition;
	information = DIA_NONE_1190_Assasin_WhatAdvise_Info;
	permanent = FALSE;
	description = "Můžeš mi dát nějakou radu?";
};

func int DIA_NONE_1190_Assasin_WhatAdvise_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatAdvise_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_00");	//Můžeš mi dát nějakou radu?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_01");	//Dělej jen to, čím si jsi jistý.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_02");	//V každém případě chyby povedou k neúspěchu a v horším případě k tvé smrti.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_03");	//Takže předtím jak půjdeš do chrámu, bude asi lepší, když si sundáš helmu a štít.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_04");	//Proč?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_05");	//Bojovníci bratrstva nepoužívají tenhle typ ochrany v boji. Hned by tě to prozradilo.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_06");	//A ani nezkoušej tam něco ukrást. Za žádných okolností. Zloděje nemají v lásce...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_07");	//Jasně.
	B_LogEntry(TOPIC_MasiafStory,"Gonzales mi poradil, abych si sundal přilbu a štít, jestli půjdu do chrámu. Stínové takovou zbroj nepoužívají a rychle by mě prohlédli.");
};

instance DIA_NONE_1190_Assasin_InHram(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_InHram_Condition;
	information = DIA_NONE_1190_Assasin_InHram_Info;
	permanent = FALSE;
	description = "Podařilo se mi dostat do chrámu.";
};

func int DIA_NONE_1190_Assasin_InHram_Condition()
{
	if(MeetNrozas == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_InHram_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_00");	//Podařilo se mi dostat do chrámu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_01");	//Takže se ti podařilo ujmout role novice? To jsou vynikající zprávy, co dalšího?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_03");	//Musím poslouchat jistého Nrozase. Všichni mu tam říkají mistr.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_04");	//Zjevně je jedním z převorů Masyafu.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_05");	//Převorů?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_06");	//Pokud vím, tak tito lidé stojí v čele bratrstva a mají nekonečnou úctu mezi ostatními fanatiky.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_07");	//Z toho vyplývá, že s ním musíme být nadmíru ostražití!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_08");	//Nrozas mi dal nějaké pokyny, které musím splnit.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_09");	//Věřím, že tuto šanci musíme využít.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_10");	//Pokud se předvedeš v dobrém světle, pravděpodobně získáš jeho respekt a to nám dá šanci zjistit o nich něco víc!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_11");	//Takže pokračuj v plnění příkazů, které dostaneš.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_12");	//Doufám, že nakonec objevíme jejich slabé místo a zasadíme jim smrtelný úděr.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_13");	//Rozumím.
	B_LogEntry(TOPIC_MasiafStory,"Řekl jsem Gonzalesovi, že se mi podařilo dostat do chrámu. Byl nadmíru překvapený. Řekl mi, abych zůstal v roli novice a počkal, co se bude dít.");
};

instance DIA_NONE_1190_Assasin_NARUG(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NARUG_Condition;
	information = DIA_NONE_1190_Assasin_NARUG_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_NARUG_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (NarugIsDeadNow == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NARUG_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_00");	//Á, to jsi ty... už jsem si myslel, že budu muset dnes prolít další krev.
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NARUG_01_01");	//Ty jsi ho zabil?!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_02");	//Jak vidíš. Nezlob se, ale neměl jsem na výběr.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_03");	//Nevím jak mě našel, ale nemohl jsem ho nechat jít.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_04");	//Co tě znepokojuje?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NARUG_01_05");	//Měl jsem příkaz dát mu zlato za nové otroky.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_06");	//Hmmm, Hmmm... (zamyšleně) To není zrovna dobré.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_07");	//Ale teď tomu už nepomůžeme. Co se stalo stalo se.
	B_LogEntry(TOPIC_AssasinGold,"Vypadá to tak, že Narug našel Gonzalesovo útočiště, tak neměl na výběr a musel se ho zbavit. Teď máme větší problém, protože ztráta jednoho ze stínů Masyafu nezůstane dlouho nepovšimnutá.");
	NarugIsDead = TRUE;
};


instance DIA_NONE_1190_Assasin_NarugProblem(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Info;
	permanent = FALSE;
	description = "Co uděláme?";
};

func int DIA_NONE_1190_Assasin_NarugProblem_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (NarugIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_00");	//Co uděláme?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_01");	//Hmmm... (zamyšleně) Dobrá otázka. Kéžby odpoveď byla tak jednoduchá.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_02");	//Podle mě je jen jedna věc, kterou teď můžeme udělat...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_03");	//... musíme zajistit, aby to vypadalo tak, že stínové ztratili bojovníka nějakou nešťastnou shodou náhod.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_04");	//Přesně tak! Prostě zakopl a upadl na svůj meč. To je běžný úraz...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_05");	//Tak nějak. Každý zkušený bojovník hned pozná, že zemřel v boji.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_06");	//Takže tato možnost není řešením.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_07");	//Co myslíš, jaký důvod bude stínům stačit?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_08");	//Všechno záleží na tom, jak byl důležitý...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_09");	//Ztráta jednoho novice je nic, ale ztráta elitního bojovníka...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_10");	//Mimochodem, říkáš, že máš u sebe něco, co jsi mu měl dát?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_11");	//Jo, měšec zlatých.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_12");	//Hmmm. Ukaž, ať se na něj podívám.

	if(Npc_HasItems(other,ItMi_AssGoldPocket) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_13");	//Tady.
		B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_14");	//Vypadá to tak, že ten měšec není od žádného obyčejného člověka.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_15");	//Proč myslíš?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_16");	//Podívej se, na měšci je vyšitý znak překřížených mečů.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_17");	//A to znamená, že máme co dočinění s celkem vlivným člověkem v bratrstvu.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_18");	//Jo, máš pravdu, dal mi ho jeden z převorů Masyafu.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_19");	//Takže tak? Hmmm... A jinak ti nic nedal?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_20");	//Ne. Dal mi jen dva měšce, které jsem měl dát stínům.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_21");	//Takže jsou dva?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_22");	//Jo, ten druhý jsem měl dát stínovi jménem Hasim.

		if(HasimGetHisGold == TRUE)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_23");	//A ten ho už dostal.
		};

		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_24");	//Hmmm... Mám nápad jak vyřešit tuto přímo zapeklitou situaci...
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_25");	//Opravdu?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_26");	//Přesně tak. Je to ale celkem riskantní, hodně záleží na tom, jak moc ti bratrstvo věří.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_27");	//No pokračuj...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_28");	//Poslouchej pozorně. Vezmi tento měšec a dej ho Hasimovi.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_29");	//Řekni, že jsi nenašel jeho přítele a že mu má dát měšec jestli ho náhodou nepotká.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_30");	//Běžně mají stínové zakázano brát si věci, které jim nepatří.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_31");	//Takže na to (se širokým úsměvem) jak ho přinutit vzít si ho, musíš přijít sám.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_32");	//Je důležité, aby tě poslechl. To je první půlka.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_33");	//Rozumím, zní to zatím neuvěřitelně jednoduše. Pokračuj.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_34");	//Potom jdi za převorem, který ti zadal tento úkol a řekni mu, že jsi ji splnil.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_35");	//Takže budu lhát, že jsem dal zlato oběma?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_36");	//Přesně tak. A pak musíme nějakou chvíli počkat.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_37");	//Dřív nebo později si stínové všimnou, že jim chybí bojovník. A pak uvidíme jak byl pro ně důležitý.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_38");	//Och, a ještě jedna věc...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_39");	//Když budeš mluvit s Hasimem, bylo by fajn mu něco ukrást.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_40");	//A my to dáme našemu mrtvému příteli.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_41");	//Poté se už Hasim nevyvleče z toho, že zabil jednoho ze stínů a vzal zlato.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_42");	//Takže tohle je náš plán. Není to sice nic pěkného, ale je to celkem mazané.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_43");	//(Vážně) Vypadá to, že jsi zapomněl s kým máš tu čest. A ve válce, jak se říká, jsou všechny prostředky dovoleny.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_44");	//Tak vezmi měšec a jdi rychle vykonat náš plán.
		B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_45");	//Zase já...
		B_LogEntry(TOPIC_AssasinGold,"Gonzales vymyslel, co budeme dělat. Mám dát Hasimovi další měšec zlata, který byl původně pro Naruga. Avšak zákony bratrstva zakazují brát si věci, které patří druhým. Taky bych měl ukrást nějakou Hasimovu osobní věc. Tu pak dám mrtvole Naruga a nahlásím Hasima za jeho vraždu, když ho začnou hledat.");
		MakeHasimKiller = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_171_Adept,"TOT");
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_46");	//Nemám ho tady.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_47");	//Tak ho bež najít a dones ho.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_48");	//Možná nám to pomůže. I když si nejsem úplně jistý jak...
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_49");	//Jak myslíš.
		B_LogEntry(TOPIC_AssasinGold,"Gonzales chce, abych se podíval po měšci, který dal Osair Narugovi. Naneštěstí ho nemám u sebe.");
		PreMakeHasimKiller = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_NONE_1190_Assasin_NarugProblem_Temp(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Temp_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Temp_Info;
	permanent = FALSE;
	description = "Tady je ten měšec.";
};

func int DIA_NONE_1190_Assasin_NarugProblem_Temp_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (PreMakeHasimKiller == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (MakeHasimKiller == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Temp_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_13");	//Tady je ten měšec.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_14");	//Vypadá to tak, že ten měšec není od žádného obyčejného člověka.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_15");	//Proč myslíš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_16");	//Podívej se, na měšci je vyšitý znak překřížených mečů.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_17");	//A to znamená, že máme co dočinění s celkem vlivným člověkem v bratrstvu.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_18");	//Jo, máš pravdu, dal mi ho jeden z převorů Masyafu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_19");	//Takže tak? Hmmm... A jinak ti nic nedal?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_20");	//Ne. Dal mi jen dva měšce, které jsem měl dát stínům.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_21");	//Takže jsou dva?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_22");	//Jo, ten druhý jsem měl dát stínovi jménem Hasim.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_23");	//A už ho dostal.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_24");	//Hmmm... Mám nápad jak vyřešit tuto přímo zapeklitou situaci...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_25");	//Opravdu?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_26");	//Přesně tak. Je to ale celkem riskantní, hodně záleží na tom, jak moc ti bratrstvo věří.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_27");	//No pokračuj...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_28");	//Poslouchej pozorně. Vezmi tento měšec a dej ho Hasimovi.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_29");	//Řekni, že jsi nenašel jeho přítele a že mu má dát měšec jestli ho náhodou nepotká.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_30");	//Běžně mají stínové zakázano brát si věci, které jim nepatří.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_31");	//Takže na to (se širokým úsměvem) jak ho přinutit vzít si ho, musíš přijít sám.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_32");	//Je důležité, aby tě poslechl. To je první půlka.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_33");	//Rozumím, zní to zatím neuvěřitelně jednoduše. Pokračuj.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_34");	//Potom jdi za převorem, který ti zadal tento úkol a řekni mu, že jsi ji splnil.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_35");	//Takže budu lhát, že jsem dal zlato oběma?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_36");	//Přesně tak. A pak musíme nějakou chvíli počkat.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_37");	//Dřív nebo později si stínové všimnou, že jim chybí bojovník. A pak uvidíme jak byl pro ně důležitý.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_38");	//Och, a ještě jedna věc...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_39");	//Když budeš mluvit s Hasimem, bylo by fajn mu něco ukrást.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_40");	//A my to dáme našemu mrtvému příteli.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_41");	//Poté se už Hasim nevyvleče z toho, že zabil jednoho ze stínů a vzal zlato.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_42");	//Takže tohle je náš plán. Není to sice nic pěkného, ale je to celkem mazané.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_43");	//(Vážně) Vypadá to, že jsi zapomněl s kým máš tu čest. A ve válce, jak se říká, jsou všechny prostředky dovoleny.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_44");	//Tak vezmi měšec a honem jdi vykonat můj plán.
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_45");	//Zase já...
	B_LogEntry(TOPIC_AssasinGold,"Gonzales vymyslel, co budeme dělat. Mám dát Hasimovi další měšec zlata, který byl původně pro Naruga. Avšak zákony bratrstva zakazují brát si věci, které patří druhým. Taky bych měl ukrást nějakou Hasimovu osobní věc. Tu pak dám mrtvole Naruga a nahlásím Hasima za jeho vraždu, když ho začnou hledat.");
	MakeHasimKiller = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_171_Adept,"TOT");
};

instance DIA_NONE_1190_Assasin_NarugProblem_Chetki(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Chetki_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Chetki_Info;
	permanent = FALSE;
	description = "Mám tu Hasimovu věc.";
};

func int DIA_NONE_1190_Assasin_NarugProblem_Chetki_Condition()
{
	if((Npc_HasItems(other,ItMi_HasimAmuls) >= 1) && (MakeHasimKiller == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Chetki_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_01");	//Mám tu Hasimovu věc.
	B_GiveInvItems(other,self,ItMi_HasimAmuls,1);
	Npc_RemoveInvItems(self,ItMi_HasimAmuls,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_02");	//Výborně, to se hodí abychom ze sebe odlákali podezření.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_03");	//Zbavil ses těla?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_04");	//Jenom jsem ho přesunul.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_05");	//Jistě.
	HasimAmuls = TRUE;

	if(MIS_AssasinGold == LOG_Running)
	{
		B_LogEntry(TOPIC_AssasinGold,"Dal jsem Gonzalesovi Hasimův růženec. Teď třeba počkat kolem dvou dní, dokud nezačne pátrání. Mezitím mám jiné věci na práci.");
	};
};

instance DIA_NONE_1190_Assasin_HaniarFirstQuest(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarFirstQuest_Condition;
	information = DIA_NONE_1190_Assasin_HaniarFirstQuest_Info;
	permanent = FALSE;
	description = "Máme menší problém.";
};

func int DIA_NONE_1190_Assasin_HaniarFirstQuest_Condition()
{
	if((HaniarSeekKiller == TRUE) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_HaniarFirstQuest_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_01");	//Máme menší problém.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_02");	//Zase? O co jde?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_03");	//Jeden z převorů Masyafu mi dal za úkol najít Hasimova vraha. Ale to jsem já!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_04");	//Legrační, neříkej! A který z převorů to byl?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_05");	//Jmenuje se Haniar. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_06");	//(Překvapeně) Haniar? Sám Haniar Slepý ti dal tento úkol?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_07");	//Co o něm víš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_08");	//Och, chtěl bych říct, že nic, ale byla by to lež.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_09");	//Znám ho! A dovolím si říct, že lépe, než někteří zdejší členové.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_10");	//Haniar Slepý - nejkrutější a najbrutálnější bastard na jakého jsem kdy narazil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_11");	//Je nejmocnější z převorů bratrstva. A co víc - jeho akce se nedají předvídat.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_12");	//Takže si na něj dávej pozor!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_13");	//Díky za varování.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_14");	//Jestli ses dokázal dostat k Slepci, tak to znamená, že už v bratrstvu něco znamenáš.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_15");	//A to jsou dobré zprávy. Co se Hasima týče... Nech mě chvíli přemýšlet.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_16");	//Nemáme čas přemýšlení!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_17");	//Nuže, máš jen dvě možnosti.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_18");	//Buď povíš Haniarovi pravdu nebo zkusíš promluvit s převorem Tiamantem.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_19");	//Nakonec, byl to jeho rozkaz, který ho odpravil na onen svět.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_20");	//Takže tak!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_21");	//Chápu, nějaké ďalší postřehy?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_22");	//No. Samozřejmě, je to celkem riskantní, ale musíš se nějak rozhodnout.
	GonsalesAdvice = TRUE;
	B_LogEntry(TOPIC_HasimKill,"Gonzales byl velice zmatený ze situace. Jediná věc, kterou mi poradil - buď o tom řeknu Tiamantovi anebo se pokusím říct celou pravdu Haniarovi a budu doufat v jeho odpuštění. V každém případě je to můj probléml.");
};


instance DIA_NONE_1190_Assasin_HaniarFirstQuestFinal(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Condition;
	information = DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Info;
	permanent = FALSE;
	description = "K problému s Hasimem...";
};

func int DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Condition()
{
	if(HaniarKnowKiller == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_01");	//K problému s Hasimem...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_02");	//Vypadáš naživu, takže asi jsi to nějak zvládl.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_03");	//Máš pravdu. Ale tentokrát to bylo těsné.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_04");	//Haniar je celkem mazaný chlapík.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_05");	//Máš štěstí... Běžně nemá rád takovéto věci.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_06");	//Něco mi říká, že tě nechal jen tak přežít.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_07");	//Ale proč... to je otázka!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_08");	//Už se tě chci delší dobu zeptat. Kolik toho víš o bratrstvu a odkud?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_09");	//Přijde čas a řeknu ti to. Ale prozatím to nechme tak.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_10");	//Jak chceš.
	GonsalesFinishHasimStory = TRUE;
};

instance DIA_NONE_1190_Assasin_IDo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_IDo_Condition;
	information = DIA_NONE_1190_Assasin_IDo_Info;
	permanent = FALSE;
	description = "Už jsem stínem Masyafu.";
};

func int DIA_NONE_1190_Assasin_IDo_Condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_IDo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_01");	//Už jsem stínem Masyafu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_02");	//Hmmm... (úsměv) Gratuluji.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_03");	//I když na začatku jsem moc nevěřil, že to zvládneš.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_04");	//Teď bychom se měli zamyslet, jak využít tvé povýšení.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_05");	//Návrhy?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_06");	//Podle mě se musíme postarat o převory.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_07");	//Oni jsou pilíře bratrstva. Bez nich je to jen banda nebezpečných hrdlořezů.

	if(TiamantIsDead == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_08");	//Jeden z převorů je už mrtvý.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_09");	//(Překvapeně) Kdo?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_10");	//Tiamant.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_11");	//Áa, Tiamant, mistr meče. Jak se to stalo?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_12");	//Haniar ho zabil osobně.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_13");	//Takže ho rozzlobil.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_14");	//Nerad to přiznávam, ale Tiamant byl jediný člen bratrstva, kterého jsem respektoval.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_15");	//Byl to bojovník do morku kostí. Ale jak mnohé i jeho zničila hamižnost.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_16");	//Mimochodem, jeho meč - nemáš ho náhodou?

		if(Npc_HasItems(other,ITMW_2H_MASIAF_TIAMANT) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_17");	//Jo, tady je.
			B_GiveInvItems(other,self,ITMW_2H_MASIAF_TIAMANT,1);
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_18");	//Výborně! Nevadí ti, když si ho nechám?
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_19");	//Klidně si ho nech.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_20");	//Díky! Jestli získaš meče ostatních převorů, přines mi je taky.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_21");	//Bude lepší, když ty prokleté meče zůstanou tady.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_22");	//Jak chceš.
			GonsaTakeSword_Tiamant = TRUE;
		}
		else
		{
			B_GivePlayerXP(250);
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_23");	//Bohužel ne.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_24");	//Na tvém místě bych ten meč našel a donesl mi ho.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_25");	//Bude lepší když ty prokleté meče zůstanou tady.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_26");	//Jak chceš.
		};

		GonsaKnow_Tiamant = TRUE;
	};

	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_27");	//Zbytek snad pochopíš beze mě.
};

instance DIA_NONE_1190_Assasin_Sword_Tiamant(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Tiamant_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Tiamant_Info;
	permanent = FALSE;
	description = "Mám Tiamantův meč.";
};

func int DIA_NONE_1190_Assasin_Sword_Tiamant_Condition()
{
	if((GonsaKnow_Tiamant == TRUE) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Tiamant == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_TIAMANT) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Tiamant_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_01");	//Mám Tiamantův meč.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_02");	//Výborně, dej mi ho.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_03");	//Tady.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_TIAMANT,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_TIAMANT,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_04");	//Díky, zatím bude u mě.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_05");	//Nuže, ty víš co s nimi.
	GonsaTakeSword_Tiamant = TRUE;
};

instance DIA_NONE_1190_Assasin_TiamantDead(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_TiamantDead_Condition;
	information = DIA_NONE_1190_Assasin_TiamantDead_Info;
	permanent = FALSE;
	description = "Jeden z převorů je mrtev!";
};

func int DIA_NONE_1190_Assasin_TiamantDead_Condition()
{
	if((TiamantIsDead == TRUE) && (PlayerIsAssNow == TRUE) && (GonsaKnow_Tiamant == FALSE) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_IDo)))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_TiamantDead_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_01");	//Jeden z převorů je mrtev!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_02");	//(překvapeně) Kdo?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_03");	//Tiamant.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_04");	//Áa, Tiamant, mistr meče. Jak se to stalo?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_05");	//Haniar ho zabil osobně.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_06");	//Takže ho rozzlobil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_07");	//Nerad to přiznávam, ale Tiamant byl jediný člen bratrstva, kterého jsem respektoval.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_08");	//Byl to bojovník do morku kostí. Ale jak mnohé i jeho zničila hamižnost.
	GonsaKnow_Tiamant = TRUE;
};


instance DIA_NONE_1190_Assasin_WhoAreYouMister(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhoAreYouMister_Condition;
	information = DIA_NONE_1190_Assasin_WhoAreYouMister_Info;
	permanent = FALSE;
	description = "Mám na tebe otázku.";
};

func int DIA_NONE_1190_Assasin_WhoAreYouMister_Condition()
{
	if((GonsaKnow_Tiamant == TRUE) && (PlayerIsAssNow == TRUE))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_WhoAreYouMister_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_01");	//Mám na tebe otázku.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_02");	//(vážně) Nuže tak se ptej.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_03");	//Myslím, že víš, co chci vědět.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_04");	//Chápu, že máš s těmito lidmi něco společné.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_05");	//Víš o nich tolik, jako bys byl jedním z nich!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_06");	//Hmmm. Nejsi tak daleko od pravdy.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_07");	//Můžeš mi prostě říct celou pravdu?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_08");	//No dobře! Myslím, že je čas, aby sis poslechl můj příběh.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_09");	//Ale slib mi, že nejdřív si ho vyslechneš až do konce. A pak dělej, co uznáš za správné.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_10");	//Platí.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_11");	//Takže začneme...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_12");	//(temně) Ve skutečnosti jsem kdysi byl velice špatný člověk.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_13");	//A tím nemyslím, že jsem zabíjel bez rozdílu pro slávu a peníze.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_14");	//Moje víra a oddanost bratrstva mi nikdy nedovolily pochybovat o mých činech.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_15");	//Byl jsem zaslepený touhou ukázat Beliarovi, že jsem hoden jeho přízně.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_16");	//Tento slepý fanatizmus mi pomohl dosáhnout hodně, dokonce jsem se stal jedním z převorů Masyafu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_17");	//... mocného a temného bratrstva.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_18");	//A možná bychom si tady takhle nepovídali...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_19");	//... kdyby jedna událost nezměnila můj život.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_20");	//Jednou v Mora Sul, sledující svou další oběť, jsem narazil na krásné děvče, jménem Azil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_21");	//Ona byla krásná jako láska sama. Nevím co se mi stalo, ale...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_22");	//... místo hledání jsem tam zůstal stát jako hloupá ovce a pak jsem šel za ní.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_23");	//Sledoval jsem ji až domů, bez toho, aby si mě všimla.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_24");	//Jak se ukázalo, byla dcerou jednoho z nejmocnějších a nejvlivnějších obchodníků v Mora Sul.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_25");	//Bratrstvo ale zakazuje vztahy s lidmi mimo komunitu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_26");	//Pro ty, co to poruší, je jen jeden trest - smrt.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_27");	//I přesto mě to k ní táhlo a chtěl jsem ji vidět znovu a znovu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_28");	//A jednoho dne jsem se rozhodl jít za ní. A tak jsme se poznali.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_29");	//Časem jsme se hodně sblížili.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_30");	//Ale jednoho dne přišel další rozkaz.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_31");	//Asi chápeš...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_32");	//Celá rodina otce Azil...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_33");	//Protože jeho dům byl velmi dobře střežen, práce byla přidělena lidem Haniara Slepého.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_34");	//Pravda, tehdy ještě nebyl slepý...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_35");	//Pamatuji si, jak jsem na kolenou prosil Haniara aby ušetřil alespoň ji.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_36");	//Ale on se mi jen vysmál a tvrdil, že nejsem hoden být převorem bratrstva a služebníkem Beliara.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_37");	//Pak jsem bez přemýšlení spěchal do Mora Sul, doufajíc, že zabráním útoku.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_38");	//Ale nestihl jsem to... Byla už mrtvá. Stejně jako všichni, co měli tu smůlu a byli tam.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_39");	//Byla to platba za mé hříchy... za mou pýchu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_40");	//Odhodlán jsem se vrátil zpět, rozhodnutý zničit tohle zlo navěky.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_41");	//Můj meč s nevídanou silou a krutostí setnul každého, kdo se mi postavil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_42");	//A tam stál ten, který vydal rozkaz.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_43");	//Haniar! Moje kletba a hanba!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_44");	//Nedokázal jsem ho porazit v boji a musel jsem utéct.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_45");	//Avšak před útěkem jsem mu ještě na sebe nechal malou vzpomínku.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_46");	//Hodil jsem na něj flakón kyseliny a pár kapek ho trefilo do očí.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_47");	//Pravděpodobně tehdy přišel o zrak. I když si občas myslím, že ho to jen posilnilo.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_48");	//Tehdy jsem přísahal, že celý svůj život zasvětím zničení bratrstva.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_49");	//Chápu, že to nevykoupí moji vinu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_50");	//Ale dotáhnu tuhle záležitost do konce.
	B_LogEntry(TOPIC_MasiafStory,"Jak se ukázalo, Gonzales byl jedním z převorů Masyafu. Řekl mi svůj příběh a důvody, které ho sem zavedly. Potkal krásné děvče, sblížili se. Bratrstvo dostalo rozkaz vyvraždit její rodinu, on tomu nedokázal zabránit - našel ji mrtvou. Vrátil se pro pomstu, ale nezvládl zabít toho, kdo vydal rozkaz - Haniara. Pouze při útěku po něm hodil nějakou kyselinu a z ní pak oslepl. Následně se Gonzales zavázal, že bratrstvo musí zničit a obětuje tomu zbytek svého života. No, celkem nečakaný běh událostí. A já nevím, co s tím vším udělat.");
	GonsaTellHistory = TRUE;
};


instance DIA_NONE_1190_Assasin_PrayInnos(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PrayInnos_Condition;
	information = DIA_NONE_1190_Assasin_PrayInnos_Info;
	permanent = FALSE;
	description = "Ty se modlíš k Innosovi?";
};

func int DIA_NONE_1190_Assasin_PrayInnos_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_PrayInnos_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PrayInnos_01_01");	//Ty se modlíš k Innosovi?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PrayInnos_01_02");	//Bojím se, že po všem tom špatném co jsem vykonal by Innos mým modlitbám nenaslouchal.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PrayInnos_01_03");	//Ale můžeš to zkusit.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PrayInnos_01_04");	//Hmmm... (zamyšleně) Je možné, že jednoho dne ukleknu před Innosovu sochou a budu prosit o odpuštění.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PrayInnos_01_05");	//Ale nejdřív musím zničit zlo, které jsem pomáhal zasít.
};


instance DIA_NONE_1190_Assasin_Kills(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Kills_Condition;
	information = DIA_NONE_1190_Assasin_Kills_Info;
	permanent = FALSE;
	description = "Musel jsi zabíjet často?";
};

func int DIA_NONE_1190_Assasin_Kills_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_Kills_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Kills_01_01");	//Musel jsi zabíjet často?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_02");	//Neumíš si představit kolik a jak často. Mýma rukama opustilo svět tolik lidí.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_03");	//Avšak i teď, po všech těch letech si pamatuju téměř každou svou oběť.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_04");	//To je mé prokletí! Zůstane se mnou až do mého soudného dne.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_05");	//A možná ani po smrti nenajdu pokoj od všech hříchů, které jsem napáchal.
};

instance DIA_NONE_1190_Assasin_Death(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Death_Condition;
	information = DIA_NONE_1190_Assasin_Death_Info;
	permanent = FALSE;
	description = "Bojíš se smrti?";
};

func int DIA_NONE_1190_Assasin_Death_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_Death_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_01_01");	//Bojíš se smrti?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_02");	//Ne. Čekám na ni každý den.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_03");	//Ale, očividně... i ona se mi otočila zády.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_01_04");	//Co ti brání, například skočit z útesu? Vrhnout se proti černému trolovi? Pokusit se ukrást Gornovi sekeru?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_05");	//Jsem bojovník! Jedině smrt na bojišti dokáže smýt mou hanbu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_06");	//Spáchat sebevraždu. To je pro zbabělce.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_01_07");	//Možná ti s tím můžu pomoct?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_08");	//Chceš se mnou bojovat? (vážně) Nuže, já jsem připraven.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_09");	//Kdo ví, možná ty jsi ten, na koho čekám celou tu dobu.
	Info_ClearChoices(DIA_NONE_1190_Assasin_Death);
	Info_AddChoice(DIA_NONE_1190_Assasin_Death,"Ne! To by bylo neuveřitelně hloupé...",DIA_NONE_1190_Assasin_Death_No);

	if(MIS_PW_PoisonNrozas == FALSE)
	{
		Info_AddChoice(DIA_NONE_1190_Assasin_Death,"Pojď!",DIA_NONE_1190_Assasin_Death_Yes);
	};
};

func void DIA_NONE_1190_Assasin_Death_Yes()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_Yes_01_01");	//Pojď!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_Yes_01_02");	//Možná je čas konečně prohrát.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_Yes_01_03");	//Doufám, že mi dáš po čem ze srdce toužím.
	GonsaChalange = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_NONE_1190_Assasin_Death_No()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_No_01_01");	//Ne! To by bylo neuveřitelně hloupé...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_No_01_02");	//Nejdřív musíme vyřešit bratrstvo.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_No_01_03");	//Zbytek není tak důležitý.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_No_01_04");	//Och... (zklamaně) Jo, samozřejmě máš pravdu. Hlavní je zničit Masyaf.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_No_01_05");	//Mé osobní problémy by nám jen stály v cestě.
	Info_ClearChoices(DIA_NONE_1190_Assasin_Death);
};

instance DIA_NONE_1190_Assasin_DeathWin(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DeathWin_Condition;
	information = DIA_NONE_1190_Assasin_DeathWin_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_DeathWin_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) && (GonsaChalange == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DeathWin_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DeathWin_01_01");	//Bojoval jsi dobře... (zklamaně) Ale vypadá to, že ani ty mi nemůžeš darovat uctivou smrt.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DeathWin_01_02");	//Jsem navěky prokletý!
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_DeathLost(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DeathLost_Condition;
	information = DIA_NONE_1190_Assasin_DeathLost_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_DeathLost_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (GonsaChalange == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DeathLost_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DeathLost_01_01");	//Jsi vynikající bojovník. Jsem si jistý, že tvou rukou Masyaf padne.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DeathLost_01_02");	//Uvidíme!
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_AboutExit(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_AboutExit_Condition;
	information = DIA_NONE_1190_Assasin_AboutExit_Info;
	permanent = FALSE;
	description = "Z něčeho jsem znepokojený...";
};

func int DIA_NONE_1190_Assasin_AboutExit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_IDo))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_AboutExit_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_AboutExit_01_00");	//Z něčeho jsem znepokojený...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_01");	//Co přesně?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_AboutExit_01_02");	//Jak se odsud dostaneme když to tady dokončíme?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_AboutExit_01_03");	//Nemám zájem tady zůstat navěky.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_04");	//Tak to zatím nevím. Ale jsem si jistý, že odpověď se nám časem zjeví sama od sebe.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_05");	//Teď bys nad tím neměl přemýšlet. Soustřeď se na náš úkol.
};


instance DIA_NONE_1190_Assasin_Poison(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Poison_Condition;
	information = DIA_NONE_1190_Assasin_Poison_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Poison_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NoTrollPoison == FALSE) && (MIS_PW_PoisonNrozas == LOG_Running) && (Npc_HasItems(other,ItMi_NrozasPoison) >= 1) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_PreHallo)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Poison_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_00");	//Hej! (žvýká) Nechceš nějaké maso?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_01");	//Možná později, proč?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_02");	//Ale, jen tak. Je dobře propečené a šťavnaté.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_03");	//Jsem si jistý, že si nic takového ještě neměl.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_04");	//No, pokud si takový expert na jídlo, tak mám na tebe otázku.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_05");	//Jakou?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_06");	//Nevíš, jestli jeskynní trolové jí běžně ampulky s jedem?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_07");	//Doufám, že žertuješ... Pokud ho chceš otrávit, prostě zkus návnadu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_08");	//Ale teď vážně... Pokud se k němu co i jen přiblížíš dá si tě na večeři.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_09");	//Nebo tě zabije jen tak pro zábavu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_10");	//Ale myslím, že ty nejsi až tak hloupý. Teda doufám.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_11");	//Poslyš, proč tě taková hloupost vůbec zajímá?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_12");	//Mistr Nrozas mi přikázal vyzkoušet jeden silný jed.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_13");	//A podle něj se perfektně hodí na skalného trola.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_14");	//Tak teď je mi vše jasné. Takže Nrozase to ještě pořád nepřešlo.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_15");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_16");	//No, jak si ho pamatuju...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_17");	//... vždy se snažil vyrobit jed, který by okamžitě zabil jakoukoliv živou bytost.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_18");	//A očividně ještě pořád hledá.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_19");	//On je prostě blázen do alchymie a pořád si jen dělá ty své flákony...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_20");	//Dost už o Nrozasovi. Co navrhuješ?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_21");	//Hmm... Nic! Měl by ses považovat za šťastného.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_22");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_23");	//Jen nedávno jsem viděl jeskynního trola tady nedaleko.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_24");	//A teď nejspíš požírá pozůstatky mrchožroutů, které jsem dnes ráno ulovil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_25");	//Takže na tvém místě bych neztrácel čas.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_26");	//Zkus se k němu připlížit a otrávit jednu z mrtvol.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_27");	//A pak už jen počkáš, jestli umře nebo ne.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_28");	//Jen to s tím jedem nepřežeň! Silné jedy mají často silný zápach a nemusel by to pak sežrat.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_29");	//Samozřejmě.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_30");	//Nedáš si tedy to maso?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_31");	//Nebo... Běž už a pak mi řekni jak to šlo.
	TrollPWIsPlace = TRUE;
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Gonzales mi poradil použít mrtvolu zabitého mrchožrouta jako otrávenou návnadu pro trola.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(TROLL_YOUNG_PW,"PW_YOUNGTROLL");	
	Wld_InsertNpc(Scavenger_PW_01,"FP_STAND_MOLERATDEAD_01");
	Wld_InsertNpc(Scavenger_PW_02,"FP_STAND_MOLERATDEAD_02");
	Wld_InsertNpc(Scavenger_PW_03,"FP_STAND_MOLERATDEAD_03");
	B_KillNpc(Scavenger_PW_01);
	B_KillNpc(Scavenger_PW_02);
	B_KillNpc(Scavenger_PW_03);
	Wld_SendTrigger("EVT_TROLL_POISON");
};

instance DIA_NONE_1190_Assasin_Poison_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Poison_Done_Condition;
	information = DIA_NONE_1190_Assasin_Poison_Done_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Poison_Done_Condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (TellNrozasAboutTest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Poison_Done_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_00");	//Nuže, jak to šlo?

	if(PoisonDoneFull == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_01");	//Trol odmítl návnadu sežrat. Asi jsem to trochu přehnal s množstvím jedu...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_02");	//Varoval jsem tě, že ten jed je příliš silný.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_03");	//Takže jestli jsi to přehnal, tak ta návnada musela pořádně páchnout.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_04");	//A kolik jedu jsi do té návnady nalil?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_05");	//Všechen.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_06");	//Skvělé. To bylo vážně chytré. Gratuluju!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_07");	//A co se stane teď?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_08");	//No... jak znám Nrozase, tak pro tebe nic moc.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_09");	//Podařilo se ti zničit všechno na čem tak dlouho pracoval. Takže z tebe asi moc nezůstane.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_10");	//Na tvém místě bych se už před ním ani neukazoval.
	}
	else if(PoisonDoneHalf == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_11");	//Všechno šlo jak po másle, trol sežral návnadu a okamžitě umřel.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_12");	//A máš něco jako důkaz?

		if(Npc_HasItems(other,ItAt_TrollPoisonTongue) >= 1)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_13");	//Jasně. Mám jeho jazyk napuchlý od jedu.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_14");	//Dobře tedy. Jdi za Nrozasom a potěš trochu toho staříka.
		}
		else
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_15");	//To mě nějak nenapadlo.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_16");	//Tak být tebou jdu zpátky a vezmu si něco na památku.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_17");	//Jak znám Nrozase, tak ti neuvěří, dokud neuvidí důkaz.
		};
	}
	else if(PoisonDoneOneTear == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_18");	//Trol sežral návnadu, ale nezemřel.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_19");	//Očividne jsi použil příliš málo jedu - to je jediné vysvětlení.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_20");	//Možná Nrozasův jed prostě nefunguje?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_21");	//Ať tě ani nenapadne mu něco takového říct. Teda pokud si vážíš svého života.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_22");	//Pokud si vzpomínám, Nrozas byl skutečným mistrem svého řemesla.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_23");	//Téměř nikdy se nemýlí. Samozřejmě, někdy zaváhal, ale to bylo už dávno.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_24");	//A co bude teď?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_25");	//No... Jak znám Nrozase, tak pro tebe nic dobrého.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_26");	//Doufám, že ten jed máš pořád u sebe.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_27");	//Jo, tady je.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_28");	//Tak mu ho dones zpátky a doufej, že tě nenechá zabít.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_29");	//A proč to nezkusíme s tou návnadou znovu?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_30");	//Protože teď na to už nezůstal čas.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_31");	//Vypadá to, že i k Osairovi se vrátím s prázdnou.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_32");	//Osairovi? Co ten s tím má společného?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_33");	//Nrozas slíbil Osairovi trochu toho jedu, pokud se ověří jeho účinnost.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_34");	//Hmm... Tak to všechno mění.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_35");	//Je možné, že bychom tvou neschopnost mohli využít ve svůj prospěch.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_36");	//Jak?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_37");	//Zkusíme je znepřátelit.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_38");	//Co mám dělat?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_39");	//Vidím jen dvě možnosti.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_40");	//Buď dáš jed Osairovi anebo mu řekneš, že ten jed nemá žádný efekt.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_41");	//Avšak v prvním případě bude mít Nrozas vážný důvod tě zabít.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_42");	//A určitě by ho podpořili všichni bratři Masyafu.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_43");	//Ale ve druhém případě máme jen slovo jednoho převora proti druhému.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_44");	//Což je pro tebe mnohem bezpečnější.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_45");	//Nakonec, tyhle zprávy se určitě rychle rozšíří.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_46");	//A taky Osairovi bude Nrozas pro smích.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_47");	//Myslím, že chápu co máš na mysli.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_48");	//Tak do toho. Neztrácej čas.
		PlayerSafeFromNrozas = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Gonzales, mazaná liška, přišel na to, jak využít mé chyby. Potřebuju vyřešit dva převory - Osaira a Nrozase. Můžu dát ampulku jedu Osairovi, ale pak bude mít Nrozas plné právo mě zabít. Nebo můžu donést ampulku Nrozasovi a Osairovi říct, že jed nefunguje.");
		AI_StopProcessInfos(self);
	}
	else if((NoTrollPoison == TRUE) || (TrollSeeMe == TRUE))
	{
		if(NoTrollPoison == TRUE)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_49");	//Naneštěstí jsem toho trola zabil dřív, než jsem stihl vyzkoušet ten jed.
		}
		else if(TrollSeeMe == TRUE)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_49_01");	//Naneštěstí jsem toho trola zabil dřív, než jsem stihl vyzkoušet ten jed.
		};

		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_50");	//Tak, teď jsi ztratil svou šanci se před Nrozasom ukázat.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_51");	//A co bude teď?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_52");	//No... jak znám Nrozase, tak pro tebe nic dobrého.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_53");	//Doufám, že ten jed máš pořád u sebe.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_54");	//Ano, tady je.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_55");	//Tak mu ho dones zpátky a doufej, že tě nenechá zabít.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_56");	//A proč to nezkusíme s tou návnadou znovu?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_57");	//Protože teď na to už nezůstal čas.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_58");	//Vypadá to, že i k Osairovi se vrátím s prázdnou.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_59");	//Osairovi? Co ten s tím má společného?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_60");	//Nrozas slíbil Osairovi trochu toho jedu, pokud se ověří jeho účinnost.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_61");	//Hmm... Tak to všechno mění.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_62");	//Je možné, že bychom tvou neschopnost mohli využít ve svůj prospěch.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_63");	//Jak?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_64");	//Zkusíme je znepřátelit.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_65");	//Co mám dělat?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_66");	//Vidím jen dvě možnosti.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_67");	//Buď dáš jed Osairovi anebo mu řekneš, že ten jed nemá žádný efekt.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_68");	//Avšak v prvním případě bude mít Nrozas vážný důvod tě zabít.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_69");	//A určite by ho podpořili všichni bratři Masyafu.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_70");	//Ale ve druhém případě máme jen slovo jednoho převora proti druhému.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_71");	//Což je pro tebe mnohem bezpečnější.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_72");	//Nakonec, tyhle zprávy se určitě rychle rozšíří.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_73");	//A taky Osairovi bude Nrozas pro smích.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_74");	//Myslím, že chápu co máš na mysli.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_75");	//Tak do toho. Neztrácej čas.
		PlayerSafeFromNrozas = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Gonzales, mazaná liška, přišel na to, jak využít mé chyby. Potřebuju vyřešit dva převory - Osaira a Nrozase. Můžu dát ampulku jedu Osairovi, ale pak bude mít Nrozas plné právo mě zabít. Nebo můžu donést ampulku Nrozasovi a Osairovi říct, že jed nefunguje.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_NONE_1190_Assasin_OsairLiar(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairLiar_Condition;
	information = DIA_NONE_1190_Assasin_OsairLiar_Info;
	permanent = FALSE;
	description = "Mám veliký problém!";
};

func int DIA_NONE_1190_Assasin_OsairLiar_Condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Success) && (OsairLiarNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairLiar_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_01");	//Mám veliký problém!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_02");	//Co se stalo?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_03");	//To s tím jedem! Nenapadlo mě nic lepšího než Osairovi lhát.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_04");	//Teď půjde osobně za Nrozasem to vyřešit.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_05");	//A pak přijde na to, že jsi mu lhal. (sarkasticky) Dobře ty!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_06");	//Nenašel jsi toho správného člověka na vodění za nos.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_07");	//Osair je velice krutý a pomstychtivý muž.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_08");	//Myslím, že sám tušíš, co ti udělá, když se dozví pravdu.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_09");	//Co mám dělat?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_10");	//Hmm... Podle mě je naší jedinou šancí zabít Osaira.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_11");	//Ale musíme to udělat nenápadně - beze svědků.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_12");	//Nejlepší bude si na něj počkat na cestě za Nrozasem.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_13");	//Ale co když nebude sám?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_14");	//Tak či tak to bude naše šance zabít jednoho z převorů.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_15");	//Myslíš, že to zvládnu sám?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_16");	//Podle mě bys měl být v pohodě. Ale pro jistotu půjdu s tebou.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_17");	//Doufám, že alespoň víš, kdy tam Osair má jít.

	if(OsairGotoHram == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_18");	//Samozřejmě.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_19");	//Tak to budeme v pořádku. Řekni až budeš připravený.
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_20");	//Eeeeeee...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_21");	//Takže ne.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_22");	//Tak to je náš nápad úplně k ničemu!
	};
};

var int PW_OsairKill_OneTimer;

instance DIA_NONE_1190_Assasin_OsairGetKill(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairGetKill_Condition;
	information = DIA_NONE_1190_Assasin_OsairGetKill_Info;
	permanent = TRUE;
	description = "Nadešel čas, jdeme!";
};

func int DIA_NONE_1190_Assasin_OsairGetKill_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((OsairGotoHram == TRUE) && (OsairGotoHramDay == (daynow - 1)) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairLiar)) && ((OsairGetKill == FALSE) || (OsairGoKill == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairGetKill_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_01");	//Nadešel čas, jdeme!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_02");	//Osair by měl přijít do chrámu před polednem.

	if(Wld_IsTime(10,0,12,0))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_03");	//Tak běž napřed. Nestrácejme čas!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_04");	//Možná máme čas najít si nějakou výhodnou pozici.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_05");	//Následuj mě.
		OsairGoKill = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_127_Osair,"GotoHram");

		if(SBMODE == 1)
		{
			Npc_ExchangeRoutine(Ass_133_Adept,"GotoHram");			
			Npc_ExchangeRoutine(Ass_134_Adept,"GotoHram");	
		};

		Npc_ExchangeRoutine(self,"FollowOsairKill");
		Npc_SetRefuseTalk(NONE_1190_Assasin,600);
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else if(Wld_IsTime(12,0,23,59))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_06");	//Sakra! Těsně nám unikla naše šance. Osair už je určitě tam.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_07");	//A co teď?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_08");	//Můžeš jít za Osairom a zeptat se ho!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_09");	//Nebo raději ne.
		OsairGetKill = TRUE;
	}
	else
	{
		if(PW_OsairKill_OneTimer == FALSE)
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_10");	//Myslím, že jsme tady příliš brzy a měli bychom se stáhnout.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_11");	//Proč?
			AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_12");	//Víš, zůstat tady na očích celého Bratsva - není nejlepší nápad.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_13");	//Dobře, ať je po tvém.
			PW_OsairKill_OneTimer = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_14");	//Ještě pořád je moc brzo. Uklidni se konečně a přestaň mě otravovat.
		};
	};
};

instance DIA_NONE_1190_Assasin_BattleForever(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_BattleForever_Condition;
	information = DIA_NONE_1190_Assasin_BattleForever_Info;
	permanent = FALSE;
	description = "Vypadá to, že už mi nezůstává nic než bojovat s bratrstvem Masyaf.";
};

func int DIA_NONE_1190_Assasin_BattleForever_Condition()
{
	if((PlayerIsPrioratFake == TRUE) && (PlayerChooseFight_PW == FALSE) && (TempleIsClear == FALSE) && (OsairAttackMe == FALSE) && (HideMeetCome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_BattleForever_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_BattleForever_01_01");	//Vypadá to, že už mi nezůstává nic než bojovat s bratrstvem Masyaf. Pomůžeš mi?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_BattleForever_01_02");	//No, jestli je to tak špatné... V každém případě, jsem s tebou!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_BattleForever_01_03");	//Běž napřed, budu tě krýt.
	PlayerChooseFight_PW = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	if(MIS_MasiafStory == FALSE)
	{
		MIS_MasiafStory = LOG_Running;
		Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	};
	if(MIS_MasiafStory == LOG_Running)
	{
		B_LogEntry(TOPIC_MasiafStory,"Vypadá to tak, že útok na chrám je jediná cesta pryč. Gonzales mě podpoří.");
	};	

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

instance DIA_NONE_1190_Assasin_OsairGetKill_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairGetKill_Done_Condition;
	information = DIA_NONE_1190_Assasin_OsairGetKill_Done_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_OsairGetKill_Done_Condition()
{
	if((OsairIsDead == TRUE) && (NoGonsaHereMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairGetKill_Done_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_01");	//Osair je mrtev.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_02");	//Jo, je mrtev. Ale to neznamená, že jsme vyhráli. Jsou teď jak raněná zvěř.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_03");	//A raněná zvěř bývá ve svých smrtelných křečích nejnebezpečnější.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_04");	//A co dál?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_05");	//Hmm... jsem si jistý, že jakmile se bratrstvo dozví o Osairově smrti, tak spustí poplach.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_06");	//A pak Haniar začne zabíjet každého, kdo bude co i jen trochu podezřelý.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_07");	//Ty jsi v tom čase nebyl v chrámu, takže bys byl v ohrožení.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_08");	//Co tedy navrhuješ?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_09");	//Není času nazbyt. Takže pokračujeme co jsme začali.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_00");	//Jdi zpět do Osairovi jeskyně a zabij jeho lidi.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_10");	//A já budu sledovat chrám, aby nikdo nešel tvým směrem.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_11");	//Jo, a nezapomeň osvobodit otroky. Ne abys je tam nechal!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_12");	//Udělám vše, co se bude dát.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_13");	//Výborně, tak jdi!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MasiafTempleWait");
};

instance DIA_NONE_1190_Assasin_PreFinalBattle(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PreFinalBattle_Condition;
	information = DIA_NONE_1190_Assasin_PreFinalBattle_Info;
	permanent = FALSE;
	description = "Postaral jsem se o to.";
};

func int DIA_NONE_1190_Assasin_PreFinalBattle_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairGetKill_Done)) && (Npc_IsDead(Ass_133_Adept) == TRUE) && (Npc_IsDead(Ass_134_Adept) == TRUE) && (Npc_IsDead(Ass_135_Adept) == TRUE) && (Npc_IsDead(Ass_136_Adept) == TRUE) && (Npc_IsDead(Ass_137_Adept) == TRUE) && (OsairSlavesIsFree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_PreFinalBattle_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PreFinalBattle_01_01");	//Postaral jsem se o Osairovy lidi. A co ty?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_02");	//Všechno v pořádku. Ale když už jsi zpátky, tak je zřejmě čas to tady roztočit.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PreFinalBattle_01_03");	//Chceš zaútočit na chrám?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_04");	//Přesně tak! Dokud nic netuší máme šanci.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_05");	//Překvapíme je.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PreFinalBattle_01_06");	//Jak chceš.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_07");	//Běž napřed, já tě budu krýt.
	PlayerChooseFight_PW = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Gonzales chce zaútočit na chrám. Veří, že teď na to máme dost síly.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"TOT");
	AI_Teleport(Ass_128_Nrozas,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

instance DIA_NONE_1190_Assasin_Sword_Osair(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Osair_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Osair_Info;
	permanent = FALSE;
	description = "Mám Osairův meč.";
};

func int DIA_NONE_1190_Assasin_Sword_Osair_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairGetKill_Done)) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Osair == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_OSAIR) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Osair_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Osair_01_01");	//Mám Osairův meč.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_OSAIR,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_OSAIR,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Osair_01_02");	//Aha! Tak ten bude o dost lepší.
	GonsaTakeSword_Osair = TRUE;
};

instance DIA_NONE_1190_Assasin_Sword_Nrozas(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Nrozas_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Nrozas_Info;
	permanent = FALSE;
	description = "Mám Nrozasův meč.";
};

func int DIA_NONE_1190_Assasin_Sword_Nrozas_Condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Nrozas == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_NROZAS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Nrozas_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Nrozas_01_01");	//Mám Nrozasův meč.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_NROZAS,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_NROZAS,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Nrozas_01_02");	//Dobře. Nechám si ho.
	GonsaTakeSword_Nrozas = TRUE;
};

instance DIA_NONE_1190_Assasin_Sword_MasiafRitual(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_MasiafRitual_Condition;
	information = DIA_NONE_1190_Assasin_Sword_MasiafRitual_Info;
	permanent = FALSE;
	description = "Mám u sebe jeden zvláštní meč.";
};

func int DIA_NONE_1190_Assasin_Sword_MasiafRitual_Condition()
{
	if(Npc_HasItems(other,ITMW_FAKESWORD_01) >= 1)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_MasiafRitual_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_01");	//Mám u sebe jeden zvláštní meč.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_02");	//Ukaž mi ho.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_NROZAS,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_03");	//No tohle! Nuže, nic zvláštního.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_04");	//Tato zbraň se používá pro rituální vraždy.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_05");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_06");	//Už bys měl vědět, že všichni bratři Masyafu uctívají Beliara.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_07");	//Takže někdy zabíjí svou kořist touto rituální čepelí.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_08");	//A takhle vlastně přináší duši zabitých jako oběť Beliarovi.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_09");	//Avšak tohle se děje tehdy a jenom tehdy když to povolí Zuben.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_10");	//Anebo některý jiný velice silný temný mág.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_11");	//Jinak toho, kdo spáchá takovou vraždu čeká dlouhá a bolestivá smrt.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_12");	//S bohy si není radno zahrávat!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_13");	//Nevíš náhodou kdo by o to mohl mít zájem?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_14");	//Hmm... Těžko říct.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_15");	//Pokud si dobře pamatuju, obsahuje část Beliarovy magie.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_16");	//Takže by to možná mohlo zajímat někoho z kruhu nekromantů.
	DarkMageBuySwords = TRUE;
};

instance DIA_NONE_1190_Assasin_NrozasKill_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NrozasKill_Done_Condition;
	information = DIA_NONE_1190_Assasin_NrozasKill_Done_Info;
	permanent = FALSE;
	description = "Mistr Nrozas je mrtev.";
};

func int DIA_NONE_1190_Assasin_NrozasKill_Done_Condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NrozasKill_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_01");	//Mistr Nrozas je mrtev.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_02");	//(udiveně) Zajímavé. Jak se to stalo?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_03");	//Vyzval mě na souboj pravdy, takže jsem neměl na výběr.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_04");	//Považuj se za šťastného! Boj s mečem nikdy nebyl jeho silnou stránkou.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_05");	//Tak či tak smrt jednoho z převorů dost oslabí bratrstvo.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_06");	//A to nám přijde vhod.
};

instance DIA_NONE_1190_Assasin_HideMeeting(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HideMeeting_Condition;
	information = DIA_NONE_1190_Assasin_HideMeeting_Info;
	permanent = FALSE;
	description = "Mám zajímavé zprávy.";
};

func int DIA_NONE_1190_Assasin_HideMeeting_Condition()
{
	if(HaniarReadyMeeting == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HideMeeting_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_01");	//Mám zajímavé zprávy.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_02");	//Tak ven s tím. Nenapínej mě.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_03");	//V bratrstvu se zřejmě schyluje k velikému utkání.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_04");	//Proč si to myslíš?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_05");	//Osair chtěl přebrat veškerou moc do svých rukou, ale Haniar je proti.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_06");	//Samozřejmě že je! Nikdo nechce být zahnán do ústraní. A hlavne ne muž jak Haniar.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_07");	//Budou se muset utkat, aby tenhle problém vyřešili.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_08");	//A pravděpodobně jen jeden z nich odtamtud odejde po vlastních.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_09");	//Zajímavé. Co myslíš, kolik lidí si přivede Haniar?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_10");	//Přijde sám.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_11");	//Copak zešílel? To je čistá sebevražda.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_12");	//Když o tom se mnou mluvil, znělo to, že si celkem věří.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_13");	//Nelíbí se mi to! Haniar nikdy nebyl hloupý ani zbrklý.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_14");	//Určitě si pro Osaira připravil překvapení.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_15");	//Nevíš náhodou, kde se mají setkat?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_16");	//Ne, to oba zamlčeli.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_17");	//Já, být na tvém místě, bych to zjistil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_18");	//Měli bychom se také zúčastnit. I bez pozvání. (úsměv)
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_19");	//Dobře, pokusím se zjistit, kde se to bude konat.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_20");	//Hodně štěstí.
	MIS_HaniarSecret = LOG_Running;
	Log_CreateTopic(TOPIC_HaniarSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaniarSecret,LOG_Running);
	B_LogEntry(TOPIC_HaniarSecret,"Řekl jsem Gonzalesovi o nadcházejícím setkání převorů. Byl překvapen, že se tam ukáže Haniar sám. Gonzales mě požádal, abych zjistil, kde se to setkání uskuteční. Pravděpodobně někde, kam se jen tak slídivé oči nedostanou.");
	AI_StopProcessInfos(self);

	B_KillNpc(SEK_179_SLAVEOBSSEK);
	B_KillNpc(SEK_180_SLAVEOBSSEK);
	B_KillNpc(SEK_181_SLAVEOBSSEK);
	B_KillNpc(Ass_182_Adept);

	Wld_InsertNpc(Ass_395_Adept,"PW_OSAIR_MEET_GUARD_05");
	Wld_InsertNpc(Ass_396_Adept,"PW_OSAIR_MEET_GUARD_05_01");
	Wld_InsertNpc(Ass_397_Adept,"PW_OSAIR_MEET_GUARD_05_02");

};

instance DIA_NONE_1190_Assasin_KnowPlaceMeeting(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_KnowPlaceMeeting_Condition;
	information = DIA_NONE_1190_Assasin_KnowPlaceMeeting_Info;
	permanent = FALSE;
	description = "Myslím, že vím, kde se bude to utkání konat.";
};

func int DIA_NONE_1190_Assasin_KnowPlaceMeeting_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (KnowPlaceMeeting == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_KnowPlaceMeeting_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_01");	//Myslím, že vím, kde se bude to utkání konat.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_02");	//Kde?

	if((Npc_IsDead(Ass_395_Adept) == TRUE) && (Npc_IsDead(Ass_396_Adept) == TRUE) && (Npc_IsDead(Ass_397_Adept) == TRUE))
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_03");	//Osairovi lidi zablokovali vchod do podhorské jeskyně. Proto jsem je musel zabít.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_04");	//Hmm... Ty jsi nikdy nenecháš ujít šanci někoho rozsekat na kusy.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_05");	//Ale nejspíš máš pravdu.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_06");	//Osairovi lidi zablokovali vchod do podhorské jeskyně a nikoho tam nevpustí.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_07");	//Nejspíš máš pravdu.
	};

	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_08");	//Vypadá to tak, že Osair se na setkání s Haniarem dobře připravil.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_09");	//Tak neztrácejme čas!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_10");	//Za každou cenu se musíme dostat do té jeskyně.
	RespPWMeet = TRUE;
	HideMeetCome = TRUE;
	PlayerIsPrioratFake = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowHideMeet");

	if(FazimAgreed == TRUE)
	{
		Npc_ExchangeRoutine(Ass_391_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_398_Adept,"PW_OSAIR_MEET_GUARD_01");
	};
	if(RafatAgreed == TRUE)
	{
		Npc_ExchangeRoutine(Ass_392_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_399_Adept,"PW_OSAIR_MEET_GUARD_03");
	};
	if(NazimGetOutCave == TRUE)
	{
		Npc_ExchangeRoutine(Ass_393_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_598_Adept,"PW_OSAIR_MEET_GUARD_02");
	};
	if(KudirGetTrollPlant == TRUE)
	{
		Npc_ExchangeRoutine(Ass_394_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_599_Adept,"PW_OSAIR_MEET_GUARD_04");
	};

	Npc_ExchangeRoutine(Ass_126_Haniar,"OsairMeet");
	Npc_ExchangeRoutine(Ass_127_Osair,"OsairMeet");
};

instance DIA_NONE_1190_Assasin_Showdown(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Showdown_Condition;
	information = DIA_NONE_1190_Assasin_Showdown_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Showdown_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (HideMeetCamera == TRUE) && (HaniarDemonRitualEnd == TRUE) && (Npc_GetDistToWP(self,"PW_GOLD_CAVEORE_TEMP_06") < 400))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Showdown_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_01");	//Co je to za nestvůry?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_02");	//Zdá se, že jsou to démoni.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_03");	//Hmm... Možná to nebude tak jednoduché, jak se na první pohled zdálo.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_04");	//Byl jsem si jistý, že tam bude, aby Osaira překvapil.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_05");	//A zjevně se mu to i podařilo.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_06");	//Vypadá to tak... A trochu mě to znervózňuje.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_07");	//Viděl jsi, jak lehce se vypořádali s Osairem a jeho lidmi?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_08");	//A co teď?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_09");	//Nevím. Tak či tak, nejlepší šance na zabití Haniara zmizí, jestli toho nevyužijeme.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_10");	//Takže nejdřív musíme zničit toho Beliarova služebníka.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_11");	//Hledáš pořádného protivníka a přitom je přímo před tebou.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_12");	//Tak pojďme na to! Neztrácejme čas.
	HaniarCantTalk = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MeetHaniar");
};

instance DIA_NONE_1190_Assasin_HaniarAway(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarAway_Condition;
	information = DIA_NONE_1190_Assasin_HaniarAway_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_HaniarAway_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (HaniarAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HaniarAway_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_01");	//A sakra! Ten bastard si jen tak utekl!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_02");	//Já na jeho místě bych udělal to samé.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_03");	//A co teď?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_04");	//Haniar zmiňoval nějakou vnitřní svatyni chrámu.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_05");	//Myslím, že bychom to místo měli pohledat.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_06");	//Jestli ho máme hledat, tak nejspíš v chrámu.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_07");	//Tak pojďme na to. Je čas to ukončit.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_08");	//Dobře. Jsem hned za tebou.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HaniarSecret = LOG_Success;
	Log_SetTopicStatus(TOPIC_HaniarSecret,LOG_Success);
	B_LogEntry(TOPIC_HaniarSecret,"Haniarovi se podařilo utéct. Jeho vyvolané posily nestačily proti našim mečům. Ale ještě to nekončí. Haniar hovořil něco o vnitřní svatyni v chrámu, kde je jeho mistr. Potřebuju zjistit víc - předtím, než bude příliš pozdě. Rozhodli jsme se začít hledat v chrámu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
};

instance DIA_NONE_1190_Assasin_InTemple(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_InTemple_Condition;
	information = DIA_NONE_1190_Assasin_InTemple_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_InTemple_Condition()
{
	if((Npc_GetDistToWP(self,"PW_TEMPLE_HASIM_TEMP") < 1000) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_InTemple_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_01");	//Tak a jsme tady! Takže tady bylo jeho doupě?

	if(PlayerChooseFight_PW == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_02");	//Jak vidíš.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_03");	//Pěkné místo! Ale trochu moc zla na můj vkus.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_04");	//Všechno zlo teď leží v kaluži krve.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_05");	//Všechno ne. Zranili jsme zvíře, ale nesetli jsme jeho hlavu!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_06");	//Jsi si jistý?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_07");	//Myslím Haniara Slepého, nejmocnejšího z převorů Masyafu.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_08");	//Nevypadalo to, že by byl mezi ostatními.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_09");	//Pokud je naživu, tak ještě není konec!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_10");	//Až když se mi jeho chladné tělo sesune k nohám...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_11");	//... Až pak dosáhneme vítězství!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_12");	//A kde ho najdeme?
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_13");	//Jak vidíš.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_14");	//Pěkné místo! Ale trochu moc zla na můj vkus.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_15");	//Všechno zlo teď leží v kaluži krve.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_16");	//Všechno ne. Zranili jsme zvíře, ale nesetli jsme jeho hlavu!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_17");	//Pokud je naživu, tak ještě není konec!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_18");	//Až když se mi jeho chladné tělo sesune k nohám...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_19");	//... Až pak dosáhneme vítězství!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_20");	//A kde ho najdeme?
	};

	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_21");	//Pro začátek bys měl prohledat celý chrám! Postarej se o to.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_22");	//Možná najdeš něco, co nám pomůže.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_23");	//A já si musím promyslet, co dál.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_24");	//No, jako vždy mě zůstala ta 'snadnější' část práce.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_25");	//Přestaň si stěžovat! Radši začni pracovat.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_26");	//Jak říkáš.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry(TOPIC_MasiafStory,"Gonzales a já jsme došli k chrámu. Bohužel nás čekalo zklamání. Haniar Slepý, duchovní vůdce a nejmocnější z převorů bratrstva Masyaf zmizel. Gonzales navrhl prohledat chrám. Doufá, že najdeme něco, co nás posune dál.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTemple");
	GonsaInTemple = TRUE;
	Wld_InsertItem(ItWr_DemonScroll,"FP_ITEMSPAWN_DEMONSCROLL");
};

instance DIA_NONE_1190_Assasin_DemonScroll(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DemonScroll_Condition;
	information = DIA_NONE_1190_Assasin_DemonScroll_Info;
	permanent = FALSE;
	description = "Našel jsem tenhle podivný svitek.";
};

func int DIA_NONE_1190_Assasin_DemonScroll_Condition()
{

	if((GonsaInTemple == TRUE) && (Npc_HasItems(other,ItWr_DemonScroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DemonScroll_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_01");	//Našel jsem tenhle podivný svitek.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_02");	//Ukaž, ať se podívám...
	B_GiveInvItems(other,self,ItWr_DemonScroll,1);
	Npc_RemoveInvItems(self,ItWr_DemonScroll,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_03");	//To není obyčejný svitek! Vypadá to, že tam je napsané nějaké kouzlo.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_04");	//A vypadá to, že je to napsané v prastarém nářečí Beliarova jazyka.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_05");	//Jak to víš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_06");	//Nezapomínej, že bratři Masyafu uctívali Beliara tak jako paladinové Innose.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_07");	//A jak myslíš, že se k němu modlili?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_08");	//Tak to nevím.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_09");	//Tak mi budeš muset věřit. Tenhle jazyk se nedá s ničím splést.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_10");	//A co mám tedy dělat?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_11");	//Zkus použít tohle kouzlo při modlitbě k Beliarovi.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_12");	//Možná před jeho sochou.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_13");	//Dobře, zkusím to.
	B_GiveInvItems(self,other,ItWr_HaniarDemonScroll,1);
	B_LogEntry(TOPIC_MasiafStory,"V chrámu jsem našel svitek v prastarém nářečí Beliarova jazyka. Gonzales navrhl, abych ten svitek použil před sochou Beliara. Možná se něco stane. Jemu se to řekne...");
};

instance DIA_NONE_1190_Assasin_MasiafSecret(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_MasiafSecret_Condition;
	information = DIA_NONE_1190_Assasin_MasiafSecret_Info;
	permanent = FALSE;
	description = "Našel jsem tajnou místnost.";
};

func int DIA_NONE_1190_Assasin_MasiafSecret_Condition()
{

	if((MasiafSecret == TRUE) && (GonsHere == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_MasiafSecret_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_MasiafSecret_01_01");	//V chrámu jsem našel tajnou místnost. Je v ní něco, co vypadá jako magický portál.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_02");	//Vypadá to, že Haniar nám teď už neunikne.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_03");	//Podle mě ten portál vede do vnitřní svatyně chrámu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_04");	//Ale předtím, než se tam vydáš, pořádně se připrav.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_05");	//Myslím, ze tam narazíš na mnohem nebezpečnější protivníky, než jen pouhého jednoho převora Masyafu.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_MasiafSecret_01_06");	//Ty se mnou nejdeš?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_07");	//Myslel sis, že jsem to vzdal? (úsměv) Budu tě následovat, jen co tady dokončím pár věcí.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_MasiafSecret_01_08");	//Dobře! Tak se potkáme na druhé straně portálu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_09");	//Zlom vaz.
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_HaniarDead(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarDead_Condition;
	information = DIA_NONE_1190_Assasin_HaniarDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_HaniarDead_Condition()
{

	if(Npc_IsDead(Ass_178_Prior_ArchDemon) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HaniarDead_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_01");	//Je konec! Haniar je mrtev.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_02");	//Podle mě bychom měli zkontrolovat zbytek chrámu.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_03");	//Možná, ale tenhle boj už pro mě skončil.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_04");	//Jestli je to tak... Jsi teď šťastný?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_05");	//Udělal jsem, co bylo potřeba. A nezáleží na tom, jak se cítim.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_06");	//Ale jsem ti vďečný za tvou pomoc.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_07");	//Tohle zlo muselo být zničeno.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_08");	//Teď projdeš i poslední zákoutí chrámu?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_09");	//Jo. Musíme zjistit, kdo za tím vším je.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_10");	//Dobře. Tak já tady na tebe zatím počkám a budu dávat pozor.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_11");	//Jdi! Neztrácaj čas prázdnými řečmi.
	GonsaOut = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 800;
	condition = DIA_NONE_1190_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_1190_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Nauč mě vydržet horko. (VB: 10, cena: 5000 zlatých)";
};

func int DIA_NONE_1190_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HotReduceTeach_Info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Nauč mě vydržet horko.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Je mi líto, ale nemáš dostatek zkušeností.
		AI_StopProcessInfos(self);
	};

	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_02");	//Je mi líto, ale nebude to zadarmo.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Nedělej zbytečné pohyby.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Pohybuj se co nejméně, šetři energii.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Horko může být mnohem více vyčerpávající než boj s celou smečkou nestvůr.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

//--------------------------posle priorata--------------------------------------------

instance DIA_NONE_1191_Assasin_EXIT(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 999;
	condition = DIA_NONE_1191_Assasin_EXIT_Condition;
	information = DIA_NONE_1191_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1191_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1191_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1191_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 900;
	condition = DIA_NONE_1191_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_1191_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1191_Assasin_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1191_Assasin_PICKPOCKET,Dialog_Back,DIA_NONE_1191_Assasin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1191_Assasin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1191_Assasin_PICKPOCKET_DoIt);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
};

instance DIA_NONE_1191_Assasin_PreHallo(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_PreHallo_Condition;
	information = DIA_NONE_1191_Assasin_PreHallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1191_Assasin_PreHallo_Condition()
{
	if(MIS_PrioratStart == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_PreHallo_Info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_00");	//Je dobré vidět tě živého a zdravého, příteli.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_01");	//Jak to šlo v chrámu?
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_02");	//Bylo tam pár komplikací, ale jak vidíš, zvládl jsem to.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_03");	//A jak si se dostal ven?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_04");	//Velice jednoduše! Jejich vůdce měl teleportační runu zpět do Khorinisu.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_05");	//Jasně. A co plánuješ teď?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_06");	//Po pravdě, chtěl jsem odplout zpět do Varantu.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_07");	//Ale jak se ukázalo, paladinská galéra je jediná loď na ostrově.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_08");	//A jiné lodě nepluly už měsíce.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_09");	//Vypadá to tak, že boje na kontinentě nejdou ani zdaleka dobře.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_10");	//Takže tak. (vážně) Ale pak jsem dostal jiný nápad!
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_11");	//Přemýšlel jsem nad svým životem a vším, co se v něm událo.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_12");	//A nakonec jsem se rozhodl zasvětit zbytek svého života Innosovi.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_13");	//Kromě jiného, slyšel jsem, že na ostrově je klášter mágů Ohně.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_14");	//Takže tam půjdu a zkusím se stát novicem.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_15");	//A jestli mi Innos odpustí nebo ne - to už není na mě.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_16");	//To jsou slova muže.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_17");	//Často se modli a bude ti odpuštěno!
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_18");	//Doufejme, že máš pravdu.
	GonsaGoKloster = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"City");


};

instance DIA_NONE_1191_Assasin_Simple(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_Simple_Condition;
	information = DIA_NONE_1191_Assasin_Simple_Info;
	permanent = TRUE;
	description = "Jak se daří?";
};

func int DIA_NONE_1191_Assasin_Simple_Condition()
{
	if(GonsaGoKloster == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_Simple_Info()
{
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_00");	//Jak se daří?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Simple_01_01");	//V pořádku příteli.

	if(GonsaGoKlosterDone == TRUE)
	{
		AI_Output(self,other,"DIA_NONE_1191_Assasin_Simple_01_02");	//Zvláště tady v klášteře. Zdá se, že jsem znovu získal víru v život.
		AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_03");	//To rád slyším.
	}
	else
	{
		AI_Output(self,other,"DIA_NONE_1191_Assasin_Simple_01_04");	//Nejdřív si chvíli odpočinu a pak se vydám do kláštera.
		AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_05");	//Neodkládej to příliš.
	};
};

instance DIA_NONE_1191_Assasin_Kloster(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_Kloster_Condition;
	information = DIA_NONE_1191_Assasin_Kloster_Info;
	permanent = FALSE;
	description = "Přijali tě do kláštera?";
};

func int DIA_NONE_1191_Assasin_Kloster_Condition()
{
	if(GonsaGoKlosterDone == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_Kloster_Info()
{
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Kloster_01_00");	//Přijali tě do kláštera?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_01");	//Jak můžeš vidět tak ano.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_02");	//Avšak musel jsem se vyzpovídat Pyrokarovi.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_03");	//Nejdřív si mě pozorně vyslechl a pak řekl, že každý by měl dostat šanci k pokání.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_04");	//A tak jsem tady. V noci modlitba, přes den práce.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_05");	//Mimochodem dostal jsem roucho novice.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_06");	//Takže moje zbroj asasína mi je teď na nic. Stejně jako můj meč!
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_07");	//Začal jsem nový život a proto bych neměl lpět k minulosti.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_08");	//Takže jestli chceš, daruju ti je.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_09");	//Jistě pro ně teď najdeš lepší využití než já.
	CreateInvItems(self,ItAr_NOV_L,1);
	Info_ClearChoices(DIA_NONE_1191_Assasin_Kloster);
	Info_AddChoice(DIA_NONE_1191_Assasin_Kloster,"Dobře! Vezmu si je.",DIA_NONE_1191_Assasin_Kloster_Go);
};

func void DIA_NONE_1191_Assasin_Kloster_Go()
{
	AI_UnequipWeapons(self);
	Npc_RemoveInvItems(self,ITMW_2H_KATANA_GIFT,1);
	Npc_RemoveInvItems(self,ITRW_G3_SILENTDEATH_BOW_01_NPC,1);
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Kloster_Go_01_01");	//Dobře! Vezmu si je.
	AI_EquipArmor(self,ItAr_NOV_L);
	Npc_RemoveInvItems(self,ITAR_GONSALES,1);
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,ITAR_ASS,1);
	CreateInvItems(hero,ITMW_2H_KATANA,1);
	CreateInvItems(hero,ITRW_G3_SILENTDEATH_BOW_01,1);
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_Go_01_02");	//Vynikající! Teď jsem osvobozen od duchu minulosti.
};

instance DIA_NONE_1191_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 800;
	condition = DIA_NONE_1191_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_1191_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Nauč mě vydržet horko (LP: 10)";
};

func int DIA_NONE_1191_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_HotReduceTeach_Info()
{
	var int kosten;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Nauč mě vydržet horko.

	kosten = 10;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Nemáš dost zkušeností.
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Nedělej zbytečné pohyby.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Pohybuj se co nejméně, šetři energii.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Horko může být více vyčerpávající než boj s celou smečkou nestvůr.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};