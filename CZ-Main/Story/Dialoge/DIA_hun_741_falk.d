/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

TOPIC_ORcGREATWAR - TOPIC_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_HUN_741_FALK_EXIT(C_Info)
{
	npc = hun_741_falk;
	nr = 999;
	condition = dia_hun_741_falk_exit_condition;
	information = dia_hun_741_falk_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_hun_741_falk_exit_condition()
{
	return TRUE;
};

func void dia_hun_741_falk_exit_info()
{
	AI_StopProcessInfos(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};

instance DIA_HUN_741_FALK_BACKSWORD(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_backsword_condition;
	information = dia_hun_741_falk_backsword_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_741_falk_backsword_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(self,itmw_2h_master_01) == 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_backsword_info()
{
	AI_Output(self,other,"DIA_HUN_741_Falk_BackSword_01_00");	//Než si promluvíme, měl bys udělat jednu věc.
	AI_Output(other,self,"DIA_HUN_741_Falk_BackSword_01_01");	//Jakou věc?
	AI_Output(self,other,"DIA_HUN_741_Falk_BackSword_01_02");	//(přísně) Vrať mi můj meč!
	Info_ClearChoices(dia_hun_741_falk_backsword);

	if(Npc_HasItems(other,itmw_2h_master_01) > 0)
	{
		Info_AddChoice(dia_hun_741_falk_backsword,"Tady ho máš.",dia_hun_741_falk_backsword_yes);
	};

	Info_AddChoice(dia_hun_741_falk_backsword,"Myslím, že si ho ještě nechám.",dia_hun_741_falk_backsword_no);
};

func void dia_hun_741_falk_backsword_yes()
{
	B_GiveInvItems(other,self,itmw_2h_master_01,1);
	Npc_RemoveInvItems(other,itmw_2h_master_01,Npc_HasItems(other,itmw_2h_master_01));
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Tady ho máš.
	AI_Output(self,other,"DIA_Falk_BackSword_06_01");	//Už bylo na čase!
	Info_ClearChoices(dia_hun_741_falk_backsword);
};

func void dia_hun_741_falk_backsword_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Myslím, že si ho ještě nechám.
	AI_Output(self,other,"DIA_Falk_KeepIt_06_03");	//No počkej, ty bastarde!
	Info_ClearChoices(dia_hun_741_falk_backsword);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_HUN_741_FALK_HELLO(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_hello_condition;
	information = dia_hun_741_falk_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_741_falk_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hello_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_00");	//Hej, příteli, ty jsi též lovec?
		AI_Output(other,self,"DIA_HUN_741_Falk_Hello_01_01");	//Proč si to myslíš?
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_02");	//Máš koženou zbroj. Jen lovci můžou takovou nosit.
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_04");	//Rádi v našem táboře vidíme lidi jako jsi ty.
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_05");	//Pojď, posaď se k ohni, odpočiň si od cesty.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_06");	//Hej, kdo jsi? Co tady pohledáváš?
		AI_Output(other,self,"DIA_HUN_741_Falk_Hello_01_07");	//Já? Jenom se procházím, užívám si čerstvého vzduchu...
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_08");	//Ale, ale (směje se) tady jsou takové procházky nebezpečné, zvlášť pro slabochy jako jsi ty!
		AI_Output(self,other,"DIA_HUN_741_Falk_Hello_01_11");	//Dám ti radu - najdi si jiné místo na procházky.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_741_FALK_NEWS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_news_condition;
	information = dia_hun_741_falk_news_info;
	permanent = TRUE;
	description = "Co je nového v táboře?";
};

func int dia_hun_741_falk_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_news_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_News_01_00");	//Co je nového v táboře?

	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_01");	//Poslední dobou se tady nic zvláštního nestalo.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_02");	//Tedy kromě toho, že do našeho tábora přišel nový lovec.
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_03");	//Myslíš mě?
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_04");	//Jasne že tebe... Koho jiného! (směje se)
	}
	else if((Kapitel == 2) && (MIS_INSORCWARRIOR == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_07");	//Když se Barem a Raff vraceli do tábora, narazili v lese na skupinu skřetů.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_08");	//Chlapcům se tak, tak podařilo utéct. A zřejmě těch skřetů nebylo méně než deset!
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_09");	//A co je na tom překvapivého?
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_10");	//Jak jako co?!... (udiveně) Jasně, nejaký skřet se tu a tam objeví, ale ne v takovém množství a po zuby ozbrojení!
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_12");	//Kde na ty skřety narazili?
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_13");	//Barem říkal, že se to stalo nekde poblíž Akilovy farmy. Ale na tvém místě bych tam nechodil.
		MIS_INSORCWARRIOR = LOG_Running;
		Log_CreateTopic(TOPIC_INSORCWARRIOR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSORCWARRIOR,LOG_Running);
		B_LogEntry(TOPIC_INSORCWARRIOR,"Falk mi řekl, že pár lovců potkalo malou skupinu skřetů. Napadlo mě je ulovit, ale Falk tím moc nadšen nebyl. Říkal, že tito skřeti byli viděni v lese poblíž Akilovy farmy.");
		Wld_InsertNpc(orcwarrior_roam_hunt_01,"FP_ROAM_NW_HUNTORK_01");
		Wld_InsertNpc(orcwarrior_roam_hunt_02,"FP_ROAM_NW_HUNTORK_02");
		Wld_InsertNpc(orcwarrior_roam_hunt_03,"FP_ROAM_NW_HUNTORK_03");
		Wld_InsertNpc(orcwarrior_roam_hunt_04,"FP_ROAM_NW_HUNTORK_04");
		Wld_InsertNpc(orcwarrior_roam_hunt_05,"FP_ROAM_NW_HUNTORK_05");
		Wld_InsertNpc(orcwarrior_roam_hunt_06,"FP_ROAM_NW_HUNTORK_06");
		Wld_InsertNpc(orcwarrior_roam_hunt_07,"FP_ROAM_NW_HUNTORK_07");
		Wld_InsertNpc(orcwarrior_roam_hunt_08,"FP_ROAM_NW_HUNTORK_08");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_15");	//Mimochodem, už jsi potkal ty nové chlápky?!
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_16");	//Ano, párkrát to bylo nevyhnutelné.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_18");	//Je to podezřelé - chovají se nějak divně a pořád něco hledají... (zamyšleně)
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_21");	//Všichni kluci jsou z toho na nervy.
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_23");	//Uklidni se, myslím že se to všechno srovná.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_24");	//Doufám, že máš pravdu.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_25");	//Nedávno sem přišlo několik žoldáků.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_27");	//Nabízeli mi a ostatním klukům, abychom jsme se k nim připojili v lovu na draky.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_28");	//To bychom nepřežili. Je to jistá smrt.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_31");	//A já nevidím jediný důvod, proč riskovat život za pár drobných.
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_33");	//V táboře není nového celkem nic, ale za jeho hranicemi je všechno čímdál tím horší a horší!
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_34");	//Z průsmyku do Hornického údolí sem neustále přichází nové příšery.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_35");	//Pokud to tak půjde dál, budou se hemžit všude kolem nás.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_36");	//Nemluvě o skřetech!
	}
	else if(Kapitel == 6)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_37");	//Všichni jsme dost nervózní. Ta situace se skřety je prostě strašná!
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_38");	//Slyšel jsem, že ty příšery útočí na město, nechci vědět, jak to bude vypadat, až udeří jinde.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_39");	//A co paladinové, ochrání nás?!
		AI_Output(other,self,"DIA_HUN_741_Falk_News_01_40");	//Paladinové sotva zastaví takovou hordu skřetů, není jich dost!
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_41");	//Pak máme velmi malou šanci.
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_42");	//Ale pojďme doufat že se to zlepší.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_News_01_43");	//Všechno je při starém. Nic se neděje.
	};
};


instance DIA_HUN_741_FALK_INSORCWARRIOR(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_insorcwarrior_condition;
	information = dia_hun_741_falk_insorcwarrior_info;
	permanent = FALSE;
	description = "Zabil jsem ty skřety!";
};


func int dia_hun_741_falk_insorcwarrior_condition()
{
	if((MIS_INSORCWARRIOR == LOG_Running) && Npc_IsDead(orcwarrior_roam_hunt_01) && Npc_IsDead(orcwarrior_roam_hunt_02) && Npc_IsDead(orcwarrior_roam_hunt_03) && Npc_IsDead(orcwarrior_roam_hunt_04) && Npc_IsDead(orcwarrior_roam_hunt_05) && Npc_IsDead(orcwarrior_roam_hunt_06) && Npc_IsDead(orcwarrior_roam_hunt_07) && Npc_IsDead(orcwarrior_roam_hunt_08))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_insorcwarrior_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_HUN_741_Falk_InsOrcWarrior_01_00");	//Zabil jsem ty skřety, na které narazili Barem a Raffa při lovu.
	AI_Output(self,other,"DIA_HUN_741_Falk_InsOrcWarrior_01_03");	//Co? To myslíš vážně?
	AI_Output(self,other,"DIA_HUN_741_Falk_InsOrcWarrior_01_05");	//(váhavě) No... ani nevím, co říct.
	AI_Output(self,other,"DIA_HUN_741_Falk_InsOrcWarrior_01_06");	//To jsi mě dostal, chlape. Jsme ti vděční.
	MIS_INSORCWARRIOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSORCWARRIOR,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSORCWARRIOR,"Falk byl velmi příjemně překvapen, že jsem porazil ty skřety.");
};


instance DIA_HUN_741_FALK_LEADER(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_leader_condition;
	information = dia_hun_741_falk_leader_info;
	permanent = FALSE;
	description = "Ty jsi tady šéf?";
};

func int dia_hun_741_falk_leader_condition()
{
	if((HEROISHUNTER == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_leader_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"DIA_HUN_741_Falk_Leader_01_00");	//Ty jsi tady šéf?

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Leader_01_01");	//No, něco takového. I když... tady to moc neznamená...
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Leader_01_02");	//A co tě to zajímá... (chladně) Radši bež!
		AI_StopProcessInfos(self);
	};
};

instance DIA_HUN_741_FALK_JOIN(C_Info)
{
	npc = hun_741_falk;
	nr = 5;
	condition = dia_hun_741_falk_join_condition;
	information = dia_hun_741_falk_join_info;
	permanent = FALSE;
	description = "Jak se mužu přidat k vám do tábora?";
};

func int dia_hun_741_falk_join_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_leader) && (HEROISHUNTER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_join_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"DIA_HUN_741_Falk_Join_01_00");	//Chci se k vám přidat.

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_09_1");	//Co to máš na sobě?
		AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_09_2");	//... pořád nejsem přesvědčený, že jsi lovec a že bys byl hoden se k nám připojit.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_01");	//Chceš se stát lovcem?
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_02");	//(smích) A co teda umíš?
		AI_Output(other,self,"DIA_HUN_741_Falk_DuelWon_Hunter_01_03");	//No... Docela rychle se učím novým věcem!
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_07");	//No, dobrá! Snad za námi nebudeš příliš pozadu.
		AI_Output(other,self,"DIA_HUN_741_Falk_Join_01_03");	//Znamená to, že souhlasíš?
		AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_10");	//Možná...
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_13");	//Přesvědči mě, abych toho nemusel litovat.
	};

	AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_91");	//Přines mi tři kůže stínové šelmy, pak si promluvíme.
	MIS_SKINBLACKTROLLFALK = LOG_Running;
	Log_CreateTopic(TOPIC_SKINBLACKTROLLFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SKINBLACKTROLLFALK,LOG_Running);
	B_LogEntry(TOPIC_SKINBLACKTROLLFALK,"Falk potřebuje tři kůže stínové šelmy a pak mě možná přijme do tábora.");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_CAMP(C_Info)
{
	npc = hun_741_falk;
	nr = 4;
	condition = dia_hun_741_falk_camp_condition;
	information = dia_hun_741_falk_camp_info;
	permanent = FALSE;
	description = "Přinesl jsem kůže stínové šelmy.";
};

func int dia_hun_741_falk_camp_condition()
{
	if((MIS_SKINBLACKTROLLFALK == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowFur) >= 3) && (HEROISHUNTER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_camp_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"DIA_HUN_741_Falk_Camp_01_90");	//Přinesl jsem ty kůže stínové šelmy.
	B_GiveInvItems(other,self,ItAt_ShadowFur,3);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,3);
	AI_Output(self,other,"DIA_HUN_741_Falk_Camp_01_03");	//To není možné... (překvapeně) Ty se neztratíš. Kdo by si to pomyslel.
	AI_Output(other,self,"DIA_HUN_741_Falk_Join_01_03");	//Takže jsi mi lhal, nebo mě bereš?
	AI_Output(self,other,"DIA_HUN_741_Falk_Join_01_04");	//Nelhal. Chovej se jako doma - teď je to i tvůj tábor.

	if(Hlp_IsItem(itm,ITAR_Leather_L) == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_09");	//Jo... a vyhoď to oblečení, co máš na sobě.
		AI_Output(self,other,"DIA_HUN_741_Falk_DuelWon_Hunter_01_12");	//Mám slušnou loveckou zbroj. Tak si ji vezmi.
		B_GiveInvItems(self,other,ITAR_Leather_L,1);
	};

	HEROISHUNTER = TRUE;
	MIS_SKINBLACKTROLLFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SKINBLACKTROLLFALK,LOG_SUCCESS);
	B_LogEntry(TOPIC_SKINBLACKTROLLFALK,"Přinesl jsem Falkovi tři kůže stínové šelmy.");
	MIS_HUNTERSWORK = LOG_Running;
	Log_CreateTopic(TOPIC_HUNTERSWORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUNTERSWORK,LOG_Running);
	B_LogEntry_Quiet(TOPIC_HUNTERSWORK,"Falk mě vzal do loveckého tábora.");
};

