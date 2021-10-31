
instance DIA_Dyrian_EXIT(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 999;
	condition = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Hello(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(smutně) Co chceš?
};


instance DIA_Dyrian_Wurst(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Wurst_Condition;
	information = DIA_Dyrian_Wurst_Info;
	permanent = FALSE;
	description = "Rozdávám klobásy.";
};


func int DIA_Dyrian_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Rozdávám klobásy.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Děkuji, doufám, že to není poslední, kterou zde dostanu.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Dyrian_Job(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent = FALSE;
	description = "Co tu děláš?";
};


func int DIA_Dyrian_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tu dělá?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Porušil jsem pravidla života v klášteře.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Čekám na rozhodnutí Nejvyšší rady. Asi mě vyloučí. 
};


instance DIA_Dyrian_WhatDone(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent = FALSE;
	description = "Řekni mi, co se stalo.";
};


func int DIA_Dyrian_WhatDone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Řekni mi, co se stalo.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Vzal jsem v místnosti mágů jednu knihu a chtěl si ji ve volném čase přečíst... 
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Hyglas si toho hned všiml a šel za mnou.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//A já mu lhal... A pak mě nachytal v cele, když jsem četl tu knihu.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Velmi se rozzlobil a šel za Nejvyšší radou.
};


instance DIA_Dyrian_CanHelp(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent = TRUE;
	description = "Mohu nějak pomoci?";
};


func int DIA_Dyrian_CanHelp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Mohu nějak pomoci?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Ne, můj osud teď závisí na milosti Innose a mágů.
};


instance DIA_Dyrian_Scroll(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Scroll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) || (MIS_RUNE == LOG_Running) || (MIS_GOLEM == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Ty jsi opravdu žádal zkoušku ohněm?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Ano, chci ji splnit.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//No, možná ti můžu pomoci. Dám ti svitek kouzla spánek. Co ty na to? 
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Ne, nepotřebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Co za něj chceš?",DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll,"A co s ním mám dělat?",DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//A co s ním mám dělat?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//S tímto kouzlem můžeš uspat ostatní lidi.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To může být užitečné, když někdo stojí v cestě... Můžeš ho uspat, pokud má slabší vůli než ty.
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A jak poznám, jestli to kouzlo půjde použít?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//No, na mágy to ani nezkoušej, ale většina z noviců neodolá.
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Ne, nepotřebuji tvou pomoc.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Jestli si to rozmyslíš, přijď.
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za něj chceš?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Každý nový mág má právo na jedno přání.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//A jestli zkoušku splníš, můžeš mě nechat v klášteře.
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Ne, nepotřebuji tvoji pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Platí, dej mi ten svitek.",DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Platí, dej mi ten svitek.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Hodně štěstí, Innos tě provázej.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
	Log_CreateTopic(Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin,LOG_Running);
	B_LogEntry(Topic_DyrianDrin,"Dyrian mi dal svitek spánku. Až se stanu mágem, chce, abych ho nechal v klášteře.");
	Info_ClearChoices(DIA_Dyrian_Scroll);
};


instance DIA_Dyrian_Doch(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to, dej mi to kouzlo.";
};


func int DIA_Dyrian_Doch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Scroll) && (MIS_HelpDyrian != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Rozmyslel jsem si to, dej mi to kouzlo.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobře, pokud projdeš zkouškou, zkus zařídit, abych mohl zůstat v klášteře.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
};


instance DIA_Dyrian_HelloAgain(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_HelloAgain_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_KDF) && (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//Děkuji, zachránil jsi mě!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(polekaně) Och, promiň, pane, nechtěl jsem být hrubý...
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(uctivě) Děkuji ti za to, že jsem mohl zůstat v klášteře... 
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak je?
};


instance DIA_Dyrian_HowIsIt(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent = TRUE;
	description = "Jak je?";
};


func int DIA_Dyrian_HowIsIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dobře, má práce mě baví, mistře.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_other(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent = TRUE;
	description = "Jak je?";
};


func int DIA_Dyrian_other_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Jsem vděčný Innosovi, že mohu žít v klášteře.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Kneipe(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent = TRUE;
	description = "Jak je?";
};


func int DIA_Dyrian_Kneipe_Condition()
{
	if((MIS_HelpDyrian == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak je?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//Musíš se ptát? Nechal jsi mě na holičkách.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Teď mi zůstalo už jen víno. A je to tvá vina.
	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Tady, vem si 5 zlatých.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Můžu to vysvětlit.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Pozor na jazyk.",DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Tady, vem si 5 zlatých.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(nervózně) 5 zlatých? Dáváš mi 5 zlatých jako kompenzaci za můj život?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Vezmu si všechno tvé zlato!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Můžu to vysvětlit.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Nepotřebuji tvé vysvětlení.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//Lžeš pokaždé, když otevřeš tvá špinavá ústa. Nech mě. 
	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Pozor na jazyk.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//A ještě mi vyhrožuješ.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Však uvidíš, parchante, jen, co dokončím tuhle láhev.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//A zmiz mi z očí!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_nachher(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent = TRUE;
	description = "Co se děje?";
};


func int DIA_Dyrian_nachher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_nachher_Info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co se děje?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Nech mě být!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_PICKPOCKET(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 900;
	condition = DIA_Dyrian_PICKPOCKET_Condition;
	information = DIA_Dyrian_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dyrian_PICKPOCKET_Condition()
{
	return C_Beklauen(10,15);
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,Dialog_Back,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

