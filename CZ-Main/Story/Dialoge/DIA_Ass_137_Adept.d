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
	description = "Musím vyslechnout otroky.";
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
	AI_Output(other,self,"DIA_Ass_137_Adept_WithSlave_01_01");	//Musím vyslechnout otroky. Dej mi klíč.
	AI_Output(self,other,"DIA_Ass_137_Adept_WithSlave_01_02");	//Myslíš si, že ti ten klíč jen tak dám?
	AI_Output(other,self,"DIA_Ass_137_Adept_WithSlave_01_03");	//Kam jdeš? Mistr Osair mi osobně dovolil jít k otrokům.
	AI_Output(self,other,"DIA_Ass_137_Adept_WithSlave_01_04");	//Aha, když to tak tedy je... tady ho máš.
	B_GiveInvItems(self,other,ItKe_Masiaf_Prision,1);
	AI_Output(self,other,"DIA_Ass_137_Adept_WithSlave_01_05");	//Jen se podívej, ale nebuď na ně příliš tvrdý. Pak by mistr Osair nebyl moc potěšen.
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
		AI_Output(self,other,"DIA_ASS_1_STANDARD_01_04");	//Hej! Ty nejsi jedním z nás...
		AI_Output(self,other,"DIA_ASS_1_STANDARD_01_05");	//Poplach! Nepřítel!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_00");	//Raději jdi! Jinak budeme mít oba problémy...
		};	
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_01");	//Neobtěžuj mě!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_02");	//Vypadni odsud!
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_03");	//Teď ne!
		};
		
		AI_StopProcessInfos(self);
	};
};