var int HalvorInPrision;

instance DIA_Halvor_EXIT(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 999;
	condition = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Halvor_PICKPOCKET(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 900;
	condition = DIA_Halvor_PICKPOCKET_Condition;
	information = DIA_Halvor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Halvor_PICKPOCKET_Condition()
{
	return C_Beklauen(78,150);
};

func void DIA_Halvor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,Dialog_Back,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};


instance DIA_Halvor_Hallo(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hallo_Condition;
	information = DIA_Halvor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Halvor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hej, nepotřebuješ nějaké ryby? Vyber si tady, čerstvé, přímo z mořských hlubin!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Halvor prodává v přístavu ryby.");
};


instance DIA_Halvor_TRADE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_TRADE_Condition;
	information = DIA_Halvor_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své ryby.";
};

func int DIA_Halvor_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Halvor_Hallo) && Wld_IsTime(5,0,20,0) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Ukaž mi své ryby.
	B_GiveTradeInv(self);
};


instance DIA_Halvor_Night(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Night_Condition;
	information = DIA_Halvor_Night_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Halvor_Night_Condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,ZS_Talk) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Night_Info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hej, jestli máš zájem o mé ryby, přijď do mého stánku zítra, dobrá?
};

instance DIA_Addon_Halvor_Job(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_Addon_Halvor_Job_Condition;
	information = DIA_Addon_Halvor_Job_Info;
	description = "Neměl bys pro mně nějakou práci?";
};

func int DIA_Addon_Halvor_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Halvor_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_Job_01_00");	//Neměl bys pro mně nějakou práci?
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_01");	//Ano, něco bych pro tebe asi měl. Právě bych potřeboval nějaké ústřice.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_02");	//Je to delikatesa, je o ně velký zájem.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_03");	//Takže pokud mi chceš pomoct, běž na pláž a sežeň mi zhruba tucet.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_04");	//Neslibuju ti za ně moc zlata. Ale můžeš si být jistý, že dlužníkem nezůstanu.
	AI_Output(other,self,"DIA_Addon_Halvor_Job_01_05");	//Souhlas.
	MIS_HalvorShells = LOG_Running;
	Log_CreateTopic(TOPIC_HalvorShells,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HalvorShells,LOG_Running);
	B_LogEntry(TOPIC_HalvorShells,"Halvor potřebuje ústřice. Poslal mně na pláž nazbírat deset kusů.");
};

instance DIA_Addon_Halvor_Job_Done(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_Addon_Halvor_Job_Done_Condition;
	information = DIA_Addon_Halvor_Job_Done_Info;
	description = "Tady jsou tvé ústřice.";
};

func int DIA_Addon_Halvor_Job_Done_Condition()
{
	if((MIS_HalvorShells == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Shellflesh) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_Job_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Halvor_Job_Done_01_00");	//Tady jsou tvé ústřice.
	B_GiveInvItems(other,self,ItFo_Addon_Shellflesh,10);
	Npc_RemoveInvItems(self,ItFo_Addon_Shellflesh,10);
	AI_Output(self,other,"DIA_Addon_Halvor_Job_Done_01_01");	//Dobře, za každou ti dám pět zlaťáků.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_Done_01_02");	//Celkově padesát zlatých. Doufám, že jsi šťastný.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(other,self,"DIA_Addon_Halvor_Job_Done_01_03");	//To jsem.
	MIS_HalvorShells = LOG_Success;
	Log_SetTopicStatus(TOPIC_HalvorShells,LOG_Success);
	B_LogEntry(TOPIC_HalvorShells,"Donesl jsem Halvorovi ústřice a dostal jsem za ně padesát zlatých.");
};

instance DIA_Addon_Halvor_MissingPeople(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 5;
	condition = DIA_Addon_Halvor_MissingPeople_Condition;
	information = DIA_Addon_Halvor_MissingPeople_Info;
	description = "Řekl bys mi něco o ztracených lidech, tedy pokud o tom něco víš?";
};

func int DIA_Addon_Halvor_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Řekl bys mi něco o ztracených lidech, tedy pokud o tom něco víš?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Ztracení lidé? Chlape, tohle je přístaviště. Jak asi víš, někdo se tu občas ztratí.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Moře se s nikým nepatlá. Je to tak, buď je nějakej ten útes nebo mořská obluda a hned je koho hledat.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Ale ztratil se také kapitán, který najímal posádku do velké lodi kotvící tady v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//A když už nebyli dobrovolníci vyplul, po chvíli se něco stalo a po lodi ani vidu ani slechu.
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,Dialog_Back,DIA_Addon_Halvor_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Jaká loď to byla?",DIA_Addon_Halvor_MissingPeople_schiff);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Víš něco o lidech, kteří zmizeli?",DIA_Addon_Halvor_MissingPeople_wer);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"A TY postrádáš někoho?",DIA_Addon_Halvor_MissingPeople_you);
};

