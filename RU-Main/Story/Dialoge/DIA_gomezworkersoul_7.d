
instance DIA_GOMEZWORKERSOUL_7_EXIT(C_Info)
{
	npc = gomezworkersoul_7;
	nr = 999;
	condition = dia_gomezworkersoul_7_exit_condition;
	information = dia_gomezworkersoul_7_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_7_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_7_HALLO(C_Info)
{
	npc = gomezworkersoul_7;
	nr = 1;
	condition = dia_gomezworkersoul_7_hallo_condition;
	information = dia_gomezworkersoul_7_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_7_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_7 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_7_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_01_00");	//(мертвым голосом) ЧТО ПРИВЕЛО ТЕБЯ СЮДА, СМЕРТНЫЙ? ЗАЧЕМ ТЫ ТРЕВОЖИШЬ ПОКОЙ МЕРТВЫХ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_01_01");	//Меня прислал сюда Гомез.
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_01_02");	//Проклинатель?! Аргххх!.. Что он хочет от меня?
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_01_03");	//Чтобы ты простил его. В обмен на это я сниму с тебя его проклятие.
	Info_ClearChoices(dia_gomezworkersoul_7_hallo);
	Info_AddChoice(dia_gomezworkersoul_7_hallo,"Ты дашь свое прощение Гомезу?",dia_gomezworkersoul_7_hallo_end);
};

func void dia_gomezworkersoul_7_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_End_01_01");	//Ты дашь свое прощение Гомезу?
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_End_01_02");	//Тот, кто проклял меня, получит мое прощение...
	AI_Output(other,self,"DIA_GomezWorkerSoul_7_HALLO_End_01_03");	//Хорошо. Теперь твоя душа наконец-то обретет долгожданный покой.
	AI_Output(self,other,"DIA_GomezWorkerSoul_7_HALLO_End_01_04");	//Аргххх...
	GOMEZSOULTALK_7 = TRUE;
	AI_StopProcessInfos(self);
};

