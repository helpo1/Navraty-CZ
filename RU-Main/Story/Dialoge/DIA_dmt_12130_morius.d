
instance DMT_12130_MORIUS_EXIT(C_Info)
{
	npc = dmt_12130_morius;
	nr = 999;
	condition = dmt_12130_morius_exit_condition;
	information = dmt_12130_morius_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12130_morius_exit_condition()
{
	return TRUE;
};

func void dmt_12130_morius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12130_MORIUS_HELLO(C_Info)
{
	npc = dmt_12130_morius;
	condition = dmt_12130_morius_hello_condition;
	information = dmt_12130_morius_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12130_morius_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12130_morius_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12130_Morius_Hello_01");	//Тебе следует обратится к Хранителю Даготу, адепт!
			AI_Output(self,other,"DMT_12130_Morius_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12130_Morius_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12130_Morius_Hello_05");	//Тебе следует обратится к Хранителю Стонносу, адепт!
			AI_Output(self,other,"DMT_12130_Morius_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12130_Morius_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12130_Morius_Hello_09");	//Тебе следует обратится к Хранителю Вакону, адепт!
			AI_Output(self,other,"DMT_12130_Morius_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12130_Morius_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12130_Morius_Hello_13");	//Тебе следует обратится к Хранителю Келиосу, адепт!
			AI_Output(self,other,"DMT_12130_Morius_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12130_Morius_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DMT_12130_Morius_Hello_17");	//Ты уже знаешь, что тебе следует делать. Ступай.
		AI_StopProcessInfos(self);
	};
};

