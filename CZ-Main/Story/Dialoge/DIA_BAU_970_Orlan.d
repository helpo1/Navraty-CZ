/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Orlan_RUESTUNG_Buy - opraveno ID předmětu (ITAR_Bau_L -> ITAR_Bau_M)

*/




instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = "Přinesl jsem víno z kláštera.";
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Přinesl jsem víno z kláštera.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Výborně. Už jsem na něj čekal.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Přistoupil jsem na Goraxovu cenu. Hned teď ti dám 100 zlatých.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Dobrá, tak mi dej to zlato.",DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein,"Ty se mě snažíš napálit?",DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//Dobrá, tak mi dej to zlato.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Tady máš. Bylo mi potěšením s tebou obchodovat.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Pokoušíš se mě obrat? Cena je 240 zlatých.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Gorax tě varoval, že? Dobrá, možná bychom na tom mohli vydělat oba. Hele - dám ti za to víno 100 zlatých.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Řekneš Goraxovi, že jsem tě natáhl, a já ti dám ČTYŘI magické svitky.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Hej, prostě mi dej 240 zlatých.",DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein,"Dobrá, to zní docela férově. Dej mi ty svitky.",DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein,"Co to je za svitky?",DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, prostě mi dej 240 zlatých.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Copak na tom nechceš vydělat, co? (povzdech) Dobrá, tady je zlato.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	B_GiveInvItemsManyThings(self,other);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Dobrá, to zní docela férově. Dej mi ty svitky.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Tady jsou svitky a zlato.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//Co to je za svitky?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Netuším - o tomhle já nic nevím. Jsou od hosta, co... ehm... je tady zapomněl, jo.
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Jsem Orlan, majitel tohohle skromného hostince.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Co sháníš, cizinče? Možná pořádný meč, nebo snad kus dobré zbroje?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Doušek něčeho dobrého z venkovských palíren, nebo jen nějakou informaci?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Můžu ti to nabídnou všechno a dokonce ještě víc, pokud jsou tvé zlaťáky pravé.
};


instance DIA_Addon_Orlan_Greg(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_Greg_Condition;
	information = DIA_Addon_Orlan_Greg_Info;
	description = "Znáš toho chlápka s páskou přes oko?";
};


func int DIA_Addon_Orlan_Greg_Condition()
{
	if((SC_SawGregInTaverne == TRUE) && (Kapitel <= 3) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Znáš toho chlápka s páskou přes oko?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//Už jsem ho tu jednou viděl - takový hrubián.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Ubytoval se v jednom z mých pokojů. Měl s sebou obrovskou truhlu.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//Až když jsem mu to několikrát připomínal, tak mi konečně zaplatil nájem za pokoj - vůbec s tím nespěchal.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//A pak byl najednou prostě pryč. I se svou truhlou. Už nechci nic mít s lidmi jako je on.
};


instance DIA_Addon_Orlan_Ranger(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Ranger_Condition;
	information = DIA_Addon_Orlan_Ranger_Info;
	description = "Zdá se mi to nebo fakt zíráš na můj prsten?";
};


func int DIA_Addon_Orlan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (SCIsWearingRangerRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//Zdá se mi to nebo fakt zíráš na můj prsten?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Nejsem si jistý co s tím.
	Orlan_KnowsSCAsRanger = TRUE;
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Člověče! Patřím ke 'Kruhu Vody'!",DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Je to akvamarín. Už jsi někdy nějaký viděl?",DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//Je to akvamarín. Už jsi někdy nějaký viděl?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Jo. Vítej na velitelství, bratře Kruhu.
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//Ačkoli nezdáš se být zrovna nejchytřejší...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Co pro tebe můžu udělat?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//Člověče! Patřím ke 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Vidím, vidím. Nemůžu uvěřit, že takový blázen byl přijat mezi nás...
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Co chceš?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};


instance DIA_Addon_Orlan_Teleportstein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Teleportstein_Condition;
	information = DIA_Addon_Orlan_Teleportstein_Info;
	description = "Už jsi někdy použil teleportarční kámen?";
};