instance DIA_HUN_741_Falk_MakeHuntArmor(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_MakeHuntArmor_condition;
	information = DIA_HUN_741_Falk_MakeHuntArmor_info;
	permanent = FALSE;
	description = "Měl bys nějakou lepší zbroj?";
};

func int DIA_HUN_741_Falk_MakeHuntArmor_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_MakeHuntArmor_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_MakeHuntArmor_01_00");	//Měl bys nějakou lepší zbroj?
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_01");	//(zamyšleně) Na prodej nemám.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_02");	//Ale protože jsi jeden z nás...
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_03");	//... můžu tě naučit vyrábět zbroj z různých kůží ulovených zvířat.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_04");	//Jsou o hodně silnější než obvyklá zbroj a ochrání tě při lovu.
	AI_Output(other,self,"DIA_HUN_741_Falk_MakeHuntArmor_01_05");	//To je zajímavé.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_06");	//Ne tak rychle kamaráde (úsměv) Pro začátek si to musíš zasloužit.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_07");	//Musím si být úplně jistý, že svoje znalosti předávám lovci a ne nějakému chlápkovi s lukem v ruce.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_08");	//Udělejme dohodu... zlato si od tebe brát nebudu.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_09");	//Ale pro každou lekci od tebe budu žádat nějakou vzácnou trofej.
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_10");	//A ta musí být opravdu vzácná. Jestli rozumíš, co tím myslím. Tak souhlasíš?
	AI_Output(other,self,"DIA_HUN_741_Falk_MakeHuntArmor_01_11");	//Ruku na to!
	AI_Output(self,other,"DIA_HUN_741_Falk_MakeHuntArmor_01_12");	//Bezvadné (úsměv) Tak tě čekám až se vrátíš a snad ne s prázdnýma rukama.
	FalkCanTeachArmor = TRUE;
	Log_CreateTopic(TOPIC_TalentHuntArmor,LOG_NOTE);
	B_LogEntry(TOPIC_TalentHuntArmor,"Falk mě může naučit vyrábět zbroje z kůží zvířat. Za každou lekci chce nějakou vzácnou trofej. No, férová cena. Na výrobu těchto zbrojí budu taky potřebovat koželužský stůl a porcovací nůž.");
};

instance DIA_HUN_741_Falk_TeachHuntArmor(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_TeachHuntArmor_condition;
	information = DIA_HUN_741_Falk_TeachHuntArmor_info;
	permanent = TRUE;
	description = "Ohledně vzácných trofejí...";
};

func int DIA_HUN_741_Falk_TeachHuntArmor_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmor == TRUE) && ((FalkCanTeachArmor_01 == FALSE) || (FalkCanTeachArmor_02 == FALSE) || (FalkCanTeachArmor_03 == FALSE) || (FalkCanTeachArmor_04 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmor_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_01_00");	//Co se týká vzácných trofejí.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_01_01");	//Jo? Máš něco?

	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmor);
	Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,Dialog_Back,DIA_HUN_741_Falk_TeachHuntArmor_Back);

	if((Npc_HasItems(other,ItAt_XtoneClaw) >= 1) && (FalkCanTeachArmor_01 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(dát kamenný dráp)",DIA_HUN_741_Falk_TeachHuntArmor_H1);
	};
	if((Npc_HasItems(other,ItAt_DlackTeeth) >= 1) && (FalkCanTeachArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(dát černý tesák)",DIA_HUN_741_Falk_TeachHuntArmor_H2);
	};
	if((Npc_HasItems(other,ItAt_GturTrollHorn) >= 1) && (FalkCanTeachArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(dát roh Utura)",DIA_HUN_741_Falk_TeachHuntArmor_H3);
	};
	if((Npc_HasItems(other,ItAt_CaveBlackFurTroll) >= 1) && (FalkCanTeachArmor_04 == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,"(dát kůži černého jeskynního trola)",DIA_HUN_741_Falk_TeachHuntArmor_H4);
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmor_Back()
{
	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmor);
};

func void DIA_HUN_741_Falk_TeachHuntArmor_H1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAt_XtoneClaw,1);
	Npc_RemoveInvItems(self,ItAt_XtoneClaw,1);

	if(Trophy_StoneClaw == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_StoneClaw,Npc_HasItems(other,ItUt_StoneClaw));
		Trophy_StoneClaw = FALSE;
	};

	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_00");	//Hele, tady mám kamenný dráp.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_01");	//Hmm... zajímavé. To vypadá jako opravdu vzácná trofej.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_02");	//Dobrá, za to tě naučím vyrobit zbroj z vlčích kůží.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H1_01_03");	//Dej mi vědět, až budeš připraven a začneme.
	FalkCanTeachArmor_01 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor,"Přinesl jsem Falkovi kamenný dráp. Za odměnu mě naučí výrobu zbroje z vlčích kůží.");
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H2()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItAt_DlackTeeth,1);
	Npc_RemoveInvItems(self,ItAt_DlackTeeth,1);

	if(Trophy_BlackTeeth == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_BlackTeeth,Npc_HasItems(other,ItUt_BlackTeeth));
		Trophy_BlackTeeth = FALSE;
	};

	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_00");	//Jsem si jistý, že tě bude zajímat tahle trofej.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_01");	//Hmm... máš pravdu. Ano, je to velmi neobvyklá věc.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_02");	//Dobrá, za to tě naučím vyrábět zbroj z kůží wargů.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H2_01_03");	//Dej mi vědět, až budeš připraven a začneme.
	FalkCanTeachArmor_02 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor,"Přinesl jsem Falkovi černý tesák. Za to mě naučí výrobu zbroje z kůží wargů.");
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H3()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItAt_GturTrollHorn,1);
	Npc_RemoveInvItems(self,ItAt_GturTrollHorn,1);

	if(Trophy_UturTrollHorn == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_UturTrollHorn,Npc_HasItems(other,ItUt_UturTrollHorn));
		Trophy_UturTrollHorn = FALSE;
	};

	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_00");	//Na, vezmi tenhle roh.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_01");	//Ohó, kámo. Takovu věc vidím poprvé. Z čeho jsi ji vzal?
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_02");	//Z jednoho fakt velkého a zlého trola.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_03");	//Dobře, hrdino. V tom případě tě naučím vyrábět zbroj z těchto obrovských monster.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H3_01_04");	//Dej mi vědět, až budeš připraven a začneme.
	FalkCanTeachArmor_03 = TRUE;

	if(SBMode == FALSE)
	{
		FalkCanTeachArmor_04 = TRUE;
	};

	B_LogEntry(TOPIC_TalentHuntArmor,"Přinesl jsem Falkovi roh trola Utura. Za to mě naučí výrobu zbroje z kůže trolů.");
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H4()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_CaveBlackFurTroll,1);
	Npc_RemoveInvItems(self,ItAt_CaveBlackFurTroll,1);
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_00");	//Tahle kůže je speciálně pro tebe.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_01");	//Ó, Innosi... (ohromeně) Zvládl jsi zabít černého jeskynního trola?
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_02");	//Jak vidíš.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_03");	//Nemožné! Ještě jsem nepotkal jedince, který by to zvládl.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_04");	//Dobrá, jako důkaz respektu a velkých díků za trofej...
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_05");	//... tě naučím vyrobit zbroj, která tě učiní mistrem lovu.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_06");	//Tuhle zbroj si nezasloužím nosit ani já. Tak věř, že je to velká čest!
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmor_H4_01_07");	//O tom nepochybuji.
	FalkCanTeachArmor_04 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor,"Přinesl jsem Falkovi kůži černého jeskynního trola. Byl ohromen a jako důkaz respektu mě naučí vyrábět zbroj z kůže černého trola.");
};

var int TeachHuntArmorFT;

instance DIA_HUN_741_Falk_TeachHuntArmorDone(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_TeachHuntArmorDone_condition;
	information = DIA_HUN_741_Falk_TeachHuntArmorDone_info;
	permanent = TRUE;
	description = "Nauč mě vyrábět zbroj z kůží.";
};

func int DIA_HUN_741_Falk_TeachHuntArmorDone_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmorDone == FALSE) && ((FalkCanTeachArmor_01 == TRUE) || (FalkCanTeachArmor_02 == TRUE) || (FalkCanTeachArmor_03 == TRUE) || (FalkCanTeachArmor_04 == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_01_00");	//Nauč mě vyrábět zbroj z kůží.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_01_01");	//Dobře! Jaký druh zbroje bys chtěl vyrobit?

	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmorDone);
	Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,Dialog_Back,DIA_HUN_741_Falk_TeachHuntArmorDone_Back);

	if((FalkCanTeachArmor_01 == TRUE) && (Know_HuntArmor_01 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Zbroj z vlčí kůže",DIA_HUN_741_Falk_TeachHuntArmorDone_H1);
	};
	if((FalkCanTeachArmor_02 == TRUE) && (Know_HuntArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Zbroj z kůže warga",DIA_HUN_741_Falk_TeachHuntArmorDone_H2);
	};
	if((FalkCanTeachArmor_03 == TRUE) && (Know_HuntArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Zbroj z trolí kůže",DIA_HUN_741_Falk_TeachHuntArmorDone_H3);
	};
	if((FalkCanTeachArmor_04 == TRUE) && (Know_HuntArmor_04 == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,"Zbroj z kůže černého trola",DIA_HUN_741_Falk_TeachHuntArmorDone_H4);
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_Back()
{
	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmorDone);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H1()
{
	if(TeachHuntArmorFT == FALSE)
	{
    		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_00");   //Poslouchej pozorně. Abys mohl začít, potřebuješ lovecký nůž.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_01");   //A samozřejmě vlčí kůže. Nasbírej jich více. A také zuby a tesáky.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_02");   //Ze všech kůží vyber tu největší a tu nejmenší.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_03");   //Dále dej stranou trochu drápů. Pak dej stranou pruh kůže z hřbetu, ten je dobrý na opasek.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_04");   //Dále vyřežeš další pruh z kůže, který bude přes ramena. To ochrání tvůj hrudník.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_05");   //Poté konce těchto pruhů sepneš k sobě dvěma silnými drápy.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_06");   //Největší kus kůže si přehodíš přes záda, ohneš kolem boků dopředu a zapneš knoflíky z tesáků.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_07");   //A to je vše.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_08");   //Poslouchej pozorně. Abys mohl začít, potřebuješ lovecký nůž.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_09");   //A samozřejmě vlčí kůže. Nasbírej jich více. A také zuby a tesáky.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_10");   //Ze všech kůží vyber tu největší a tu nejmenší.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_11");   //Dej stranou trochu drápů. Pak dej stranou pruh kůže z hřbetu, ta kůže je nejteplejší a je dobrá na opasek.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_12");   //Dále vyřežeš další pruh z kůže, který bude přes ramena. To ochrání tvůj hrudník.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_13");   //Poté konce těchto pruhů sepneš k sobě dvěma silnými drápy.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_14");   //Největší kus kůže si přehodíš přes záda, ohneš kolem boků dopředu a zapneš knoflíky z tesáků.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_15");   //A to je vše.
	};

	Know_HuntArmor_01 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Naučeno: Výroba zbrojí - 'Zbroj lovce-stopaře'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Materiály pro výrobu ZBROJE LOVCE-STOPAŘE: 20x vlčí kůže, 2x drápy, 10x zuby a surová ocel.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H2()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_00");   //Poslouchej a zapamatuj si to. Na začátek potřebuješ lovecký nůž.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_01");   //Obecně postup výroby se liší jen trochu od předchozí zbroje. Odlož nejteplejší hřbetní část kůže a vezmi raději kůží více. Zapamatuj si tento malý rozdíl.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_02");   //Akorát v tomto případě... kůže wargů mají velmi nepříjemný zápach. Takže je nutné vyčistit je pryskyřicí a sírou. Udělej to a puch zmizí.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_03");   //Taky tím srst pěkně učešeš.
		TeachHuntArmorFT = TRUE;
     	}
     else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_04");   //Poslouchej a pamatuj si to.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_05");   //Obecně postup výroby se liší jen trochu od předchozí zbroje. Odlož nejteplejší hřbetní část kůže a vezmi raději kůží více. Zapamatuj si tento malý rozdíl.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_06");   //Akorát v tomto případě... kůže wargů mají velmi nepříjemný zápach. Takže je nutné vyčistit je pryskyřicí a sírou. Udělej to a puch zmizí.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_07");   //Taky tím srst pěkně učešeš.
	};

	Know_HuntArmor_02 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Naučeno: Výroba zbrojí - 'Zbroj lovce-zvěrobijce'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Materiály pro výrobu ZBROJE LOVCE-ZVĚROBIJCE: 10x kůže warga, 12x zuby, 2x surová ocel, síra a pryskyřice.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H3()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_00");   //Tohle nebude jednoduché. Takže poslouchej pozorně. Pro začátek potřebuješ lovecký nůž.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_01");   //Princip je stejný, ale kůže trola je obrovská, takže řezání zabere víc času a vyžaduje i víc umu.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_02");   //Zuby poslouží jako všechny druhy sponek a nýtů. Pryskyřice a uhlí jsou potřeba pro ošetření kůže od malých brouků parazitů, kteří jsou nashromáždění v srsti.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_03");   //Ta největší část kůže se jako vždy použije na záda a ramena. Jen z té kůže nedělej moc velký kus, pak by byla zbroj těžká a ty s ní nemůžeš běžet.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_04");   //Trolí kůže se v podpaží sepne dvěma velkými tesáky.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_05");   //Tohle nebude jednoduché. Takže poslouchej pozorně.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_06");   //Princip je stejný, ale kůže trola je obrovská, takže řezání zabere víc času a vyžaduje i víc umu.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_07");   //Zuby poslouží jako všechny druhy sponek a nýtů. Pryskyřice a uhlí jsou potřeba pro ošetření kůže od malých brouků parazitů, kteří jsou nashromáždění v srsti.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_08");   //Ta největší část kůže se jako vždy použije na záda a ramena. Jen z té kůže nedělej moc velký kus, pak by byla zbroj těžká a ty s ní nemůžeš běžet.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_09");   //Trolí kůže se v podpaží sepne dvěma velkými tesáky.
	};

	Know_HuntArmor_03 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Naučeno: Výroba zbrojí - 'Zbroj lovce-trolobijce'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Materiály pro výrobu ZBROJE LOVCE-TROLOBIJCE: 5x trolí kůže, 4x trolí tesák, 20x zuby, 6x surová ocel, pryskyřice a 3x uhlí.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H4()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_00");	//Způsob výroby této zbroje se trochu liší od zbroje z trolích kůží.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_01");	//Tak pomalu začni vyrábět... To je vše.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_02");	//Pokud všechno uděláš správně, tak vyrobíš nejlepší zbroj, jakou jsem v životě viděl.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_03");	//Bezva! Zkusím všechno nezapomenout.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_04");	//Vyrobit tuhle zbroj vyžaduje vysoké umění!
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_05");	//Tak pomalu začni vyrábět... To je vše.
		AI_Output(self,other,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_06");	//Pokud všechno uděláš správně, tak vyrobíš nejlepší zbroj, jakou jsem v životě viděl.
		AI_Output(other,self,"DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_07");	//Skvělé! Zkusím všechno nezapomenout.
	};

	Know_HuntArmor_04 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print("Naučeno: Výroba zbrojí - 'Zbroj mistra lovce'");
	B_LogEntry(TOPIC_TalentHuntArmor,"Materiály pro výrobu ZBROJE MISTRA LOVCE: 3x kůže černého trola, roh černého trola, 6x trolí tesák, 40x zuby, 8x surová ocel, 3x síra, pryskyřice, 6x uhlí a černá perla.");
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_HUNT(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunt_condition;
	information = dia_hun_741_falk_hunt_info;
	permanent = FALSE;
	description = "Jak jde lov?";
};

