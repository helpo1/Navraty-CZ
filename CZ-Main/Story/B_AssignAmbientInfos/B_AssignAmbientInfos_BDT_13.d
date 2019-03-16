
instance DIA_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BDT_13_EXIT_Condition;
	information = DIA_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_13_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_BDT_13_STANDARD_Condition;
	information = DIA_BDT_13_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_13_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Verschwinde_Stimme13()
{
	AI_Output(self,other,"DIA_BDT_13_STANDARD_13_01");	//Zmiz!
};

func void DIA_BDT_13_STANDARD_Info()
{
	var int randy;

	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		randy = Hlp_Random(4);

		if(PlayerIsAssNow == FALSE)
		{
			PlayerIsPrioratFakeTemp = TRUE;
			AI_Output(self,other,"DIA_ASS_2_STANDARD_01_04");	//Hej! Ty nejsi jeden z našich lidí...
			AI_Output(self,other,"DIA_ASS_2_STANDARD_01_05");	//Poplach, vetřelec!
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_ASS_2_STANDARD_01_00");	//Radši jdi! V opačném případě tě stihne nemalý problém...
			};	
			if(randy == 1)
			{
				AI_Output(self,other,"DIA_ASS_2_STANDARD_01_01");	//Nech mě být!
			};
			if(randy == 2)
			{
				AI_Output(self,other,"DIA_ASS_2_STANDARD_01_02");	//Vodprejskni!
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_ASS_2_STANDARD_01_03");	//Teďka ne!
			};
		
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		randy = Hlp_Random(3);

		if(randy == 0)
		{
			AI_Output(self,other,"DIA_BDT_13_STANDARD_13_00");	//Co čumíš jak jelito!
		};
		if(randy == 1)
		{
			B_Verschwinde_Stimme13();
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_BDT_13_STANDARD_13_02");	//Nech mě na pokoji, ty vandráku.
		};
		
		AI_StopProcessInfos(self);
	};
};

func void B_AssignAmbientInfos_BDT_13(var C_Npc slf)
{
	if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_185_Adept)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_184_Adept)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_183_Adept)))
	{
		dia_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
		dia_bdt_13_standard.npc = Hlp_GetInstanceID(slf);
	};
};