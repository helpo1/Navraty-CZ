
instance DIA_Addon_Monty_EXIT(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 999;
	condition = DIA_Addon_Monty_EXIT_Condition;
	information = DIA_Addon_Monty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Monty_einmal;

instance DIA_Addon_Monty_Hi(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 2;
	condition = DIA_Addon_Monty_Hi_Condition;
	information = DIA_Addon_Monty_Hi_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Monty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Monty_Hi_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Monty_Hi_08_01");	//Jsem naživu - a to je hlavní.
	if(Monty_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Monty_Hi_08_02");	//Jestli si chceš popovídat, tak Patrik je ten, koho hledáš.
		Monty_einmal = TRUE;
	};
};

