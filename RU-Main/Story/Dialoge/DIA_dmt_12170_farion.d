
instance DMT_12170_FARION_EXIT(C_Info)
{
	npc = dmt_12170_farion;
	nr = 999;
	condition = dmt_12170_farion_exit_condition;
	information = dmt_12170_farion_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12170_farion_exit_condition()
{
	return TRUE;
};

func void dmt_12170_farion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12170_FARION_HELLO(C_Info)
{
	npc = dmt_12170_farion;
	condition = dmt_12170_farion_hello_condition;
	information = dmt_12170_farion_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12170_farion_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12170_farion_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12170_Farion_Hello_01");	//Тебе следует обратится к Хранителю Даготу, адепт!
			AI_Output(self,other,"DMT_12170_Farion_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12170_Farion_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12170_Farion_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12170_Farion_Hello_05");	//Тебе следует обратится к Хранителю Стонносу, адепт!
			AI_Output(self,other,"DMT_12170_Farion_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12170_Farion_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12170_Farion_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12170_Farion_Hello_09");	//Тебе следует обратится к Хранителю Вакону, адепт!
			AI_Output(self,other,"DMT_12170_Farion_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12170_Farion_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12170_Farion_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12170_Farion_Hello_13");	//Тебе следует обратится к Хранителю Келиосу, адепт!
			AI_Output(self,other,"DMT_12170_Farion_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12170_Farion_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12170_Farion_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DMT_12170_Farion_Hello_17");	//Ты уже знаешь, что тебе следует делать.
		AI_Output(self,other,"DMT_12170_Farion_Hello_04");	//Теперь ступай!
		AI_StopProcessInfos(self);
	};
};

