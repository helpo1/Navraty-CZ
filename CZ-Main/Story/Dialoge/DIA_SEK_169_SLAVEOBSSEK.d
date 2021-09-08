instance DIA_SEK_169_SLAVEOBSSEK_EXIT(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 999;
	condition = dia_SEK_169_SLAVEOBSSEK_exit_condition;
	information = dia_SEK_169_SLAVEOBSSEK_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_169_SLAVEOBSSEK_exit_condition()
{
	return TRUE;
};

func void dia_SEK_169_SLAVEOBSSEK_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SEK_169_SLAVEOBSSEK_HALLO(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_hallo_condition;
	information = dia_SEK_169_SLAVEOBSSEK_hallo_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_SEK_169_SLAVEOBSSEK_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KnowWhoRebels == FALSE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_hallo_info()
{
	var int randy;

	randy = Hlp_Random(3);

	if(randy == 0)
	{
		AI_Output(self,other,"DIA_SEK_169_STANDARD_13_00");	//Nech mě na pokoji!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_SEK_169_STANDARD_13_01");	//Co ode mě potřebuješ? Nech mě na pokoji!
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_SEK_169_STANDARD_13_02");	//Všichni tady umřem!
	};

	AI_StopProcessInfos(self);
};


instance DIA_SEK_169_SLAVEOBSSEK_REBELS(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_REBELS_condition;
	information = dia_SEK_169_SLAVEOBSSEK_REBELS_info;
	permanent = FALSE;
	description = "Slyšel jsem, že chystáš útěk.";
};

func int dia_SEK_169_SLAVEOBSSEK_REBELS_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (KnowWhoRebels == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_REBELS_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_01");	//Slyšel jsem, že chystáš útěk.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_02");	//To se pleteš. Nic jsem nepřipravoval.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_03");	//Zbytečně zapíráš! Jeden ze otroků tě napráskal.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_04");	//Sakra. Věděl jsem, že k tomu dojde. (vztekle) Tak co odemě chceš?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_05");	//Chci jen pomoct.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_06");	//Ty? (překvapeně) A cože, tak najednou chce novic stínů pomáhat otrokům.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_07");	//Baal Namib a další Guru, jsou velmi znepokojeni vaším zmizením.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_08");	//Baal Namib?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_09");	//(překvapeně) Takže ty jsi...
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_10");	//Není potřeba dalších slov. Myslím, že to všichni chápete.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_11");	//Jestli je to tak... (zmateně) Pak ti asi můžem důvěřovat.
	B_LogEntry(TOPIC_RebelSlave,"Vyslechl jsem Mariuse. Vyslechl jsem ho a opravdu organizoval povstání, rozhodl jsem se mu s tím pomoci. Ale vyvstává otázka - co říct Osairovi?");
	RebelsTrust = TRUE;
};

instance DIA_SEK_169_SLAVEOBSSEK_RebelsTrust(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_condition;
	information = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_info;
	permanent = FALSE;
	description = "Řekni mi co jsi vymyslel.";
};

func int dia_SEK_169_SLAVEOBSSEK_RebelsTrust_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (RebelsTrust == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_RebelsTrust_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_01");	//Řekni mi co jsi vymyslel.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_02");	//V první řadě potřebujeme zbraně... (tiše) To je nejdůležitější.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_03");	//Bez nich nemáme šanci proti dobře vycvičeným vojákům Masyafu.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_04");	//Podle mého názoru, vám zbraně nepomůžou. Jeden z bojovníků Masyafu vás lehce přemůže všechny.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_05");	//Ach... (povzdech) Je to tak, v tomdle ti musím dát za pravdu!
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_06");	//Ale beze zbraní se nikdo z otroků proti stínům nepostaví.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_07");	//A bez toho je i samotná myšlenka na útěk absurdní.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_08");	//Jestli máme mít šanci uspět, tak jedině společnými silami!
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_09");	//Rozumím. A už ses snažil získat zbraň?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_10");	//Zkoušel jsem to, ale není to tak snadné, když tě pořád sledují.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_11");	//Možná, to můžu zařídit já?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_12");	//(zamyšleně) A můžeš?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_13");	//Pokusím se, pro mě to bude o něco jednodušší.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_14");	//Dobře, potřebujem tak tři svazky zbraní. 
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_15");	//To by mělo stačit pro nás pro všechny.
	MIS_RebelsWeapon = LOG_Running;
	Log_CreateTopic(TOPIC_RebelsWeapon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_Running);
	B_LogEntry(TOPIC_RebelsWeapon,"Marius mě požádal abych donesl tři svzky zbraní pro otroky.");
};

instance DIA_SEK_169_SLAVEOBSSEK_OsairNeed(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_OsairNeed_condition;
	information = dia_SEK_169_SLAVEOBSSEK_OsairNeed_info;
	permanent = FALSE;
	description = "Osair požaduje hlavu organizátora vzpoury.";
};

