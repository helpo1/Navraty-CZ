
instance DIA_GOMEZWORKERSOUL_4_EXIT(C_Info)
{
	npc = gomezworkersoul_4;
	nr = 999;
	condition = dia_gomezworkersoul_4_exit_condition;
	information = dia_gomezworkersoul_4_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_4_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_4_HALLO(C_Info)
{
	npc = gomezworkersoul_4;
	nr = 1;
	condition = dia_gomezworkersoul_4_hallo_condition;
	information = dia_gomezworkersoul_4_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_4_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_4 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_4_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_01_00");	//Co tě přivádí, smrtelníku? (mrtvolným hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_01_01");	//Přišel jsem sem za Gomeze. Chce odstranit své zatracení.
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_01_02");	//Přišel jsi ve jménu Gomeze? ARRGH! (mrtvolným hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_01_06");	//Věř mi! Zbavím tě tvého osudu. Odpustíš?
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_01_07");	//Souhlasím. Najdu tak tedy klid. (mrtvolným hlasem)
	Info_ClearChoices(dia_gomezworkersoul_4_hallo);
	Info_AddChoice(dia_gomezworkersoul_4_hallo,"Odpuštíš Gomezovi?!",dia_gomezworkersoul_4_hallo_end);
};

func void dia_gomezworkersoul_4_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_End_01_01");	//Odpuštíš Gomezovi?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_End_01_02");	//Je mu odpuštěno. Stačíto?
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_End_01_03");	//Naprosto! A teď já pomohu tobě.
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_End_01_04");	//Aargh!... (mrtvolným hlasem) Osvoboď mou duši!
	GOMEZSOULTALK_4 = TRUE;
	AI_StopProcessInfos(self);
};