func void DIA_Addon_Halvor_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
};

func void DIA_Addon_Halvor_MissingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Víš něco o lidech, kteří zmizeli?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Nic moc. Zkus se zeptat rybářů.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Halvorovi není moc do řeči, proto mě poslal k rybářům.");
};

func void DIA_Addon_Halvor_MissingPeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Jaká loď to byla?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Dobrá otázka. Dlouho tu žádné lodě nebyly.
};

func void DIA_Addon_Halvor_MissingPeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//A TY postrádáš někoho?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//Já? Ne.
};


instance DIA_Halvor_MESSAGE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_MESSAGE_Condition;
	information = DIA_Halvor_MESSAGE_Info;
	permanent = FALSE;
	description = "Mám dojem, že tenhle kousek papíru patří tobě.";
	trade = FALSE;
};


func int DIA_Halvor_MESSAGE_Condition()
{
	if(Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Halvor_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//Mám dojem, že tenhle kousek papíru patří tobě.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Co...? Ukaž, podívám se.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(potí se) Ehm... Dobrá, nikomu o tom ani muk - ehm... poslouchej. Musím se zbavit zboží, co jsem získal od banditů.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(uspěchaně) Ale není žádný důvod jít přímo za domobranou, jasný? Jsem si jistý, že se nějak dohodneme, co?
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Tak to mi udělej nabídku.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Vypadá to, že patříš do basy.",DIA_Halvor_MESSAGE_PRISON);
};

func void DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Tak to mi udělej nabídku.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Dobrá. Něco ti povím. Prodávám víc než jen ryby.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Když mi dáš ten směšný kousek papíru a, ehm... zapomeneš na tu věc, můžeme se stát obchodními partnery.
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Dobrá, ujednáno.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Vypadá to, že patříš do basy.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Vážně? Co by to tak mohlo být za zboží?",DIA_Halvor_MESSAGE_DEAL);
};

func void DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Vypadá to, že patříš do basy.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Ne, počkej, to nemůžeš udělat! Vždyť přece nejsem, vždyť víš... nic jinýho než malá ryba.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//To sis měl rozmyslet dřív. Teď mám v úmyslu tě nahlásit lordu Andremu.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Toho budeš litovat.
	Betrayal_Halvor = TRUE;
	HalvorInPrision = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Vážně? Co by to tak mohlo být za zboží?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Dobrá, můžu ti nabídnout docela zvláštní ryby, však víš. Ne jenom ty obyčejné, co se jedí.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//Máš na mysli takové, ve kterých jsou ukryté tvé tajné zprávy?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Jo, trefils. Mám pár takových... rybek.
};

func void DIA_Halvor_MESSAGE_Okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Dobrá, dohodnuto. Necháme si to malé tajemství pro sebe.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Díky. Zase se zastav, až budeš poblíž. Určitě pro tebe budu mít něco zajímavýho.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_GiveInvItems(other,self,ItWr_HalvorMessage,1);
	Npc_RemoveInvItems(self,ItWr_HalvorMessage,1);
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_Ringfisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	Info_ClearChoices(DIA_Halvor_MESSAGE);
};


instance DIA_Halvor_Zeichen(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent = FALSE;
	description = "(předvést zlodějský signál)";
};

func int DIA_Halvor_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//Vím. Nepřišel jsi jen nakupovat ryby.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(potichu) Udělám ti nabídku. Jestli máš nějaké stříbrné tácy nebo poháry, vezmu si je od tebe za dobrou cenu.
	CreateInvItems(self,ItKE_lockpick,20);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"Halvor nakupuje stříbrné talíře a kalichy za daleko lepší cenu než ostatní obchodníci.");
};


