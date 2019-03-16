
instance DIA_XARDAS_GOBLIN_EXIT(C_Info)
{
	npc = xardas_goblin;
	nr = 999;
	condition = dia_xardas_goblin_exit_condition;
	information = dia_xardas_goblin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xardas_goblin_exit_condition()
{
	return TRUE;
};

func void dia_xardas_goblin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_HELLO(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_hello_condition;
	information = dia_xardas_goblin_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_goblin_hello_condition()
{
	if(XARDASGOBLINATTACKED == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_hello_info()
{
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_00");	//(Smutně) Počkej člověče a prohoď pár slov s nešťastným skřítkem.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_01_01");	//CO! Mluvící goblin!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_02");	//Díváš se na mě jako na pytel sraček!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_03");	//Ještě nikdy jsi neviděl goblina, co rozumí lidem?
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_01_04");	//Ne, to ne. Jak se ti povedlo naučit se mluvit? Není to zvláštní?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_05");	//Ani ne. Přesněji řečeno mě to naučil jeden mág.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_06");	//(Smutně) Ale, kde je hodně znalostí, je i dost smutku a bolesti...
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_07");	//Poslouchej! Pomoz mi, muži, chátrajícímu goblinovi.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_08");	//Udělej pro mě něco a dostaneš magický obsah této truhly.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_01_09");	//To je tvá truhla? A co mi brání, abych si to prostě nevzal?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_10");	//(Militaristicky) Možná mám málo ve své výšce, ale o to více je v mích spárech!
	Info_ClearChoices(dia_xardas_goblin_hello);
	Info_AddChoice(dia_xardas_goblin_hello,"Dobrá, jak ti pomůžu?",dia_xardas_goblin_hello_ok);
	Info_AddChoice(dia_xardas_goblin_hello,"Opravdu? Tak sleduj.",dia_xardas_goblin_hello_no);
};

func void dia_xardas_goblin_hello_ok()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_01");	//Ha, no a jak ti můžu pomoct goblinku?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_02");	//Jsem esence, která není skřítek. Nýbrž zarmoucený duch v těle z masa.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_03");	//Mág mě kdysi dávno povolal do služby, dlouhou dobu jsme žili spolu ve věži.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_05");	//Takže jsi duch nekromanta Xardase?
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_06");	//Pak jak ti mohu pomoci?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_07");	//Ze všeho nejvíc chci, zmizet z tohoto světa!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_08");	//Duchové jako já ohrožují tento svět.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_09");	//Nerozumím, co mám udělat?!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_10");	//Xardas měl speciální hromady svitků, když přijde čas. Myslím, že je stále má.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_11");	//Nejspíše se nalézají v té staré věži. Určitě tam něco bude.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_12");	//No, myslím že něco.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_13");	//Před odjezdem, ti dám instrukce:
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_14");	//Pokud půjdete rovnou k nekromantovi, neříkejte že jsme se setkali, pro služebnictvo by...
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_15");	//... milosti nejspíše nenašel. 	
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_16");	//Jestli půjdeš navštívit věž buď opatrný.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_17");	//Nacházejí se zde zlí nemrtvý a démoni z pekelných končin.
	MIS_GOBLINAWAY = LOG_Running;
	Log_CreateTopic(TOPIC_GOBLINAWAY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOBLINAWAY,LOG_Running);
	B_LogEntry(TOPIC_GOBLINAWAY,"Nedaleko Xardasovy staré věže jsem našel podivné stvoření - mluvícího goblina! Je to prý duch a požádal mě o pomoc. Souhlasil jsem, že mu pomohu - mám najít nějaký svitek, který zapudí jeho duši. Teď bych měl buď prohledat starou Xardasovu věž, nebo se zeptat přímo Xardase, který ho vyvolal. Až budu mít svitek, mám se vrátit za goblinem.");
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblin_hello_no()
{
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_No_01_01");	//Opravdu? Tak sleduj.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_No_01_02");	//Dobrá, dobrá... (zlomyslně)
	XARDASGOBLINHUNT = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_BRINGSCROLL(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_bringscroll_condition;
	information = dia_xardas_goblin_bringscroll_info;
	permanent = FALSE;
	description = "Našel jsem svitek zapuzení.";
};


