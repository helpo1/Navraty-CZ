
instance DIA_GOMEZWORKERSOUL_100_EXIT(C_Info)
{
	npc = gomezworkersoul_10;
	nr = 999;
	condition = dia_gomezworkersoul_10_exit_condition;
	information = dia_gomezworkersoul_10_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_10_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_10_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_10_HALLO(C_Info)
{
	npc = gomezworkersoul_10;
	nr = 1;
	condition = dia_gomezworkersoul_10_hallo_condition;
	information = dia_gomezworkersoul_10_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_10_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_10 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_10_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_00");	//Člověče?!... PROČ jsi sem přišel?... (mrtvým hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_10_HALLO_01_01");	//Jsem tady jménem Gomeze, abych navěky uklidnil tvou duši.
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_02");	//Aargh!... (smrtelným hlasem) Konečně!
	AI_Output(other,self,"DIA_GomezWorkerSoul_10_HALLO_01_05");	//Ale předtím, než osvobodím tvou duši ze zapomnění - měl bys pro mě něco udělat.
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_08");	//Ha, ha, ha... (mrtvým hlasem)
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_09");	//To znamená, že Gomez za své zlé skutky byl taky prokletý od bohů.
	Info_ClearChoices(dia_gomezworkersoul_10_hallo);
	Info_AddChoice(dia_gomezworkersoul_10_hallo,"Takže mu odpouštíš?",dia_gomezworkersoul_10_hallo_end);
};

func void dia_gomezworkersoul_10_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_10_HALLO_End_01_01");	//Takže mu odpouštíš?
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_End_01_02");	//Dobře!... (mrtvým hlasem) Považuj to tak, že mu je odpuštěno.
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_End_01_03");	//A teď - osvoboď mou duši! Aargh!... (smrtelným hlasem)
	GOMEZSOULTALK_10 = TRUE;
	AI_StopProcessInfos(self);
};

