
instance DIA_Morgahard_EXIT(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 999;
	condition = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_HALLO(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_HALLO_Condition;
	information = DIA_Morgahard_HALLO_Info;
	description = "Ty jsi Morgahard.";
};


func int DIA_Morgahard_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//Ty jsi Morgahard.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Odkud znáš moje jméno?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Hledá tě soudce. Utekl jsi z vězení.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Tak cos teda provedl? Ukradls mu peněženku?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Jemu ne. Místodržícímu. Ale byli jsme v soudcových službách.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//Potom, co jsme místodržícího obrali, se nechtěl s námi podělit o kořist, a tak nás strčil za mříže.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Nechtěli jsme se houpat na šibenici, tak jsme utekli.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//Mám dojem, že ztratili naši stopu. Vypadá to, že je z ní někdo svedl.
	Info_ClearChoices(DIA_Morgahard_HALLO);
	Info_AddChoice(DIA_Morgahard_HALLO,"Přestaň fňukat a radši tas zbraň.",DIA_Morgahard_HALLO_attack);
	Info_AddChoice(DIA_Morgahard_HALLO,"Co proti němu podnikneme?",DIA_Morgahard_HALLO_richter);
	Info_AddChoice(DIA_Morgahard_HALLO,"Soudce mi nařídil, abych tě zabil.",DIA_Morgahard_HALLO_tot);
	B_LogEntry(TOPIC_RichterLakai,"Našel jsem Morgaharda, vůdce uprchlíků.");
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP(XP_FoundMorgahard);
};

func void DIA_Morgahard_HALLO_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//Soudce mi nařídil, abych tě zabil.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Jo, jasně. Proto jseš tady, ne?
};

func void DIA_Morgahard_HALLO_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Co proti němu podnikneme?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Vůbec nic. Sedí si v horní čtvrti jako pavouk uprostřed sítě a nikdo na něj nemůže.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Tak jsem to nemyslel. Jen bychom potřebovali nějaký důkaz o jeho provinění v tý věci s místodržícím.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Tak důkaz, říkáš? Něco by se u mě našlo. Ale kdo by poslouchal trestanýho kriminálníka?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Dej mi ten důkaz a já se postarám o to, aby vás už nechali na pokoji.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Určitě? Tak jo. Tady, vezmi si tenhle dopis. Je na něm soudcův podpis.
	B_GiveInvItems(self,other,ItWr_RichterKomproBrief_MIS,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//I když mě to nezbaví obvinění, mělo by to stačit jako důkaz jeho spoluúčasti na tý věci.
	B_LogEntry(TOPIC_RichterLakai,"Morgahard mi předal jistý soudní dokument, který jasně dokazuje, že soudce místodržícího Lariuse prachsprostě okradl. Myslím, že přesně tohle po mně chtěl Lee.");
	AI_StopProcessInfos(self);
};

var int MorgahardSucked;

func void DIA_Morgahard_HALLO_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Přestaň skučet a chop se zbraně! Skončíme to hned.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Máš pravdu, stejně nemám co ztratit.
	AI_StopProcessInfos(self);
	MorgahardSucked = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

instance DIA_Morgahard_Nickname(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Nickname_Condition;
	information = DIA_Morgahard_Nickname_Info;
	permanent = FALSE;
	description = "Není jistý Adelhard náhodou tvůj příbuzný?";
};

func int DIA_Morgahard_Nickname_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE) && (AlehardHere == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Nickname_Info()
{
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_00");	//Není jistý Adelhard náhodou tvůj příbuzný?
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_01");	//Kdo? Alehard? Žádného Aleharda neznám.
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_02");	//Řekl jsem 'Adelhard'.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_03");	//Ani jeho neznám.
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_04");	//Nemluvím o dvou lidech, jen o jednom - A-del-hard!
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_05");	//Děláš si ze mne blázny? Jdi k čertu!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_06");	//Hej, hej, klídek. Jen jsem se chtěl zeptat, bez vedlejších úmyslů.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_07");	//Nejsi první, kdo se mě už takhle 'jen chtěl zeptat'. Nikoho neznám, rozumíš?!
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_08");	//Ani Aleharda, ani Leonarda, ani Bernarda, ani Fernanda... I když, Fernanda já znám... (sarkasticky) Ale ten tě asi nezajímá?
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_09");	//Ne.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_10");	//Smůla!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_11");	//Máte s Adelhardem podobná jména, mají stejné zakončení, tak jsem si myslel...
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_12");	//Aha! Ty sis 'myslel'! Larius a Cornelius mají také stejné konce jmen! Možná jsou manželé? Zeptej se, až je uvidíš!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_13");	//To je nápad.
};

instance DIA_Morgahard_Perm(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm_Condition;
	information = DIA_Morgahard_Perm_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Morgahard_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE) && (AlehardHere == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm_Info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//Ta soudcovská svině... jednou se bude houpat na šibenici.
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_Perm2(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm2_Condition;
	information = DIA_Morgahard_Perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Morgahard_Perm2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MorgahardSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm2_Info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Proč se prostě neztratíš?
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_PICKPOCKET(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 900;
	condition = DIA_Morgahard_PICKPOCKET_Condition;
	information = DIA_Morgahard_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Morgahard_PICKPOCKET_Condition()
{
	return C_Beklauen(73,45);
};

func void DIA_Morgahard_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET,Dialog_Back,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};

func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};