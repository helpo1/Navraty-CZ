/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int DIA_Matteo_Jewerly_Condition - upraveny podmínky dialogu

*/



instance DIA_Matteo_EXIT(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 999;
	condition = DIA_Matteo_EXIT_Condition;
	information = DIA_MAtteo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Matteo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MAtteo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Matteo_PICKPOCKET(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 900;
	condition = DIA_Matteo_PICKPOCKET_Condition;
	information = DIA_Matteo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Matteo_PICKPOCKET_Condition()
{
	return C_Beklauen(80,150);
};

func void DIA_Matteo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,Dialog_Back,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

var int FirstTalkMatteo;

instance DIA_Matteo_NoTalkAtAll(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_NoTalkAtAll_Condition;
	information = DIA_Matteo_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Matteo_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_NoTalkAtAll_Info()
{
	if(FirstTalkMatteo == FALSE)
	{
		AI_Output(self,other,"DIA_Matteo_NoTalkAtAll_12_00");	//Tady nemáš co hledat!
		AI_Output(self,other,"DIA_Matteo_NoTalkAtAll_12_01");	//Vypadni!
		FirstTalkMatteo = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_NoTalkAtAll_12_02");	//Řekl jsem, vypadni!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Matteo_Hallo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Hallo_Condition;
	information = DIA_MAtteo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Matteo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Hallo_Info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Co pro tebe mohu udělat?
};

instance DIA_Matteo_SellWhat(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_SellWhat_Condition;
	information = DIA_MAtteo_SellWhat_Info;
	permanent = FALSE;
	description = "Co tady prodáváš?";
};


func int DIA_Matteo_SellWhat_Condition()
{
	return TRUE;
};

func void DIA_MAtteo_SellWhat_Info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Co tady prodáváš?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Mohu ti nabídnout vše, co pořebuješ pro přežití v divočině. Zbraně, pochodně, zásoby... dokonce i zbroj.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//Mám tu taky nějaké zvláštní zboží.

	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Matteův obchod leží u jižní městské brány. Prodává vybavení, zbraně i potraviny.");
		Knows_Matteo = TRUE;
	};
};


instance DIA_Matteo_TRADE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 800;
	condition = DIA_Matteo_TRADE_Condition;
	information = DIA_Matteo_TRADE_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};

func int DIA_Matteo_TRADE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_SellWhat) == TRUE) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};


var int Matteo_TradeNewsPermanent;

func void DIA_Matteo_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	if((Npc_HasItems(other,ItMi_Saw) == 0) && (Npc_HasItems(self,ItMi_Saw) == 0))
	{
		CreateInvItems(self,ItMi_Saw,2);
	};
	if((Npc_HasItems(other,ItMi_Scoop) == 0) && (Npc_HasItems(self,ItMi_Scoop) == 0))
	{
		CreateInvItems(self,ItMi_Scoop,2);
	};
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Ukaž mi své zboží.

	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Matteo_TradeNewsPermanent == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//Od té doby, co žoldáci oddělali paladina Lothara, to tu ti jeho kamarádíčkové prošťourávají mnohem přísněji.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Doufám, že až vraha pověsí, tak se to zlepší.
		Matteo_TradeNewsPermanent = 1;
	};
	if((Kapitel == 5) && (Matteo_TradeNewsPermanent < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Vypadá to, že paladinové to tentokrát myslí vážně - dokonce odvolali i stráže z lodí.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Ještě že nám zase obnovuješ zásoby. Kdo ví, jestli příští týden bude naše město ještě stát.
		Matteo_TradeNewsPermanent = 2;
	};

	B_GiveTradeInv(self);
};


var int Matteo_LeatherBought;

instance DIA_Matteo_LEATHER(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 850;
	condition = DIA_Matteo_LEATHER_Condition;
	information = DIA_Matteo_LEATHER_Info;
	permanent = TRUE;
	description = "Koupit měšťanský oděv (250 zlatých)";
};

func int DIA_Matteo_LEATHER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_SellWhat) && (Matteo_LeatherBought == FALSE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Matteo_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Fajn, dej mi tu zbroj.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Bude se ti moc líbit. (ušklíbne se)
		B_GiveInvItems(self,other,ITAR_Vlk_M,1);
		Matteo_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Zbroj má svou cenu - a opravdu za to stojí. Takže se vrať, až dáš dohromady dost zlata.
	};
};


instance DIA_Matteo_Paladine(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Paladine_Condition;
	information = DIA_MAtteo_Paladine_Info;
	permanent = FALSE;
	description = "Co víš o paladinech?";
};


func int DIA_Matteo_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Paladine_Info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Co víš o paladinech?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//Od chvíle, kdy ti bastardi dorazili do města, neznám nic jiného než samé trampoty.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Posledně jsem mířil do horní čtvrti, ale stráže mi zastoupily cestu a chtěly vědět, co tam pohledávám!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//A?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Jasně, že mě pustili!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//Můj obchod ve městě stál ještě dřív, než ti nabubřelí hejhulové dřevěným mečem zapichovali podsvinčata!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//A včera sem ti bastardi jen tak mírnyx-týrnyx přišli a zabavili mi půlku zboží!
};