func int dia_xardas_goblin_bringscroll_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (Npc_HasItems(hero,itwr_xardasgoblinscroll) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_bringscroll_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Xardas_Goblin_BringScroll_01_01");	//Našel jsem svitek zapuzení. Dostanu něco?
	AI_Output(self,other,"DIA_Xardas_Goblin_BringScroll_01_02");	//To je skvělé, tak na co čekáš? Dej mi mou svobodu.
	AI_Output(self,other,"DIA_Xardas_Goblin_BringScroll_01_03");	//Dávám ti slovo, že jakmile řetězy, které v tomto světě držely mého ducha...
	AI_Output(self,other,"DIA_Xardas_Goblin_BringScroll_01_04");	//... tvůj svitek zničí klíč k truhle, vem si ho rychle.
	XARDASGOBLINREADYAWAY = TRUE;
	B_LogEntry(TOPIC_GOBLINAWAY,"Pro zapuzení goblina stačí použít svitek zapuzení.");
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_WAIT(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_wait_condition;
	information = dia_xardas_goblin_wait_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_xardas_goblin_wait_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (XARDASGOBLINREADYAWAY == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_wait_info()
{
	AI_Output(self,other,"DIA_Xardas_Goblin_Wait_01_01");	//Tak naco čekáš? Dělej!
	AI_StopProcessInfos(self);
};

//------------------Shakzi-------------------------------------

instance DIA_Gobbo_Desert_EXIT(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 999;
	condition = DIA_Gobbo_Desert_EXIT_condition;
	information = DIA_Gobbo_Desert_EXIT_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gobbo_Desert_EXIT_condition()
{
	return TRUE;
};

func void DIA_Gobbo_Desert_EXIT_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gobbo_Desert_HELLO(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_HELLO_condition;
	information = DIA_Gobbo_Desert_HELLO_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Gobbo_Desert_HELLO_condition()
{
	if(GoblinKing == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_HELLO_info()
{
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_00");	//Muž... muž, člověče! Shakzi ho nosí Khir Shar.
	AI_Output(other,self,"DIA_Gobbo_Desert_HELLO_01_01");	//Mluvíš se mnou?!
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_02");	//Hloupí lidé! On je viděn tady více lidí? Shakzi s ním promluvit! Nechápal... legrační člověk!
	AI_Output(other,self,"DIA_Gobbo_Desert_HELLO_01_03");	//Kolik už goblinů začalo mluvit lidskou řečí?
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_04");	//Zde lidé žili... hodně lidí. Nyní někdo! Všichni jsou mrtví... dlouhý čas zemřít.
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_05");	//Shakzi lidé vědí trochu jazyk. Žijí bok po boku, vidět lidi, naslouchat lidem.
	AI_Output(other,self,"DIA_Gobbo_Desert_HELLO_01_06");	//Nebo mám prostě štěstí na mluvící gobliny.
};

instance DIA_Gobbo_Desert_WhatNeed(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_WhatNeed_condition;
	information = DIA_Gobbo_Desert_WhatNeed_info;
	permanent = FALSE;
	description = "A proč ses mě rozhodl oslovit?";
};

func int DIA_Gobbo_Desert_WhatNeed_condition()
{
	if((GoblinKing == TRUE) && (Npc_KnowsInfo(hero,DIA_Gobbo_Desert_HELLO) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_WhatNeed_info()
{
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_00");	//A proč ses mě rozhodl oslovit?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_01");	//Shakzi vidět, že lidé nemusí být snadné. On nést Khir Shar!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_02");	//Co je zač ta Khir Shar?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_03");	//Hloupí lidé! Nevím, co je Khir Shar! Noste to sám, já nic nevím. Legrační člověk!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_04");	//Takže máš na mysli tu palici, co mám u sebe?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_05");	//Člověk je sám palice! Khir Shar není palice... to být známkou síly pro skřety. Všichni bratři Shakzi respektovat totem!
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_06");	//Ale Shakzi neví, kde má být?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_07");	//Možná, že ukrást? Nebo zabít Shakzi bratry a vzít Khir Shar sám.
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_08");	//Ne! To je jen dárek od jednoho goblina.
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_09");	//Dárek?!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_10");	//Ano, dárek. Co je na tom divného? Pomáhal jsem mu s jedním velmi důležitým problémem, a on mi řekl, že z vděčnosti mi dá to Khir Shar.
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_11");	//Tak je to dárek! Velmi velké a velmi cenná...
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_12");	//Shakzi myslet, že člověk moc pomoct těm, kteří mu dát Khir Shar.
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_13");	//Vypadá to, že ten kus dřeva pro tebe něco znamená.
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_14");	//Ti, kdo ho nosí, nemůže být strach z goblinů. Goblini nedotkli.
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_15");	//Hmmm... Tak to vysvětluje hodně.
};

instance DIA_Gobbo_Desert_Quest(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_Quest_condition;
	information = DIA_Gobbo_Desert_Quest_info;
	permanent = FALSE;
	description = "Ještě něco?";
};

func int DIA_Gobbo_Desert_Quest_condition()
{
	if((GoblinKing == TRUE) && (Npc_KnowsInfo(hero,DIA_Gobbo_Desert_WhatNeed) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_Quest_info()
{
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_00");	//Ještě něco?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_01");	//Muž mít pravdu... Shakzi nejen s ním mluvit. Chce, také trochu pomoct. 
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_02");	//Za to Shakzi dát člověku výbornou a hodnotnou cenu! Člověk musí ji mít opravdu rád.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_03");	//No, trochu mě to zaujalo. Co bys rád?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_04");	//Člověk pomoct Shakzi hledat jednu věc - jeho posvátný totem!
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_05");	//Posvátný totem? Co to je?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_06");	//Být tak krásný, být tak skvělý, stát tam na velké skále uprostřed tábora.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_07");	//Všichni bratři ho uctívat každý den, naslouchat tomu, co říkal k nim a přinést mu dary.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_08");	//Ale v poslední době mizí! Nikdo vědět, jak se to stalo. Stál tam a pak už ne.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_09");	//Byl ukraden?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_10");	//Shakzi neví... Ale mít jistotu, že nikdo z jeho bratrů to nedokázal.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_11");	//Všichni z nich to velmi respektovaly a bát posvátný totem, teď všichni bratři Shakzi hodně smutku.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_12");	//Dobře, dobře. A můžeš mi přesně popsat, jak vypadal, ten tvůj... totem?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_13");	//Mmmm... být tak krásný, tak jako... jako zlato od lidu! Ano, přesně tak! A to třpytí na slunci, velmi lesklý. 
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_14");	//To je všechno?! Toho není moc.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_15");	//Jak to vidím já... Obvykle goblini seberou všechno, co by neměly. Zejména zlato. Tak se mi zdá, že jste si to rozebrali sami.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_16");	//Muž legrace... Shakzi v současné době nechce vtip. Shakzi musí vrátit totem na místo! Jinak se jedná o katastrofu pro ně. Velký problém!
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_17");	//Dobře, neboj se! Podívám se na to. Jen nezapomeň na tu odměnu, co jsi mi slíbil.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_18");	//Shakzi pamatovat všechno. Člověk nemusí mít strach. Ale Shakzi velmi rád, člověk, když vrátí jeho totem.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_19");	//Nepochybuji o tom...
	MIS_GoblinTotem = LOG_Running;
	Log_CreateTopic(TOPIC_GoblinTotem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GoblinTotem,LOG_Running);
	B_LogEntry(TOPIC_GoblinTotem,"Goblin Shakzi mě požádal, abych našel posvátný totem goblinů, který se ztratil z jejich tábora.");
	AI_StopProcessInfos(self);
};

instance DIA_Gobbo_Desert_Quest_Done(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_Quest_Done_condition;
	information = DIA_Gobbo_Desert_Quest_Done_info;
	permanent = FALSE;
	description = "Není tohle tvůj totem?";
};

func int DIA_Gobbo_Desert_Quest_Done_condition()
{
	if((GoblinKing == TRUE) && (MIS_GoblinTotem == LOG_Running) && (Npc_HasItems(hero,ItMi_TGoblin) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_Quest_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_Done_01_00");	//Není tohle tvůj totem?
	B_GiveInvItems(other,self,ItMi_TGoblin,1);
	Npc_RemoveInvItems(self,ItMi_TGoblin,1);
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_01");	//Je to být ono! Člověk najít posvátnou totem bratři!
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_02");	//Shakzi být velmi spokojen. Ale nechápal, kde člověk ji mohl najít?
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_Done_01_03");	//Vypadá to, že váš totem přilákal nějakýho jinýho goblina. Prostě... neobvyklé.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_04");	//Nezáleží na tom! Hlavní věc je, že totem zpátky a Shakzi s bratry opět moci, aby ho uctívali.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_05");	//Shakzi také vidět, že osoba není lhář, když řekl, že pomoct goblinům.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_06");	//Za to mu dát klíč k otevření truhly, v blízkosti Shakzi.
	B_GiveInvItems(self,other,ItKey_GoblinChest,1);
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_07");	//Tam najde jeho odměna!
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_Done_01_08");	//Děkuju.
	MIS_GoblinTotem = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GoblinTotem,LOG_SUCCESS);
	B_LogEntry(TOPIC_GoblinTotem,"Vrátil jsem Shakzimu jeho posvátný totem. Ode dneška si všichni goblini v táboře zapamatují tento den, jako svátek!");
	AI_StopProcessInfos(self);
};