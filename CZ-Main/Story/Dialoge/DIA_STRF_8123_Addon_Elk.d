
instance DIA_STRF_8123_Addon_Elk_EXIT(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 999;
	condition = DIA_STRF_8123_Addon_Elk_exit_condition;
	information = DIA_STRF_8123_Addon_Elk_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8123_Addon_Elk_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8123_Addon_Elk_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8123_Addon_Elk_HELLO(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_hello_condition;
	information = DIA_STRF_8123_Addon_Elk_hello_info;
	permanent = FALSE;
	description = "Jak se máte?";
};

func int DIA_STRF_8123_Addon_Elk_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8123_Addon_Elk_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Hello_15_00");	//Jak se máte?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Hello_08_00");	//Bylo mi i líp.
};

instance DIA_STRF_8123_Addon_Elk_Help(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_Help_condition;
	information = DIA_STRF_8123_Addon_Elk_Help_info;
	permanent = FALSE;
	description = "Nepotřebuješ pomoc?";
};

func int DIA_STRF_8123_Addon_Elk_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8123_Addon_Elk_hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_00");	//Nepotřebuješ pomoc?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_01");	//Chtěl bys mě zabít? Tak pojď mě to nevadí!
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_02");	//Ne, měl jsem v plánu něco jiného.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_03");	//Jestli mi chceš opravdu pomoct, bylo by dobrý sehnat mi lepší výstroj.
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_04");	//Jak to myslíte?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_05");	//Už je tak starý že se každou chvílí rozbije a skřeti požadují stále více rudy.
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_06");	//Proč se nezeptáš ostatních aby ti něco sehnali?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_07");	//Jak...(smutně) sotva otevřete ústa, dostanete do žeber.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_08");	//Takže musím pečlivě sledovat svůj nástroj.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_09");	//A ten se jednou rozbije!
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_10");	//Pokusím se vám něco sehnat.
	MIS_ElkKirka = LOG_Running;
	Log_CreateTopic(TOPIC_ElkKirka,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ElkKirka,LOG_Running);
	B_LogEntry(TOPIC_ElkKirka,"Elk potřebuje nový krumpáč, jeho starý se každou chvílí může zlomit, a skřeti nové nástroje zpochybňují.");
};

instance DIA_STRF_8123_Addon_Elk_FakeKirka(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_FakeKirka_condition;
	information = DIA_STRF_8123_Addon_Elk_FakeKirka_info;
	permanent = FALSE;
	description = "Musím tě vyzvednout.";
};

func int DIA_STRF_8123_Addon_Elk_FakeKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (Npc_HasItems(hero,ItMw_2H_Axe_L_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_FakeKirka_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_00");	//Musím tě vyzvednout.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_01");	//A co to je? Je starý jako já.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_02");	//Pane, dejte mi normální krumpáč.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_03");	//Rozbitý po prvním bouchnutím.
	ElkNeedNewKirka = TRUE;
};

instance DIA_STRF_8123_Addon_Elk_NewKirka(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_NewKirka_condition;
	information = DIA_STRF_8123_Addon_Elk_NewKirka_info;
	permanent = FALSE;
	description = "Jak se ti to...?";
};

func int DIA_STRF_8123_Addon_Elk_NewKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (Npc_HasItems(hero,ItMw_Kirka_New) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_NewKirka_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_NewKirka_01_00");	//Jak se ti to...?
	B_GiveInvItems(other,self,ItMw_Kirka_New,1);
	Npc_RemoveInvItems(self,ItMw_Kirka_New,1);
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_NewKirka_01_01");	//Hmmm. To je něco jiného!
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_NewKirka_01_02");	//S tímto nástrojem se moje produktivita zvýší.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_NewKirka_01_03");	//Díky, kámo!
	RT_Respect = RT_Respect + 1;
	MIS_ElkKirka = LOG_Success;
	Log_SetTopicStatus(TOPIC_ElkKirka,LOG_Success);
	B_LogEntry(TOPIC_ElkKirka,"Musím vyzvednout nového Elka.");
};