instance DIA_Matteo_Confiscated(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Confiscated_Condition;
	information = DIA_MAtteo_Confiscated_Info;
	permanent = FALSE;
	description = "Paladinové ti zabavili zboží?";
};


func int DIA_Matteo_Confiscated_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Confiscated_Info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Paladinové ti zabavili zboží?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Všechno, co jsem měl uskladněné vzadu na dvorku.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Prostě ke vchodu na dvůr postavili stráž.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//Mám kliku, že mi nesebrali úplně všechno - aspoň tu zbroj tu mohli nechat.
};


instance DIA_Matteo_HelpMeToOV(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeToOV_Condition;
	information = DIA_MAtteo_HelpMeToOV_Info;
	permanent = FALSE;
	description = "Pomůžeš mi proniknout do horní čtvrti?";
};


func int DIA_Matteo_HelpMeToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HelpMeToOV_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Pomůžeš mi proniknout do horní čtvrti?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(udiveně) Cože? Co TAM chceš dělat?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//Nesu nějakou důležitou zprávu...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//No, víš... Už ses pokoušel dostat přes stráže?
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(hořký smích) Chlape, zapomeň na to!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(usměje se) To je pro ty maníky TYPICKÉ!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Nechápu, proč bych to měl vůbec zkoušet.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Nejspíš máš pravdu.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Nevím, JAK důležitá ta tvoje zpráva je, a vlastně mi do toho ani nic není.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Ale i když jim řekneš, že v přístavu právě zakotvila loď plná skřetů, stejně tě pošlou pryč.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Protože mají své ROZKAZY.
};

func void B_Matteo_Preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Zdá se, že ti na tom opravdu záleží.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(potutelně) Otázka zní, JAK MOC ti na tom záleží.
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//O co ti jde?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Mohu ti pomoci - koneckonců tu patřím k nejvlivnějším lidem.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Ale nebude to zadarmo.
};


instance DIA_Matteo_HelpMeNow(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeNow_Condition;
	information = DIA_MAtteo_HelpMeNow_Info;
	permanent = FALSE;
	description = "Takže mi můžeš pomoci proniknout do horní čtvrti?";
};


func int DIA_Matteo_HelpMeNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeToOV) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HelpMeNow_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//Takže mi můžeš pomoci proniknout do horní čtvrti?
	B_Matteo_Preis();
};


instance DIA_Matteo_LehrlingLater(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_LehrlingLater_Condition;
	information = DIA_MAtteo_LehrlingLater_Info;
	permanent = FALSE;
	description = "Pomoz mi vstoupit do učení k některému z ostatních mistrů!";
};


func int DIA_Matteo_LehrlingLater_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_LehrlingLater_Info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Pomoz mi vstoupit do učení k některému z ostatních mistrů!
	B_Matteo_Preis();
};


instance DIA_Matteo_PriceOfHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_PriceOfHelp_Condition;
	information = DIA_MAtteo_PriceOfHelp_Info;
	permanent = FALSE;
	description = "Co za svou pomoc chceš?";
};


func int DIA_Matteo_PriceOfHelp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_PriceOfHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Co za svou pomoc chceš?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 zlatých.
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"To je zatraceně hodně...",DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"Ty chamtivče!",DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Klídek - nemyslím zrovna TVOJE zlato!
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//Ale?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//V zásadě jde o MOJE zlato.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Tesařova neteř Gritta mi totiž už celé věky nezaplatila, co mi dluží.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//A přitom se tu ten malý spratek producíruje každou chvíli v nových hadrech - to znamená, že peněz má dost.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//Rád bych to z ní vymlátil, ale mistr Thorben - tesař - tu má taky dost velký vliv.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Když mi dáš ty peníze, pomůžu ti.
	MIS_Matteo_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_Matteo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Matteo,LOG_Running);
	B_LogEntry(TOPIC_Matteo,"Gritta, neteř tesaře Thorbena, dluží Matteovi 100 zlatých. Když mu je vrátím, pomůže mi v cestě do horní čtvrti.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ty chamtivče!
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//To je zatraceně hodně...
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};


instance DIA_Matteo_WoGritta(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_WoGritta_Condition;
	information = DIA_MAtteo_WoGritta_Info;
	permanent = FALSE;
	description = "Kde bych tu Grittu našel?";
};


func int DIA_Matteo_WoGritta_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && (Gritta.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WoGritta_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Kde bych tu Grittu našel?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Jak jsem řekl, je to tesařova neteř. Jeho dům najdeš dole v ulici, poslední stavení napravo před kovárnou.
};


