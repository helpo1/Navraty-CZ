
instance DIA_Angar_NW_KAP5_EXIT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 999;
	condition = DIA_Angar_NW_KAP5_EXIT_Condition;
	information = DIA_Angar_NW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_NW_AllDragonsDead(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 59;
	condition = DIA_Angar_NW_AllDragonsDead_Condition;
	information = DIA_Angar_NW_AllDragonsDead_Info;
	description = "Jak se vede?";
};


func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Docela dobře. Ale pořád mám ty šílené bolesti. I když od té doby, co nejsem v Hornickém údolí, se to dost zlepšilo.
	if(Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Zůstanu tady! Takže kdybys mě potřeboval, víš, kde mě hledat.
	};
};


instance DIA_Angar_NW_KnowWhereEnemy(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_KnowWhereEnemy_Condition;
	information = DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Chystám se opustit Khorinis. Chceš se přidat?";
};


func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Angar_IsOnBoard == FALSE) && Npc_KnowsInfo(other,DIA_Angar_NW_AllDragonsDead) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Chystám se opustit Khorinis. Chceš se přidat?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//Čím dál budu od Hornického údolí, tím líp. Kdy vyrazíme?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Angar je rád za každou míli, o kterou se vzdálí od Hornického údolí. Nabídl mi, že mě na cestě doprovodí.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//Momentálně mám dost lidí na to, aby mohli řídit loď. Možná se k tobě později ještě vrátím.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Fajn. Budu tady, kdybys mě potřeboval.
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Dám ti vědět, až budeme vyplouvat.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Zajdi tedy do přístavu. Pak se tam potkáme.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Zajdi tedy do přístavu. Pak se tam potkáme.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//To se mi líbí.
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//Dám ti vědět, až budeme vyplouvat.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Dobrá.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};


instance DIA_Angar_NW_LeaveMyShip(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_LeaveMyShip_Condition;
	information = DIA_Angar_NW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Zůstaň tady a starej se o své problémy.";
};


func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if((Angar_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Zůstaň tady a starej se o své problémy.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//Dobrá. Vrátím se. Možná to bude tak lepší.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_NW_StillNeedYou(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_StillNeedYou_Condition;
	information = DIA_Angar_NW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Vrať se na palubu!";
};


func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if(((Angar_IsOnBoard == LOG_OBSOLETE) || (Angar_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Vrať se na palubu!
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Jsi horší než já. Trochu víc rozhodnosti by ti jen prospělo. Ještě se uvidíme!
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Angar_NW_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 900;
	condition = DIA_Angar_NW_PICKPOCKET_Condition;
	information = DIA_Angar_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(47,34);
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,Dialog_Back,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};


instance DIA_Angar_NW_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 7;
	condition = DIA_Angar_NW_FOUNDAMULETT_Condition;
	information = DIA_Angar_NW_FOUNDAMULETT_Info;
	description = "Našel jsem tvůj amulet.";
};


func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};


instance DIA_ANGAR_NW_KAPITELORCATTACK(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_kapitelorcattack_condition;
	information = dia_angar_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Slyšel jsi co se stalo?!";
};


func int dia_angar_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (ANGARBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_01_00");	//Slyšel jsi co se stalo?! Město dobyli skřeti!
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_01_01");	//Ano, už jsem si všimnul - nyní bychom měli řešit jak se dostat z téhle pasti.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_01_02");	//Máš nějaký nápad?!
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_01_03");	//Nevím... (zamyšleně) Nejpravděpodobněji se budeme muset prosekat.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_01_04");	//To znamená přímou smrt!
	Info_ClearChoices(dia_angar_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportPsicamp) >= 1)
	{
		Info_AddChoice(dia_angar_nw_kapitelorcattack,"Nabídnout runu do tábora Bratrstva.",dia_angar_nw_kapitelorcattack_psicamp);
	};
	Info_AddChoice(dia_angar_nw_kapitelorcattack,"Myslím, že tak to je.",dia_angar_nw_kapitelorcattack_nogiverune);
};

