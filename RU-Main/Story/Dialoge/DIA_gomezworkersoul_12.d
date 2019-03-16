
instance DIA_GOMEZWORKERSOUL_122_EXIT(C_Info)
{
	npc = gomezworkersoul_12;
	nr = 999;
	condition = dia_gomezworkersoul_12_exit_condition;
	information = dia_gomezworkersoul_12_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_12_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_12_HALLO(C_Info)
{
	npc = gomezworkersoul_12;
	nr = 1;
	condition = dia_gomezworkersoul_12_hallo_condition;
	information = dia_gomezworkersoul_12_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_12_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_12 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_12_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_00");	//(мертвым голосом) ЗАЧЕМ ТЫ ТРЕВОЖИШЬ МЕРТВЫХ, ЧЕЛОВЕК? ЧТО ТЕБЕ НУЖНО?
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_02");	//Я помогу тебе упокоить твою проклятую душу. Ведь ты этого хочешь?
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_03");	//Ты догадлив, человек. За это я готов отдать все то немногое, что у меня есть.
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_04");	//Мне от тебя ничего не надо, кроме твоего прощения такой же проклятой, как и ты, душе.
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_05");	//Чья душа нуждается в моем прощении?
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_06");	//Душа рудного барона Гомеза! Думаю, тебе должно быть знакомо это имя.
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_01_07");	//Оно знакомо всем, кто находится здесь, человек...(мертвый вздох) Это имя никто и никогда не забудет!
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_01_10");	//Эта цена твоей свободы, призрак.
	Info_ClearChoices(dia_gomezworkersoul_12_hallo);
	Info_AddChoice(dia_gomezworkersoul_12_hallo,"Так ты прощаешь его душу?",dia_gomezworkersoul_12_hallo_end);
};

func void dia_gomezworkersoul_12_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_End_01_01");	//Так ты прощаешь его душу?
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_End_01_02");	//Да... Его душа получит мое прощение.
	AI_Output(other,self,"DIA_GomezWorkerSoul_12_HALLO_End_01_03");	//Это все, что мне было нужно от тебя.
	AI_Output(self,other,"DIA_GomezWorkerSoul_12_HALLO_End_01_04");	//Аргххх... Теперь освободи меня!
	GOMEZSOULTALK_12 = TRUE;
	AI_StopProcessInfos(self);
};