instance DIA_Matteo_GoldRunning(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 500;
	condition = DIA_Matteo_GoldRunning_Condition;
	information = DIA_MAtteo_GoldRunning_Info;
	permanent = TRUE;
	description = "Tady máš těch 100 zlatých!";
};

func int DIA_Matteo_GoldRunning_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_GoldRunning_Info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Tady máš těch 100 zlatých!

	if(Npc_IsDead(Gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//Na tom zlatě je Grittina krev! Já ti přece ani v nejmenším nenakázal, abys ji zabil!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//S tím nechci nic mít - a na naši úmluvu rovnou zapomeň! A už na mě víckrát nemluv!
		MIS_Matteo_Gold = LOG_FAILED;
		AI_StopProcessInfos(self);
		return;
	};
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Gritta_GoldGiven == TRUE)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//Tak co? Dělala ti nějaké problémy?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Nic, co by stálo za řeč.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Dobře! Svou část úmluvy jsi tedy dodržel.
		}
		else if(Gritta_WantPay == TRUE)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Ty to za ni chceš zaplatit? Hmm, dal bych spíš přednost tomu, kdybys to vymáčkl přímo z ní!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Ale - 100 zlatých je pořád 100 zlatých.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Svou část úmluvy jsi tím dodržel.
		};

		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Matteo_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//Počítání není zrovna tvoje silná stránka, co? Vždyť ty těch 100 zlatých nemáš.
	};
};


instance DIA_Matteo_Zustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_Zustimmung_Condition;
	information = DIA_MAtteo_Zustimmung_Info;
	permanent = TRUE;
	description = "Pomoz mi vstoupit do učení k některému z ostatních mistrů!";
};


var int DIA_Matteo_Zustimmung_perm;

func int DIA_Matteo_Zustimmung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && ((MIS_Matteo_Gold == LOG_Running) || (MIS_Matteo_Gold == LOG_SUCCESS)) && (Player_IsApprentice == APP_NONE) && (DIA_Matteo_Zustimmung_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Pomoz mi vstoupit do učení k některému z ostatních mistrů!
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Žádné strachy - já svou část dohody dodržím.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Ostatním mistrům budu o tobě vykládat jenom to nejlepší.
		B_GivePlayerXP(XP_Zustimmung);
		B_LogEntry(TOPIC_Lehrling,"Matteo bude souhlasit, budu-li chtít vstoupit do učení u někoho jiného.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Jedno po druhém. Nejdřív splň svou část dohody a přines mi zlato!
	};
};


instance DIA_Matteo_HowCanYouHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_HowCanYouHelp_Condition;
	information = DIA_MAtteo_HowCanYouHelp_Info;
	permanent = FALSE;
	description = "Co KONKRÉTNĚ pro mne můžeš udělat?";
};


func int DIA_Matteo_HowCanYouHelp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HowCanYouHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Co KONKRÉTNĚ pro mne můžeš udělat?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//To je jednoduché. Využiju svůj vliv a přesvědčím jednoho z místních řemeslníků, aby tě přijal jako učedníka.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//Tak se prakticky staneš měšťanem a budeš moci vstoupit i do horní čtvrti. A krom toho si i trochu přivyděláš.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Matteo mi může pomoci, aby mě některý z řemeslnických mistrů přijal do učení.");
};


instance DIA_Matteo_WoAlsLehrling(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_WoAlsLehrling_Condition;
	information = DIA_MAtteo_WoAlsLehrling_Info;
	permanent = FALSE;
	description = "Kde bych tedy mohl vstoupit do učení?";
};


func int DIA_Matteo_WoAlsLehrling_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WoAlsLehrling_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//Kde bych tedy mohl vstoupit do učení?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//Vlastně ke komukoliv z mistrů tady na hlavní ulici.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//Může to být kovář Harad, výrobce luků Bosper, tesař Thorben nebo alchymista Constantino.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Jeden z nich tě musí přijmout.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Ale důležité je, aby s tím souhlasili i ostatní mistři. Tak je to tady v Khorinisu zvykem.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Mohu vstoupit do učení k výrobci luků Bosperovi, kováři Haradovi, tesaři Thorbenovi, nebo k alchymistovi Constantinovi.");
	B_LogEntry(TOPIC_Lehrling,"Ještě než k někomu vstoupím do učení, musím získat svolení ostatních mistrů.");
};


instance DIA_Matteo_WieZustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_Matteo_WieZustimmung_Condition;
	information = DIA_MAtteo_WieZustimmung_Info;
	permanent = FALSE;
	description = "Jak získám souhlas ostatních mistrů?";
};


func int DIA_Matteo_WieZustimmung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo(other,DIA_Matteo_WarumNichtBeiDir)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WieZustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Jak získám souhlas ostatních mistrů?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Prostě je musíš nějak přesvědčit. Zastav se u nich a promluv si s nimi.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Ale jestli si proti sobě popudíš víc jak jednoho, nebudeš mít šanci! Tak se koukej chovat slušně!
	B_LogEntry(TOPIC_Lehrling,"Ostatní mistři mi dají své doporučení pouze za předpokladu, že jim dokážu svou cenu.");
};

