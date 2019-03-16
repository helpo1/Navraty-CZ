
instance DIA_GOMEZWORKERSOUL_155_EXIT(C_Info)
{
	npc = gomezworkersoul_15;
	nr = 999;
	condition = dia_gomezworkersoul_15_exit_condition;
	information = dia_gomezworkersoul_15_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_15_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_15_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_15_HALLO(C_Info)
{
	npc = gomezworkersoul_15;
	nr = 1;
	condition = dia_gomezworkersoul_15_hallo_condition;
	information = dia_gomezworkersoul_15_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_15_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_15 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_15_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_00");	//(мертвым голосом) ТЕБЕ НЕ СТОИЛО ПРИХОДИТЬ СЮДА, ЧЕЛОВЕК... ЗДЕСЬ ТЕБЯ ЖДЕТ ТОЛЬКО СМЕРТЬ!
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_01");	//А вот я так не думаю! Скорее, смерть ждет тебя.
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_02");	//ХА ХА ХА... Я ПРОКЛЯТ, И НИКТО НЕ СМОЖЕТ ПОМОЧЬ МНЕ!
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_04");	//Ошибаешься! Как раз за этим я сюда и пришел. Я помогу тебе, призрак!
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_05");	//Аргххх!.. ТЫ ГОВОРИШЬ ПРАВДУ, ЧЕЛОВЕК?
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_06");	//Да, но сперва ты должен оказать мне одну небольшую услугу.
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_07");	//Я слушаю тебя, смертный...
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_08");	//Мне необходимо, чтобы ты дал свое прощение одной проклятой душе. Она раньше принадлежала человеку, которого звали Гомез.
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_01_09");	//Рудный барон?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_01_10");	//Он самый. Просто даруй ему то, о чем я тебя прошу, и я освобожу твою душу от оков твоего проклятия.
	Info_ClearChoices(dia_gomezworkersoul_15_hallo);
	Info_AddChoice(dia_gomezworkersoul_15_hallo,"Так ты даешь ему свое прощение?",dia_gomezworkersoul_15_hallo_end);
};

func void dia_gomezworkersoul_15_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_End_01_01");	//Так ты даешь ему свое прощение?
	AI_Output(self,other,"DIA_GomezWorkerSoul_15_HALLO_End_01_02");	//Хорошо... Гомез получит то, чего хочет.
	AI_Output(other,self,"DIA_GomezWorkerSoul_15_HALLO_End_01_03");	//Отлично! А теперь приготовься умереть, призрак. Твоя свобода совсем рядом!
	GOMEZSOULTALK_15 = TRUE;
	AI_StopProcessInfos(self);
};

