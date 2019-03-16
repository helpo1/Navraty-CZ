
instance DIA_GOMEZWORKERSOUL_5_EXIT(C_Info)
{
	npc = gomezworkersoul_5;
	nr = 999;
	condition = dia_gomezworkersoul_5_exit_condition;
	information = dia_gomezworkersoul_5_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_5_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_5_HALLO(C_Info)
{
	npc = gomezworkersoul_5;
	nr = 1;
	condition = dia_gomezworkersoul_5_hallo_condition;
	information = dia_gomezworkersoul_5_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_5_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_5 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_5_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_01_00");	//(мертвым голосом) КТО ТЫ, ЧЕЛОВЕК? И ЧТО ТЕБЕ НУЖНО?
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_01_01");	//Гомез хочет получить твое прощение за то, что проклял тебя.
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_01_02");	//В обмен на это я помогу тебе снять твое проклятие.
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_01_05");	//Хммм... Мне нужно время, чтобы подумать, смертный, - подумать, правильно ли я поступлю, дав ему свое прощение.
	Info_ClearChoices(dia_gomezworkersoul_5_hallo);
	Info_AddChoice(dia_gomezworkersoul_5_hallo,"У меня мало времени, решай сейчас!",dia_gomezworkersoul_5_hallo_end);
};

func void dia_gomezworkersoul_5_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_End_01_01");	//У меня мало времени, решай сейчас!
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_End_01_02");	//Хорошо, смертный. Считай, что Гомез получил его... Я дарую ему свое прощение.
	AI_Output(other,self,"DIA_GomezWorkerSoul_5_HALLO_End_01_03");	//Хорошо, теперь займемся тобой, призрак. Скоро твои страдания закончатся!
	AI_Output(self,other,"DIA_GomezWorkerSoul_5_HALLO_End_01_04");	//Освободи меня! Аргххх...
	GOMEZSOULTALK_5 = TRUE;
	AI_StopProcessInfos(self);
};

