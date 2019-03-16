
instance DIA_GOMEZWORKERSOUL_6_EXIT(C_Info)
{
	npc = gomezworkersoul_6;
	nr = 999;
	condition = dia_gomezworkersoul_6_exit_condition;
	information = dia_gomezworkersoul_6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_6_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_6_HALLO(C_Info)
{
	npc = gomezworkersoul_6;
	nr = 1;
	condition = dia_gomezworkersoul_6_hallo_condition;
	information = dia_gomezworkersoul_6_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_6_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_6 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_6_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_00");	//Kdo mě vyrušuje?... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_01");	//Ten, kdo ti pomůže.
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_02");	//HA, HA, HA! Jak ty mi můžeš pomoci, smrtelníku?!... (mrtvý hlas) NIKDO nemá sílu mi pomoct!
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_03");	//A přece ti pomůžu! Ale je to možné jen pod jednou podmínkou...
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_04");	//Jaká je ta podmínka?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_05");	//Dáš odpuštění duši člověka, který tě proklel. Přesněji rudnému baronovi Gomezovi!
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_06");	//A až potom můžu ukončit tvé trápení!
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_08");	//Buď po tvém, člověče. Přijímám tvé podmínky... (mrtvým hlasem)
	Info_ClearChoices(dia_gomezworkersoul_6_hallo);
	Info_AddChoice(dia_gomezworkersoul_6_hallo,"Takže souhlasíš, že mu odpustíš?",dia_gomezworkersoul_6_hallo_end);
};

func void dia_gomezworkersoul_6_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_End_01_01");	//Takže souhlasíš, že mu odpustíš?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_End_01_02");	//Souhlasím, smrtelníku... (mrtvým hlasem) Gomez má odpuštěno!
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_End_01_03");	//Tak, je nezbytné uklidnit tvou duši, duchu. Jsi připraven?
	GOMEZSOULTALK_6 = TRUE;
	AI_StopProcessInfos(self);
};

