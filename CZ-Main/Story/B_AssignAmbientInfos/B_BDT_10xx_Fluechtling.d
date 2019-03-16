
func void B_DIA_BDT_10XX_Fluechtling_Stimme7()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00");	//Zapomeň. Nevracím se zpátky do basy.
};

func void B_DIA_BDT_10XX_Fluechtling_Stimme6()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00");	//Nepřišel si pro nás, abys nás odvedl zpět do vezení, že ne?
};


instance DIA_BDT_1031_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1031_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1031_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1031_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1031_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_Fluechtling_Tip1(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1031_Fluechtling_Tip1_Condition;
	information = DIA_BDT_1031_Fluechtling_Tip1_Info;
	important = TRUE;
};


func int DIA_BDT_1031_Fluechtling_Tip1_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Info()
{
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");	//Měl by ses ode me držet raději dál, jestli nechceš zkončit ve vězení.
	B_GivePlayerXP(XP_AmbientKap3);
	if(SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Nejsem tu proto, abych tě napráskal.",DIA_BDT_1031_Fluechtling_Tip1_frei);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Přišel jsem tě zatknout.",DIA_BDT_1031_Fluechtling_Tip1_Knast);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Kde je tvůj vůdce Morgahard?",DIA_BDT_1031_Fluechtling_Tip1_Morgahard);
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");	//Kde je tvůj vůdce Morgahard?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");	//Rozdělili jsme se, aby nás nechytli tak rychle. Nemám ponětí, kde jsou ostatní.
	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"To je škoda. To potom budu muset uvědomit soudce.",DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00");	//To je škoda. To potom budu muset uvědomit soudce.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01");	//Dobře, dobře. Předpokládám, že někteří z nás uprchli do hostince. Ale ode me jsi to neslyšel, OK?
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");	//Přišel jsem tě zatknout.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");	//Jen přes mou mrtvolu.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");	//Nejsem tu proto, abych tě napráskal.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");	//Jestli tě poslal soudce, tak mu od nás vyřiď, že se může jít vycpat.
	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Tak co jsi provedl?",DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");	//Tak co jsi provedl?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");	//Do toho ti nic není.
};


instance DIA_BDT_1031_Fluechtling_PERM(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 3;
	condition = DIA_BDT_1031_Fluechtling_PERM_Condition;
	information = DIA_BDT_1031_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1031_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1032_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1032_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1032_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1032_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1032_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_Fluechtling_PERM(C_Info)
{
	npc = BDT_1032_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1032_Fluechtling_PERM_Condition;
	information = DIA_BDT_1032_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1032_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1032_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1033_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1033_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1033_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1033_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_Fluechtling_Tip2(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1033_Fluechtling_Tip2_Condition;
	information = DIA_BDT_1033_Fluechtling_Tip2_Info;
	important = TRUE;
};


func int DIA_BDT_1033_Fluechtling_Tip2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Info()
{
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");	//(vystrašený) Co ode mě chceš?
	B_GivePlayerXP(XP_AmbientKap3);
	if(SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Klídek. Jen si chci s tebou promluvit.",DIA_BDT_1033_Fluechtling_Tip2_frei);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Poslal mě soudce, abych tě přivedl zpět.",DIA_BDT_1033_Fluechtling_Tip2_Knast);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Kde je tvůj vůdce Morgahard?",DIA_BDT_1033_Fluechtling_Tip2_Morgahard);
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");	//Kde je tvůj vůdce Morgahard?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");	//(vystrašený) Nechci žadné potíže. Běž za statkářem. Chtěl se někde schovat s žoldákama. A teď už mě nech na pokoji.
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");	//Poslal mě soudce, abych te přivedl zpět.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");	//(křičí) NE!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");	//Klídek. Jen si chci s tebou promluvit.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");	//Ale já s tebou mluvit nechci. Zmizni chlape.
	Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Máš pěkne nahnáno v kalhotách, že?",DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");	//Máš pěkne nahnáno v kalhotách, že?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");	//Mluv si dál. Ale na tebe nečekají galeje, když tě chytí.
};


instance DIA_BDT_1033_Fluechtling_PERM(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 3;
	condition = DIA_BDT_1033_Fluechtling_PERM_Condition;
	information = DIA_BDT_1033_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1033_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1034_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1034_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1034_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1034_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1034_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_Fluechtling_PERM(C_Info)
{
	npc = BDT_1034_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1034_Fluechtling_PERM_Condition;
	information = DIA_BDT_1034_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1034_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1034_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1035_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1035_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1035_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1035_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1035_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_Fluechtling_PERM(C_Info)
{
	npc = BDT_1035_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1035_Fluechtling_PERM_Condition;
	information = DIA_BDT_1035_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1035_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1035_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};

