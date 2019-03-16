
instance DIA_Tengron_EXIT(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 999;
	condition = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tengron_First(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_First_Condition;
	information = DIA_Tengron_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine != LOG_Running) && (MIS_ScoutMine != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_First_Info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//Co tady děláš?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//Jsem tu z rozkazu lorda Hagena.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//Musíš se dostat do hradu! Promluv s Garondem!
};


instance DIA_Tengron_HALLO(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_HALLO_Condition;
	information = DIA_Tengron_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_HALLO_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine == LOG_Running)) || (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HALLO_Info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//Innos s tebou. Přinášíš novinky z hradu?
	if(Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//Nejsem tu, abych přinášel zprávy, ale abych je dostal.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//Tak promluv s Fajethem. Má to tu nastarost. Kdybys ale přecejen měl něco z hradu, dej mi vědět.
	};
};


instance DIA_Tengron_News(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 7;
	condition = DIA_Tengron_News_Condition;
	information = DIA_Tengron_News_Info;
	permanent = FALSE;
	description = "Ohledně zpráv...";
};


func int DIA_Tengron_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//Ohledně zpráv...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//Ano, jaká je situace na hradě?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//Je obléhán skřety a zatím odolal dračímu útoku.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//Doufám, že to chlapy zvládnou.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//Poslouchej... Mám na hradě kamaráda. Jmenuje se Udar. Bojovali jsme spolu mnoho bitev...
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//Prosím, vezmi mu tento prsten. Ať mi ho schová. Vezmu si ho zpět jak se vrátím. Řekni mu to prosím...
	Info_ClearChoices(DIA_Tengron_News);
	Info_AddChoice(DIA_Tengron_News,"Na to nemám čas...",DIA_Tengron_News_No);
	Info_AddChoice(DIA_Tengron_News,"Bez problému...",DIA_Tengron_News_Yes);
};

func void DIA_Tengron_News_No()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//Chápu.
	Info_ClearChoices(DIA_Tengron_News);
};

func void DIA_Tengron_News_Yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//Bez problému. Když se dostanu do hradu, dám mu ho.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//Dobře. Magie prstenu dá Udarovi sílu. Až se vrátím, vezmu si ho.
	B_GiveInvItems(self,other,ItRi_Tengron,1);
	Info_ClearChoices(DIA_Tengron_News);
	Log_CreateTopic(Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus(Topic_TengronRing,LOG_Running);
	B_LogEntry(Topic_TengronRing,"Tengron mi dal magický prsten, který mám doručit Udarovi na hrad.");
};


instance DIA_Tengron_Situation(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 70;
	condition = DIA_Tengron_Situation_Condition;
	information = DIA_Tengron_Situation_Info;
	permanent = TRUE;
	description = "Jaká je zde situace?";
};


func int DIA_Tengron_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_Situation_Info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//Jaká je zde situace?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//Jsme napadáni monstry. A nepodařilo se nám vytěžit moc nagické rudy, protože jsme přišli o hodně lidí.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//Nevím, jak dlouho vydržíme, ale nevzdáme se!
};


instance DIA_Tengron_HELP(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 9;
	condition = DIA_Tengron_HELP_Condition;
	information = DIA_Tengron_HELP_Info;
	permanent = FALSE;
	description = "Potřebuji tvou pomoc.";
};


func int DIA_Tengron_HELP_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HELP_Info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//Potřebuji tvou pomoc. Fajeth chce, abych zabil chňapavce, ale...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//Přijímám rozkazy pouze od Fajetha. Fajeth mi nařídil hlídat tady.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//Možná ti pomůže někdo jiný.
};


instance DIA_Tengron_PICKPOCKET(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 900;
	condition = DIA_Tengron_PICKPOCKET_Condition;
	information = DIA_Tengron_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Tengron_PICKPOCKET_Condition()
{
	return C_Beklauen(32,50);
};

func void DIA_Tengron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
	Info_AddChoice(DIA_Tengron_PICKPOCKET,Dialog_Back,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tengron_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

