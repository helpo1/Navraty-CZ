
instance DIA_Lester_DI_EXIT(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 999;
	condition = DIA_Lester_DI_EXIT_Condition;
	information = DIA_Lester_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_DI_Hello(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 1;
	condition = DIA_Lester_DI_Hello_Condition;
	information = DIA_Lester_DI_Hello_Info;
	permanent = TRUE;
	description = "Chtěl bys mi něco říct?";
};


func int DIA_Lester_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;

func void DIA_Lester_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//Chtěl bys mi něco říct?
	if((Npc_IsDead(Mario_DI) == FALSE) && (ORkSturmDI == TRUE) && (DIA_Lester_DI_SCGotWarning1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//Mario opustil loď, když skřeti zaútočili. Navzory tomu chaosu tady, jsem ho bedlivě sledoval.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//Proběhl skřetí blokádou jako kdyby tam nebyla - a skřeti na něj neútočili.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//Od počátku jsem měl o tom parchantovi zvláštní pocity. Vypadá to, že má čachry s nepřítelem.
		B_GivePlayerXP(XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if((Npc_IsDead(Mario_DI) == FALSE) && (DIA_Lester_DI_SCGotWarning2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//Ten chlápek, co si říká Mario se mi nezdá. Má temnou auru.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//Jisti si záda, kámo.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//Momentálně ne. Možná později.
	};
};


instance DIA_Lester_DI_MarioArsch(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 2;
	condition = DIA_Lester_DI_MarioArsch_Condition;
	information = DIA_Lester_DI_MarioArsch_Info;
	description = "Měl jsi pravdu. Mario nás zradil.";
};


func int DIA_Lester_DI_MarioArsch_Condition()
{
	if(((DIA_Lester_DI_SCGotWarning2 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE)) && (MIS_Mario_Ambush == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lester_DI_MarioArsch_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//Měl jsi pravdu. Mario nás zradil.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//Ano. Možná nejsem nějak extra vnímavý, ale tohohle jsem si nemohl nevšimnout.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//Příště buď opatrnější s tím, koho s sebou bereš.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_PC_Lester_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 5;
	condition = DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Brzy odplouváme.";
};

func int DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Lester_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//Brzy odplouváme.
	if(DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//Bolesti hlavy prostě zmizely.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//Jak jsi to udělal?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//Porazil jsem nepřítele.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//Muselo to být něco vážně mocného. Co byl zač?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//Nemrtvý drak.
		};
		if(SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//Tvoji staří přátele z tábora v bažinách mi pěkně zavařili.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//Ano... víra pohne skálou. Tak to bylo a bude. Škoda jen, že sloužili špatnému bohu.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//Budu potřebovat trochu času, abych se přes to přenesl.
		};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//Snad se již nikdy nic takového nestane. Na světě není dostatek trávy, kolik bych jí teď chtěl vyhulit.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Psionic_DI_PICKPOCKET(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 900;
	condition = DIA_Psionic_DI_PICKPOCKET_Condition;
	information = DIA_Psionic_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Psionic_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(56,25);
};

func void DIA_Psionic_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,Dialog_Back,DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

