
instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_PICKPOCKET(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 900;
	condition = DIA_Coragon_PICKPOCKET_Condition;
	information = DIA_Coragon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Coragon_PICKPOCKET_Condition()
{
	return C_Beklauen(40,45);
};

func void DIA_Coragon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,Dialog_Back,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = "Mohl bych dostat něco k pití?";
};

func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Můžu tu dostat něco k pití?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//Jestli máš zlato tak ti dokonce něco uvařím.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Hospodský Coragon prodává jídlo a pití.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};

instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};

func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Jak jdou obchody
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Ani mi nemluv. Lord Andre na náměstí čepuje pivo zadarmo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Až na ty zbohatlíky sem už nikdo nechodí.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//A co je s nimi?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(pobaveně) Někteří z nich opravdu dokážou pocuchat nervy.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Vem si například Valentina - nemůžu ho ani vidět.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Ale zákazníky si nevyberu a každý zlaťák je dobrý.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//To málo co jsem si našetřil mi ukradli spolu s mým stříbrem.
};

instance DIA_Coragon_FixBeer(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_FixBeer_Condition;
	information = DIA_Coragon_FixBeer_Info;
	permanent = FALSE;
	description = "Možná bych mohl nějak přilákat návštěvníky?";
};

func int DIA_Coragon_FixBeer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Coragon_FixBeer_Info()
{
	AI_Output(other,self,"DIA_Coragon_FixBeer_01_00");	//Možná bych mohl nějak přilákat návštěvníky?
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_01");	//Jak? Jak bys je přivedl sem?
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_02");	//Hospodský nalévá pivo zdarma. Neustále.
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_03");	//Potom všem přece nejsou kompletní idioti aby platili.
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_04");	//Tak, můžeš něco zkusit. U Beliara nežertuješ?
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_05");	//Pokud se zvýší počet návštěvníků mé hospody, jsem připraven vyklopit tři...
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_06");	//... (zamyšleně) Ne! Dva sudy piva.
	AI_Output(other,self,"DIA_Coragon_FixBeer_01_07");	//Souhlasím! Pak už můžete začít připravovat svoje pivo.
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_08");	//Ty... (zamyšleně) Ach, šílený...
	MIS_CoragonFixBeer = LOG_Running;
	Log_CreateTopic(TOPIC_CoragonFixBeer,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CoragonFixBeer,LOG_Running);
	B_LogEntry(TOPIC_CoragonFixBeer,"Coragon si stěžuje že v poslední době ve svý hospodě má málo návštěvníků. Je to způsobeno tím, že na náměstí hospodský prodává všechny piva zdarma. Budu pomáhat hospodskýmu k vyřešení tohoto problému. Za to je připraven mi dát dva sudy vynikajícího piva!");
	AI_StopProcessInfos(self);
};

instance DIA_Coragon_FixBeer_Done(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_FixBeer_Done_Condition;
	information = DIA_Coragon_FixBeer_Done_Info;
	permanent = FALSE;
	description = "Jak se máte?";
};

func int DIA_Coragon_FixBeer_Done_Condition()
{
	if((MIS_CoragonFixBeer == LOG_Running) && (CoragonGuestBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_FixBeer_Done_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_00");	//Jak se máte?
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_01");	//(překvapen) A jak jsi to udělal?
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_02");	//Co?
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_03");	//Má hospoda je přeplněná samými návštěvníky!
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_04");	//Je pravda, že jsem zjistil že hospodský má nyní problémy s domobranou. A nikdo tam nechodí!
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_05");	//A do čeho se to namočil ten starý pytel kostí?
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_06");	//Neřeš. Nebavme se o ztrátách.
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_07");	//Ok. (povzdech) musím přiznat, že i já jsem ztratil! A jak bylo slíbeno, dlužím dva sudy piva.
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_08");	//Nepotřebuji je. Radši je vem panu Martinovi do přístavu.
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_09");	//Myslím že na ně čeká.
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_10");	//No, jak myslíš. (sarkasticky) Prohnanej kojote!
	MIS_CoragonFixBeer = LOG_Success;
	Log_SetTopicStatus(TOPIC_CoragonFixBeer,LOG_Success);
	B_LogEntry(TOPIC_CoragonFixBeer,"Coragon byl překvapen, že jeho hospoda je nyní plná návštěvníků, musel mi dát dva sudy piva které jsem namířil Martinovi do skladů.");
};

instance DIA_Addon_Coragon_MissingPeople(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Addon_Coragon_MissingPeople_Condition;
	information = DIA_Addon_Coragon_MissingPeople_Info;
	description = "Nevíš něco o těch pohřešovaných?";
};

func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Nevíš něco o těch pohřešovaných?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Slyšel jsem, že hodně z těch co zmizeli pochází z doků. Abych řekl pravdu, ani mě to nepřekvapuje.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Dokonce Thorbenův učedník prý zmizel.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//A Hakon, prodejce zbraní, by ti mohl říct zajímavou historku.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//Řekl mi, že každý den výdával jednoho maníka a najednou prý prostě zmizel. Dokonce šel za domobranou kvůli tomu.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Spousta občanů potom propadlo panice. Nevím co si o tom myslet, ale zdá se mi to jako nesmysl.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Khorinis je tvrdé město a za jeho branami číhá nebezpečí.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Když nezůstaneš za jeho branami, tak můžeš být celkem jistý, že tě přepadnou Banditi, nebo že tě sežere nějaká bestie.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Hakon a Thorben pravděpodobně ví něco o těch zmizeních.");
};

instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "Někdo tě okradl?";
};

