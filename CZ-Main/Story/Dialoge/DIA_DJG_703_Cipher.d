
var int DJG_Cipher_DragonKilledNotYet;

instance DIA_CipherDJG_EXIT(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 999;
	condition = DIA_CipherDJG_EXIT_Condition;
	information = DIA_CipherDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_HALLO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_Cipher_HALLO_Condition;
	information = DIA_Cipher_HALLO_Info;
	description = "Pěkný tábor.";
};


func int DIA_Cipher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info()
{
	AI_Output(other,self,"DIA_Cipher_HALLO_15_00");	//Pěkný tábor.
	AI_Output(self,other,"DIA_Cipher_HALLO_07_01");	//To říkáš ty. Všude jsou jen samý zvířecí mrtvoly a poražený kmeny.
};


instance DIA_CipherDJG_HELLOAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_HELLOAGAIN_Condition;
	information = DIA_CipherDJG_HELLOAGAIN_Info;
	description = "Co tady děláš?";
};


func int DIA_CipherDJG_HELLOAGAIN_Condition()
{
	if((Npc_IsDead(SwampDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Cipher_HALLO))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_HELLOAGAIN_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_01");	//Nějakou dobu tu jen posedávám a čekám na vhodný okamžik.
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_02");	//Vhodný okamžik? Na co?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_03");	//Tamhle nahoře by měl hnízdit drak. Od tý doby, co přišel, tam vzniknul pěkně smradlavej močál.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_04");	//Moc dobře se pamatuju doby, kdy tady kolem bylo úplně sucho.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_05");	//Ale teď už tam nikdy nepůjdu sám.
	if(Npc_IsDead(DJG_Rod) == FALSE)
	{
		AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_06");	//Fajn. Rod je ještě pořád tady. Ale vezme nohy na ramena hned, jak uvidí první žravou štěnici.
	};
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_07");	//A co ty? Ty jsi sem taky nepřišel jen tak pro zábavu, co? Tak tam půjdem spolu.
	B_LogEntry(TOPIC_Dragonhunter,"Podle Ciphera se prý v bažinách v Hornickém údolí usadil drak.");
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN,"Raději zůstávám sám.",DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN,"Proč ne - můžu potřebovat nějakou pomoc.",DIA_CipherDJG_HELLOAGAIN_GoTogether);
};

func void DIA_CipherDJG_HELLOAGAIN_GoAlone()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00");	//Raději zůstávám sám.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01");	//Jak je libo. Asi jsem se v tobě dost spletl!
	AI_StopProcessInfos(self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00");	//Proč ne - můžu potřebovat nějakou pomoc.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01");	//Tak fajn. Konečně odsud můžu vypadnout. Ten zápach je k nevydržení. Stačí říct!
	DJG_SwampParty = TRUE;
	Info_ClearChoices(DIA_CipherDJG_HELLOAGAIN);
};


instance DIA_CipherDJG_GOTOGETHERAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information = DIA_CipherDJG_GOTOGETHERAGAIN_Info;
	description = "Rozmyslel jsem si to! Jdeme tam spolu!";
};


func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_CipherDJG_HELLOAGAIN) && (DJG_SwampParty == FALSE) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_GOTOGETHERAGAIN_15_00");	//Rozmyslel jsem si to! Jdeme tam spolu!
	AI_Output(self,other,"DIA_CipherDJG_GOTOGETHERAGAIN_07_01");	//Stačí říct!
	DJG_SwampParty = TRUE;
};


instance DIA_CipherDJG_GO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GO_Condition;
	information = DIA_CipherDJG_GO_Info;
	description = "Teď by mohla být ta správná chvíle, abychom vyrazili!";
};


func int DIA_CipherDJG_GO_Condition()
{
	if((DJG_SwampParty == TRUE) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};


var int DJG_SwampParty_GoGoGo;

func void DIA_CipherDJG_GO_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_GO_15_00");	//Teď by mohla být ta správná chvíle, abychom vyrazili!
	AI_Output(self,other,"DIA_CipherDJG_GO_07_01");	//Tak jdeme!
	AI_StopProcessInfos(self);
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait1");
	B_StartOtherRoutine(DJG_Rod,"SwampWait1");
};


instance DIA_CipherDJG_SwampWait2(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SwampWait2_Condition;
	information = DIA_CipherDJG_SwampWait2_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SwampWait2_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01") < 700) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_00");	//Ta bažina začíná hned za první zatáčkou. Asi bychom měli jít přímo tudy.
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_01");	//Nebo taky můžeš zkusit ten průchod tamhle. Tam se nám žádná bestie do zad nedostane. Tak jak?
	AI_Output(other,self,"DIA_CipherDJG_SwampWait2_15_02");	//Tak už neztrácejme ani chvilku!
	Info_AddChoice(DIA_CipherDJG_SwampWait2,Dialog_Ende,DIA_CipherDJG_SwampWait2_weiter);
};

func void DIA_CipherDJG_SwampWait2_weiter()
{
	AI_StopProcessInfos(self);
	DJG_SwampParty = TRUE;
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
	B_StartOtherRoutine(DJG_Rod,"SwampWait2");
};


instance DIA_CipherDJG_GoForSwampDragon(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GoForSwampDragon_Condition;
	information = DIA_CipherDJG_GoForSwampDragon_Info;
	important = 1;
	permanent = 0;
};


