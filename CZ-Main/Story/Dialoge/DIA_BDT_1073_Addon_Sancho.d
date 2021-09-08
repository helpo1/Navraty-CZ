
instance DIA_Addon_Sancho_EXIT(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 999;
	condition = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Sancho_PICKPOCKET(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 900;
	condition = DIA_Addon_Sancho_PICKPOCKET_Condition;
	information = DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	return C_Beklauen(50,40);
};

func void DIA_Addon_Sancho_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,Dialog_Back,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};

func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};


instance DIA_Addon_Sancho_HI(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Sancho_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Do prdele, další nováček. (směje se) Taky kvůli zlatu, co?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Zlato?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(směje se) Nedělej si ze mě srandu!
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//Všichni nováčči, kteří sem přišli se chtějí dostat do dolu.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Ale nemysli si, že je to tak jednoduché!
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogEntry_Quiet(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry_Quiet(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Sancho_Lager(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent = FALSE;
	description = "Jak se dostanu do tábora?";
};


func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Jak se dostanu do tábora?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Jednoduše následuj stezku!
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Ale pokud se chceš dostat do dolu, budeš muset jít přes Franca.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//Očekává, že všichni nováčči tady budou prvně chvíli otročit.
	};
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"Všichni nováčči musí prvně pracovat v bažině, než dostanou přístup do dolu.");
};


instance DIA_Addon_Sancho_Mine(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 3;
	condition = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent = FALSE;
	description = "Řekni mi o dolu víc...";
};


func int DIA_Addon_Sancho_Mine_Condition()
{
	if(!Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Sancho_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Řekni mi o dolu víc...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Dám ti doubrou radu : pokud se tam chceš dostat, buď za dobře s Francem. On je tady šéf.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//On rozhoduje kdo další vstoupí.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//Ale pustí tě, pouze pokud se tady nebudeš flákat.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Takže běž za ním a nech si od něj zadat práci!
	B_LogEntry(Topic_Addon_Franco,"Franco rozhoduje, kdo půjde do tábora. Nabízí práci.");
};


instance DIA_Addon_Sancho_Franco(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 4;
	condition = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent = FALSE;
	description = "Kde najdu Franca?";
};


func int DIA_Addon_Sancho_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Mine) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Sancho_Franco_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Kde najdu Franca?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Většinou se zdržuje na dvoře před táborem.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Vycházej s ním dobře nebo ti dá stejně mizernou práci jako mám já!
	B_LogEntry(Topic_Addon_Franco,"Franco je v oblasti před táborem.");
};


instance DIA_Addon_Sancho_Spitzel(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 5;
	condition = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent = FALSE;
	description = "Ty musíš být pořád tady?";
};


func int DIA_Addon_Sancho_Spitzel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Franco) || Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Sancho_Spitzel_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Ty musíš být pořád tady?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Musím kontrolovat všechny nováčky a ujistit se, že nikdo z nich není špeh.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Ale to pusť z hlavy. Tím myslím, že jsme tady na konci světa. Tady uprostřed močálu.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Nikdo nás nenajde - a kdo by se obtěžoval posílat sem špeha?
};


instance DIA_Addon_Sancho_Perm(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 99;
	condition = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Addon_Sancho_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Spitzel))
	{
		return TRUE;
	};
	return FALSE;
};


var int Comment_Franco;
var int Comment_Esteban;

func void DIA_Addon_Sancho_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//Co je nového?
	if(Npc_IsDead(Franco) && (Comment_Franco == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//Slyšel jsem, že jsi zabil Franca. Pěkná práce...
		if(!Npc_IsDead(Carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... ale teď máme za zády Carlose. On nestrpí žádné hlouposti...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//A vyřídíls taky Carlose? Kámo, ty jsi pěknej zabiják! Ale mě nech na pokoji.
		};
		Comment_Franco = TRUE;
	}
	else if(Npc_IsDead(Esteban) && (Comment_Esteban == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//Slyšel jsem, že jsi zabil Estebana. Hej chlape, nechystáš ty něco?
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Nic nového se nestalo.
	};
};

