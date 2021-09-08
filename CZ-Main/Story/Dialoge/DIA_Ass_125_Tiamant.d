/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

DIA_Ass_125_Tiamant_Teach_2X2_15_25 - opraveno other/self

*/



instance DIA_Ass_125_Tiamant_EXIT(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 999;
	condition = dia_Ass_125_Tiamant_exit_condition;
	information = dia_Ass_125_Tiamant_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_125_Tiamant_exit_condition()
{
	return TRUE;
};

func void dia_Ass_125_Tiamant_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ass_125_Tiamant_PreHALLO(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_PreHALLO_condition;
	information = dia_Ass_125_Tiamant_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_PreHALLO_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((PW_RecoverDeadBodyDay <= (Daynow - 1)) && (MIS_Orc_Pw == LOG_SUCCESS) && (HasimAmuls == TRUE))
	{
		return FALSE;
	}
	else if((MIS_HasimKill == LOG_Running) && (HasimKilled == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return FALSE;
	}
	else if((MIS_OreBugs == LOG_Running) && (Npc_IsInState(self,ZS_Talk)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_02)) && (Npc_IsDead(OreBug_Tiamant_03)) && (Npc_IsDead(OreBug_Tiamant_04)) && (Npc_IsDead(OreBug_Tiamant_05)) && (Npc_IsDead(OreBug_Tiamant_06)))
	{
		return FALSE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (TiamantMurid == FALSE) && (TiamantMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_PreHALLO_01_00");	//(naštvaně) Co chceš?
};

instance DIA_Ass_125_Tiamant_PreHALLO_Kill(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_PreHALLO_Kill_condition;
	information = dia_Ass_125_Tiamant_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TiamantMurid == FALSE) && (PlayerSendToTiamant == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_125_Tiamant_HALLO(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_hallo_condition;
	information = dia_Ass_125_Tiamant_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerSendToTiamant == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_hallo_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_00");	//Takže ty jsi ten novic, co si vysloužil pozornost mistrů Nrozase a Osaira?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_01");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_02");	//Hmm... (respekt) Jak se zdá, udělal jsi na ně velký dojem svými činy.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_03");	//A jestli tomu dobře rozumím, také se ti podařilo zabít velkého černého trola. Je to pravda?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_04");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_05");	//No, zdá se, že v tobě vážně něco je. To stačí. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_06");	//Nyní do práce.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_07");	//Pokud ještě nevíš, koho máš před sebou...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_08");	//... jmenuji se Tiamant Krvavý! Jsem jedním ze čtyř převorů našeho posvátného bratrstva. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_09");	//Jestli tě zajímá, co mám tady za úkol - cvičím zdejší vojáky.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_10");	//Moje cvičení nejsou však jenom o tom, jak správně střílet z luku a držet meč.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_11");	//Stín Masyafu musí být obratný ve všech směrech. Splnit poslání, jenž mu bylo přiděleno.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_12");	//Jelikož i pouhý záblesk myšlenky selhání, je nepřipustitelný a vede k smrti.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_13");	//(tvrdě) A už dost slov. Nejsem tu od mluvení. Chceš-li mluvit, zajdi za mistrem Haniarem.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_14");	//Co se tě týče, je na tobě zda-li na mě uděláš dojem.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_15");	//Pokud to tedy chceš někam dotáhnout!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_16");	//Takže našpicuj uši a poslouchej! Posloucháš?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_17");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_18");	//Takže jeskyni černých trolů jsi zvládl.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_19");	//Ale nyní...! Nyní si budeš muset poradit s mnohem prohnanějším a nebezpečnějším stvořením! Muritanem!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_20");	//To zvíře je velmi obtížné vystopovat během dne, neboť se obvykle pohybuje venku pouze v noci.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_21");	//A během noci loví. Tudíž takové setkání je smrtící.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_22");	//Abych řekl pravdu, jen jeden z mých mužů mi přinesl hlavu Muritana.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_23");	//Ostatní měli buďto smůlu a nevystopovali ho, anebo se nevrátili.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_24");	//Jestliže chceš na mne zapůsobit, budeš muset tvrdě pracovat.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_25");	//Přesto jsem si jistý, že mě nezklameš.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_26");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_27");	//Pak jdi! Doufám, že obstojíš své cti.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_28");	//A ještě jedna věc...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_29");	//Pokud by sis chtěl promluvit s tím bojovníkem, který uspěl, jmenuje se Hasim.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_30");	//Nedávno se vrátil s novými otroky a odpočívá teď v hlavním sále.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_31");	//Máš-li zájem, můžeš si s ním promluvit.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_32");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	TiamantMeet = TRUE;
	MIS_TiamantMuritan = LOG_Running;
	Log_CreateTopic(TOPIC_TiamantMuritan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiamantMuritan,LOG_Running);
	B_LogEntry(TOPIC_TiamantMuritan,"Mistr Tiamant mi nařídil vystopovat a zabít monstrum jménem Muritan. Monstrum vycházející z doupěte pouze v noci. Pouze jeden bojovník zatím dokázal tuto bestii ulovit - Hasim. Rozmluva s ním by jistě nebyla ztrátou času.");
	AI_StopProcessInfos(self);

	if(HasimInserted == FALSE)
	{
		HasimInserted = TRUE;
		Wld_InsertNpc(Ass_170_Adept,"PW_TEMPLE_HASIM");
	};
};

instance DIA_Ass_125_Tiamant_TiamantMuritan(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_TiamantMuritan_condition;
	information = dia_Ass_125_Tiamant_TiamantMuritan_info;
	permanent = FALSE;
	description = "(dát jedovatý tesák)";
};

func int dia_Ass_125_Tiamant_TiamantMuritan_condition()
{
	if((MIS_TiamantMuritan == LOG_Running) && (Npc_HasItems(other,ItAt_PW_MuritanTooth) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_TiamantMuritan_info()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_PW_MuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_PW_MuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_00");	//Chápu správně, že se ti podařilo vystopovat toho netvora?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_TiamantMuritan_01_01");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_02");	//To je úctyhodné.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_03");	//Vidím, že jsi velmi zkušený bojovník.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_04");	//Avšak to stále neznamená, že bych byl připraven z tebe učinit něco více. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_05");	//Znamená to, že se budeš muset ještě hodně snažit, chceš-li v mých očích stoupnout. Mám pro tebe další úkol.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_06");	//Tohle je však trochu jiná záležitost. V údolí se objevila skupinka skřetů.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_07");	//Zdá se, že přišli z hor. Nerozumím tomu.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_08");	//Zřídka bojujeme s těmito tvory. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_09");	//Nyní ovšem znamenají problém.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_10");	//Vyslal jsem k nim posla, ale nevrátil se.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_11");	//Chci, abys je našel a odhalil jejich záměry.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_12");	//Pokud by jednali agresivně, zlikviduješ je.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_13");	//Ale opatrně! Nikdo o tom nesmí vědět.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_14");	//Rozumíš?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_TiamantMuritan_01_15");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_16");	//Výborně. Budu čekat. Jdi!
	MIS_Orc_Pw = LOG_Running;
	MIS_TiamantMuritan = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TiamantMuritan,LOG_SUCCESS);
	Log_CreateTopic(TOPIC_Orc_Pw,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_Running);
	B_LogEntry(TOPIC_TiamantMuritan,"Informoval jsem mistra Tiamanta o zabití Muritana. Myslím, že jsem si získal jeho respekt.");
	B_LogEntry_Quiet(TOPIC_Orc_Pw,"Nyní mám vypátrat skupinku skřetů, kteří se objevili v údolí, a zjistit jejich záměry.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(ORCWARRIOR4_PW_01,"PW_ORC_01");
	Wld_InsertNpc(ORCWARRIOR4_PW_02,"PW_ORC_02");
	Wld_InsertNpc(ORCWARRIOR4_PW_03,"PW_ORC_03");
	Wld_InsertNpc(ORCWARRIOR4_PW_04,"PW_ORC_04");
	Wld_InsertNpc(ORC_PW_SCOUT,"PW_ORC_05");
	Wld_InsertNpc(ORCWARRIOR4_COWARD,"PW_ORC_06");
};


instance DIA_Ass_125_Tiamant_Orc_Pw(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_Orc_Pw_condition;
	information = dia_Ass_125_Tiamant_Orc_Pw_info;
	permanent = FALSE;
	description = "(dát hlavu novice)";
};

func int dia_Ass_125_Tiamant_Orc_Pw_condition()
{
	if((MIS_Orc_Pw == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Masiafadept_Kopf) >= 1) && (Npc_IsDead(ORCWARRIOR4_PW_01)) && (Npc_IsDead(ORCWARRIOR4_PW_02)) && (Npc_IsDead(ORCWARRIOR4_PW_03)) && (Npc_IsDead(ORCWARRIOR4_PW_04)) && (Npc_IsDead(ORC_PW_SCOUT)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_Orc_Pw_info()
{

	B_GiveInvItems(other,self,ItMi_Addon_Masiafadept_Kopf,1);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_00");	//Hm... (smutně) takže zabili posla. To jsem očekával. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_01");	//Doufám, že jsi je po zásluze potrestal.
	B_GiveInvItems(self,other,ItMi_Addon_Masiafadept_Kopf,1);

	if(Npc_IsDead(ORCWARRIOR4_COWARD))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_02");	//(přikývnutí)
		AI_PlayAni(other,"T_YES");
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_03");	//Fajn. Na tohle můžeme zapomenout. 
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_04");	//Nyní si odpočiň.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_05");	//Dám ti vědět, pokud budu mít zase nějakou práci.
		MIS_Orc_Pw = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_SUCCESS);
		B_LogEntry(TOPIC_Orc_Pw,"Sdělil jsem mistru Tiamantovi, že jsem skoncoval se skřety.");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_06");	//(mlčení)
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_07");	//Mluv!
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_08");	//Bohužel, jeden skřet unikl, mistře.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_09");	//To je tedy velmi nedobrá zpráva, novici.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_10");	//Skřeti tedy nyní vědí o naší přítomnosti. A jistě mají myšlenky na pomstu.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_11");	//Na druhou stranu, bojovníci potřebují nějaké rozptýlení.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_12");	//Berme to jako cvičení, ostré cvičení.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_13");	//Možná je to nakonec tak nejlepší.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_14");	//Nyní si odpočiň.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_15");	//Dám ti vědět, pokud budu mít zase nějakou práci.
		PW_OrcRevengeDay = Wld_GetDay();
		PW_OrcRevenge = TRUE;
		MIS_Orc_Pw = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_SUCCESS);
		B_LogEntry(TOPIC_Orc_Pw,"Informoval jsem mistra Tiamanta o tom, že jeden ze skřetů unikl.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_125_Tiamant_HasimKill(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HasimKill_condition;
	information = dia_Ass_125_Tiamant_HasimKill_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HasimKill_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((PW_RecoverDeadBodyDay <= (Daynow - 1)) && (MIS_Orc_Pw == LOG_SUCCESS) && (HasimAmuls == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HasimKill_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_00");	//Tady jsi, novici.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_01");	//Mám pro tebe opravdu delikátní úkol.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_02");	//Jde o jednoho z našich bojovníků, Hasima. Myslím, že víš, kdo to je.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKill_01_03");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_04");	//Skvěle, nebudu ztrácet čas a přejdu k věci. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_05");	//Je to docela jednoduché - musíš ho zabít! Nepotřebuješ vědět důvod.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_06");	//Ale musíš to udělat tajně - tak, aby tě nikdo neviděl!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_07");	//Chápeš?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKill_01_08");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_09");	//Dobře. Doufám, že se ti to podaří.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_10");	//Dá se říct, že máš svou budoucnost ve vlastních rukou.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_11");	//A teď už jdi.
	MIS_HasimKill = LOG_Running;
	Log_CreateTopic(TOPIC_HasimKill,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_Running);
	B_LogEntry(TOPIC_HasimKill,"Mistr Tiamant mi přikázal zabít Hasima. Nesdělil mi důvod - jen to, že vraždu musím provést tajně a mimo tábor.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_125_Tiamant_HasimKillDone(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HasimKillDone_condition;
	information = dia_Ass_125_Tiamant_HasimKillDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HasimKillDone_condition()
{
	if((MIS_HasimKill == LOG_Running) && (HasimKilled == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HasimKillDone_info()
{
	B_GivePlayerXP(400);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_00");	//Novici! Co ta záležitost s Hasimem? Je to hotovo?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKillDone_01_01");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_02");	//Dobře. Doufám, že netrpěl.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_03");	//A co se tebe týče, mám tady další složitou záležitost.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_04");	//Mistr Osair, mi poslal zprávu. V dole žerou otroky nějaké bestie. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_05");	//Ruda je pro nás důležitá. Bez ní nebudou zbraně a zbroje pro naše vojáky. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_06");	//Mistr Osair si nemůže dovolit poslat tam své bojovníky, neboť pak by neměl dostatek mužů pro hlídání otroků.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_07");	//Takže požádal mne, abych problém vyřešil. A já nyní žádám tebe o totéž.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_08");	//Postarej se o ty bestie. Nikdy už nám nesmí způsobit potíže.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKillDone_01_09");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_10");	//Dobrá. Nyní tedy můžeš jít.
	MIS_OreBugs = LOG_Running;
	B_LogEntry(TOPIC_HasimKill,"Informoval jsem mistra Tiamanta o Hasimově smrti. Překvapil mne klid, s jakým na zprávu reagoval. Každopádně převorův záměr pro mne nadále zůstává neznámý.");
	Log_CreateTopic(TOPIC_OreBugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OreBugs,LOG_Running);
	B_LogEntry_Quiet(TOPIC_OreBugs,"Musím jít do dolu a zabít tvory, kteří žerou tamější otroky. Myslím, že bych si měl pospíšit.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OreBug_Tiamant_01,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_02,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_03,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_04,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_05,"PW_CAVEORE_01_TEMP");
	Wld_InsertNpc(OreBug_Tiamant_06,"PW_CAVEORE_02_TEMP");
	B_KillNpc(SEK_179_SLAVEOBSSEK);
	B_KillNpc(SEK_180_SLAVEOBSSEK);
	B_KillNpc(SEK_181_SLAVEOBSSEK);
	B_KillNpc(Ass_182_Adept);
};

instance DIA_Ass_125_Tiamant_OreBugsKilled(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_OreBugsKilled_condition;
	information = dia_Ass_125_Tiamant_OreBugsKilled_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_OreBugsKilled_condition()
{
	if((MIS_OreBugs == LOG_Running) && (Npc_IsInState(self,ZS_Talk)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_02)) && (Npc_IsDead(OreBug_Tiamant_03)) && (Npc_IsDead(OreBug_Tiamant_04)) && (Npc_IsDead(OreBug_Tiamant_05)) && (Npc_IsDead(OreBug_Tiamant_06)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_OreBugsKilled_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_00");	//Á, to jsi ty novici. Věřím, že jsi nepřišel nadarmo. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_01");	//Snad nějaké novinky ohledně dolu?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_01_02");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_03");	//(Úsměv) Nemusíš se obtěžovat s vysvětlováním.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_04");	//Mistr Osair mi již poslal zprávu.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_05");	//Není pochyb, že jsi odvedl skvělou práci.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_06");	//Skoro bych řekl, že sis vysloužil odměnu!
	MIS_OreBugs = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OreBugs,LOG_SUCCESS);
	B_LogEntry(TOPIC_OreBugs,"Mistr Tiamant již byl informován o mém úspěchu. Vypadal velmi spokojeně.");
	Info_ClearChoices(DIA_Ass_125_Tiamant_OreBugsKilled);
	Info_AddChoice(DIA_Ass_125_Tiamant_OreBugsKilled,"(přikývnout)",DIA_Ass_125_Tiamant_OreBugsKilled_Murid);

};

func void DIA_Ass_125_Tiamant_OreBugsKilled_Murid()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_01");	//Dobře, řeknu ti to takhle.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_02");	//Za tu dobu, co pro mne pracuješ, ses osvědčil jako velmi, velmi schopný člověk. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_03");	//A co víc, nikdy jsi mne nezklamal, a to je to hlavní.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_04");	//Sečteno a podtrženo - soudím, že jsi hoden být mým muridem.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_05");	//Myslím, že víš, co to znamená a věřím, že mne nezklameš.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_06");	//Děkuji, mistře.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_07");	//Zasloužíš si to. Je to tvá odměna.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_08");	//A co mám teď dělat?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_09");	//Momentálně nemám pro tebe žádný úkol. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_10");	//Věřím ale, že brzy se to změní.
	TiamantMurid = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry_Quiet(TOPIC_MasiafStory,"Mistr Tiamant mě jmenoval svým muridem. Věřím, že se brzy naskytne příležitost pro mé povýšení na jednoho z vrahů. To by uvolnilo mé svázané ruce.");
	AI_StopProcessInfos(self);
};


//---------------------------------------------------------------------


instance DIA_Ass_125_Tiamant_HaniarQuest1(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HaniarQuest1_condition;
	information = dia_Ass_125_Tiamant_HaniarQuest1_info;
	permanent = FALSE;
	description = "O Hasimovi...";
};

func int dia_Ass_125_Tiamant_HaniarQuest1_condition()
{
	if((GonsalesAdvice == TRUE) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HaniarQuest1_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_01");	//Nerad tě ruším, mistře, ale musím s tebou mluvit o Hasimovi.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_02");	//Hmmm... (překvapeně) Pokud si dobře pamatuji, zemřel tvou rukou.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_03");	//Ano a to je ten problém.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_04");	//Jakto?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_05");	//Protože mistr Haniar je velmi znepokojen a chtěl by zjistit, co se stalo.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_06");	//Ach tak. Ano, no zapomněl jsem mistra Haniara zasvětit...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_07");	//A protože je to tedy částečně moje vina, tak ti s tím samozřejmě pomůžu.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_08");	//Jednoduše napíšu mistru Haniarovi dopis, kde mu vše objasním.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_09");	//Kde mám jen ten papír... 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_10");	//No, sakra... u Beliara! Musel jsem ho ztratit.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_11");	//Muride! Přines mi nějaký pořádný papír! Nebudu to přece psát na hadr.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_12");	//A pospěš si! Je to koneckonců i ve tvém zájmu.
	B_LogEntry(TOPIC_HasimKill,"Zdá se, že mistr Tiamant jednoduše zapomněl převory informovat o celé záležitosti. Musím sehnat nějaký papír, aby mistr mohl napsat dopis, kterým mistru Haniarovi vše vysvětlí. Myslím, že tohle zvládnu.");
	AI_StopProcessInfos(self);
	Wld_insertitem(ItWr_TiamantPaperBlank,"FP_ITEM_TIAMANT_LETTER");
};

instance DIA_Ass_125_Tiamant_HaniarQuest2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HaniarQuest2_condition;
	information = dia_Ass_125_Tiamant_HaniarQuest2_info;
	permanent = FALSE;
	description = "Mám tady ten papír, mistře.";
};

func int dia_Ass_125_Tiamant_HaniarQuest2_condition()
{
	if(Npc_HasItems(hero,ItWr_TiamantPaperBlank) >= 1)
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HaniarQuest2_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest2_01_01");	//Mám tady ten papír, mistře.
	B_GiveInvItems(other,self,ItWr_TiamantPaperBlank,1);
	Npc_RemoveInvItems(self,ItWr_TiamantPaperBlank,1);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest2_01_02");	//Dobře, muride. Napíšu ten dopis, počkej minutku.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest2_01_03");	//To by mělo stačit. Nyní ho zanes mistru Haniarovi. Jdi!
	B_GiveInvItems(self,other,ItWr_TiamantPaperToHaniar,1);
	AI_StopProcessInfos(self);
};

instance DIA_Ass_125_Tiamant_HelpWithAssair(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HelpWithAssair_condition;
	information = dia_Ass_125_Tiamant_HelpWithAssair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HelpWithAssair_condition()
{
	if((TiamantNeedsSlaves == TRUE) && (PlayerIsAssNow == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HelpWithAssair_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_01");	//Á, dobře, že jsi přišel. Potřebuji tvoji pomoc!
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HelpWithAssair_01_02");	//O co jde, mistře?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_03");	//Jde o to, že mistr Osair stále neposlal do dolu nové otroky.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_04");	//Taková situace je nepřípustná, potřebujeme rudu.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_05");	//A jako by to samo o sobě nestačilo. (smutně) Sám mistr Haniar Slepý se v tom šťourá. Nechci vypadat jako idiot!
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HelpWithAssair_01_06");	//Rozumím, mistře.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_07");	//Dobře. Ale pospěš si, jde o velmi naléhavou záležitost.
	TiamantSendsToOsair = TRUE;
	B_LogEntry(TOPIC_Intriges,"Mistr Tiamant mě poslal za mistrem Osairem. Mám mu připomenout, aby poslal do dolu nové otroky. Mistr Haniar Slepý se o celou situaci zajímá, což zjevně mistra Tiamanta velmi znepokojuje.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
};

instance DIA_Ass_125_Tiamant_WhatTeach(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_WhatTeach_condition;
	information = dia_Ass_125_Tiamant_WhatTeach_info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit, mistře?";
};

func int dia_Ass_125_Tiamant_WhatTeach_condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_WhatTeach_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_WhatTeach_01_01");	//Můžeš mě něco naučit, mistře?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_02");	//Samozřejmě. Jsi teď jedním z nás, pomůžu ti zlepšit tvoji sílu a obratnost.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_03");	//A také tě mohu naučit pořádně šermovat!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_04");	//Ale to samozřejmě jen pokud ovládáš alespoň nějaké základy.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_05");	//Nemohu ztrácet čas s amatéry.
	TiamantTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Mistr Tiamant mi pomůže vylepšit sílu a obratnost. Také mě může učit, jak zacházet s mečem.");
};

var int Tiamant_MerkeDEX;
var int Tiamant_MerkeSTR;

instance DIA_Ass_125_Tiamant_Teach(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_Teach_Condition;
	information = DIA_Ass_125_Tiamant_Teach_Info;
	permanent = TRUE;
	description = "Chci se stát silnějším a obratnějším.";
};

func int DIA_Ass_125_Tiamant_Teach_Condition()
{
	if(TiamantTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_15_00");	//Chci se stát silnějším a obratnějším.
	Tiamant_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Tiamant_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_Teach_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Tiamant_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_BACK_09_00");	//Skvěle. Nyní jsi zase o něco hbitější.
	};
	if(other.attribute[ATR_STRENGTH] > Tiamant_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_BACK_Add_09_00");	//(spokojeně) Skvěle. Zesílil jsi.
	};
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
};

func void DIA_Ass_125_Tiamant_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

instance DIA_Ass_125_Tiamant_Teach_Weapon(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 7;
	condition = DIA_Ass_125_Tiamant_Teach_Weapon_Condition;
	information = DIA_Ass_125_Tiamant_Teach_Weapon_Info;
	permanent = TRUE;
	description = "Chci se naučit ovládat meč.";
};

func int DIA_Ass_125_Tiamant_Teach_Weapon_Condition()
{
	if(TiamantTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_Weapon_15_00");	//Chci se naučit ovládat meč.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Weapon_15_01");	//Dobře.
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
};

var int TiamantTellFirst;

func void B_TiamantTellFirst()
{
	if(TiamantTellFirst == FALSE)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_00");	//Schopný bojovník se nesnaží pouze zasáhnout soupeře.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_01");	//Odhaduje pohyb soka! Využívá setrvačnosti! Nespoléhá jen na svoji sílu.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_02");	//Nepřítele nikdy nespouštěj z očí.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_03");	//Některý útok lze zablokovat jiný ne.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_04");	//Nauč se poznat ten rozdíl. 
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_05");	//Pamatuj si to a v boji přežiješ déle.
		TiamantTellFirst = TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_Back()
{
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

instance DIA_Ass_125_Tiamant_WhatAbout2X2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_WhatAbout2X2_condition;
	information = dia_Ass_125_Tiamant_WhatAbout2X2_info;
	permanent = FALSE;
	description = "A co takhle něco speciálního?";
};

func int dia_Ass_125_Tiamant_WhatAbout2X2_condition()
{
	if((TiamantTeachMe == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_WhatAbout2X2_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_01");	//A co takhle něco speciálního?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_02");	//Jistě, máš na na mysli boj se dvěmi zbraněmi.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_03");	//Ovšem, to je to nejdokonalejší umění, jehož zvládnutí vyžaduje cestu mistra.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_04");	//Pouze skutečný mistr meče se může něco takového naučit.
	TiamantTeachMe2X2 = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Mistr Tiamant mě může zasvětit do umění boje se dvěmi zbraněmi. Pokud na to mám.");
};

var int RuleTwoHands1H;
var int RuleTwoHands2H;
var int RuleTwoHandsDex;
var int RuleTwoHandsStr;

instance DIA_Ass_125_Tiamant_Teach_2X2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_Teach_2X2_Condition;
	information = DIA_Ass_125_Tiamant_Teach_2X2_Info;
	permanent = TRUE;
	description = "Chci se naučit boji se dvěma zbraněmi.";
};

func int DIA_Ass_125_Tiamant_Teach_2X2_Condition()
{
	if((TiamantTeachMe2X2 == TRUE) && (TiamantTeachMe2X2_Done == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_2X2_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_00");	//Chci se naučit boji se dvěma zbraněmi.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_01");	//Tak se podívejme, co vlastně umíš...

	if(other.attribute[ATR_DEXTERITY] >= 150)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_02");	//Hmmm... (uznale) Vskutku, zdá se, že bys mohl zvládnout umění boje s dvojicí mečů.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_03");	//Tvé schopnosti mne opravdu ohromují. Zasloužíš si respekt.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_04");	//Pak mne to nauč!
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_05");	//(důležitě) Dobře, pozorně poslouchej.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_06");	//Boj s dvojicí zbraní leží především v dokonalé rovnováze a koordinaci.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_07");	//A to se vztahuje na vše: na tvé tělo, tvé pohyby...
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_08");	//Ale popořádku! Nejprve musíš pochopit jednu věc. Ne každá zbraň se hodí pro tento styl boje.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_09");	//Meč v jedné ruce musí být dvojčetem meče v druhé.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_10");	//To je důvod, proč by obě zbraně měly být podobné.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_11");	//Ne-li přímo identické. Stejně těžké a dokonalé, jedině tak lze dosáhnout souhry.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_12");	//A proto taková zbraň bude dokonale vyhovovat tvým potřebám. 
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_13");	//Tvé údery budou přesné a rychlé.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_14");	//Mezitím co udeříš jednou, druhá zbraň se již chystá k dalšímu výpadu.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_15");	//To ti umožní provést naprosto smrtící sérii výpadů.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_16");	//Pokud jde o styl, to je téma opravdu obsáhlé.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_17");	//Boj s dvojicí mečů se podobá spíše tanci než šermování.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_18");	//Od jedné k druhé a tak pořád dookola.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_19");	//To je vše, co pro začátek potřebuješ vědět.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_20");	//Pokud tedy chápeš, co jsem se ti snažil sdělit...
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_21");	//... brzy zjistíš, že jsi na bojišti naprosto bezkonkurenční. Zkrátka skvělý bojovník.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_22");	//Na, vezmi si tohle...
		B_GiveInvItems(self,other,ItWr_DualFight,1);
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_23");	//Zde najdeš další poznatky k tomuto skvělému umění.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_24");	//Zbytek je na tobě.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_25");	//Děkuji, mistře.
		TiamantTeachMe2X2_Done = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_26");	//Hmmm... obávám se, že nejsi připraven.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_27");	//Ale proč, mistře?
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_28");	//Ještě nejsi tak obratný, jak bys měl být!
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_32");	//Rozumíš?
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_33");	//Rozumím, mistře.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_34");	//Ano. Tak raději jdi.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_35");	//Cvič a jednou to dokážeš.

		if(RuleTwoHandsDex == FALSE)
		{
			B_LogEntry_Quiet(TOPIC_PrioratTeacher,"Nejsem dostatečně obratný pro zvládnutí boje se dvěma zbraněmi. (vyžaduje 150 bodů obratnosti)");
			RuleTwoHandsDex = TRUE;
		};
	};
};

