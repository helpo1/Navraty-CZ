
instance DIA_GOMEZWORKERSOUL_9_EXIT(C_Info)
{
	npc = gomezworkersoul_9;
	nr = 999;
	condition = dia_gomezworkersoul_9_exit_condition;
	information = dia_gomezworkersoul_9_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_9_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_9_HALLO(C_Info)
{
	npc = gomezworkersoul_9;
	nr = 1;
	condition = dia_gomezworkersoul_9_hallo_condition;
	information = dia_gomezworkersoul_9_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_9_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_9 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_9_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_01_00");	//Co tady hledáš, člověče?!... (mrtvým hlasem) Smrt nebo otázky před ní?
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_01");	//Ne! Ale smrt a odpovědi před ní.
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_01_02");	//Pro koho odpovědi, smrtelníku?!... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_03");	//Duše rudného barona Gomeze od tebe chce odpuštění, duchu.
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_04");	//A tohle odpuštění osvobodí i tebe.
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_05");	//Ale jen v případě - že mu dáš své odpuštění!
	Info_ClearChoices(dia_gomezworkersoul_9_hallo);
	Info_AddChoice(dia_gomezworkersoul_9_hallo,"Tvoje odpověď, duchu?",dia_gomezworkersoul_9_hallo_end);
};

func void dia_gomezworkersoul_9_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_End_01_01");	//Tvoje odpověď, duchu?
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_End_01_02");	//Dobře, smrtelníku! Jestli mi to dá svobodu - Odpouštím duši Gomeze... (smrtelným hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_End_01_03");	//Je dokonáno! Pak si teda vezmu na starost tvou duši a ukončím tvé trápení ať najdeš pokoj.
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_End_01_04");	//Aargh!... (mrtvý hlas)
	GOMEZSOULTALK_9 = TRUE;
	AI_StopProcessInfos(self);
};

