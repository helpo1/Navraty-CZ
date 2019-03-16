
instance DIA_Mil_332_Stadtwache_EXIT(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 999;
	condition = DIA_Mil_332_Stadtwache_EXIT_Condition;
	information = DIA_Mil_332_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_332_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_332_STADTWACHE_TOARMSCITYGATE(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 1;
	condition = dia_mil_332_stadtwache_toarmscitygate_condition;
	information = dia_mil_332_stadtwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_332_stadtwache_toarmscitygate_condition()
{
	if((TOARMSCITYGATE == TRUE) && (CITYGATEACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_332_stadtwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSCITYGATE = FALSE;
};


instance DIA_Mil_332_Stadtwache_PERM(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 1;
	condition = DIA_Mil_332_Stadtwache_PERM_Condition;
	information = DIA_Mil_332_Stadtwache_PERM_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Mil_332_Stadtwache_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_332_Stadtwache_PERM_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Mil_332_Stadtwache_PERM_04_01");	//Pokračuj! Jsem ve službě!
	AI_StopProcessInfos(self);
};


//----------------------------------------dezertiry-----------------------------------------------


instance DIA_Mil_3320_Stadtwache_EXIT(C_Info)
{
	npc = Mil_3320_Stadtwache;
	nr = 999;
	condition = DIA_Mil_3320_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3320_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3320_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3320_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3321_Stadtwache_EXIT(C_Info)
{
	npc = Mil_3321_Stadtwache;
	nr = 999;
	condition = DIA_Mil_3321_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3321_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3321_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3321_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3322_Stadtwache_EXIT(C_Info)
{
	npc = Mil_3322_Stadtwache;
	nr = 999;
	condition = DIA_Mil_3322_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3322_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3322_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3322_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3321_Stadtwache_FUCKOFF(C_Info)
{
	npc = Mil_3321_Stadtwache;
	nr = 10;
	condition = DIA_Mil_3321_Stadtwache_FUCKOFF_condition;
	information = DIA_Mil_3321_Stadtwache_FUCKOFF_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_3321_Stadtwache_FUCKOFF_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_3321_Stadtwache_FUCKOFF_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Mil_3322_Stadtwache_FUCKOFF(C_Info)
{
	npc = Mil_3322_Stadtwache;
	nr = 10;
	condition = DIA_Mil_3322_Stadtwache_FUCKOFF_condition;
	information = DIA_Mil_3322_Stadtwache_FUCKOFF_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_3322_Stadtwache_FUCKOFF_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_3322_Stadtwache_FUCKOFF_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Mil_3320_Stadtwache_Run(C_Info)
{
	npc = Mil_3320_Stadtwache;
	nr = 1;
	condition = DIA_Mil_3320_Stadtwache_Run_condition;
	information = DIA_Mil_3320_Stadtwache_Run_info;
	permanent = FALSE;
	description = "Hej, co tady děláte?";
};

func int DIA_Mil_3320_Stadtwache_Run_condition()
{
	if(MIS_DeadHead == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mil_3320_Stadtwache_Run_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_00");	//Hej, co tady děláte?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_01");	//Ehm... (váhavě) Dostali jsme rozkaz vrátit se zpátky na Khorinis!
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_02");	//Rozkaz od koho?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_03");	//No... (přemýšlí) Byly to rozkaz od... lorda Andreho! Ano, od něho.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_04");	//Vždyť lord Andre je nyní v Khorinisu. Máte mě snad za hlupáka?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_05");	//Ne, co si... Já... jsem teď trochu zmatený... samozřejmě, že to nebyl rozkaz od lorda Andreho!
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_06");	//Navíc, víš, rozkazy jako tyhle jsou obvykle potvrzeny i písemně. Máte snad nějaké takové dokumenty?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_08");	//Poslouchej, kamaráde... (nervózně) Jdi si svou cestou! A raději se nestarej do věcí ostatních.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_09");	//Tak to vás tedy budu muset nahlásit paladinům.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_10");	//A najednou z vás budou akorát tak obyčejní dezertéři.
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_11");	//Ach, chlape. Vždyť jsem ti říkal, aby ses staral o své vlastní záležitosti.
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_12");	//Promiň, ale říkal sis o to!
	B_LogEntry(TOPIC_DeadHead,"Nedaleko Khoriniského průsmyku jsem potkal tři domobránce. Vypadají jako dezertéři. Zřejmě mě nebudou chtít nechat jen tak odejít, jelikož bych je mohl nahlásit paladinům.");
	Info_ClearChoices(DIA_Mil_3320_Stadtwache_Run);
	Info_AddChoice(DIA_Mil_3320_Stadtwache_Run,Dialog_Ende,DIA_Mil_3320_Stadtwache_Run_End);
};

func void DIA_Mil_3320_Stadtwache_Run_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Mil_3321_Stadtwache.aivar[AIV_EnemyOverride] = FALSE;
	Mil_3322_Stadtwache.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_KILL,0);
};