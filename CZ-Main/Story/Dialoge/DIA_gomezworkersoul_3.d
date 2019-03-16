
instance DIA_GOMEZWORKERSOUL_3_EXIT(C_Info)
{
	npc = gomezworkersoul_3;
	nr = 999;
	condition = dia_gomezworkersoul_3_exit_condition;
	information = dia_gomezworkersoul_3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_3_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_3_HALLO(C_Info)
{
	npc = gomezworkersoul_3;
	nr = 1;
	condition = dia_gomezworkersoul_3_hallo_condition;
	information = dia_gomezworkersoul_3_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_3_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_3 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_3_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_00");	//SMRTELNÍKU?!... (mrtvolně) CO TĚ SEM PŘIVÁDÍ?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_01");	//Chci ti pomoct duchu.
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_02");	//SILOU MI NEPOMŮŽEŠ!... (mrtvolně) MÉ ZATRACENÍ NEMŮŽE ODSTRANIT NIKDO!
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_03");	//Mýlíš se! Já to můžu udělat.
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_08");	//Pouze potom ti můžu pomoci. Dříve ne!
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_09");	//Ty žádáš, abych odpustil tomu, jehož vinou jsem prokletý?!... (mrtvolně)
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_10");	//! Jednoduše to udělej a zbavím tě tvého zatracení.
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_11");	//Jsi si tím jistý, smrtelníku?
	Info_ClearChoices(dia_gomezworkersoul_3_hallo);
	Info_AddChoice(dia_gomezworkersoul_3_hallo,"Odpustíš tedy Gomezovi?!",dia_gomezworkersoul_3_hallo_end);
};

func void dia_gomezworkersoul_3_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_End_01_01");	//Odpustíš tedy Gomezovi?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_End_01_02");	//Dobrá!... (mrtvolně) Odpouštím Gomezovi za to, co z nás udělal.
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_End_01_03");	//Fajn! Teď uvidíme, zda jsem schopen dodržet slovo.
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_End_01_04");	//Nechť nalezneš dlouho očekávaný odpočinek.
	GOMEZSOULTALK_3 = TRUE;
	AI_StopProcessInfos(self);
};

