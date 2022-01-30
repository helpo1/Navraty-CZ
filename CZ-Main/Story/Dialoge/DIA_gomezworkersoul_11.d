
instance DIA_GOMEZWORKERSOUL_111_EXIT(C_Info)
{
	npc = gomezworkersoul_11;
	nr = 999;
	condition = dia_gomezworkersoul_11_exit_condition;
	information = dia_gomezworkersoul_11_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_11_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_11_HALLO(C_Info)
{
	npc = gomezworkersoul_11;
	nr = 1;
	condition = dia_gomezworkersoul_11_hallo_condition;
	information = dia_gomezworkersoul_11_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_11_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_11 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_11_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_00");	//Co je podstatné je, jak ses sem dostal, smrtelníku? (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_01");	//Pravděpodobně to není podstatné pro mě, ale pro tebe, duchu!
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_02");	//Pro příklad, někdy by tě osvobodil ze zatracení a zklidnil tvou duši. Mám pravdu?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_03");	//Opravdu si přeješ mě osvobodit?! Aargh!... (smrtelným hlasem)
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_04");	//Pak se do toho nebudu míchat. Udělej, co máš!
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_05");	//Ne tak rychle! Pro začátek, musíš pro mě něco udělat.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_06");	//Co ode mě chceš?... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_07");	//Všechno, co od tebe žádám, je dát odpuštění jedné nepokojné duši.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_09");	//Gomez?! Hmm... (mrtvý povzdech) Pamatuji si to jméno.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_10");	//I teď, když jsem už mrtvý, jsem z něj zděsený a bojím se!
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_11");	//Já to vidím tak, že pro lidi jako Gomez na tomhle světe není odpuštění.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_13");	//Už není v mých silách znášet tohle utrpení.
	Info_ClearChoices(dia_gomezworkersoul_11_hallo);
	Info_AddChoice(dia_gomezworkersoul_11_hallo,"Takže to znamená, že mu odpouštíš?",dia_gomezworkersoul_11_hallo_end);
};

func void dia_gomezworkersoul_11_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_End_01_01");	//Takže to znamená, že mu odpouštíš?
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_End_01_02");	//Ano!... (smrtelným hlasem) Má ode mě odpuštěno.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_End_01_03");	//Teď - pomoz mi ukončit mé prokletí! Aargh!... (mrtvým hlasem)
	GOMEZSOULTALK_11 = TRUE;
	AI_StopProcessInfos(self);
};

