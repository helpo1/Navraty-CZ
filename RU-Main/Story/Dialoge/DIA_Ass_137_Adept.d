instance DIA_Ass_137_Adept_EXIT(C_Info)
{
	npc = Ass_137_Adept;
	nr = 999;
	condition = DIA_Ass_137_Adept_exit_condition;
	information = DIA_Ass_137_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_137_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_137_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_137_Adept_WithSlave(C_Info)
{
	npc = Ass_137_Adept;
	nr = 2;
	condition = DIA_Ass_137_Adept_WithSlave_Condition;
	information = DIA_Ass_137_Adept_WithSlave_Info;
	permanent = FALSE;
	description = "Мне нужно допросить рабов.";
};

func int DIA_Ass_137_Adept_WithSlave_Condition()
{
	if((MIS_RebelSlave == LOG_Running) && (OsairLetsPrision == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_137_Adept_WithSlave_Info()
{
	AI_Output(other,self,"DIA_Ass_137_Adept_WithSlave_01_01");	//Мне нужно допросить рабов. Дай мне ключ.
	AI_Output(self,other,"DIA_Ass_137_Adept_WithSlave_01_02");	//И ты думаешь, что я сейчас просто так тебе возьму его и отдам?
	AI_Output(other,self,"DIA_Ass_137_Adept_WithSlave_01_03");	//А куда ты денешься? Осаир лично разрешил мне пройти к рабам.
	AI_Output(self,other,"DIA_Ass_137_Adept_WithSlave_01_04");	//А, ну раз так... Тогда вот, держи.
	B_GiveInvItems(self,other,ItKe_Masiaf_Prision,1);
	AI_Output(self,other,"DIA_Ass_137_Adept_WithSlave_01_05");	//Только смотри, не колоти уж больно сильно этих ублюдков. А то Осаир будет не в восторге.
	OsairLetsPrision = 2;
	MasGiveKeyPri = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_137_Adept_STANDARD(C_Info)
{
	npc = Ass_137_Adept;
	nr = 2;
	condition = DIA_Ass_137_Adept_STANDARD_Condition;
	information = DIA_Ass_137_Adept_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Ass_137_Adept_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((OsairLetsPrision == FALSE) || (OsairLetsPrision == 2)))
	{
		return TRUE;
	};
};

func void DIA_Ass_137_Adept_STANDARD_Info()
{
	var int randy;

	randy = Hlp_Random(4);

	if((PlayerIsAssNow == FALSE) && (OsairLetsPrision == FALSE))
	{
		PlayerIsPrioratFakeTemp = TRUE;
		AI_Output(self,other,"DIA_ASS_1_STANDARD_01_04");	//Эй! Да ты не из наших людей!
		AI_Output(self,other,"DIA_ASS_1_STANDARD_01_05");	//Тревога! Враг!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_00");	//Лучше уходи! Иначе у обоих будут неприятности...
		};	
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_01");	//Не мешай мне!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_02");	//Уходи отсюда!
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_03");	//Не сейчас!
		};
		
		AI_StopProcessInfos(self);
	};
};