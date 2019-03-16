
instance DIA_Addon_RoastPirate_EXIT(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 999;
	condition = DIA_Addon_RoastPirate_EXIT_Condition;
	information = DIA_Addon_RoastPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int PIR_1364_Grog;

instance DIA_Addon_RoastPirate_GimmeGrog(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 1;
	condition = DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information = DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) == TRUE) && (Npc_WasInState(self,ZS_Roast_Scavenger) == TRUE) && (PIR_1364_Grog == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_GimmeGrog_Info()
{
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//O, od toho ohně jde horko. Mám žízeň.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Hej ty, dáš mi grog?
	Log_CreateTopic(TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RoastGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_RoastGrog,"Pirát u táborového ohně nutně potřebují grog.");
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Ne, nic nemám.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Tady, dej si hlta.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Ne, nic nemám.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Sakra, já snad žízní umřu...
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Tady, dej si hlta.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//Dík.
	B_UseItem(self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry(TOPIC_Addon_RoastGrog,"Zdá se, že grog ho zachránil od smrti žízní.");
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_RoastPirate_SeichtesWasser(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 2;
	condition = DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information = DIA_Addon_RoastPirate_SeichtesWasser_Info;
	description = "Co děláš?";
};


func int DIA_Addon_RoastPirate_SeichtesWasser_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_SeichtesWasser_Info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//Co děláš?
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//Musím nasytit hladové mužstvo.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//To je, proč tu sedím ve dne v noci.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//Namísto toho bych byl mnohem raději na mělčině u pláže a hledal vyplavené zboží.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Minulý týden velká obchodní loď najela na korálový útes.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//A náklad je nyní vyplavován na břeh.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//Doufám, že odsud jednou vypadnu.
};


instance DIA_Addon_RoastPirate_Francis(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 3;
	condition = DIA_Addon_RoastPirate_Francis_Condition;
	information = DIA_Addon_RoastPirate_Francis_Info;
	permanent = FALSE;
	description = "Co mi můžeš říci o Francisovi?";
};


func int DIA_Addon_RoastPirate_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//Co mi můžeš říci o Francisovi?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? Jedná s námi jako by byl náš kapitán, který ale okamžitě ním přestane být, až bude Greg zpátky.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Pak se před námi bude plazit jako rak pod skálou.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//Když se mě ptáš, myslím, že s námi všemi chce vyběhnout. Vsadil bych se, že pracuje jen pro svou vlastní kapsu.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//Tohle ze mě nedostaneš. A dokud to nebude podložené, nechal bych si to pro sebe, být tebou.
};


instance DIA_Addon_RoastPirate_PERM(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 99;
	condition = DIA_Addon_RoastPirate_PERM_Condition;
	information = DIA_Addon_RoastPirate_PERM_Info;
	permanent = TRUE;
	description = "A jinak?";
};


func int DIA_Addon_RoastPirate_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_PERM_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Matt_Job_15_00");	//A jinak?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if((randy == 0) && !Npc_IsDead(Francis))
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//Poslal bych Francise na Gregově místě do močálu.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//Nyní když je Greg zpět, pochybuji, že na nás banditi zaútočí.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//Gregův návrat bude určitě znamenat víc práce, ale aspoň dostaneme dost peněz.
		};
	}
	else if((randy == 0) && !Npc_IsDead(Francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis je velký tlučhuba. Vše se zde rozpadá od doby, kdy se stal vůdcem tábora.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Jen ať banditi zaútočí. Budou nemile překvapeni.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Doufám, že se Greg vrátí. Chtěl bych být zpět na otevřeném moři.
	};
};


instance DIA_Addon_RoastPirate_Anheuern(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 11;
	condition = DIA_Addon_RoastPirate_Anheuern_Condition;
	information = DIA_Addon_RoastPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Měl bys mi pomoct.";
};


func int DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//Měl bys mi pomoct.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//Příkaz od Grega.
	B_Say(self,other,"$ABS_GOOD");
};


instance DIA_Addon_RoastPirate_ComeOn(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 12;
	condition = DIA_Addon_RoastPirate_ComeOn_Condition;
	information = DIA_Addon_RoastPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Pojď.";
};


func int DIA_Addon_RoastPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_RoastPirate_Anheuern))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//Pojď.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_RoastPirate_GoHome(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 13;
	condition = DIA_Addon_RoastPirate_GoHome_Condition;
	information = DIA_Addon_RoastPirate_GoHome_Info;
	permanent = TRUE;
	description = "Už tě víc nepotřebuji.";
};


func int DIA_Addon_RoastPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//Už tě víc nepotřebuji.
	B_Say(self,other,"$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_RoastPirate_TooFar(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 14;
	condition = DIA_Addon_RoastPirate_TooFar_Condition;
	information = DIA_Addon_RoastPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_RoastPirate_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

