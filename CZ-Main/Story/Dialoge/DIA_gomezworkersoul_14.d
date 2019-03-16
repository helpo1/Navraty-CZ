
instance DIA_GOMEZWORKERSOUL_144_EXIT(C_Info)
{
	npc = gomezworkersoul_14;
	nr = 999;
	condition = dia_gomezworkersoul_14_exit_condition;
	information = dia_gomezworkersoul_14_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_14_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_14_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_14_HALLO(C_Info)
{
	npc = gomezworkersoul_14;
	nr = 1;
	condition = dia_gomezworkersoul_14_hallo_condition;
	information = dia_gomezworkersoul_14_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_14_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_14 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_14_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_01_00");	//Smrtelníku, proč mě vyrušuješ?!... (mrtvým hlasem) Co hledá živý mezi mrtvými?
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_03");	//Chci ti říct, že jsem tady proto, abych osvobodil tvou duši z kletby která na tebe byla uvalena.
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_07");	//Ale ješte předtím, než ti pomůžu, měl bys pomoct i ty mně s jednou choulostivou záležitostí.
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_01_08");	//Jak ti můžu pomoci, smrtelníku?!... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_09");	//Jednoduše dej odpuštění jedné nepokojné duši, to je všechno.
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_01_10");	//Které duši bych měl odpustit?... (smrtelným hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_11");	//Odpustit rudobaronovi Gomezovi! Tahle jediná věc je nutná ke tvému dlouho očekávanému odpočinku.
	Info_ClearChoices(dia_gomezworkersoul_14_hallo);
	Info_AddChoice(dia_gomezworkersoul_14_hallo,"Souhlasíš s těmito podmínkami?!",dia_gomezworkersoul_14_hallo_end);
};

func void dia_gomezworkersoul_14_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_End_01_01");	//Souhlasíš s těmi podmínkami?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_End_01_02");	//Ano, souhlasím!... (smrtelným hlasem) Dostane mé odpuštení výměnou za mé očistění.
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_End_01_03");	//Je ujednáno! Teď najdeš věčný klid, duchu.
	GOMEZSOULTALK_14 = TRUE;
	AI_StopProcessInfos(self);
};

