
instance DIA_GOMEZWORKERSOUL_122_EXIT(C_Info)
{
	npc = gomezworkersoul_12;
	nr = 999;
	condition = dia_gomezworkersoul_12_exit_condition;
	information = dia_gomezworkersoul_12_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_12_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_12_HALLO(C_Info)
{
	npc = gomezworkersoul_12;
	nr = 1;
	condition = dia_gomezworkersoul_12_hallo_condition;
	information = dia_gomezworkersoul_12_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_12_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_12 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_12_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_00");	//Proč vyrušuješ mrtvého, člověče?!... (mrtvým hlasem) Proč tady jsi?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_02");	//Výměnonu za tuhle službu ti pomůžu zbavit tvou duši prokletí. Chceš to?
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_03");	//Jsi vynalézavý, člověče... (a dead voice) Jsem tedy ochotný dát všetko to málo, čo ve mně ostalo.
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_04");	//Od tebe není nic podstatné pro mě, kromě odpuštění pro jednu prokletou duši, stejně jako jsi ty!
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_05");	//Která duša potřebuje mé odpuštění?... (smrtelným hlasem)
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_06");	//Duša rudného barona Gomeze! Myslím, že ho znáš.
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_07");	//Zná ho každý, kdo je tady, člověče... Na tohle jméno nikdo a nikdy nezapomene. Nese smrtelný vzdych!
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_10");	//Tohle je cena za tvou svobodu, duchu - můžeš odmítnout, jestli chceš.
	Info_ClearChoices(dia_gomezworkersoul_12_hallo);
	Info_AddChoice(dia_gomezworkersoul_12_hallo,"Takže mu odpouštíš?!",dia_gomezworkersoul_12_hallo_end);
};

func void dia_gomezworkersoul_12_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_End_01_01");	//Takže mu odpouštíš?
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_End_01_02");	//Ano!... (mrtvým hlasem) Má ode mě odpuštení.
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_End_01_03");	//Tohle všechno pro mě bylo nezbytné od tebe. Jsi připraven jít na věčný odpočinek, duchu?
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_End_01_04");	//Ano, jsem připraven! Aargh!... (smrtelný hlas)
	GOMEZSOULTALK_12 = TRUE;
	AI_StopProcessInfos(self);
};

