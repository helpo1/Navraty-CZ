
instance DIA_RATFORD_EXIT(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 999;
	condition = dia_ratford_exit_condition;
	information = dia_ratford_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ratford_exit_condition()
{
	return TRUE;
};

func void dia_ratford_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_HALLO(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_hallo_condition;
	information = dia_ratford_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ratford_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DRAXHASRING == FALSE) && (RatfordCap == FALSE))
	{
		return TRUE;
	};
};

func void dia_ratford_hallo_info()
{
	AI_Output(self,other,"DIA_Ratford_Hallo_01_00");	//Na všechny otázky se zeptej Draxe... (mrzutě)
	AI_Output(self,other,"DIA_Ratford_Hallo_01_01");	//To on je ten ukecaný!
	AI_Output(other,self,"DIA_Ratford_Hallo_15_00");	//Hmmm...
	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_FISK(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_fisk_condition;
	information = dia_ratford_fisk_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_ratford_fisk_condition()
{
	if((DRAXHASRING == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void dia_ratford_fisk_info()
{
	AI_Output(self,other,"DIA_Ratford_Fisk_01_00");	//Vidím, že ti můžeme důvěřovat.
	AI_Output(self,other,"DIA_Ratford_Fisk_01_01");	//Řekni mi, jestli jsi neviděl v táboře jednoho chlapa? Jmenuje se Fisk.
	AI_Output(other,self,"DIA_Ratford_Fisk_01_02");	//Fiska?!... Jasně, potkal. A co jako?

	if(FISK_ISDEAD == TRUE)
	{
		AI_Output(other,self,"DIA_Ratford_Fisk_15_07");	//No jen... jak to jen... říct...
		AI_Output(self,other,"DIA_Ratford_Fisk_01_10");	//CO?!... Tak se už vymáčkni! (podrážděně)
		AI_Output(other,self,"DIA_Ratford_Fisk_15_08");	//No, zemřel.
		AI_Output(self,other,"DIA_Ratford_Fisk_01_11");	//Sakra!... (naštvaně)
		AI_Output(other,self,"DIA_Ratford_Fisk_15_09");	//Co, špatné zprávy?
		AI_Output(self,other,"DIA_Ratford_Fisk_01_13");	//Jen trochu. Dobrá, není to důležité. Zapomeň na to...
	}
	else
	{
		AI_Output(self,other,"DIA_Ratford_Fisk_01_03");	//A jak to s ním vypadá? Myslím tím, jestli je pořád dobře vybaven.
		AI_Output(other,self,"DIA_Ratford_Fisk_15_02");	//No, lze říci, že ano. Pořád prodává všechno možné smetí.
		AI_Output(self,other,"DIA_Ratford_Fisk_01_04");	//Tak jestli na něj znovu narazíš, řekni mu, že ho pozdravuje Ratford.
		AI_Output(other,self,"DIA_Ratford_Fisk_15_03");	//Všechno?!
		AI_Output(self,other,"DIA_Ratford_Fisk_01_05");	//Všechno!... Myslím, že to bude stačit.
		AI_Output(other,self,"DIA_Ratford_Fisk_01_08");	//Dobrá, když ho znovu potkám, vyřídím mu tvé pozdravy.
		AI_Output(self,other,"DIA_Ratford_Fisk_15_05");	//Díky, chlape.
		MIS_RATFORDFISK = LOG_Running;
		Log_CreateTopic(TOPIC_RATFORDFISK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RATFORDFISK,LOG_Running);
		B_LogEntry(TOPIC_RATFORDFISK,"Ratford mě požádal, jestli bych mohl Fiskovi od něj vyřídit pozdravy.");
	};

	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_FISKOK(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_fiskok_condition;
	information = dia_ratford_fiskok_info;
	permanent = FALSE;
	description = "Vyřídil jsem Fiskovi tvoje pozdravy...";
};

func int dia_ratford_fiskok_condition()
{
	if((MIS_RATFORDFISK == LOG_Running) && (HIFROMRATFORD == TRUE) && (Npc_HasItems(other,itmi_fiskpacket) > 0))
	{
		return TRUE;
	};
};

func void dia_ratford_fiskok_info()
{
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_00");	//Vyřídil jsem Fiskovi tvoje pozdravy.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_01");	//Ano. A co?
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_02");	//Požádal mě, jestli bych ti předal tento balíček.
	B_GiveInvItems(other,self,itmi_fiskpacket,1);
	Npc_RemoveInvItems(self,itmi_fiskpacket,1);
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_03");	//No, tak to je jiná věc! Ach ten starý tulák... (směje se)
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_04");	//A s čím to s Fiskem obchodujete?
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_05");	//No. Před pádem bariéry jsem Fiskovi dodával různé věci, většinou lovecké trofeje...
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_06");	//A ukázalo se, že kvůli těm událostem Fisk nestihl včas zaplatit za dodané zboží.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_07");	//No, vlastně mě dlužil prachy... Taková běžná věc.
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_08");	//Potom je vše jasné. Vlastně nevypadal zrovna šťastně, když jsem se o tobě zmínil.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_09");	//Hm. Stále stejný lakomec. Ale co bys chtěl od obchodníka!
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_10");	//Dobrá tedy. Měl bych ti poděkovat za tvou pomoc...
	if(Player_IsApprentice == APP_Bosper)
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_11");	//Ty jsi také lovec, jak tak koukám. Tady, vezmi si tyto lovecké trofeje. Určitě najdeš někoho, kdo je prodá dráž.
		CreateInvItems(self,ItAt_ShadowHorn,5);
		B_GiveInvItems(self,other,ItAt_ShadowHorn,5);
	}
	else if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_12");	//Vidím, že pracuješ v kovárně. Vezmi si tyto ocelové ingoty. Snad z nich něco pořádného ukoveš.
		CreateInvItems(self,ItMiSwordraw,5);
		B_GiveInvItems(self,other,ItMiSwordraw,5);
	}
	else if(Player_IsApprentice == APP_Constantino)
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_13");	//Vidím, že jsi nesmírně dobrý ve sbírání bylin. Tady, vezmi si tuhle vzácnou věc. Prý je nesmírně cenná!
		CreateInvItems(self,ItPl_Perm_Herb,1);
		B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_14");	//Trochu zlatých, to je vše, co ti mohu dát.
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
	};
	B_LogEntry(TOPIC_RATFORDFISK,"Předal jsem Ratfordovi balíček od Fiska. Ratford byl šťastný. Na mou otázku, co to spolu měli za obchod mi Ratford odpověděl, že mu Fisk dlužil nějaké peníze z dob bariéry.");
	Log_CreateTopic(TOPIC_RATFORDFISK,LOG_SUCCESS);
	MIS_RATFORDFISK = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_Capitan(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = DIA_Ratford_Capitan_condition;
	information = DIA_Ratford_Capitan_info;
	permanent = FALSE;
	description = "Slyšel jsem, že jsi byl kapitánem lodi.";
};

func int DIA_Ratford_Capitan_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordCap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Capitan_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ratford_Capitan_01_00");	//Slyšel jsem, že jsi byl kapitánem lodi.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_01");	//(ušklíbne se) No byl - kdysi.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_02");	//A nechceš se vydat na nové mořské dobrodružství?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_03");	//Co o čem to mluvíš?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_04");	//O tom, že potřebuji kapitána co s ním mohu vyplout na otevřené moře.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_05");	//Hmm... (ušklíbne se) Na to je potřeba mít loď. A ty nějakou máš?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_06");	//Samozřejmě. A můžeš jí vidět, když se teď podíváš dolů.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_07");	//Ty máš na mysli drakar skřetů?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_08");	//Bingo!
	AI_Output(self,other,"DIA_Ratford_Capitan_01_09");	//Máš horečku, skřeti tě k němu nenechaj ani přiblížit.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_10");	//Ty už mají jiné starosti, poslal jsem je za Beliarem.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_11");	//Takže drakar je nyní opuštěný a čeká jen, až s ním někdo vypluje?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_12");	//To je novinka, jestli je to tak tak ti jsem k službám.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_13");	//A ty víš jak se na něm plavit?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_14");	//Poperu se s tím a kam se chceš plavit?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_15");	//Já sám se nikam plavit nechci, tvým šéfem bude žoldák Sylvio.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_16");	//A s ním ještě další hrdlořezové. 
	AI_Output(other,self,"DIA_Ratford_Capitan_01_17");	//Ale co vím, tak chtěli plout na pevninu.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_18");	//V tom případě potřebuji mapu, jinak můžem na volném moři lehce ztratit směr.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_19");	//A ještě 500 zlatých, bezplatně mu pomáhat nebudu.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_20");	//Dobře, ohledně peněz jsme dohodnutý a co za mapu potřebuješ.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_21");	//Obyčejná mořská mapa na které je vyznačen kurz na pevninu.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_22");	//A kde bych jí měl hledat?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_23");	//Nejspíš ve městě. Bez ní nikam nepopluji. A jinak nic nepotřebuju.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_24");	//Dobře, zkusím ji sehnat.
	RatfordNeedMap = TRUE;
	B_LogEntry(Topic_SylvioCrew,"Ratford souhlasil, stát se kapitánem. Ale aby mohl plout na pevninu, potřebuje mapu s vyznačeným kurzem.");
};

