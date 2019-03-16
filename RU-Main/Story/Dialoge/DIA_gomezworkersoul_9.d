
instance DIA_GOMEZWORKERSOUL_9_EXIT(C_Info)
{
	npc = gomezworkersoul_9;
	nr = 999;
	condition = dia_gomezworkersoul_9_exit_condition;
	information = dia_gomezworkersoul_9_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_9_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_9_HALLO(C_Info)
{
	npc = gomezworkersoul_9;
	nr = 1;
	condition = dia_gomezworkersoul_9_hallo_condition;
	information = dia_gomezworkersoul_9_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_9_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_9 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_9_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_01_00");	//(мертвым голосом) ЧТО ТЫ ИЩЕТ ТУТ? РАЗВЕ МЕРТВЫЕ В ОТВЕТЕ ПЕРЕД ЖИВЫМИ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_01");	//Нет. Но мертвые в ответе перед мертвыми.
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_01_02");	//О КОМ ТЫ ГОВОРИШЬ, СМЕРТНЫЙ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_03");	//Душа бывшего рудного барона Гомеза в ответе перед тобой, призрак.
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_04");	//И этот ответ подразумевает под собой твое освобождение.
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_01_05");	//Правда, только в том случае, если ты даруешь его душе свое прощение.
	Info_ClearChoices(dia_gomezworkersoul_9_hallo);
	Info_AddChoice(dia_gomezworkersoul_9_hallo,"Так ты даешь ему свое прощение?",dia_gomezworkersoul_9_hallo_end);
};

func void dia_gomezworkersoul_9_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_End_01_01");	//Так ты даешь ему свое прощение?
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_End_01_02");	//Хорошо, смертный. Если это дарует мне свободу, я прощаю душу Гомеза...
	AI_Output(other,self,"DIA_GomezWorkerSoul_9_HALLO_End_01_03");	//Отлично! Тогда я позабочусь о том, чтобы твоя душа более не испытывала ужасных страданий и обрела покой.
	AI_Output(self,other,"DIA_GomezWorkerSoul_9_HALLO_End_01_04");	//Аргххх...
	GOMEZSOULTALK_9 = TRUE;
	AI_StopProcessInfos(self);
};

