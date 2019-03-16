
instance DIA_GOMEZWORKERSOUL_155_EXIT(C_Info)
{
	npc = gomezworkersoul_15;
	nr = 999;
	condition = dia_gomezworkersoul_15_exit_condition;
	information = dia_gomezworkersoul_15_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_15_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_15_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_15_HALLO(C_Info)
{
	npc = gomezworkersoul_15;
	nr = 1;
	condition = dia_gomezworkersoul_15_hallo_condition;
	information = dia_gomezworkersoul_15_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_15_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_15 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_15_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_00");	//Neměl jsi sem chodit, člověče... (mrtvý hlas) Čeká tě tu jen smrt!
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_01");	//Já si to nemyslím! Pravděpodobně ta smrt čeká na tebe.
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_02");	//HA, HA, HA... (smrtelný hlas) Jestli by tomu tak bylo, už před dávnym časem bych jí přivítal, smrtelníku!
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_04");	//Mýlíš se! Právě proto jsem sem přišel. Já ti můžu pomoci, duchu!
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_05");	//Aargh!... (mrtvým hlasem) Hovoříš pravdu, člověče?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_06");	//O tom nepochybuj! Výměnou za pomoc od tebe chci jednu malou službičku.
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_07");	//Poslouchám tě, smrtelníku. Co pro tebe můžu udělat?... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_08");	//Je nezbytné, abys odpustil jedné prokleté duši. Ta duše patří člověku, kterému se kdysi říkalo Gomez.
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_09");	//Rudobaron?!... (smrtelný vzdych)
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_10");	//On! Prostě mu dej oč tě žádám a já osvobodím tvou duši od tvého prokletí.
	Info_ClearChoices(dia_gomezworkersoul_15_hallo);
	Info_AddChoice(dia_gomezworkersoul_15_hallo,"Takže, souhlasíš?!",dia_gomezworkersoul_15_hallo_end);
};

func void dia_gomezworkersoul_15_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_End_01_01");	//Takže, souhlasíš?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_End_01_02");	//Ujednáno!... (mrtvým hlasem) Gomez dostane, co žádá.
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_End_01_03");	//A je to! A teď zemřeš, duchu. Tvá svoboda už přichází!
	GOMEZSOULTALK_15 = TRUE;
	AI_StopProcessInfos(self);
};

