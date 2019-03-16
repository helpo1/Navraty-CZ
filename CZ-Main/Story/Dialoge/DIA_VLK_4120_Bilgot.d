/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Bilgot_NW_finallyintower_info - úpravy výpisů a dialogů (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))

*/




instance DIA_Bilgot_EXIT(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 999;
	condition = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_HALLO(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_HALLO_Condition;
	information = DIA_Bilgot_HALLO_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Hej, odkud přicházíš? Přicházíš z hradu?
	Info_AddChoice(DIA_Bilgot_HALLO,"Ano, přicházím z hradu. Proč?",DIA_Bilgot_HALLO_Burg);
	Info_AddChoice(DIA_Bilgot_HALLO,"Náhodou jsem se zatoulal až sem...",DIA_Bilgot_HALLO_Zufall);
};

func void DIA_Bilgot_HALLO_Zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//Náhodou jsem se zatoulal až sem...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Chlape, nikdo sem nechodí náhodou. Rozhlédni se okolo, jsme obklíčení chňapavci!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//Není dne, kdy by nezakousli alespoň jednoho z nás.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//Nechceš mi říct, odkud přicházíš? Dobrá - ať si tě sežerou!
	AI_StopProcessInfos(self);
};

func void DIA_Bilgot_HALLO_Burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Ano, přicházím z hradu - proč?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//Jak to tam vypadá?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//O nic líp než tady. Skřeti všude okolo.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Zatraceně. Človek není nikde v bezpečí.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//Něco ti řeknu. Kdybych nebyl posraný strachy, prosekal bych se odtud hned pryč.
	Info_ClearChoices(DIA_Bilgot_HALLO);
};


instance DIA_Bilgot_Job(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Job_Condition;
	information = DIA_Bilgot_Job_Info;
	permanent = FALSE;
	description = "A co tady vlastně děláš?";
};


func int DIA_Bilgot_Job_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_Job_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//A co tady vlastně děláš?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//Jsem tady takové děvče pro všechno. Chodím okolo a sleduju chňapavce, Bilgote sem, Bilgote tam.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//Měl jsem radši zůstat doma se svou starou. Nebylo to sice o moc lepší, ale aspoň tam bylo něco pořádného k jídlu.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//A nyní jsem všechno, co zbylo z Fajethových ozbrojenců.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//Jak jsem měl vědět, že se tahle výprava nevrátí?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//Muj přítel Olav se vypařil. Možná mu to vyšlo...
};


instance DIA_Bilgot_Hilfe(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Hilfe_Condition;
	information = DIA_Bilgot_Hilfe_Info;
	permanent = FALSE;
	description = "Co víš o chňapavcích?";
};


func int DIA_Bilgot_Hilfe_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//Co víš o chňapavcích?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//Proč to chceš vědět? A neříkej mi, že jsi jenom zvědavý!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//Chystám se na ty chňapavce vyrazit.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//To je bláznovství. Pozoroval jsem je - jsou to krvežíznivé bestie.
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//Řekni mi, co o nich víš.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Hm... mohl bych ti pomoci - ale jen pod jednou podmínkou!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//Co chceš?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//Když dokážeš zabít chňapavce, musíš mě odsud dostat!
	if(Npc_IsDead(Fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//Nemůžu se tady déle zdržovat. Už jsi mluvil s Fedem? Ten chlap je troska - a já nechci dopadnout jako on!
	};
};


instance DIA_Bilgot_KNOWSLEADSNAPPER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 4;
	condition = DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information = DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent = FALSE;
	description = "Řekni mi, co víš. Potom tě odsud dostanu!";
};


func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_Hilfe) && (MIS_Fajeth_Kill_Snapper == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Řekni mi, co víš. Potom tě odsud dostanu!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//Věděl jsem, že s tebou mužu počítat. Tak dávej pozor. Nějakou dobu jsem ty chňapavce pozoroval.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//Jsou hodně mazaní a nějak se spolu... domlouvají. Nikdy nechodí sami a útočí pouze ve skupině.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//Ale je tu ještě něco. Je mezi nimi ještěr, který je úplne jiný. Ukazuje se jen zřídka, ale já ho viděl.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//Ostatní bestie se klaní, když jde kolem - ale nikdy ho nespustí z očí.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//Dokud se nepohne tenhle, tak ani žádný jiný.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Kde najdu tuhle zatracenou bestii?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//Viděl jsem ji u schodů do staré strážní věže.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//Dobrá. Myslím, že rozumím. Díky!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Pamatuj, dal jsi mi slovo!
	B_LogEntry(TOPIC_FajethKillSnapper,"Bilgot se domnívá, že vůdce chňapavčí smečky nejspíš najdu na schodech staré strážní věže. Alespoň, že to není daleko...");
	Log_CreateTopic(TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BilgotEscort,LOG_Running);
	B_LogEntry_Quiet(TOPIC_BilgotEscort,"Bilgot chce, abych ho dostal z údolí.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01");
};


instance DIA_Bilgot_TAKEYOUWITHME(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_TAKEYOUWITHME_Condition;
	information = DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent = FALSE;
	description = "(Dodržet slib)";
};


func int DIA_Bilgot_TAKEYOUWITHME_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_TAKEYOUWITHME_Info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//Je čas, Bilgote! Sbal si své věci, odcházíme.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Jsem připraven!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	Bilgot.flags = 0;
	MIS_RescueBilgot = LOG_Running;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_LAUFSCHNELLER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 5;
	condition = DIA_Bilgot_LAUFSCHNELLER_Condition;
	information = DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent = FALSE;
	description = "Nemužeš jít trochu rychleji?!";
};