instance DIA_HALVOR_ZEICHEN_MURDER(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = dia_halvor_zeichen_murder_condition;
	information = dia_halvor_zeichen_murder_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_zeichen_murder_condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE) && (KILLTARGET3 == TRUE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_murder_info()
{
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_00");	//Od kdy ses zjevil, nějací vlivní lidé města byli zavraždeni.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_01");	//Tyhle vraždy velmi komplikují život poctivým zlodejům.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_02");	//A já podezřívám z těchto vražd tebe.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_03");	//Odmítám od tebe koupit tyhle věci! Zloději a vrazi nespolupracují.
	Betrayal_Halvor = TRUE;
	B_LogEntry(Topic_Diebesgilde,"Halvor si je vědom mé účasti na vraždách nevinných občanú a odmítá se mnou obchodovat.");
};


instance DIA_Halvor_Hehlerei(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent = TRUE;
	description = "(prodat staré talíře a kalichy)";
};

func int DIA_Halvor_Hehlerei_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Halvor_Zeichen) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0;

	if(Halvor_Day != Wld_GetDay())
	{
		if((Npc_HasItems(other,ItMi_SilverPlate) >= 1) || (Npc_HasItems(other,ItMi_SilverCup) >= 1) || (Npc_HasItems(other,ItMi_SilverRing) >= 1) || (Npc_HasItems(other,ItMi_RingGold) >= 1) || (Npc_HasItems(other,ItMi_SilverChalice) >= 1) || (Npc_HasItems(other,ItMi_SilverCandleHolder) >= 1) || (Npc_HasItems(other,ItMi_SilverNecklace) >= 1) || (Npc_HasItems(other,ItMi_HolderGoldCandle) >= 1) || (Npc_HasItems(other,ItMi_NecklaceGold) >= 1) || (Npc_HasItems(other,ItMi_PlateGold) >= 1) || (Npc_HasItems(other,ItMi_CupGold) >= 1) || (Npc_HasItems(other,ItMi_ChaliceGold) >= 1) || (Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) >= 1))
		{
			Halvor_Score = (Npc_HasItems(other,ItMi_SilverPlate) * (Value_SilverPlate / 2)) + (Npc_HasItems(other,ItMi_SilverCup) * (Value_SilverCup / 2)) + (Npc_HasItems(other,ItMi_SilverRing) * (Value_SilverRing / 2)) + (Npc_HasItems(other,ItMi_RingGold) * (Value_GoldRing / 2)) + (Npc_HasItems(other,ItMi_SilverChalice) * (Value_SilverChalice / 2)) + (Npc_HasItems(other,ItMi_SilverCandleHolder) * (Value_SilverCandleHolder / 2)) + (Npc_HasItems(other,ItMi_SilverNecklace) * (Value_SilverNecklace / 2)) + (Npc_HasItems(other,ItMi_HolderGoldCandle) * (Value_GoldCandleHolder / 2)) + (Npc_HasItems(other,ItMi_NecklaceGold) * (Value_GoldNecklace / 2)) + (Npc_HasItems(other,ItMi_PlateGold) * (Value_GoldPlate / 2)) + (Npc_HasItems(other,ItMi_CupGold) * (Value_GoldCup / 2)) + (Npc_HasItems(other,ItMi_ChaliceGold) * (Value_GoldChalice / 2));
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//Za všechno co máš, ti dám...
			B_Say_Gold(self,other,Halvor_Score);
			concatText = "Halvor nabízí ";
			concatText = ConcatStrings(concatText,IntToString(Halvor_Score));
			concatText = ConcatStrings(concatText," zlatých...");
			AI_Print(concatText);
			Info_ClearChoices(DIA_Halvor_Hehlerei);
			Info_AddChoice(DIA_Halvor_Hehlerei,"Dobrá, prodáno.",DIA_Halvor_Hehlerei_Annehmen);
			Info_AddChoice(DIA_Halvor_Hehlerei,"Budu o tom přemýšlet.",DIA_Halvor_Hehlerei_Ablehnen);
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Vrať se, až budeš mít nějaké stříbrné podnosy nebo poháry.
			Info_ClearChoices(DIA_Halvor_Hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//Můžeš se toho stříbra zbavit zítra. Dneska je moc brzo.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Promiň, dneska už žádné obchody. Vrať se zítra, dobrá?
	};
};

