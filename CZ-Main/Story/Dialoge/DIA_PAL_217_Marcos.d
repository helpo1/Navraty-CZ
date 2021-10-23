
instance DIA_Marcos_EXIT(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 999;
	condition = DIA_Marcos_EXIT_Condition;
	information = DIA_Marcos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Marcos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_Hallo(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hallo_Condition;
	information = DIA_Marcos_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marcos_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hallo_Info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//Stůj! Ve jménu Innose! Jsem Marcos, královský paladin! Řekni kdo jsi a co tu chceš! A pravdu!

	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//Innosův vyvolený mluví vždy pravdu.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Odpusť ctihodný mágu. Neuvědomil jsem si s kým mluvím!
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//Nevadí.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//Jestli se můžu zeptat - Co tě sem přivádí?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Buď v klidu - Jsem ve službách lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//Jaké jsou tvoje rozkazy?
	}
	else if(other.guild == GIL_SLD)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Klídek, máme stejného šéfa - lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//Hagen najmul žoldáka? Mluv, co tu chceš?!
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Klídek, máme stejného šéfa - lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//Hagen najmul žoldáka? Mluv, co tu chceš?!
	};
};


instance DIA_Marcos_Hagen(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hagen_Condition;
	information = DIA_Marcos_Hagen_Info;
	permanent = FALSE;
	description = "Mám lordu Hagenovi přinést důkaz o přítomnosti draků.";
};


func int DIA_Marcos_Hagen_Condition()
{
	if((Kapitel == 2) && (Garond.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hagen_Info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Mám lordu Hagenovi přinést důkaz o přítomnosti draků.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Pak tu neztrácej čas. Zbytečně riskuješ život.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Myslíš si, že tady najdeš dračí šupiny a doneseš mu je?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//Zkus se dostat do hradu a promluv s Garondem.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//Musí se dozvědět, že jsi na misi pro lorda Hagena. Myslím, že ti dá ten tvůj důkaz...
};


instance DIA_Marcos_Garond(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Garond_Condition;
	information = DIA_Marcos_Garond_Info;
	permanent = FALSE;
	description = "Přicházím od Garonda.";
};


func int DIA_Marcos_Garond_Condition()
{
	if((Kapitel == 2) && (MIS_OLDWORLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Garond_Info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//Přicházím od Garonda. Chce vědět, kolik jste vydolovali rudy.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Řekni Garondovi, že jsme dopravili rudu do bezpečí, protože se tam začali ukazovat skřeti.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//Zkoušeli jsme se dostat do pevnosti, ale nakonec jsem přežil jen já.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//Schoval jsem rudu na bezpečném místě máme tam 4 bedny. Jdi a řekni to Garondovi.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//Řekni mu, že bráním rudu svým životem, ale že nevím, jak dlouho bude trvat, než mě najdou a přemůžou.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Řekni mu, že potřebuji nějaké posily.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//Dám mu vědět.
	B_LogEntry(TOPIC_ScoutMine,"Paladin Marcos ochraňuje čtyři bedny rudy v malém údolíčku vedle pevnosti.");
	Log_CreateTopic(Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MarcosJungs,LOG_Running);
	B_LogEntry_Quiet(Topic_MarcosJungs,"Marcos chce, aby mu Garond poslal posily.");
	MIS_Marcos_Jungs = LOG_Running;
	Marcos_Ore = TRUE;
	self.flags = 0;
};


instance DIA_Marcos_Perm(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 9;
	condition = DIA_Marcos_Perm_Condition;
	information = DIA_Marcos_Perm_Info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int DIA_Marcos_Perm_Condition()
{
	if((Kapitel >= 2) && (Npc_KnowsInfo(other,DIA_Marcos_Hagen) || Npc_KnowsInfo(other,DIA_Marcos_Garond)))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Perm_Info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//Jaká je situace?
	if(KAPITELORCATC == TRUE)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Budu zde stát pevně, protože Innos je se mnou.
		AI_StopProcessInfos(self);
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//Opravdu potřebuji léčivý lektvar!
		B_UseItem(self,ItPo_Health_03);
	}
	else if(MIS_Marcos_Jungs == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//Věřím a doufám, že Garond brzy pošle posily.
	}
	else if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//Díky za tvou pomoc. Innos s tebou.
		if(Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Budu zde stát pevně, protože Innos je se mnou.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_PICKPOCKET(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 900;
	condition = DIA_Marcos_PICKPOCKET_Condition;
	information = DIA_Marcos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Marcos_PICKPOCKET_Condition()
{
	return C_Beklauen(65,380);
};

func void DIA_Marcos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
	Info_AddChoice(DIA_Marcos_PICKPOCKET,Dialog_Back,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marcos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};

func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};


instance DIA_MARCOS_LEADER(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 3;
	condition = dia_marcos_leader_condition;
	information = dia_marcos_leader_info;
	permanent = FALSE;
	description = "Od koho nyní přímáte rozkazy?";
};


func int dia_marcos_leader_condition()
{
	if((KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE) && (COMMANDPALOW == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_leader_info()
{
	AI_Output(other,self,"DIA_Marcos_Leader_01_00");	//Od koho nyní přímáte rozkazy?
	AI_Output(self,other,"DIA_Marcos_Leader_01_01");	//Naši skupinku teď vede paladin Nathan, protože má nejvyšší hodnost.
	AI_Output(self,other,"DIA_Marcos_Leader_01_02");	//Takže jestli máš nějaké dotazy obrať se na něj.
	AI_Output(other,self,"DIA_Marcos_Leader_01_03");	//Jasně.
	COMMANDPALOW = TRUE;
};