func void dia_angar_nw_kapitelorcattack_psicamp()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_01");	//Podle toho, kolik je tu skřetů, myslím, že máš pravdu.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_02");	//Nicméně mám u sebe tuhle runu teleportace do Bratrstva. Měl bys ji použít.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_03");	//Ty máš teleportáční runu?! Hmmm... (zamyšleně)
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_05");	//No, tak to samozřejmě děkuji. Ale abych ti řekl pravdu - tak jako voják bych dal přednost ukázat, že se těch hajzlů nebojím.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_06");	//Nikdo nepochybuje o tvé odvaze, Angare! Ale myslím, a ty bys tomu měl rozumět, že šance na to, že se probiješ je nulová. A plížit se neumíš.
	B_GiveInvItems(other,self,ItMi_TeleportPsicamp,1);
	Npc_RemoveInvItems(self,ItMi_TeleportPsicamp,1);
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_08");	//Eh! Tak dobře... (vážně) Když to žádáš, udělám to! Jen počkám na ten správný moment.
	ANGARNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Angarovi runu teleportace do Bratrstva! Myslím, že teď v pohodě opustí přístav.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_angar_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_00");	//Myslím, že tak to je.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Myslím, že s tím množstvím máš pravdu, myslím, že nebude jen tak možné se dostat přes město!
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_02");	//V každém případě to musíme zkusit.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Dobrá, Angare! Snad to dokážeme.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Tak snad, příteli.
	B_LogEntry(TOPIC_HELPCREW,"Angar se rozhodl probít městem. Je to čisté šílenství, ale doufám, že ho ještě někdy potkám. Koneckonců, Angar není zase tak špatný válečník!");
	ANGARBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_DJG_705_ANGAR_NW_FUCKOFF(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 2;
	condition = dia_djg_705_angar_nw_fuckoff_condition;
	information = dia_djg_705_angar_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_DJG_705_ANGAR_NW_YOURFREE(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_djg_705_angar_nw_yourfree_condition;
	information = dia_djg_705_angar_nw_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_yourfree_info()
{
	AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_08");	//Co tu děláš?!
	AI_Output(other,self,"DIA_DJG_705_Angar_NW_YourFree_01_00");	//Jednoduše bych ti chtěl povědět, že jsi volný!
	AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_01");	//(udiveně) Ty jsi sejmul všechny skřety ve městě?!
	AI_Output(other,self,"DIA_DJG_705_Angar_NW_YourFree_01_02");	//No, už to tak nějak bude.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_03");	//Výborně příteli! Konečně je to za námi.
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_04");	//Otevři ty mříže ať můžu vypadnout.
	}
	else
	{
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_05");	//Výborně příteli! Konečně je to za námi.
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_06");	//Otevři ty mříže ať můžu vypadnout.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DJG_705_ANGAR_NW_OPENGATENOW(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_djg_705_angar_nw_opengatenow_condition;
	information = dia_djg_705_angar_nw_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (ANGARISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_opengatenow_info()
{
	AI_Output(self,other,"DIA_DJG_705_Angar_NW_OpenGateNow_01_00");	//Dobrá a na co čekáš?! Otevři ty mříže!
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_PSICAMPHOME(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_psicamphome_condition;
	information = dia_angar_nw_psicamphome_info;
	permanent = FALSE;
	description = "Znovu doma.";
};


func int dia_angar_nw_psicamphome_condition()
{
	if((REPLACEPLACESCREW == TRUE) && (ANGARCAPTURED == FALSE) && ((ANGARNOBATTLETHROUGTH == TRUE) || (ANGARBATTLETHROUGTH == TRUE)))
	{
		return TRUE;
	};
};

func void dia_angar_nw_psicamphome_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_NW_PsiCampHome_01_00");	//Znovu doma.
	AI_Output(self,other,"DIA_Angar_NW_PsiCampHome_01_01");	//Ano... Stále jako v průběhu časů kolonie!
	AI_Output(other,self,"DIA_Angar_NW_PsiCampHome_01_02");	//Jsi znovu hlavou templářů?!
	AI_Output(self,other,"DIA_Angar_NW_PsiCampHome_01_03");	//Teď ještě ne. (vážně) Prvně si musím trochu odpočinout a zotavit ze všech nedávných událostí.
	AI_Output(self,other,"DIA_Angar_NW_PsiCampHome_01_04");	//Věřím, že Gor Na Kosh mou práci prozatím zastane skvěle.
	AI_Output(other,self,"DIA_Angar_NW_PsiCampHome_01_06");	//Jistě.
};


instance DIA_ANGAR_NW_GOONORKSHUNT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_goonorkshunt_condition;
	information = dia_angar_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Potřebuji, abys mi pomohl proti skřetům.";
};


func int dia_angar_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ANGARCAPTURED == FALSE) && (ALLGREATVICTORY == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_NW_GoOnOrksHunt_01_00");	//Potřebuji, abys mi pomohl proti skřetům.
	AI_Output(self,other,"DIA_Angar_NW_GoOnOrksHunt_01_01");	//Hmm... (vážně) Bude mi potěšením ti pomoci.
	AI_Output(self,other,"DIA_Angar_NW_GoOnOrksHunt_01_02");	//Bude to lepší než obyčejné dny plné nudy a nicnedělání.
	AI_Output(self,other,"DIA_Angar_NW_GoOnOrksHunt_01_03");	//Jen řekni, kdy budeme připraveni!
	AI_Output(other,self,"DIA_Angar_NW_GoOnOrksHunt_01_04");	//Dobrá.
	ANGARJOINMEHUNT = TRUE;
};


instance DIA_ANGAR_NW_FOLLOWME(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_followme_condition;
	information = dia_angar_nw_followme_info;
	permanent = TRUE;
	description = "Následuj mě!";
};


func int dia_angar_nw_followme_condition()
{
	if((ANGARJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_followme_info()
{
	AI_Output(other,self,"DIA_Angar_NW_FollowMe_01_00");	//Následuj mě!
	AI_Output(self,other,"DIA_Angar_NW_FollowMe_01_01");	//Veď mě.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_STOPHERE(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_stophere_condition;
	information = dia_angar_nw_stophere_info;
	permanent = TRUE;
	description = "Počkej tady!";
};


func int dia_angar_nw_stophere_condition()
{
	if((ANGARJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Angar_NW_StopHere_01_00");	//Počkej tady!
	AI_Output(self,other,"DIA_Angar_NW_StopHere_01_01");	//No, raději se vrátím zpátky na farmu.
	Npc_ExchangeRoutine(self,"CampOn");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_ALLGREATVICTORY(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_allgreatvictory_condition;
	information = dia_angar_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Khorinis je kompletně osvobozen od skřetích nájezdníků!";
};


func int dia_angar_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_angar_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_NW_AllGreatVictory_01_00");	//Khorinis je kompletně osvobozen od skřetích nájezdníků!
	AI_Output(self,other,"DIA_Angar_NW_AllGreatVictory_01_01");	//To jsem opravdu rád... (směje se) Nyní máme všichni trochu klidu.
	AI_Output(self,other,"DIA_Angar_NW_AllGreatVictory_01_02");	//Doufám, že nemáme moc velké ztráty.
};


instance DIA_ANGAR_NW_WHATDONOW(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_whatdonow_condition;
	information = dia_angar_nw_whatdonow_info;
	permanent = FALSE;
	description = "Co budeš dělat teď?";
};


func int dia_angar_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Angar_NW_WhatDoNow_01_00");	//Co budeš dělat teď?
	AI_Output(self,other,"DIA_Angar_NW_WhatDoNow_01_01");	//Nevím... Abych řekl pravdu, tak jsem o tom ještě nepřemýšlel!
	AI_Output(self,other,"DIA_Angar_NW_WhatDoNow_01_02");	//Možná budu nějaký čas v táboře a potom se rozhodnu co dále.
	AI_Output(other,self,"DIA_Angar_NW_WhatDoNow_01_03");	//Jasně.
};


instance DIA_ANGAR_NW_TRAVELONBIGLAND(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_travelonbigland_condition;
	information = dia_angar_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Pluji na kontinent.";
};


func int dia_angar_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_angar_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Angar_NW_TravelOnBigLand_01_00");	//Pluji na kontinent.
	AI_Output(other,self,"DIA_Angar_NW_TravelOnBigLand_01_01");	//Nechtěl bys plout spolu se mnou?
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_02");	//Hmm... A proč ne?
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_03");	//Na tomhle ostrově mě nic nedrží.
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_04");	//Tam snad najdu novou náplň mého života!
	AI_Output(other,self,"DIA_Angar_NW_TravelOnBigLand_01_05");	//Tak pojď do přístavu! Loď je připravena.
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_06");	//Dobrá! Jdu tam.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	ANGARTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Angar mě bude následovat na kontinent - chce najít nový smysl života.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

