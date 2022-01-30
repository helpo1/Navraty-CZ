
instance DIA_GOMEZWORKERSOUL_8_EXIT(C_Info)
{
	npc = gomezworkersoul_8;
	nr = 999;
	condition = dia_gomezworkersoul_8_exit_condition;
	information = dia_gomezworkersoul_8_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_8_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_8_HALLO(C_Info)
{
	npc = gomezworkersoul_8;
	nr = 1;
	condition = dia_gomezworkersoul_8_hallo_condition;
	information = dia_gomezworkersoul_8_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_8_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_8 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_8_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_01_00");	//ČLOVĚK? PROČ JSI TU?
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_02");	//Potřebuji abys mu odpustil!
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_01_03");	//Odpustit?
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_04");	//Můžu tě pak zbavit tvého utrpení!
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_01_05");	//Já vím, že můžeš smrtelníku. A vím jaké je to být proklet!
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_06");	//Dobře.
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_07");	//Tak to skončeme.
	Info_ClearChoices(dia_gomezworkersoul_8_hallo);
	Info_AddChoice(dia_gomezworkersoul_8_hallo,"Takže?!",dia_gomezworkersoul_8_hallo_end);
};

func void dia_gomezworkersoul_8_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_End_01_01");	//Takže?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_End_01_02");	//Dobře, odpouštím mu.
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_End_01_03");	//Tak pojď.
	GOMEZSOULTALK_8 = TRUE;
	AI_StopProcessInfos(self);
};