func int dia_hun_741_falk_hunt_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunt_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_Hunt_01_00");	//Jak jde lov?
	AI_Output(self,other,"DIA_HUN_741_Falk_Hunt_01_01");	//Žádné závažné problémy. Pokud nezajdeš moc daleko do lesa.
	AI_Output(self,other,"DIA_HUN_741_Falk_Hunt_01_02");	//A nedávno jsme v jedné jeskyni našli opravdové dračí vejce!
	AI_Output(self,other,"DIA_HUN_741_Falk_Hunt_01_03");	//Hodně vzácná věc. Radši nechci pomyslet, kde se tam vzalo...
};


instance DIA_HUN_741_FALK_DRAGON(C_Info)
{
	npc = hun_741_falk;
	nr = 5;
	condition = dia_hun_741_falk_dragon_condition;
	information = dia_hun_741_falk_dragon_info;
	permanent = FALSE;
	description = "Draci se tady mohou brzy objevit.";
};


func int dia_hun_741_falk_dragon_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_hunt) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_dragon_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_HUN_741_Falk_Dragon_01_00");	//Draci se tady mohou brzo objevit.
	AI_Output(self,other,"DIA_HUN_741_Falk_Dragon_01_01");	//Co? (vylekaně) Proč si to myslíš?
	AI_Output(other,self,"DIA_HUN_741_Falk_Dragon_01_02");	//Jdou kolem zprávy, že několik draků bylo viděno v Hornickém údolí.
	AI_Output(self,other,"DIA_HUN_741_Falk_Dragon_01_03");	//Jestli je to pravda - začnou nám tady těžké časy.
	AI_Output(self,other,"DIA_HUN_741_Falk_Dragon_01_08");	//Zatraceně!
};


instance DIA_HUN_741_FALK_TEACHABOUT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_teachabout_condition;
	information = dia_hun_741_falk_teachabout_info;
	permanent = FALSE;
	description = "Kdo mě tady může něco naučit?";
};


func int dia_hun_741_falk_teachabout_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_teachabout_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachAbout_01_00");	//Kdo mě tady může něco naučit?
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_03");	//Niklas tě naučí jak vyrábět šípy a šipky.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_05");	//Ostatní - Alfred, Grom, Ghaan, Grimbald - tě naučí jak získat trofeje ze zvířat.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_06");	//Sbírat lovecké trofeje je nejvýnosnější částí našeho obchodu.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_07");	//Naneštěstí, hodně kluků je v současnosti mimo tábor.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_08");	//Niklas prodává naše výrobky na místě u majáku. Taky má na starosti zásobování tábora masem.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_09");	//Gaan loví poblíž průsmyku do Hornického údolí. Vzpomínám si, že stopuje divnou příšeru, která nejspíš není odtud.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_10");	//Grom se vyskytuje poblíž farmy Onara. Dal jsem mu těžký úkol, takže je asi stále zaneprázdněný.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_11");	//No a Grimbald loví chňapavce na severu poblíž černého trola.
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_12");	//Náhodou jsme začali soutěž, kdo první dovede zabít tohle monstrum. Můžeš se toho zúčastnit. (smích)
	AI_Output(other,self,"DIA_HUN_741_Falk_TeachAbout_01_13");	//A co za to dostanu, když ho zabiju?
	AI_Output(self,other,"DIA_HUN_741_Falk_TeachAbout_01_14");	//Tak ho první zabij a pak uvidíš.
	MIS_BLACKTROLLPARI = LOG_Running;
	Log_CreateTopic(TOPIC_BLACKTROLLPARI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BLACKTROLLPARI,LOG_Running);
	B_LogEntry(TOPIC_BLACKTROLLPARI,"Falk mi řekl o soutěži mezi lovci - kdo první zabije černého trola. I já se mohu soutěže zúčastnit.");
};


instance DIA_HUN_741_FALK_WOLFFURFALK(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_wolffurfalk_condition;
	information = dia_hun_741_falk_wolffurfalk_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};


func int dia_hun_741_falk_wolffurfalk_condition()
{
	if((HEROISHUNTER == TRUE) && Npc_KnowsInfo(hero,dia_hun_741_falk_teachabout))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_wolffurfalk_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalk_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_01");	//Ano. Něco tu pro tebe mám.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_03");	//Jeden obchodník si u mě objednal dvacet vlčích kůží.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_04");	//Bereš to?
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalk_01_05");	//Jasně! Donesu ti ty kůže.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_06");	//Tak teda na tebe čekám s těmi kůžemi do příštího týdne.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalk_01_07");	//Moc to nezdržuj. Můj zákazník nerad dlouho čeká.
	MIS_WOLFFURFALK = LOG_Running;
	Log_CreateTopic(TOPIC_WOLFFURFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLFFURFALK,LOG_Running);
	B_LogEntry(TOPIC_WOLFFURFALK,"Jeden obchodník si u Falka objednal 20 vlčích kůží. Dobrovolně jsem se přihlásil, že mu je přinesu.");
};


instance DIA_HUN_741_FALK_WOLFFURFALKDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_wolffurfalkdone_condition;
	information = dia_hun_741_falk_wolffurfalkdone_info;
	permanent = FALSE;
	description = "Přinesl jsem vlčí kůže.";
};


func int dia_hun_741_falk_wolffurfalkdone_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_WOLFFURFALK == LOG_Running) && (Npc_HasItems(other,ItAt_WolfFur) >= 20))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_wolffurfalkdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalkDone_01_00");	//Přinesl jsem vlčí kůže.
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalkDone_01_02");	//Tady, jak jsi chtěl - přesně dvacet.
	B_GiveInvItems(other,self,ItAt_WolfFur,20);
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_03");	//Dobrá práce, kámo! Myslím že s tím bude Bosper spokojený.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_04");	//A pro tebe, tady - vezmi si podíl. Zasloužíš si to.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_Output(other,self,"DIA_HUN_741_Falk_WolfFurFalkDone_01_05");	//Takže ty pracuješ pro Bospera?
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_06");	//Ne, jen někdy mu splním nějakou malou zakázku.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_07");	//A on za to naoplátku dobře zaplatí.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_09");	//Obchodníci nám dávají své zakázky.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_11");	//Například nedávno jeden obchodník se zajímal o drápy zvláštního chňapavce.
	AI_Output(self,other,"DIA_HUN_741_Falk_WolfFurFalkDone_01_12");	//Jenže kde takového najít?
	MIS_WOLFFURFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WOLFFURFALK,LOG_SUCCESS);
	B_LogEntry(TOPIC_WOLFFURFALK,"Přinesl jsem Falkovi dvacet vlčích kůží.");
};

instance DIA_HUN_741_FALK_BLACKTROLLPARI(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_blacktrollpari_condition;
	information = dia_hun_741_falk_blacktrollpari_info;
	permanent = FALSE;
	description = "Zabil jsem černého trola!";
};

func int dia_hun_741_falk_blacktrollpari_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_BLACKTROLLPARI == LOG_Running) && (Npc_HasItems(other,ItAt_TrollBlackFur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_blacktrollpari_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_HUN_741_Falk_BlackTrollPari_01_00");	//Černý trol je mrtev!
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTrollPari_01_01");	//Kde je důkaz?
	AI_Output(other,self,"DIA_HUN_741_Falk_BlackTrollPari_01_02");	//Tady je kůže.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTrollPari_01_03");	//(překvapeně) To není možné... ty bláho!
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTrollPari_01_04");	//Takže jsi to ty, kdo vyhrál naši soutěž. Na, vezmi si hlavní výhru.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_HUN_741_Falk_BlackTroll_01_05");	//Je to vzácný lektvar.
	MIS_BLACKTROLLPARI = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BLACKTROLLPARI,LOG_SUCCESS);
	B_LogEntry(TOPIC_BLACKTROLLPARI,"Ukázal jsem Falkovi kůži černého trola, kterého jsem zabil a on mě určil výhercem soutěže mezi lovci. Jako odměnu mi dal lektvar.");
};

instance DIA_HUN_741_FALK_MAIN(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_main_condition;
	information = dia_hun_741_falk_main_info;
	permanent = FALSE;
	description = "Proč jsi tady?";
};


func int dia_hun_741_falk_main_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_main_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_Main_01_00");	//Proč jsi tady?
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_01");	//Velím tomu tady, protože jsem nejlepší lovec v táboře.
	AI_Output(other,self,"DIA_HUN_741_Falk_Main_01_05");	//A co tě dělá nejlepším?
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_06");	//Jak co? (překvapeně) Na prvním místě moje lovecké schopnosti.
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_07");	//A pak musíš ukázat touhu a zápal pro naše lovecké řemeslo.
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_08");	//Navíc, být lovcem - to neznamená jen střílet z luku a kuchat ulovenou zvěř.
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_09");	//Lov se musí stát součástí tvé osobnosti!
	AI_Output(self,other,"DIA_HUN_741_Falk_Main_01_13");	//Je to smysl mého života! A bez něho si nedovedu představit život na tomhle světě.
};


instance DIA_HUN_741_FALK_GRAND(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_grand_condition;
	information = dia_hun_741_falk_grand_info;
	permanent = FALSE;
	description = "A kdo tě naučil lovit?";
};


func int dia_hun_741_falk_grand_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_grand_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_Grand_01_00");	//A kdo tě naučil lovit?
	AI_Output(self,other,"DIA_HUN_741_Falk_Grand_01_01");	//Všechno v mém životě jsem se naučil od jednoho člověka - od mého dědečka Bena.
	AI_Output(other,self,"DIA_HUN_741_Falk_Grand_01_03");	//Tvůj děd byl také lovcem?
	AI_Output(self,other,"DIA_HUN_741_Falk_Grand_01_04");	//Ano. A ne ledajakým lovcem. Ale nejlepším lovcem v kraji!
	AI_Output(other,self,"DIA_HUN_741_Falk_Grand_01_09");	//A kde je teď?
	AI_Output(self,other,"DIA_HUN_741_Falk_Grand_01_10");	//To nevím. (smutně) Před sedmi lety šel lovit do hor na severu a od té doby ho nikdo neviděl.
};

instance DIA_HUN_741_FALK_HUNTFORWHAT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_huntforwhat_condition;
	information = dia_hun_741_falk_huntforwhat_info;
	permanent = FALSE;
	description = "Co tady obvykle lovíte?";
};

func int dia_hun_741_falk_huntforwhat_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_huntforwhat_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_HuntForWhat_01_00");	//Co tady obvykle lovíte?
	AI_Output(self,other,"DIA_HUN_741_Falk_HuntForWhat_01_03");	//Zajímá nás každé zvíře, ze kterého můžeme získat nějakou zajímavou trofej. 
	AI_Output(self,other,"DIA_HUN_741_Falk_HuntForWhat_01_02");	//Vlci, mrchožrouti, chňapavci nebo trolové.
	AI_Output(self,other,"DIA_HUN_741_Falk_HuntForWhat_01_04");	//Lovit můžeš cokoliv. Hlavní věc ale je vědět, jak to dělat.
};


instance DIA_HUN_741_FALK_TALKFORWHAT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_talkforwhat_condition;
	information = dia_hun_741_falk_talkforwhat_info;
	permanent = FALSE;
	description = "Řekni mi něco o lovu.";
};


func int dia_hun_741_falk_talkforwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_huntforwhat))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_talkforwhat_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_TalkForWhat_01_00");	//Řekni mi něco o lovu.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_03");	//Každý lov má svoje specifika.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_05");	//Pro začátek potřebuješ vědět, že každé zvíře má svoje zvyky a chování.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_08");	//Například, lovení smečky chňapavců - to je dost odlišné od lovení smečky vlků.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_09");	//Taky musíš vzít v potaz, že rozlišná zvířata útočí a brání se různými způsoby.
	AI_Output(self,other,"DIA_HUN_741_Falk_TalkForWhat_01_11");	//Pokud se v tomhle dobře orientuješ, vypořádáš se s jakoukoliv příšerou.
};


