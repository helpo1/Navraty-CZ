
instance DIA_Addon_Tom_EXIT(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 999;
	condition = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Tom_PICKPOCKET(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 900;
	condition = DIA_Addon_Tom_PICKPOCKET_Condition;
	information = DIA_Addon_Tom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Tom_PICKPOCKET_Condition()
{
	return C_Beklauen(40,52);
};

func void DIA_Addon_Tom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,Dialog_Back,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};

func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};


instance DIA_Addon_Tom_HI(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 1;
	condition = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent = FALSE;
	description = "Proč tu sedíš?";
};


func int DIA_Addon_Tom_HI_Condition()
{
	if(TOM_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Proč tu sedíš?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//Dostal jsem se do problémů. Teď může být chození do tábora špatný nápad.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//Měl jsem slušné spojení s několika piráty, víš?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Pokaždé jsem potkal chlapy nedaleko tábora kvůli obchodu.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Chlape, kupoval jsem proviant pro polovinu lidí z tábora. 'Tome, obstarej mi tohle - Tome, obstarej mi tamto.'
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//A potom to bylo vše ztraceno kvůli tomu zatracenému Estebanovi.
};


instance DIA_Addon_Tom_Juan(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 2;
	condition = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent = FALSE;
	description = "Jak to?";
};


func int DIA_Addon_Tom_Juan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_HI) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Tom_Juan_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//Jak to?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban poslal jednoho z jeho lidí, Juana. On nás pozoroval.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//A potom, zrovna když jsem smlouval obchod s piráty, ten chlap vylezl ze svého úkrytu a srazil je k zemi!
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Chlapče, ten chlap byl rychlý! Ale ne dost rychlý. Mohl jsem utéct.
	SC_Knows_JuanMurderedAngus = TRUE;
	B_LogEntry(TOPIC_Addon_KillJuan,"Tak je to Juan, kdo je zodpovědný za vraždu Anguse a Hanka. Přepadl je a zabil je.");
};


instance DIA_Addon_Tom_Esteban(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 3;
	condition = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent = FALSE;
	description = "A od té doby se tu schováváš?";
};


func int DIA_Addon_Tom_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Juan) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Tom_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//A od té doby se tu schováváš?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Nejdřív jsem se vrátil do tábora, abych to řekl Fiskovi, Hunovi a ostatním, kteří čekali na zásilku.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//A Esteban je za to zodpovědný.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//Asi budu mrtvý, jetli Esteban zjistí, že jsem jim řekl, že je za tím on.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//Proto nejdu zpátky do tábora.
	Tom_Tells = TRUE;
};


instance DIA_Addon_Tom_Dead(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 4;
	condition = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent = FALSE;
	description = "Esteban je mrtvý.";
};


func int DIA_Addon_Tom_Dead_Condition()
{
	if(Npc_IsDead(Esteban) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Tom_Dead_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban je mrtvý.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Chlape, to je to, čemu říkám štěstí!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Kdo ho zabil?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(šklebí se) Noo, řekněme jenom, že to byl někdo, koho znáš...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//Děkuji mnohokrát, že jsi sem zašel. Teď se můžu vrátit do tábora...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_Addon_Tom_PERM(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent = TRUE;
	description = "Ještě něco?";
};


func int DIA_Addon_Tom_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Ještě něco?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Teď si můžu užít pití Luciiniho drinku bez starostí.
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Tom_Dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//Konečně se můžu vrátit!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//Hm? Obvykle tu sedím a počítám kameny...
	};
};


instance DIA_ADDON_TOM_ORCINVASION(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = dia_addon_tom_orcinvasion_condition;
	information = dia_addon_tom_orcinvasion_info;
	permanent = TRUE;
	description = "Slyšel jsem, že jsi pomohl chlapům...";
};


func int dia_addon_tom_orcinvasion_condition()
{
	if((TOM_TP == TRUE) && !Npc_KnowsInfo(other,dia_addon_tom_orcinvasion))
	{
		return TRUE;
	};
};

func void dia_addon_tom_orcinvasion_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_01");	//Slyšel jsem, že jsi pomohl chlapům dostat se z tábora, je to tak?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_02");	//Jo, obecně ano. I když nic hrdinského na to nevidím.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_03");	//A kdy jsi narazil na tu cestu?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_04");	//To už je dlouho, toulal jsem se v bažině...
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_05");	//Thorus říkal, že vás skřeti zastihli nepřipravené je to tak?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_06");	//To ano, všechno se stalo tak rychle. Ti všiví skřetí nás napadli z ničeho nic.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_07");	//Nevíš odkud přišli?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_08");	//Nevím, vynořili se z bažin.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_09");	//A dál?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_10");	//Nikdo nevěděl, co má dělat. Jedině Thorus zachoval klid.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_11");	//On s pár chlapy zorganizoval odpor v horní části tábora, ale skřetů bylo mnoho a tlačili je do chrámu.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_12");	//Díky němu jsou tu ti, které zde vidíš.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_13");	//Zatímco jsem jim ukazoval cestu, Thorus se zbytkem stráží zdrželi skřety.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_14");	//Pak se objevil jen on, ostatní to nedali... (rozrušeně)
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_15");	//Dojemné.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_16");	//No ještě že jsme se dostali z toho táboru živí. Ačkoliv nevíme co teď budeme dělat?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_17");	//Tábor byl náš jediný domov - jsme banditi, psanci kam teď půjdeme? Co budeme dělat?
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_18");	//Neboj se, jsem si jistý, že Thorus něco vymyslí.
};


