
instance DIA_PAL_262_EXIT(C_Info)
{
	npc = PAL_262_Wache;
	nr = 999;
	condition = DIA_PAL_262_EXIT_Condition;
	information = DIA_PAL_262_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_262_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_Info)
{
	npc = PAL_262_Wache;
	nr = 2;
	condition = DIA_PAL_262_GREET_Condition;
	information = DIA_PAL_262_GREET_Info;
	important = TRUE;
};


func int DIA_PAL_262_GREET_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_GREET_Info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Stůj, kdo jsi?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Spíše by ses měl ptát, jak jsem se sem dostal. Prošel jsem průsmykem.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//Ještě mě tu chceš držet, nebo můžu jít?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//Promiň, to jsem nemohl vědět. Samozřejmě, že můžeš dovnitř.
	AI_StopProcessInfos(self);
};


instance DIA_Wache_PERM(C_Info)
{
	npc = PAL_262_Wache;
	nr = 3;
	condition = DIA_Wache_PERM_Condition;
	information = DIA_Wache_PERM_Info;
	permanent = TRUE;
	description = "Kdo zde velí?";
};


func int DIA_Wache_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void DIA_Wache_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_PERM_15_00");	//Kdo zde velí?
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_01");	//Náš generál lord Garond a jeho pobočníci, paladinové Oric a Parcival.
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_02");	//Můžeš je najít v trůním sále.
};

