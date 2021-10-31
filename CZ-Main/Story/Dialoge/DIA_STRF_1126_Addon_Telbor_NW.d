
instance DIA_Addon_Telbor_NW_EXIT(C_Info)
{
	npc = STRF_1126_Addon_Telbor_NW;
	nr = 999;
	condition = DIA_Addon_Telbor_NW_EXIT_Condition;
	information = DIA_Addon_Telbor_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Telbor_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Telbor_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Telbor_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1126_Addon_Telbor_NW;
	nr = 900;
	condition = DIA_Addon_Telbor_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Telbor_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Telbor_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(60,55);
};

func void DIA_Addon_Telbor_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Telbor_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Telbor_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Telbor_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Telbor_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Telbor_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Telbor_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Telbor_NW_PICKPOCKET);
};

func void DIA_Addon_Telbor_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Telbor_NW_PICKPOCKET);
};


instance DIA_Addon_Telbor_NW_Hi(C_Info)
{
	npc = STRF_1126_Addon_Telbor_NW;
	nr = 2;
	condition = DIA_Addon_Telbor_NW_Hi_Condition;
	information = DIA_Addon_Telbor_NW_Hi_Info;
	permanent = FALSE;
	description = "Tvůj navrat na pole, že?";
};


func int DIA_Addon_Telbor_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Telbor_NW_Hi_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Telbor_NW_Hi_15_00");	//Tvůj navrat na pole, že?
	AI_Output(self,other,"DIA_Addon_Telbor_NW_Hi_12_01");	//Hej, můj zachránce! Ale teď se musím dát zase dohromady.

	if(!Npc_IsDead(Egill) && !Npc_IsDead(Ehnim))
	{
		AI_Output(self,other,"DIA_Addon_Telbor_NW_Hi_12_02");	//Hlavně když teď dělám s těmito dvěma šílenými bratry. Chlape, myslíš, že to bylo opravdu tak špatné u těch banditů?
	};
};

