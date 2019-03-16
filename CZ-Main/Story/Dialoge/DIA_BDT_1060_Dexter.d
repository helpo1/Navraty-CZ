
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Podívejme, koho tady máme. Velký zastánce práva. Fajn, hrdino, copak tu pohledáváme?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Hledám pár odpovědí.
	if(Ranger_SCKnowsDexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Nečekal jsem, že sem vlezeš dobrovolně.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to má znamenat?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To znamená, že jsem vypsal odměnu na tvou hlavu. Ještě jsi neviděl ty plakáty?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Je na nich TVŮJ obličej. Ano... jsi hledaný muž. Nevíš o tom?
		B_LogEntry(Topic_Bandits,"Našel jsem toho, co rozdával banditům obrázky s mým obličejem. Byl to Dexter, můj starý známy ze Starého tábora v Hornickém údolí.");
		Log_SetTopicStatus(Topic_Bandits,LOG_SUCCESS);
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(200);
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//NĚKDO dal do oběhu papíry s mojí tváří. NĚKDO mi řekl, žes to byl ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//NĚKDO moc mluvil.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//Máš ale pravdu. Já je dal do oběhu. A co se nestalo? Přišel jsi sám!
		B_LogEntry(Topic_Bandits,"Našel jsem toho, co rozdával banditům obrázky s mým obličejem. Byl to Dexter, můj starý známy ze Starého tábora v Hornickém údolí.");
		Log_SetTopicStatus(Topic_Bandits,LOG_SUCCESS);
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(100);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Co ode mě chceš?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Já? Nic. Ale můj šéf tě chce šíleně vidět mrtvého.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//To je to, proč jsem tě měl najít a přinést mu tvoji hlavu.
	DEXTERSAYABOUTKILL = TRUE;
};

instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "Nevěřím ti ani slovo.";
};

func int DIA_Dexter_Glaube_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nevěřím ti ani slovo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hele, je to pravda. Přísahám na hrob svý matky!
};


instance DIA_Addon_Dexter_Patrick(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_Patrick_Condition;
	information = DIA_Addon_Dexter_Patrick_Info;
	description = "Byl tady viděn žoldák jménem Patrick?";
};


