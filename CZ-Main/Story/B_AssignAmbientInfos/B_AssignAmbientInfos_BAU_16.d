
instance DIA_BAU_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_16_EXIT_Condition;
	information = DIA_BAU_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_16_JOIN_Condition;
	information = DIA_BAU_16_JOIN_Info;
	permanent = TRUE;
	description = "Pověz mi víc o těch žoldácích.";
};


func int DIA_BAU_16_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Řekni mi víc o těch žoldácích.
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Lelkují kolem farmy celý den, když maj příležitost tlučou se navzájem, a je to psina.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Když to chceš vědět, tak žoldáci.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar je platí, ale většina z nich si stejně dělá co chce.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = "A co je tady poblíž dalšího?";
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//A co je tady poblíž dalšího?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//Jsou tady tři farmy. Onarova na východě a Sekobova na severním konci údolí.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Po cestě se dostaneš na náhorní planinu na jihovýchodě. Tam je Bengarova farma.
};


instance DIA_BAU_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Vojáci z města už nám nebudou odvádět náš dobytek a brát úrodu! Teď, když už se můžeme bránit, nějak ztratili zájem!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//Říká se, že se armáda shromažďuje v Hornickém údolí. Brzy budou i tady.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Slyšel jsem zvěsti, že jsou v Hornickém údolí draci. Nemůžu tomu uvěřit.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Někteří z žoldáků odešli. Já nevím, jestli je to dobře nebo špatně.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARZ_16_05");	//Posílají paladiny do Hornického údolí - co to je?
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_06");	//Paladinové neměli žádnou šanci. Skřeti prorazili jejiich obranu za pár minut. Co s námi bude?!
	};
};

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