instance DIA_Matteo_WarumNichtBeiDir(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_WarumNichtBeiDir_Condition;
	information = DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent = FALSE;
	description = "A proč mě do učení nepřijmeš TY?";
};


func int DIA_Matteo_WarumNichtBeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WarumNichtBeiDir_Info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//A proč mě do učení nepřijmeš TY?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//Rád bych - ale museli by s tím souhlasit i ostatní mistři.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Navíc jsem nedávno přijal jiného učedníka.
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_09_03");	//A co jsi ho naučil?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_04");	//Ve skutečnosti nic... Rupert je příliš chytrý na všechno.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_05");	//Takže stát u pultu - je ta najmenší věc, kterou jsem od něj mohl žádat.
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_09_06");	//No, pak se ale zdá, že to není tvůj učeň, ale jen pro tebe pracuje.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_07");	//Hmmm...(usmívá se), Nebudu říkat, že se mýlíš.
};

instance DIA_Matteo_OtherWay(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_OtherWay_Condition;
	information = DIA_MAtteo_OtherWay_Info;
	permanent = FALSE;
	description = "Existuje i jiný způsob, jak se dostat do horní čtvrti?";
};


func int DIA_Matteo_OtherWay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_OtherWay_Info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//Existuje i jiný způsob, jak se dostat do horní čtvrti?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Možná... jestli na něco přijdu, dám ti vědět.
};


instance DIA_Matteo_Minenanteil(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_Minenanteil_Condition;
	information = DIA_MAtteo_Minenanteil_Info;
	description = "Mezi tvým zbožím vidím i nějaké důlní akcie. Kdo ti je prodal?";
};


func int DIA_Matteo_Minenanteil_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Mezi tvým zbožím vidím i nějaké důlní akcie. Kdo ti je prodal?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(nervózně) Důlní akcie? Jejda, kde se tu vzaly? Nemám ponětí, jak jsem k nim přišel. Čestné slovo, na mou duši.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_MATTEO_SPECWINEDONE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = dia_matteo_specwinedone_condition;
	information = dia_matteo_specwinedone_info;
	permanent = FALSE;
	description = "Poslíček od paladina Ferninanda ještě nepřišel?";
};


func int dia_matteo_specwinedone_condition()
{
	if((MIS_FERDSPECWINE == LOG_Running) && (Npc_HasItems(hero,itfo_specwine) < 1))
	{
		return TRUE;
	};
};

func void dia_matteo_specwinedone_info()
{
	AI_Output(other,self,"DIA_MAtteo_SpecWineDone_01_00");	//Poslíček od paladina Ferninanda ještě nepřišel?
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_01");	//Od paladina Ferdinanda?... (Zamyšleně) Hmmm...
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_02");	//A jo! Vzpomněl jsem si - opravdu sem přišel nějaký chlápek.
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_03");	//Koupil si tu dvě láhve drahého vína a zase šel.
	AI_Output(other,self,"DIA_MAtteo_SpecWineDone_01_04");	//A kam šel, nevíš?!
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_05");	//Mmmm... (Vzpomíná) Myslím, že něco říkal o Lobartově farmě. Že se tam chce podívat.
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_06");	//Vydal se tam v noci. Na jeho místě bych byl opatrnější - kolem městských hradeb je spousta nebezpečných potvor.
	AI_Output(other,self,"DIA_MAtteo_SpecWineDone_01_08");	//Všechno jasné - díky.
	AI_StopProcessInfos(self);
};

instance DIA_Matteo_Jewerly(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Condition;
	information = DIA_MAtteo_Jewerly_Info;
	permanent = FALSE;
	description = "Co mě můžeš naučit?";
};

func int DIA_Matteo_Jewerly_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Matteo_WarumNichtBeiDir) == TRUE) || (Player_IsApprentice > APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_01_00");	//Kdybych se stal tvým učněm - co mě můžeš naučit?
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_01");	//No, pokud bys měl zájem... (neochotně) Býval jsem vynikající klenotník!
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_02");	//Většina z těch drahých tretek, které nosí tyto krůty z horní čtvrti - to vše je moje práce.
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_03");	//Není to tak dlouho, co nějací zloději ukradli moje nástroje. Bez nich nemohu pracovat.
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_04");	//Samozřejmě, nikdo jiný tě nenaučí toto umění.
};

instance DIA_Matteo_Jewerly_Form(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Form_Condition;
	information = DIA_MAtteo_Jewerly_Form_Info;
	permanent = FALSE;
	description = "Co přesně ti ukradli?";
};

