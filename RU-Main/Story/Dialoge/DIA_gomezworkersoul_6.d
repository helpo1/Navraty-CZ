
instance DIA_GOMEZWORKERSOUL_6_EXIT(C_Info)
{
	npc = gomezworkersoul_6;
	nr = 999;
	condition = dia_gomezworkersoul_6_exit_condition;
	information = dia_gomezworkersoul_6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_6_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_6_HALLO(C_Info)
{
	npc = gomezworkersoul_6;
	nr = 1;
	condition = dia_gomezworkersoul_6_hallo_condition;
	information = dia_gomezworkersoul_6_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_6_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_6 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_6_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_00");	//(мертвым голосом) КТО БЕСПОКОИТ МЕНЯ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_01");	//Я хочу помочь тебе.
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_02");	//ХА ХА ХА! КАК ТЫ МОЖЕШЬ ПОМОЧЬ МНЕ, СМЕРТНЫЙ? МНЕ НИКТО НЕ В СИЛАХ ПОМОЧЬ!
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_03");	//А я помогу! Но это возможно только при одном условии...
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_04");	//ЧТО ЭТО ЗА УСЛОВИЕ?
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_05");	//Ты дашь свое прощение душе того человека, который проклял вас. А именно рудному барону Гомезу.
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_01_06");	//И только после этого я смогу снять с тебя твое проклятие!
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_01_08");	//Я устал от мучительной боли и ужасных страданий и пойду на все, чтобы избавиться от них навсегда.
	Info_ClearChoices(dia_gomezworkersoul_6_hallo);
	Info_AddChoice(dia_gomezworkersoul_6_hallo,"Так ты согласен дать ему свое прощение?",dia_gomezworkersoul_6_hallo_end);
};

func void dia_gomezworkersoul_6_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_End_01_01");	//Так ты согласен дать ему свое прощение?
	AI_Output(self,other,"DIA_GomezWorkerSoul_6_HALLO_End_01_02");	//Я согласен, смертный... Гомез будет прощен!
	AI_Output(other,self,"DIA_GomezWorkerSoul_6_HALLO_End_01_03");	//Что ж, тогда осталось только упокоить твою душу, призрак.
	GOMEZSOULTALK_6 = TRUE;
	AI_StopProcessInfos(self);
};