func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if((Orlan_KnowsSCAsRanger == TRUE) && (SCUsed_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//Už jsi někdy použil teleportarční kámen?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Zbláznil ses? Dokud mi mágové Vody neřeknou, že je to bezpečné, nepřiblížím se k němu na 10 kroků.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Pověřili mě, abych schoval jeden z těch teleportačních kámenů a to je přesně to, co chci udělat.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"Můžu se na ten teleportarční kámen podívat?",DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"Kde je přesně ten teleportační kámen?",DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_Teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//Můžu se na ten teleportarční kámen podívat?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Pro mě za mě. Tady je klíč. Zatarasil jsem vchod.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	B_GiveInvItems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Orlan zamkl teleportační kámen v jeskyni na jihozápad od jeho hostince.");
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Kde je přesně ten teleportační kámen?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Kousek na jih od mojí hostince. Tam ho našli mágové Vody.
};


instance DIA_Addon_Orlan_NoMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_NoMeeting_Condition;
	information = DIA_Addon_Orlan_NoMeeting_Info;
	description = "Mám zde být uveden do 'Kruhu Vody'!";
};


func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && !Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger) && (SCIsWearingRangerRing == FALSE) && (MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//Mám zde být uveden do 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//(štiplavě) Nevidím prsten. Chceš něco k pití?
};


instance DIA_Addon_Orlan_WhenRangerMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information = DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description = "Slyšel jsem něco o srazu 'Kruhu' ve tvém hostinci.";
};


func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	B_Addon_Orlan_RangersReadyForComing();
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Slyšel jsem něco o srazu 'Kruhu' ve tvém hostinci.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//To je pravda. Měl by každou chvíli začít.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Zajímalo by mě, co je zdrželo.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Jsem si jistý, že se brzy objeví.",DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Ten sraz je dneska?",DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	B_MakeRangerReadyForMeetingALL();
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Ten sraz je dneska?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Pokud si to dobře pamatuju tak ano.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Doufám, že nepřijdou pozdě.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"(pokračovat)",DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	B_MakeRangerReadyForMeetingALL();
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Jsem si jistý, že se brzy objeví.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Uvidíme.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_Ende,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = "Jaký druh zbroje mi můžeš nabídnout?";
};


var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (DIA_Orlan_RUESTUNG_noPerm == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jaký druh zbroje mi můžeš nabídnout?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//Mám tady jeden velmi pěkný kousek, který se ti určitě bude líbit.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG,"Oděv farmáře (ochrana proti zbraním: 10, střelám: 10, cena: 250 zlatých)",DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Rád bych si tu zbroj koupil.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//Moudré rozhodnutí.
		CreateInvItems(self,ITAR_Bau_M,1);
		B_GiveInvItems(self,other,ITAR_Bau_M,1);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Promiň. Dokud nemáš peníze, žádné obchody nebudou.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chceš. Ale neotálej příliš dlouho.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Orlan_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Ukaž mi své zboží.

	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || (SCIsWearingRangerRing == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Samozřejmě, bratře Kruhu.
		Orlan_KnowsSCAsRanger = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Samozřejmě. Je to pro mne velká čest, mít tu tak vznešeného hosta.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Zajisté, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Pokud na to máš.
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));
};