func int DIA_Matteo_Jewerly_Form_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Matteo_Jewerly) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Form_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_01_00");	//Co přesně ti ukradli?
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_01");	//Eh...(zlostně) Nejcennější, co jsem měl - zlaté formy na výrobu prstenů a amuletů.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_02");	//Byli to velmi vzácné a drahé věci! Koupil jsem je od obchodníka, který připlul z pevniny.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_03");	//Takové už v Khorinisu nenajdeš.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_04");	//A bez nich jsem jako bez ruk. Takže jsem musel zkusit jinou možnost.
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_01_05");	//Chápu.
	MIS_JewerlyForm = LOG_Running;
	Log_CreateTopic(TOPIC_JewerlyForm,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JewerlyForm,LOG_Running);
	B_LogEntry(TOPIC_JewerlyForm,"Obchodník Matteo byl dříve klenotník, ale vzdal se tohoto povolání poté, co mu bylo ukradeno jeho nářadí. Nejvíc litoval zlaté formy na výrobu prstenů a amuletů.");
};

instance DIA_Matteo_Jewerly_Form_Done(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_Form_Done_Condition;
	information = DIA_MAtteo_Jewerly_Form_Done_Info;
	permanent = FALSE;
	description = "Toto je tvoje?";
};

func int DIA_Matteo_Jewerly_Form_Done_Condition()
{
	if((MIS_JewerlyForm == LOG_Running) && (Npc_HasItems(hero,ItMi_SteelForm) >= 1))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Form_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_Done_01_00");	//Toto je tvoje?
	B_GiveInvItems(other,self,ItMi_SteelForm,1);
	Npc_RemoveInvItems(self,ItMi_SteelForm,1);
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_01");	//Ó, Innosi! (Omráčený) Nevěřím! Kde jsi je vzal?
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_Done_01_02");	//Tam, kde zloději co tě okradli schovávají svůj lup.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_03");	//Bastardi! Doufám, že zaplatili za to, co udělali.
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_Done_01_04");	//To si piš!
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_05");	//Dobře, kámo. V každém případě jsem ti velmi vděčný za pomoc.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_06");	//Dobrá práce by měla být vždy dobře odměněna!
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_07");	//Takže si můžeš vybrat...
	MIS_JewerlyForm = LOG_Success;
	Log_SetTopicStatus(TOPIC_JewerlyForm,LOG_Success);
	B_LogEntry(TOPIC_JewerlyForm,"Vrátil jsem Matteovi jeho formy na šperky. Byl z toho nevýslovně šťastný.");
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Zlato se vždy hodí.",DIA_MAtteo_Jewerly_Form_Done_Gold);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Máš nějaký magický lektvar?",DIA_MAtteo_Jewerly_Form_Done_Potion);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Co tak dobrou zbraň.",DIA_MAtteo_Jewerly_Form_Done_Weapon);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Zbroj?",DIA_MAtteo_Jewerly_Form_Done_Armor);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Nauč mě umění klenotníka.",DIA_MAtteo_Jewerly_Form_Done_Teach);
};

func void DIA_MAtteo_Jewerly_Form_Done_Gold()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Gold_01_01");	//Vzal bych si zlato.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Gold_01_02");	//Samozřejmě zlato... (smích) To je vše, co potřebuješ!
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Gold_01_03");	//Tady je tři sta zlatých. To je téměř dvojnásobek toho, za co bys to prodal.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Potion()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_01");	//Máš nějaký magický lektvar?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_02");	//Samozřejmě...(usmíva se) Mám jen jeden takový.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_03");	//Velmi vzácný! Nechal jsem si ho výhradně pro své nejlepší zákazníky.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_04");	//Tady. Nyní je tvůj.
	B_GiveInvItems(self,other,ITPO_FALLDEFENCE,1);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Weapon()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Weapon_01_01");	//Co tak dobrou zbraň.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Weapon_01_02");	//O tom není pochyb... (věcný) Je důležité, mít po ruce spolehlivý meč nebo palcát. Zejména v dnešní době...
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Weapon_01_03");	//Tady, mám tu jeden. Jsem si jistý, že nebudeš zklamáný.
	B_GiveInvItems(self,other,ITMW_1H_MACE_107,1);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Armor()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_01");	//Co zbroj?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_02");	//Bohužel, nemám zbroj, které tě spolehlivě ochrání před skřety.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_03");	//Takže ti mohu dát jen tyto šaty.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_04");	//Ale je to lepší než nic. Ne?
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_05");	//No...
	B_GiveInvItems(self,other,ITAR_Vlk_M,1);
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_06");	//Doufám, že budou dobře sloužit.
	Matteo_LeatherBought = TRUE;
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Teach()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_01");	//Nauč mě umění klenotníka.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_02");	//(Překvapeně) Po pravdě, nečakal jsem, že si vybereš tohle.
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_03");	//Tak budeš ma učit?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_04");	//Dobře...(souhlasně) Koneckonců, dokázal si, že jsi slušný človek a můžu ti věřit!
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_05");	//Avšak musím tě varovat. Umění klenotníka je poměrně komplikovaná věc.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_06");	//Potřebuješ nějaké zkušenosti, abys pochopil základy této profese.
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_07");	//Chápu.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_08");	//Pro začátek tě naučím, jak vytvořit obyčejné ocelové prsteny.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_09");	//Když se s nimi naučíš zacházet, tak tě naučím ostatní!
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_10");	//Chápu.
	Matteo_TeachJewel = TRUE;
	Log_CreateTopic(TOPIC_TeachJewel,LOG_NOTE);
	B_LogEntry(TOPIC_TeachJewel,"Matteo mě může naučit, jak vyrábět šperky. Přirozeně k tomu budu potřebovat formu na výrobu šperků.");
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
	Wld_AssignRoomToGuild("matteo",GIL_NONE);
};

