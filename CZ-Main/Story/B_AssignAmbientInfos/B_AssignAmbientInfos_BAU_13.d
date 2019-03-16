
instance DIA_BAU_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_13_EXIT_Condition;
	information = DIA_BAU_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_13_JOIN_Condition;
	information = DIA_BAU_13_JOIN_Info;
	permanent = TRUE;
	description = "Pověz mi víc o těch žoldácích!";
};


func int DIA_BAU_13_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BAU_13_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Řekni mi víc o těch žoldácích!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Pokud jsi s nima neměl ještě žádný problémy, zajdi za Leem. On je ten, pro koho my rolníci děláme. Je na svý lidi vážně přísnej.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Když kdokoli z nich udělá něco špatně, nechá mu to pěkně sežrat.
};


instance DIA_BAU_13_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_13_PEOPLE_Condition;
	information = DIA_BAU_13_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Když to chceš vědět, tak žoldáci. Jasně, Onar je platí, ale jen Innos ví.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//Až si žoldáci vzpomenou, že už jim tady k ničemu neni, nechtěl bych bejt v jeho kůži.
};


instance DIA_BAU_13_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_13_LOCATION_Condition;
	information = DIA_BAU_13_LOCATION_Info;
	permanent = TRUE;
	description = "Co mi můžeš říct o tomhle místě?";
};


func int DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Co mi můžeš říct o tomhle místě?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//Jsou tady tři farmy. Onarova na východě a Sekobova na severním konci údolí.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//Po cestě se dostaneš na náhorní planinu na jihovýchodě. Tam je Bengarova farma.
};


instance DIA_BAU_13_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_13_STANDARD_Condition;
	information = DIA_BAU_13_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Vojáci z města už nám nebudou odvádět náš dobytek a brát úrodu! Teď, když už se můžeme bránit, nějak ztratili zájem!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Paladinové ve městě se nestarají o nás rolníky. Pokud skřeti zaútočí, jsme na vlastní pěst.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//Draci! Jsou tu zvěsti, že jsou draci v Hornickém údolí. Brzy budou schopni přejít průsmyk!
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//Dokonce se říká, že někteří banditi z hor směřují do Hornického údolí. Dobře, pro mě by to bylo příliš nebezpečné.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARZ_13_05");	//Když půjdou daně znovu dolů a dostaneme dostatečně zaplaceno za naši práci, potom budeme znovu obchodovat s městem.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_06");	//Skřeti téměř plně dohlíží na tuto část ostrova. Oni brzy přijdou i sem!
	};
};

func void B_AssignAmbientInfos_BAU_13(var C_Npc slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

