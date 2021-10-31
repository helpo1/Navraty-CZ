
instance DIA_Jorgen_DI_KAP3_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 999;
	condition = DIA_Jorgen_DI_KAP3_EXIT_Condition;
	information = DIA_Jorgen_DI_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jorgen_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_Hallo(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_Hallo_Condition;
	information = DIA_Jorgen_DI_Hallo_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Jorgen_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//Všechno v pořádku?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//V pohodě - dokud všechna ta monstra nepřijdou blíže...
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//Další útok skřetů nepřežijeme. Tak šup šup - potřebujeme se odtud dostat.
		B_StartOtherRoutine(Jorgen_DI,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_UndeadDragonDead_Condition;
	information = DIA_Jorgen_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Nepřítel je mrtev.";
};


func int DIA_Jorgen_DI_UndeadDragonDead_Condition()
{
	if((UndeadDragonIsDead == TRUE) && (DAGOTTELLALL == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//Nepřítel je mrtev.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//To jsou dobré zprávy. Doufám, že už nic na tomto ostrově nepotřebujeme?
	Info_ClearChoices(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead,"Počkej chvíli.",DIA_Jorgen_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead,"Jo, všechno je v pořadku.",DIA_Jorgen_DI_UndeadDragonDead_over);
};

func void DIA_Jorgen_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//Počkej chvíli. Zapomněl jsem neco vyřídit.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//Dobře, ale švihej.
	AI_StopProcessInfos(self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over()
{
	CAPITANORDERDIAWAY = TRUE;
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_over_15_00");	//Jo, všechno je v pořadku. Jedeme.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_over_07_01");	//Excelentní! Zvednout kotvu, napnout plachty.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_over_07_02");	//Ty se běž vyspat - v kapitánově kajutě je pro tebe připravena postel.
	AI_StopProcessInfos(self);
};

