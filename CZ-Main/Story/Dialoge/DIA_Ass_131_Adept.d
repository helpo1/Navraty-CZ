instance DIA_Ass_131_Adept_EXIT(C_Info)
{
	npc = Ass_131_Adept;
	nr = 999;
	condition = DIA_Ass_131_Adept_exit_condition;
	information = DIA_Ass_131_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_131_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_131_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_131_Adept_WithSlave(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_WithSlave_Condition;
	information = DIA_Ass_131_Adept_WithSlave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_131_Adept_WithSlave_Condition()
{
	if((PW_WelcomeToHram == TRUE) && (Npc_IsDead(SEK_168_SLAVEOBSSEK) == FALSE) && (SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] == TRUE) && (MeetNrozas == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_WithSlave_Info()
{
	AI_Output(self,other,"DIA_Ass_131_Adept_WithSlave_01_01");	//Co ti tak trvalo, novici?! Mistr Nrozas už čeká na svého nového otroka.
	AI_Output(self,other,"DIA_Ass_131_Adept_WithSlave_01_02");	//Okamžitě ho k němu zaveď, pokud nechceš poznat jeho hněv!
	PW_AdepdGuardTellInfo = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_131_Adept_NoSlave(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_NoSlave_Condition;
	information = DIA_Ass_131_Adept_NoSlave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_131_Adept_NoSlave_Condition()
{
	if((PW_WelcomeToHram == TRUE) && (Npc_IsDead(SEK_168_SLAVEOBSSEK) == TRUE) && (SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] == FALSE) && (MeetNrozas == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_NoSlave_Info()
{
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_01");	//Co ti tak trvalo, novici?!
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_02");	//A proč přicházíš bez otroka, kterého jsi měl mistru Nrozasovi dovést?
	AI_Output(other,self,"DIA_Ass_131_Adept_NoSlave_01_03");	//Ehm... Ztratil jsem ho.
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_04");	//Cože?! (upřený pohled) Něco mi říká, že nejsi tím, za koho se vydáváš.
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_05");	//... bratři, máme tady nezvaného hosta!
	PW_AdepdGuardTellInfo = TRUE;
	AI_StopProcessInfos(self);
	PlayerIsPrioratFakeTemp = TRUE;
};


instance DIA_Ass_131_Adept_NrozasPoisonGift(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_NrozasPoisonGift_Condition;
	information = DIA_Ass_131_Adept_NrozasPoisonGift_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_131_Adept_NrozasPoisonGift_Condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_NrozasPoisonGift_Info()
{
	AI_Output(self,other,"DIA_Ass_131_Adept_NrozasPoisonGift_01_01");	//Bratře, neodkladně tě chtěl vidět mistr Haniar.
	AI_Output(self,other,"DIA_Ass_131_Adept_NrozasPoisonGift_01_02");	//Tak bys neměl ztrácet čas a raději za ním hned jít.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_131_Adept_STANDARD(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_STANDARD_Condition;
	information = DIA_Ass_131_Adept_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ass_131_Adept_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PW_AdepdGuardTellInfo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_STANDARD_Info()
{
	var int randy;

	randy = Hlp_Random(4);

	if(PlayerIsAssNow == FALSE)
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
