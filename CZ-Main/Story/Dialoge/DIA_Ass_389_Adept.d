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
	AI_Output(self,other,"DIA_Ass_389_Adept_hello_01_01");	//Hej, bratře. Poslal nás mistr Osair.
	AI_Output(self,other,"DIA_Ass_389_Adept_hello_01_02");	//Jdi za ním a potvrď mu, že důl je nyní pod ochranou.
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Dočkal jsem se lidí od mistra Osaira. Všichni otroci jsou živí. Můžu se vrátit zpět k mistrovi se zprávou.");
	self.npcType = NPCTYPE_AMBIENT;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_388_Adept,"GuardShaht");
	Npc_ExchangeRoutine(Ass_389_Adept,"GuardShaht");
	Npc_ExchangeRoutine(Ass_390_Adept,"GuardShaht");
};