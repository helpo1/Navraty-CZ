
instance DIA_PAL_7519_RITTER_EXIT(C_Info)
{
	npc = pal_7519_ritter;
	nr = 999;
	condition = dia_pal_7519_ritter_exit_condition;
	information = dia_pal_7519_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7519_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_7519_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7519_RITTER_PEOPLE(C_Info)
{
	npc = pal_7519_ritter;
	nr = 3;
	condition = dia_pal_7519_ritter_people_condition;
	information = dia_pal_7519_ritter_people_info;
	permanent = TRUE;
	description = "Kdo je tu velitel?";
};


func int dia_pal_7519_ritter_people_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_people_info()
{
	AI_Output(other,self,"DIA_PAL_7519_RITTER_People_01_00");	//Kdo je tu velitel?
	AI_Output(self,other,"DIA_PAL_7519_RITTER_People_01_01");	//Naši skupinu teď vede Albert.
	AI_Output(self,other,"DIA_PAL_7519_RITTER_PEOPLE_01_02");	//Najdeš ho vzadu v jeskyni.
};


instance DIA_PAL_7519_RITTER_LOCATION(C_Info)
{
	npc = pal_7519_ritter;
	nr = 2;
	condition = dia_pal_7519_ritter_location_condition;
	information = dia_pal_7519_ritter_location_info;
	permanent = TRUE;
	description = "Co mi můžeš říct o okolí?";
};


func int dia_pal_7519_ritter_location_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_location_info()
{
	AI_Output(other,self,"DIA_PAL_7519_RITTER_LOCATION_01_00");	//Co mi můžeš říct o okolí?
	AI_Output(self,other,"DIA_PAL_7519_RITTER_LOCATION_01_01");	//Nahoře nad námi je tábor bývalých trestanců.
	AI_Output(self,other,"DIA_PAL_7519_RITTER_LOCATION_01_02");	//Sice nevěří v Innose, ale obchodovat s nimi můžeme.
	AI_Output(self,other,"DIA_PAL_7519_RITTER_LOCATION_01_03");	//Za řekou je celkem nebezpečný les, ale skřeti tam nejsou!
	AI_Output(self,other,"DIA_PAL_7519_RITTER_LOCATION_01_04");	//Ty bastardi si zbudovali tábor na pobřeží.
};


instance DIA_PAL_7519_RITTER_STANDARD(C_Info)
{
	npc = pal_7519_ritter;
	nr = 1;
	condition = dia_pal_7519_ritter_standard_condition;
	information = dia_pal_7519_ritter_standard_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_pal_7519_ritter_standard_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_standard_info()
{
	AI_Output(other,self,"DIA_PAL_7519_RITTER_Standard_01_00");	//Jaká je situace?
	AI_Output(self,other,"DIA_PAL_7519_RITTER_Standard_01_01");	//Zatím klid.
};


instance DIA_PAL_7519_RITTER_GOTOKILLORCSLAVES(C_Info)
{
	npc = pal_7519_ritter;
	nr = 1;
	condition = dia_pal_7519_ritter_gotokillorcslaves_condition;
	information = dia_pal_7519_ritter_gotokillorcslaves_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7519_ritter_gotokillorcslaves_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (GOTOKILLORCSLAVES == TRUE) && (GOTOKILLORCSLAVESDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_gotokillorcslaves_info()
{
	AI_Output(self,other,"DIA_PAL_7519_RITTER_GoToKillOrcSlaves_01_00");	//Albert mi dal rozkaz pomoci ti vypořádat se se skupinkou skřetů.
	AI_Output(other,self,"DIA_PAL_7519_RITTER_GoToKillOrcSlaves_01_01");	//To je pravda. Pomoc se mi bude hodit.
	AI_Output(self,other,"DIA_PAL_7519_RITTER_GoToKillOrcSlaves_01_02");	//Dobře! Můj meč ti je k dispozici!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
	PALTWOORCSLAVE = TRUE;
};


instance DIA_PAL_7519_RITTER_GOTOKILLORCSLAVESDONE(C_Info)
{
	npc = pal_7519_ritter;
	nr = 1;
	condition = dia_pal_7519_ritter_gotokillorcslavesdone_condition;
	information = dia_pal_7519_ritter_gotokillorcslavesdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7519_ritter_gotokillorcslavesdone_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (GOTOKILLORCSLAVES == TRUE) && (PALTWOORCSLAVE == TRUE) && (GOTOKILLORCSLAVESDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_gotokillorcslavesdone_info()
{
	AI_Output(self,other,"DIA_PAL_7519_RITTER_GoToKillOrcSlavesDone_01_00");	//Musíš se vrátit do tábora - Albert potřebuje vědět, co se stalo!
	AI_Output(other,self,"DIA_PAL_7519_RITTER_GoToKillOrcSlavesDone_01_01");	//Samozřejmě.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"AfterBattle");
};

