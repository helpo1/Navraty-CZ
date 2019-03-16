
instance DIA_GOMEZWORKERSOUL_4_EXIT(C_Info)
{
	npc = gomezworkersoul_4;
	nr = 999;
	condition = dia_gomezworkersoul_4_exit_condition;
	information = dia_gomezworkersoul_4_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_4_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_4_HALLO(C_Info)
{
	npc = gomezworkersoul_4;
	nr = 1;
	condition = dia_gomezworkersoul_4_hallo_condition;
	information = dia_gomezworkersoul_4_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_4_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_4 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_4_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_01_00");	//(мертвым голосом) ЗАЧЕМ ТЫ НАРУШИЛ МОЕ УЕДИНЕНИЕ, СМЕРТНЫЙ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_01_01");	//Я пришел сюда по поручению Гомеза. Он хочет, чтобы я помог тебе снять его проклятие.
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_01_02");	//Ты пришел по поручению Гомеза?! Аргххх...
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_01_06");	//Послушай, если ты поможешь мне, я помогу тебе. Ну что, согласен?
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_01_07");	//Я согласен на все, лишь бы обрести покой...
	Info_ClearChoices(dia_gomezworkersoul_4_hallo);
	Info_AddChoice(dia_gomezworkersoul_4_hallo,"Значит, ты прощаешь Гомеза?",dia_gomezworkersoul_4_hallo_end);
};

func void dia_gomezworkersoul_4_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_End_01_01");	//Значит, ты прощаешь Гомеза?
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_End_01_02");	//Проклинающий прощен!.. Этого достаточно?
	AI_Output(other,self,"DIA_GomezWorkerSoul_4_HALLO_End_01_03");	//Вполне. Теперь я помогу тебе, призрак, - как и обещал.
	AI_Output(self,other,"DIA_GomezWorkerSoul_4_HALLO_End_01_04");	//Аргххх... Побыстрей успокой мою душу!
	GOMEZSOULTALK_4 = TRUE;
	AI_StopProcessInfos(self);
};

