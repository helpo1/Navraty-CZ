
instance DIA_GOMEZWORKERSOUL_1_EXIT(C_Info)
{
	npc = gomezworkersoul_1;
	nr = 999;
	condition = dia_gomezworkersoul_1_exit_condition;
	information = dia_gomezworkersoul_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_1_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_1_HALLO(C_Info)
{
	npc = gomezworkersoul_1;
	nr = 1;
	condition = dia_gomezworkersoul_1_hallo_condition;
	information = dia_gomezworkersoul_1_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_1_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_1 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_1_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_00");	//(мертвым голосом) ЗАЧЕМ ТЫ БЕСПОКОИШЬ МЕНЯ, ЧЕЛОВЕК? ЧТО ТЕБЕ ОТ МЕНЯ НУЖНО?
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_01_01");	//Я пришел сюда по поручению Гомеза, чтобы упокоить твою душу, призрак.
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_02");	//Ты пришел свободить меня? Аргххх... Неужели моим мукам придет конец?
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_01_04");	//Да, но перед тем как я это сделаю, Гомез хочет, чтобы и ты даровал прощение его душе.
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_05");	//(мертвый вздох) Все мы здесь прокляты только из-за него!
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_01_06");	//И, видимо, его душа также не знает покоя в этом мире.
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_01_07");	//Ты совершенно прав, призрак.
	Info_ClearChoices(dia_gomezworkersoul_1_hallo);
	Info_AddChoice(dia_gomezworkersoul_1_hallo,"Так ты даешь ему свое прощение?",dia_gomezworkersoul_1_hallo_end);
};

func void dia_gomezworkersoul_1_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_1_HALLO_End_01_01");	//Так ты даешь ему свое прощение?
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_End_01_02");	//Хорошо...(мертвым голосом) Я даю ему то, что он просит.
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_End_01_03");	//Поскольку знаю, что значит быть проклятым.
	AI_Output(self,other,"DIA_GomezWorkerSoul_1_HALLO_End_01_04");	//А теперь, человек, - освободи меня! Аргххх...
	GOMEZSOULTALK_1 = TRUE;
	AI_StopProcessInfos(self);
};

