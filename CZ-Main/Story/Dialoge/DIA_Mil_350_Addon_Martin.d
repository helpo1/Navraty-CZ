
instance DIA_Addon_Martin_EXIT(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 999;
	condition = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_PICKPOCKET(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 900;
	condition = DIA_Addon_Martin_PICKPOCKET_Condition;
	information = DIA_Addon_Martin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Martin_PICKPOCKET_Condition()
{
	return C_Beklauen(65,77);
};

func void DIA_Addon_Martin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,Dialog_Back,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};

func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};


instance DIA_Addon_Martin_MeetingIsRunning(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 1;
	condition = DIA_Addon_Martin_MeetingIsRunning_Condition;
	information = DIA_Addon_Martin_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Martin_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Martin_MeetingIsRunning_OneTime;

func void DIA_Addon_Martin_MeetingIsRunning_Info()
{
	if(DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//Tak ty jsi ten nový chlapík, hm? Vítej mezi námi, bratře Kruhu.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Raději teď už běž za Vatrasem. Možná na tebe budu mít čas později.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_Hallo(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Hallo_Condition;
	information = DIA_Addon_Martin_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Martin_Hallo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (RangerMeetingRunning != LOG_SUCCESS) && (SC_IsRanger == FALSE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hej, ty. Ty tu nemáš co pohledávat. Tam můžou pouze paladinové a domobrana.
};


instance DIA_Addon_Martin_WasMachstDu(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_WasMachstDu_Condition;
	information = DIA_Addon_Martin_WasMachstDu_Info;
	description = "Co je tam k vidění?";
};


func int DIA_Addon_Martin_WasMachstDu_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//Co je tam k vidění?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Tohle je sklad zásob královských paladinů.

	if((other.guild == GIL_NONE) && (SC_IsRanger == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//Já jsem zde proviantmistrem a jsem zodpovědný za to, že se nic z paladinských věcí neztratí. A ty tu nejsi vítán.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Tak drž své prsty raději dál, jinak tě přes ně klepnu.
	};
};


instance DIA_Addon_Martin_PreTrade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_PreTrade_Condition;
	information = DIA_Addon_Martin_PreTrade_Info;
	description = "Nemůžeš mi prodat nějaké paladinské věci?";
};

func int DIA_Addon_Martin_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_PreTrade_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Nemůžeš mi prodat nějaké paladinské věci?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Chceš něco koupit? Uděláme to takto: když mě odškodníš za potíže, které mi nastanou kvůli tomu, že se něco 'ztratí', pak možná budeme moci spolu obchodovat.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Ztrácejí se tady věci často?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//Pokud proviantmistr řekne, že je vše v pořádku, tak ne.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Rozumím.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,LogText_Addon_MartinTrade);
};


instance DIA_Addon_Martin_Farim(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Farim_Condition;
	information = DIA_Addon_Martin_Farim_Info;
	description = "Rybář Farim má problém s domobranou. Ti frajírci ho pořád okrádají.";
};

func int DIA_Addon_Martin_Farim_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Farim_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Rybář Farim má problém s domobranou. Ti frajírci ho pořád okrádají.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//A proč by mě to mělo zajímat?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//No, máš zde jistý vliv mezi paladiny.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim potřebuje tvou ochranu. Rád ti jako odškodné dá část svého úlovku.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//Chápu, kam tím míříš.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//(pohrdavě) Ryby! Jako kdybych už neměl na starosti dost věcí.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Řekni tomu svému kamarádovi, ať za mnou přijde a přesně mi řekne, jak to bylo s tou domobranou.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Podívám se na to.
	B_LogEntry(TOPIC_Addon_FarimsFish,"Proviantmistr Martin to prošetří.");
	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP(XP_Addon_FarimSchutz);
};


instance DIA_Addon_Martin_Trade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 80;
	condition = DIA_Addon_Martin_Trade_Condition;
	information = DIA_Addon_Martin_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi můžeš nabídnout?";
};

func int DIA_Addon_Martin_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

var int DIA_Addon_Martin_Trade_OneTime;
var int MartinHasPalLight;

