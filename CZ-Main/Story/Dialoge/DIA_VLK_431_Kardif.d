
instance DIA_Kardif_EXIT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kardif_EXIT_Condition()
{
  	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_EXIT_Info()
{
	Kardif_OneQuestion = FALSE;
	AI_StopProcessInfos(self);
};

instance DIA_Kardif_PICKPOCKET(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 900;
	condition = DIA_Kardif_PICKPOCKET_Condition;
	information = DIA_Kardif_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Kardif_PICKPOCKET_Condition()
{
	return C_Beklauen(55,85);
};

func void DIA_Kardif_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,Dialog_Back,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

var int KardifInf;

instance DIA_Kardif_Hi(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hi_Condition;
	information = DIA_Kardif_Hi_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};

func int DIA_Kardif_Hi_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Jestli chceš něco k pití, musíš si to objednat.

	if(KardifInf == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Kardif prodává nápoje v krčmě u přístavu.");
		KardifInf = TRUE;
	};
};


instance DIA_Kardif_Hallo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hallo_Condition;
	information = DIA_Kardif_Hallo_Info;
	permanent = FALSE;
	description = "Počítám, že tady zaslechneš spoustu věcí...";
};


func int DIA_Kardif_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi) && (Kardif_Deal == 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Počítám, že tady zaslechneš spoustu věcí...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//No a co je ti po tom?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Nové zprávy vždycky vítám s otevřenou náručí.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//A je stejně otevřená i tvoje peněženka?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Každá informace, kterou ti dám, tě bude stát 10 zlatých.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Kardif, hospodský v přístavní krčmě, prodává informace.");
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Nedám ti za informaci víc než 5 zlatých.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo,"Zapomeň na to - najdu si je jinde.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo,"No dobře, souhlasím.",DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hallo_Zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//No dobře, souhlasím.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Umíš dobře smlouvat. (usměje se) Jsem ti vždycky k službám.
	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Nedám ti za informaci víc než 5 zlatých.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Cože, 5 zlatých? Chceš mě ožebračit? (krátce se zamyslí) Tak to zaokrouhleme na 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Ne, takhle to nefunguje. Řekněme 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo,"Fajn, 7 zlatých zní rozumně.",DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Zapomeň na to - najdu si informace jinde.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//No dobrá, dobrá... slevím tedy na 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Fajn, 7 zlatých zní rozumně.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo,"Ne, ty tvé informace vlastně až tak nutně nepotřebuji.",DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hallo_Sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Fajn, 7 zlatých zní rozumně.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(zazubí se) To je moudré rozhodnutí. Takže až budeš něco potřebovat, klidně se mě zeptej.
	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Ne, ty tvé informace vlastně až tak nutně nepotřebuji.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hej, počkej... (povzdech) - dobrá, 5 zlatých, ale to je moje poslední nabídka!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"A proč jsi to neřekl hned?",DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//A proč jsi to neřekl hned?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Ále, prostě nejsem úplně fit. Ale ať je to jak chce, už jsme se dohodli.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Ne, takhle to nefunguje. Řekněme 6.
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ty jsi pěkný lump, víš to? No, když na tom trváš, tak řekněme 6 zlatých za každou informaci.
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};


instance DIA_Kardif_TRADE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TRADE_Condition;
	information = DIA_Kardif_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Rád bych si dal něco k pití.";
};

func int DIA_Kardif_TRADE_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	var int daynow;

	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Rád bych si dal něco k pití.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));

	if(KardifGiveLockPick < daynow)
	{
		CreateInvItems(self,ItKE_lockpick,5);
		KardifGiveLockPick = Wld_GetDay();
	};
};


instance DIA_Kardif_TradeInfo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TradeInfo_Condition;
	information = DIA_Kardif_TradeInfo_Info;
	permanent = TRUE;
	description = "Potřebuji informace.";
};


