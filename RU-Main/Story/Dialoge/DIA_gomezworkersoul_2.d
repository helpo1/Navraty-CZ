
instance DIA_GOMEZWORKERSOUL_2_EXIT(C_Info)
{
	npc = gomezworkersoul_2;
	nr = 999;
	condition = dia_gomezworkersoul_2_exit_condition;
	information = dia_gomezworkersoul_2_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_2_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_2_HALLO(C_Info)
{
	npc = gomezworkersoul_2;
	nr = 1;
	condition = dia_gomezworkersoul_2_hallo_condition;
	information = dia_gomezworkersoul_2_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_2_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_2 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_2_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_00");	//(мертвым голосом) СМЕРТНЫЙ, ЗАЧЕМ ТЫ ТРЕВОЖИШЬ ПРОКЛЯТУЮ ДУШУ?!
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_01");	//Для того, чтобы избавить ее от этого проклятия. Скоро твоим страданиям придет конец!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_04");	//Аргххх... Наконец-то, как долго я этого ждал!
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_05");	//Однако, перед тем как я освобожу твою душу, ты должен будешь мне помочь.
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_06");	//Что тебе нужно?
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_07");	//Чтобы ты дал свое прощение одной из проклятых душ.
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_08");	//Чью душу я должен простить?
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_09");	//Душу Гомеза, рудного барона, на которого ты работал в свое время.
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_10");	//(мертвый вздох) И ДУШУ ТОГО, ИЗ-ЗА КОГО Я БЫЛ ПРОКЛЯТ БОГАМИ...
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_11");	//ТЕБЕ НЕ КАЖЕТСЯ, ЧТО ТЫ ПРОСИШЬ СЛИШКОМ МНОГО, СМЕРТНЫЙ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_12");	//Не слишком, если учитывать, что на кону стоит твоя собственная свобода.
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_13");	//Или ты хочешь остаться проклятым призраком?
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_14");	//Аргххх! Нет, только не это... Эти страдания - они невыносимы...
	Info_ClearChoices(dia_gomezworkersoul_2_hallo);
	Info_AddChoice(dia_gomezworkersoul_2_hallo,"Тогда просто дай Гомезу свое прощение.",dia_gomezworkersoul_2_hallo_end);
};

func void dia_gomezworkersoul_2_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_End_01_01");	//Тогда просто дай Гомезу свое прощение, и твои страдания тут же прекратятся.
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_End_01_02");	//Хорошо, смертный... будет по-твоему!
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_End_01_03");	//Значит ли это, что Гомез прощен?
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_End_01_04");	//Да... я согласен.
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_End_01_05");	//Хорошо! Теперь я могу позаботиться и о твоей душе, призрак. Умри с миром!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_End_01_06");	//Наконец-то! Аргххх...
	GOMEZSOULTALK_2 = TRUE;
	AI_StopProcessInfos(self);
};

