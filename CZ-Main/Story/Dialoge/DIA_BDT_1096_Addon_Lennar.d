
instance DIA_Addon_Lennar_EXIT(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 999;
	condition = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lennar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lennar_PICKPOCKET(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 900;
	condition = DIA_Addon_Lennar_PICKPOCKET_Condition;
	information = DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	return C_Beklauen(65,100);
};

func void DIA_Addon_Lennar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,Dialog_Back,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};


instance DIA_Addon_Lennar_Hi(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 1;
	condition = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent = FALSE;
	description = "Zdravím.";
};


func int DIA_Addon_Lennar_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Zdravím.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Ahoj, jmenuji se Lennar. Vítej v táboře kopáčů.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Kopáčů? Myslel jsem, že toto je tábor banditů...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Jasně, však banditi tady kopou taky. (škubne ramenem) Takže...
};


instance DIA_Addon_Lennar_Attentat(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 2;
	condition = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent = FALSE;
	description = "O tom pokusu zavraždit Estebana...";
};


func int DIA_Addon_Lennar_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lennar_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//Poslouchám?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//Máš tušení, kdo za tím je?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//(nadšeně) Samozřejmě!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(nadšeně) Tutově je za tím Emilio!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(hořečně) Vždy utíkal do dolu jako šílenec a pak kopal jako krtek.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//Ale od toho pokusu o vraždu jen sedí na lavičce a nepohne se ani o píď.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//To je ono! Aby mohl do dolu, musel mít červený kámen od Estebana.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//(šeptá) Jak se tak dívám do jeho očí, vsadím se, že nebude vzdorovat dlouho.
	B_LogEntry(Topic_Addon_Esteban,"Lennar podezřívá Emilia, protože se Estebanovi vyhýbá.");
};


instance DIA_Addon_Lennar_Inspektor(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 3;
	condition = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent = FALSE;
	description = "Co by mohl Emilio mít z Estebanovy smrti?";
};


func int DIA_Addon_Lennar_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Co by mohl Emilio mít z Estebanovy smrti?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//Co já vím? Možná má kamaráda, který by převzal po Estebanovi jeho místo.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//(pro sebe) Ano, to by mohlo dávat smysl...
};


instance DIA_Addon_Lennar_Mine(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 4;
	condition = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Lennar_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lennar_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//Opravdu pro mě máš červený kámen?
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Perfektní. Teď konečně rozbiju ty zatracené šutry na padrť - vím přesně, kde začnu!
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Lennar_Hacker(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 9;
	condition = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Addon_Lennar_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//Všechno je v klidu.
};

