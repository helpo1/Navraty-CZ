
instance DIA_GOMEZWORKERSOUL_7_EXIT(C_Info)
{
	npc = gomezworkersoul_7;
	nr = 999;
	condition = dia_gomezworkersoul_7_exit_condition;
	information = dia_gomezworkersoul_7_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_7_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_7_HALLO(C_Info)
{
	npc = gomezworkersoul_7;
	nr = 1;
	condition = dia_gomezworkersoul_7_hallo_condition;
	information = dia_gomezworkersoul_7_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_7_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_7 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_7_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_01_00");	//Proč jsi tady smrtelníku? (mrtvolným hlasem) Proč rušíš můj klid?
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_01_01");	//Kvůli Gomezovi.
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_01_02");	//Prokletý?! Arrgh... Co ode mě chce?
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_01_03");	//Tvoje odpuštění, na oplátku tě mohu zbavit tvého utrpení.
	Info_ClearChoices(dia_gomezworkersoul_7_hallo);
	Info_AddChoice(dia_gomezworkersoul_7_hallo,"Odpustíš mu?!",dia_gomezworkersoul_7_hallo_end);
};

func void dia_gomezworkersoul_7_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_End_01_01");	//Odpustíš mu?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_End_01_02");	//Ten kdo zatratil onu duši žádá mé odpuštění? Tak ať ho má! Odpouštím mu.
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_End_01_03");	//Dobře! Teď přišel tvůj čas to ukončit.
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_End_01_04");	//Aargh...
	GOMEZSOULTALK_7 = TRUE;
	AI_StopProcessInfos(self);
};

