
instance DIA_Elena_EXIT(C_Info)
{
	npc = BAU_911_Elena;
	nr = 999;
	condition = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Elena_HALLO(C_Info)
{
	npc = BAU_911_Elena;
	nr = 1;
	condition = DIA_Elena_HALLO_Condition;
	information = DIA_Elena_HALLO_Info;
	permanent = FALSE;
	description = "Haló, krásná paní.";
};


func int DIA_Elena_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Haló, krásná paní.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Hm. Odkud jsi utekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//Co chceš?
	};
};


instance DIA_Elena_Aufstand(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_Aufstand_Condition;
	information = DIA_Elena_Aufstand_Info;
	permanent = FALSE;
	description = "Říká se, že jste se postavili králi?";
};


func int DIA_Elena_Aufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//Říká se, že jste se postavili králi?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//Můj otec se rozhodl, že nadešel čas na to, abychom se začali spoléhat sami na sebe.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Domobrana nám nikdy nepomohla. Vždycky jen přišli a sebrali nám naše zásoby jídla.
	};
};


instance DIA_Elena_Arbeit(C_Info)
{
	npc = BAU_911_Elena;
	nr = 3;
	condition = DIA_Elena_Arbeit_Condition;
	information = DIA_Elena_Arbeit_Info;
	permanent = FALSE;
	description = "Jaká práce je tady na farmě k dispozici?";
};


func int DIA_Elena_Arbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Jaká práce je tady na farmě k dispozici?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//Můj otec platí každému, kdo pomáhá bránit farmu.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Měl bys zájem? Nevypadáš jako někdo, kdo by se hrnul do práce námezdního rolníka.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Kolik tvůj otec platí?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//To bys měl projednat spíš s ním.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//Vím jen, že každý žoldák tady denně dostává žold.
};


instance DIA_Elena_Regeln(C_Info)
{
	npc = BAU_911_Elena;
	nr = 4;
	condition = DIA_Elena_Regeln_Condition;
	information = DIA_Elena_Regeln_Info;
	permanent = FALSE;
	description = "Máte tu nějaká pravidla, která bych měl dodržovat?";
};


func int DIA_Elena_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Máte tu nějaká pravidla, která bych měl dodržovat?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Nedotýkej se tu ničeho, co není tvoje.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Vyhýbej se místům, na kterých nemáš co dělat.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//A jestli si chceš zabojovat, najdi si nějaké žoldáky.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Pokud si začneš dovolovat na rolníky, budou tady všichni proti tobě.
};


instance DIA_Elena_AUFGABE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 5;
	condition = DIA_Elena_AUFGABE_Condition;
	information = DIA_Elena_AUFGABE_Info;
	permanent = FALSE;
	description = "Jakou práci tu vykonáváš?";
};


func int DIA_Elena_AUFGABE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//Jakou práci tu vykonáváš?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Prodávám zboží, které vyrobíme. Jestli chceš něco koupit, stačí dát vědět.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Ale dovol mi tě varovat. Nestojím o žádné smlouvání a nemám ráda dlouhé prsty, rozumíme si?
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"Elena prodává na Onarově statku různé zboží.");
};


var int Elena_Trade_mit_mir;

instance DIA_Elena_TRADE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 7;
	condition = DIA_Elena_TRADE_Condition;
	information = DIA_Elena_TRADE_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Elena_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_AUFGABE) || (Elena_Trade_mit_mir == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Ukaž mi své zboží.
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Co ti můžu nabídnout?
	B_GiveTradeInv(self);
};


instance DIA_Elena_PERM(C_Info)
{
	npc = BAU_911_Elena;
	nr = 900;
	condition = DIA_Elena_PERM_Condition;
	information = DIA_Elena_PERM_Info;
	permanent = TRUE;
	description = "Stalo se tu poslední dobou něco důležitého?";
};


func int DIA_Elena_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Stalo se tu poslední dobou něco důležitého?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//Před pár dny můj otec rozhlásil, že už dál nesmíme nic prodávat ve městě.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Tak teď zůstávám na farmě a prodávám své zboží jenom návštěvníkům statku.
		Elena_Trade_mit_mir = TRUE;
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Domobrana napadá sousední farmy čím dál tím častěji. Je to jen otázka času, kdy můj otec zasáhne.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Země se stala poněkud nebezpečnou. Teď si nikdo netroufne ani za humna. Už je to pěkně dlouho, co se některý z nás naposledy vypravil do města.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//Žoldáci byli čím dál tím víc nesví. Ale jakmile odtáhl Sylvio se svými kumpány, vypadají už trochu klidněji.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Všichni tu mluví o hrozícím skřetím útoku. Ale já tomu moc nevěřím. Podle mě jsme tady na farmě před nimi v bezpečí.
	};
};


instance DIA_Elena_MINENANTEIL(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_MINENANTEIL_Condition;
	information = DIA_Elena_MINENANTEIL_Info;
	description = "Prodáváš důlní akcie?";
};


func int DIA_Elena_MINENANTEIL_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_MINENANTEIL_Info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Prodáváš důlní akcie?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//No a co? Sama jsem za ně zaplatila poslední drobné.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Elena_PICKPOCKET(C_Info)
{
	npc = BAU_911_Elena;
	nr = 900;
	condition = DIA_Elena_PICKPOCKET_Condition;
	information = DIA_Elena_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Elena_PICKPOCKET_Condition()
{
	return C_Beklauen(30,35);
};

func void DIA_Elena_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
	Info_AddChoice(DIA_Elena_PICKPOCKET,Dialog_Back,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Elena_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};

func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};