instance DIA_HUN_741_FALK_TALKABOUTHUNT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_talkabouthunt_condition;
	information = dia_hun_741_falk_talkabouthunt_info;
	permanent = TRUE;
	description = "Můžeš mi říct více o lovu?";
};


func int dia_hun_741_falk_talkabouthunt_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_talkforwhat))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_talkabouthunt_info()
{
	AI_Output(other,self,"DIA_HUN_741_TA_01_00");	//Můžeš mi říct více o lovu?
	AI_Output(self,other,"DIA_HUN_741_TA_01_01");	//O místních zvířatech ti můžu říct spoustu věcí.
	AI_Output(self,other,"DIA_HUN_741_TA_01_02");	//Co přesně tě zajímá?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o lovu zvířat.",dia_hun_741_falk_talkabouthunt_other);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o lovu plazů.",dia_hun_741_falk_talkabouthunt_reptile);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Chci vědět víc o lovu dravých šelem.",dia_hun_741_falk_talkabouthunt_predators);
};

func void dia_hun_741_falk_talkabouthunt_other()
{
	AI_Output(other,self,"DIA_HUN_741_TA_Other_01_00");	//Řekni mi více o lovu zvířat.
	AI_Output(self,other,"DIA_HUN_741_TA_Other_01_01");	//Co přesně chceš vědět?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o lovu důlních červů.",dia_hun_741_falk_talkabouthunt_minecrawler);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o lovu divočáků.",dia_hun_741_falk_talkabouthunt_keiler);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o lovu krvavých much.",dia_hun_741_falk_talkabouthunt_bloodfly);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o lovu mrchožroutů.",dia_hun_741_falk_talkabouthunt_scavenger);
};

func void dia_hun_741_falk_talkabouthunt_reptile()
{
	AI_Output(other,self,"DIA_HUN_741_TA_Reptile_01_00");	//Řekni mi více o lovu plazů.
	AI_Output(self,other,"DIA_HUN_741_TA_Reptile_01_01");	//Bezva! O kterých chceš slyšet?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Jak lovit ohnivé ještěry?",dia_hun_741_falk_talkabouthunt_firewaran);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi, jak lovit číhavce.",dia_hun_741_falk_talkabouthunt_luker);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o ještěrech.",dia_hun_741_falk_talkabouthunt_waran);
};

func void dia_hun_741_falk_talkabouthunt_predators()
{
	AI_Output(other,self,"DIA_HUN_741_TA_Predators_01_00");	//Chci vědět více o lovu dravých šelem.
	AI_Output(self,other,"DIA_HUN_741_TA_Predators_01_01");	//Žádný problém! O kom přesně chceš říct?
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,Dialog_Back,dia_hun_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o trolech.",dia_hun_741_falk_talkabouthunt_troll);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o stínových šelmách.",dia_hun_741_falk_talkabouthunt_shadow);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o chňapavcích.",dia_hun_741_falk_talkabouthunt_snapper);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt,"Řekni mi o vlcích.",dia_hun_741_falk_talkabouthunt_wolf);
};

func void dia_hun_741_falk_talkabouthunt_back()
{
	Info_ClearChoices(dia_hun_741_falk_talkabouthunt);
};

func void dia_hun_741_falk_talkabouthunt_scavenger()
{
	if(BONUSHUNTTELL_01 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_01 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Scavenger_01_00");	//Řekni mi o mrchožroutech.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_01");	//Mrchožrouti jsou ti velcí ptáci. Je dobré je lovit po jednom. Jednoho není těžké porazit.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_02");	//Když se k nim přiblížíš, nejprve se začne cítit býti ohrožený a potom na tebe zaútočí. Je dobré na to počkat se zbraní v rukou.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_03");	//Pokud se ti povede zásah předtím, než tě kousne, nepřestávej a pokračuj v boji - mužeš vyhrát bez jediného škrábnutí.
	AI_Output(self,other,"DIA_HUN_741_TA_Scavenger_01_04");	//Pokud tě kousne jako první... No, zas tak to nevadí.
};

func void dia_hun_741_falk_talkabouthunt_bloodfly()
{
	if(BONUSHUNTTELL_02 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_02 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_00");	//Řekni mi něco o krvavých mouchách.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_01");	//Hlavní věc je v tomto případě dobrá pozornost a rychlá reakce.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_02");	//Sekni mečem přesně a s předvídavostí, tito tvorové rychle uhýbají.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_03");	//Dám ti takovou radu - nesekej rychle mečem kolem sebe.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_04");	//Jen stůj a sleduj dráhu letu mouchy. Sleduj, kdy se moucha připraví k útoku.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_06");	//Jakmile se moucha zastaví a chce tě bodnout - sekni ji rychle jednou a uskoč dozadu!
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_07");	//A tohle seknutí je nejlepší provést zdola nahoru. Takhle... (ukazuje)
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HATTACKMOVE");
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_08");	//Sleduješ?
	AI_RemoveWeapon(self);
	AI_TurnToNPC(self,other);
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_09");	//Jo.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_10");	//Dobrá! Když udeláš všechno, jak jsem ti řekl - poradíš si bez problému.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_11");	//Nebo mužeš použít luk, s tím to jde jednoduše.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_12");	//I když se ti šíp nepodaří vystřelit moc dobře - skoro vždycky jim aspoň natrhne křídla.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_13");	//A s děravými křídly už nejsou tak nebezpečné.
	AI_Output(self,other,"DIA_HUN_741_TA_BloodFly_01_14");	//Potom už není těžké je dorazit. Jasné?
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_15");	//Ano, všechno chápu - díky za radu.
};

func void dia_hun_741_falk_talkabouthunt_keiler()
{
	if(BONUSHUNTTELL_03 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_03 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Keiler_01_00");	//Řekni mi o divočácích.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_01");	//Divočáci nejsou příliš chytří a spoléhají se prakticky jen na svou sílu.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_04");	//Pamatuj: hlavní zbraní divočáka je jeho první strašlivé seknutí špičáky.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_05");	//Může tě snadno srazit na zem a jeho silné špičáky tě můžou roztrhnout vejpůl.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_06");	//Takže, nejdůležitější je - nenechej ho zaútočit jako první.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_08");	//Prostě uskoč do strany nebo dozadu. A pak se přemísti k útoku.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_09");	//Několikrát ho sekni, uskoč zase stranou a útok opakuj.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_10");	//Divočák se moc nesoustředí na svoji obranu, takže není těžké na něj útočit.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_11");	//Dále ti neradím lovit divočáka lukem nebo kuší.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_12");	//Šípy a šipky mu nezpůsobují žádné zranění, když nemáš dovednost střílení na vysoké úrovni.
	AI_Output(self,other,"DIA_HUN_741_TA_Keiler_01_13");	//Věř mi, kůže divočáka je velmi tuhá.
	AI_Output(other,self,"DIA_HUN_741_TA_Keiler_01_14");	//Budu si to pamatovat.
};

func void dia_hun_741_falk_talkabouthunt_minecrawler()
{
	if(BONUSHUNTTELL_04 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_04 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_MineCrawler_01_00");	//Řekni mi o důlních červech.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_01");	//Když s nimi budeš bojovat, vzpomeň si na toto - rychle k nim utíkej a zaútoč jako první.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_04");	//Hlavní je nedat důlnímu červovi příležitost zaútočit - má dlouhé kusadla a snadno tě dostane.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_05");	//Pokud budeš bojovat proti jejich válečníkum, je potřeba úplně jiná taktika!
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_06");	//Pláty z techto příšer - nejsilnejší materiál, který jsem kdy viděl. Prakticky neprorazitelný!
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_07");	//Kuše a luky jsou taky celkem k ničemu. Snažit se je zranit šípem nebo šipkou je celkem ztráta času.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_08");	//Mnohem účinnější proti nim bude čepel tvého meče.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_09");	//Snaž se červa držet na dosah zbraně - ale nedovol mu, aby se dostal blíž.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_11");	//Válečníci důlních červů jsou sice nebezpeční, ale taky dost tvrdohlaví a primitivní - jednají instinktivně, zabijí všechno, co jim stojí v cestě.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_12");	//Budou pořád velmi nabuzení, i když už budou zranění - a toho využij.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_13");	//Tvůj meč by si neměl odpočinout, dokud červa nedodělá do konce.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_14");	//Mimochodem, slyšel jsem, že kromě obyčejných důlních červu a válečníku, je ještě jeden speciální druh těchto... příšer.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_15");	//Říká se jim královny důlních červů.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_16");	//Kladou vejce, z kterých se líhnou noví důlní červi.
	AI_Output(self,other,"DIA_HUN_741_TA_MineCrawler_01_17");	//Avšak tady tyto příšery nemáme, ale třeba ty budeš mít větší štěstí. (směje se)
};

func void dia_hun_741_falk_talkabouthunt_waran()
{
	if(BONUSHUNTTELL_05 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_05 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Waran_01_00");	//Řekni mi o ještěrech.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_01");	//Ješteři žijí při pobřeží u moře a rádi se vyhřívají na slunci.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_02");	//I když v malých houštinách nebo lesích je taky občas mužeš potkat.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_06");	//Na tvém místě bych se obával jejich ostrých drápů, kterými trhají kořist.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_07");	//Teď ti řeknu o lovu ještěrů...
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_08");	//Nejpoužitelnejší zbraní proti nim je asi luk nebo kuše.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_09");	//Kůže ještěrů není moc silná!
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_10");	//Prakticky každý šíp pronikne jejich kůží a slušně je zraní.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_11");	//Pokud ale nemáš luk nebo kuši, tak se asi trochu zapotíš.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_12");	//Ještěry jsou dost obratné a v tomto případě bude tedy proti nim nejlepší taktikou protiútok.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_13");	//Nech si k sobě ještěra přiblížit a počkej, až se na tebe pokusí zaútočit.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_14");	//Rychle jí dej úder. Bez ohledu na to, nakolik se ti úder povede, ještěr se mu neubrání.
	AI_Output(self,other,"DIA_HUN_741_TA_Waran_01_15");	//Obvykle stačí jeden přesný zásah, ale pokud se nepodaří - vzdal se a opakuj postup.
};

func void dia_hun_741_falk_talkabouthunt_luker()
{
	if(BONUSHUNTTELL_06 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_06 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Luker_01_00");	//Řekni mi, jak lovit číhavce.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_02");	//Číhavci - nebezpečná zvířata a extrémně nepředvídatelná.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_03");	//Už s jedním číhavcem je těžké se vypořádat, natož tak se dvěmi nebo třemi.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_05");	//Ale mají jednu slabost - pomalost. A toho se musí využít.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_06");	//Takže nečekej na chvíli, kdy bude na tebe útočit - ale zaútoč první!
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_07");	//Dávej jedno seknutí za druhým, nedávej číhavci čas na odpočinek.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_09");	//Ale nezapomínej na svou obranu.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_10");	//Pokud máš pocit, že tvoje údery jsou neúčinné, raději ustup.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_11");	//Počkej na správnou chvíli a zopakuj útok.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_12");	//Pamatuj si - velkou důležitost v boji s číhavcem má dosah jeho drápů a tvé zbraně.
	AI_Output(self,other,"DIA_HUN_741_TA_Luker_01_13");	//Od této potvory si musíš držet bezpečnou vzdálenost, jinak tě dostane svými dlouhými pařáty.
};

func void dia_hun_741_falk_talkabouthunt_firewaran()
{
	if(BONUSHUNTTELL_07 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_07 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_FireWaran_01_00");	//Jak lovit ohnivé ještěry?
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_01");	//Tato zvířata jsou v těchto krajích vzácná.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_02");	//A nikdo z našich lovců je neloví. Je to příliš nezbezpečné.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_06");	//Jejich nejvýraznější znaky jsou výrazně červená barva kůže a velký hřeben na hřbetu.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_08");	//Tyhle potvory tě promění v hořící pochodeň, pokud budeš tak blbý a postavíš se před ně.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_09");	//Sice se můžeš vyhnout jejich drápům a zubům, ale jejich ohnivému dechu je nemožné uniknout.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_10");	//Pokud vím, tak jediný způsob jak je zabít, je naučit se dobře střílet z luku nebo kuše.
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_13");	//Najdi si místo, kde na tebe ještěr nedosáhne a pak přesně vystřel!
	AI_Output(self,other,"DIA_HUN_741_TA_FireWaran_01_14");	//Není lehké je zabít.
};

func void dia_hun_741_falk_talkabouthunt_wolf()
{
	if(BONUSHUNTTELL_08 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_08 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Wolf_01_00");	//Řekni mi o vlcích.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_01");	//Vlci - velmi nebezpečná a agresivní zvířata.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_03");	//Samozřejmě, jeden vlk pro tebe nebude problém.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_04");	//Jenže ve skutečnosti vlci loví pouze ve smečkách.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_05");	//Nejdůležitější věcí při lovení smečky vlků je ze všeho nejvíc rozvážnost a bystrost tvých akcí.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_06");	//Pamatuj, že vylákat vlky ze smečky po jednom, to nefunguje. Vlk není mrchožrout.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_07");	//Stačí, když tě alespoň jeden vlk zaregistruje a jeho druhové se na tebe vrhnou.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_08");	//Takže se pomalu připliž k nim na dostřel šípu a pak ostře vystřel!
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_09");	//Když budeš mít štěstí, jednoho vlka sestřelíš a tak získáš výhodu.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_10");	//Potom vytas zbraň a počkej, dokud ostatní vlci na tebe nezaútočí.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_11");	//Obvykle vlci obklíčí kořist a útočí na ni ze všech stran. K tomu nesmí dojít!
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_12");	//Proveď pár útoků a ustup. To neumožní vlkům aby se rozmístili kolem tebe.
	AI_Output(self,other,"DIA_HUN_741_TA_Wolf_01_13");	//Při útoku vyčkej, až tě bude chtít vlk kousnout a při tom ho zasáhni.
};