instance DIA_Ratford_Capitan_Done(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = DIA_Ratford_Capitan_Done_condition;
	information = DIA_Ratford_Capitan_Done_info;
	permanent = FALSE;
	description = "Tady máš mapu.";
};

func int DIA_Ratford_Capitan_Done_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_HasItems(hero,ItWr_Seamap_Mirtana) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Capitan_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_00");	//Tady máš mapu.
	B_GiveInvItems(other,self,ItWr_Seamap_Mirtana,1);
	Npc_RemoveInvItems(self,ItWr_Seamap_Mirtana,1);
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_01");	//Ukaž, podívám se na ní.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_02");	//Ano, dostačující! To by šlo.
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_03");	//Nyní jsi připraven stát u kormidla drakaru?
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_04");	//Samozřejmě, jak jsme se domluvili.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_05");	//Ale nezapomeň, že ten týpek mě ještě dluží 500 zlatých!
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_06");	//Samozřejmě je dostaneš, nemusíš se bát.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_07");	//Tak já se vydám na loď a budu tam čekat.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_08");	//Drax mimochodem také projevil přání, opustit tento ostrov.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_09");	//Takže popluje se mnou.
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_10");	//Drakar je velký, místa je pro všechny dost.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_11");	//Dobře - na viděnou.
	RatfordAgree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_SylvioDebts(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_SylvioDebts_condition;
	information = DIA_Ratford_SylvioDebts_info;
	permanent = FALSE;
	description = "Co se děje?";
};

