
instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BAU_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Vyhlásili jsme nezávislost - už nebudeme městu dál odvádět daně. Král pro nás nehne ani prstem - už jsme toho měli prostě dost!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//V tuto chvíli se toho moc neděje.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Uslyšíš příběhy o dracích! Král vždy přichází z nových věcí vyždímat víc peněz z lidí.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Dávej na sebe pozor, strašná spousta temných postav a divokých zvířat přichází průsmykem.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARZ_07_05");	//Teď, když jsou draci mrtví, se uráčil lord paladin vyjít z města. Je to asi čas který tu opět zvítězil.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_06");	//Zdá se, že brzy všichni zemřeme. Skřeti neušetří nikoho!
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

