
instance DIA_BDT_1088_Addon_Torwache_EXIT(C_Info)
{
	npc = BDT_1088_Addon_Torwache;
	nr = 999;
	condition = DIA_BDT_1088_Addon_Torwache_EXIT_Condition;
	information = DIA_BDT_1088_Addon_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1088_Addon_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1088_Addon_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1088_Checkpoint = "BL_UP_CHECK";

instance DIA_BDT_1088_Addon_Torwache_FirstWarn(C_Info)
{
	npc = BDT_1088_Addon_Torwache;
	nr = 1;
	condition = DIA_BDT_1088_Addon_Torwache_FirstWarn_Condition;
	information = DIA_BDT_1088_Addon_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1088_Addon_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,BDT_1088_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BDT_1088_Addon_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_00");	//STÁT!
	if(MIS_Send_Buddler == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1088_Torwache_FirstWarn_15_01");	//Nech mě projít, strážče.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_06_02");	//Vše v pořádku, máš povolení.
		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else if((MIS_Send_Buddler != LOG_Running) && (MIS_Send_Buddler != LOG_SUCCESS))
	{
		if(Torwache_Greetings == 0)
		{
			AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_03");	//Nemůžeš sem vstoupit bez červeného kamene.
			Torwache_Greetings = 1;
		}
		else if(Torwache_Greetings == 1)
		{
			AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_04");	//Copak to nechápeš? (výhružně) ZMIZ MI Z OČÍ!
			Torwache_Greetings = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_05");	//(výhružně) ZMIZ MI Z OČÍ!
		};
	}
	else if(MIS_Send_Buddler == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_06");	//Hej, nemůžeš projít pokud to nepovolí Thorus.
	};
	AI_StopProcessInfos(self);
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1088_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_BDT_1088_Addon_Torwache_SecondWarn(C_Info)
{
	npc = BDT_1088_Addon_Torwache;
	nr = 2;
	condition = DIA_BDT_1088_Addon_Torwache_SecondWarn_Condition;
	information = DIA_BDT_1088_Addon_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1088_Addon_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1088_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BDT_1088_Addon_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_SecondWarn_06_00");	//Dobrá, v klidu. To je tvá poslední šance. Otoč se a běž pryč nebo zemřeš...
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1088_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1088_Addon_Torwache_Attack(C_Info)
{
	npc = BDT_1088_Addon_Torwache;
	nr = 3;
	condition = DIA_BDT_1088_Addon_Torwache_Attack_Condition;
	information = DIA_BDT_1088_Addon_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1088_Addon_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1088_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BDT_1088_Addon_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_Attack_06_00");	//(vzdychá) Zdá se mi, že si ze mě děláš prdel. Dobře, já ti nakopu...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

