instance DIA_Ass_178_Prior_ArchDemon_EXIT(C_Info)
{
	npc = Ass_178_Prior_ArchDemon;
	nr = 999;
	condition = DIA_Ass_178_Prior_ArchDemon_exit_condition;
	information = DIA_Ass_178_Prior_ArchDemon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_178_Prior_ArchDemon_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_178_Prior_ArchDemon_exit_info()
{
	AI_StopProcessInfos(self);
};

var int GonsHere;

instance DIA_Ass_178_Prior_ArchDemon_Hello(C_Info)
{
	npc = Ass_178_Prior_ArchDemon;
	nr = 1;
	condition = DIA_Ass_178_Prior_ArchDemon_hello_condition;
	information = DIA_Ass_178_Prior_ArchDemon_hello_info;
	permanent = FALSE;
	important= TRUE;
};
	
func int DIA_Ass_178_Prior_ArchDemon_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_178_Prior_ArchDemon_hello_info()
{
	if((GonsalesPW_Up == TRUE) && (GonsalesIsDead == FALSE))
	{
		Npc_ExchangeRoutine(NONE_1190_Assasin,"Temple");
		AI_Teleport(NONE_1190_Assasin,"PW_OUT_TO_IN_CHAMBERS");
		Wld_SendTrigger("EVT_CAM_02");
		GonsHere = TRUE;
		AI_Wait(self,20);
	};

	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_00");	//Итак, ты все-таки смог добраться до этого места. Что же, тем хуже для тебя.
	AI_Output(other,self,"DIA_Ass_178_Prior_ArchDemon_hello_01_01");	//Тебе от меня не скрыться.
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_02");	//Ты, видимо, глупец, раз с таким упорством ищещь своей смерти.
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_03");	//Правда, повелитель упоминал о том, что когда-то ты был великим воином, сразившим очень могучего демона.
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_04");	//Но в этот раз тебе не победить. Ибо со мной сила и могущество самого Белиара!

	if(GonsHere == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_05");	//А-ха. Я смотрю и твой друг Гонсалес тоже тут.
		AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_06");	//Это жалкое ничтожество тебе не поможет!
		AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_07");	//Он умрет вместе с тобой, за то что когда-то предал наше Братство!
	};
	if(MIS_RebelsWeapon == LOG_RUNNING)
	{
		MIS_RebelsWeapon = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RebelsWeapon);
	};

	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_08");	//Но хватит болтать. Во имя Белиара!
	Info_ClearChoices(DIA_Ass_178_Prior_ArchDemon_hello);
	Info_AddChoice(DIA_Ass_178_Prior_ArchDemon_hello,Dialog_Ende,DIA_Ass_178_Prior_ArchDemon_hello_Exit);
};

func void DIA_Ass_178_Prior_ArchDemon_hello_Exit()
{
	var C_Npc Gonsales;

	Gonsales = Hlp_GetNpc(NONE_1190_Assasin);
	Gonsales.attribute[ATR_HITPOINTS] = Gonsales.attribute[ATR_HITPOINTS_MAX];
	Gonsales.aivar[AIV_PARTYMEMBER] = TRUE;
	PlayerIsPrioratFake = TRUE;
	HaniarOrderKill = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(Gonsales,self,AR_KILL,1);
};
