
instance DIA_Kervo_EXIT(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 999;
	condition = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kervo_WASIST(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 4;
	condition = DIA_Kervo_WASIST_Condition;
	information = DIA_Kervo_WASIST_Info;
	description = "Co je s tebou?";
};


func int DIA_Kervo_WASIST_Condition()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//Co je s tebou?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//Ty se ptáš? Jen se kolem sebe podívej.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//Ty zatracený číhavci už zabrali celou řeku.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//Nejdřív byli jen dva. Ale od včerejška už jsem jich potkal minimálně pět.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//Nemám ani tušení, jak se odsud dostat.
};

instance DIA_Kervo_HILFE(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 5;
	condition = DIA_Kervo_HILFE_Condition;
	information = DIA_Kervo_HILFE_Info;
	description = "Zkoušel ses dostat přes průsmyk?";
};

func int DIA_Kervo_HILFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kervo_WASIST))
	{
		return TRUE;
	};
};

func void DIA_Kervo_HILFE_Info()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Zkoušel ses dostat přes průsmyk?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Vypadám snad jako magor? Dokud tam budou ty bestie, nedostane mě tam ani dvacet vojáků. Nesnáším je.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//(úplně sklíčeně) Jenom je ucítím a už mě polévá studený pot. A z toho jejich neustálýho huhlání mi tuhne krev v žilách.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//Jestli tak toužíš po tom, nechat si od nich stáhnout kůži zaživa, tak běž rovnou tam.
	MIS_Kervo_KillLurker = LOG_Running;
	Log_CreateTopic(TOPIC_Kervo_KillLurker,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Kervo_KillLurker,LOG_Running);
	B_LogEntry(TOPIC_Kervo_KillLurker,"Kervo je hrozně vyděšen číhavci, kteří se potulují v blízkosti jeho jeskyně, asi bych měl pomoci tomu chudáčkovi.");
	Info_ClearChoices(DIA_Kervo_HILFE);
	Info_AddChoice(DIA_Kervo_HILFE,"Fajn, v tom případě na to zapomeň.",DIA_Kervo_HILFE_tschau);
	Info_AddChoice(DIA_Kervo_HILFE,"Ale tady nemůžeš zůstat věčně.",DIA_Kervo_HILFE_ewig);
	if(Kervo_GotStuff == TRUE)
	{
		Info_AddChoice(DIA_Kervo_HILFE,"Co mi dáš, když ty věci zabiju?",DIA_Kervo_HILFE_Problem);
	};
};

func void DIA_Kervo_HILFE_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//Ale tady nemůžeš zůstat věčně.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//Nemám tušení, co po mně vlastně chceš, ale jedno ti řeknu: ty mě tady nenecháš.
};

var int Kervo_PromiseNugget;

func void DIA_Kervo_HILFE_Problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//Co mi dáš, když ty potvory zabiju?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Hmm. Fajn. Mohlo by stačit, kdyby zmizeli ty číhavci před jeskyní.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//Našel jsem prázdný runový kámen. Jsi mág, takže by se ti mohla hodit.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//Našel jsem hroudu rudy.
	};

	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//Můžu ti ji dát jako revanš.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kervo_HILFE_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Fajn, v tom případě na to zapomeň.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Jasně, vezmu si to.
	AI_StopProcessInfos(self);
};


instance DIA_Kervo_LurkerPlatt(C_Info)
{
	npc = STRF_1116_Kervo;
	condition = DIA_Kervo_LurkerPlatt_Condition;
	information = DIA_Kervo_LurkerPlatt_Info;
	description = "Ty číhavci před jeskyní už tam nejsou.";
};

func int DIA_Kervo_LurkerPlatt_Condition()
{
	if((MIS_Kervo_KillLurker == LOG_Running) && Npc_IsDead(Kervo_Lurker1) && Npc_IsDead(Kervo_Lurker2) && Npc_IsDead(Kervo_Lurker3) && Npc_IsDead(Kervo_Lurker4) && Npc_IsDead(Kervo_Lurker5) && Npc_IsDead(Kervo_Lurker6))
	{
		return TRUE;
	};
};

func void DIA_Kervo_LurkerPlatt_Info()
{
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//Ty číhavci před jeskyní už tam nejsou.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//Výborně. Konečně se můžu znova volně nadechnout.
	if(Kervo_PromiseNugget == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Tady máš, co jsem ti slíbil.
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR))
		{
			B_GiveInvItems(self,other,ItMi_RuneBlank,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Nugget,1);
		};
	};
	B_GivePlayerXP(XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Kervo_KillLurker,LOG_SUCCESS);
	B_LogEntry(TOPIC_Kervo_KillLurker,"Teď už může Kervo v klidu dýchat, číhavci jsou mrtví.");
};

instance DIA_Kervo_VERGISSES(C_Info)
{
	npc = STRF_1116_Kervo;
	condition = DIA_Kervo_VERGISSES_Condition;
	information = DIA_Kervo_VERGISSES_Info;
	permanent = TRUE;
	description = "Projdeš teď tím průsmykem?";
};


func int DIA_Kervo_VERGISSES_Condition()
{
	if(MIS_Kervo_KillLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Kervo_VERGISSES_Info()
{
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Projdeš teď tím průsmykem?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Na to zapomeň, chlape. Když mě chytí, pošlou mě zpátky do dolů. Zůstanu tady.
	AI_StopProcessInfos(self);
};

instance DIA_Kervo_PICKPOCKET(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 900;
	condition = DIA_Kervo_PICKPOCKET_Condition;
	information = DIA_Kervo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kervo_PICKPOCKET_Condition()
{
	return C_Beklauen(34,10);
};

func void DIA_Kervo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
	Info_AddChoice(DIA_Kervo_PICKPOCKET,Dialog_Back,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kervo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