func int DIA_Bilgot_LAUFSCHNELLER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_TAKEYOUWITHME) && (Npc_KnowsInfo(other,DIA_Bilgot_BEIBRUECKEANGEKOMMEN) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Nemužeš jít trochu rychleji?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//Jdu tak rychle, jak jen můžu.
};


instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Tak, jsme tady.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Díky!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Nenech se sežrat. To by byla škoda.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//Sbohem!
	TschuessBilgot = TRUE;
	BilgotDayOut = Wld_GetDay();
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP(XP_BilgotEscort);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};

instance DIA_Bilgot_Olav(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Olav_Condition;
	information = DIA_Bilgot_Olav_Info;
	permanent = FALSE;
	description = "Našel jsem Olava.";
};

func int DIA_Bilgot_Olav_Condition()
{
	if((Npc_HasItems(Olav,ItSe_Olav) == 0) && Npc_KnowsInfo(other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//Našel jsem Olava.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//A jak se má?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//Je mrtvý. Sežrali ho vlci.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//Ale zatraceně. Doufám, že aspoň mně se podaří dostat se odtud.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bilgot_PICKPOCKET(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 900;
	condition = DIA_Bilgot_PICKPOCKET_Condition;
	information = DIA_Bilgot_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bilgot_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Bilgot_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET,Dialog_Back,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};

func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};


//---------------------novyy Bil'got------------------------------------------------

instance DIA_Bilgot_NW_EXIT(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 999;
	condition = DIA_Bilgot_NW_EXIT_Condition;
	information = DIA_Bilgot_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Bilgot_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Bilgot_NW_LetztePause(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 1;
	condition = DIA_Bilgot_NW_LetztePause_Condition;
	information = DIA_Bilgot_NW_LetztePause_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int DIA_Bilgot_NW_LetztePause_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_NW_LetztePause_Info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//Už nemužu dál. Nech mě na chvíli vydechnout. Já to zvládnu. Neboj se!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//Když to říkáš.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Jen malou přestávku.
};

instance DIA_Bilgot_NW_FREEDOM(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 1;
	condition = DIA_Bilgot_NW_FREEDOM_condition;
	information = DIA_Bilgot_NW_FREEDOM_info;
	permanent = FALSE;
	description = "Jak dlouho tady chceš sedět?";
};

func int DIA_Bilgot_NW_FREEDOM_condition()
{
	if((Npc_KnowsInfo(other,DIA_Bilgot_NW_LetztePause) == TRUE) && (BILGOTRECRUITEDDT == FALSE) && (HURRAYICANHIRE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_NW_FREEDOM_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Bilgot_NW_FREEDOM_01_00");	//Jak dlouho tady chceš sedět?
	AI_Output(self,other,"DIA_Bilgot_NW_FREEDOM_01_01");	//Nevím... Je mi to jedno. Stejně nemám kam jít.
	AI_Output(other,self,"DIA_Bilgot_NW_FREEDOM_01_02");	//Tak se pojď do tábora! Najdeš tam všechno co potřebuješ - přístřeší, jídlo a pár chvil na odpočinek.
	AI_Output(self,other,"DIA_Bilgot_NW_FREEDOM_01_03");	//Budu sedět tady a čekat, než mě nějaká příšera sežere.
	AI_Output(self,other,"DIA_Bilgot_NW_FREEDOM_01_04");	//Ach jo, máš pravdu. Pojďme.
	AI_Output(other,self,"DIA_Bilgot_NW_FREEDOM_01_05");	//Následuj mě.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_Bilgot_NW_FINALLYINTOWER(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 1;
	condition = DIA_Bilgot_NW_finallyintower_condition;
	information = DIA_Bilgot_NW_finallyintower_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bilgot_NW_finallyintower_condition()
{
	if((HURRAYICANHIRE == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_02") < 2000))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_NW_finallyintower_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Bilgot_NW_FinallyInTower_01_00");	//Tak jsme tady.
	AI_Output(self,other,"DIA_Bilgot_NW_FinallyInTower_01_01");	//To je tvůj tábor? Působivé...
	AI_Output(other,self,"DIA_Bilgot_NW_FinallyInTower_01_02");	//Zde se můžeš cítit v bezpečí.
	AI_Output(other,self,"DIA_Bilgot_NW_FinallyInTower_01_03");	//Zatím si jdi odpočnout k ohni. A pak začni makat!

	if(NICLASRECRUITEDDT == TRUE)
	{
		AI_Output(other,self,"DIA_Bilgot_NW_FinallyInTower_01_BilgotHunt_01A");	//Přihlaš se u lovce Niclase, shání pomocníka.
	}
	else
	{
		AI_Output(other,self,"DIA_Bilgot_NW_FinallyInTower_01_BilgotHunt_01B");	//Tábor potřebuje někoho, kdo se postará o dodávky čerstvého masa.
	};

	AI_Output(self,other,"DIA_Bilgot_NW_FinallyInTower_01_BilgotHunt_02");	//Hm, dobře. O lovu toho sice až tolik nevím, ale vynasnažím se.

	AI_Output(self,other,"DIA_Bilgot_NW_FinallyInTower_01_04");	//Rozkaz. Děkuju.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Bilgot díky mě opustil údolí a pracuje v táboře jako lovec.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	BILGOTRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Bilgot_NW_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 22;
	condition = DIA_Bilgot_NW_intower_orckap_condition;
	information = DIA_Bilgot_NW_intower_orckap_info;
	permanent = TRUE;
	description = "V pořádku?";
};

func int DIA_Bilgot_NW_intower_orckap_condition()
{
	if(BILGOTRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_NW_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Bilgot_NW_InTower_OrcKap_15_00");	//V pořádku?
	AI_Output(self,other,"DIA_Bilgot_NW_InTower_OrcKap_01_01");	//Lepší to být nemůže. Děkuju ti za pomoc při útěku z údolí.
};