instance DIA_Orlan_HotelZimmer(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelZimmer_Condition;
	information = DIA_Orlan_HotelZimmer_Info;
	permanent = TRUE;
	description = "Kolik si účtuješ za pokoj?";
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelZimmer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Kolik si účtuješ za pokoj?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if((SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Pro bratra 'Kruhu'? Vůbec nic.
			Orlan_RangerHelpZimmer = TRUE;
			Orlan_KnowsSCAsRanger = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Pro královy rytíře mám vždycky volný pokoj. Samozřejmě zdarma.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nikdy bych si nedovolil brát peníze od zástupců Innose.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Tady je klíč od horních pokojů. Jeden z nich si zaber.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Dej mi 50 zlatých na týden a můžeš si vybrat některý z pokojů.
		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"To je zatraceně drahé.",DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Dobrá. Tady jsou peníze.",DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//Dobrá. Tady jsou peníze.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Tady máš klíč. Pokoje jsou nahoře nad schody. Ale moc to tam nezamaž a plať včas, jasné?
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Orlan_SCGotHotelZimmer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nemáš 50 zlatých. Nejdřív peníze, pak zábava.
	};
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//To je zatraceně drahé.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Tak to by ses měl poohlédnout po něčem jiném, příteli.
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};


var int Orlan_AngriffWegenMiete;

instance DIA_Orlan_MieteFaellig(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};
	if((Orlan_AngriffWegenMiete == TRUE) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	if((Orlan_SCGotHotelZimmer == TRUE) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7)) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(úlisně) Jsem potěšen tvou ctihodnou návštěvou. Zůstaň tu tak dlouho, jak budeš chtít. Je to pro mě čest.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kdy konečně dostanu nájem?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Zapomeň na to, už ti nedám ani zlámanou grešli.",DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Tady je tvých 50 zlatých.",DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Tady je tvých 50 zlatých.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Fajn, už bylo načase.
		if(DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Kde ses celý den toulal?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Do toho ti nic není.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. Dobrá, stejně to není moje věc.
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Hele, pokoušíš se mě podvést? Nemáš dost peněz ani na to, abys zaplatil tohle jídlo. Já ti ukážu, ty, ty...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Zapomeň na to. Už ti nezaplatím.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Fajn, já ti ukážu, ty mizernej podvodníku.
	Orlan_AngriffWegenMiete = TRUE;
	Info_ClearChoices(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//Tak přece ses ukázal. Čekal jsem na tebe.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co se stalo?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Soutěž v pití skončila.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kdo vyhrál?

	if((Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",ItFo_Water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tentokrát Randolph. Rukhar musel mít špatnej den.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar to už zase Randolphovi nandal. To se dalo jen očekávat.
		Rukhar_Won_Wettkampf = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Tak dobrá, doufám, že to bylo naposledy. O takovéhle pozdvižení ve svém domě nestojím, zapište si to všichni za uši.
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(Randolph,"Start");

	if(Hlp_IsValidNpc(Rukhar))
	{
		if(Rukhar_Won_Wettkampf == TRUE)
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharWon");
		}
		else
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharLost");
		};
	};

	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
};


instance DIA_Orlan_EINGEBROCKT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Tos mě dostal do pěkné kaše. Teď abych Rukharovi ještě nalil.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Proč?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Dokud si tady pořádá ty své soutěže, je lepší, aby se o tom nikdo z venku nedozvěděl. Není to dobré pro obchod, jasný?
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = "Jak to jde s hostincem?";
};


func int DIA_Orlan_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Jak to jde s hostincem?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Už to bylo lepší, však víš.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Lidé už nesahají do svých měšců tak ochotně, jak by měli.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Snad ty černé kápě brzy odtáhnou, jinak můžu hostinec zavřít.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Už se skoro nikdo neodváží zajít až sem.
	};
};


