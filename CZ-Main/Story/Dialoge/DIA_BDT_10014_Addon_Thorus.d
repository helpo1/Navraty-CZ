
instance DIA_Addon_BDT_10014_Thorus_EXIT(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 999;
	condition = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10014_Thorus_Hi(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 2;
	condition = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Hi_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Znáš pravidla. Bez červené kamenné tabulky se nikdo do dolu nedostane.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Zapomeň na důl - musím se dostat k Ravenovi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//I tak. Máme pravidla, která platí pro každého. I pro tebe.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Vrať se. Pokud se pokusíš vstoupit do horní čtvrti bez povolení, stráže tě zabijí. TO jsou pravidla.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Pokud chceš mít námitky, promluv si s Estebanem. Je zodpovědný za tábor.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BDT_10014_Thorus_Raven(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 3;
	condition = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent = FALSE;
	description = "Je velmi důležité, abych se dostal k Ravenovi...";
};


func int DIA_Addon_Thorus_Raven_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//Je velmi důležité, abych se dostal k Ravenovi...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Ano? Opravdu věříš, že se k němu dostaneš?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Jeho stráže mají rozkaz NIKOHO nevpouštět. Budeš mrtev dřív, než ho vůbec spatříš.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Takže to pusť z hlavy.
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven je vůdce banditů. Budu muset se k němu dostat podle pravidel, která tu jsou.");
};


instance DIA_Addon_BDT_10014_Thorus_Zeit(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent = FALSE;
	description = "Vzpomínáš si na mě? Ze Starého tábora...";
};


func int DIA_Addon_Thorus_Zeit_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Zeit_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Vzpomínáš si na mě? Ze Starého tábora...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Jsi jeden z trestanců? Možná jsi byl jeden z mých stráží. A? Dělá to z nás spojence?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Ne, nedělá.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Možná jsi člověk, který strhl bariéru - možná jsi zabil moje lidi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//Ale?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Teď je to za námi.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Chceš vstoupit? Získej červený kámen a už neplýtvej mým časem.
	};
};


var int Thorus_GoodOldPerm;

instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent = TRUE;
	description = "No tak, pusť mě. Kvůli starým dobrým časům.";
};


func int DIA_Addon_Thorus_GoodOldPerm_Condition()
{
	if((MIS_Send_Buddler != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_BDT_10014_Thorus_Zeit) && (RavenAway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_GoodOldPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//No tak, pusť mě. Kvůli starým dobrým časům.
	if(Thorus_GoodOldPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Dobrá - nech mě to vysvětlit. Víš, proč jsem stále naživu?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Protože jsem byl vždy loajální ke svým lidem.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Nemám rád to, co Raven dělá. Ale budu se držet pravidel.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//A ty taky budeš!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(rozhodný) NE!
	};
};

func int C_PlayerHasWrongToken()
{
	if((C_ScHasMagicStonePlate() == TRUE) || (Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_02) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_03) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_04) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_05) >= 1))
	{
		return TRUE;
	};
};


instance DIA_Addon_BDT_10014_Thorus_Stein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent = TRUE;
	description = "Mám pro tebe kamennou tabulku...";
};


func int DIA_Addon_Thorus_Stein_Condition()
{
	if((C_PlayerHasWrongToken() == TRUE) && (RavenAway == FALSE) && (MIS_Send_Buddler != LOG_Running) && (MIS_Send_Buddler != LOG_SUCCESS) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//Mám pro tebe kamennou tabulku...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//Ta je špatná. Počítá se jen červená.
};


instance DIA_Addon_BDT_10014_Thorus_Rein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent = FALSE;
	description = "Mám červenou kamennou tabulku...";
};


func int DIA_Addon_Thorus_Rein_Condition()
{
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Rein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//Mám červenou kamennou tabulku...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Dobrá.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Vyřídil jsi Estebana - to znamená, že TY teď děláš jeho práci.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//V dole mají pár problému s důlními červy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Tři kopáči jsou již po smrti. Je tvůj úkol opatřit nové.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//A kdy se můžu konečně dostat do toho zatraceného dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Udělej svoji práci - potom můžeš dělat, co chceš.
	MIS_Send_Buddler = LOG_Running;
	Log_CreateTopic(Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Buddler,LOG_Running);
	B_LogEntry(Topic_Addon_Buddler,"Protože jsem teď dostal Estebanovo místo, měl bych poslat tři kopáče do dolu.");
};


instance DIA_Addon_BDT_10014_Thorus_Sent(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent = FALSE;
	description = "Poslal jsem tři chlapy.";
};


