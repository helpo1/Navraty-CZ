
instance DIA_Gaertner_EXIT(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 999;
	condition = DIA_Gaertner_EXIT_Condition;
	information = DIA_Gaertner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gaertner_PICKPOCKET(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 900;
	condition = DIA_Gaertner_PICKPOCKET_Condition;
	information = DIA_Gaertner_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gaertner_PICKPOCKET_Condition()
{
	return C_Beklauen(40,50);
};

func void DIA_Gaertner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,Dialog_Back,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};


instance DIA_Gaertner_Job(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Job_Condition;
	information = DIA_Gaertner_Job_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_Job_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//To tím myslíš? Jsem zahradník, starám se o zahradu.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//Jsi tu asi hodně často, ne?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//Ano, ani mi to nevadí. Mám tohle místo rád.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//Jinak by mě poslali do trestanecké kolonie, protože jsem udělal nějaké špatné věci.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//Ale Larius potřebuje zahradníka, takže jsem tu mohl zůstat.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//Ta zahrada se stala mým domovem.
};

instance DIA_Gaertner_Escape(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Escape_Condition;
	information = DIA_Gaertner_Escape_Info;
	permanent = FALSE;
	description = "Snažil ses utéct?";
};

func int DIA_Gaertner_Escape_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Escape_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Escape_01_00");	//Snažil ses utéct?
	AI_Output(self,other,"DIA_Gaertner_Escape_01_01");	//Zprvu jsem o tom přemýšlel... Ale pak jsem sem od toho upustil.
	AI_Output(self,other,"DIA_Gaertner_Escape_01_02");	//Za prvé, všechny stráže mě znají osobně, a nemůžu ani opustit horní čtvrt.
	AI_Output(self,other,"DIA_Gaertner_Escape_01_03");	//Za druhé, s přihlédnutím na všechny tyto zvěsti o skřetech, raději zůstanu v blízkosti paladinů.
	AI_Output(self,other,"DIA_Gaertner_Escape_01_04");	//A za třetí, nikam se mi ani nechce!
	AI_Output(self,other,"DIA_Gaertner_Escape_01_05");	//Takže, lepší tady než s krumpáčem v rukou v dolech paladinů.
	AI_Output(other,self,"DIA_Gaertner_Escape_01_06");	//Rozumím.
};

instance DIA_Gaertner_Plants(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Plants_Condition;
	information = DIA_Gaertner_Plants_Info;
	permanent = FALSE;
	description = "Ty také pěstuješ rostliny?";
};

func int DIA_Gaertner_Plants_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Plants_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//Ty také pěstuješ rostliny?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//Trochu. Pěstuji tu nějaké ohnivé kopřivy. Taky jsem zkoušel trávu z bažin, ale ta se mi nechytla.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//No, a taky sklízím ty byliny, takže jestli chceš něco koupit...
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Od zahradníka z horní čtvrti můžu koupit byliny.");
};

instance DIA_Gaertner_Trade(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Trade_Condition;
	information = DIA_Gaertner_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Gaertner_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Gaertner_Krautabak(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Krautabak_Condition;
	information = DIA_Gaertner_Krautabak_Info;
	permanent = FALSE;
	description = "Mám tu nějakou trávu.";
};


func int DIA_Gaertner_Krautabak_Condition()
{
	if((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) && Wld_IsTime(6,45,21,45))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Krautabak_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//Mám tu nějakou trávu, dáš si?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//No, nevím... Ale dej to sem, splundruji si mozek tímhle.
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Npc_RemoveInvItems(self,ItMi_SumpfTabak,1);
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//Ack... ackack...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//Jooo, myslím, že lépe jsem si nezahulil...
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Gaertner_Sign(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_Sign_Condition;
	information = DIA_Gaertner_Sign_Info;
	permanent = FALSE;
	description = "(předvést zlodějský signál)";
};

func int DIA_Gaertner_Sign_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//Takže ty jsi jeden z nás... Měl bych pro tebe nějaké použivatelné informace...
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//Některé domy tady mají spínače, za kterými je dutý prostor.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//Lidé tam střeží své cennosti.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
};

instance DIA_Gaertner_HelpThings(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_HelpThings_condition;
	information = DIA_Gaertner_HelpThings_info;
	permanent = FALSE;
	description = "Mohu ti neako pomoci?";
};

func int DIA_Gaertner_HelpThings_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gaertner_Sign) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_HelpThings_info()
{
	AI_Output(other,self,"DIA_Gaertner_HelpThings_01_00");	//Mohu ti neako pomoci?
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_01");	//Jasné, bracho. Jak sis možná všiml, som tady celý den a nemužu nikam odist.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_02");	//Hlídájí mě, dokonce mě nepustí ani za tento plot.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_03");	//Takže můj život postrádá i těch nejzákladnejších potěšení.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_04");	//Nicméně, pokud bys mi mohl donést jen pár láhví kořalky a trochu trávy...
	AI_Output(other,self,"DIA_Gaertner_HelpThings_01_05");	//Chápu. Kolik toho chceš?
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_06");	//(Zamyšleně) Myslím, že tři láhve a pět stébel bude stačit. Více zde i tak neschovám.
	AI_Output(other,self,"DIA_Gaertner_HelpThings_01_07");	//Ok, donesu ti je.
	MIS_GaertnerHive = LOG_Running;
	Log_CreateTopic(TOPIC_GaertnerHive,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GaertnerHive,LOG_Running);
	B_LogEntry(TOPIC_GaertnerHive,"Zahradník mě požádal, abych získal tři láhve kořalky a pět stébel trávy z bažin.");
};