func void dia_hun_741_falk_talkabouthunt_snapper()
{
	if(BONUSHUNTTELL_09 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_09 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Snapper_01_00");	//Řekni mi o chňapavcích.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_01");	//Jedině opravdu zkušený lovec může lovit tato zvířata.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_02");	//Samozřejmě, jednoho chňapavce nějak zvládneš, ale oni loví ve smečkách.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_04");	//Nikdy neútoč na chňapavce s lukem nebo kuší!
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_06");	//To vždycky upozorní ostatní jedince a všichni se na tebe vrhnou.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_07");	//Lepší je opatrně se přiblížit a vylákat jen jednoho z nich.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_08");	//Jakmile tě uvidí, zvíře si nenechá ujít potenciální kořist a pomalu se vydá k tobě.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_09");	//Snaž se vylákat ho dál od smečky, připrav se k útoku a vyčkávej.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_11");	//Když k tobě chňapavec přijde blíž, tak se na tebe rychle rozběhne. Tohle je kritický moment.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_12");	//Nesnaž se odrazit jeho kousnutí, to je nemožné. Prostě nejsi na to dost rychlý.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_13");	//Takže ukroč dozadu, klidně víckrát a pak sekni! Pamatuj, jen jednou.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_14");	//Pokud zaútočíš víckrát, tak pak nebudeš mít dost času reagovat na útok zvířete.	
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_15");	//A neutíkej, ale opět počkej až bude chtít zaútočit.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_16");	//Jakmile tě chňapavec bude chtít zase kousnout, uskoč dozadu a jednou sekni.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_19");	//Jasné? A málem bych zapomněl, ještě je tu něco...
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_21");	//Pokud jsi už začal boj s chňapavcem, nepokoušej se utéct. To nepomůže.
	AI_Output(self,other,"DIA_HUN_741_TA_Snapper_01_22");	//Chňapavec běží rychleji než ty a doběhne tě bez problému.
};

func void dia_hun_741_falk_talkabouthunt_shadow()
{
	if(BONUSHUNTTELL_10 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_10 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Shadow_01_00");	//Řekni mi o stínových šelmách.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_03");	//Stínová šelma - jeden z nejnebezpečnějších tvorů, které jsem kdy potkal.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_04");	//Většinou žijí v jeskyních nebo hluboko v lesích, protože jim nevyhovuje denní světlo.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_06");	//Tyhle šelmy loví jen ve tmě. Jejich zrak je výborně přizpůsobený tmě. Proto je lepší se jim v noci vyhnout.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_07");	//Tahle zvířata jsou extrémně silná a mrštná. Ani si neumíš představit jak!
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_10");	//Jediná možnost jak s ní bojovat je hodně dobrá kombinace kvalitní zbraně, vysoké obratnosti a velkého štěstí.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_11");	//Samozřejmě nejlepší způsob jak zabít stínovou šelmu je použít kuši.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_12");	//Avšak jedna šipka se s ní nevypořádá. Lépe dvě nebo tři. 
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_14");	//Pořád můžeš použít svůj meč.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_15");	//Potichu se pliž za šelmou a pak zezadu se pořádně rozmáchni a sekni ji.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_16");	//Pak ji sekej dál, dokud se zvíře neprobere ze spánku.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_17");	//Jakmile o tobě už šelma ví, ustup dozadu a vyčkej.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_18");	//Když se na tebe predátor rozběhne a zkusí tě seknout drápy, tak uskoč dozadu opět a proveď pár výpadů mečem.
	AI_Output(self,other,"DIA_HUN_741_TA_Shadow_01_19");	//Pak se opět vzdal od šelmy a vyčkej na další její útok.
};

func void dia_hun_741_falk_talkabouthunt_troll()
{
	if(BONUSHUNTTELL_11 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_11 = TRUE;
	};
	AI_Output(other,self,"DIA_HUN_741_TA_Troll_01_00");	//Co bych měl vědět, když půjdu lovit troly?
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_01");	//Obvykle trolové žijí vysoko v horách, kde je spousta místa.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_02");	//Přesto občas mohou být viděni na jiných místech, ale velmi vzácně. 
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_03");	//Věř mi, poslat tohle monstrum na onen svět je neskutečně těžké.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_05");	//Trol má tak silnou kůži že jimi nepronikne žádný šíp či šipka, ani vystřelené zblízka.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_06");	//Takže jediná šance je bojovat s ním se zbraní na blízko.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_07");	//Tyhle obludy mají ohromnou sílu. Takže stačí abys schytal jeden zásah a bude z tebe rozmázlý flek.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_08");	//Trolové nemají opravdu žádnou slabost. Ale přesto mají jednu nevýhodu.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_09");	//Kvůli jejich obrovské velikosti a hmotnosti jsou hodně nemotorní.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_10");	//Když poprvé přijdeš před trola, tak hrozivě zařve.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_11");	//Rozběhni se k němu a nezastavuj se! Tvůj hlavní úkol je dostat se k němu zezadu, kam na tebe nedosáhne svými obrovskými pěstmi.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_12");	//Jakmile se ti to povede, máš velkou výhodu v boji.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_13");	//No, potom začni konat svým mečem a dávej si pozor, abys zůstal za jeho zády.
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_14");	//Dost se zapotíš, než dáš této bestii smrtelnou ránu.
	if(Npc_KnowsInfo(other,dia_hun_741_falk_teachabout))
	{
		AI_Output(other,self,"DIA_HUN_741_TA_Troll_01_16");	//A co černí trolové?
		AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_17");	//Ha! Tyhle nestvůry jsou o dost strašlivější než obvyklí trolové.
		AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_18");	//Řeknu ti akorát jednu věc - černý trol pouze jedním úderem pěsti zabil tři chlapy.
		AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_19");	//Takže je lepší se mu vyhnout.
	};
	AI_Output(self,other,"DIA_HUN_741_TA_Troll_01_20");	//Tento ostrov je plný jiných zvířat, které se dají lovit.
};


instance DIA_HUN_741_FALK_BRINGARROW(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrow_condition;
	information = dia_hun_741_falk_bringarrow_info;
	permanent = FALSE;
	description = "Měl bys pro mě nějakou práci?";
};


func int dia_hun_741_falk_bringarrow_condition()
{
	if(MIS_WOLFFURFALK == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrow_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrow_01_00");	//Měl bys pro mě nějakou práci?
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrow_01_01");	//Je potřeba donést tento dopis obchodníkovi Bosperovi ve městě.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrow_01_06");	//Na, vezmi ho a zkus ho neztratit.
	B_GiveInvItems(self,other,itwr_letterfalk,1);
	MIS_LETTERFALK = LOG_Running;
	Log_CreateTopic(TOPIC_LETTERFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LETTERFALK,LOG_Running);
	B_LogEntry(TOPIC_LETTERFALK,"Falk mě požádal donést do města dopis, který je adresovaný obchodníku Bosperovi.");
};


instance DIA_HUN_741_FALK_BRINGARROWFAIL(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrowfail_condition;
	information = dia_hun_741_falk_bringarrowfail_info;
	permanent = FALSE;
	description = "Ohledně tvé žádosti...";
};


func int dia_hun_741_falk_bringarrowfail_condition()
{
	if((FALKLETTEROPENED == TRUE) && (MIS_LETTERFALK == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrowfail_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_00");	//Ohledně tvé žádosti...
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_01");	//Jo?
	if(BOSPERREFUSEARROW == FALSE)
	{
		if(Npc_HasItems(other,ItRw_Arrow) >= 100)
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_02");	//Mám pro tebe sto šípů, jak jsi žádal Bospera v dopise.
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_03");	//A prodám ti je za velmi rozumnou cenu.
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_04");	//Cože? Ty jsi otevřel můj dopis? Jak sis to mohl dovolit?
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_05");	//Jdi mi z očí, idiote!
		}
		else
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_06");	//Z dopisu pro Bospera jsem zjistil, že potřebuješ šípy.
			AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_07");	//Mužu je pro tebe získat. A za přijatelnou cenu!
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_08");	//Jak? Otevřel jsi muj dopis?!... (naštvaně) Co si to dovoluješ?!
			AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_09");	//Kliď se mi z očí, idiote!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_10");	//Přinesl jsem tvuj dopis Bosperovi, ale ten me poslal pryč!
		AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_11");	//Co?... (udiveně) Ale proč?!
		AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowFail_01_12");	//Náhodou jsem otevřel tvuj dopis.
		AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_13");	//Co?! Jak sis to mohl dovolit?!
		AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_16");	//Kliď se mi z očí, idiote! Už nepotřebuju tvoje služby.
	};
	MIS_LETTERFALK = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_LETTERFALK);
	FALKPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_FUCKOFF(C_Info)
{
	npc = hun_741_falk;
	nr = 10;
	condition = dia_hun_741_falk_fuckoff_condition;
	information = dia_hun_741_falk_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_741_falk_fuckoff_condition()
{
	if((FALKPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");

	if((Npc_HasItems(other,itam_benkenob) >= 1) || ((FINDFALKGRANDFATHERSEEK_01 == TRUE) && (FINDFALKGRANDFATHERSEEK_01_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE)))
	{
		AI_Output(other,self,"DIA_HUN_741_Falk_FuckOff_01_01");	//Počkej! Něco pro tebe mám...
		AI_Output(self,other,"DIA_HUN_741_Falk_FuckOff_01_02");	//Od takového blba nic nechci!... (naštvaně) Nebo chceš, aby ti to řekl muj meč?!
		AI_Output(other,self,"DIA_HUN_741_Falk_FuckOff_01_03");	//Uklidni se a vyslechni mě! Mám zprávy o tvém dedečkovi Benovi.
		AI_Output(self,other,"DIA_HUN_741_Falk_FuckOff_01_04");	//Coo? (mění náladu a uklidňuje se)
		AI_Output(self,other,"DIA_HUN_741_Falk_FuckOff_01_06");	//Hmm... (zamyšleně) Dobrá! Když už jsi tady.
		FALKPISSOFF = FALSE;
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_HUN_741_FALK_BRINGARROWDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrowdone_condition;
	information = dia_hun_741_falk_bringarrowdone_info;
	permanent = FALSE;
	description = "Ohledně té práce...";
};

func int dia_hun_741_falk_bringarrowdone_condition()
{
	if((BOSPERGIVEARROWS == TRUE) && (Npc_HasItems(other,ITRW_ZUNTARROW) >= 100) && (MIS_LETTERFALK == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrowdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowDone_01_00");	//Ohledně té práce...
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_01");	//Ano? Máš pro mě něco?
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowDone_01_02");	//Tady, Bosper posílá sto speciálních šípu. 
	B_GiveInvItems(other,self,ITRW_ZUNTARROW,100);
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_03");	//Dobře, takových šípů není nikdy dost!
	AI_Output(other,self,"DIA_HUN_741_Falk_BringArrowDone_01_04");	//Co je to za druh šípů?
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_05");	//No, jak sis už nejspíš všiml, nejsou to obyčejné šípy.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_06");	//Kromě toho, že jsou označené mým jménem, jsou o dost lepší než obyčejné.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_07");	//Tyhle šípy letí mnohem dál a způsobují větší zranění.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_08");	//Hrot je z kalené oceli a opeření je udeláno takovým zpusobem, aby se dalo střílet mnohem přesněji.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_10");	//Tyhle šípy dělá Bosper jenom pro mě.
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_11");	//A dříve je dělal jen pro mého dědečka! A otec Bospera ty šípy dělal jen pro otce mého dědečka! (hrdě)
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowDone_01_12");	//Takže se dá říct, že tyto šípy jsou rodinným dědictvím!
	MIS_LETTERFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LETTERFALK,LOG_SUCCESS);
	B_LogEntry(TOPIC_LETTERFALK,"Falk mi poděkoval, že jsem mu donesl 100 speciálních šípů, které mu poslal obchodník Bosper.");
};


instance DIA_HUN_741_FALK_F(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_f_condition;
	information = dia_hun_741_falk_f_info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int dia_hun_741_falk_f_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_teachabout))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_f_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_F_01_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_HUN_741_Falk_F_01_01");	//Můžu ti ukázat, jak bojovat s obouruční zbraní.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Falk mě může naučit bojovat s obouruční zbraní.");
};


instance DIA_HUN_741_FALK_2H(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_2h_condition;
	information = dia_hun_741_falk_2h_info;
	permanent = TRUE;
	description = "Chci se naučit jak ovládat obouruční meč.";
};


func int dia_hun_741_falk_2h_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_f))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_2h_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_2H_01_00");	//Chci se naučit jak ovládat obouruční meč.
	Info_ClearChoices(dia_hun_741_falk_2h);
	Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
	Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
	Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
};

func void dia_hun_741_falk_2h_back()
{
	Info_ClearChoices(dia_hun_741_falk_2h);
};

