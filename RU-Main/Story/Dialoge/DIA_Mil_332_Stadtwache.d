
instance DIA_Mil_332_Stadtwache_EXIT(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 999;
	condition = DIA_Mil_332_Stadtwache_EXIT_Condition;
	information = DIA_Mil_332_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_332_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_332_STADTWACHE_TOARMSCITYGATE(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 1;
	condition = dia_mil_332_stadtwache_toarmscitygate_condition;
	information = dia_mil_332_stadtwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_332_stadtwache_toarmscitygate_condition()
{
	if((TOARMSCITYGATE == TRUE) && (CITYGATEACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_332_stadtwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSCITYGATE = FALSE;
};


instance DIA_Mil_332_Stadtwache_PERM(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 1;
	condition = DIA_Mil_332_Stadtwache_PERM_Condition;
	information = DIA_Mil_332_Stadtwache_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Mil_332_Stadtwache_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_332_Stadtwache_PERM_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Mil_332_Stadtwache_PERM_04_01");	//Проходи! Я на посту!
	AI_StopProcessInfos(self);
};


//----------------------------------------дезертиры-----------------------------------------------


instance DIA_Mil_3320_Stadtwache_EXIT(C_Info)
{
	npc = Mil_3320_Stadtwache;
	nr = 999;
	condition = DIA_Mil_3320_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3320_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3320_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3320_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3321_Stadtwache_EXIT(C_Info)
{
	npc = Mil_3321_Stadtwache;
	nr = 999;
	condition = DIA_Mil_3321_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3321_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3321_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3321_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3322_Stadtwache_EXIT(C_Info)
{
	npc = Mil_3322_Stadtwache;
	nr = 999;
	condition = DIA_Mil_3322_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3322_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3322_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3322_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3321_Stadtwache_FUCKOFF(C_Info)
{
	npc = Mil_3321_Stadtwache;
	nr = 10;
	condition = DIA_Mil_3321_Stadtwache_FUCKOFF_condition;
	information = DIA_Mil_3321_Stadtwache_FUCKOFF_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_3321_Stadtwache_FUCKOFF_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_3321_Stadtwache_FUCKOFF_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Mil_3322_Stadtwache_FUCKOFF(C_Info)
{
	npc = Mil_3322_Stadtwache;
	nr = 10;
	condition = DIA_Mil_3322_Stadtwache_FUCKOFF_condition;
	information = DIA_Mil_3322_Stadtwache_FUCKOFF_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_3322_Stadtwache_FUCKOFF_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_3322_Stadtwache_FUCKOFF_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Mil_3320_Stadtwache_Run(C_Info)
{
	npc = Mil_3320_Stadtwache;
	nr = 1;
	condition = DIA_Mil_3320_Stadtwache_Run_condition;
	information = DIA_Mil_3320_Stadtwache_Run_info;
	permanent = FALSE;
	description = "Эй, вы что тут делаете?";
};

func int DIA_Mil_3320_Stadtwache_Run_condition()
{
	if(MIS_DeadHead == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mil_3320_Stadtwache_Run_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_00");	//Эй, вы что тут делаете?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_01");	//Эмм...(замялся) Просто у нас есть приказ вернутся обратно в Хоринис.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_02");	//Чей приказ?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_03");	//Ну...(задумавшись) Его отдал нам... лорд Андрэ. Да, он самый.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_04");	//Но лорд Андрэ сейчас в Хоринисе. Ты что, за дурака меня держишь?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_05");	//Да нет, что ты... я... просто перепутал... конечно, это был не лорд Андрэ!
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_06");	//А знаешь, обычно подобные приказы должны сопровождаться письменными документами. Они у вас есть?
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_08");	//Слушай, приятель...(нервно) Шел бы ты уже своей дорогой, и не лез в чужие дела.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_09");	//Тогда мне придется сообщить о вас паладинам.
	AI_Output(other,self,"DIA_Mil_3320_Stadtwache_Run_01_10");	//А то вдруг вы на самом деле обычные дезертиры.
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_11");	//Эх, парень! А ведь я просил тебя не лезть на рожон.
	AI_Output(self,other,"DIA_Mil_3320_Stadtwache_Run_01_12");	//Извини, но ты сам напросился!
	B_LogEntry(TOPIC_DeadHead,"Недалеко от прохода в Хоринис я встретил трех ополченцев. Похоже, что они дезертиры. Однако вряд ли они теперь отпустят меня живым, иначе я смогу донести на них паладинам.");
	Info_ClearChoices(DIA_Mil_3320_Stadtwache_Run);
	Info_AddChoice(DIA_Mil_3320_Stadtwache_Run,Dialog_Ende,DIA_Mil_3320_Stadtwache_Run_End);
};

func void DIA_Mil_3320_Stadtwache_Run_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Mil_3321_Stadtwache.aivar[AIV_EnemyOverride] = FALSE;
	Mil_3322_Stadtwache.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_KILL,0);
};