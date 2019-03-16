
instance DIA_STRF_8125_Addon_Nuts_EXIT(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 999;
	condition = DIA_STRF_8125_Addon_Nuts_EXIT_Condition;
	information = DIA_STRF_8125_Addon_Nuts_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8125_Addon_Nuts_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8125_Addon_Nuts_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8125_Addon_Nuts_PreHello(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 2;
	condition = DIA_STRF_8125_Addon_Nuts_PreHello_condition;
	information = DIA_STRF_8125_Addon_Nuts_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8125_Addon_Nuts_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NutsRest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_PreHello_01_00");	//Hej, neruš mě při práci! Promluvíme si později.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8125_Addon_Nuts_NotWork(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_NotWork_Condition;
	information = DIA_STRF_8125_Addon_Nuts_NotWork_Info;
	permanent = FALSE;
	description = "Nevypadalo to se že bys něco dělal.";
};

func int DIA_STRF_8125_Addon_Nuts_NotWork_Condition()
{
	if(NutsRest == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_NotWork_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_00");	//Nevypadalo to se že bys něco dělal.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_01");	//No... (potutelně) No tak pokukd zrovna stráže spí.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_02");	//A on spal... očividně, a to pěkně dlouhou dobu.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_03");	//No a co...(zmateněě) Kdo by se o tom dozvěděl?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_04");	//Mohl bych se o tom skřetem zmínit...
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_05");	//A ty s tím teda nic neuděláš?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_06");	//Ne neudělám, tedy pokud mi můžeš být nějak užitečný.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_07");	//Co ode mě chceš?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_08");	//Ale no tak, klid... jen jsem si z tebe utahoval.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_09");	//Vtipálku!
};

instance DIA_STRF_8125_Addon_Nuts_YouHereLongTime(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Condition;
	information = DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Info;
	permanent = FALSE;
	description = "Jsi tady dlouho?";
};

func int DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_NotWork) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_00");	//Jsi tady dlouho?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_01");	//Chcete-li být upřímný, ztratil jsem pojem o čase.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_02");	//Ale v případě, že skřeti budou i nadále nás nutit pracovat tolik, tu nikdo dlouho nevydrží.
};

instance DIA_STRF_8125_Addon_Nuts_Teleport(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_Teleport_Condition;
	information = DIA_STRF_8125_Addon_Nuts_Teleport_Info;
	permanent = FALSE;
	description = "Co tu děláš?";
};

func int DIA_STRF_8125_Addon_Nuts_Teleport_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_NotWork) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_Teleport_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_00");	//Co tu děláš?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_01");	//Asi tě to překvapí, ale čtu si.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_02");	//Čteš? A co?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_03");	//Našel jsem tu v jeskyni tuhle starou tabulku.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_04");	//Jazyk je podobný tomu našemu lidskému, teda alespoň to tak vypadá.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_05");	//Můžu se podívat?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_06");	//Hej, ruce pryč! Tohle je asi jediná věc, která mýmu životu dává smysl!
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_07");	//Ach tak?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_08");	//Samozřejmě! Však tu taky kromě skřetů nic jinýho ani moc nevídám.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_09");	//Tak aspoň něco!
};

instance DIA_STRF_8125_Addon_Nuts_Want(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_Want_Condition;
	information = DIA_STRF_8125_Addon_Nuts_Want_Info;
	permanent = FALSE;
	description = "Co za ní chceš?";
};

func int DIA_STRF_8125_Addon_Nuts_Want_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_Teleport) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_Want_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_00");	//Co za ní chceš?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_01");	//Hmmm...(Potutelně) Pro mě je nenahraditelná!
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_02");	//Ale když už se ptáš... Možná že dobrá kniha by byla rovnoceným náhražkem.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_03");	//A pokud možno, o hvězdách.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_04");	//O hvězdách?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_05");	//Vždycky jsem se rád díval na hvězdy, už od malička!
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_06");	//Ale osud to rozhodl jinak...(Zkroušeně) A teď už je stěží vůbec někdy uvidím.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_07");	//No alespoň si o nich můžu přečíst.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_08");	//Aha.
	MIS_Astronomy = LOG_Running;
	Log_CreateTopic(TOPIC_Astronomy,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Astronomy,LOG_Running);
	B_LogEntry(TOPIC_Astronomy,"Otrok ve skřetím dole, Nuts, mi dá svoji kamennou tabulku. Výměnou chce knihu, a pokud možno o hvězdách. Kupci v horní čtvrti by mohli něco mít.");
};

instance DIA_STRF_8125_Addon_Nuts_WantDone(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_WantDone_Condition;
	information = DIA_STRF_8125_Addon_Nuts_WantDone_Info;
	permanent = FALSE;
	description = "Tady je ta kniha co jsi chtěl.";
};

func int DIA_STRF_8125_Addon_Nuts_WantDone_Condition()
{
	if((MIS_Astronomy == LOG_Running) && (Npc_HasItems(other,ASTRONOMIE) >= 1) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_WantDone_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_00");	//Tady je ta kniha co jsi chtěl.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_01");	//Hmmm...(Nevěťícně) A je zajímavá?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_02");	//No tak jak jsi chtěl... je o hvězdách.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_03");	//Radši se na ní podívám.
	B_GiveInvItems(other,self,ASTRONOMIE,1);
	Npc_RemoveInvItems(self,ASTRONOMIE,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_04");	//Kamaráde, to je pťesně to co jsem potťeboval!
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_05");	//A co naše dohoda?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_06");	//V pořádku, tady to máš.
	B_GiveInvItems(self,other,ItWr_OldTextMine,1);
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_07");	//Tu knihu si tedy můžu nechat?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_08");	//No jasně.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_09");	//Mimochodem, tohle znamení bylo důležité v době tisíce let dozadu.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_10");	//No to je jen tak mimochodem...
	RT_Respect = RT_Respect + 1;
	MIS_Astronomy = LOG_Success;
	Log_SetTopicStatus(TOPIC_Astronomy,LOG_Success);
	B_LogEntry(TOPIC_Astronomy,"Přinesl jsem Nutsovi knihu.");
};