
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
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_00");	//Jestli se chceš pobavit, promluv si s Bromorem.
	}
	else if((other.guild == GIL_DJG) && (Sonja_Says == FALSE))
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_01");	//To je problém vás chlapů - radši byste vraždili skřety, než zatloukli hřebík.
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_02");	//A jestli se rád s někým vybavuješ, najdi si babu a ožeň se s ní.
	};

	AI_StopProcessInfos(self);
};

instance DIA_Sonja_GoToSkip(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_GoToSkip_Condition;
	information = DIA_Sonja_GoToSkip_Info;
	permanent = FALSE;
	description = "Pojď se mnou.";
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
	AI_Output(other,self,"DIA_Sonja_GoToSkip_01_01");	//Pojď se mnou.
	AI_Output(self,other,"DIA_Sonja_GoToSkip_01_02");	//Dobře, jak říkáš...
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
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_01");	//Tohle je můj klient?!
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_02");	//Jak vidíš, tak ano.
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_03");	//Vždyť je to pirát!
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_04");	//Co pirátům nedáváš?
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_05");	//No, pokud je to nutné... tak ano.
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_06");	//Tak to by ses měla dát do práce.
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_07");	//Je nezbytné postarat se o muže. Pomoct mu uvolnit se, vypustit páru. 
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_08");	//Žádné strachy! Udělám vše, co bude v mých silách.
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_09");	//Jen mně odsud nezapomeň odvést zpátky.
	AI_Output(other,self,"DIA_Sonja_ArriveSkip_01_10");	//Samozřejmě.
	AI_Output(self,other,"DIA_Sonja_ArriveSkip_01_11");	//Tak já jdu teda na věc... Hej námořníku!
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
	AI_Output(self,other,"DIA_Sonja_DoBlowJobDone_01_01");	//Myslím, že je čas vrátit se za Bromorem.
	AI_Output(self,other,"DIA_Sonja_DoBlowJobDone_01_02");	//Odvedeš mně za ním?
	AI_Output(other,self,"DIA_Sonja_DoBlowJobDone_01_03");	//Jasně! Pojď za mnou.
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

	AI_Output(self,other,"DIA_Sonja_ArriveBromor_01_01");	//Dobře, jsme na místě.
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
