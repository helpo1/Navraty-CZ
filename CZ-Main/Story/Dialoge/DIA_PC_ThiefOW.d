
instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hallo(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hallo_Info;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, myslel jsem si, že jsi mrtvý.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Ano... to jsem také byl.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale teď jsem zpátky a hledám důkaz o tom, že tady jsou draci.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Proč to děláš?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Pracuji pro lorda Hagena. S pomocí paladinů se nám určitě podaří draky zastavit.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladinové? Něco ti řeknu. Když se mi odsud podařilo uprchnout, šel jsem do Khorinisu.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Chtěl jsem paladiny varovat před draky. Nebesa vědí, proč jsem to vůbec zkoušel.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nadutec Lothar mě ani neposlouchal - a už vůbec mě nenechal si promluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Místo toho mě poslali zpátky s touhle výpravou. Takže o paladinech mi vůbec nemluv.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Důležité je zastavit draky, dokud máme čas - a vůbec nezáleží na tom, kdo nám k tomu pomůže.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Zastavit je? Měli bychom vypadnout z tohohle údolí, dokud máme čas aspoň na to.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Řekni, jak se ti podařilo dostat se přes průsmyk? Myslel jsem, že se to tam hemží skřety.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Skrz opuštěný důl vede cesta, kterou skřeti nehlídají.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//To je dobré vědět. V tom případě se brzy vydám do Khorinisu - mám tam pár nevyřízených účtů.
};


instance DIA_DiegoOw_Beweise(C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Beweise_Condition;
	information = DIA_DiegoOw_Beweise_Info;
	description = "Poslouchej, potřebuju ten důkaz.";
};


func int DIA_DiegoOw_Beweise_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Beweise_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Poslouchej, potřebuju ten důkaz.
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobrá, udělám pro tebe, co bude v mých silách. Ale nebudu za nikoho riskovat krk.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Dobrá, pokud to je smysl tvojí cesty - běž si promluvit s velitelem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Pokud někdo ví něco o útocích draků, tak to jsou hoši z hradu.
	};
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Jsem na cestě z Garondova rozkazu. Potřebuje vědět, kolik rudy jste zatím vykutali.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A pak ti dá ten důkaz, po kterém tak toužíš?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//Přesně tak. Takže co - můžeš mi něco říct?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//A když budeš na hradě, možná bys mohl Garondovi říct něco, co by ho mohlo velmi zajímat.
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Tady vzadu v jeskyni jsou ČTYŘI bedny s rudou. Narubali ji Silvestrovi chlapi.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Jen ať si pro ni Garond přijde a vezme si ji - ale to už já tady nebudu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//Nedaleko odsud v jeskyni jsou schované ČTYŘI bedny plné rudy, kterou vykopali Silvestrovi muži.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Garondovi nic nebrání, aby si pro ně přišel. Mně by na nic nebyly...
	};
	Silvestro_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"Diego dopravil ČTYŘI bedny rudy, kterou vytěžili Silvestrovi muži, do bezpečí.");
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "Jak to, že jsi u rudy právě ty?";
};


func int DIA_DiegoOw_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//Jak to, že jsi u rudy právě ty?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//Byl jsem v Silvestrově skupině. Těžili jsme několik dní a pak začal být Silvestro z ničeho nic strašně nervózní.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Řekl, že bychom měli ukrýt rudu na nějaké bezpečné místo.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//No, a protože jsem se tehdy už stejně chystal k útěku, nabídl jsem se, že rudu schovám.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//A to bylo moje jediné štěstí. Kopáči totiž narazili na pár důlních červů. Žádný z nich nepřežil.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 4;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "Co ti dva mrtví rytíři před tvou skrýší?";
};


func int DIA_DiegoOw_Ritter_Condition()
{
	if((Npc_HasItems(PAL_Leiche4,ItMi_OldCoin) == 0) || (Npc_HasItems(PAL_Leiche5,ItMi_OldCoin) == 0))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Co ti dva mrtví rytíři před tvou skrýší?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Našla si je zubatá během bitvy se skupinou chňapavců.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//No, Hornické údolí má svoje vlastní zákony. Říkal jsem jim to. Ale nechtěli mě poslouchat.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 5;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = FALSE;
	description = "Co bych měl o údolí vědět?";
};


