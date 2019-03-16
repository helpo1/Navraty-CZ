
instance DIA_GOMEZWORKERSOUL_8_EXIT(C_Info)
{
	npc = gomezworkersoul_8;
	nr = 999;
	condition = dia_gomezworkersoul_8_exit_condition;
	information = dia_gomezworkersoul_8_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_8_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_8_HALLO(C_Info)
{
	npc = gomezworkersoul_8;
	nr = 1;
	condition = dia_gomezworkersoul_8_hallo_condition;
	information = dia_gomezworkersoul_8_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_8_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_8 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_8_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_01_00");	//(мертвым голосом) ЧЕЛОВЕК, ЗАЧЕМ ТЫ ЗДЕСЬ? РАЗВЕ ТВОЕ МЕСТО СРЕДИ МЕРТВЫХ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_02");	//Одна душа ищет твоего прощения, призрак, и я пришел, чтобы получить его от тебя.
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_01_03");	//Мое прощение? Кого я должен простить и за что?
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_04");	//Того, кто проклял тебя и обрек на пребывание в качестве нежити.
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_01_05");	//Я понял, о ком ты говоришь, смертный. Но почему я должен простить его?
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_06");	//Потому что только так я смогу снять с тебя это проклятие!
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_01_07");	//И это единственный способ даровать тебе свободу.
	Info_ClearChoices(dia_gomezworkersoul_8_hallo);
	Info_AddChoice(dia_gomezworkersoul_8_hallo,"Ты согласен?",dia_gomezworkersoul_8_hallo_end);
};

func void dia_gomezworkersoul_8_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_End_01_01");	//Ну, что скажешь, - ты согласен?
	AI_Output(self,other,"DIA_GomezWorkerSoul_8_HALLO_End_01_02");	//Хорошо. Я дарую ему свое прощение...
	AI_Output(other,self,"DIA_GomezWorkerSoul_8_HALLO_End_01_03");	//Отлично. А теперь я убью тебя и навсегда успокою твою душу!
	GOMEZSOULTALK_8 = TRUE;
	AI_StopProcessInfos(self);
};