instance DIA_MAtteo_Jewerly_Teach_L1(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L1_condition;
	information = DIA_MAtteo_Jewerly_Teach_L1_info;
	permanent = TRUE;
	description = "Nauč mě vyrábět šperky (VB: 5)";
};

func int DIA_MAtteo_Jewerly_Teach_L1_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == FALSE) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L1_info()
{
	var int kosten;

	kosten = 5;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_00");	//Nauč mě vyrábět šperky.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_03_90");	//Nemáš dostatek zkušeností! Přijď později.
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_01");	//(Vážně) Tak. Je důležité si uvědomit, že tato činnost netoleruje spěch.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_02");	//První věc, kterou budeš potřebovat je kus oceli, abys vytvaroval samotný prsten.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_03");	//Dále budeš potřebovat drahokam. To je hlavní složka našeho řemesla.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_04");	//Je velmi těžké je najít! Ale bez nich nemáš absolutně nic.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_05");	//Kde je vezmu?
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_06");	//Obvykle je prodávají obchodníci, kteří připluli z Varantu nebo Myrtany. Ale stojí, jak víš, celé jmění!
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_07");	//Takže ne každý si může dovolit takovou drobnost.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_08");	//Co je ještě potřeba?
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_09");	//Je třeba síru, pryskyřici a kus uhlí. To všechno je třeba, abys drahokam pořádně vybrousil.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_10");	//Když máš všechny složky, jednoduše vezmeš formu pro odliv a při klenotnickém stolku roztavíš kov.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_11");	//Pak kolem drahokamu vytvaruješ lůžko... a to je všechno - tvůj prsten je hotov.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_12");	//To nezní příliš obtížně.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_13");	//Počkej...(vážně) To není všechno, co bys měl vědět.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_14");	//Je známo, že všechny drahokamy obsahují malé stopy magie, což umožňuje vytvářet prsteny s magickými vlastnostmi.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_15");	//Každý typ drahokamu dává objektu jiné zvláštní vlastnosti. To je snad jasné!
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_16");	//Samozřejmě, že obyčejná ocel není příliš vhodná pro vytvoření skutečně krásných a silných artefaktů.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_17");	//Třeba jednoduše cvičit. Zapamatoval jsis všechno?
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_18");	//Samozřejmě.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_19");	//Výborně! A ještě jedna věc...
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_20");	//Tato lekce je zadarmo, další už budeš muset zaplatit!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Naučeno: Výroba ocelových prstenů");
		JEWERLY_LEVEL_L1 = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TeachJewel,"Materiály pro výrobu OCELOVÝCH PRSTENŮ: železný ingot, síra, uhlí, pryskyřice a drahokam.");
	};
};

instance DIA_Matteo_Jewerly_GiveForm(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_GiveForm_Condition;
	information = DIA_Matteo_Jewerly_GiveForm_Info;
	permanent = FALSE;
	description = "A kde vezmu nějakou formu na výrobu prstenů?";
};

