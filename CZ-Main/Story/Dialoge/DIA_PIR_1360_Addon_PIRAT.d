
instance DIA_Addon_HammerPirate_EXIT(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_HammerPirate_EXIT_Condition;
	information = DIA_Addon_HammerPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Hello(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_HammerPirate_Hello_Condition;
	information = DIA_Addon_HammerPirate_Hello_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//Všechno v pořádku?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_TowerBanditsDead() == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//Dostali jsme je! Ti bastardi byli bez šance!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//Ok, pojďme to skoncovat!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//Ne! Nemám rád rvačky!
	};
};


instance DIA_Addon_HammerPirate_Anheuern(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_HammerPirate_Anheuern_Condition;
	information = DIA_Addon_HammerPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Měl bys mi pomoci.";
};


func int DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_HammerPirate_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//Nic neříkej! Chtěl jsi, abych s tebou bojoval proti těm banditům!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//Dostals je.
	if(!Npc_IsDead(SawPirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//Proč se nezeptáš těch týpků na pile?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//Já... nechci žádné problémy...
};


instance DIA_Addon_HammerPirate_ComeOn(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_HammerPirate_ComeOn_Condition;
	information = DIA_Addon_HammerPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Pojď se mnou.";
};


func int DIA_Addon_HammerPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() == FALSE) && Npc_KnowsInfo(other,DIA_Addon_HammerPirate_Anheuern))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_HammerPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//Pojď se mnou.
	if(SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//Henry potřebuje jednoho z nás TADY...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//Vraťme se trochu blíž k táboru.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//(vzdychá) No jo...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_HammerPirate_GoHome(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_HammerPirate_GoHome_Condition;
	information = DIA_Addon_HammerPirate_GoHome_Info;
	permanent = TRUE;
	description = "Už tě nepotřebuju.";
};


func int DIA_Addon_HammerPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_HammerPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//Už tě nepotřebuju.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//Jak chceš...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_HammerPirate_TooFar(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_TooFar_Condition;
	information = DIA_Addon_HammerPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_HammerPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//Jestli tam chceš jít, nechtěj, abych tě musel zastavit...
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//Radši se vrátím.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Success(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_Success_Condition;
	information = DIA_Addon_HammerPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_HammerPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//Víš co, přemýšlel jsem o tom. Máš vlastně pravdu!
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//Jdu zase do tábora. Uvidíme se!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

