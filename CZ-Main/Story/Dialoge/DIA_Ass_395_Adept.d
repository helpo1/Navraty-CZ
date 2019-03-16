const string Ass_395_CHECKPOINT = "PW_OSAIR_MEET_GUARD_05";

instance DIA_Ass_395_Adept_EXIT(C_Info)
{
	npc = Ass_395_Adept;
	nr = 999;
	condition = dia_Ass_395_Adept_exit_condition;
	information = dia_Ass_395_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_Ass_395_Adept_exit_condition()
{
	return TRUE;
};

func void dia_Ass_395_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_395_Adept_FIRSTWARN(C_Info)
{
	npc = Ass_395_Adept;
	nr = 1;
	condition = dia_Ass_395_Adept_firstwarn_condition;
	information = dia_Ass_395_Adept_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_395_Adept_firstwarn_condition()
{
	if(KnowPlaceMeeting == FALSE)
	{
		return TRUE;
	};
};

func void dia_Ass_395_Adept_firstwarn_info()
{
	AI_Output(self,other,"DIA_Ass_395_Adept_FirstWarn_01_00");	//Stůj, bratře! Dál už jít nesmíš.
	AI_Output(other,self,"DIA_Ass_395_Adept_FirstWarn_01_01");	//A proč?
	AI_Output(self,other,"DIA_Ass_395_Adept_FirstWarn_01_02");	//Příkazy mistra Osaira - nikoho nevpustit do jeskyně.
	AI_Output(self,other,"DIA_Ass_395_Adept_FirstWarn_01_03");	//Tak raději nepokoušej osud a jdi.

	if(MIS_HaniarSecret == LOG_Running)
	{
		B_LogEntry(TOPIC_HaniarSecret,"Osairovi lidé zablokovali vstup do podhorské jeskyně. Určitě pro to mají nějaký důvod. Musím o tom jít říct Gonzalesovi.");
	};

	KnowPlaceMeeting = TRUE;
	AI_StopProcessInfos(self);
};