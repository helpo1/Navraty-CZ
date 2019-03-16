
instance DIA_Sonja_EXIT(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 999;
	condition = DIA_Sonja_EXIT_Condition;
	information = DIA_Sonja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sonja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sonja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sonja_PICKPOCKET(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 900;
	condition = DIA_Sonja_PICKPOCKET_Condition;
	information = DIA_Sonja_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sonja_PICKPOCKET_Condition()
{
	return C_Beklauen(58,70);
};

func void DIA_Sonja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
	Info_AddChoice(DIA_Sonja_PICKPOCKET,Dialog_Back,DIA_Sonja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sonja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sonja_PICKPOCKET_DoIt);
};

func void DIA_Sonja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

func void DIA_Sonja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

instance DIA_Sonja_STANDARD(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_STANDARD_Condition;
	information = DIA_Sonja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Sonja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Andre_REDLIGHT != LOG_Running) && (SonyaGoWithMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_STANDARD_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_00");	//Если хочешь развлечься, поговори с Бромором.
	}
	else if((other.guild == GIL_DJG) && (Sonja_Says == FALSE))
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_01");	//У таких парней как ты одна проблема - вас больше интересуют орки, чем мы.
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_02");	//Если ты хочешь поговорить, иди, найди себе женщину, и женись на ней.
	};

	AI_StopProcessInfos(self);
};

instance DIA_Sonja_GoToSkip(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_GoToSkip_Condition;
	information = DIA_Sonja_GoToSkip_Info;
	permanent = FALSE;
	description = "Пошли со мной.";
};

func int DIA_Sonja_GoToSkip_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaGoWithMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_GoToSkip_Info()
{
	AI_Output(other,self,"DIA_Sonja_GoToSkip_01_01");	//Пошли со мной.
	AI_Output(self,other,"DIA_Sonja_GoToSkip_01_02");	//Хорошо! Как скажешь...
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowPlayer");
};

instance DIA_Sonja_ArriveSkip(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_ArriveSkip_Condition;
	information = DIA_Sonja_ArriveSkip_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sonja_ArriveSkip_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SkipGetWoman == TRUE) && (SonyaJobDone == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_PIRATESCAMP_04") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Sonja_ArriveSkip_Info()
{
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_01");	//Это что, и есть мой клиент?!
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_02");	//Ну да, как видишь.
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_03");	//Хммм...(удивленно) Но он же пират!
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_04");	//А ты что, никогда пиратов не обслуживала?
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_05");	//Ну, почему же...(улыбаясь) Приходилось, конечно.
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_06");	//Тогда лучше займись делом! А то вон у него рожа какая красная. Видишь, как его скрючило?
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_07");	//Надо подлечить человека! Помочь расслабиться, так сказать, спустить пар. 
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_08");	//Не волнуйся! Я все сделаю в лучшем виде.
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_09");	//Только не забудь потом забрать меня отсюда. Хорошо?
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_10");	//Само собой.
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_11");	//Ну, тогда я пошла. (Скипу)...эй, красавчик!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	SonyaJob = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DanceSkip");
};

instance DIA_Sonja_DoBlowJob(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_DoBlowJob_Condition;
	information = DIA_Sonja_DoBlowJob_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Sonja_DoBlowJob_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_WomanForSkip == LOG_Running) && (SonyaJob == TRUE) && (SonyaJobDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_DoBlowJob_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_Sonja_DoBlowJobDone(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_DoBlowJobDone_Condition;
	information = DIA_Sonja_DoBlowJobDone_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Sonja_DoBlowJobDone_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaJobDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_DoBlowJobDone_Info()
{
	AI_Output(self,other,"DIA_Sonja_DoBlowJobDone_01_01");	//Думаю, мне уже пора возвращаться к Бромору.
	AI_Output(self,other,"DIA_Sonja_DoBlowJobDone_01_02");	//Ты отведешь меня к нему?
	AI_Output(other,self,"DIA_Sonja_DoBlowJobDone_01_03");	//Хорошо! Пойдем.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowPlayerBack");
};


instance DIA_Sonja_ArriveBromor(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_ArriveBromor_Condition;
	information = DIA_Sonja_ArriveBromor_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sonja_ArriveBromor_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaJobDone == TRUE) && (Npc_GetDistToWP(self,"NW_PUFF_DANCE") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Sonja_ArriveBromor_Info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	AI_Output(self,other,"DIA_Sonja_ArriveBromor_01_01");	//Хорошо! Мы на месте.
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(SonyaGoWithMeDay >= (daynow - 3))
	{
		SonyaBackOk = TRUE;
	}
	else
	{
		SonyaBackOkNot = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};