func int DIA_Matteo_Jewerly_GiveForm_Condition()
{
	if(JEWERLY_LEVEL_L1 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Matteo_Jewerly_GiveForm_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_GiveForm_01_00");	//A kde vezmu nějaku formu na výrobu prstenů?
	AI_Output(self,other,"DIA_Matteo_Jewerly_GiveForm_01_01");	//Tady, vem si. Já už ji nepotřebuju.
	B_GiveInvItems(self,other,ItMi_SteelForm,1);
	AI_Output(self,other,"DIA_Matteo_Jewerly_GiveForm_01_02");	//Ale nestrať ji!
	AI_Output(other,self,"DIA_Matteo_Jewerly_GiveForm_01_03");	//Samozřejmě.
};

instance DIA_Matteo_Jewerly_Table(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Table_Condition;
	information = DIA_Matteo_Jewerly_Table_Info;
	permanent = FALSE;
	description = "Kde mohu najít klenotnický stolek?";
};

func int DIA_Matteo_Jewerly_Table_Condition()
{
	if((JEWERLY_LEVEL_L1 == TRUE) && (FindJewelTable == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Jewerly_Table_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_Table_01_00");	//Kde mohu nájít klenotnický stolek?
	AI_Output(self,other,"DIA_Matteo_Jewerly_Table_01_01");	//Kde? (Se smíchem) Tam je! Stojí u okna...
	AI_Output(self,other,"DIA_Matteo_Jewerly_Table_01_02");	//Ale buď opatrný... takový se již nedá nikde sehnat!
	FindJewelTable = TRUE;
};

instance DIA_MAtteo_Jewerly_Teach_L2(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L2_condition;
	information = DIA_MAtteo_Jewerly_Teach_L2_info;
	permanent = TRUE;
	description = "Chci zlepšit své dovedonosti klenotníka. (VB: 10, cena: 1000 zlatých)";
};

func int DIA_MAtteo_Jewerly_Teach_L2_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == TRUE) && (Kapitel >= 4) && (JEWERLY_LEVEL_L2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L2_info()
{
	var int kosten;
	var int money;

	kosten = 10;
	money = 1000;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L2_01_00");	//Chci zlepšit své dovedonosti klenotníka.

	if(Kapitel >= 3)
	{
		if(hero.lp < kosten)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		}
		else if(Npc_HasItems(other,ItMi_Gold) < money)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_03_90");	//Nemáš dostatek zlata! Přijď později.
		}
		else
		{
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_01");	//Dobře. Myslím, že je čas tě naučit jak dělat šperky ze zlata.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_02");	//Vše, co potřebuješ je zlatý prut, dva kusy síry, 
		ya uhlí.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_03");	//Zbytek postupu se nijak neliší od výroby ocelových šperků.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_04");	//Chce to jen cvik...
			hero.lp = hero.lp - kosten;
			RankPoints = RankPoints + kosten;
			Npc_RemoveInvItems(other,ItMi_Gold,money);
			AI_Print("Naučeno: Výroba zlatých prstenů");
			JEWERLY_LEVEL_L2 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TeachJewel,"Materiály pro výrobu ZLATÝCH PRSTENŮ: zlatý ingot, 2x síra, 2x uhlí, 2x pryskyřice a drahokam.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_05");	//Na to ještě nejsi připraven! Promluvíme si o tom později.
	};
};

instance DIA_MAtteo_Jewerly_Teach_L3(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L3_condition;
	information = DIA_MAtteo_Jewerly_Teach_L3_info;
	permanent = TRUE;
	description = "Co se ještě mohu naučit o klenotnictví? (VB: 15, cena: 3000 zlatých)";
};

func int DIA_MAtteo_Jewerly_Teach_L3_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == TRUE) && (JEWERLY_LEVEL_L2 == TRUE) && (Kapitel >= 5) && (JEWERLY_LEVEL_L3 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L3_info()
{
	var int kosten;
	var int money;

	kosten = 15;
	money = 3000;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L3_01_00");	//Co se ještě mohu naučit o klenotnictví?

	if(Kapitel >= 4)
	{
		if(hero.lp < kosten)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		}
		else if(Npc_HasItems(other,ItMi_Gold) < money)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_03_90");	//Nemáš dostatek zlata! Přijď později.
		}
		else
		{
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_01");	//Pouze skutečně zkušení řemeslníci mohou vytvářet šperky z magické rudy.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_02");	//K tomu budeš potřebovat ingot magické rudy, tři kusy síry, pryskyřici a uhlí.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_03");	//Nespěchej. Zaměř se na broušení kamene a pokus se ho nepoškodit, když ho chceš vložit do rámu.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_04");	//Není to jednoduché, ale výsledek stojí za to.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_05");	//Teď jdi a zkus udělat nějaký prsten!
			hero.lp = hero.lp - kosten;
			RankPoints = RankPoints + kosten;
			Npc_RemoveInvItems(other,ItMi_Gold,money);
			AI_Print("Naučeno: Výroba prstenů z magické rudy");
			JEWERLY_LEVEL_L3 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TeachJewel,"Materiály pro výrobu PRSTENŮ Z MAGICKÉ RUDY: ingot magické rudy, 3x síra, 3x uhlí, 3x pryskyřice a drahokam.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_06");	//Na to ještě nejsi připraven! Promluvíme si o tom později.
	};
};

instance DIA_MAtteo_Jewerly_Teach_CanLAM(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_CanLAM_condition;
	information = DIA_MAtteo_Jewerly_Teach_CanLAM_info;
	permanent = FALSE;
	description = "Můžeš mě ještě něco naučit?";
};

func int DIA_MAtteo_Jewerly_Teach_CanLAM_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_CanLAM_info()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_CanLAM_01_00");	//Můžeš mě ještě něco naučit?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_CanLAM_01_01");	//Jediné co ještě nevíš je výroba amuletů.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_CanLAM_01_02");	//Mohu ti o tom říci, samozřejmě, pokud chceš.
};

instance DIA_MAtteo_Jewerly_Teach_LAM(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_LAM_condition;
	information = DIA_MAtteo_Jewerly_Teach_LAM_info;
	permanent = TRUE;
	description = "Nauč mě něco o výrobě amuletů. (VB: 20, cena: 5000 zlatých)";
};

