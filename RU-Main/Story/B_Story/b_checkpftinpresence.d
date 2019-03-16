
func void b_checkpftinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKPFT = FALSE;
	}
	else
	{
		CHECKPFT = TRUE;
	};
};


instance DIA_OWPAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OWPAL_4_EXIT_Condition;
	information = DIA_OWPAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OWPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OWPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OWPAL_4_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OWPAL_4_STANDARD_Condition;
	information = DIA_OWPAL_4_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OWPAL_4_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OWPAL_4_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(4);
	if(self.level <= 30)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_03");	//Присутствие Инноса придает нам сил!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_04");	//Будем держаться пока сможем!
		};
		if(randy == 3)
		{
			B_Say(self,other,"$NOTNOW");
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_00");	//Иннос это моя честь, а моя честь, это моя жизнь.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_01");	//Мы будем выжидать здесь столько, сколько нам укажет Иннос.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_02");	//С Помощью Инноса мы отбросим отсюда этих ужасных существ.
		};
		if(randy == 3)
		{
			B_Say(self,other,"$NOTNOW");
		};
	};
	b_checkpftinpresence(PALADINFORT_ZEN);
	if((CHECKPFT == TRUE) && (MIS_RAYNEHELP == LOG_Running) && (self.aivar[91] == FALSE))
	{
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_OWPAL_4_STANDARD_RAYNE(C_Info)
{
	nr = 2;
	condition = dia_owpal_4_standard_rayne_condition;
	information = dia_owpal_4_standard_rayne_info;
	permanent = TRUE;
	description = "Паладину Рэйну нужна помощь на складе.";
};


func int dia_owpal_4_standard_rayne_condition()
{
	b_checkpftinpresence(PALADINFORT_ZEN);
	if((CHECKPFT == TRUE) && (self.aivar[91] == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_owpal_4_standard_rayne_info()
{
	var int randy;
	randy = Hlp_Random(4);
	AI_Output(other,self,"DIA_OWPAL_4_STANDARD_RAYNE_01_01");	//Паладину Рэйну нужна помощь на складе.
	AI_Output(other,self,"DIA_OWPAL_4_STANDARD_RAYNE_01_02");	//Ты можешь помочь ему?
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_03");	//Извини, приятель - но у меня совершенно нет на это времени!
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_04");	//Попробуй поговорить с другими паладинами, может кто-то и согласится помочь ему.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_05");	//Нет, парень - такая работенка не для меня!
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_06");	//Так что, поищи кого-нибудь другого.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_07");	//Мне что, заняться больше нечем, как только копаться в этих ящиках!
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_08");	//Нет уж, пусть этим занимается кто-то другой.
	};
	if(randy == 3)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_09");	//Не думаю. что я смогу помочь ему - я мало в этом что понимаю.
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_10");	//Думаю, тебе стоит спросить у других паладинов об этом.
	};
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Кажется, что я просто попусту трачу свое время - никто из паладинов не хочет помогать Рэйну. Может мне стоит предпринять более координальные действия...");
	};
	self.aivar[91] = TRUE;
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OWPAL_4(var C_Npc slf)
{
	dia_owpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_owpal_4_standard.npc = Hlp_GetInstanceID(slf);
	dia_owpal_4_standard_rayne.npc = Hlp_GetInstanceID(slf);
};