instance DIA_Ass_125_Tiamant_DualWeapon(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_DualWeapon_Condition;
	information = DIA_Ass_125_Tiamant_DualWeapon_Info;
	permanent = FALSE;
	description = "Kde sehnat dvojici vhodných zbraní?";
};

func int DIA_Ass_125_Tiamant_DualWeapon_Condition()
{
	if(TiamantTeachMe2X2_Done == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_DualWeapon_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_DualWeapon_01_00");	//Kde sehnat dvojici vhodných zbraní?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_01");	//Hmmm... každý bojovník má své unikátní.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_02");	//Máš jen jednu jedinou možnost, vyrobit si své vlastní!
	AI_Output(other,self,"DIA_Ass_125_Tiamant_DualWeapon_01_03");	//Jak?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_04");	//Hm... odpusť, ale to ti nemohu říci.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_05");	//Ačkoliv... snad jsem slyšel... Mistr Osair by mohl něco vědět. O jistých velmi skvělých zbraních.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_06");	//Možná se s tebou podělí. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_07");	//Záleží na tom, jak budeš přesvědčivý.
	MIS_MoonBlades = LOG_Running;
	Log_CreateTopic(TOPIC_MoonBlades,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Running);
	B_LogEntry(TOPIC_MoonBlades,"Podle mistra Tiamanta by mohl mistr Osair vědět, jak vyrobit dvojici zbraní.");
};