
instance DMT_12140_TEGON_EXIT(C_Info)
{
	npc = dmt_12140_tegon;
	nr = 999;
	condition = dmt_12140_tegon_exit_condition;
	information = dmt_12140_tegon_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12140_tegon_exit_condition()
{
	return TRUE;
};

func void dmt_12140_tegon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12140_TEGON_HELLO(C_Info)
{
	npc = dmt_12140_tegon;
	condition = dmt_12140_tegon_hello_condition;
	information = dmt_12140_tegon_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12140_tegon_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12140_tegon_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12140_Tegon_Hello_01");	//Jdi za Strážcem Dagothem!
			AI_Output(self,other,"DMT_12140_Tegon_Hello_02");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12140_Tegon_Hello_05");	//Jdi za Strážcem Stonnosem!
			AI_Output(self,other,"DMT_12140_Tegon_Hello_02");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12140_Tegon_Hello_09");	//Jdi za Strážcem Wakonem!
			AI_Output(self,other,"DMT_12140_Tegon_Hello_02");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12140_Tegon_Hello_13");	//Jdi za Strážcem Keliosem!
			AI_Output(self,other,"DMT_12140_Tegon_Hello_02");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12140_Tegon_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DMT_12140_Tegon_Hello_17");	//Víš co máš dělat.
		AI_Output(self,other,"DMT_12140_Tegon_Hello_18");	//Jdi!
		AI_StopProcessInfos(self);
	};
};

