
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
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_00");	//(мертвым голосом) ЧЕЛОВЕК? ЗАЧЕМ ТЫ ПРИШЕЛ СЮДА?
	AI_Output(other,self,"DIA_GomezWorkerSoul_10_HALLO_01_01");	//Я тут по поручению Гомеза, чтобы навеки упокоить твою душу.
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_02");	//Аргххх...
	AI_Output(other,self,"DIA_GomezWorkerSoul_10_HALLO_01_05");	//Но перед тем как я освобожу твою душу от проклятия, мне нужно, чтобы ты даровал свое прощение душе рудного барона.
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_08");	//Ха ха ха...
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_01_09");	//Значит, этот Гомез все-таки поплатился за свои злодеяния и его душа была также проклята богами.
	Info_ClearChoices(dia_gomezworkersoul_10_hallo);
	Info_AddChoice(dia_gomezworkersoul_10_hallo,"Так ты дашь ему это прощение?",dia_gomezworkersoul_10_hallo_end);
};

func void dia_gomezworkersoul_10_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_10_HALLO_End_01_01");	//Так ты дашь ему это прощение?
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_End_01_02");	//Хорошо... Считай, что он прощен.
	AI_Output(self,other,"DIA_GomezWorkerSoul_10_HALLO_End_01_03");	//А теперь - освободи мою душу! Аргххх...
	GOMEZSOULTALK_10 = TRUE;
	AI_StopProcessInfos(self);
};