func int DIA_Kardif_TradeInfo_Condition()
{
	if((Kardif_OneQuestion == FALSE) && (Kardif_Deal > 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Potřebuji informace.
	Kardif_OneQuestion = TRUE;
};

func void B_SayKardifZuwenigGold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Vrať se, až budeš mít dost zlata.
};


instance DIA_Kardif_Buerger(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Buerger_Condition;
	information = DIA_Kardif_Buerger_Info;
	permanent = TRUE;
	description = "Kdo patří mezi nejvlivnější občany tohoto města?";
};


var int DIA_Kardif_Buerger_permanent;

func int DIA_Kardif_Buerger_Condition()
{
	if((DIA_Kardif_Buerger_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Buerger_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Kdo patří mezi nejvlivnější občany tohoto města?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Tady dole v přístavu nenajdeš nikoho. Jediný zdejší mocný muž je Lehmar.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Lichvář není zrovna populární, ale má zlato a pár jiných vlivných měšťanů mu dluží peníze.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Kupci a řemeslníci mají také dost velký vliv - až moc velký, řekl bych.
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lehmar(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Lehmar_Condition;
	information = DIA_Kardif_Lehmar_Info;
	permanent = TRUE;
	description = "Kdo všechno Lehmarovi něco dluží?";
};


var int DIA_Kardif_Lehmar_permanent;

func int DIA_Kardif_Lehmar_Condition()
{
	if((DIA_Kardif_Lehmar_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Buerger_permanent == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Kdo všechno Lehmarovi něco dluží?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(směje se) Jestli to chceš zjistit, měl bys nahlédnout do jeho účetní knihy.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Akorát určitě nebude snadné tam jen tak nepozorovaně nakouknout.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Pokud vím, vždycky ji nosí u sebe...
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Arbeit(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Arbeit_Condition;
	information = DIA_Kardif_Arbeit_Info;
	permanent = TRUE;
	description = "Kde bych mohl najít práci?";
};


var int DIA_Kardif_Arbeit_permanent;

func int DIA_Kardif_Arbeit_Condition()
{
	if((DIA_Kardif_Arbeit_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Kde bych mohl najít práci?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Tady v přístavu práci asi jen tak nenajdeš. Budeš muset zajít za řemeslníky v dolní čtvrti.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Ale jestli máš trochu slušný meč, můžeš zkusit vyzvat na souboj Alrika. Bije se za peníze - najdeš ho za skladištěm.
		DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Addon_Kardif_MissingPeople(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Addon_Kardif_MissingPeople_Condition;
	information = DIA_Addon_Kardif_MissingPeople_Info;
	permanent = TRUE;
	description = "Víš něco o hledaných měšťanech?";
};


var int DIA_Addon_Kardif_MissingPeople_permanent;

func int DIA_Addon_Kardif_MissingPeople_Condition()
{
	if((DIA_Addon_Kardif_MissingPeople_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Kardif_MissingPeople_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//Víš něco o hledaných měšťanech?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//Vím něco o těch, co zmizeli nedávno.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Byli to lidé tady odtud z přístavu. Měl by ses tu projít a poptat se ostatních.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//Někteří popisovali nějaké případy v dolní čtvrti.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//Víc by ti poradil asi Coragon.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//Má hospodu v dolní čtvti, bude-li mít čas. Určitě ti něco zajímavýho poví.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Ještě je tu taky rybář Halvor. Ten by také mohl něco vědět a řekl bych, že se s tebou o to rád podělí.
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Kardif si myslí, že hospodský Coragon nebo přístavní rybář Halvor by mohli o hledaných lidech vědět víc.");
		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lernen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Lernen_Condition;
	information = DIA_Kardif_Lernen_Info;
	permanent = TRUE;
	description = "Kdo mě tady může něco naučit?";
};


var int DIA_Kardif_Lernen_permanent;

func int DIA_Kardif_Lernen_Condition()
{
	if((DIA_Kardif_Lernen_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lernen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Kdo mě tady může něco naučit?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Tady v přístavišti najdeš pár schopných lidí.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Kovář Carl je pořádný silák. Vsadím se, že s jeho pomocí si můžeš zvýšit sílu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Alrik toho ví spoustu o boji a Lares je prohnaný lump. Někdy ho můžeš najít i tady v přístavu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//A jestli jsi dostatečně praštěný, zastav se u starého Ignaze - ví všechno o tuhlecté aleche... almich... o lektvarech.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Kde bych je všechny našel?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(mručí) Hochu, než bych ti to vysvětlil, tak by král vyhrál celou tuhle válku proti skřetům.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Prostě se porozhlédni po přístavní čtvrti a musíš je najít. A pokud to tu moc neznáš, stav se u Brahima a kup si od něj mapu.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//JEHO najdeš snadno. Má chýši hned vedle mé krčmy. (mručí) Za tohle bych si měl účtovat dvojnásobek.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Carl, kovář z přístavní čtvrti, mi může pomoci vylepšit sílu.");
		B_LogEntry_Quiet(TOPIC_CityTeacher,"Lares mi vylepší obratnost a sílu.");
		B_LogEntry_Quiet(TOPIC_CityTeacher,"Alrik mě vycvičí v boji s jednoručními zbraněmi. Potlouká se kdesi za skladištěm v přístavní čtvrti.");
		B_LogEntry_Quiet(TOPIC_CityTeacher,"Ignaz mi ukáže některé recepty na míchání lektvarů. Žije v přístavní čtvrti.");
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry_Quiet(TOPIC_CityTrader,"Brahim kreslí a prodává mapy. Bydlí poblíž přístavu.");
		DIA_Kardif_Lernen_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk_Condition;
	information = DIA_Kardif_Diebeswerk_Info;
	permanent = TRUE;
	description = "Můžu dostat třeba nějakou 'zvláštní' práci?";
};


var int DIA_Kardif_Diebeswerk_permanent;

func int DIA_Kardif_Diebeswerk_Condition()
{
	if((DIA_Kardif_Diebeswerk_permanent == FALSE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//Můžu dostat třeba nějakou 'zvláštní' práci?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Něco zvláštního říkáš? Hmmmm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//... tak si zkus promluvit s Nagurem, možná ti pomůže.
		DIA_Kardif_Diebeswerk_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk2(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk2_Condition;
	information = DIA_Kardif_Diebeswerk2_Info;
	permanent = TRUE;
	description = "Máš pro mě nějakou 'zvláštní' práci?";
};


var int DIA_Kardif_Diebeswerk2_permanent;

func int DIA_Kardif_Diebeswerk2_Condition()
{
	if((DIA_Kardif_Diebeswerk2_permanent == FALSE) && (DIA_Kardif_Diebeswerk_permanent == TRUE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Máš pro mě nějakou 'zvláštní' práci?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Něco pro tebe mám - ale to tě bude zajímat jenom tehdy, pokud jsi opravdu všestranný.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Co máš?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//No, Zuris, co prodává na tržišti lektvary, má zrovna u sebe hosta - mága Ohně Darona.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//A?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//Tesař Thorben mu zvlášť vyrobil novou truhlu.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//A ten Daron mu prý přinesl spoustu cenného zboží. Ale nic jsi ode mě neslyšel, rozumíš?
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Zurueck(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_Zurueck_Condition;
	information = DIA_Kardif_Zurueck_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int DIA_Kardif_Zurueck_Condition()
{
	if(Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zurueck_Info()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices(DIA_Kardif_Zurueck);
};


instance DIA_Kardif_DOPE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_DOPE_Condition;
	information = DIA_Kardif_DOPE_Info;
	permanent = TRUE;
	description = "Kde bych tu koupil nějakou trávu?";
};


var int DIA_Kardif_DOPE_perm;

func int DIA_Kardif_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_DOPE_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DOPE_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Kde bych tu koupil nějakou trávu?
	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Určitě ne tady - s takovými věcmi nechci nic mít.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Určitě ne tady.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//A kde tedy?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Být tebou, promluvím si s Meldorem - ten hulí od rána do večera.
		DIA_Kardif_DOPE_perm = TRUE;
	};
};


instance DIA_Kardif_Paket(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_Kardif_Paket_Condition;
	information = DIA_Kardif_Paket_Info;
	permanent = TRUE;
	description = "Co víš o balíku trávy z bažin?";
};


var int DIA_Kardif_Paket_perm;

func int DIA_Kardif_Paket_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Paket_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Paket_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Co víš o balíku trávy z bažin?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Ten, kdo takový balík vlastní, je boháč. A nejspíš taky těžký pohodář!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Nesnaž se mě oblbnout. Ty něco víš, tak to vyklop!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Nojo, nojo - takový chlápek ke mně onehdá přišel. Patřil k žoldákům.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Že prý v přístavu prodal balík trávy z bažin, ale samozřejmě byl totálně zhulený. Víc nevím.
		DIA_Kardif_Paket_perm = TRUE;
		B_LogEntry(TOPIC_Warehouse,"Kardif hovořil s žoldákem, který se snažil prodat balík trávy z bažin.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_SENDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_SENDATTILA_Condition;
	information = DIA_Kardif_SENDATTILA_Info;
	important = TRUE;
};


func int DIA_Kardif_SENDATTILA_Condition()
{
	if((MIS_ThiefGuild_sucked == TRUE) || ((Diebesgilde_Okay >= 3) && Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hej ty, pojď sem. Něco pro tebe mám.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Jeden chlápek tu s tebou chtěl mermomocí mluvit.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Když tě tu nezastihl, nechal tu pro tebe vzkaz.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Chce se s tebou sejít. Za Halvorovým obchodem s rybami.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Tahle informace je zadarmo - to je ale výjimka, hochu! Všecko ostatní tě zase bude něco stát.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Jak ten chlápek vypadal?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//To ti můžu říct, ale napřed za to musíš zaplatit, kámo. (zašklebí se)

	if(Kardif_Deal == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Každá informace, kterou ti dám, tě bude stát 10 zlatých.
		Kardif_Deal = 10;
	};

	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_Kardif_Kerl(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Kerl_Condition;
	information = DIA_Kardif_Kerl_Info;
	permanent = TRUE;
	description = "Jak ten chlápek vypadal?";
};


var int DIA_Kardif_Kerl_permanent;

func int DIA_Kardif_Kerl_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA) && (Attila.aivar[AIV_TalkedToPlayer] == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Jak ten chlápek vypadal?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//No, byl poměrně vysoký, silný a měl tmavou pleť - ale žádnou uniformu. Působil tak nějak... hrozivě.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//A jeho tvář?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Tvář? Když se na mě podíval, byl jsem rád, že si nepřišel pro mě.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//Z očí mu koukala děsná zloba - ale i tak bys za ním měl zajít. Určitě to bude zajímavé.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Ale otázkou je, pro koho.
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_DEFEATEDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_DEFEATEDATTILA_Condition;
	information = DIA_Kardif_DEFEATEDATTILA_Info;
	permanent = FALSE;
	description = "Ten bastard se mě snažil zabít!";
};


func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Hallo) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Ten bastard se mě snažil zabít!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hele, já za to přece nemůžu! Já ti jenom předal informaci!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Jestli ti někdo šlape na paty, pak k tomu má nejspíš své důvody.
	B_GivePlayerXP(XP_Kardif_Blame4Attila);
	B_KillNpc(Attila);
	Npc_RemoveInvItem(Attila,ItMi_OldCoin);
};


instance DIA_Kardif_Zeichen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent = FALSE;
	description = "(předvést zlodějský signál)";
};


func int DIA_Kardif_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Aha, ty ses zapletl s tím gangem. No dobře, v tom případě tu pro tebe něco mám.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(tiše) Když budeš potřebovat nějaké paklíče, přijď za mnou, pár jich tu ještě mám. A stačí, když si řekneš o něco k pití.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	CreateInvItems(self,ItKE_lockpick,20);
};


instance DIA_Kardif_Crew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 51;
	condition = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent = FALSE;
	description = "Ještě pořád potřebuji pár námořníků.";
};


func int DIA_Kardif_Crew_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Ještě pořád potřebuji pár námořníků.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Časy jsou zlé, příteli. V celém Khorinisu asi dost námořníků neseženeš - většina z nich z města odešla.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Ale když si najdeš dobrého kapitána, posádku seženeš celkem rychle - pár chytrých chlápků se tu vždycky najde.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Kde bych našel kapitána?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//To se ptáš toho nepravého, já jenom vedu tuhle krčmu.
	if(Npc_IsDead(Jack) == FALSE)
	{
		if(SCGotCaptain == FALSE)
		{
			Log_CreateTopic(Topic_Captain,LOG_MISSION);
			Log_SetTopicStatus(Topic_Captain,LOG_Running);
			B_LogEntry(Topic_Captain,"Kardif mě poslal ke starému Jackovi, který mi nejspíš může pomoci.");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Promluv si se starým Jackem. Bloumá tu po přístavu už hezky dlouho. Když přijde na námořnictví, je to tvůj muž.
	};
};


instance DIA_KARDIF_PERMJOB(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 4;
	condition = dia_kardif_permjob_condition;
	information = dia_kardif_permjob_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};


func int dia_kardif_permjob_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Kardif_Hi) && (Npc_IsDead(VLK_432_Moe) == FALSE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_permjob_info()
{
	AI_Output(other,self,"DIA_Kardif_PermJob_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_Kardif_PermJob_01_05");	//Opravdu by se mi teď hodil člověk na místo vyhazovače v mojí krčmě.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_06");	//Je to taková prašivá práce, ale jsem za to ochotný zaplatit spoustu peněz!
	AI_Output(self,other,"DIA_Kardif_PermJob_01_09");	//Gayvern žádné problémy nedělá, ale jsou tu i jiní.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_10");	//Jenže když se na tebe dívám... (zklamaně) stěží bych tě nazval drsňákem.
	AI_Output(other,self,"DIA_Kardif_PermJob_01_12");	//Co musím udělat, abych tě přesvědčil o opaku?
	AI_Output(self,other,"DIA_Kardif_PermJob_01_13");	//Hmmm... (zadumaně) Je to dobrá otázka! No, alespoň...
	AI_Output(self,other,"DIA_Kardif_PermJob_01_14");	//Řekni mi, viděl jsi toho chlápka který stojí u vchodu do mé krčmy?
	AI_Output(other,self,"DIA_Kardif_PermJob_01_15");	//Jo, myslíš Moea.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_18");	//Myslím, že jeho jméno je Moe, ano.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_19");	//Většina nemá peníze jak pro Moea, tak pro chlast.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_20");	//A to jaksi škodí pověsti mého podniku...
	MIS_MOEBORED = LOG_Running;
	Log_CreateTopic(TOPIC_MOEBORED,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MOEBORED,LOG_Running);
	if(MOEISBEATEN == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Kardif_PermJob_01_22");	//Tak jsem si s ním povyrazil! Ukázalo se, že je to slaboch.
		AI_Output(self,other,"DIA_Kardif_PermJob_01_25");	//Ha, ha... (smích) No, pokud ano, pak stačí jít a říct mu že jestli ho tu někdy uvidím - dostane ještě více!
		B_LogEntry(TOPIC_MOEBORED,"Slíbil jsem Kardifovi, že naučím Moea dobrým mravům.");
	}
	else
	{
		AI_Output(other,self,"DIA_Kardif_PermJob_01_30");	//Podívám se na tvůj problém.
		AI_Output(self,other,"DIA_Kardif_PermJob_01_31");	//Řekni mu že jestli ho tu někdy uvidím - dostane ještě více!
		AI_Output(self,other,"DIA_Kardif_PermJob_01_32");	//Pokud to zvládneš... (smích) V což doufám!
		B_LogEntry(TOPIC_MOEBORED,"Slíbil jsem Kardifovi, že vyženu Moea.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PERMJOBDONE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 1;
	condition = dia_kardif_permjobdone_condition;
	information = dia_kardif_permjobdone_info;
	permanent = FALSE;
	description = "Ohledně Moea...";
};


func int dia_kardif_permjobdone_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (Kardif_OneQuestion == FALSE) && ((MOEBEATME == TRUE) || (MOEISAWAYFROMTAVERNE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_kardif_permjobdone_info()
{
	AI_Output(other,self,"DIA_Kardif_PermJobDone_01_00");	//Ohledně Moea...

	if(MOEISAWAYFROMTAVERNE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_01");	//Ano? Něco nového?
		AI_Output(other,self,"DIA_Kardif_PermJobDone_01_02");	//Řekl jsem mu, že ho tu už nechceš.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_03");	//To... To jsou excelentní zprávy příteli!
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_07");	//Více, než jsem si myslel.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_10");	//Pro začátek si popovídejme o detailech. Kolik bys chtěl plat?
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_12");	//Deset zlatých na den.
		AI_Output(other,self,"DIA_Kardif_PermJobDone_01_15");	//Jasně!
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_16");	//Perfektní.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_18");	//Určitě nechceš celé dny sedět v krčmě, takže se tu prostě čas od času ukaž.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_19");	//A teď... Zde je tvůj denní podíl!
		B_GiveInvItems(self,other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_20");	//To je za vyřízení Moea.
		KARDIFPAYDAY = Wld_GetDay();
		MIS_MOEBORED = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MOEBORED,LOG_SUCCESS);
		B_LogEntry(TOPIC_MOEBORED,"Kardif mi dal práci. Platí deset zlatých na den. Prostě se mám sem tam zastavit u něj, jestli nejsou potíže a vybrat si plat...");
		AI_StopProcessInfos(self);
	}
	else if(MOEBEATME == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_24");	//Ano, ano... Pěkně tě dostal!
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_25");	//Ale s tím jsem měl počítat.
		MIS_MOEBORED = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_MOEBORED);
	};
};

instance DIA_KARDIF_PERMJOBPAY(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 100;
	condition = dia_kardif_permjobpay_condition;
	information = dia_kardif_permjobpay_info;
	permanent = TRUE;
	description = "Co můj plat?";
};

func int dia_kardif_permjobpay_condition()
{
	if((MIS_MOEBORED == LOG_SUCCESS) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_permjobpay_info()
{
	var int daynow;
	var int sumpay;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Kardif_PermJobPay_01_00");	//Co můj plat?

	if(KARDIFPAYDAY < daynow)
	{
		AI_Output(self,other,"DIA_Kardif_PermJobPay_01_01");	//Jasně příteli, tady je.
		sumpay = 10 * (daynow - KARDIFPAYDAY);
		B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		KARDIFPAYDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_PermJobPay_01_03");	//Ale dnes jsem ti již výplatu dal!... (udiveně)
	};
};


instance DIA_KARDIF_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = dia_kardif_aboutkillignaz_condition;
	information = dia_kardif_aboutkillignaz_info;
	permanent = FALSE;
	description = "Nevíš něco o Ignazově vraždě?";
};


func int dia_kardif_aboutkillignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kardif_AboutKillIgnaz_01_00");	//Nevíš něco o Ignazově vraždě?
	AI_Output(self,other,"DIA_Kardif_AboutKillIgnaz_01_01");	//Hmmm... Bojím se, že moc ne.
	AI_Output(self,other,"DIA_Kardif_AboutKillIgnaz_01_03");	//Vím jen tolik, co ostatní!
	B_LogEntry(TOPIC_KILLIGNAZ,"Kardif o tom nic neslyšel.");
	ASKKILLTHIRD = TRUE;
};

var int KardifBuyMeat;
var int KardifBuyMeatDay;

instance DIA_KARDIF_BUYMEAT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 15;
	condition = dia_kardif_buymeat_condition;
	information = dia_kardif_buymeat_info;
	permanent = FALSE;
	description = "Mohl bych něco zařídit?";
};

func int dia_kardif_buymeat_condition()
{
	if((MIS_MOEBORED == LOG_SUCCESS) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_buymeat_info()
{
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_00");	//Mohl bych něco zařídit?
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_01");	//No, pokud chceš vydělat trochu víc. Jdi na lov a přines mi nějaké syrové maso.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_02");	//A v poslední době jsem v krčmě měl hodně návštěvníků. Tady není masa nikdy dost!
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_03");	//Jak moc jich budete potřebovat?
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_04");	//(zamyšleně) Každý den asi dvacet kusů.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_05");	//Ale ne víc! Jinak je nemám kam uložit, a nakonec se to prostě zkazí.
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_06");	//Dobře. Co o mém platu?
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_07");	//Za každou várku jsem ochoten zaplatit sto mincí. Je mi líto, víc si nemůžu dovolit.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_08");	//Stejně je to dvakrát víc než od jakéhokoliv obchodníka na náměstí.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_09");	//Nesnaž se mi sem tahat opečené maso! V takovém případě ti nezaplatím...
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_10");	//Ok. Budu přemýšlet o tvém návrhu.
	KardifBuyMeat = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Kardif si od mě každý den koupí várku syrového masa po 20 kusech.");
};

instance DIA_Kardif_SellMeat(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 16;
	condition = DIA_Kardif_SellMeat_condition;
	information = DIA_Kardif_SellMeat_info;
	permanent = TRUE;
	description = "To naše maso...";
};

func int DIA_Kardif_SellMeat_condition()
{
	if((KardifBuyMeat == TRUE) && (Npc_HasItems(other,ItFoMuttonRaw) >= 20) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SellMeat_info()
{
	AI_Output(other,self,"DIA_Kardif_SellMeat_01_00");	//To naše maso...

	if(KardifBuyMeatDay < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Kardif_SellMeat_01_01");	//Ano? Máš něco?
		AI_Output(other,self,"DIA_KARDIF_SellMeat_01_02");	//Jistě, jak sis přál - dvacet kousků čerstvého masa.
		B_GiveInvItems(other,self,ItFoMuttonRaw,20);
		Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
		AI_Output(self,other,"DIA_KARDIF_SellMeat_01_03");	//Excelentní. Pro dnešek to bude stačit.
		AI_Output(self,other,"DIA_KARDIF_SellMeat_01_04");	//Tady, vezmi si zlato. A nezapomeň: Zítra očekávám další dodávky.
		B_GiveInvItems(self,other,ItMi_Gold,100);
		AI_Output(other,self,"DIA_KARDIF_SellMeat_01_05");	//Jak jinak.
		KardifBuyMeatDay = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_SellMeat_01_06");	//Dnes toho bylo dost! Vrať se zítra.
		AI_StopProcessInfos(self);
	};
};

//---------------------------------------------Igra------------------------------------------

instance DIA_VLK_431_Kardif_Game(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_VLK_431_Kardif_Game_condition;
	information = DIA_VLK_431_Kardif_Game_info;
	description = "Co se tu ještě dá dělat?";
};

func int DIA_VLK_431_Kardif_Game_condition()
{
	if((Npc_KnowsInfo(other,DIA_Kardif_Hi) == TRUE) && (Kardif_OneQuestion == FALSE)) 
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_Game_info()
{
	AI_Output(other,self,"DIA_VLK_431_Kardif_Game_01_00");	//Co se tu ještě dá dělat?
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_01");	//Myslíš kromě chlastání od rána do večera?
	AI_Output(other,self,"DIA_VLK_431_Kardif_Game_01_02");	//Nooo...
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_03");	//Tohle je hospoda, ne bordel! Lidi si sem chodí svlažit hrdlo, ne vymýšlet hlouposti.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_04");	//Ale... Někteří moji speciální klienti si se mnou rádi zahrají kostky.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_05");	//Je to mnohem zajímavější než jen tupě chlastat.
	AI_Output(other,self,"DIA_VLK_431_Kardif_Game_01_06");	//A můžu si s tebou zahrát?
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_07");	//Ty? Hmm... Proč ne. Ale jen v případě, že na to máš.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_08");	//Sázky jsou vysoké a měl bys teda mít dost zlata.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_09");	//Takže pokud máš s sebou stovky zlatých nazbyt, jen si řekni a můžeme si zahrát.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_10");	//Pokud ne, tak ti můžu nabídnout leda tak něco na pití.
	KardifPlayResult = 200;
	Menu_WriteInt("AST","SysTimer01",0);
	Log_CreateTopic(TOPIC_GameList,LOG_NOTE);
	B_LogEntry(TOPIC_GameList,"Vypadá to, že si s Kardifem můžu zahrát kostky. Asi bych toho mohl využít.");
};

instance DIA_VLK_431_Kardif_WhatOth(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_VLK_431_Kardif_WhatOth_condition;
	information = DIA_VLK_431_Kardif_WhatOth_info;
	description = "Neznáš někoho dalšího, s kým bych si mohl zahrát?";
};

func int DIA_VLK_431_Kardif_WhatOth_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_431_Kardif_Game) == TRUE) && (Kardif_OneQuestion == FALSE) && (KnowOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_WhatOth_info()
{
	AI_Output(other,self,"DIA_VLK_431_Kardif_WhatOth_01_00");	//Neznáš někoho dalšího, s kým bych si mohl zahrát?
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_01");	//Hmm... Takových není mnoho.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_02");	//Jeden takový by mohl být alchymista Salandril. Najdeš ho v horní části města.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_03");	//Krom něho je tu ještě Orlan - majitel hostince 'U Mrtvé harpyje'. Ten je vcelku dobrý.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_04");	//Měl bys vidět, jak obírá své zákazníky i o poslední peníz. Dokonce i já se bojím s ním hrát.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_05");	//Posledním je Raul, žoldák z Onarovy farmy. Ten je fakt profesionál.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_06");	//Ale nedoporučuju ti to s ním ani zkoušet, protože ten tě klidně obere i o kalhoty.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_07");	//A to je všechno.
	GameOtherPlayers = TRUE;
	B_LogEntry(TOPIC_GameList,"Je tu víc hráčů, se kterými můžu hrát: Salandril, Orlan a Raul.");
};

instance DIA_VLK_431_Kardif_GamePlay(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 900;
	condition = DIA_VLK_431_Kardif_GamePlay_condition;
	information = DIA_VLK_431_Kardif_GamePlay_info;
	permanent = TRUE;
	description = "Pojďme hrát kostky!";
};

func int DIA_VLK_431_Kardif_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_431_Kardif_Game) == TRUE) && (Kardif_OneQuestion == FALSE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer01");

	if(CheckLastGame >= KardifPlayResult)
	{
		CheckLastSum = CheckLastGame - KardifPlayResult;
	};

	AI_Output(other,self,"DIA_VLK_431_Kardif_GamePlay_01_00");	//Pojďme hrát kostky!

	if(KardifPlayResult >= CheckLastGame)
	{
		if((KardifPlayResult > 0) && (KardifDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_01");	//Tak pojďme na to...
			PlayPocker(1,self);
		}
		else
		{
			if(KardifDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_02");	//Pro dnešek už toho bylo dost! Už jsem toho prohrál přílíš.
				KardifDayPlay = Wld_GetDay();
				KardifDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_03");	//Teď se mi nechce.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_04");	//Naposledy jsi u mě prohrál vcelku dost velkou částku - nebo sis myslel, že jsem na to zapoměl?
		AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_05");	//Takže pokud mi nezaplatíš, nic se hrát nebude.
		Info_ClearChoices(DIA_VLK_431_Kardif_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_VLK_431_Kardif_GamePlay,"Tu jsou tvoje prachy.",DIA_VLK_431_Kardif_GamePlay_Here);
		};

		Info_AddChoice(DIA_VLK_431_Kardif_GamePlay,"Nemám dost peněz.",DIA_VLK_431_Kardif_GamePlay_No);
	};
};

func void DIA_VLK_431_Kardif_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	KardifPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_VLK_431_Kardif_GamePlay_Here_01_01");	//Tu jsou tvoje prachy.
	AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_Here_01_02");	//Dobře. Teď můžeme hrát...
	PlayPocker(1,self);
};

func void DIA_VLK_431_Kardif_GamePlay_No()
{
	AI_Output(other,self,"DIA_VLK_431_Kardif_GamePlay_No_01_01");	//Nemám dost peněz.
	AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_No_01_02");	//Tak je sežeň...
	Info_ClearChoices(DIA_VLK_431_Kardif_GamePlay);
};

instance DIA_VLK_431_Kardif_GameEnd(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_VLK_431_Kardif_GameEnd_condition;
	information = DIA_VLK_431_Kardif_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_431_Kardif_GameEnd_condition()
{
	if((MustTellResult_Kardif == TRUE) && ((KardifLost == TRUE) || (KardifWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_GameEnd_info()
{
	if(KardifLost == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_431_Kardif_GameEnd_00");	//Zatraceně! Očividně toto není můj den.
		KardifLost = FALSE;
	}
	else if(KardifWon == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_431_Kardif_GameEnd_01");	//Vypadá to, že štěstěna je na mojí straně. Ale jak chceš, můžeš to zkusit znovu.
		KardifWon = FALSE;
	};

	MustTellResult_Kardif = FALSE;
};

instance DIA_Kardif_DiscoverLH(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_DiscoverLH_Condition;
	information = DIA_Kardif_DiscoverLH_Info;
	description = "Potřebuji poradit.";
};

func int DIA_Kardif_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (Kardif_OneQuestion == TRUE) && (CanGoLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DiscoverLH_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Kardif_DiscoverLH_01_00");	//Potřebuji poradit.
	AI_Output(self,other,"DIA_Kardif_DiscoverLH_01_01");	//Vždy rád pomůžu, hlavně když už si za to zaplatil.
	AI_Output(other,self,"DIA_Kardif_DiscoverLH_01_02");	//Nevíš náhodou o někom tu v přístavu, kdo by věděl něco o pirátech?
	AI_Output(self,other,"DIA_Kardif_DiscoverLH_01_03");	//O pirátech? Och, chlape, to nevím... Hmm... (zamyšleně) Obávam se, že nikdo. Ale zkus si pokecat s Jackem.
	AI_Output(self,other,"DIA_Kardif_DiscoverLH_01_04");	//Je to starý námořník. Viděl toho hodně, a pravděpodobně se střetl i s piráty.
	AI_Output(other,self,"DIA_Kardif_DiscoverLH_01_05");	//Děkuji.
	KnowStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Kardif mi řekl, že bych si měl o pirátech popovídat s Jackem.");
};