func int DIA_Addon_Dexter_Patrick_Condition()
{
	if((MIS_Addon_Cord_Look4Patrick == LOG_Running) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//Byl tady viděn žoldák jménem Patrick?
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrick? Eh? Nikdy jsem o něm neslyšel.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//Pamatuju se na ukecaného žoldáka, který se vobčas poflakoval s mými lidmi.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//(nápadně lže) Ačkoli jsem ho poslední dobou neviděl.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//(tváří se nenápadně) Možná zdrhl. Nevím.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Dexter tvrdí, že o žoldákovi Patrickovi nic neví.");
	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};

instance DIA_Addon_Dexter_Greg(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_Greg_Condition;
	information = DIA_Addon_Dexter_Greg_Info;
	description = "Je tady nějaký chlap s páskou přes oko. Hledá TEBE!";
};

func int DIA_Addon_Dexter_Greg_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Je tady nějaký chlap s páskou přes oko. Hledá TEBE!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Vypadá to, že mě všichni hledají. Nestarám se o to.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jestli ten chlap něco potřebuje, má přijít sem.
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Addon_Dexter_WulfgarSend(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_WulfgarSend_Condition;
	information = DIA_Addon_Dexter_WulfgarSend_Info;
	permanent = FALSE;
	description = "Máš muže v domobraně?";
};

func int DIA_Addon_Dexter_WulfgarSend_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (WulfgarSendDexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_WulfgarSend_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Dexter_WulfgarSend_01_00");	//Máš muže v domobraně?
	AI_Output(self,other,"DIA_Addon_Dexter_WulfgarSend_01_01");	//Možná ano. Proč tě to zajímá?
	AI_Output(other,self,"DIA_Addon_Dexter_WulfgarSend_01_02");	//Jenom potřebuji znát jeho jméno.
	AI_Output(self,other,"DIA_Addon_Dexter_WulfgarSend_01_03");	//(smích) Nasrat!
	AI_Output(self,other,"DIA_Addon_Dexter_WulfgarSend_01_04");	//To si myslíš že když přijdeš jen tak ke mě že ti řeknu jeho jmeno?
	AI_Output(self,other,"DIA_Addon_Dexter_WulfgarSend_01_05");	//Ale já ti odpovím takhle...
	AI_Output(self,other,"DIA_Addon_Dexter_WulfgarSend_01_06");	//Pokud se ještě jednou zeptáš na takovou otázku vyříznu ti jazyk! Je to jasný?
};

instance DIA_Addon_Dexter_missingPeople(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_missingPeople_Condition;
	information = DIA_Addon_Dexter_missingPeople_Info;
	description = "Bylo mi řečeno, že unášíš lidi z Khorinisu!";
};


func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if((SC_KnowsDexterAsKidnapper == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Bylo mi řečeno, že unášíš lidi z Khorinisu!
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Takže jsi to nakonec zjistil. Dobrá práce, gratuluji.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//A já si myslel, že jsem své stopy důkladně zametl.
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Kdo ti dal ten příkaz?",DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Kde ti lidé končí? Tady okolo dolů?",DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Kde ti lidé končí? Tady okolo dolů?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(směje se) Skončí daleko. Za horami na severo-východě a z tvého dosahu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Mohl bych ti ukázat, kde přesně, ale nevím proč bych měl.
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kdo ti dal ten příkaz?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//Můj šéf. Nebezpečný člověk. Ty ho znáš. Je to Raven, jeden z trestaných rudobaronů, ze Starého tábora v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Potřebuje je pro svůj plán. To je vše, co potřebuješ vědět.
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Raven nebezpečný? No jo...",DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Rudobaron tady v Khorinisu?",DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Raven nebezpečný? No jo...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(popuzený) Co si myslíš, že víš? Neznáš ho tak jako já.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(rozrušený) Bývavala to hnusná svině, ale teď...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Od té doby, co padla bariéra, se změnil. Jeho tvář je zatažená černým stínem.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(vystrašený) Jeho pohled tebou pronikne, jako dráp dravce, když mu budeš hledět do očí moc dlouho.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//Můžu ti jen poradit, abys opustil Khorinis co nejrychleji, dokud máš ještě čas, protože za chvíli už bude příliš pozdě.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(sklíčeně) Tady tě nic nečeká, jenom jistá smrt.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Dexter má šéfa. Jmenuje se Raven. Raven je bývalý rudobaron. Nakonec to vypadá, že Raven je ten, kdo stojí za těmi únosy. Všechno co potřebuju je důkaz.");
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Rudobaron tady v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//Už není rudobaron. Teď má své vlastní plány, a Khorinis to brzy pocítí.
};


instance DIA_Addon_Dexter_Boss(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = DIA_Addon_Dexter_Boss_Condition;
	information = DIA_Addon_Dexter_Boss_Info;
	description = "Tvůj šéf? Kdo to může být?";
};


func int DIA_Addon_Dexter_Boss_Condition()
{
	if((Knows_Dexter == TRUE) && (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Tvůj šéf? Kdo to může být?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(směje se) Rád bys to věděl, co? Ano, umím si to představit.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(vážně) Nemůžu uvažovat o dvojím řešení, tak proč bych ti to měl říkat?
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "A co máš teď v úmyslu? Zabít mě?";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//A co máš teď v úmyslu? Zabít mě?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Jo. Ale tys nás odtamtud všechny dostal. Proto ti taky dám ještě jednu šanci. Zmizni, vypař se, udělej se neviditelným. Jdi a už se mi nikdy nepřipleť do cesty.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Musím zjistit, kde jsou ti zajatí lidé.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(směje se) Jo. Můžeš to zkusit ze mě vytřískat...
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(výhružně) Bude lepší, když odejdeš.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Když tě tu ještě někdy uvidím, bez rozpaků tě zabiju.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Dexter_NoMoreSmallTalk == TRUE) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//(útočně) Říkal sis o to...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Ach jo, chlape. Udělal bys líp, kdyby ses tu neukazoval. Jsi ve špatnou chvíli na špatnym místě.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill,Dialog_Ende,DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	var C_Item itm;
	AI_StopProcessInfos(self);
	DexterNoLoyalMore = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	itm = Npc_GetEquippedArmor(Greg_NW);

	if(Hlp_IsItem(itm,ITAR_PIR_N_Addon) == FALSE)
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_N_Addon);
	};
};


instance DIA_Dexter_Kopf(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent = FALSE;
	description = "Chceš moji hlavu? Pojď si pro ni!";
};


func int DIA_Dexter_Kopf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chceš moji hlavu? Pojď si pro ni!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//(útočně) Jak si přeješ...
	DIA_Dexter_Kill_ENDE();
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