instance DIA_Orlan_Minenanteil(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_Minenanteil_Info;
	description = "Prodáváš důlní akcie?";
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Prodáváš důlní akcie?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasně. Ode mě dostaneš všechno, tedy pokud na to máš.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_PICKPOCKET(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_Orlan_PICKPOCKET_Condition;
	information = DIA_Orlan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Orlan_PICKPOCKET_Condition()
{
	return C_Beklauen(89,260);
};

func void DIA_Orlan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,Dialog_Back,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

instance DIA_ORLAN_MEETKILL(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_meetkill_condition;
	information = dia_orlan_meetkill_info;
	permanent = FALSE;
	description = "Mám se tady sejít s jednou osobou.";
};

func int dia_orlan_meetkill_condition()
{
	if((APEARKILLER == TRUE) && (MEETCHIEFKILLERSLAIT == FALSE) && (MEETCHIEFKILLERS == FALSE) && (MIS_GERBRANDTHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_meetkill_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Orlan_MeetKill_01_00");	//Mám se tady sejít s jednou osobou.
	AI_Output(self,other,"DIA_Orlan_MeetKill_01_02");	//Ale jo! Jeden chlápek o tom něco říkal. Byl divný, to ti můžu říct!
	AI_Output(self,other,"DIA_Orlan_MeetKill_01_03");	//Myslím, že šel do horního patra - podívej se do zadní místnosti.
};

instance DIA_ORLAN_MEETKILLLAIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_meetkilllait_condition;
	information = dia_orlan_meetkilllait_info;
	permanent = FALSE;
	description = "Mám se tady sejít s jednou osobou.";
};

func int dia_orlan_meetkilllait_condition()
{
	if((MEETCHIEFKILLERSLAIT == TRUE) && (MIS_GERBRANDTHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_meetkilllait_info()
{
	AI_Output(other,self,"DIA_Orlan_MeetKillLait_01_00");	//Mám se tady sejít s jednou osobou.
	AI_Output(self,other,"DIA_Orlan_MeetKillLait_01_02");	//Ale jo! Jeden chlápek o tom něco říkal. Byl divný, to ti můžu říct!
	AI_Output(self,other,"DIA_Orlan_MeetKillLait_01_03");	//Ale vypadá to, že už odešel.
};

instance DIA_ORLAN_MISSBRENDI(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_missbrendi_condition;
	information = dia_orlan_missbrendi_info;
	permanent = FALSE;
	description = "Neviděl jsi tady člověka jménem Benchel?";
};

func int dia_orlan_missbrendi_condition()
{
	if((BENCHELSEE == FALSE) && (MIS_BLACKBRENDI == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_missbrendi_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Orlan_MissBrendi_Info_01_00");	//Neviděl jsi tady člověka jménem Benchel?
	AI_Output(self,other,"DIA_Orlan_MissBrendi_Info_01_03");	//Už odešel - vlastně před pár minutami!
	AI_Output(self,other,"DIA_Orlan_MissBrendi_Info_01_04");	//Byl tady pár dní, naléval se levným pivem, pak si ode mě vzal nějakou černou brandy a šel do města.
	AI_Output(self,other,"DIA_Orlan_MissBrendi_Info_01_05");	//Takže, pokud si pospíšíš, pořád ho můžeš chytit. Nemyslím, že by se dostal daleko.
	B_LogEntry(TOPIC_BLACKBRENDI,"Orlan mi řekl, že jsme se s Benchelem právě minuli. Před pár minutami odešel z hostince směrem do města, samozřejmě si nezapomněl vzít s sebou jako společnost nějakou černou brandy.");
};

instance DIA_Orlan_Werewolf(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Werewolf_Condition;
	information = DIA_Orlan_Werewolf_Info;
	permanent = FALSE;
	description = "Nevíš něco o napadení zvířetem?";
};

func int DIA_Orlan_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Akil_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orlan_Werewolf_01_00");	//Nevíš něco o napadení zvířetem?
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_01");	//(nervózně) O jakém napadení mluvíš?
	AI_Output(other,self,"DIA_Orlan_Werewolf_01_02");	//Nedávno nějaká šelma zabila člověka nedaleko od tvého hostince, pod mostem.
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_03");	//A, co ty s tím...(povzdech) Ne, o ničem nevím.
	AI_Output(other,self,"DIA_Orlan_Werewolf_01_04");	//A nedonesly se ti nějaké řeči?
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_05");	//Hmm... Někdo se zmínil, že viděl velkou stínovou šelmu nedaleko Sekobovy farmy.
	AI_Output(self,other,"DIA_Orlan_Werewolf_01_06");	//Pár se jich tu potuluje po lesích. Věř, lesy se tu hemží monstry.
	B_LogEntry(TOPIC_WolfAndMan,"Orlan o útoku nic neví, ale slyšel, že někdo viděl velkou stínovou šelmu nedaleko Sekobovy farmy.");
};


//----------------------------kosti-----------------------------

instance DIA_BAU_970_Orlan_Game(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_BAU_970_Orlan_Game_condition;
	information = DIA_BAU_970_Orlan_Game_info;
	description = "Slyšel jsem, že hraješ kostky.";
};

func int DIA_BAU_970_Orlan_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (GameOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_Game_info()
{
	AI_Output(other,self,"DIA_BAU_970_Orlan_Game_01_00");	//Slyšel jsem že hraješ kostky.
	AI_Output(self,other,"DIA_BAU_970_Orlan_Game_01_01");	//No, pokud jsi to slyšel...
	AI_Output(other,self,"DIA_BAU_970_Orlan_Game_01_02");	//Můžu se přidat?
	AI_Output(self,other,"DIA_BAU_970_Orlan_Game_01_03");	//Proč ne. Řekni si.
	OrlanPlayResult = 150;
	Menu_WriteInt("AST","SysTimer03",0);
};

instance DIA_BAU_970_Orlan_GamePlay(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_BAU_970_Orlan_GamePlay_condition;
	information = DIA_BAU_970_Orlan_GamePlay_info;
	permanent = TRUE;
	description = "Hrajeme!";
};

func int DIA_BAU_970_Orlan_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_BAU_970_Orlan_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer03");

	if(CheckLastGame >= OrlanPlayResult)
	{
		CheckLastSum = CheckLastGame - OrlanPlayResult;
	};

	AI_Output(other,self,"DIA_BAU_970_Orlan_GamePlay_01_00");	//Hrajeme.

	if(OrlanPlayResult >= CheckLastGame)
	{
		if((OrlanPlayResult > 0) && (OrlanDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_01");	//Skvěle. Rozluč se se zlatem.
			PlayPocker(1,self);
		}
		else
		{
			if(OrlanDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_02");	//Už jsi mne obral dost...
				OrlanDayPlay = Wld_GetDay();
				OrlanDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_03");	//Ani nápad.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_04");	//A co zlato za poslední zápas?
		AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_01_05");	//Napřed zlato, pak hra.
		Info_ClearChoices(DIA_BAU_970_Orlan_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_BAU_970_Orlan_GamePlay,"Tady je.",DIA_BAU_970_Orlan_GamePlay_Here);
		};

		Info_AddChoice(DIA_BAU_970_Orlan_GamePlay,"Nemám.",DIA_BAU_970_Orlan_GamePlay_No);
	};
};

func void DIA_BAU_970_Orlan_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	OrlanPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_BAU_970_Orlan_GamePlay_Here_01_01");	//Tady je.
	AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_Here_01_02");	//Tak můžeme hrát.
	PlayPocker(1,self);
};

func void DIA_BAU_970_Orlan_GamePlay_No()
{
	AI_Output(other,self,"DIA_BAU_970_Orlan_GamePlay_No_01_01");	//Nemám.
	AI_Output(self,other,"DIA_BAU_970_Orlan_GamePlay_No_01_02");	//Koukej sehnat!
	Info_ClearChoices(DIA_BAU_970_Orlan_GamePlay);
};

instance DIA_BAU_970_Orlan_GameEnd(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_BAU_970_Orlan_GameEnd_condition;
	information = DIA_BAU_970_Orlan_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_BAU_970_Orlan_GameEnd_condition()
{
	if((MustTellResult_Orlan == TRUE) && ((OrlanLost == TRUE) || (OrlanWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_GameEnd_info()
{
	if(OrlanLost == TRUE)
	{
		AI_Output(self,other,"DIA_BAU_970_Orlan_GameEnd_00");	//Nikdy by mě nenapadlo, že budeš hrát tak dobře.
		OrlanLost = FALSE;
	}
	else if(OrlanWon == TRUE)
	{
		AI_Output(self,other,"DIA_BAU_970_Orlan_GameEnd_01");	//Nezoufej, tvé zlato je v dobrých rukou.
		OrlanWon = FALSE;
	};

	MustTellResult_Orlan = FALSE;
};