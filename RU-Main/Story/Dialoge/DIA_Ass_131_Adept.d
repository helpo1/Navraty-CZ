instance DIA_Ass_131_Adept_EXIT(C_Info)
{
	npc = Ass_131_Adept;
	nr = 999;
	condition = DIA_Ass_131_Adept_exit_condition;
	information = DIA_Ass_131_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_131_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_131_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_131_Adept_WithSlave(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_WithSlave_Condition;
	information = DIA_Ass_131_Adept_WithSlave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_131_Adept_WithSlave_Condition()
{
	if((PW_WelcomeToHram == TRUE) && (Npc_IsDead(SEK_168_SLAVEOBSSEK) == FALSE) && (SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] == TRUE) && (MeetNrozas == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_WithSlave_Info()
{
	AI_Output(self,other,"DIA_Ass_131_Adept_WithSlave_01_01");	//Почему так долго, послушник?! Мастер Нрозас уже заждался своего нового раба.
	AI_Output(self,other,"DIA_Ass_131_Adept_WithSlave_01_02");	//Немедленно отведи его к нему, если не хочешь познать его гнев!
	PW_AdepdGuardTellInfo = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_131_Adept_NoSlave(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_NoSlave_Condition;
	information = DIA_Ass_131_Adept_NoSlave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_131_Adept_NoSlave_Condition()
{
	if((PW_WelcomeToHram == TRUE) && (Npc_IsDead(SEK_168_SLAVEOBSSEK) == TRUE) && (SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] == FALSE) && (MeetNrozas == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_NoSlave_Info()
{
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_01");	//Что так долго, послушник?!
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_02");	//И почему ты без раба, которого должен был привести мастеру Нрозасу?
	AI_Output(other,self,"DIA_Ass_131_Adept_NoSlave_01_03");	//Эммм... я его потерял.
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_04");	//Что?! (пристально вглядываясь) Что-то мне подсказывает, что ты вовсе не тот, за кого себя выдаешь.
	AI_Output(self,other,"DIA_Ass_131_Adept_NoSlave_01_05");	//...братья, у нас тут непрошеный гость!
	PW_AdepdGuardTellInfo = TRUE;
	AI_StopProcessInfos(self);
	PlayerIsPrioratFakeTemp = TRUE;
};


instance DIA_Ass_131_Adept_NrozasPoisonGift(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_NrozasPoisonGift_Condition;
	information = DIA_Ass_131_Adept_NrozasPoisonGift_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_131_Adept_NrozasPoisonGift_Condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_NrozasPoisonGift_Info()
{
	AI_Output(self,other,"DIA_Ass_131_Adept_NrozasPoisonGift_01_01");	//Брат, тебя срочно хотел видеть приор Ханиар.
	AI_Output(self,other,"DIA_Ass_131_Adept_NrozasPoisonGift_01_02");	//Так что не теряй времени и ступай к нему.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_131_Adept_STANDARD(C_Info)
{
	npc = Ass_131_Adept;
	nr = 2;
	condition = DIA_Ass_131_Adept_STANDARD_Condition;
	information = DIA_Ass_131_Adept_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ass_131_Adept_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PW_AdepdGuardTellInfo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_131_Adept_STANDARD_Info()
{
	var int randy;

	randy = Hlp_Random(4);

	if(PlayerIsAssNow == FALSE)
	{
		PlayerIsPrioratFakeTemp = TRUE;
		AI_Output(self,other,"DIA_ASS_1_STANDARD_01_04");	//Эй! Да ты не из наших людей...
		AI_Output(self,other,"DIA_ASS_1_STANDARD_01_05");	//Тревога! Враг!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_00");	//Лучше уходи! Иначе у обоих будут неприятности...
		};	
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_01");	//Не мешай мне!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_02");	//Уходи отсюда!
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_ASS_1_STANDARD_01_03");	//Не сейчас!
		};
		
		AI_StopProcessInfos(self);
	};
};
