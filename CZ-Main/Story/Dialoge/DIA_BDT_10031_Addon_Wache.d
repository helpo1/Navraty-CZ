
instance DIA_Addon_BDT_10031_Wache_EXIT(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10031_Wache_EXIT_Condition;
	information = DIA_Addon_10031_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10031_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10031_Wache_Scatty(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10031_Wache_Scatty_Condition;
	information = DIA_Addon_10031_Wache_Scatty_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10031_Wache_Scatty_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Scatty_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Chceš jít kopat? Nezapomeň si koupit zásoby u Scattyho.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//Co budu potřebovat?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//No určitě krumpáč. A nějaké jídlo neuškodí.
	AI_StopProcessInfos(self);
};


var int Wache_Joker;

instance DIA_Addon_BDT_10031_Wache_Hi(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10031_Wache_Hi_Condition;
	information = DIA_Addon_10031_Wache_Hi_Info;
	permanent = TRUE;
	description = "V pořádku?";
};


func int DIA_Addon_10031_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//V pořádku?
	if((Sklaven_Flucht == TRUE) && (Wache_Joker == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Jo kámo. Otroci jsou ve velkým spěchu.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//Když slyšeli, že jsou volní utekli jako králici.
		Wache_Joker = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Nedělají žádné problémy takže všechno bude v pořádku.
};

