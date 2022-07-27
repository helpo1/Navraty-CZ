
instance DIA_Addon_SawPirate_EXIT(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_SawPirate_EXIT_Condition;
	information = DIA_Addon_SawPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_SawPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Hello(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_SawPirate_Hello_Condition;
	information = DIA_Addon_SawPirate_Hello_Info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//Přestaň kecat!
};


instance DIA_Addon_SawPirate_Anheuern(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_SawPirate_Anheuern_Condition;
	information = DIA_Addon_SawPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Jsi jedním z Henryho lidí?";
};


func int DIA_Addon_SawPirate_Anheuern_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_SawPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Jsi jedním z Henryho lidí?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Ne. Já jenom řežu tohle dřevo pro zábavu, víš? Opravdu.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Co se děje? Henry řekl, co máš dělat?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Ano. Potřebuji se zbavit několika banditů.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//Ne, ne, ne! NEDÍVEJ se na mě tak! Nechci s tím mít nic společného.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Raději mě nech řezat, ano?
};


var int SawPirate_ComeOn_Once;

instance DIA_Addon_SawPirate_ComeOn(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_SawPirate_ComeOn_Condition;
	information = DIA_Addon_SawPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Pojď dál.";
};


func int DIA_Addon_SawPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() == FALSE) && Npc_KnowsInfo(other,DIA_Addon_SawPirate_Anheuern))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_SawPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Pojď dál.
	if(HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Proč? Už máš pár lidí poblíž...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Nejdříve pojďme trochu zpět k táboru...
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(HammerPirate) && (SawPirate_ComeOn_Once == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//(pro sebe) Proč se nezeptal ostatních...
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//(povzdech) Ach jo...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_SawPirate_GoHome(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_SawPirate_GoHome_Condition;
	information = DIA_Addon_SawPirate_GoHome_Info;
	permanent = TRUE;
	description = "Už tě déle nepotřebuji.";
};


func int DIA_Addon_SawPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_SawPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//Už tě déle nepotřebuji.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//V tom případě se vrátím do práce.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_SawPirate_TooFar(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_TooFar_Condition;
	information = DIA_Addon_SawPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_SawPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Jsme moc daleko od tábora.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//To se mi nelíbí. Vracím se.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Success(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_Success_Condition;
	information = DIA_Addon_SawPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_SawPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//Víš co, myslím, že jsi kretén!
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Vrátím se do tábora. Doufejme, že se už nikdy neuvidíme!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