instance DIA_Gaertner_HelpThings_Done(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_HelpThings_Done_condition;
	information = DIA_Gaertner_HelpThings_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem, co jsi chtěl.";
};

func int DIA_Gaertner_HelpThings_Done_condition()
{
	if((MIS_GaertnerHive == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 3) && (Npc_HasItems(other,ItMi_Joint) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_HelpThings_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Gaertner_HelpThings_Done_01_00");	//Přinesl jsem, co jsi chtěl.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItFo_Booze,3);
	Npc_RemoveInvItems(hero,ItMi_Joint,5);
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_01");	//(Nedočkavo) Konečne. No, teď jsem tvým dlužníkem, kámo.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_02");	//Ako sa ti můžu odvďačiť?
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_03");	//Počúvaj... raz, pri kosení trávy som pri vchode do radnice našiel tento klúč.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_04");	//Vyzerá to, že ho stratil jeden z paladinů.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_05");	//Ak mám být upřímný, nevím jakú truhlu otevře...
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_06");	//... ale určitě tam bude něco čo má hodnotu.
	B_GiveInvItems(self,other,ItKe_PaladinTruhe,1);
	MIS_GaertnerHive = LOG_Success;
	Log_SetTopicStatus(TOPIC_GaertnerHive,LOG_Success);
	B_LogEntry(TOPIC_GaertnerHive,"Přinesl jsem zahradníkovi kořalku a za to mi dal podivný klíč. Zdá se, že patrí k neaké truhle.");
};

instance DIA_GAERTNER_ENTERHALL(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = dia_gaertner_enterhall_condition;
	information = dia_gaertner_enterhall_info;
	permanent = FALSE;
	description = "Nevíš jak bych se mohl dostat na radnici?";
};

func int dia_gaertner_enterhall_condition()
{
	if((MIS_ORUNPACKET == LOG_Running) && Npc_KnowsInfo(hero,DIA_Gaertner_Sign) && (MeetLarius == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaertner_enterhall_info()
{
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_00");	//Nevíš jak bych se mohl dostat na radnici?
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_01");	//A proč se tam potřebuješ dostat?
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_02");	//Musím se urgentně setkat s místodržícím města - Lariusem. Mám s ním důležité jednání.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_03");	//Ha! Tak na to zapomeň, chlape. Paladinové dovnitř nikoho nepustí.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_04");	//Teda, jestli není ve službách krále!
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_05");	//A není nějaká jiná cesta?
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_06");	//No, jedna cesta by tu byla.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_07");	//Larius někdy opouští radnici, aby se nadýchal čerstvého vzduchu.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_08");	//Na radnici je totiž trochu zatuchlo, víš?
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_09");	//A kdy přesně to dělá?
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_10");	//Přesně to nevím, ale většinou kolem šesti hodin večer.
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_11");	//Díky, vše je mi jasné.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_12");	//Není zač...
	B_LogEntry(TOPIC_ORUNPACKET,"Zahradník mi řekl, že Larius někdy opouští svou rezidenci, aby se nadýchal čerstvého vzduchu. Obvykle kolem šesti hodin večer.");
};