func void dia_hun_741_falk_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60))
	{
		if(FALKTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_01");	//Dobrá, začneme od zaeátku.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_02");	//Drž meč svisle. Potřebuješ máchnout velkým obloukem, abys zasáhl nepřítele s takovou velkou zbraní.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_03");	//Sekni přímo z vrchu dolu. To by melo být účinné na každého nepřítele.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_04");	//Využij setrvačnosti, aby ses dostal do původní polohy.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_05");	//Obouruční meč je při bočním útoku ideální, pokud si chceš od protivníka držet dobrý odstup.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_06");	//Zkus začít s tímto.
			FALKTEACHFT = TRUE;
		};
		if((FALKTEACHST == FALSE) && (other.HitChance[NPC_TALENT_2H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_2H_1_01_07");	//Chtěl bych se naučit víc o boji s obouručním mečem.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_08");	//Především zmeň úvodní postavení. Drž meč svisle, oběma rukama a trochu stranou.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_09");	//Teď se rychle napřáhni přes rameno a proveď přesný úder!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_10");	//Protivník bude bez šance.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_11");	//Z této pozice lze provést další útok vpřed. Tím zatlačíš na nepřítele.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_12");	//Otoč se do strany, abys meči dodal rychlost - a další sek!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_13");	//Pokud to nebude stačit, meč se snadno vrátí do původní pozice setrvačností.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_14");	//Dokončíš série, připravíš se na blokování jeho meče a čekáš na další příležitost k útoku.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_1_01_15");	//Tajemství úspěchu je v kombinaci útoků a postojů při boji.
			FALKTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_741_falk_2h);
		Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
	};
};

func void dia_hun_741_falk_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60))
	{
		if(FALKTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_01");	//Dobrá, začneme od začátku.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_02");	//Drž meč svisle. Potřebuješ máchnout velkým obloukem, abys zasáhl nepřítele s takovou velkou zbraní.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_03");	//Sekni přímo z vrchu dolu. To by mělo být účinné na každého nepřítele.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_04");	//Využij setrvačnosti, aby ses dostal do původní polohy.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_05");	//Obouruční meč je při bočním útoku ideální, pokud si chceš od protivníka držet dobrý odstup.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_06");	//Zkus začít s tímto.
			FALKTEACHFT = TRUE;
		};
		if((FALKTEACHST == FALSE) && (other.HitChance[NPC_TALENT_2H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_741_Falk_2H_5_01_07");	//Chci se naučit víc o obouručních zbraních.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_08");	//Především zmeň úvodní postavení. Drž meč svisle, oběma rukama a trochu stranou.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_09");	//Teď se rychle napřáhni přes rameno a proveď přesný úder!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_10");	//Protivník bude bez šance.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_11");	//Z této pozice lze provést další útok vpřed. Tím zatlačíš protivníka.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_12");	//Otoč do strany aby meč nabral rychlost - a další útok!
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_13");	//Pokud to nebude stačit, meč se snadno vrátí do původní pozice.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_14");	//Až dokončíš jednu sérii, chvíli odpočiň a čekej na příležitost k dalšímu útoku.
			AI_Output(self,other,"DIA_HUN_741_Falk_2H_5_01_15");	//Tajemství úspěchu je ve střídání útočných sérií a bojových postojů.
			FALKTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_741_falk_2h);
		Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
	};
};


instance DIA_HUN_741_FALK_FALKGRANDFATHER(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_falkgrandfather_condition;
	information = dia_hun_741_falk_falkgrandfather_info;
	permanent = FALSE;
	description = "Našel jsem velmi zajímavou věc.";
};


func int dia_hun_741_falk_falkgrandfather_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_grand) && (FINDFALKGRANDFATHERSEEK_01 == TRUE) && (Npc_HasItems(other,itwr_falkgrandfather_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_falkgrandfather_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_HUN_741_GF_01_00");	//Našel jsem jednu velmi zajímavou věc. Je možné, že tě bude zajímat.
	AI_Output(self,other,"DIA_HUN_741_GF_01_01");	//Co je to za věc?!... (se zájmem)
	AI_Output(other,self,"DIA_HUN_741_GF_01_02");	//Tento starý záznam. Je v ní zmíněno jméno Ben - tak se jmenoval tvuj dedeček. Nebo snad ne?!
	AI_Output(self,other,"DIA_HUN_741_GF_01_03");	//Co?!... (zmateně) Ukaž mi to!
	B_GiveInvItems(other,self,itwr_falkgrandfather_01,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_HUN_741_GF_01_05");	//Hmm, podle textu... (zamyšleně) se mi zdá, že to psal lovec.
	AI_Output(self,other,"DIA_HUN_741_GF_01_06");	//A kde jsi našel ten starý kus papíru?!
	AI_Output(other,self,"DIA_HUN_741_GF_01_07");	//Poblíž starých ruin na severu.
	AI_Output(self,other,"DIA_HUN_741_GF_01_08");	//Vážně?
	AI_Output(self,other,"DIA_HUN_741_GF_01_09");	//Nevím - muže to být náhoda, ale tam se na lovu před sedmi lety dedeček ztratil.
	AI_Output(self,other,"DIA_HUN_741_GF_01_10");	//(smutně) Tam potom zmizel beze stopy.
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
	Info_AddChoice(dia_hun_741_falk_falkgrandfather,"Znovu se omlouvám.",dia_hun_741_falk_falkgrandfather_no);
	Info_AddChoice(dia_hun_741_falk_falkgrandfather,"Možná ti můžu pomoci?",dia_hun_741_falk_falkgrandfather_yes);
};

func void dia_hun_741_falk_falkgrandfather_no()
{
	AI_Output(self,other,"DIA_HUN_741_GF_No_01_02");	//V každém případě to nic nemění.
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
};

func void dia_hun_741_falk_falkgrandfather_yes()
{
	AI_Output(other,self,"DIA_HUN_741_GF_Yes_01_00");	//Mužu ti s tím nějak pomoct?
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_01");	//Ty?... (udiveně) a jak?!
	AI_Output(other,self,"DIA_HUN_741_GF_Yes_01_02");	//No, například, pomoct ti zjistit, co se stalo tvému dědečkovi.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_06");	//To bys mi udělal velkou laskavost, kamaráde!
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_11");	//Starý pan Ben se taky hodně zajímal o neobvyklé věci.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_12");	//Mimochodem to byl taky důvod, proč se rozhodl jít lovit do těch starých ruin.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_14");	//Často o nich mluvil a pořád přemýšlel o jedné věci - kde se tu vzaly a kdo je postavil.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_15");	//Možná že tahle prastará stavba je nějak spojena s jeho zmizením. Ale to je pouze odhad.
	AI_Output(other,self,"DIA_HUN_741_GF_Yes_01_16");	//Myslím, že to stačí - začnu hledat.
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_17");	//No, tak hodně štěstí ve tvém úkolu, kamaráde!
	FINDFALKGRANDFATHERSEEK_01_DONE = TRUE;
	if(MIS_FALKGRANDFATHERSEEK == FALSE)
	{
		MIS_FALKGRANDFATHERSEEK = LOG_Running;
		Log_CreateTopic(TOPIC_FALKGRANDFATHERSEEK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_Running);
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Po tom, co mi Falk řekl o jeho dědečkovi Benovi, jsem se rozhodl ukázat mu záznam, který jsem našel. Zmiňuje se na něm také jméno Ben. Možná byl záznam napsán Falkovým dědečkem. Nabídl jsem se pomoci Falkovi vyřešit tenhle úkol. Podle něho se starý Ben vždycky zajímal o všechno neobvyklé. Takže možná šel hledat místo, kde by mohl najít divnou příšeru, kterou Ben postřelil během lovu.");
	}
	else if(MIS_FALKGRANDFATHERSEEK == LOG_Running)
	{
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Ukázal jsem Falkovi poznámku zmiňující jméno Ben. Možná se jedná o Falkova dědečka... Rozhodl jsem se Falkovi s tím pomoci. Podle něj se Ben vždycky zajímal o neobvyklé veci. Takže možná šel hledat místo, kde by mohl najít divnou příšeru, kterou Ben postřelil během lovu.");
	};
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
};


instance DIA_HUN_741_FALK_FALKGRANDFATHERPROGRESS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_falkgrandfatherprogress_condition;
	information = dia_hun_741_falk_falkgrandfatherprogress_info;
	permanent = TRUE;
	description = "Co se mého hledání týče...";
};


func int dia_hun_741_falk_falkgrandfatherprogress_condition()
{
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_01_DONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_falkgrandfatherprogress_info()
{
	var int bonuscount;

	bonuscount = FALSE;
	AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_00");	//Ohledně mého hledání...
	AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_01");	//Ano? (se zájmem) Máš nějaké novinky?

	if((Npc_HasItems(other,itam_benkenob) >= 1) || ((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE) && (Npc_HasItems(other,itwr_galkgrandfather_02) >= 1)) || ((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE) && (Npc_HasItems(other,itwr_halkgrandfather_03) >= 1)) || ((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE) && (Npc_HasItems(other,itwr_jalkgrandfather_04) >= 1)) || ((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE) && (Npc_HasItems(other,itwr_kalkgrandfather_final) >= 1)) || ((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE) && (Npc_HasItems(other,itwr_lalkgrandfather_finalext) >= 1)))
	{
		AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_02");	//Máš pravdu. Něco jsem zjistil.
		AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_03");	//Tak už mě nenapínej - mluv!

		if(Npc_HasItems(other,itam_benkenob) >= 1)
		{
			if(FINDFALKGRANDFATHERSEEK_02_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_02_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_03_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_03_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_FINAL_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_FINALEXT_DONE = TRUE;
			};
			bonuscount = bonuscount + 500;
			B_GivePlayerXP(bonuscount);
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_04");	//Tady, našel jsem starý amulet - zezadu je vyraženo jméno ' Ben Kenob '.
			B_GiveInvItems(other,self,itam_benkenob,1);
			Npc_RemoveInvItems(self,itam_benkenob,1);
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_07");	//Ano, to znám... (velmi zmateně) Tak přece jsme se nepletli!
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_10");	//Řekni mi, kde jsi ho našel?!
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_11");	//V žaludku jedné příšery, co jsem zabil - obrovské kudlanky!
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_13");	//Teď je všechno jasné - zřejme si na něm ta svine pochutnala.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_15");	//Dobrá, už se s tím nic nedá dělat.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_16");	//Ale díky za tvou pomoc a jak jsem slíbil - přijmi ode mě tuto odměnu.
			B_GiveInvItems(self,other,ItMi_Gold,1000);
			MIS_FALKGRANDFATHERSEEK = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_SUCCESS);
   			B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Přinesl jsem Falkovi amulet, který jsem našel uvnitř velké kudlanky. Falk mi řekl, že patřil jeho dedečkovi! Zezadu bylo vyraženo jeho jméno. Teď je jasné, že Ben Kenob - Falkuv dedeček, zemřel.");
		}
		else
		{
			if((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE) && (Npc_HasItems(other,itwr_galkgrandfather_02) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_20");	//Tady, našel jsem tuto poznámku v jedné jeskyni na severovýchode ostrova.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_21");	//Vážně?!... (diví se) Hmm, zajímalo by mě, kde se to tam vzalo?!
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_22");	//Co já vím, tak se tam dá dostat jen lodí.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_23");	//(starostlivě) Nechej mě podívat se na to.
				B_GiveInvItems(other,self,itwr_galkgrandfather_02,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_26");	//Hmm... (zamyšlene) Celé to je velmi zajímavé. Ješte něco?!
				FINDFALKGRANDFATHERSEEK_02_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE) && (Npc_HasItems(other,itwr_halkgrandfather_03) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_27");	//Našel jsem další záznam v malém údolí nedaleko pobřeží.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_29");	//(se zájmem) Ukaž mi to.
				B_GiveInvItems(other,self,itwr_halkgrandfather_03,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_31");	//Podle toho záznamu ho tato část ostrova velice ohromila.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_32");	//Vypadá to, že se rozhodl pořádně to tam prozkoumat.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_34");	//Dobrá! Zase víme něco nového. Je to všechno, co ses dozvěděl?!
				FINDFALKGRANDFATHERSEEK_03_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE) && (Npc_HasItems(other,itwr_jalkgrandfather_04) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_35");	//Tento cár papírů jsem našel ve velkém kaňonu na západě.
				B_GiveInvItems(other,self,itwr_jalkgrandfather_04,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_39");	//Hmm... (zamyšleně) V záznamu píše, že tuto oblast vyhodnotil jako velmi nebezpečnou.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_40");	//Doufám, že se mu nic špatného nestalo.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_42");	//Ještě nějaké další zprávy?
				FINDFALKGRANDFATHERSEEK_04_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE) && (Npc_HasItems(other,itwr_kalkgrandfather_final) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_43");	//Našel jsem tento lístek poblíž bažin na východe údolí.
				B_GiveInvItems(other,self,itwr_kalkgrandfather_final,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_49");	//Zajímavé. Nějaké další zprávy?
				FINDFALKGRANDFATHERSEEK_FINAL_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE) && (Npc_HasItems(other,itwr_lalkgrandfather_finalext) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_50");	//Tady je poznámka, kterou jsem našel v bažinách - Ben tam šel hledat toho zvláštního tvora.
				AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_51");	//A zdá se, že jeho lov se nevyvíjel úspešně.
				B_GiveInvItems(other,self,itwr_lalkgrandfather_finalext,1);
				B_UseFakeScroll();
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_54");	//Hmm... Ano. Podle záznamu se zdá, že to tak bylo.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_55");	//Vypadá to, že zvíře bylo velmi vychytralé, takže se mu nepodařilo ho vystopovat.
				AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_58");	//Nic dalšího jsi nezjistil?
				FINDFALKGRANDFATHERSEEK_FINALEXT_DONE = TRUE;
			};

			B_GivePlayerXP(bonuscount);
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_59");	//To je vše.
			AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_60");	//Výborně! Pokračuj v úkolu, třeba se ukáže něco dalšího.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_62");	//Pokusím se.
		AI_Output(self,other,"DIA_HUN_741_GFProgress_Info_01_63");	//(smutně) Dobrá, pokud neco zjistíš - informuj mě o tom.
	};
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallange_condition;
	information = dia_hun_741_falk_hunterchallange_info;
	permanent = FALSE;
	description = "Jak se tady můžu stát vůdcem tábora?";
};