func int DIA_Coragon_Bestohlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Někdo tě okradl?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Jo, před pár dny mi nějaký grázl vybrakoval truhlu. Ten večer bylo celkem narváno a obsluhoval jsem.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//Nebyl jsem u baru jen chviličku - ale ta mu stačila.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//Šel jsem kvůli tomu za domobranou - samozřejmě nic neviděli. Měli moc práce s chlastáním piva zadarmo.
	MIS_Coragon_Silber = LOG_Running;
	Log_CreateTopic(TOPIC_Coragon_Silber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Coragon_Silber,LOG_Running);
	B_LogEntry(TOPIC_Coragon_Silber,"Coragon byl okraden o všechno stříbro.");
};

var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Tady máš odměnu.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);

	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//Je to SPECIÁLNÍ pivo. Mám poslední soudek.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//Tohle je poslední doušek.
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = "Přinesl jsem tvoje stříbro.";
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Mám pro tebe dárek - tvé stříbro.

	if(B_GiveInvItems(other,self,ItMi_CoragonsSilber,8))
	{
		Npc_RemoveInvItems(self,ItMi_CoragonsSilber,8);
	};

	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Vskutku!
	B_GivePlayerXP(XP_CoragonsSilber);
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Coragon_Silber,LOG_SUCCESS);
	B_LogEntry(TOPIC_Coragon_Silber,"Vrátil jsem se Coragonovy jeho stříbro.");
};


instance DIA_Coragon_Schuldenbuch(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Hele, co tady mám...";
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Hele, co tady mám...
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Hmm? (překvapeně) To mě podrž, to je Lehmarova kniha dluhopisů.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Co s tím hodláš udělat?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "Vem si ji.";
};


func int DIA_Coragon_GiveBook_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (Npc_KnowsInfo(hero,DIA_Coragon_Schuldenbuch) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Vem si ji.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Dík, zachránils můj zadek. Lehmar umí být svině.
	B_Coragon_Bier();
};

instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = "Co musím udělat, abych se dostal do horní čtvrti?";
};

func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//Co musím udělat, abych se dostal do horní čtvrti?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Potřebuješ být právoplatný občan. Sežeň si práci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Nejlépe u nějakého z řemeslníků v dolní čtvrti. To by z tebe udělalo občana.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//No a jestli to nebude stačit, zajdi za lordem Andre do kasáren.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Možná by tě vzal k domobraně, ti tam taky můžou.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = "Co je s tím Valentinem?";
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//Co je s tím Valentinem?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Je zazobaný, takže nemusí makat. A samozřejmě to každému vméta do obličeje.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Ať už to chceš nebo nechceš slyšet.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Hodně pije a odchází až nad ránem. Pak se pomalu valí zpět do horní čtvrti.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//Je to tak každý den.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if(Regis_Ring == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino mi včera večer nemohl zaplatit.
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Kecal něco o tom, že ho okradli a že mi zaplatí příště... Fakt!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//Hlavně, že předtím se vytahoval jak má namaštěný kapsy.
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//Pak si je zkontroloval a zatvářil srandovně se zatvářil. řekl, že byl okraden...
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//A cos udělal?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//No vykopl jsem ho, co asi?
	VALENTINOSHIT = TRUE;
};


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "Tady - vem si tenhle prsten.";
};


