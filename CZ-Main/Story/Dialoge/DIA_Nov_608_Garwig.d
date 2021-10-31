
instance DIA_Garwig_EXIT(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 999;
	condition = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garwig_Wurst(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Wurst_Condition;
	information = DIA_Garwig_Wurst_Info;
	permanent = FALSE;
	description = "Chceš klobásu?";
};

func int DIA_Garwig_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Chceš klobásu?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Jasně, díky, bratře.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Garwig_Hello(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Garwig_Hello_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hello_Info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Innos s tebou. Nikdy jsem tě tu neviděl. Jsi nový?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Ano, právě jsem se stal novicem.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//Pak ti přeji, aby ses rychle usadil. Dej mi vědět, jestli budeš něco potřebovat.
};


instance DIA_Garwig_Room(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 5;
	condition = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent = FALSE;
	description = "Co je toto za komnatu?";
};

func int DIA_Garwig_Room_Condition()
{
	return TRUE;
};

func void DIA_Garwig_Room_Info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//Co je toto za komnatu?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Zde jsou uchovávány posvátné relikvie kláštera.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Jaké relikvie?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Innosovo kladivo a štít ohně! Nejdůležitější pozůstatky Innose v tomto chrámu. Důležitější jsou již jen v hlavním městě království.
};

instance DIA_Garwig_Hammer(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 99;
	condition = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent = TRUE;
	description = "Řekni mi o tom kladivu.";
};


func int DIA_Garwig_Hammer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hammer_Info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Řekni mi o tom kladivu.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Tímto posvátným kladivem zasáhnul král Rhobar kamenného strážce a ten se rozsypal na kousíčky.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//Říká se, že kamenný strážce byl nezranitelný. Tyčil se na bitevním poli jako věž a zbraně se svážely po jeho kůži.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//Se jménem Innose na rtech ho Rhobar udeřil.
};


instance DIA_Garwig_Shield(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 98;
	condition = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent = FALSE;
	description = "Řekni mi o tom štítu.";
};


func int DIA_Garwig_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Shield_Info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Řekni mi o tom štítu.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//Patřil Dominikovi v boji na jižních ostrovech. 
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Ale už by neměl být používán, tak byl přibit na zeď.
};


instance DIA_Garwig_Auge(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 4;
	condition = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent = FALSE;
	description = "Je zde také Innosovo oko?";
};


func int DIA_Garwig_Auge_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room) && (Kapitel <= 2))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Auge_Info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Je zde také Innosovo oko?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Samozřejmě, že ne. Zvláštní myšlenka. Nikdo neví, kde je tento posvátný artefakt uložen.
};


instance DIA_Garwig_SLEEP(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 23;
	condition = DIA_Garwig_SLEEP_Condition;
	information = DIA_Garwig_SLEEP_Info;
	permanent = TRUE;
	description = "Co tu děláš?";
};

func int DIA_Garwig_SLEEP_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Co tu děláš?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Jsem strážcem posvátných artefaktů.
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,Dialog_Back,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice(DIA_Garwig_SLEEP,"Nepotřebuješ vystřídat?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice(DIA_Garwig_SLEEP,"Proč jsou ty artefakty hlídány?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice(DIA_Garwig_SLEEP,"Spíš vůbec někdy?",DIA_Garwig_SLEEP_NEVER);
};

func void DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices(DIA_Garwig_SLEEP);
};

func void DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Nepotřebuješ vystřídat?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//To je test? Poslali tě mágové, abys mě zkoušel? Věděl jsem to.
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Ale já zkouškou projdu. Dej jim vědět, že jsem jako skála a odolám všem pokušením.
};

func void DIA_Garwig_SLEEP_THIEF()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Proč jsou ty artefakty hlídány? Bojíte se, že je někdo ukradne?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//To je ale bláznivý nápad, kde jsi to vzal?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Pouze ti sloužící Innosovi smí vstoupit do kláštera. A nikdo z nich by tuto myšlenku nevzal za svou. 
};

func void DIA_Garwig_SLEEP_NEVER()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//Spíš vůbec někdy?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Innos mi dává sílu odolat spánku.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//Jak jinak bych mohl vykonávat posvátnou povinnost strážce?
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,"Ty NIKDY nespíš?",DIA_Garwig_SLEEP_AGAIN);
};

func void DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Ty NIKDY nespíš?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Ne, jestli usnu, nesplnil jsem svou zkoušku.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Ale já neusnu, Innos mi dává sílu a vytrvalost. Nikdy nejsem unavený.
};


instance DIA_Garwig_THIEF(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_THIEF_Condition;
	information = DIA_Garwig_THIEF_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Garwig_THIEF_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(hero,Holy_Hammer_MIS) == 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_THIEF_Info()
{
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(zklamaně) Zloděj! Zneuctil jsi nejen sebe, ale celý klášter!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Zaplatíš za tuto svatokrádež! Vrať mi kladivo nebo uvidíš!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(v zoufalství) Kladivo je pryč, jak se to mohlo stát?!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Zklamal jsem, Innos mě potrestá!
	};
};

instance DIA_Garwig_Abgeben(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_Abgeben_Condition;
	information = DIA_Garwig_Abgeben_Info;
	permanent = TRUE;
	description = "Přinesl jsem zpátky kladivo.";
};

func int DIA_Garwig_Abgeben_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Přinesl jsem zpátky kladivo.
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//Ach, ty záludný zloději!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//Takže jsi ho vzal ty...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Ale já nemám právo tě soudit. To Innos ti vynese zasloužený trest.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};

instance DIA_Garwig_PICKPOCKET(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 900;
	condition = DIA_Garwig_PICKPOCKET_Condition;
	information = DIA_Garwig_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};

func int DIA_Garwig_PICKPOCKET_Condition()
{
	return C_Beklauen(52,80);
};

func void DIA_Garwig_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,Dialog_Back,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 70)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};