func int dia_SEK_169_SLAVEOBSSEK_OsairNeed_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (RebelsTrust == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_OsairNeed_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_01");	//Osair požaduje hlavu organizátora vzpoury.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_02");	//Neuvěřitelné... (vzrušeně) Otroci se chovají poslední dobou nervózně a rozrušeně.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_03");	//A všechno kvůli tomu, že v nich neustále podněcuju naději na záchranu.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_04");	//A co s tím mám teď dělat?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_05");	//Nemůžeš mu prostě říct, že jsi ho nenašel?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_06");	//Nemyslím si, že to bude fungovat. Osair není tak hloupí, aby na to skočil. 
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_07");	//A nedá si pokoj dokud tě nenajde.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_08");	//Co tedy navrhuješ?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_09");	//A co kdyby se ten zrádce co tě napráskal, stal obětním beránkem?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_11");	//To nedokážu rozhodnout, co ti na to mám říct...
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_12");	//A tobě se to nezdá, jako příliš krutý trest za jeho čin?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_13");	//No jestli se tak strachuješ o jeho osud, mohu Osairovi předhodit tebe. A pak...
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_14");	//Dobře, dobře... (rozčíleně) Nemusíš dál pokračovat. 
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_15");	//Dobrá, vezmu si to na svědomí, jelikož náš úkol je mnohem důležitější.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_16");	//Bude to pro nás snžší, když si Osair bude myslet, že zabil organizátora vzpoury.
	BetrayFound = TRUE;
	B_LogEntry(TOPIC_RebelSlave,"Rozhodli jsme se s Mariusem vydat Osairovi práskače co Mariuse zradil a udělat z něj rebela co organizuje vzpouru. Osair se uklidní a ztratí ostražitost.");
};

instance DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_condition;
	information = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_info;
	permanent = FALSE;
	description = "Tady jsou tři svazky zbraní.";
};

func int dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_condition()
{
	if((MIS_RebelsWeapon == LOG_Running) && (Npc_HasItems(other,ItSe_Weapon_Sack) >= 3))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_01");	//Tady jsou tři svazky zbraní.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_02");	//Ticho, ticho... (šeptem) podávej rychle.
	B_GiveInvItems(other,self,ItSe_Weapon_Sack,3);
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_03");	//Schovám to na bezpečném místě dokud nebudem připravení.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_04");	//Děkuju za pomoc.
	MIS_RebelsWeapon = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_SUCCESS);
	B_LogEntry(TOPIC_RebelsWeapon,"Přinesl jsem Mariusovi tři svazky zbraní.");
};

instance DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Death(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 2;
	condition = dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_condition;
	information = dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_info;
	permanent = FALSE;
	description = "Zrádce dostal co si zasloužil.";
};

func int dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_condition()
{
	if((MIS_RebelSlave == LOG_SUCCESS) && (Npc_IsDead(SEK_156_SLAVEOBSSEK) == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_01");	//Zrádce dostal co si zasloužil
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_02");	//(soucitně) Doufám, že dlouho netrpěl?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_03");	//Ne. Osair ho setnul jednou ranou.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_04");	//Víš, je to pro mě nepříjemné.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_05");	//Uklidni se. Teď můžeme v klidu připravit útěk a nikdo nebude nic tušit.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_06");	//Doufám, že máš pravdu a jeho oběť nebyla marná.
	AI_StopProcessInfos(self);
};

instance DIA_SEK_169_SLAVEOBSSEK_WhenRun(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_WhenRun_condition;
	information = dia_SEK_169_SLAVEOBSSEK_WhenRun_info;
	permanent = FALSE;
	description = "Kdy jsi chtěl utéct?";
};

func int dia_SEK_169_SLAVEOBSSEK_WhenRun_condition()
{
	if(MIS_RebelsWeapon == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_WhenRun_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_01");	//Kdy jsi chtěl utéct?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_02");	//Ještě nevím. Ale myslím, že nemá cenu to příliš dlouho protahovat.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_03");	//V opačném případě tady všichni chcípnem... od hladu a bití.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_04");	//Nemám pro vás moc dobrou zprávu. 
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_05");	//Co je to za zprávu?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_06");	//Jediný průchod z údolí byl zavalen lavinou. Tak na tvém místě bych s útěkem nespěchal.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_08");	//To myslíš vážně? Proklatě. To mění mé plány.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_09");	//Ale počkej, jak stínové neustále opouští údolí a vracejí se zpět s novými otroky?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_10");	//To jsem zatím nezjistil. Ale než to prověřím, tak zatím nic nepodnikejte.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_12");	//Máš pravdu. Dobře. Musím jít pracovat.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_13");	//Jestli stínové uvidí že se vybavuju míto toho, abych zametal podlahu - zmlátí mě k smrti.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_14");	//Dobře, ještě se uvidíme.
	AI_StopProcessInfos(self);
};