func int DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01") < 1000) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GoForSwampDragon_Info()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Exit))
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_00");	//(křičí) Útok!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SwampDragon");
		B_StartOtherRoutine(DJG_Rod,"SwampDragon");
	}
	else
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_01");	//Už jsem ty nestvůry zaslechl. Musíme být opatrní!
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_02");	//Pokračuj a sleduj, jestli se dá zaútočit.
		AI_StopProcessInfos(self);
	};
	self.flags = 0;
	DJG_Rod.flags = 0;
};


instance DIA_CipherDJG_SWAMPDRAGONDEAD(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information = DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition()
{
	if((Npc_IsDead(SwampDragon) == TRUE) && (DJG_SwampParty == TRUE) && (DJG_SwampParty_GoGoGo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info()
{
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_00");	//Sakra. Je to mrtvý?
	AI_Output(other,self,"DIA_CipherDJG_SWAMPDRAGONDEAD_15_01");	//Uklidni se. Už je po všem!
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_02");	//Chlape, ty jseš ale eso.
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_CipherDJGDeadDragon);
	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Rod,"Start");
};


instance DIA_CipherDJG_WHATNEXT(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_WHATNEXT_Condition;
	information = DIA_CipherDJG_WHATNEXT_Info;
	permanent = FALSE;
	description = "Bažinný drak je mrtvý!";
};


func int DIA_CipherDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(SwampDragon) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_WHATNEXT_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_WHATNEXT_15_00");	//Bažinný drak je po smrti! Co budeš dělat teď?
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_01");	//Nemám tušení. Ještě jsem o tom nepřemýšlel, vážně. Ale v každym případě se teď můžeš vrátit do Khorinisu jako hrdina.
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_02");	//Vsadím se, že z toho jde docela dost vytěžit. Přemýšlej o tom.
	B_LogEntry(TOPIC_Dragonhunter,"Když je bažinný drak mrtvý, chce z toho Cipher vytřískat nějaké prachy a stát se velkým 'hrdinou'. No, uvidíme.");
	AI_StopProcessInfos(self);
};


instance DIA_CipherDJG_PICKPOCKET(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 900;
	condition = DIA_CipherDJG_PICKPOCKET_Condition;
	information = DIA_CipherDJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_CipherDJG_PICKPOCKET_Condition()
{
	return C_Beklauen(79,220);
};

func void DIA_CipherDJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherDJG_PICKPOCKET);
	Info_AddChoice(DIA_CipherDJG_PICKPOCKET,Dialog_Back,DIA_CipherDJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherDJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_CipherDJG_PICKPOCKET_DoIt);
};

func void DIA_CipherDJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_CipherDJG_PICKPOCKET);
};

func void DIA_CipherDJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_CipherDJG_PICKPOCKET);
};


instance DIA_CipherDJG_FUCKOFF(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 2;
	condition = DIA_CipherDJG_fuckoff_condition;
	information = DIA_CipherDJG_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_CipherDJG_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_CipherDJG_MoreDrugs_Done(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 2;
	condition = DIA_CipherDJG_MoreDrugs_Done_Condition;
	information = DIA_CipherDJG_MoreDrugs_Done_Info;
	permanent = FALSE;
	description = "Mám ještě jeden balíček trávy.";
};

func int DIA_CipherDJG_MoreDrugs_Done_Condition()
{
	if((MIS_MoreDrugs == LOG_Running) && (Npc_HasItems(hero,ItMi_JointPacket_OW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_MoreDrugs_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_CipherDJG_MoreDrugs_Done_01_00");	//Mám ještě jeden balíček trávy.
	AI_Output(self,other,"DIA_CipherDJG_MoreDrugs_Done_01_01");	//(usmívá se) Takže jsi tam byl? To jsi statečnej.
	AI_Output(self,other,"DIA_CipherDJG_MoreDrugs_Done_01_02");	//Tak podívej: ty mě dáš ten balíček, a já tobě polovinu ceny, za kterou se dá získat.
	AI_Output(other,self,"DIA_CipherDJG_MoreDrugs_Done_01_03");	//A kolik je to ve zlatě?
	AI_Output(self,other,"DIA_CipherDJG_MoreDrugs_Done_01_04");	//Nech mě přemýšlet... No asi tisíc zlatých! No tak co, plácnem si?
	AI_Output(other,self,"DIA_CipherDJG_MoreDrugs_Done_01_05");	//Souhlasím! Tady, vezmi si tento balíček.
	B_GiveInvItems(other,self,ItMi_JointPacket_OW,1);
	Npc_RemoveInvItems(self,ItMi_JointPacket_OW,1);
	AI_Output(self,other,"DIA_CipherDJG_MoreDrugs_Done_01_06");	//Výborně! Konečně můj život na této farmě, bude snesitelnej.
	AI_Output(self,other,"DIA_CipherDJG_MoreDrugs_Done_01_07");	//Tady je tvůj podíl. Tak to koukej nepropít! (směje se)
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_MoreDrugs = LOG_Success;
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Success);
	B_LogEntry(Topic_MoreDrugs,"Prodal jsem balíček trávy Cypherovi, za tisíc zlatých.");
	AI_StopProcessInfos(self);
};
