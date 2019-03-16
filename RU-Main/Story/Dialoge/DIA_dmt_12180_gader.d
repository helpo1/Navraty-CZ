
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
			AI_Output(self,other,"DMT_12180_Gader_Hello_01");	//Тебе следует обратится к Хранителю Даготу, адепт!
			AI_Output(self,other,"DMT_12180_Gader_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12180_Gader_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_05");	//Тебе следует обратится к Хранителю Стонносу, адепт!
			AI_Output(self,other,"DMT_12180_Gader_Hello_06");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12180_Gader_Hello_07");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_09");	//Тебе следует обратится к Хранителю Вакону, адепт!
			AI_Output(self,other,"DMT_12180_Gader_Hello_10");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12180_Gader_Hello_11");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12180_Gader_Hello_13");	//Тебе следует обратится к Хранителю Келиосу, адепт!
			AI_Output(self,other,"DMT_12180_Gader_Hello_14");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12180_Gader_Hello_15");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DMT_12180_Gader_Hello_17");	//Ты уже знаешь, что тебе следует делать.
		AI_Output(self,other,"DMT_12180_Gader_Hello_04");	//Теперь ступай!
		AI_StopProcessInfos(self);
	};
};

