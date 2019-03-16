
instance DIA_Addon_Paul_EXIT(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 999;
	condition = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_PICKPOCKET(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 900;
	condition = DIA_Addon_Paul_PICKPOCKET_Condition;
	information = DIA_Addon_Paul_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Paul_PICKPOCKET_Condition()
{
	return C_Beklauen(22,19);
};

func void DIA_Addon_Paul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,Dialog_Back,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};

func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};


instance DIA_Addon_Paul_Hi(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 1;
	condition = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent = FALSE;
	description = "Prodáváš věci na kování?";
};


func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Prodáváš věci na kování?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Ocel prodává Huno. Já mám pouze pár hrudek rudy.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Ale ty neprodám. Je to jediná cenná věc, kterou mám.
};


instance DIA_Addon_Paul_Huno(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent = FALSE;
	description = "Pracuješ pro Huna?";
};


func int DIA_Addon_Paul_Huno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Pracuješ pro Huna?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Chtěl jsem si trochu vydělat, tak jsem nastoupil k Hunovi. Ale od té doby mi Esteban nic nezaplatil.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//Říkál, že mě nepotřebuje.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//Ale co mi zbývá, než dál otročit pro Huna?
};


instance DIA_Addon_Paul_Attentat(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 3;
	condition = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Paul_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Asi nic chlape! Já s tím nemám nic společného? Co ode mě chceš?
};


instance DIA_Addon_Paul_HunoVerdacht(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 4;
	condition = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent = FALSE;
	description = "Huno je podezříván ze zapletení do pokusu o vraždu...";
};


func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if(((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE)) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno je podezříván ze zapletení do pokusu o vraždu...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//O tom já nic nevím!
};


instance DIA_Addon_Paul_HunoArbeit(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent = FALSE;
	description = "Pracuješ pro Huna! Musíš něco vědět!";
};


func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno) && Npc_KnowsInfo(other,DIA_Addon_Paul_HunoVerdacht) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Pracuješ pro Huna! Musíš něco vědět!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(zoufale) Nevím nic! Musím jít!
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_FearEsteban(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent = FALSE;
	description = "Víš, co s tebou udělá Esteban, když se dozví, že kryješ Huna?";
};


func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_HunoArbeit) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//Víš, co s tebou udělá Esteban, když se dozví, že kryješ Huna?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Nech mě na pokoji! S tady tím nemám nic společného.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_MaulPaul(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent = FALSE;
	description = "Řekni mi, co víš!";
};


func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_FearEsteban) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(kamarádsky) Řekni mi, co víš nebo s tebou praštím o zeď, Paule!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//Nemůžeš na mě být tak hrubý i když pracuješ pro šéfa.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(příjemně) Ale můžu!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Neudělej nějakou blbost!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(netrpělivě) Paule...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(rozrušeně) Vše co vím je, že Huno pracuje pro Estebana.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(rozrušeně) Pořád s tím za mnou chodí. Říká, že mu Esteban kazí práci...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//Já pouze poslouchám a nikdy se neptám.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Přesně! Vidíš a ani to nebolelo.
	Npc_ExchangeRoutine(self,"START");
	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Paul říká, že Huno nenávidí Estebana za to, že mu kazí práci.");
};


instance DIA_Addon_BDT_1070_Paul_Mine(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Paul_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Konečně! Tady, vem si za to mou rudu.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Paul_PERM(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 99;
	condition = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent = TRUE;
	description = "Jinak všechno v pořádku?";
};


func int DIA_Addon_Paul_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//Jinak všechno v pořádku?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Ano, z této skály dostanu kupu zlata!
	}
	else if((Paul_TellAll == TRUE) && (Huno_zuSnaf == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//Řekl jsem všechno, co vím!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Chci jen dělat svou práci!
	};
};