func int dia_hun_741_falk_hunterchallange_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_main) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallange_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_HCh_01_00");	//Jak se tady můžu stát vůdcem tábora?
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_01");	//Velmi jednoduše!... (směje se) Teď jsem v táboře nejlepší lovec já a ty mě mužeš prostě vyzvat.
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_02");	//Pak se v loveckém duelu ukáže, kdo z nás je lepší!
	AI_Output(other,self,"DIA_HUN_741_Falk_HCh_01_03");	//Tak tě vyzývám!
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_05");	//Jenom přání nestačí.
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_07");	//Pokud chceš se mnou soutěžit v umění lovu, měl by sis zařídit respekt a důvěru ostatních lovců.
	AI_Output(self,other,"DIA_HUN_741_Falk_HCh_01_10");	//Až za tebou bude stát vetšina, pak se k tomu vrátíme.
	B_LogEntry(TOPIC_HUNTERSWORK,"Falk je považován za nejlepšího lovce v táboře. Abych to mohl být já, musím si především získat důvěru vetšiny lovců v táboře.");
	CANHUNTERCHALLANGE = TRUE;
};


instance DIA_HUN_741_FALK_CANIHUNTERCHALLANGE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_canihunterchallange_condition;
	information = dia_hun_741_falk_canihunterchallange_info;
	permanent = TRUE;
	description = "Co o mě říkají v táboře?";
};


func int dia_hun_741_falk_canihunterchallange_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_canihunterchallange_info()
{
	var int ransl;

	AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_00");	//Co o mě říkají v táboře?
	if(HUNTCHALLENGECOUNT == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_01");	//Celkem nic. Tak raději začni něco dělat místo toho mluvení.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_02");	//No, mluvil jsem s některými kluky...
		AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_03");	//A?
		if(HUNTCHALLENGECOUNT >= 7)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_04");	//Zdá se, že tě většina v tomto táboře podporuje.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_05");	//Získal jsi respekt mnoha lovců!
			AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_06");	//Znamená to, že teď s tebou mužu soutěžit o titul nejlepšího lovce?
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_07");	//Ano, myslím, že máš určitou šanci!
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_09");	//Abychom naplnili tvoji výzvu, uspořádám s tebou malou soutěž.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_10");	//A vítěz se bude moci provolat nejlepším lovcem v táboře.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_14");	//Poslouchej mě pozorně...
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_15");	//Nekde na ostrově se nachází jedno velmi vzácné zvíře. Lovci mu dali přezdívku - Slokers.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_16");	//Toto stvoření je trochu podobné mrchožroutovi, ale narozdíl od těch hloupých ptáku - je velmi opatrné a extrémne obezřetné!
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_17");	//Mnozí se ho už pokusili ulovit, ale nikomu se to nepodařilo.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_19");	//To je celé, budeme ho lovit.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_20");	//Je nutné to zvíře vystopovat, zabít a donést staženou kuži jako důkaz.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_21");	//Pokud se ti to podaří dřív než mně - tak si zasloužíš náš obdiv... (pochybovačně)
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_23");	//Tak neztrácej čas a bež lovit.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_24");	//Já vyjdu trochu později - dám ti menší náskok... (směje se)
			AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_25");	//Na viděnou.
			TIMER_HUNTERCHALLANGE = Wld_GetDay();
			MIS_HUNTERCHALLANGE = LOG_Running;
			Log_CreateTopic(TOPIC_HUNTERCHALLANGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HUNTERCHALLANGE,LOG_Running);
			B_LogEntry(TOPIC_HUNTERCHALLANGE,"Rozhodl jsem se vyzvat Falka k souboji o titul nejlepšího lovce v táboře. Falk mi nabídl soutěž, kde vítěz bere titul nejsilnějšího. Předmětem soutěže je ulovit velmi vychytralé malé zvíře, které lovci nazývají Slokers. Podle popisu Falka, tohle stvoření vypadá jako mrchožrout. Jako důkaz prvenství ulovení tohoto zvířete, bude stačit ukázat falkovi kůži Slokerse.");
			Log_AddEntry(TOPIC_HUNTERSWORK,"Falk přijal muj požadavek! Teď všechno záleží na mně - zda dokážu, že jsem hoden být označován jako nejlepší lovec.");
			Npc_ExchangeRoutine(self,"HuntSlokers");
			AI_StopProcessInfos(self);
			ransl = Hlp_Random(7);

			if(ransl == 0)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_SLOKERS_01");
			}
			else if(ransl == 1)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_MEDIUMFOREST_KAP2_29");
			}
			else if(ransl == 2)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT8_M_04");
			}
			else if(ransl == 3)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_CITY_TO_FOREST_32");
			}
			else if(ransl == 4)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_TAVERNE_TROLLAREA_03_03");
			}
			else if(ransl == 5)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_FARM3_PATH_11_SMALLRIVER_03");
			}
			else if(ransl == 6)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_BIGFARM_LAKE_03_MOVEMENT13");
			}
			else
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_SLOKERS_01");
			};
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_31");	//Hmm... (usmívá se) Zdá se, že jsi už získal podporu několika lovcu. To není vubec špatné, kámo!
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_32");	//Ale stálo to nestačí na to, abys mě mohl vyzvat.
			AI_Output(self,other,"DIA_HUN_741_Falk_CanIHCh_01_34");	//Ale zdá se, že jsi na dobré cestě...
		};
	};
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGEPROGRESS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallangeprogress_condition;
	information = dia_hun_741_falk_hunterchallangeprogress_info;
	permanent = TRUE;
	description = "Jak jde lov?";
};


func int dia_hun_741_falk_hunterchallangeprogress_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_HUNTERCHALLANGE == LOG_Running) && (TIMER_HUNTERCHALLANGE <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallangeprogress_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_HChProgress_01_00");	//Jak jde lov?
	AI_Output(self,other,"DIA_HUN_741_Falk_HChProgress_01_01");	//Zatím bez výsledku... (usmívá se) Zdá se, že ve dne ho nelze spatřit.
	AI_Output(self,other,"DIA_HUN_741_Falk_HChProgress_01_02");	//Ale buď si jistý - já se nevzdám a vyhraju naši soutěž!
	AI_Output(other,self,"DIA_HUN_741_Falk_HChProgress_01_03");	//Na to se podíváme!
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGEDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallangedone_condition;
	information = dia_hun_741_falk_hunterchallangedone_info;
	permanent = TRUE;
	description = "Vyhrál jsem naši soutěž.";
};


func int dia_hun_741_falk_hunterchallangedone_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_Running) && (Npc_HasItems(other,itat_slokersfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallangedone_info()
{
	B_GivePlayerXP(500);
	self.flags = 0;
	AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_00");	//Vyhrál jsem naši soutěž.
	AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_02");	//Mám kůži Slokerse.
	AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_03");	//Ale no tak! (vážně) To nemůže být pravda!
	B_GiveInvItems(other,self,itat_slokersfur,1);
	Npc_RemoveInvItems(self,itat_slokersfur,1);
	AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_05");	//Neuveřitelné! Mé oči tomu nemohou uveřit!... (úplně zmateně) Ale jak se ti to zvíře podařilo vystopovat?!
	AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_06");	//Bylo to docela jednoduché. No, teď už vážne musíš uznat, že já jsem nejlepší lovec v táboře?!
	AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_07");	//(povzdech) Jo, nevyšlo mi to. Jsi ten nejlepší, chlape!

	if((hero.attribute[ATR_DEXTERITY] > hero.attribute[ATR_STRENGTH]) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM) && (hero.guild != GIL_NDM) && (hero.guild != GIL_NDW) && (hero.guild != GIL_NOV) && (hero.guild != GIL_GUR))
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_09");	//Tak přijmi mé blahopřání k... (váhavě) - a tento luk!
		B_GiveInvItems(self,other,itrw_shadowbow,1);
		AI_Output(other,self,"DIA_HUN_741_Falk_HChDone_01_10");	//Co je to za luk?!
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_12");	//Řeknu ti - v rukou jsem ještě nedržel lepší zbraň!
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_13");	//Je vyroben ze starých dubu, které rostou jen daleko v hlubokých lesích Myrtany, kdysi jsem ho dostal od mého dědečka Bena.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_15");	//Na střílení z něj jsou potřeba trochu jiné šípy, než na které jsi zvyklý.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_17");	//Může ti je vyrobit obchodník Bosper!
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_18");	//Prostě mu ukaž ten luk a on pochopí.
		AI_Output(self,other,"DIA_HUN_741_Falk_HChDone_01_19");	//No, tak hodně štěstí, kamaráde!
		Log_AddEntry(TOPIC_HUNTERSWORK,"Vyhrál jsem soutěž proti Falkovi a teď jsem nejlepším lovcem! Kromě toho mi Falk daroval speciální luk - nejlepší zbraň, kterou kdy držel v rukou. Na střílení z něj budu potřebovat speciální šípy, ale bez problému mi je vyrobí Bosper, pokud mu ten luk ukážu.");
		TakeShadowBow = TRUE;
	};

	MIS_HUNTERCHALLANGE = LOG_SUCCESS;
	MIS_HUNTERSWORK = LOG_SUCCESS;
	SAVESPOTHUNTER = TRUE;
	Log_SetTopicStatus(TOPIC_HUNTERCHALLANGE,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_HUNTERSWORK,LOG_SUCCESS);
	B_LogEntry(TOPIC_HUNTERCHALLANGE,"Přinesl jsem Falkovi slokersovu kuži. Byl velice překvapen faktem, že se mi to podařilo dřív než jemu. A nakonec mi udělil právo se nazývat nejlepším lovcem!");
};


instance DIA_HUN_741_FALK_GATHERARMY(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_gatherarmy_condition;
	information = dia_hun_741_falk_gatherarmy_info;
	permanent = FALSE;
	description = "Vypadáš nějak rozrušený.";
};

func int dia_hun_741_falk_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmy_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmy_01_00");	//Vypadáš nějak rozrušený.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmy_01_01");	//Všude kolem je plno skřetů!
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmy_01_06");	//Je dobře, že náš tábor je daleko od hlavních cest, takže náš skřeti ještě nenašli.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmy_01_08");	//Kde jsou k čertu všichni ti královští paladinové? (naštvaně) Neměli nás náhodou chránit před těmi stvůrami?
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmy_01_09");	//Lord Hagen se svými paladiny je proti nim.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmy_01_10");	//Ale nemá dost mužů, aby mohl proti skřetům vyrazit do otevřené bitvy.
};


instance DIA_HUN_741_FALK_GATHERARMYANSWER(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_gatherarmyanswer_condition;
	information = dia_hun_741_falk_gatherarmyanswer_info;
	permanent = FALSE;
	description = "Mimochodem, nechceš se přidat k jeho vojsku?";
};

func int dia_hun_741_falk_gatherarmyanswer_condition()
{
	if(Npc_KnowsInfo(hero,DIA_HUN_741_Falk_GatherArmy) == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmyanswer_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_01");	//A nechtěl by ses přidat k vojsku paladinů?
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_02");	//Jsem si jistý, že tvoje pomoc by byla užitečná.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_03");	//Ty mi nabízíš boj proti skřetům? Ale my jsme lovci, ne vojáci!
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_04");	//Jasně, každý z nás velmi dobře ovládá meč i luk, ale obávám se že v otevřeném boji proti nim nemáme žádnou šanci.

	if((MIS_BAREMCRAWLERARMOR == LOG_SUCCESS) && !Npc_IsDead(hun_744_barem))
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_05");	//Kromě toho, nemáme solidní zbroj. Kromě Barema, samozřejmě.
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_06");	//On si nějak zvládl obstarat skvělou zbroj ze štítů důlních červů
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_08");	//Tyhle hadry, které mám na sobě já a ostatní kluci, nás těžko ochrání před skřetí sekerou.
		AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_09");	//A když seženu ty samé zbroje?
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_10");	//Kromě toho, nemám žádnou solidní zbroj. (beznadějně)
		AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_11");	//Tyhle hadry, které mám na sobě já a ostatní kluci, nás těžko ochrání před skřetí sekerou.
		AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_12");	//A když seženu zbroje?
	};

	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_14");	//S nimi bychom se cítili mnohem jistěji než teď.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_15");	//A kolik v tom případě potřebujete zbrojí?
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswer_01_16");	//No, všichni kluci tady dohromady... (zamyšleně) Myslím, že deset bude stačit.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswer_01_17");	//Uvidím, co se s tím dá udělat.
	MIS_HUNTERSARMOR = LOG_Running;
	Log_CreateTopic(TOPIC_HUNTERSARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUNTERSARMOR,LOG_Running);
	B_LogEntry(TOPIC_HUNTERSARMOR,"Mluvil jsem s Falkem, vůdcem lovců. Vypadá to, že nemá v úmyslu přidat se k vojsku lorda Hagena. Avšak být proti skřetím válečníkům v klasické lovecké zbroji, to je podle Falka hloupost a bláznovství. Jestli můžu pro ně obstarat jakoukoliv silnější zbroj, rádi pomohou paladinům ve válce proti skřetům. Doufám že sada deseti zbrojí bude stačit.");
	Log_AddEntry(TOPIC_HUNTERSARMOR,"Jak jsem si vzpomněl, žoldák Wolf ví, jak vyrobit zbroj z pancéřů důlních červů. Myslím, že se lovcům opravdu hodí.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_741_FALK_GATHERARMYANSWERDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_gatherarmyanswerdone_condition;
	information = dia_hun_741_falk_gatherarmyanswerdone_info;
	permanent = TRUE;
	description = "Mám ty zbroje.";
};