func int DIA_MAtteo_Jewerly_Teach_LAM_condition()
{
	if((Npc_KnowsInfo(hero,DIA_MAtteo_Jewerly_Teach_CanLAM) == TRUE) && (Kapitel >= 5) && (JEWERLY_LEVEL_AMUL == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_LAM_info()
{
	var int kosten;
	var int money;

	kosten = 20;
	money = 5000;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_LAM_01_00");	//Nauč mě něco o výrobě amuletů.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_03_90");	//Nemáš dostatek zlata! Přijď později.
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_01");	//Tak tedy pozorně poslouchej. Vytvoření těchto ozdob vyžaduje skutečné umění...
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_02");	//Ani zkušení řemeslníci to někdy nedokážou.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_03");	//Tento proces je poměrně jednoduchý, ale vyžaduje tvou maximální pozornost.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_04");	//Soket na amulet je velmi křehký, takže stačí jeden špatný pohyb - a budeš muset začít znovu!
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_05");	//Vezmeš ingot rudy, roztavíš ho a naleješ do formy se spojovacím materiálem. Vlož drahokam a je to.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_06");	//To je v podstatě všechno. Měl bys zkusit udělat alespoň jeden amulet.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_07");	//Pak ti proces výroby bude jasnější...
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Výroba amuletů z magické rudy");
		JEWERLY_LEVEL_AMUL = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TeachJewel,"Materiály pro výrobu AMULETŮ Z MAGICKÉ RUDY: ingot magické rudy, 2x síra, 2x uhlí, 2x pryskyřice a drahokam.");
	};
};

instance DIA_Matteo_Jewerly_LoaNeacle(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacle_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacle_Info;
	permanent = FALSE;
	description = "Můžeš mi udělat šperk?";
};

func int DIA_Matteo_Jewerly_LoaNeacle_Condition()
{
	if((MIS_JewerlyForm == LOG_Success) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacle_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_00");	//Můžeš mi udělat šperk?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_01");	//Hmm... A co by to mělo být?
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_02");	//Potřebuji náhrdelník z černých perel.
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_03");	//Aha, samozřejmě. Rozhodl ses zapůsobit na nějakou mladou pannu? A dále?
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_04");	//Ne tak docela... Takže můžeš mi ho udělat?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_05");	//Samozřejmě, žádný problém. Ale jak víš, potřebuji materiál.
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_06");	//Co potřebuješ?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_07");	//Pět černých perel a zlatý prut pro očka na řetízku. Pokud mi je doneseš, budeš mít náhrdelník.
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_08");	//Kolik za to chceš?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_09");	//Zapomeň na to! Nebudu si od tebe brát peníze. Přijmi to jako můj dík za pomoc.
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_10");	//Dobře, výborně.
	B_LogEntry(TOPIC_LoaRomance,"Matteo by mi mohl udělat perlový náhrdelník, ale potřebuje pět černých perel a zlatý prut.");
};

instance DIA_Matteo_Jewerly_LoaNeacleDo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacleDo_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacleDo_Info;
	permanent = FALSE;
	description = "Přinesl jsem všechno, cos žádal.";
};

func int DIA_Matteo_Jewerly_LoaNeacleDo_Condition()
{
	if((Npc_KnowsInfo(other,DIA_MAtteo_Jewerly_LoaNeacle) == TRUE) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (Npc_HasItems(hero,ItMi_StuckGold) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacleDo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacleDo_01_00");	//Přinesl jsem všechno, cos žádal.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacleDo_01_01");	//Uvidíme... Vypadá, že je toho dost.
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacleDo_01_02");	//Začnu pracovat okamžite. Myslím, že zítra ráno budu hotový.
	B_LogEntry(TOPIC_LoaRomance,"Přinesl jsem Matteovi potřebný materiál pro výrobu náhrdelníku. Zítra si ho mohu vyzdvihnout.");
	MakeDarkPearleNeackle = Wld_GetDay();
};

instance DIA_Matteo_Jewerly_LoaNeacleDone(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacleDone_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacleDone_Info;
	permanent = FALSE;
	description = "Je náhrdelník hotový?";
};

func int DIA_Matteo_Jewerly_LoaNeacleDone_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((Npc_KnowsInfo(other,DIA_MAtteo_Jewerly_LoaNeacleDo) == TRUE) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (MakeDarkPearleNeackle <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacleDone_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacleDone_01_00");	//Je náhrdelník hotový?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacleDone_01_01");	//Ano, je hotový... Ať se líbí.
	B_GiveInvItems(self,other,ItMi_BlackPearlNeckle,1);
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacleDone_01_02");	//Děkuji.
	B_LogEntry(TOPIC_LoaRomance,"Matteo mi vyrobil náhrdelník z černých perel. Myslím, že se bude Loi líbit.");
};