func int DIA_Addon_Thorus_Sent_Condition()
{
	if((Player_SentBuddler >= 3) && (RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Sent_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Poslal jsem tři chlapy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//Dobrá. Dokud se tady o to starám já, tak můžeš dovnitř.
	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_BDT_10014_Thorus_Armor(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent = FALSE;
	description = "Hej, a co tvoje zbroj? Kde takovou dostanu?";
};


func int DIA_Addon_Thorus_Armor_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hej, a co tvoje zbroj? Kde takovou dostanu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Nikde. Zbroj je určena pro Ravenovy stráže.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Nevěřím, že je tu možnost, pro nové žadatele. Ale konečné rozhodnutí není moje, ale spíše na Ravenovi.
	THORUSACCEPTMEGUARD = LOG_Running;
	Log_CreateTopic(TOPIC_THORUSGUARD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORUSGUARD,LOG_Running);
	B_LogEntry(TOPIC_THORUSGUARD,"Thorus říká, že abych dostal stejnou zbroj jako má on, musel bych se stát jeden z Ravenových stráží. Obávám se, že to není moc pravděpodobné.");
};


instance DIA_Addon_Thorus_Gefangene(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 88;
	condition = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent = FALSE;
	description = "A co s vězni?";
};


func int DIA_Addon_Thorus_Gefangene_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Gefangene_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//A co s vězni?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Mmh, jejich práce skončila! Co já vím, tak teď dolují zlato.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//A pokud se pokusí o útěk?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//Bloodwyn za nimi pošle své stráže. Ale nevěřím, že jsou dost šílení, aby se pokusili o útěk.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Jestliže... (zamyšleně)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Jestliže co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//... je někdo jiný nebude podporovat. Ale vím, že nikdo není tak blbý, aby to udělal... v každém případě, dokud je tu Bloodwyn!
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Thorus_Speech(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Speech_Condition()
{
	if(Npc_IsDead(Bloodwyn) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Speech_Info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Co máš vlastně v úmyslu dělat?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Co?
	if(RavenAway == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Teď jsi odstranil z cesty Bloodwyna. Ptám se sám sebe: Kdo další. Raven? Nebo já?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Bojíš se?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Nebojím se bitvy. Ale důsledku tvých činů.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Tenhle tábor je jediná věc, co nám zbyla.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Nepracuje to sice tak, aby to každého uspokojilo - Ale PRACUJE to.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//A s každým chlapem, kterého zabiješ se naše kolonie tenčí.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Jsme banditi. Zadržovaní, nezákonní, opovrhovaní.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Kamkoli jdeme, loví nás, vězní nás, zabíjí nás.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Není lepšího místa, než tohohle, a lepší čas než teď.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Tak co tedy chceš?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Tihle muži potřebují někoho, kdo by je vedl. Kdo by to měl dělat? Ty? Někdo, kdo neustále chodí z místa na místo?
};


instance DIA_Addon_Thorus_Answer(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent = FALSE;
	description = "Dobrá - proč se ty nestaneš vůdcem v táboře?";
};


func int DIA_Addon_Thorus_Answer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Speech) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Answer_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Dobrá - proč se ty nestaneš vůdcem v táboře?
	if(RavenAway == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Dobrá, ale co Raven?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Raven bude mít brzy jiné problémy. Postarám se o to.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//A ještě nco - postarej se, že vězni budou moci odejít.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Jasně... Postarám se o všechny stráže venku.
	B_LogEntry(TOPIC_Addon_Sklaven,"Bloodwyn je mrtev a Thorus se postará, aby otroci mohli odejít.");

	if(!Npc_IsDead(PrisonGuard))
	{
		B_LogEntry(TOPIC_Addon_Sklaven,"Teď si promluvím ještě jednou se 'Strážcem otroků', potom může Patrick a jeho hoši zmizet.");
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Sklaven,"Poté co jsem promluvil se 'Strážcem otroků', Patrick a jeho chlapi můžou zmizet.");
	};
};


instance DIA_Addon_Thorus_Raventot(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent = FALSE;
	description = "Dokázal jsem to. Raven je mrtev!";
};


func int DIA_Addon_Thorus_Raventot_Condition()
{
	if((RavenAway == TRUE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raventot_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_98");	//Dokázal jsem to. Raven je mrtev!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_99");	//Co tím myslíš? (překvapeně) Ačkoliv Beliarova moc byl s ním! Bez ní nám bude každému líp!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Co teď budeš dělat?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_97");	//Znáš mě.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(směje se) Ano, jsi stále na cestě? Přeji dobrou cestu!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Kdo ví, možná na sebe znovu natrefíme.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Kdo ví. Je tady mnoho bran a dveří, kterými projdeš. A u některé z nich mě najdeš.
	THORUSACCEPTME = TRUE;
};

instance DIA_ADDON_THORUS_PICKPOCKET(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 900;
	condition = dia_addon_thorus_pickpocket_condition;
	information = dia_addon_thorus_pickpocket_info;
	permanent = TRUE;
	description = "(zkusit ukrást klíč)";
};

func int dia_addon_thorus_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ITKE_Addon_Thorus) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_pickpocket_info()
{
	Info_ClearChoices(dia_addon_thorus_pickpocket);
	Info_AddChoice(dia_addon_thorus_pickpocket,Dialog_Back,dia_addon_thorus_pickpocket_back);
	Info_AddChoice(dia_addon_thorus_pickpocket,DIALOG_PICKPOCKET,dia_addon_thorus_pickpocket_doit);
};

func void dia_addon_thorus_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		B_GiveInvItems(self,other,ITKE_Addon_Thorus,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(dia_addon_thorus_pickpocket);
	}
	else
	{
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void dia_addon_thorus_pickpocket_back()
{
	Info_ClearChoices(dia_addon_thorus_pickpocket);
};


instance DIA_ADDON_THORUS_ORCINVASION(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = dia_addon_thorus_orcinvasion_condition;
	information = dia_addon_thorus_orcinvasion_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_orcinvasion_condition()
{
	if((RavenAway == TRUE) && (THORUS_TP == TRUE) && !Npc_KnowsInfo(other,dia_addon_thorus_orcinvasion))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_orcinvasion_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_00");	//Zase ty!... (udiveně) Někdy mi připadá, že neexistuje místo, kde bych tě nemohl potkat.
	if(ORCSHAMAN4ISDEAD == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_02");	//Co tu děláš?! Myslel jsem, že skřeti všechny pobili...
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_03");	//Já a pár chlapů jsme unikli.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_05");	//THORUSI Co tady děláš?!
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_06");	//Ty to nevíš? Tábor přepadli skřeti.
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_07");	//Ty svině nás přepadli tak rychle, že jsme ani nestačili zformovat obranu!
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_08");	//Ale já a pár chlapů jsme zdrhli.
	};
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_10");	//Jeden z nás, jménem Dan, věděl o tajné cestě z tábora, kterou nás vyvedl.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_11");	//Ještě teď nevím, jak jsme to dokázali!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_13");	//Kde jsou ostatní?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_14");	//V jeskyni za mnou je vše, co zbylo z našeho tábora... (s povzdechem)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_15");	//A co budete dělat?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_16");	//To nevím. Nejpravděpodobněji co nejdřív vypadneme.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_17");	//Dříve nebo později to tu skřeti začnou prohledávat. Až se to stane, nikdo nás nezachrání.
	if(AWORCINVASIONSTOP == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_18");	//Skřetí vůdci jsou mrtví. Pravděpodobně zbytek vojska brzy opustí údolí.
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_19");	//To je dobře, ale vrátit se nemůžeme. Je nás příliš málo.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_21");	//Všechno je možné.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_22");	//A co teď budete dělat?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_23");	//Nevím. Nejspíš promluvím s piráty, prý se umí dostat na druhou stranu ostrova.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_24");	//A mají se dobře vzpomínám mají rádi zlato... Mozná se domluvíme že by nás tam mohli vzít.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_THORUS_RAVENGUARD(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = dia_addon_thorus_ravenguard_condition;
	information = dia_addon_thorus_ravenguard_info;
	permanent = FALSE;
	description = "Ještě jedna věc...";
};


func int dia_addon_thorus_ravenguard_condition()
{
	if((RavenAway == TRUE) && (THORUSACCEPTME == TRUE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_ravenguard_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_02");	//Když je Raven mrtvý, můžu být stráží, ne?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_05");	//Člověče ty nejsi pozadu že?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_06");	//Dobrá, zabil jsi Ravena, tak to bychom měli vstupní zkoušku. (směje se)
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_07");	//Tady - tuhle zbroj si zasloužíš.
	AI_Print("Získáno 1x Těžká zbroj stráže");
	CreateInvItems(other,ITAR_Thorus_Addon,1);
	THORUSACCEPTMEGUARD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_THORUSGUARD,LOG_SUCCESS);
	B_LogEntry(TOPIC_THORUSGUARD,"Nyní patřím mezi Thorusovy stráže. Dostal jsem i jejich výzbroj.");
};