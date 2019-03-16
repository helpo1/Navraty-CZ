
instance DIA_Kjorn_EXIT(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 999;
	condition = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kjorn_Hello(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Kjorn_Hello_Condition()
{
	if((Npc_GetDistToNpc(self,hero) < 300) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_Hello_Info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hej, pojď sem!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Tohle údolí je nebezpečné místo a bez pořádného vybavení budeš mrtvej, ani se nenaděješ.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//Předpokládám, že to pořádné vybavení najdu u TEBE.
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//To se vsaď. Dokonce ti ho můžu prodat.
};


instance DIA_Kjorn_TRADE(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi můžeš nabídnout?";
};


func int DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Co mi můžeš nabídnout?
	B_GiveTradeInv(self);
};


instance DIA_Kjorn_SellInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent = FALSE;
	description = "Prodáváš taky informace?";
};


func int DIA_Kjorn_SellInfos_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_SellInfos_Info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Prodáváš taky informace?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//Přijde na to. Pokud je dobrá cena, řeknu všechno, co vím.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Kolik bys chtěl?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmm... (zamyšleně) Těžko říct! Ale myslím, že 50 zlatých za každou poskytnutou informaci vypadá celkem slušně.
};


instance DIA_Kjorn_BuyInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent = TRUE;
	description = "Potřebuju nějaké informace.";
};


func int DIA_Kjorn_BuyInfos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kjorn_SellInfos) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_BuyInfos_Info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Potřebuju nějaké informace.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 zlatých mincí!
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,"To je pro mě moc drahé.",DIA_Kjorn_BuyInfos_HoldMoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"Ano, tady.",DIA_Kjorn_BuyInfos_GiveMoney);
	};
};

func void DIA_Kjorn_BuyInfos_HoldMoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//To je pro mě moc drahé.
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_GiveMoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Ano, tady.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//A teď mi řekni...
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,Dialog_Back,DIA_Kjorn_BuyInfos_Back);
	if(KjornToldDragon == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... o dracích.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if(KjornToldDragon == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... ještě něco o dracích.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	if(KjornToldColony == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if(KjornToldColony == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... ještě něco o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony2);
	};
	if(KjornToldOldCamp == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... o hradu.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	if(KjorntoldOrks == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... o skřetech.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if(KjorntoldOrks == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... ještě něco o skřetech.",DIA_Kjorn_BuyInfos_Orks2);
	};
};

func void DIA_Kjorn_BuyInfos_Back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//Víš, rozmyslel jsem si to. Vrať mi moje peníze.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Jak je libo.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Řekni mi něco o dracích.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Draci jsou starobylá, neuvěřitelně mocná stvoření. Kdysi jich žily tisíce po celém světě.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Ale už je přes sto let, co některého z nich někdo viděl.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Jejich krev je horká jako vroucí olej. Když se ti podívají do očí, promění se tvé srdce v kámen. Tak jsem to alespoň slyšel...
	KjornToldDragon = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Řekni mi o těch dracích víc.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Ale ne všichni draci jsou takoví.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Někteří z nich můžou celou zem pokrýt vrstvou ledu několik stop tlustou.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Jiní dávají přednost životu v bažinách nebo v sopečných kráterech.
	B_LogEntry(TOPIC_DRACHENJAGD,"Drakobijec Kjorn se domnívá, že draků je několik druhů. Někteří si potrpí na chlad a vlhko, jiní zase dávají přednost ohni.");
	KjornToldDragon = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Řekni mi něco o Hornickém údolí.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//Hornické údolí v Khorinisu je díky magické rudě známé po celé zemi.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Tyhle hory jsou jediným místem na světě, kde se magická ruda vyskytuje.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Zbraně vyrobené z téhle rudy jsou prakticky nezničitelné a proniknou i tou nejlepší zbrojí.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Ještě před několika týdny celé údolí obklopovala magická bariéra. Byla neproniknutelná, a tak se nikdo nemohl dostat ven.
	KjornToldColony = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Řekni mi o tom údolí víc.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//Údolí se během těch několika málo dní změnilo k nepoznání.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Když přišli skřeti, ukázaly se i další stvůry. Nic podobného tu nikdo nikdy předtím neviděl.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//Říká se, že tu ještě pořád zůstalo několik osamělých lovců, ale nejsem si zrovna jistý, jestli taky zůstali naživu.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Vypadá to, jako by se do toho údolí stahovala všechna Beliarova stvoření temnot.
	KjornToldColony = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_OldCamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Řekni mi něco o hradě.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Leží téměř uprostřed Hornického údolí.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Dřív, když to údolí ještě sloužilo jako vězení, měli veškerou rudu odtamtud pod palcem rudobaroni.
	KjornToldOldCamp = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Řekni mi něco o skřetech.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Ti skřeti tu nejsou moc dlouho. Alespoň ti, co jsou teď před hradem.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Ale nejde mi na rozum, že jsou tak dobře organizovaní. Skřeti většinou útočí hlava nehlava a je jim jedno na co.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//Tihle čekají na ten správný čas. Čekají, ale my nevíme na co.
	KjorntoldOrks = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Řekni mi o těch skřetech víc.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Ti skřeti jsou pod velením elitních válečníků. Mají obrovskou sílu a disponují výbornými zbrojemi. Je téměř nemožné je porazit.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Jednou jsem viděl, jak jeden z nich složil vzrostlý dub jediným máchnutím sekery.
	KjorntoldOrks = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};


instance DIA_Kjorn_AllDragonsDead(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Zabil jsem všechny draky!";
};


func int DIA_Kjorn_AllDragonsDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Zabil jsem všechny draky!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//(smích) Jasně, a já jsem paladin.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Možná se ti podařilo zabít jednoho, ale všechny? Najdi si někoho jiného, kdo bude ochoten ti věřit.
};


instance DIA_Kjorn_PICKPOCKET(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 900;
	condition = DIA_Kjorn_PICKPOCKET_Condition;
	information = DIA_Kjorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kjorn_PICKPOCKET_Condition()
{
	return C_Beklauen(47,75);
};

func void DIA_Kjorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,Dialog_Back,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};


instance DIA_KJORN_FUCKOFF(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 2;
	condition = dia_kjorn_fuckoff_condition;
	information = dia_kjorn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kjorn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kjorn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

