
instance DIA_GOMEZWORKERSOUL_111_EXIT(C_Info)
{
	npc = gomezworkersoul_11;
	nr = 999;
	condition = dia_gomezworkersoul_11_exit_condition;
	information = dia_gomezworkersoul_11_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_11_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_11_HALLO(C_Info)
{
	npc = gomezworkersoul_11;
	nr = 1;
	condition = dia_gomezworkersoul_11_hallo_condition;
	information = dia_gomezworkersoul_11_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_11_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_11 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_11_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_00");	//(мертвым голосом) ЧТО НУЖНО ЗДЕСЬ ТАКОМУ, КАК ТЫ, СМЕРТНЫЙ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_01");	//Это нужно, скорее, не мне, а тебе, призрак!
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_02");	//Ты жаждешь, чтобы кто-нибудь снял с тебя проклятие и упокоил твою душу. Я прав?
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_03");	//ТЫ И ВПРАВДУ ХОЧЕШЬ ОСВОБОДИТЬ МЕНЯ? Аргххх...
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_04");	//Тогда я не буду тебе мешать. Делай то, что задумал!
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_05");	//Не так быстро! Для начала сделай кое-что и для меня.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_06");	//Что ты хочешь?
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_01_07");	//Все, что я прошу тебя сделать, - даровать свое прощение Гомезу.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_09");	//Гомез?! Хммм...(мертвый вздох) Я помню это имя.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_10");	//Даже сейчас, когда я уже мертв, оно внушает мне ужас и страх!
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_11");	//И мне кажется, что таким людям, как Гомез, нет прощения в этом мире.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_01_13");	//Но я уже не в силах больше терпеть эти страдания.
	Info_ClearChoices(dia_gomezworkersoul_11_hallo);
	Info_AddChoice(dia_gomezworkersoul_11_hallo,"Значит ли это, что он прощен тобой?",dia_gomezworkersoul_11_hallo_end);
};

func void dia_gomezworkersoul_11_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_11_HALLO_End_01_01");	//Значит ли это, что он прощен тобой?
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_End_01_02");	//Да... Его душа прощена мною.
	AI_Output(self,other,"DIA_GomezWorkerSoul_11_HALLO_End_01_03");	//Теперь же помоги мне снять мое проклятие! Аргххх...
	GOMEZSOULTALK_11 = TRUE;
	AI_StopProcessInfos(self);
};

