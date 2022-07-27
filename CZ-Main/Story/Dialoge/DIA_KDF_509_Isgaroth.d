
var int istraf;

instance DIA_Isgaroth_EXIT(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 999;
	condition = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//Nechť tě Innos ochraňuje.
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Hello(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Isgaroth_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//Innos s tebou. Co pro tebe můžu udělat, poutníku?
};


instance DIA_Isgaroth_Segen(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 10;
	condition = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent = TRUE;
	description = "Požehnej mi!";
};


func int DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Segen_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//Požehnej mi!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//Žehnám ti ve jménu Innose. Nechť Pánův oheň hoří v srdci tvém a dá ti sílu konat v právu.

	if(MIS_Thorben_GetBlessings == LOG_Running)
	{
		B_LogEntry(TOPIC_Thorben,"Isgaroth mág Ohně mě požehnal.");
	};

	Isgaroth_Segen = TRUE;
};


instance DIA_Isgaroth_Wolf(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent = FALSE;
	description = "Poslal mě Sergio...";
};


func int DIA_Isgaroth_Wolf_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (Sergio_Sends == TRUE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//Poslal mě Sergio. Mám splnit úkol. Co to teda je?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//Potuluje se tu černý vlk. Vystopuj a zabij ho.
	MIS_IsgarothWolf = LOG_Running;
	B_LogEntry(Topic_IsgarothWolf,"V blízkosti oltáře před klášterem se potuluje černý vlk. Měl bych ho vystopovat a zabít.");
};


instance DIA_Isgaroth_tot(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent = TRUE;
	description = "Zabil jsem vlka.";
};


func int DIA_Isgaroth_tot_Condition()
{
	Wolfi = Hlp_GetNpc(BlackWolf);
	if((MIS_IsgarothWolf == LOG_Running) && Npc_IsDead(Wolfi))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//Zabil jsem vlka.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//Dobrá práce, novici. Jsi statečný muž. Teď se ale vrať do kláštera a plň své povinnosti.
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Job(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 4;
	condition = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Isgaroth_Job_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//Jsem mág Ohně. Kněz nášho boha Innose.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//Tenhle oltář je zasvěcen JEMU, nejvyššímu bohu, stvořiteli ohně a pánu spravedlnosti.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//Lidé ke mne chodí, aby se modlili a dostali požehnání.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//A za malý poplatek ode mně můžeš získat mnoho užitečných věcí.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"Mistr Isgaroth prodává užitečné magické věci v oltáři který je v blízkosti kláštera.");
};


instance DIA_Isgaroth_Trade(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 99;
	condition = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Isgaroth_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Isgaroth_Kloster(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent = FALSE;
	description = "Kam mě tahle cesta zavede?";
};


func int DIA_Isgaroth_Kloster_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//Kam mě tahle cesta zavede?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//Cesta vede do kláštera mágů Ohně. Vstoupit je ale dovoleno jenom jeho služebníkům.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//Pokud chceš být přijmout za novice, musíš přinést ovci a...
		B_Say_Gold(self,other,Summe_Kloster);
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Abych byl přijat za novice do kláštera Innose, potřebuji ovci a 1000 zlatých.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//Jelikož sis již zvolil jinou cestu, vstup ti bude odepřen.
	};
};


instance DIA_Isgaroth_Vatras(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent = TRUE;
	description = "Přinesl jsem zprávu od Vatrase.";
};


func int DIA_Isgaroth_Vatras_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && ((Npc_HasItems(other,ItWr_VatrasMessage) == 1) || (Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//Přinesl jsem zprávu od Vatrase.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//Co je to za zprávu?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//Dopis. Tady je.

	if(Npc_HasItems(other,ItWr_VatrasMessage) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage,1);
		};

		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//Výborně, můžeš říct Vatrasovi, že jsem zprávu dostal.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//Vezmi si tyhle lektvary za tvé služby, určitě přijdou vhod.
		B_LogEntry(TOPIC_Botschaft,"Dal jsem dopis Isgarothovi. Je nutné informovat Vatrase o předání dopisu.");
		CreateInvItems(self,ItPo_Health_02,2);
		B_GiveInvItems(self,other,ItPo_Health_02,2);
		B_GivePlayerXP(XP_Ambient * 2);
	}
	else if(Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage_Open,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage_Open,1);
		};

		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//Pečeť je narušená. Co sis myslel, hlupáku?!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//Jdi a řekni Vatrasovi, že jsem obdržel zprávu.
		B_LogEntry(TOPIC_Botschaft,"Dal jsem dopis Isgarothovi kterej zuří protože jsem četl dopis... Je nutné informovat Vatrase o předání dopisu.");
		AI_StopProcessInfos(self);
	};
	Vatras_Return = TRUE;
};


instance DIA_Isgaroth_PICKPOCKET(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 900;
	condition = DIA_Isgaroth_PICKPOCKET_Condition;
	information = DIA_Isgaroth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Isgaroth_PICKPOCKET_Condition()
{
	return C_Beklauen(48,50);
};

func void DIA_Isgaroth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,Dialog_Back,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};


instance DIA_ISGAROTH_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 1;
	condition = dia_isgaroth_runemagicnotwork_condition;
	information = dia_isgaroth_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_isgaroth_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_isgaroth_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Isgaroth_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Isgaroth_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(other,self,"DIA_Isgaroth_RuneMagicNotWork_01_02");	//A co ostatní?
	AI_Output(self,other,"DIA_Isgaroth_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechni! Ostatním mágům Ohně se také nic nedaří.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

