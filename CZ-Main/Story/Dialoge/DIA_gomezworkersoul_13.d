
instance DIA_GOMEZWORKERSOUL_133_EXIT(C_Info)
{
	npc = gomezworkersoul_13;
	nr = 999;
	condition = dia_gomezworkersoul_13_exit_condition;
	information = dia_gomezworkersoul_13_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_13_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_13_HALLO(C_Info)
{
	npc = gomezworkersoul_13;
	nr = 1;
	condition = dia_gomezworkersoul_13_hallo_condition;
	information = dia_gomezworkersoul_13_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_13_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_13 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_13_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_00");	//KDO JSI, ČLOVĚČE?!... (mrtvým hlasem) Nevypadáš jako ostatní prokletí.
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_01");	//Máš pravdu, duchu. Jsem jiný než ty, nejsem prokletý a patřím mezi živé.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_02");	//TAK, CO HLEDÁŠ TADY, MEZI MRTVÝMI?
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_05");	//Přeji si pomoci najít tvé duši dlouho očekávaný odpočinek.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_06");	//Opravdu, prišel jsi mi pomoct?!... (mrtvým hlasem) Aargh!
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_07");	//Ale ne jen pomoct! Je ale důležité, abys pro mě něco udělal.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_08");	//Tak co ode mě chceš, člověče?
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_09");	//Měl bys dát odpuštění duši člověka jménem Gomez.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_10");	//GOMEZ?!... Jestli ode mě žádáš odpuštění, tak je pravděpodobné že rudný baron je taky proklet, jako my všichni.
	Info_ClearChoices(dia_gomezworkersoul_13_hallo);
	Info_AddChoice(dia_gomezworkersoul_13_hallo,"Znamená to, že Gomez má od tebe odpuštěno?!",dia_gomezworkersoul_13_hallo_end);
};

func void dia_gomezworkersoul_13_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_End_01_01");	//Znamená to, že Gomez má od tebe odpuštěno?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_End_01_02");	//Ano!... (mrtvý hlas) Má ode mě odpuštěno.
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_End_01_03");	//Je dokonáno! Teď je čas se postarat o tvou duši.
	GOMEZSOULTALK_13 = TRUE;
	AI_StopProcessInfos(self);
};