func void DIA_Halvor_Hehlerei_Annehmen()
{
	var int amount;
	var string concatText;
	amount = Npc_HasItems(other,ItMi_SilverPlate) + Npc_HasItems(other,ItMi_SilverCup) + Npc_HasItems(other,ItMi_RingGold) + Npc_HasItems(other,ItMi_SilverRing) + Npc_HasItems(other,ItMi_SilverChalice) + Npc_HasItems(other,ItMi_SilverCandleHolder) + Npc_HasItems(other,ItMi_SilverNecklace) + Npc_HasItems(other,ItMi_HolderGoldCandle) + Npc_HasItems(other,ItMi_NecklaceGold) + Npc_HasItems(other,ItMi_PlateGold) + Npc_HasItems(other,ItMi_CupGold) + Npc_HasItems(other,ItMi_ChaliceGold) + Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD);
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_SilverCup,Npc_HasItems(other,ItMi_SilverCup));
	Npc_RemoveInvItems(other,ItMi_SilverPlate,Npc_HasItems(other,ItMi_SilverPlate));
	Npc_RemoveInvItems(other,ItMi_SilverRing,Npc_HasItems(other,ItMi_SilverRing));
	Npc_RemoveInvItems(other,ItMi_RingGold,Npc_HasItems(other,ItMi_RingGold));
	Npc_RemoveInvItems(other,ItMi_SilverChalice,Npc_HasItems(other,ItMi_SilverChalice));
	Npc_RemoveInvItems(other,ItMi_SilverCandleHolder,Npc_HasItems(other,ItMi_SilverCandleHolder));
	Npc_RemoveInvItems(other,ItMi_SilverNecklace,Npc_HasItems(other,ItMi_SilverNecklace));
	Npc_RemoveInvItems(other,ItMi_HolderGoldCandle,Npc_HasItems(other,ItMi_HolderGoldCandle));
	Npc_RemoveInvItems(other,ItMi_NecklaceGold,Npc_HasItems(other,ItMi_NecklaceGold));
	Npc_RemoveInvItems(other,ItMi_PlateGold,Npc_HasItems(other,ItMi_PlateGold));
	Npc_RemoveInvItems(other,ItMi_CupGold,Npc_HasItems(other,ItMi_CupGold));
	Npc_RemoveInvItems(other,ItMi_ChaliceGold,Npc_HasItems(other,ItMi_ChaliceGold));
	B_GiveInvItems(self,other,ItMi_Gold,Halvor_Score);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Dobrá, prodáno.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Udělali jsme dneska dobrej kšeft. Lepší to bude nejdřív zítra, jinak by někdo mohl dostat podezření, však víš.
	Halvor_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

func void DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

instance DIA_Halvor_Crew(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 51;
	condition = DIA_Halvor_Crew_Condition;
	information = DIA_Halvor_Crew_Info;
	permanent = FALSE;
	description = "Sháním posádku.";
};

func int DIA_Halvor_Crew_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Crew_Info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Sháním posádku.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//Ale jak se chceš odsud dostat?
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,"To je čistě moje věc.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice(DIA_Halvor_Crew,"Hodlám získat loď.",DIA_Halvor_Crew_StealShip);
};

func void DIA_Halvor_Crew_MyThing()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//To je čistě moje věc.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Jak je libo. To opravdu není moje věc.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Tak jdeš do toho?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice(DIA_Halvor_Crew,"Můžeš mi pomoct?",DIA_Halvor_Crew_HelpMe);
};

func void DIA_Halvor_Crew_StealShip()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Hodlám získat loď.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Jo, jasně. Jinak jseš zdravej? Paladinové s tebou udělaj krátkej proces, až na to přijdou.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Jak je libo - neriskuješ můj život.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Tak jdeš do toho?",DIA_Halvor_Crew_JoinMe);
	if(Npc_IsDead(Jack) == FALSE)
	{
		Info_AddChoice(DIA_Halvor_Crew,"Můžeš mi pomoct?",DIA_Halvor_Crew_HelpMe);
	};
};