func int DIA_DiegoOw_Perm_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co bych měl o údolí vědět?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od pádu bariéry se tady pár věcí změnilo. Hlavní slovo tu teď mají skřeti.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//My lidé nejsme nic jiného než žrádlo pro skutečné pány údolí: draky.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Drž se stranou od všeho, co je nad tvoje síly - a vyhýbej se všemu, co vypadá jako drak.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 6;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "Chtěl bych vykoupit Gornovi svobodu...";
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if(MIS_RescueGorn == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chtěl bych vykoupit Gornovi svobodu, ale Garond za to chce 1000 zlatých.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Hezká sumička. Mám u sebe 300 zlatých, klidně si je vezmi. Ale zbytek je na tobě.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,"Diego mi zaplatil 300 zlatých, abych Gornovi pomohl na svobodu.");
};


var int Diego_MerkeDEX;
var int Diego_MerkeSTR;

instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 100;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Jistě, co bys rád veděl?
	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//Tvá obratnost se zlepšila.
	};
	if(other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(pochvalně) Dobře. Tvá síla se zlepšila.
	};
	Info_ClearChoices(DIA_DiegoOw_Teach);
};

func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};


instance DIA_ThiefOW_PICKPOCKET(C_Info)
{
	npc = PC_ThiefOW;
	nr = 900;
	condition = DIA_ThiefOW_PICKPOCKET_Condition;
	information = DIA_ThiefOW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_ThiefOW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_ThiefOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,Dialog_Back,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};


instance DIA_Addon_ThiefOW_Together(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_Addon_ThiefOW_Together_Condition;
	information = DIA_Addon_ThiefOW_Together_Info;
	description = "Pojďme spolu.";
};

func int DIA_Addon_ThiefOW_Together_Condition()
{
	return TRUE;
};

func void DIA_Addon_ThiefOW_Together_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_Together_15_00");	//Pojďme spolu.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//K průsmyku? Proč ne...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//Jdi napřed. Potom se tady setkáme.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//Ale nechoďme blízko hradu nebo skřetí palisády.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Taky bychom se měli vyhnout všem paladinským táborům.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//Právě jsem utekl a nechci se nechat znovu chytit a zase makat v dole.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//A je ti zřejmě jasné, že se musíme vyhnout drakům.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Jen mi řekni, jakmile budeš připraven.
	MIS_DiegoTogether = LOG_Running;
	Log_CreateTopic(TOPIC_DiegoTogether,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DiegoTogether,LOG_Running);
	B_LogEntry(TOPIC_DiegoTogether,"Slíbil jsem Diegovi, že ho vezmu na bezpečné místo. Souhlasil. Jenom si přeje, abychom se drželi dál od hradů a dolů.");
};


instance DIA_Addon_ThiefOW_ComeOn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 12;
	condition = DIA_Addon_ThiefOW_ComeOn_Condition;
	information = DIA_Addon_ThiefOW_ComeOn_Info;
	permanent = TRUE;
	description = "Pojďme.";
};


func int DIA_Addon_ThiefOW_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Pojďme.
	if(C_DiegoTooFar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//To je špatný směr!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//V pořádku.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_ThiefOW_GoHome(C_Info)
{
	npc = PC_ThiefOW;
	nr = 13;
	condition = DIA_Addon_ThiefOW_GoHome_Condition;
	information = DIA_Addon_ThiefOW_GoHome_Info;
	permanent = TRUE;
	description = "Zůstaň tu a počkej.";
};


func int DIA_Addon_ThiefOW_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Zůstaň tu a počkej.
	if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Dobrá.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Npc_GetDistToWP(self,"DT_E1_04") < (1500 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//Budu čekat venku u veže.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//Budu čekat blízko dolu.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//Budu čekat před dolem.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(Npc_GetDistToWP(self,"OW_PATH_266") < (3000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//Počkám nedaleko.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//Ne, vrátím se do jeskyně.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//Můžeš mě znova navštívit, až doděláš svou práci.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//Nicméně když ti to bude trvat dlouho, vrátím se do jeskyně.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//Děláš si srandu. Rozdělit se tady?!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Nikdy!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//Můžeme jít průsmykem spolu.
	};
};

func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Počkám nedaleko, jestli se tam chceš porozhlédnout.
};

func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//Musíme jít jinama, abychom se dostali do průsmyku.
};


var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;

