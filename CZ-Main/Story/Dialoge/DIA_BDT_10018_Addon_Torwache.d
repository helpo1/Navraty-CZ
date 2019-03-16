
instance DIA_Addon_BDT_10018_Torwache_EXIT(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 999;
	condition = DIA_Addon_BDT_10018_Torwache_EXIT_Condition;
	information = DIA_Addon_BDT_10018_Torwache_EXIT_Info;
	permanent = TRUE;
	description = "Ještě si promluvíme.";
};

func int DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00");	//Ještě si promluvíme.

	if(BDT_100018_Einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01");	//Víš co ti řeknu...
		BDT_100018_Einmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02");	//Jdi do pr...!
	};

	AI_StopProcessInfos(self);
};


const string BDT_10018_Checkpoint = "BL_RAVEN_03";

instance DIA_Addon_BDT_10018_Torwache_FirstWarn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 1;
	condition = DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition;
	information = DIA_Addon_BDT_10018_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BDT_10018_Torwache_FirstWarn_Info()
{
	if(BDT_100018_Tells == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00");	//Hej, zpomal, tudy se tam nedostaneš, tak co kdybys vypadnul!
		AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01");	//Běž mě z cesty - musím mluvit s Ravenem.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02");	//Nikdo neprojde - přímý rozkaz Ravena!
		BDT_100018_Tells = TRUE;
		Log_CreateTopic(Topic_Addon_Tempel,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Tempel,LOG_Running);
		B_LogEntry(Topic_Addon_Tempel,"Stráž u vstupu do chrámu mě nepustí. Musím najít způsob jak se tam dostat.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03");	//Zase ty? Začínáš mě vytáčet!
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Addon_BDT_10018_Torwache_SecondWarn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition;
	information = DIA_Addon_BDT_10018_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(other,BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BDT_10018_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00");	//Další tvůj krok bude tvůj poslední!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10018_Torwache_Attack(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 3;
	condition = DIA_Addon_BDT_10018_Torwache_Attack_Condition;
	information = DIA_Addon_BDT_10018_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(other,BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BDT_10018_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00");	//Za Ravena!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Addon_BDT_10018_Torwache_Hi(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_10018_Torwache_Hi_Condition;
	information = DIA_Addon_10018_Torwache_Hi_Info;
	permanent = FALSE;
	description = "Je to zatraceně důležité, musím se k němu dostat.";
};


func int DIA_Addon_10018_Torwache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10018_Torwache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Hi_15_00");	//Je to zatraceně důležité, musím se k němu dostat.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Hi_04_01");	//Ne. To není. Pouze Bloodwyn za ním může jít.
	B_LogEntry(Topic_Addon_Tempel,"Do chrámu je dovoleno vstoupit pouze Bloodwynovi. Možná bych se tam dostat přes něj.");
};


instance DIA_Addon_BDT_10018_Torwache_Bloodwyn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_10018_Torwache_Bloodwyn_Condition;
	information = DIA_Addon_10018_Torwache_Bloodwyn_Info;
	permanent = FALSE;
	description = "Bloodwyn? Není mrtvý?";
};


func int DIA_Addon_10018_Torwache_Bloodwyn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10018_Torwache_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_10018_Torwache_Bloodwyn_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");	//Bloodwyn? Není mrtvý?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");	//On je silnější než kdy jindy. A když zjistí, že někdo dělá problémy, tak z něho nadělá sekanou.
};


instance DIA_Addon_BDT_10018_Torwache_Bribe(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 9;
	condition = DIA_Addon_10018_Torwache_Bribe_Condition;
	information = DIA_Addon_10018_Torwache_Bribe_Info;
	permanent = FALSE;
	description = "Dám ti 1000 zlatých, když mě pustíš dovnitř.";
};


func int DIA_Addon_10018_Torwache_Bribe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10018_Torwache_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_10018_Torwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bribe_15_00");	//Dám ti 1000 zlatých, když mě pustíš dovnitř.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bribe_04_01");	//Ztrácíš čas kámo.
};


instance DIA_Addon_BDT_10018_Torwache_Drin(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 90;
	condition = DIA_Addon_10018_Torwache_Drin_Condition;
	information = DIA_Addon_10018_Torwache_Drin_Info;
	permanent = FALSE;
	description = "Je Bloodwyn vevnitř? Tak ho zavolej.";
};


func int DIA_Addon_10018_Torwache_Drin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10018_Torwache_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_10018_Torwache_Drin_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Drin_15_00");	//Je Bloodwyn vevnitř? Tak ho zavolej.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_01");	//Ha! Opravdu si myslíš, že to udělám?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_02");	//Možná, že v táboře nyní něco znamenáš. Ale tvoje moc končí právě zde. Chápeš?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_03");	//Takže jdi do práce do dolu, nebo se zabav něčim jiným - ale nezacláněj tady!
	MIS_BloodwynRaus = LOG_Running;
	B_LogEntry(Topic_Addon_Tempel,"Bloodwyn se nachází v chrámu. Ale tam se nedostanu. Možná bych měl navštívit důl.");
};


instance DIA_Addon_BDT_10018_Torwache_kopf(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 90;
	condition = DIA_Addon_10018_Torwache_kopf_Condition;
	information = DIA_Addon_10018_Torwache_kopf_Info;
	permanent = FALSE;
	description = "(ukázat Bloodwynovu hlavu)";
};

func int DIA_Addon_10018_Torwache_kopf_Condition()
{
	if(Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_10018_Torwache_kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_kopf_15_00");	//Tady! Ještě mě chceš zastavit?!
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_01");	//Co to je? Je to Bloodwyn?... (zvrací) Co to...
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_02");	//N-Ne... ano, jdi kam chceš.
	MIS_BloodwynRaus = LOG_SUCCESS;
	self.aivar[AIV_PASSGATE] = TRUE;
	self.aivar[93] = FALSE;
	AI_StopProcessInfos(self);
	Wld_SendTrigger("EVT_ADDON_TEMPLEINDOOR");
};