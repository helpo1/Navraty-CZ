
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
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_00");	//(мертвым голосом) СМЕРТНЫЙ?! ЧТО ПРИВЕЛО ТЕБЯ СЮДА?
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_01");	//Я хочу тебе помочь, призрак.
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_02");	//ТЫ НЕ В СИЛАХ МНЕ ПОМОЧЬ, ЧЕЛОВЕК...
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_03");	//Ты ошибаешься! Но сначала мне нужно, чтобы ты дал свое прощение душе рудного барона Гомеза.
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_08");	//Только после этого я смогу тебе помочь. Не раньше!
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_09");	//Ты хочешь, чтобы я простил того, по чьей вине я был проклят?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_01_10");	//Просто сделай это - и я помогу тебе избавиться от твоего проклятия.
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_11");	//Хммм...(задумчиво)
	Info_ClearChoices(dia_gomezworkersoul_3_hallo);
	Info_AddChoice(dia_gomezworkersoul_3_hallo,"Так ты даешь свое прощение Гомезу?",dia_gomezworkersoul_3_hallo_end);
};

func void dia_gomezworkersoul_3_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_End_01_01");	//Так ты даешь свое прощение Гомезу?
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_End_01_02");	//Хорошо...(мертвым голосом) Я прощаю Гомеза за все то, что он сотворил с нами.
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_End_01_03");	//Вот видишь? Это было совсем не сложно.
	AI_Output(other,self,"DIA_GomezWorkerSoul_3_HALLO_End_01_04");	//А теперь приготовься обрести долгожданный покой.
	GOMEZSOULTALK_3 = TRUE;
	AI_StopProcessInfos(self);
};

