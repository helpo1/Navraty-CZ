
instance DIA_Addon_BDT_10028_Buddler_EXIT(C_Info)
{
	npc = BDT_10028_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10028_Buddler_EXIT_Condition;
	information = DIA_Addon_10028_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10028_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10028_Buddler_Hi(C_Info)
{
	npc = BDT_10028_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10028_Buddler_Hi_Condition;
	information = DIA_Addon_10028_Buddler_Hi_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Addon_10028_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10028_Buddler_Hi_15_00");	//Jak se vede?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_01");	//Dobře. Nemusim nic dělat protože vše dělají otroci.
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_02");	//A toho zlata co vykutají. (směje)
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_03");	//Zatraceně! Který idiot osvobodil otroky?!
		AI_StopProcessInfos(self);
	};
};