func int DIA_Coragon_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_News) && (Npc_HasItems(other,ItRi_ValentinosRing) > 0))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Tady - vem si tenhle prsten.
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	Npc_RemoveInvItems(self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Co? Nerozumím...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Patříval Valentinovi.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Dej ho někomu, kdo mu zase napráská.
	B_GivePlayerXP(300);
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_TRADERING(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_tradering_condition;
	information = dia_coragon_tradering_info;
	permanent = FALSE;
	description = "Něco zajímavého?";
};


func int dia_coragon_tradering_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONCARAGON == TRUE))
	{
		return TRUE;
	};
};

func void dia_coragon_tradering_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Coragon_TradeRing_01_01");	//Něco zajímavého?
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_02");	//(naštvaně) To teda jo!
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_03");	//Poslední dobou mi lidi místo zlata chtějí za jídlo vnutit nějaké haraburdí.
	AI_Output(other,self,"DIA_Coragon_TradeRing_01_04");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_05");	//Například minule mi nějaký chlap dal prsten místo zlata.
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_07");	//Přesně tak! Říkal, že kromě toho momentálně nic nemá.
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_09");	//(naštvaně) Hádej! Vzal jsem to, přece ho nenechám odejít uplně bez placení.
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_10");	//(sakracticky) No ale musím říct, že vypadá velice cenně.
	AI_Output(other,self,"DIA_Coragon_TradeRing_01_13");	//Hm... A kdo to byl?
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_14");	//Myslím, že se jmenuje Joe - vypadal jako z doků. Nejsem si ale jistý.
	CORAGONTELLJO = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Chlápek jménem Joe se snažil u Coragona zaplatit prstenem místo zlata. Pravděpodobně je to ten stejný prsten, který byl ukraden Hakonovi. Musím si promluvit s tímhle Joem a zjistit, kde vzal ten prsten.");
};


instance DIA_CORAGON_TRADERINGME(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_traderingme_condition;
	information = dia_coragon_traderingme_info;
	permanent = FALSE;
	description = "Máš ještě ten prsten?";
};


func int dia_coragon_traderingme_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && Npc_KnowsInfo(hero,dia_coragon_tradering))
	{
		return TRUE;
	};
};

func void dia_coragon_traderingme_info()
{
	AI_Output(other,self,"DIA_Coragon_TradeRingMe_01_01");	//Máš ještě ten prsten?
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_02");	//Ovšem! Kde by byl?
	AI_Output(other,self,"DIA_Coragon_TradeRingMe_01_03");	//A prodal bys mi ho?
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_04");	//Prodat ti ho? Hmmm... (zamyšleně) Ano, nevidím důvod proč ne.
	AI_Output(other,self,"DIA_Coragon_TradeRingMe_01_06");	//A kolik bys za něj chtěl?
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_09");	//Sto zlatých!
};


instance DIA_CORAGON_TRADERINGMEDONE(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_traderingmedone_condition;
	information = dia_coragon_traderingmedone_info;
	permanent = TRUE;
	description = "Prodej mi ten prsten.";
};


func int dia_coragon_traderingmedone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && Npc_KnowsInfo(hero,dia_coragon_traderingme) && (CORAGONSELLRINGDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_coragon_traderingmedone_info()
{
	AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_00");	//Prodej mi ten prsten.
	AI_Output(self,other,"DIA_Coragon_TradeRingMeDone_01_01");	//(nedůvěřivě) Máš sto zlatých?
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		B_GivePlayerXP(100);
		Npc_RemoveInvItems(other,ItMi_Gold,100);
		AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_02");	//Tady.
		AI_Output(self,other,"DIA_Coragon_TradeRingMeDone_01_03");	//Dobře, nech si teda ten prsten.
		B_GiveInvItems(self,other,itri_hakonmissring,1);
		CORAGONSELLRINGDONE = TRUE;
		B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Coragon mi prodal prsten od Joea. Zdá se, že je to opravdu ten Hakonův.");
	}
	else
	{
		AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_04");	//Zrovna je u sebe nemám.
		AI_Output(self,other,"DIA_Coragon_TradeRingMeDone_01_05");	//Tak se vrať, až budeš.
	};
};


instance DIA_CORAGON_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = dia_coragon_aboutkillignaz_condition;
	information = dia_coragon_aboutkillignaz_info;
	permanent = FALSE;
	description = "Slyšel jsi něco o Ignazově vraždě?";
};