func int DIA_Ratford_SylvioDebts_condition()
{
	if((MoveDracarBoard == TRUE) && (RatfordOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_SylvioDebts_info()
{
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_01_00");	//Co se děje?
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_01");	//Ten prokletý mechanizmus je rozbitý!
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_01_02");	//A můžeš ho opravit?
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_03");	//Myslím že ano, ale zabere to nějaký čas.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_04");	//A ještě, tvůj přítel Sylvio mi nezaplatil.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_05");	//Byla dohoda - 500 zlatých mincí!
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_06");	//A on se jen vytáčí.
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_01_07");	//Promluvím s ním.
	MIS_SylvioDebts = LOG_Running;
	Log_CreateTopic(Topic_SylvioDebts,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioDebts,LOG_Running);
	B_LogEntry(Topic_SylvioDebts,"Sylvio doposud Ratfordovi nezaplatil. Musím to vyřídit, dal jsem mu přeci slovo.");
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_SylvioDebts_Done(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_SylvioDebts_Done_condition;
	information = DIA_Ratford_SylvioDebts_Done_info;
	permanent = FALSE;
	description = "Tady máš své peníze.";
};

func int DIA_Ratford_SylvioDebts_Done_condition()
{
	if((SylvioIsDead == TRUE) && (MIS_SylvioDebts == LOG_Running) && (Npc_HasItems(hero,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Ratford_SylvioDebts_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_00");	//Tady máš své peníze.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_01");	//Děkuju. A jak se ti podařilo je z něj dostat?
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_02");	//Poslal jsem toho bastarda za Beliarem.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_03");	//(směje se) Myslím, že s tebou není dobrý mít spor.
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_04");	//Ano pokud někdo nedrží slovo.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_05");	//Doufám, že spolu jsme v pohodě.
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_06");	//Proč, ty mě nic nedlužíš.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_07");	//To je pravda příteli... nic!
	MIS_SylvioDebts = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioDebts,LOG_Success);
	B_LogEntry(Topic_SylvioDebts,"Předal jsem peníze Ratfordovi.");
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_Drakar_Perm(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_Drakar_Perm_condition;
	information = DIA_Ratford_Drakar_Perm_info;
	permanent = TRUE;
	description = "Jak probíhají opravy?";
};

func int DIA_Ratford_Drakar_Perm_condition()
{
	if((MIS_SylvioDebts == LOG_Success) && (RatfordOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Drakar_Perm_info()
{
	AI_Output(other,self,"DIA_Ratford_Drakar_Perm_01_00");	//Jak probíhají opravy?
	AI_Output(self,other,"DIA_Ratford_Drakar_Perm_01_01");	//Dělám co můžu... (pokrčí rameny) Tady to není tak jednoduchý!
	AI_Output(other,self,"DIA_Ratford_Drakar_Perm_01_02");	//Rozumím.
};