func void DIA_Addon_Martin_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi můžeš nabídnout?

	if((DIA_Addon_Martin_Trade_OneTime == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		CreateInvItems(self,ItMw_ShortSword1,1);
		CreateInvItems(self,ItMw_1h_Mil_Sword,1);
		CreateInvItems(self,ItMw_Schwert2,1);
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		CreateInvItems(self,ItMw_2h_Pal_Sword,1);
		CreateInvItems(self,ItRw_Mil_Crossbow,1);
		CreateInvItems(self,ItRw_Bolt,75);
		AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Dívej se pozorně.
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	if((MartinHasPalLight == FALSE) && ((XARDASTELLMEOSTA == TRUE) || (KNOWWHERENERCONOMICON == TRUE)))
	{
		CreateInvItems(self,ItSc_PalLight,10);
		MartinHasPalLight = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Martin_Rangerhelp(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Rangerhelp_Condition;
	information = DIA_Addon_Martin_Rangerhelp_Info;
	description = "Lares mě poslal. Řekl, že mi pomůžeš.";
};

func int DIA_Addon_Martin_Rangerhelp_Condition()
{
	if((RangerHelp_gildeMIL == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Rangerhelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Lares mě poslal. Řekl, že mi pomůžeš.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Opravdu? Tak tedy mluv. Co bys ode mne chtěl?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Chci se přidat k domobraně.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//(směje se) To bys chtěl? Obvykle nepřijímáme takové pobudy jako ty. Ne bez dobrého důvodu.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Nejdříve bys asi musel...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Nech těch hloupostí. Prostě mi řekni, co musím udělat, abych se k vám přidal.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//(překvapeně) Dobrá. Tak poslouchej.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//Být proviantmistrem je peklo, to ti říkám. Starat se o všechny tyhle bedny a pytle je dost špatné samo o sobě.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//Ale kdykoliv si večer po práci zajdu ke Kardifovi do krčmy, někdo začne slídit kolem beden se zásobami a když jsem ráno zpátky, něco chybí.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//(rozezleně) Divné ale je, že paladinové si nikdy ničeho nevšimnou.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//(rozzlobeně) Začínám z toho šílet. Nemůžu tu přece zůstat celou noc jako nějaký idiot.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Ty, na druhou stranu...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//Rozumím. Chceš, abych tady střežil celou noc, zatímco ty budeš sedět v krčmě.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Ber nebo nech být.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Musím dohlížet na bedny proviantmistra Martina. Jestliže chytím toho, kdo mu krade z beden zásoby, Martin mi pomůže přidat se k domobraně.");
};


instance DIA_Addon_Martin_Auftrag(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Auftrag_Condition;
	information = DIA_Addon_Martin_Auftrag_Info;
	description = "Dobrá, postarám se o ty tvé bedny.";
};

func int DIA_Addon_Martin_Auftrag_Condition()
{
	if((RangerHelp_gildeMIL == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Martin_Rangerhelp) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Dobrá, postarám se o ty tvé bedny.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//(spokojeně) Výborně.

	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//Jdu tedy ke Kardifovi do krčmy. A ne aby něco chybělo, jak se vrátím.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Fajn. Přijď večer a dohlížej na ty věci. Já budu u Kardifa v krčmě.
	};

	MIS_Addon_Martin_GetRangar = LOG_Running;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(MIL_321_Rangar,"PalCampKlau");
};

instance DIA_Addon_Martin_FromVatras(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_FromVatras_Condition;
	information = DIA_Addon_Martin_FromVatras_Info;
	description = "Hledáš muže, který prodává zbraně banditům?";
};

func int DIA_Addon_Martin_FromVatras_Condition()
{
	if(Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_FromVatras_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Hledáš muže, který prodává zbraně banditům?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//Říká kdo?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Říká Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Och. Víš o tom něco?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Zatím moc ne, ale mohl bych zjistit více.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//(kapíruje) Ach, tak je to tedy...
};


instance DIA_Addon_Martin_TellAll(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_TellAll_Condition;
	information = DIA_Addon_Martin_TellAll_Info;
	description = "Řekni, co víš o tom prodejci zbraní?";
};


func int DIA_Addon_Martin_TellAll_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_TellAll_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Řekni, co víš o tom prodejci zbraní?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Poslouchej. Víme, že za tím stojí nějaký velice vlivný měšťan z horní čtvrti.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//Některé prodané zbraně dokonce pocházejí přímo ze zbrojnice domobrany.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Pořád ale nevíme, kdo přesně se za tím skrývá.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Kdybys měl dost odvahy vyřídit skupinu alespoň pěti banditů, pak bys možná zjistil více...
	B_LogEntry(TOPIC_Addon_Bandittrader,"Podle Martina je prodejcem zbraní někdo z nejvlivnějších měšťanů žijící v horní čtvrti.");
};


instance DIA_Addon_Martin_AboutBandits(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_AboutBandits_Condition;
	information = DIA_Addon_Martin_AboutBandits_Info;
	description = "Co víš o banditech?";
};


func int DIA_Addon_Martin_AboutBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_AboutBandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//Víme, že banditi přepadávají cesty mezi městem a farmami.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//A také víme, že jim před několika dny přijela veliká dodávka zbraní.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Možná mezi bandity najdeš nějakou stopu, která by nás dovedla k prodejci zbraní.
	MIs_Martin_FindTheBanditTrader = LOG_Running;
	B_LogEntry(TOPIC_Addon_Bandittrader,"Banditi přepadávají cesty mezi městem a farmami. Možná u nich najdu nějakou stopu vedoucí k prodejci zbraní.");
};


instance DIA_Addon_Martin_Fernando(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Fernando_Condition;
	information = DIA_Addon_Martin_Fernando_Info;
	permanent = TRUE;
	description = "O tom prodejci zbraní...";
};


func int DIA_Addon_Martin_Fernando_Condition()
{
	if(MIs_Martin_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};


var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info()
{
	var int FernandoHints;
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//O tom prodejci zbraní...
	if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)) || (Fernando_HatsZugegeben == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Ukaž, co máš.
		FernandoHints = 0;

		if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)))
		{
			if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//U banditů jsem našel tento kord. Je na něm vyryto písmeno F.
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//Tento prsten jsem získal od jednoho z banditů. Ukazuje na zámořského obchodníka.
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Tento seznam zbraní a ostatního zboží doručeného banditům je podepsaný jistým Fernandem.
				FernandoHints = FernandoHints + 3;
			};
			if(Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Navíc Fernando, starý obchodník z horní čtvrti, se přiznal, že obchoduje s bandity.
				FernandoHints = FernandoHints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando se přiznal, že podporoval bandity zbraněmi.
		};
		if(FernandoHints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//To by mělo stačit. Tak tedy Fernando. No, dostane, co si zaslouží.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//Zajímavé. Vždycky, když na to přišla řeč, vypadal poněkud spokojeně.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//Můžu tě ubezpečit, že neuvidí denní světlo ještě hodně dlouho.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Udělal jsi to opravdu dobře. Velmi dobře.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras bude těmito dobrými zprávami potěšen.
			B_StartOtherRoutine(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry(TOPIC_Addon_Bandittrader,"Martin mě ujistil, že Fernando dostane, co si zaslouží. Měl bych o tom informovat Vatrase.");
			B_GivePlayerXP(XP_Addon_FernandoMartin);
			Npc_ExchangeRoutine(vlk_6134_valeran,"WaitInTavern");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//Ještě něco dalšího?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//To je vše.

			if(Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//Velmi pěkné, že se přiznal, ale bez pádného důkazu ho nemůžeme poslat za mříže.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Nechci ze sebe udělat hlupáka před lordem Hagenem. Musíš najít víc důkazů.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//To nestačí. Podle tvých důkazů to může být téměř kdokoliv z horní čtvrti.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Myslím, že budeš muset sledovat stopu banditů a poslední dodávky ještě trochu déle.
				if(Martin_IrrlichtHint == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Možná bys měl s Vatrasem promluvit znova.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Ještě jednou, co to mám udělat?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Poslouchej. Musíš zjistit, kdo stojí za dodávkami zbraní banditům a přinést mi důkaz.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//A bude to muset být vážně neotřesitelný důkaz, nebo toho chlápka nebudeme moci zatknout.
	};
};


instance DIA_Addon_Martin_Perm(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 90;
	condition = DIA_Addon_Martin_Perm_Condition;
	information = DIA_Addon_Martin_Perm_Info;
	permanent = TRUE;
	description = "Všechny bedny tu pořád jsou?";
};


func int DIA_Addon_Martin_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Všechny bedny tu pořád jsou?
	if((MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay() - 2)) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//(rozzlobeně) Ty budižkničemu, měls ty bedny hlídat! Teď chybí další věci!
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//(hlasitě) Teď půjdeš přímo k tomu skladu zásob v přístavu a dostaneš toho hajzla, který mě okradl, jasný?!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//A dnes večer, jak odejdu, budeš dávat pořádnýho majzla, rozuměls?!
		};
	}
	else if((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (SC_IsRanger == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Jo, jo, směj se, dokud můžeš. Rád bych viděl, jak bys tady TY stál celý den a zkoušel udělat v tomto svinstvu pořádek.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Paladinové přivezli tolik harampádí, až to není vtipný.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Na nic nešahej nebo zavolám stráže, slyšels mě?
	};
};


instance DIA_Addon_Martin_GotRangar(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GotRangar_Condition;
	information = DIA_Addon_Martin_GotRangar_Info;
	description = "Našel jsem toho zloděje.";
};


func int DIA_Addon_Martin_GotRangar_Condition()
{
	if((MIS_Addon_Martin_GetRangar == LOG_Running) && (SC_GotRangar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GotRangar_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Našel jsem toho zloděje.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//To Rangar se hrabe ve tvých zásobách.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//Konečně. Teď už aspoň vím, na koho si mám počkat. Ten parchant! Až ho dostanu do rukou...
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//Vždycky mě zajímalo, proč si paladinové nikdy ničeho nevšimli.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//A? Proč?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Není to zřejmé? Ti blbci neumí rozlišit jednoho domobránce od druhého. Všichni pro ně vypadáme stejně.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Dobrá práce, kámo.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Když budeš něco potřebovat, jen dej vědět.
	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Martin_GotRangar_Report);
};

instance DIA_Addon_Martin_GetMiliz(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GetMiliz_Condition;
	information = DIA_Addon_Martin_GetMiliz_Info;
	description = "Ty víš, co od tebe chci.";
};

func int DIA_Addon_Martin_GetMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_GotRangar) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GetMiliz_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Ty víš, co od tebe chci.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Ach, samozřejmě. Chceš se přidat k domobraně, nemám pravdu?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//No, své schopnosti jsi už rozhodně prokázal.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//Řeknu to takhle - radši bych viděl, že jsi na naší straně, než na něčí jiné.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//Proto ti pomůžu. Vezmi si tohle doporučení a ukaž ho Andremu, našemu veliteli.
	CreateInvItems(self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_GiveInvItems(self,other,ItWr_Martin_MilizEmpfehlung_Addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Najdeš ho v kasárnách. Jsem si jistý, že pro tebe bude mít nějaké využití.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Martin mi dal doporučující dopis pro lorda Andreho. Andre mě nyní přijme k domobraně. Můžu ho nalézt v kasárnách.");
};

instance DIA_Addon_Martin_Coragon(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Coragon_Condition;
	information = DIA_Addon_Martin_Coragon_Info;
	permanent = FALSE;
	description = "Můžeš mi pomoct s jednou záležitostí?";
};

func int DIA_Addon_Martin_Coragon_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade) == TRUE) && (MIS_CoragonFixBeer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Coragon_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_00");	//Můžeš mi pomoct s jednou záležitostí?
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_01");	//Podle toho, oč jde.
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_02");	//Jelikož hospodský před kasárnama točí z rozkazu paladinů pivo zdarma, Coragon začíná mít velké problémy.
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_03");	//Ztrácí zákazníky a tedy i příjem. Chápeš, co tím myslím?
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_04");	//(čile) Řekněme, že ano. Co s tím?
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_05");	//Nemohl bys nějak... ovlivnit situaci?
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_06");	//Paladinské rozkazy může zrušit jenom lord Hagen nebo lord Andre.
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_07");	//Já to nemůžu udělat.
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_08");	//Opravdu nedovedeš udělat nic?
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_09");	//(sarkasticky) No, to záleží na tom, co mi můžeš nabídnout.
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_10");	//Co takhle dvě bečky prvotřídního piva?
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_11");	//(zamyšleně) Ano, to je zajímavá nabídka.
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_12");	//Takže říkáš, že hospodský na městském náměstí točí pivo zdarma?
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_13");	//Přesně ten.
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_14");	//Dobrá. Dej mi chvíli času - možná den - a já ten Coragonův problém vyřídím.
	AI_Output(self,other,"DIA_Addon_Martin_Coragon_01_15");	//A pak budu chtít svoje pivo! Nezapomeň na to.
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_16");	//Jistě.
	MartinSpeakUpDay = Wld_GetDay();
	B_LogEntry(TOPIC_CoragonFixBeer,"Martin řekl, že za dvě bečky piva vyřeší Coragonův problém za den. Zajímalo by mě, jak to udělá.");
};