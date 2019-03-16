
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
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_01_00");	//(мертвым голосом) СМЕРТНЫЙ, ЗАЧЕМ ТЫ ТРЕВОЖИШЬ МЕНЯ? РАЗВЕ ЖИВЫМ ЕСТЬ ДЕЛО ДО МЕРТВЫХ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_03");	//Я пришел сюда освободить твою душу от наложенного на тебя проклятия.
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_07");	//Только перед тем как я помогу тебе, ты также должен будешь помочь мне в одном простеньком деле.
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_01_08");	//КАК Я МОГУ ПОМОЧЬ ТЕБЕ, СМЕРТНЫЙ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_09");	//Просто дай свое прощение одной неупокоенной душе, вот и все.
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_01_10");	//ЧЬЕЙ ДУШЕ Я ДОЛЖЕН ДАРОВАТЬ ПРОЩЕНИЕ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_01_11");	//Душе рудного барона Гомеза. Это единственное, что от тебя требуется, чтобы обрести долгожданную свободу.
	Info_ClearChoices(dia_gomezworkersoul_14_hallo);
	Info_AddChoice(dia_gomezworkersoul_14_hallo,"Ты согласен на такие условия?",dia_gomezworkersoul_14_hallo_end);
};

func void dia_gomezworkersoul_14_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_End_01_01");	//Ты согласен на такие условия?
	AI_Output(self,other,"DIA_GomezWorkerSoul_14_HALLO_End_01_02");	//Да, я согласен... Он получит мое прощение в обмен на мое освобождение.
	AI_Output(other,self,"DIA_GomezWorkerSoul_14_HALLO_End_01_03");	//Хорошо! Тогда приготовься обрести вечный покой, призрак.
	GOMEZSOULTALK_14 = TRUE;
	AI_StopProcessInfos(self);
};

