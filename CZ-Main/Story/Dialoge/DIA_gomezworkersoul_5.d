
instance DIA_GOMEZWORKERSOUL_5_EXIT(C_Info)
{
	npc = gomezworkersoul_5;
	nr = 999;
	condition = dia_gomezworkersoul_5_exit_condition;
	information = dia_gomezworkersoul_5_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_5_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_5_HALLO(C_Info)
{
	npc = gomezworkersoul_5;
	nr = 1;
	condition = dia_gomezworkersoul_5_hallo_condition;
	information = dia_gomezworkersoul_5_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_5_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_5 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_5_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_01_00");	//Kdo jsi, člověče? Co ode mě chceš?... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_01_01");	//Gomez od tebe chce odpuštění za to, že tě proklel.
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_01_02");	//Na oplátku, já ti pomohu zrušit tvoje prokletí.
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_01_05");	//Hmm... (mrtvým hlasem) Je pro mně důležité si to promyslet, smrtelníku - přemyslet, jestli dobře udělám, když mu odpustím.
	Info_ClearChoices(dia_gomezworkersoul_5_hallo);
	Info_AddChoice(dia_gomezworkersoul_5_hallo,"Tak mu odpusť!",dia_gomezworkersoul_5_hallo_end);
};

func void dia_gomezworkersoul_5_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_End_01_01");	//Tak mu odpusť! Pak to skončíme...
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_End_01_02");	//Dobře, smrtelníku! Takže, dávám Gomezovi odpuštění... (smrtelný hlas) Dávám mu milost.
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_End_01_03");	//Tady a navěky! Teď se podíváme na tebe, duchu. Brzy tvé utrpení skončí!
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_End_01_04");	//Osvoboď mě! Aargh!... (smrtelný hlas)
	GOMEZSOULTALK_5 = TRUE;
	AI_StopProcessInfos(self);
};

