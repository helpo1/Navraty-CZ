
instance DIA_Addon_Merdarion_EXIT(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 999;
	condition = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_Hallo(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Hallo_Condition;
	information = DIA_Addon_Merdarion_Hallo_Info;
	description = "Zaneprázdněn?";
};


func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Zaneprázdněn?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Tyhle hrobky jsou pro mě jednou velkou záhadou. Jen stěží si dovedu představit, že je až dosud nikdo nenašel.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Vchod jsme vykopali bez potíží.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Lidé měli vždycky tolik práce se svými všedními starostmi, že nikdo neměl čas se blíže podívat na tyto stavby.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Nemám pro to žádné jiné vysvětlení.
};


instance DIA_Addon_Merdarion_Aufgabe(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Aufgabe_Condition;
	information = DIA_Addon_Merdarion_Aufgabe_Info;
	description = "Co tady máš za úkol?";
};


func int DIA_Addon_Merdarion_Aufgabe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Co tady máš za úkol?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Snažím se zjistit, kam vede tenhle kruhový portál.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//A kromě toho pomáhám Nefariusovi najít ztracený ornament.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//Je jisté, že tento portál vede do části ostrova, o které jsme dosud neměli ani tušení.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(zamyšleně) Vůbec si nevzpomínám, že bych o něčem takovém někdy slyšel nebo četl.
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Cronos_NW,"START");
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW,"Nefarius hledá nějaký ztracený ornament.");
	};
};


instance DIA_Addon_Merdarion_DaDurch(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_DaDurch_Condition;
	information = DIA_Addon_Merdarion_DaDurch_Info;
	description = "Opravdu chcete projít tím portálem?";
};


func int DIA_Addon_Merdarion_DaDurch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_DaDurch_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Opravdu chcete projít tím portálem?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Samozřejmě. Pokud tedy najdeme ten ztracený ornament.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Přiznávám, že je to poněkud riskantní pokus.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Ale rozhodně musíme zjistit, co to má co dělat s těmi neustálými zemětřeseními.
};


instance DIA_Addon_Merdarion_Bedrohung(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Bedrohung_Condition;
	information = DIA_Addon_Merdarion_Bedrohung_Info;
	description = "Co víš o těch zemětřeseních?";
};


func int DIA_Addon_Merdarion_Bedrohung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_DaDurch))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_Bedrohung_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//Co víš o těch zemětřeseních?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//Něco na druhé straně je způsobuje.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//A ten samý zdroj nejspíš probouzí i ty kamenné strážce.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Ale to není moje práce – o tom ti víc řeknou Saturas a Cronos.
};


instance DIA_Addon_Merdarion_Wasdahinter2(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information = DIA_Addon_Merdarion_Wasdahinter2_Info;
	description = "Co si myslíš, že najdete na druhé straně?";
};


func int DIA_Addon_Merdarion_Wasdahinter2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//Co si myslíš, že najdete na druhé straně?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//To opravdu nevím.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Předpokládám, že tam bude stavba podobná téhle. A druhá část portálu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//Vše ostatní se uvidí, až tam budeme.
};


instance DIA_Addon_Merdarion_PERM(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 99;
	condition = DIA_Addon_Merdarion_PERM_Condition;
	information = DIA_Addon_Merdarion_PERM_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit něco o magii?";
};


func int DIA_Addon_Merdarion_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//Můžeš mě naučit něco o magii?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Jakmile budeme na druhé straně, velice rád ti pomohu.
};


instance DIA_Addon_Merdarion_Teleportstein(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Teleportstein_Condition;
	information = DIA_Addon_Merdarion_Teleportstein_Info;
	description = "Jaká je nejrychlejší cesta zpět do města?";
};


