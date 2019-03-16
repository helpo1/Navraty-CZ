
instance DMT_12180_GADER_EXIT(C_Info)
{
	npc = dmt_12180_gader;
	nr = 999;
	condition = dmt_12180_gader_exit_condition;
	information = dmt_12180_gader_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12180_gader_exit_condition()
{
	return TRUE;
};

func void dmt_12180_gader_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12180_GADER_HELLO(C_Info)
{
	npc = dmt_12180_gader;
	condition = dmt_12180_gader_hello_condition;
	information = dmt_12180_gader_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12180_gader_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12180_gader_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_01");	//Jdi za Strážcem Dagothem!
			AI_Output(self,other,"DMT_12180_Gader_Hello_02");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12180_Gader_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_05");	//Jdi za Strážcem Stonnosem!
			AI_Output(self,other,"DMT_12180_Gader_Hello_06");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12180_Gader_Hello_07");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_09");	//Jdi za Strážcem Wakonem!
			AI_Output(self,other,"DMT_12180_Gader_Hello_10");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12180_Gader_Hello_11");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_13");	//Jdi za Strážcem Keliosem!
			AI_Output(self,other,"DMT_12180_Gader_Hello_14");	//Nyní bude tvým instruktorem.
			AI_Output(self,other,"DMT_12180_Gader_Hello_15");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DMT_12180_Gader_Hello_17");	//Víš co máš dělat.
		AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Jdi!
		AI_StopProcessInfos(self);
	};
};

