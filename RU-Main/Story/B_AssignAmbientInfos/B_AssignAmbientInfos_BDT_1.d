
instance DIA_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BDT_1_EXIT_Condition;
	information = DIA_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_BDT_1_STANDARD_Condition;
	information = DIA_BDT_1_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BDT_1_STANDARD_Info()
{
	var int randy;

	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		randy = Hlp_Random(4);

		if(PlayerIsAssNow == FALSE)
		{
			PlayerIsPrioratFakeTemp = TRUE;
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_04");	//Эй! Да ты не из наших людей...
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_05");	//Тревога, враг!
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
	}
	else
	{
		randy = Hlp_Random(3);

		if(randy == 0)
		{
			AI_Output(self,other,"DIA_BDT_1_STANDARD_01_00");	//Убирайся с глаз моих!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_BDT_1_STANDARD_01_01");	//Тебе нужны проблемы?
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_BDT_1_STANDARD_01_02");	//Уходи, пока еще можешь!
		};
		
		AI_StopProcessInfos(self);
	};
};


func void B_AssignAmbientInfos_BDT_1(var C_Npc slf)
{
	if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_185_Adept)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_184_Adept)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_183_Adept)))
	{
		dia_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
		dia_bdt_1_standard.npc = Hlp_GetInstanceID(slf);
	};
};