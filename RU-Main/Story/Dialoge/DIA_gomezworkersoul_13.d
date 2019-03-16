
instance DIA_GOMEZWORKERSOUL_133_EXIT(C_Info)
{
	npc = gomezworkersoul_13;
	nr = 999;
	condition = dia_gomezworkersoul_13_exit_condition;
	information = dia_gomezworkersoul_13_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_13_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_13_HALLO(C_Info)
{
	npc = gomezworkersoul_13;
	nr = 1;
	condition = dia_gomezworkersoul_13_hallo_condition;
	information = dia_gomezworkersoul_13_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_13_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_13 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_13_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_00");	//КТО ТЫ, ЧЕЛОВЕК? ТЫ НЕ ПОХОЖ НА МЕРТВОГО.
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_01");	//Ты прав, призрак. В отличии от тебя, я жив.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_02");	//ТОГДА ЧТО ТЫ ДЕЛАЕШЬ ЗДЕСЬ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_05");	//Я хочу помочь твоей душе обрести долгожданный покой.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_06");	//НЕУЖЕЛИ ТЫ ПРИШЕЛ ИМЕННО ЗА ЭТИМ? Аргххх!
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_07");	//Не только. Еще мне нужно, чтобы ты сделал кое-что для меня.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_08");	//И что же ты хочешь, чтобы я сделал, человек?
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_01_09");	//Ты должен дать свое прощение душе Гомеза.
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_01_10");	//ГОМЕЗ?! (мертвый вздох) Если ты просишь об этом, видимо, рудного барона постигло то же самое проклятие, что и всех нас.
	Info_ClearChoices(dia_gomezworkersoul_13_hallo);
	Info_AddChoice(dia_gomezworkersoul_13_hallo,"Ты принимаешь мое предложение?",dia_gomezworkersoul_13_hallo_end);
};

func void dia_gomezworkersoul_13_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_End_01_01");	//Ты принимаешь мое предложение?
	AI_Output(self,other,"DIA_GomezWorkerSoul_13_HALLO_End_01_02");	//Аргххх... Хорошо, я принимаю твое предложение. Он прощен мною.
	AI_Output(other,self,"DIA_GomezWorkerSoul_13_HALLO_End_01_03");	//Отлично! Теперь настало время позаботиться и о твоей душе.
	GOMEZSOULTALK_13 = TRUE;
	AI_StopProcessInfos(self);
};

