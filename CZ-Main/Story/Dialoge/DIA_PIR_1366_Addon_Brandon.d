
instance DIA_Addon_Brandon_EXIT(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 999;
	condition = DIA_Addon_Brandon_EXIT_Condition;
	information = DIA_Addon_Brandon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Brandon_Hello(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 1;
	condition = DIA_Addon_Brandon_Hello_Condition;
	information = DIA_Addon_Brandon_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Brandon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Podívejme, novic!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//A k tomu suchozemská krysa!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//Nejsi trochu suchý na piráta?
};


instance DIA_Addon_Brandon_AnyNews(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 99;
	condition = DIA_Addon_Brandon_AnyNews_Condition;
	information = DIA_Addon_Brandon_AnyNews_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//Něco nového?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Vskutku. Jsem raněn. Mohl bys mi dát léčivý lektvar?
		}
		else if(C_AllCanyonRazorDead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//Co pak? Půjdeme dále nebo co?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//Můžeš se na něco zeptat! Myslím že tu nejsou jednotlivé břitvy!
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg) && (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Ne, ale doufám že když je Greg zpátky, že se to rychle změní.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//Počkej chvíli...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//(směje se)Nic se nezměnilo, vše je jako předtím.
	};
};


instance DIA_Addon_Brandon_WannaLearn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_WannaLearn_Condition;
	information = DIA_Addon_Brandon_WannaLearn_Info;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Tebe? Můžu tě naučit jak být silnější a obratnější.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Nicméně proč bych to měl dělat?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Protože ti koupím drink?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//(šklebí se) To nezní špatné, tak něco dones.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Ale nenos mi nějaký levný dryák!
	MIS_Brandon_BringHering = LOG_Running;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	Log_CreateTopic(TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BrandonBooze,LOG_Running);
	Log_AddEntry(TOPIC_Addon_BrandonBooze,"Musím koupit Bradonovi drink. Pouze pak mě bude učit.");
};


instance DIA_Addon_Brandon_HoleGrog(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_HoleGrog_Condition;
	information = DIA_Addon_Brandon_HoleGrog_Info;
	description = "Mám pro tebe grog.";
};


func int DIA_Addon_Brandon_HoleGrog_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//Mám pro tebe grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Chceš mě otrávit?!
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Zkoušíš mě otrávit? Víš vůbec, co je uvnitř?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Starý Samuel má dobrý chlast, dones mi něco od něj!

	if(Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Myslíš 'Rychlého sleďe'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Jo, to toho myslím!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//Už máš Samuelův speciál?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Ne, ještě ne.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//Stůj, měl si to pouze zkusit!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Miluji tento Ďábelský nápoj!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"Grog není pro Brandona dost dobrý. Chce 'Rychlého sleďe'. Pouze Samuel má tento chlast.");
};


instance DIA_Addon_Brandon_SchnellerHering(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_SchnellerHering_Condition;
	information = DIA_Addon_Brandon_SchnellerHering_Info;
	description = "Zkus to!'Rychlý sleď'";
};


func int DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn) && (Npc_HasItems(other,ItFo_Addon_SchnellerHering) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Zkus to.
	B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,1);
	B_UseItem(self,ItFo_Addon_SchnellerHering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Á! Jde to dolů jak tekutý oheň!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"Dal jsem Bradonovi drink. Nyní mě bude rád učit.");
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Brandon_Merke_Str;
var int Brandon_Merke_Dex;

instance DIA_Addon_Brandon_TeachPlayer(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 777;
	condition = DIA_Addon_Brandon_TeachPlayer_Condition;
	information = DIA_Addon_Brandon_TeachPlayer_Info;
	permanent = TRUE;
	description = "Nauč mě něco!";
};


func int DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Nauč mě něco!
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//Předpokládal jsem, že mi přineseš něco slušného, chlapče.
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Back()
{
	if(other.attribute[ATR_STRENGTH] > Brandon_Merke_Str)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Dobrá práce chlape, zase jsi o trochu silnější.
	};
	if(other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//Čím jsi obratnější, tím lépe zasáhneš cíl.
	};
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};


instance DIA_Addon_Brandon_Anheuern(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_Anheuern_Condition;
	information = DIA_Addon_Brandon_Anheuern_Info;
	permanent = FALSE;
	description = "Měl bys mi pomoct.";
};


func int DIA_Addon_Brandon_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//Měl bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//To jsou opravdu velké novinky. Kdo to říkal?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Greg, měli bychom zabít břitvy v kaňonu.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//(zasměje) Tak máme tady konečně boj!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Pro mě za mě, čím dřív zabijeme ty bestie, tím dřív se vrátíme.
};


instance DIA_Addon_Brandon_ComeOn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_ComeOn_Condition;
	information = DIA_Addon_Brandon_ComeOn_Info;
	permanent = TRUE;
	description = "Pojď se mnou.";
};


func int DIA_Addon_Brandon_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Pojď se mnou.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Pojďme trochu zpět.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Jako obvykle!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Brandon_GoHome(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_GoHome_Condition;
	information = DIA_Addon_Brandon_GoHome_Info;
	permanent = TRUE;
	description = "Už tě více nepotřebuji.";
};


func int DIA_Addon_Brandon_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//Už tě více nepotřebuji.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//V pořádku, bez problému.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Možná se ještě jednou spolu napijem.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Brandon_TooFar(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 14;
	condition = DIA_Addon_Brandon_TooFar_Condition;
	information = DIA_Addon_Brandon_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Brandon_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Brandon_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Chceš celý ostrov liduprázdný?!
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//Jdeme zpátky do tábora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//Jdu zpět do tábora.
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

