
instance DIA_PAL_263_EXIT(C_Info)
{
	npc = PAL_263_Wache;
	nr = 999;
	condition = DIA_PAL_263_EXIT_Condition;
	information = DIA_PAL_263_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_263_PERM(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_Condition;
	information = DIA_PAL_263_PERM_Info;
	permanent = TRUE;
	description = "Podej hlášení vojáku!";
};


func int DIA_PAL_263_PERM_Condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//Podej hlášení vojáku!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//Ano pane! Držíme pozice a v poslední době nebyly žádné výrazné ztráty! Skřeti se zatím zdají v klidu pane!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//Ale poslední dračí útok kompletně zničil vnější opevnění. Musíme udržet tyto zdi pane!
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//Dobrá, drž se.
};


instance DIA_PAL_263_PERM_OTH(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_OTH_Condition;
	information = DIA_PAL_263_PERM_OTH_Info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int DIA_PAL_263_PERM_OTH_Condition()
{
	if((hero.guild != GIL_MIL) || (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_OTH_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//Jaká je situace? 
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//Máme ji pod kontrolou. Žádné obavy, my si poradíme.
};
