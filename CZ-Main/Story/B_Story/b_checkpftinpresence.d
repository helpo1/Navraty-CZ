
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
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_03");	//Innos nám dá sílu!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_04");	//Dokud budeme dýchat budeme hájit Innose!
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
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_00");	//Innos je má čest. Má čest je můj život!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_01");	//Dokud nás Innos neopustí budeme hájit jeho jméno!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_02");	//S pomocí Innose smeteme všechny kreatury z povrchu zemského!
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
	description = "(zeptat se na výpomoc ve skladu)";
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
	AI_Output(other,self,"DIA_OWPAL_4_STANDARD_RAYNE_01_01");	//Paladin Rayne potřebuje výpomoci ve skladu.
	AI_Output(other,self,"DIA_OWPAL_4_STANDARD_RAYNE_01_02");	//Můžeš mu pomoci?
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_03");	//Omluv mne příteli, ale vůbec nemám čas!
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_04");	//Bohužel nemohu, ale optej se ostatních třeba někdo pomůže.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_05");	//Ne chlapče, mám důležitější věci na práci!
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_06");	//Takže se podívej po někom jiném.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_07");	//Jistě, neznám nic nudnějšího než trávit čas mezi krabicemi.
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_08");	//V žádném případě, poohlédni se po někom jiném.
	};
	if(randy == 3)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_09");	//Bohužel nemám čas.
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_RAYNE_01_10");	//Ale optej se ostatních třeba někdo pomůže.
	};
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Zdá se, že jen marním čas - žádný z paladinů není nakloněn myšlence Rayneovi pomoct. Možná bych měl zvolit poněkud drastičtější přístup...");
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

