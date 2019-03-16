instance DIA_Ass_389_Adept_EXIT(C_Info)
{
	npc = Ass_389_Adept;
	nr = 999;
	condition = DIA_Ass_389_Adept_exit_condition;
	information = DIA_Ass_389_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_389_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_389_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_389_Adept_Hello(C_Info)
{
	npc = Ass_389_Adept;
	nr = 1;
	condition = DIA_Ass_389_Adept_hello_condition;
	information = DIA_Ass_389_Adept_hello_info;
	permanent = FALSE;
	important = TRUE;
};
	
func int DIA_Ass_389_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_389_Adept_hello_info()
{
	AI_Output(self,other,"DIA_Ass_389_Adept_hello_01_01");	//Эй, брат. Нас прислал приор Осаир.
	AI_Output(self,other,"DIA_Ass_389_Adept_hello_01_02");	//Отправляйся к нему и доложи, что шахта теперь под охраной.
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Я дождался людей Осаира. Все рабы целы, и можно отправляться обратно к приору с докладом.");
	self.npcType = NPCTYPE_AMBIENT;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_388_Adept,"GuardShaht");
	Npc_ExchangeRoutine(Ass_389_Adept,"GuardShaht");
	Npc_ExchangeRoutine(Ass_390_Adept,"GuardShaht");
};