func int dia_hun_741_falk_gatherarmyanswerdone_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (Npc_HasItems(hero,ITAR_DJG_Crawler) >= 10))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmyanswerdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_01");	//Mám ty zbroje.
	AI_Output(other,self,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_03");	//Tady je máš. Deset, jak jsi žádal.
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,10);
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_04");	//(uznale) Skvělá zbroj! A co je nejdůležitější, zbroj s loveckým duchem.
	AI_Output(self,other,"DIA_HUN_741_Falk_GatherArmyAnswerDone_01_07");	//Dobře, půjdeme proti skřetům.
	HUN_JOINHAGEN = TRUE;
	MIS_HUNTERSARMOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HUNTERSARMOR,LOG_SUCCESS);
	B_LogEntry(TOPIC_HUNTERSARMOR,"Donesl jsem nové lovecké zbroje a Falk byl spokojený.");
	Log_AddEntry(TOPIC_ORCGREATWAR,"Lovci se rozhodli přidat k vojsku paladinů, jsem si jistý že tato zpráva potěší lorda Hagena.");
};


instance DIA_HUN_741_FALK_TRAVELONBIGLAND(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_travelonbigland_condition;
	information = dia_hun_741_falk_travelonbigland_info;
	permanent = FALSE;
	description = "Chtěl bys plout se mnou na pevninu?";
};


func int dia_hun_741_falk_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_741_Falk_TravelOnBigLand_01_00");	//Chtěl bys plout se mnou na pevninu?
	AI_Output(self,other,"DIA_HUN_741_Falk_TravelOnBigLand_01_01");	//To není špatný nápad, kámo!
	AI_Output(self,other,"DIA_HUN_741_Falk_TravelOnBigLand_01_02");	//Dlouho tam chci jít.
	AI_Output(other,self,"DIA_HUN_741_Falk_TravelOnBigLand_01_04");	//Dobře, čekám tě na lodi.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	FALKTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Lovec Falk chce jít se mnou. Dlouho chtěl jít na pevninu.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_Falk_IshiCurrat(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_IshiCurrat_condition;
	information = DIA_HUN_741_Falk_IshiCurrat_info;
	permanent = TRUE;
	description = "Myslíš, že by někoho zajímala tahle trofej?";
};

func int DIA_HUN_741_Falk_IshiCurrat_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmor == TRUE) && (Npc_HasItems(hero,ItAt_CurratIshi) >= 1))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_IshiCurrat_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_00");	//Myslíš, že by někoho zajímala tahle trofej?
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_01");	//(se zájmem) Nech mě podívat.
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_02");	//Tady.
	B_GiveInvItems(other,self,ItAt_CurratIshi,1);
	Npc_RemoveInvItems(self,ItAt_CurratIshi,1);

	if(Trophy_IshiCurrat == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_IshiCurrat,Npc_HasItems(other,ItUt_IshiCurrat));
		Trophy_IshiCurrat = FALSE;
	};

	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_03");	//Ohó! Kde jsi našel tuhle věc?
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_04");	//Co, je to zvláštní?
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_05");	//Že váháš! Nikdy v životě jsem neviděl takovou věc.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_06");	//Na první pohled se to podobá žihadlu příšery monstrózních rozměrů. Ačkoliv...
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_08");	//(zamyšleně) Nech mě o tom přemýšlet.
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_09");	//... a?
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_10");	//Možná si tu trofej vezmu. Nevadí?
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_11");	//No, to všechno závisí na tom, co mi dáš na oplátku.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_12");	//Pravda. (smích) Tady, mám velmi vzácný magický lektvar.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_13");	//Avšak neznám jeho vlastnosti. Ale myslím že nemá nižší hodnotu, než ta tvoje věcička.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_14");	//No tak, plácnem si?
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_15");	//Dobře, vezmi si to.
	AI_Output(self,other,"DIA_HUN_741_Falk_IshiCurrat_01_16");	//No, bezva. Tady, vezmi si lektvar. Věděl jsem, že se dohodneme.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
};

instance DIA_HUN_741_FALK_NeedMorePeople(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_NeedMorePeople_condition;
	information = dia_hun_741_falk_NeedMorePeople_info;
	permanent = FALSE;
	description = "Takže, já tomu tady teď velím?";
};

func int dia_hun_741_falk_NeedMorePeople_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_SUCCESS) && (FalkHunters > 0))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_NeedMorePeople_info()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 500;
	AI_NoticePrint(3000,4098,NAME_Addon_HuntBonus);
	HuntBonus = TRUE;
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_00");	//Takže, já tomu tady teď velím?
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_01");	//Vypadá to, že ano! (zasměje se) A teď pro tebe začíná zábava.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_03");	//Jako nejzkušenější lovec musíš dohlížet na všechny práce v táboře.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_04");	//Kromě toho, musíš vyřizovat různé obchody s kupci ve městě.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_05");	//Například dodávky masa a kůží do města.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_06");	//Hmm... jak o tom přemýšlím, víš, asi bude nejlepší když všechno zůstane tak, jak je.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_07");	//A já zůstanu jedním z lovců.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_08");	//(směje se) To je pravda, příteli. Být tady vůdcem, k tomu nestačí jen prázdná slova.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_09");	//Je to taky velká zodpovědnost za kluky, kteří tady žijí.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_10");	//Mimochodem, když mluvíme o klucích...
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_11");	//Myslím, že bychom se nebránili novým lovcům v táboře.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_13");	//Objednávky od kupců z města jsou četnější a četnější. Hlavně na maso.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_14");	//Vypadá to že ti tlusťoši se zásobují masem pro případ, že by skřeti oblehli město.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_15");	//A také samozřejmě, jak víš, lidí není nikdy dost.
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_16");	//Takže jestli chceš prospět táboru, zkus to zařídit.
	AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_01_17");	//A kde je mám hledat?
	AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_01_18");	//Nevím. Zkus se podívat ve městě nebo kdekoliv na venkově.
	MIS_NewHunters = LOG_Running;
	Log_CreateTopic(TOPIC_NewHunters,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NewHunters,LOG_Running);
	B_LogEntry_Quiet(TOPIC_NewHunters,"Falk říkal, že by se mu hodili noví lovci do tábora. Jeho lidi už všechno nezvládají, protože počet objednávek hodně vzrostl.");
};

var int FalkHuntersUp;
var int FalkAbountNewHanters;

instance DIA_HUN_741_FALK_NeedMorePeople_Done(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_NeedMorePeople_Done_condition;
	information = dia_hun_741_falk_NeedMorePeople_Done_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_hun_741_falk_NeedMorePeople_Done_condition()
{
	if((MIS_NewHunters == LOG_Running) && (TalbinBecameHunt == TRUE) && (Npc_IsDead(VLK_4132_Talbin_NW) == FALSE) && (Talbin_NW_InCamp == FALSE))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (GestatInHorinis == TRUE) && (Npc_IsDead(VLK_4149_Gestath) == FALSE) && (Gestath_InCamp == FALSE))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (BartokBecameHunt == TRUE) && (Npc_IsDead(VLK_440_Bartok) == FALSE) && (Bartok_InCamp == FALSE))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (FalkHuntersUp >= FalkHunters))
	{
		return TRUE;
	};

	return FALSE;
};

func void dia_hun_741_falk_NeedMorePeople_Done_info()
{
	var int Xp_Hunt;

	if(FalkHuntersUp < FalkHunters)
	{
		if(FalkAbountNewHanters == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_00");	//Skvělé zprávy! V táboře byli noví lovci.
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_01");	//Zatímco jsi tu nebyl, v táboře se objevil nový lovec.
		};

		AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_20");	//Kdo přesně?

		if((TalbinBecameHunt == TRUE) && (Npc_IsDead(VLK_4132_Talbin_NW) == FALSE) && (Talbin_NW_InCamp == FALSE))
		{
			Xp_Hunt += 500;
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_02");	//Chlápek jménem Talbin. Z mého pohledu je to skvělý lovec.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_03");	//On pro nás bude určitě užitečný.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_04");	//Jasné. Ještě někdo další?
			Talbin_NW_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if((GestatInHorinis == TRUE) && (Npc_IsDead(VLK_4149_Gestath) == FALSE) && (Gestath_InCamp == FALSE))
		{
			Xp_Hunt += 300;
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_05");	//Lovec Gestath. (uznale) Znám toho muže.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_06");	//Když zůstane v táboře, bude tady jako mistr lovu.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_07");	//Jsem rád, že přišel. Ještě někdo?
			Gestath_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if((BartokBecameHunt == TRUE) && (Npc_IsDead(VLK_440_Bartok) == FALSE) && (Bartok_InCamp == FALSE))
		{
			Xp_Hunt += 200;
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_08");	//Jmenuje se Bartok! I když je to trochu zbabělec na lovce.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_09");	//No to se dá napravit. Do té doby ať hlídá tábor.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_10");	//To jsou všichni, kteří přišli?
			Bartok_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if((FalkHuntersUp >= FalkHunters) || ((Talbin_NW_InCamp == TRUE) && (Gestath_InCamp == TRUE) && (Bartok_InCamp == TRUE)))
		{
			Xp_Hunt += 1000;
			B_GivePlayerXP(Xp_Hunt);
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_11");	//Zatím ano. Ale myslím, že máme nových lovců dost a zatím další nepotřebujeme.
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_12");	//Dobře jsi to udělal, příteli. 
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_13");	//Tady, vezmi si tohle za svou práci. Tento prsten má pro lovce velkou cenu.
			B_GiveInvItems(self,other,ItRi_HuntRing,1);
			MIS_NewHunters = LOG_Success;
			Log_SetTopicStatus(TOPIC_NewHunters,LOG_Success);
			B_LogEntry(TOPIC_NewHunters,"Falk věří, že teď je v táboře konečně dost lovců. Splnil jsem jeho úkol!");
		}
		else
		{
			B_GivePlayerXP(Xp_Hunt);
			AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_16");	//Zatím ano, ale ještě potřebujeme více lidí.
			AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_17");	//Tak jo, potřebujeme je nutně.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_18");	//Domnívám se, že tento problém už není u lidí. Neztrácej čas dalším hledáním.
		AI_Output(other,self,"DIA_HUN_741_Falk_NeedMorePeople_Done_01_19");	//Jak chceš.
		MIS_NewHunters = LOG_Success;
		Log_SetTopicStatus(TOPIC_NewHunters,LOG_Success);
		B_LogEntry(TOPIC_NewHunters,"Falk si myslí, že dál v hledání už nemůžeme pokračovat.");
	};
};


instance DIA_HUN_741_FALK_OrcBiter(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_OrcBiter_condition;
	information = dia_hun_741_falk_OrcBiter_info;
	permanent = FALSE;
	description = "Máš pro mě další práci?";
};

func int dia_hun_741_falk_OrcBiter_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_OrcBiter_info()
{
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_00");	//Máš pro mě další práci?
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_01");	//Podle zvěstí se poblíž Bengara usadil houf skřetích kousavců.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_02");	//Nejspíš přišli průchodem který vede do Hornického údolí.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_03");	//Jednotlivě tyhle příšery nejsou tak nebezpečné.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_04");	//Ale když se seskupí do smečky, stanou se značně problematičtí!
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_05");	//A co ode mě chceš?
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_06");	//No vypořádej se s nimi, jak jinak! Bengar a okolní farmáři ti budou velmi vděční.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_07");	//Chceš tuhle práci?
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_08");	//Dobře, postarám se o ten problém s kousavci.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_01_09");	//Výborně! Jen mi dej vědět, až je pošleš za světlem božím.
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_01_10");	//Samozřejmě.
	MIS_OrcBiter = LOG_Running;
	Log_CreateTopic(TOPIC_OrcBiter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcBiter,LOG_Running);
	B_LogEntry(TOPIC_OrcBiter,"Falk mě požádal vyřešit problém se skřetími kousavci, kteří se nedávno objevili u Bengarovy farmy.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrcBiter_Falk_01,"NW_FARM3_PATH_11_SMALLRIVER_112");
	Wld_InsertNpc(OrcBiter_Falk_02,"NW_FARM3_PATH_11_SMALLRIVER_17");
	Wld_InsertNpc(OrcBiter_Falk_03,"NW_FARM3_PATH_11_SMALLRIVER_16");
	Wld_InsertNpc(OrcBiter_Falk_04,"NW_FARM3_PATH_11_SMALLRIVER_11");
	Wld_InsertNpc(OrcBiter_Falk_05,"NW_FARM3_PATH_11_SMALLRIVER_18");
};

instance DIA_HUN_741_FALK_OrcBiter_Done(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_OrcBiter_Done_condition;
	information = dia_hun_741_falk_OrcBiter_Done_info;
	permanent = FALSE;
	description = "Všichni kousavci jsou mrtví.";
};

func int dia_hun_741_falk_OrcBiter_Done_condition()
{
	if((MIS_OrcBiter == LOG_Running) && (Npc_IsDead(OrcBiter_Falk_01) == TRUE) && (Npc_IsDead(OrcBiter_Falk_02) == TRUE) && (Npc_IsDead(OrcBiter_Falk_03) == TRUE) && (Npc_IsDead(OrcBiter_Falk_04) == TRUE) && (Npc_IsDead(OrcBiter_Falk_05) == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_OrcBiter_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_Done_01_00");	//Všichni kousavci jsou mrtví.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_Done_01_01");	//Bezva, kámo. (usmívá se) Nepochyboval jsem, že se s nimi vypořádáš.
	AI_Output(self,other,"DIA_HUN_741_Falk_OrcBiter_Done_01_02");	//Na, vezmi si svůj podíl za odvedenou práci.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(other,self,"DIA_HUN_741_Falk_OrcBiter_Done_01_03");	//Díky.
	MIS_OrcBiter = LOG_Success;
	Log_SetTopicStatus(TOPIC_OrcBiter,LOG_Success);
	B_LogEntry(TOPIC_OrcBiter,"Řekl jsem Falkovi, že všichni kousavci jsou zabití.");
};