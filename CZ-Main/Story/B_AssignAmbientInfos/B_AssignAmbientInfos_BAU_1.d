
instance DIA_BAU_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_1_EXIT_Condition;
	information = DIA_BAU_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_1_JOIN_Condition;
	information = DIA_BAU_1_JOIN_Info;
	permanent = TRUE;
	description = "Řekni mi víc o těch žoldácích.";
};


func int DIA_BAU_1_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_BAU_1_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//Pověz mi víc o těch žoldácích.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//Jediný, co ti můžu poradit, je, aby ses jim zdaleka vyhnul.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//Jestli se některým z nich nebude zamlouvat tvůj ksicht, prostě ti krapet vylepší nos.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//Pak si můžeš u Leeho stěžovat, ale ten nos zůstane stejně už zlomenej.
};


instance DIA_BAU_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_1_PEOPLE_Condition;
	information = DIA_BAU_1_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//Tohle je Onarova farma. On tady má všechno pod palcem.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Dovol, abych ti dal menší radu: moc ty žoldáky neprovokuj. S těmahle není radno si zahrávat.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Sylvio je obvzlášť lstivý ničema. Ale jejich vůdce, Lee, je docela v klidu.
};


instance DIA_BAU_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_1_LOCATION_Condition;
	information = DIA_BAU_1_LOCATION_Info;
	permanent = TRUE;
	description = "A co je tady poblíž dalšího?";
};


func int DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//A co je tady poblíž dalšího?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Jen pole a farmy. A spousta žoldáků. Ale většina jich je na východě na Onarově farmě.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//Na sever leží Sekobova farma, ale tam chodí jen vybírat nájem.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//Na jihozápadě narazíš na cestu k Bengarově farmě.
};


instance DIA_BAU_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_1_STANDARD_Condition;
	information = DIA_BAU_1_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Onar si najal žoldáky, aby udrželi domobranu ve městě. Jinak by nám odvedli i tu poslední ovci!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Nic moc. Pořád ty samé problémy. Domobrana, skřeti a polní škůdci.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Dějí se tu podivné věci. Před několika dny jsem viděl černou postavu. A nebyl to člověk.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//Čím dál častějc tu vídáme skřety. Někdy si říkám: jednoho zabiješ a dva noví se objeví.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARZ_01_05");	//Paladinové jdou do Hornického údolí. Co to všechno má znamenat? Nemůžeme si dovolit ztratit jedinýho muže, abychom udrželi domobranu na uzdě.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_06");	//Skřeti se chopili Khorinisu! Konec k nám všem brzy přijde!
	};
};

func void B_AssignAmbientInfos_BAU_1(var C_Npc slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

