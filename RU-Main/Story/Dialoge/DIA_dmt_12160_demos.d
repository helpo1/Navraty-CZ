
instance DMT_12160_DEMOS_EXIT(C_Info)
{
	npc = dmt_12160_demos;
	nr = 999;
	condition = dmt_12160_demos_exit_condition;
	information = dmt_12160_demos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12160_demos_exit_condition()
{
	return TRUE;
};

func void dmt_12160_demos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12160_DEMOS_HELLO(C_Info)
{
	npc = dmt_12160_demos;
	condition = dmt_12160_demos_hello_condition;
	information = dmt_12160_demos_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12160_demos_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12160_demos_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12160_Demos_Hello_01");	//Тебе следует обратится к Хранителю Даготу, адепт!
			AI_Output(self,other,"DMT_12160_Demos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12160_Demos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12160_Demos_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12160_Demos_Hello_05");	//Тебе следует обратится к Хранителю Стонносу, адепт!
			AI_Output(self,other,"DMT_12160_Demos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12160_Demos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12160_Demos_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12160_Demos_Hello_09");	//Тебе следует обратится к Хранителю Вакону, адепт!
			AI_Output(self,other,"DMT_12160_Demos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12160_Demos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12160_Demos_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12160_Demos_Hello_13");	//Тебе следует обратится к Хранителю Келиосу, адепт!
			AI_Output(self,other,"DMT_12160_Demos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12160_Demos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12160_Demos_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DMT_12160_Demos_Hello_17");	//Ты уже знаешь, что тебе следует делать.
		AI_Output(self,other,"DMT_12160_Demos_Hello_04");	//Теперь ступай!
		AI_StopProcessInfos(self);
	};
};