func void DIA_Halvor_Crew_JoinMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Tak jdeš do toho?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Ne, mám dojem, že ne. Mám tady spoustu práce a upřímně, netoužím zrovna po tom, abych potkal otrokářskou galéru plnou skřetů.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Ale přeju ti hodně štěstí.
};

func void DIA_Halvor_Crew_HelpMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Můžeš mi pomoct?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//Já na tohle nejsem ten pravej člověk. Ale zajdi si promluvit s Jackem. Měl by se poflakovat někde tady po přístavu. On bude vědět nejlíp, co na tu plavbu budeš potřebovat.
};

func void DIA_Halvor_Crew_BACK()
{
	Info_ClearChoices(DIA_Halvor_Crew);
};

instance DIA_HALVOR_NEKRO_FEAR(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = dia_halvor_nekro_fear_condition;
	information = dia_halvor_nekro_fear_info;
	permanent = TRUE;
	description = "Víš, tak jsem přemýšlel, jak bys asi vypadal jako kostlivec?";
};

func int dia_halvor_nekro_fear_condition()
{
	if((Betrayal_Halvor == TRUE) && (hero.guild == GIL_KDM) && (HalvorInPrision == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_nekro_fear_info()
{
	Betrayal_Halvor = FALSE;
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_01");	//Víš, tak jsem přemýšlel, jak bys asi vypadal jako kostlivec?
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_02");	//Mě by se celkem hodil kostlivej sluha.
	AI_Output(self,other,"DIA_Halvor_NEKRO_FEAR_00_03");	//Co, zbláznil jsi se?!... (v panice) To nemůžeš udělat! ZAVOLÁM STRÁŽE!
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_04");	//Tak zavolej, až budeš mrzká zombie a přijdou paladinové, zbude z tebe jenom prach.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_05");	//Přemýšlej o tom!
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_06");	//Ale je tu i jiná možnost. Budeš ode mě skupovat odcizené věci, zlato a stříbro a já tě nechám být.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_07");	//Jak ses rozhodnul, Halvore?
	AI_Output(self,other,"DIA_Halvor_NEKRO_FEAR_00_08");	//Noo... (zaváhá) Dobře, řekněme, že jsme se dohodli.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_09");	//To je dobře.
	B_LogEntry(Topic_Diebesgilde,"Halvor měl smrtelný strach a souhlasil s pokračováním naší spolupráce. Asi se vyplatí být nekromantem a zaklínačem démonů...");
};

instance DIA_HALVOR_Betrayal_Down(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_HALVOR_Betrayal_Down_condition;
	information = DIA_HALVOR_Betrayal_Down_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_HALVOR_Betrayal_Down_condition()
{
	if((BEKILLMASTER == TRUE) && (HalvorInPrision == FALSE) && (Betrayal_Halvor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_HALVOR_Betrayal_Down_info()
{
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_01");	//Hej, kamaráde...
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_02");	//Říká se, že jsi poslal na onen svět samotného Asmala!
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_03");	//Dobrá práce, to ti povídám! Konečně se tady dá volně dýchat.
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_04");	//Proto také souhlasím s pokračováním našich obchodních vztahů.
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_05");	//No pokud víš, co tím myslím.
	AI_Output(other,self,"DIA_HALVOR_Betrayal_Down_00_06");	//Rozumím.
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_07");	//V pořádku... (usmívá se) Tak jestli něco, tak dej vědět!
	AI_Output(other,self,"DIA_HALVOR_Betrayal_Down_00_08");	//Samozřejmě.
	Betrayal_Halvor = FALSE;
	B_LogEntry(Topic_Diebesgilde,"Halvor byl potěšen, že jsem zabil Asmala! Nyní chce obnovit naše obchodní vztahy.");
};

instance DIA_Halvor_HauntedLH(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 3;
	condition = DIA_Halvor_HauntedLH_condition;
	information = DIA_Halvor_HauntedLH_info;
	permanent = FALSE;
	description = "Neznáš člověka jménem Stefan?";
};

func int DIA_Halvor_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Halvor_HauntedLH_01_01");	//Neznáš člověka jménem Stefan?
	AI_Output(self,other,"DIA_Halvor_HauntedLH_01_02");	//Nikdy jsem o něm neslyšel kamaráde.
	B_LogEntry(TOPIC_HauntedLighthouse,"Halvor neslyšel nic o muži jménem Stefan.");
};