func int DIA_Addon_Merdarion_Teleportstein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe) && (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Jaká je nejrychlejší cesta zpět do města?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Doporučuji ti jít zpátky stejnou cestou, kterou jsi přišel.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(zadumaně) Nebo bys mohl... Ne. To by bylo příliš nebezpečné.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Ven s tím.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Dobrá. Stavitelé těchto síní měli svůj vlastní způsob cestování.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Pokud víme, dokázali se teleportovat.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//To přece není nic výjimečného.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//Teleportační kameny, které jsme našli tady na Khorinisu, výjimečné opravdu jsou.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Zdá se, že zdejší teleportační kámen by mohl vést do přístavního města.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Ale nikdo z nás neměl odvahu to vyzkoušet na vlastní kůži.
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Co si myslíš, že se stane, když to zkusím?",DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Kde je ten teleportační kámen?",DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Kde je ten teleportační kámen?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//V místnosti s kamennou nádrží jsou dveře. Kámen je zamčený za nimi.
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Dej mi klíč. Chci se na to podívat.",DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Co si myslíš, že se stane, když to zkusím?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Nemám ani zdání. Víme o tom příliš málo. Je možné, že bys to nepřežil.
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Dej mi klíč. Chci se na to podívat.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(nejistě) Opravdu? Ale já za to nenesu žádnou zodpovědnost.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Dej mi ho.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Když myslíš. Tady ho máš.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	B_GiveInvItems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Merdarion mi dal klíč, který otevírá zamčené dveře v hrobce blízko portálu. Za nimi je teleportační kámen, který by mě měl přenést zpátky do přístavního města.");
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};


instance DIA_Addon_Merdarion_WHereOtherTeleports(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information = DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description = "Kde jsou ostatní teleportační kameny?";
};


func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Kde jsou ostatní teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Zatím jsme našli jen jeden, někde uprostřed Khorinisu.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Nedaleko hostince 'U Mrtvé harpyje'.
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Další teleportační kámen by měl být nedaleko hostince 'U Mrtvé harpyje'.");
};


instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information = DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description = "Zdá se, že ty teleportační kameny fungují bez problémů.";
};


func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein) && (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Zdá se, že ty teleportační kameny fungují bez problémů.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Tys to opravdu udělal? Použil jsi ho?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Ano. A zjevně ještě pořád fungují.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(fascinovaně) Neuvěřitelné. Později se na to budu muset blíže podívat.
};


instance DIA_ADDON_MERDARION_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 1;
	condition = dia_addon_merdarion_prayforgomez_condition;
	information = dia_addon_merdarion_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_merdarion_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Merdarion_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Merdarion_PrayForGomez_01_03");	//Ten ti dokáže pomoci.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_MERDARION_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 1;
	condition = dia_addon_merdarion_runemagicnotwork_condition;
	information = dia_addon_merdarion_runemagicnotwork_info;
	permanent = FALSE;
	description = "Můžeš ještě pořád používat svou runovou magii?";
};


func int dia_addon_merdarion_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Merdarion_RuneMagicNotWork_01_00");	//Můžeš ještě pořád používat svou runovou magii?
	AI_Output(self,other,"DIA_Addon_Merdarion_RuneMagicNotWork_01_01");	//Naneštěstí magická síla z mých runových kamenů zcela vymizela. Jsou z nich akorát bezcenné šutry.
	AI_Output(self,other,"DIA_Addon_Merdarion_RuneMagicNotWork_01_02");	//A my, mágové Vody, teď nejsme nic jiného než zátěží pro vojáky, na zbraních kterých teď spočívá naše vykoupení.
	AI_Output(self,other,"DIA_Addon_Merdarion_RuneMagicNotWork_01_03");	//Stydím se přiznat to, ale nedovedu ani jen předložit hypotézu, která by přibližně popsala zdroj problémů, které nás teď postihly. Ale můj instinkt mi říká, že máme co dělat se zradou...
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Vypadá to tak, že i mágové Vody ztratili schopnost užívat runové kameny.");
	WATERMAGERUNESNOT = TRUE;
};

