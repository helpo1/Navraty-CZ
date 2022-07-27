
instance DIA_GOMEZWORKERSOUL_1_EXIT(C_Info)
{
	npc = gomezworkersoul_1;
	nr = 999;
	condition = dia_gomezworkersoul_1_exit_condition;
	information = dia_gomezworkersoul_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_1_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_1_HALLO(C_Info)
{
	npc = gomezworkersoul_1;
	nr = 1;
	condition = dia_gomezworkersoul_1_hallo_condition;
	information = dia_gomezworkersoul_1_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_1_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_1 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_1_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_00");	//PROČ RUŠÍŠ MŮJ KLID, SMRTELNÍKU? CO ODE MĚ ŽÁDÁŠ?...
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_01_01");	//Ty jsi mě přišel osvobodit?! Aargh!... (mrtvolně) Opravdu skončís moje utrpení?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_02");	//Přesně tak!
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_01_04");	//Ale předtím, než to udělám, chce Gomez, abys i ty odpustil jeho duši.
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_05");	//Hmmm... (mrtvolně) Ví o co žádá? My jsme byli prokleti kvůli němu!
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_06");	//A jeho duše zřejmě nemůže najít odpočinek na tomto světě.
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_01_07");	//Máš naprostou pravdu duchu.
	Info_ClearChoices(dia_gomezworkersoul_1_hallo);
	Info_AddChoice(dia_gomezworkersoul_1_hallo,"Tak odpustíš mu?!",dia_gomezworkersoul_1_hallo_end);
};

func void dia_gomezworkersoul_1_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_End_01_01");	//Tak odpustíš mu?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_End_01_02");	//Hmm!... (mrtvolně) Dám mu, oč žádá.
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_End_01_03");	//Protože vím jaké je to být prokletý!
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_End_01_04");	//A teď mě člověče propusť! Aargh!... (mrtvolně)
	GOMEZSOULTALK_1 = TRUE;
	AI_StopProcessInfos(self);
};