instance DIA_Addon_ThiefOW_TooFar(C_Info)
{
	npc = PC_ThiefOW;
	nr = 14;
	condition = DIA_Addon_ThiefOW_TooFar_Condition;
	information = DIA_Addon_ThiefOW_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_TooFar_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_DiegoTooFar(0))
		{
			if(Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
	return FALSE;
};

func void DIA_Addon_ThiefOW_TooFar_Info()
{
	if(C_DiegoTooFar(1000) == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//Nemám rád tady tu hrobku.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//Šel bych raději kolem.
	}
	else if(C_DiegoTooFar(1000) == LOC_ICE)
	{
		if(Diego_IceVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//To je vstup do bývalého Nového tábora.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//Předpokládám, že je tam drak.
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//Ten močál je mrtvý.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//Nebyl bych překvapen, kdyby tam na nás čekal drak.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Měli bychom se od takového místa držet dál.
	}
	else if(C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Vsadil bych se, že tam nahoře bychom potkali draka.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//A víš vůbec, že bych rád dorazil do Khorinisu živý?
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Vyberme si nějakou jinou cestu.
	}
	else if(C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//To jezero nás nikam nedovede.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//Průsmyk je na opačné straně.
	}
	else if(C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if(Diego_XardasVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//To je stará Xrdasova věž. Už ji ale samozřejmě opustil.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//Nebyl bych překvapen, kdyby na nás ještě čekaly nějaké nemilé překvapení.
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"XARDAS");
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_FAJETHMINE)
	{
		if(Diego_FajethVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//Fajethův důl je tam dole.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//Dolů?! Ne se mnou!
			Diego_FajethVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//Volil bych raději cestu mimo ten důl.
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if(Diego_SilvestroVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//To je důl, kde jsem byl nucen pracovat, když jsem se vrátil s kolonou trestanců.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//Jsem si zcela jistý, že tam nikdo nepřežil.
			B_Addon_Diego_WillWaitOutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//Když ti to bude trvat dlouho, vrátím se do jeskyně.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Chceš abych zde zůstal a počkal, až se vrátíš.
			Diego_SilvestroVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"SILVESTRO");
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if(Diego_GrimesVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//Toto je jeden z nových paladinských dolů.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//Nikdy - a nechci na tom nic měnit.
			Diego_GrimesVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Dal bych přednost vyhnout se tomu dolu.
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_BURG)
	{
		if(Diego_BurgVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Jsi blbý? Ne k hradu!
			Diego_BurgVariation = 1;
		}
		else if(Diego_BurgVariation == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//Ty kašleš na mé rady? Ne k hradu!
			Diego_BurgVariation = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//Říkám ne k hradu. Rozumíš?
			Diego_BurgVariation = 1;
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//Nemožné. Cesta kolem palisády je velice nebezpečná.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//Myslím, že bude nejlepší jít na západ a zkusit najít odtud lepší cestu.
	}
	else if(C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//Dostaneme se ke skřetí palisádě, pokud půjdeme tudy.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//Přejdeme průsmyk!
	};
	Diego_TooFarComment = TRUE;
};

func void B_Diego_WirSindDa()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//Půjdu chvíli sám...
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//Musím ještě něco udělat, než se vrátím do Khorinisu.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//Díky příteli, uvidíme se ve městě.
	MIS_DiegoTogether = LOG_Success;
	Log_SetTopicStatus(TOPIC_DiegoTogether,LOG_Success);
	B_LogEntry(TOPIC_DiegoTogether,"Přivedl jsem Diega! Zbytek cesty zvládne sám.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	Diego_angekommen = TRUE;
};


instance DIA_Addon_ThiefOW_Angekommen(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Angekommen_Condition;
	information = DIA_Addon_ThiefOW_Angekommen_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if((Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Dobrá, půjdeme.
	B_GivePlayerXP(500);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_Nostalgie(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Nostalgie_Condition;
	information = DIA_Addon_ThiefOW_Nostalgie_Info;
	important = TRUE;
};

func int DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if((Npc_GetDistToWP(self,"WP_INTRO14") < 2000) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Nostalgie_Info()
{
	Snd_Play("LevelUp");
	B_GivePlayerXP(1000);
	NostalgiBonus = TRUE;
	AI_NoticePrint(3000,4098,NAME_Addon_NostalgieBonus);
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Vzpomínáš?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//Když jsme se poprvé setkali?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//Mám pocit jako by se to stalo před stovkami let...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//A mělo by tam být něco dalšího v té oblasti - sakra - nemůžu si vzpomenout.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//Cokoliv...
	B_Diego_WirSindDa();
};

instance DIA_Addon_ThiefOW_PERM(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_Addon_ThiefOW_PERM_Condition;
	information = DIA_Addon_ThiefOW_PERM_Info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int DIA_Addon_ThiefOW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Perm) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//Vše v pořádku?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//Neškodil by nějaký léčivý lektvar. Nemáš nejaký?
	}
	else if((DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE) && (Diego_angekommen == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Jen mi řekni, jak nás budeš chtít odvést jinam.
	}
	else if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//V pohodě. Pouze si beru krátkou přestávku.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Dobře.
	};
};

