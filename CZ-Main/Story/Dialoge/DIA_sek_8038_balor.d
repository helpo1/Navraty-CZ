
instance DIA_BALOR_EXIT(C_Info)
{
	npc = sek_8038_balor;
	nr = 999;
	condition = dia_balor_exit_condition;
	information = dia_balor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_balor_exit_condition()
{
	return TRUE;
};

func void dia_balor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_balor_PICKPOCKET(C_Info)
{
	npc = sek_8038_balor;
	nr = 900;
	condition = dia_balor_PICKPOCKET_Condition;
	information = dia_balor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_balor_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_balor_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_balor_PICKPOCKET);
	Info_AddChoice(dia_balor_PICKPOCKET,Dialog_Back,dia_balor_PICKPOCKET_BACK);
	Info_AddChoice(dia_balor_PICKPOCKET,DIALOG_PICKPOCKET,dia_balor_PICKPOCKET_DoIt);
};

func void dia_balor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_balor_PICKPOCKET);
};

func void dia_balor_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_balor_PICKPOCKET);
};

instance DIA_BALOR_HALLO(C_Info)
{
	npc = sek_8038_balor;
	nr = 1;
	condition = dia_balor_hallo_condition;
	information = dia_balor_hallo_info;
	permanent = FALSE;
	description = "Ahoj, jsem tu nový.";
};


func int dia_balor_hallo_condition()
{
	return TRUE;
};

func void dia_balor_hallo_info()
{
	AI_Output(other,self,"DIA_Balor_Hallo_15_00");	//Ahoj, jsem tu nový.
	AI_Output(self,other,"DIA_Balor_Hallo_13_01");	//... Já jsem Balor, pomocník Baala Tyona. Určitě jsi už o něm slyšel že?
	Info_ClearChoices(dia_balor_hallo);
	Info_AddChoice(dia_balor_hallo,"Ne.",dia_balor_hallo_nein);
	Info_AddChoice(dia_balor_hallo,"Ano.",dia_balor_hallo_ja);
};

func void dia_balor_hallo_ja()
{
	AI_Output(other,self,"DIA_Balor_Hallo_Ja_15_00");	//Jistě.
	AI_Output(self,other,"DIA_Balor_Hallo_Ja_13_01");	//Pak jistě víš, že je druhou nejvýznamnější osobou v táboře. Hned po Baalu Orunovi samozřejmě...
	Info_ClearChoices(dia_balor_hallo);
};

func void dia_balor_hallo_nein()
{
	AI_Output(other,self,"DIA_Balor_Hallo_Nein_15_00");	//Ne.
	AI_Output(self,other,"DIA_Balor_Hallo_Nein_13_01");	//Vážně? Asi tu ještě nejsi moc dlouho že?
	AI_Output(self,other,"DIA_Balor_Hallo_Nein_13_02");	//Baal Tyon. (odmlčí se) Je druhou nejvýznamnější osobou v tomto táboře hned po Baalu Orunovi.
	AI_Output(self,other,"DIA_Balor_Hallo_Nein_13_03");	//Jeho hlas znamená moc. Zvláště pak v otázce přijetí do Bratrstva.
	Info_ClearChoices(dia_balor_hallo);
};


instance DIA_BALOR_JOB(C_Info)
{
	npc = sek_8038_balor;
	nr = 2;
	condition = dia_balor_job_condition;
	information = dia_balor_job_info;
	permanent = FALSE;
	description = "Co je tvým posláním?";
};


func int dia_balor_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_hallo))
	{
		return TRUE;
	};
};

func void dia_balor_job_info()
{
	AI_Output(other,self,"DIA_Balor_Job_15_00");	//Co je tvým posláním?
	AI_Output(self,other,"DIA_Balor_Job_13_01");	//... Já pomáhám mu s přípravou lektvarů.
	AI_Output(self,other,"DIA_Balor_Job_13_02");	//Samozřejmě jen s těmi nejlehčími.
};


instance DIA_BALOR_ADDINFOKALOM(C_Info)
{
	npc = sek_8038_balor;
	nr = 2;
	condition = dia_balor_addinfokalom_condition;
	information = dia_balor_addinfokalom_info;
	permanent = TRUE;
	description = "Co mi můžeš říct o tvém mistrovi?";
};


func int dia_balor_addinfokalom_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_job))
	{
		return TRUE;
	};
};

func void dia_balor_addinfokalom_info()
{
	AI_Output(other,self,"DIA_Balor_AddInfoKalom_15_00");	//Co mi můžeš říct o tvém mistrovi?
	AI_Output(self,other,"DIA_Balor_AddInfoKalom_13_01");	//On... Není jako... Jako ostatní Guru. NIKDO nemůže plýtvat jeho časem!
};


instance DIA_BALOR_SEKTEHEILEN(C_Info)
{
	npc = sek_8038_balor;
	nr = 1;
	condition = dia_balor_sekteheilen_condition;
	information = dia_balor_sekteheilen_info;
	permanent = FALSE;
	description = "Vypij to! Pomůže ti to od bolestí hlavy.";
};


func int dia_balor_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_balor_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Balor_SekteHeilen_01_00");	//Vypij to! Pomůže ti to od bolestí hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Balor_SekteHeilen_01_01");	//Hlava. Ten hukot v ní. Přestal!
	AI_Output(self,other,"DIA_Balor_SekteHeilen_01_02");	//Děkuji ti hrozně moc! (s úsměvem)
};

