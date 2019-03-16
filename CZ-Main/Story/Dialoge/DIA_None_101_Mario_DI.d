
instance DIA_NONE_101_MARIO_DI_EXIT(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 999;
	condition = DIA_NONE_101_MARIO_DI_EXIT_Condition;
	information = DIA_NONE_101_MARIO_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_101_MARIO_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_101_MARIO_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_DI_Job(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_Job_Condition;
	information = DIA_NONE_101_MARIO_DI_Job_Info;
	permanent = TRUE;
	description = "Máš jedinečnou příležitost dokázat své schopnosti v boji.";
};


func int DIA_NONE_101_MARIO_DI_Job_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (ORkSturmDI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_Job_Info()
{
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_00");	//Máš jedinečnou příležitost dokázat své schopnosti v boji.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_01");	//Pomalu. Všechno má svůj čas.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_02");	//Hmm. Přesně to jsem od tebe čekal.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_03");	//Jen počkej.
};

instance DIA_NONE_101_MARIO_DI_ambush(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_ambush_Condition;
	information = DIA_NONE_101_MARIO_DI_ambush_Info;
	important = TRUE;
};


func int DIA_NONE_101_MARIO_DI_ambush_Condition()
{
	if(ORkSturmDI == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_ambush_Info()
{
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_00");	//Pojď blíž. Tak, příteli. Teď mi ukaž, co máš.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_ambush_15_01");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_02");	//Je to prosté. Pán tě už má dost.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_03");	//Měl jsem tě zabít už dřív. Ale já a mí přátelé tu chybu hned napravíme.
	Info_ClearChoices(DIA_NONE_101_MARIO_DI_ambush);
	Info_AddChoice(DIA_NONE_101_MARIO_DI_ambush,Dialog_Ende,DIA_NONE_101_MARIO_DI_ambush_ambush);
	B_GivePlayerXP(XP_Mario_Ambush);
	MIS_Mario_Ambush = LOG_SUCCESS;
};

func void DIA_NONE_101_MARIO_DI_ambush_ambush()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	Skeleton_Mario1.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario2.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario3.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario4.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_MARIO_DI_PICKPOCKET(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 900;
	condition = DIA_MARIO_DI_PICKPOCKET_Condition;
	information = DIA_MARIO_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_MARIO_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(71,110);
};

func void DIA_MARIO_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
	Info_AddChoice(dia_mario_di_pickpocket,Dialog_Back,dia_mario_di_pickpocket_back);
	Info_AddChoice(dia_mario_di_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_DI_PICKPOCKET_DoIt);
};

func void DIA_MARIO_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_di_pickpocket);
};

func void dia_mario_di_pickpocket_back()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
};