func int dia_coragon_aboutkillignaz_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_coragon_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Coragon_AboutKillIgnaz_01_00");	//Slyšel jsi něco o Ignazově vraždě?
	AI_Output(self,other,"DIA_Coragon_AboutKillIgnaz_01_01");	//(vážně) Ne, obvykle se snažím se do takových věcí nemotat.
	AI_Output(self,other,"DIA_Coragon_AboutKillIgnaz_01_04");	//Hodně lidí tady mluví, nemůžu všem naslouchat.
	B_LogEntry(TOPIC_KILLIGNAZ,"Hospodský Coragon říkal, že takové věci neposlouchá. Nezdá se mi, že by o Ignazově vraždě něco věděl.");
	ASKKILLSECOND = TRUE;
};

instance DIA_Coragon_LoaParty(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_Condition;
	information = DIA_Coragon_LoaParty_Info;
	permanent = FALSE;
	description = "Potřebuji dobré jídlo!";
};

func int DIA_Coragon_LoaParty_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_Info()
{
	AI_Output(other,self,"DIA_Coragon_LoaParty_01_01");	//Potřebuji dobré jídlo!
	AI_Output(other,self,"DIA_Coragon_LoaParty_01_02");	//Ale ne to, čím krmíš své pravidelné návštěvníky, opravdu dobré - chutné a čerstvé.
	AI_Output(self,other,"DIA_Coragon_LoaParty_01_03");	//Ha, och, ty! Moje jídlo ti nešmakuje. Víte, dobré jídlo stojí královské výkupné.
	AI_Output(other,self,"DIA_Coragon_LoaParty_01_04");	//Finančně se nemusíte obávat, zvládl byste něco takového?
	AI_Output(self,other,"DIA_Coragon_LoaParty_01_05");	//Hmmm... mohu samozřejmě. Ale to vás bude stát nejméně tisíc zlatých.
	B_LogEntry(TOPIC_LoaSecret,"Coragon je schopný sehnat slušné jídlo ale za cenu tísíce zlatých.");
};

instance DIA_Coragon_LoaParty_Done(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_Done_Condition;
	information = DIA_Coragon_LoaParty_Done_Info;
	permanent = FALSE;
	description = "Zde je tisíc!";
};

func int DIA_Coragon_LoaParty_Done_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Coragon_LoaParty) == TRUE) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Coragon_LoaParty_Done_01_01");	//Zde je tisíc!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Coragon_LoaParty_Done_01_02");	//Vynikající! Podívejte se na mě zítra. Myslím, že budu mít něco co se vám zlíbí.
	B_LogEntry(TOPIC_LoaSecret,"Dal jsem Coragonovi peníze předem, zítra se mám u něho stavit.");
	CoragonDayParty = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Coragon_LoaParty_GiveFood(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_GiveFood_Condition;
	information = DIA_Coragon_LoaParty_GiveFood_Info;
	permanent = FALSE;
	description = "Jak je to s objednávkou?";
};

func int DIA_Coragon_LoaParty_GiveFood_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Coragon_LoaParty_Done) == TRUE) && (CoragonDayParty < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_GiveFood_Info()
{
	AI_Output(other,self,"DIA_Coragon_LoaParty_GiveFood_01_01");	//Jak je to s objednávkou?
	AI_Output(self,other,"DIA_Coragon_LoaParty_GiveFood_01_02");	//Vše je připraveno!
	AI_Output(other,self,"DIA_Coragon_LoaParty_GiveFood_01_03");	//Je čerstvé?!
	AI_Output(self,other,"DIA_Coragon_LoaParty_GiveFood_01_04");	//Lepší jídlo v Khorinisu nenajdete. Věřte mi!
	AI_Output(other,self,"DIA_Coragon_LoaParty_GiveFood_01_05");	//Ok, jistě.
	B_GiveInvItems(self,other,ItMi_LoaPartyFood,1);
	B_LogEntry(TOPIC_LoaSecret,"Dostal jsem vynikající a čerstvé jídlo na piknik.");
	LoaPartyFood = TRUE;

	if((LoaPartyWine == TRUE) && (LoaPartyFood == TRUE))
	{
		B_LogEntry(TOPIC_LoaSecret,"Nyní se můžu vrátit za tou ženskou a říct jí to tak, jak se krásným dámám sluší a patří.");
	};

	AI_StopProcessInfos(self);
};