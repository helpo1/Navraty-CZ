
instance DIA_Addon_Elvrich_EXIT(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 999;
	condition = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Elvrich_PICKPOCKET(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 900;
	condition = DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information = DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	return C_Beklauen(62,110);
};

func void DIA_Addon_Elvrich_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,Dialog_Back,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};

func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};


instance DIA_Addon_Elvrich_BanditsThere(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_BanditsThere_Condition;
	information = DIA_Addon_Elvrich_BanditsThere_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Elvrich_BanditsThere_NoPerm;

func int DIA_Addon_Elvrich_BanditsThere_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_BanditsThere_Info()
{
	if(Npc_IsDead(BDT_10307_Addon_RangerBandit_M) && Npc_IsDead(BDT_10308_Addon_RangerBandit_L) && Npc_IsDead(BDT_10309_Addon_RangerBandit_L) && Npc_IsDead(BDT_10310_Addon_RangerBandit_M))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Díky bohu! S bandity je konec. Zachránils mi život.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Elvrich_Wer(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Wer_Condition;
	information = DIA_Addon_Elvrich_Wer_Info;
	description = "Kdo jsi?";
};


func int DIA_Addon_Elvrich_Wer_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Jmenuji se Elvrich. Jsem z města.
	if(MIS_Thorben_BringElvrichBack == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistr Thorben mi řekl, že jsi zmizel.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Ti parchanti mě dotáhli na toto místo, a drželi mě tu v zajetí.
};


instance DIA_Addon_Elvrich_MissingPeople(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_MissingPeople_Condition;
	information = DIA_Addon_Elvrich_MissingPeople_Info;
	description = "Ve městě se ztratili i další lidé.";
};


func int DIA_Addon_Elvrich_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer) && (SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Elvrich_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//Ve městě se ztratili i další lidé.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//Nevím nic o dalších lidech. Můžu ti jenom říct, co se stalo MĚ.
};


instance DIA_Addon_Elvrich_WhatExactly(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhatExactly_Condition;
	information = DIA_Addon_Elvrich_WhatExactly_Info;
	description = "Co se ti přesně stalo?";
};


func int DIA_Addon_Elvrich_WhatExactly_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co se ti přesně stalo?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//Šel jsem na rande. Měl jsem se setkat se svou přítelkyní.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Jmenuje se Lucie. Měli jsme v plánu utéct do hor. Pryč z města a ode všech, co tam žijí.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Došel jsem na místo, kde na mě měla čekat Lucie, když v tom se objevili banditi a oba nás zajali.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Samozřejmě jsem bojoval, ale bylo jich příliš mnoho. Ty jsi na ně náhodou nenarazil?
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Co od tebe banditi chtěli?",DIA_Addon_Elvrich_WhatExactly_Want);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Pověz mi o Lucii.",DIA_Addon_Elvrich_WhatExactly_lucia);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Co od tebe banditi chtěli?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Několikrát se mi podařilo odposlouchávat jejich rozhovory. Z nich jsem pochopil, že nás chtějí prodat do otroctví. 
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Kam vás chtěli odvléct?",DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Kam vás chtěli odvléct?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//To místo je někde tady na ostrově. Ale podle mě se tam nejde dostat bez lodi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Přivedli mě na pobřeží. Nacházel se tam malý pirátský tábor.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z banditů šel k pirátům a začal vyjednávat. Přerostlo to do velkého sporu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//Myslím, že bandita chtěl, aby nás piráti někam převezli.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale piráti odmítli a banditi museli odejít. Od té doby jsme tady a sedíme.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Podle mě, banditi nevěděli co dál dělat. A pak si přišel ty.
	Elvrich_SCKnowsPirats = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Elvrich, učedník truhláře Thorbena z Khorinisu byl unesen bandity. Vypadá to, že piráti jsou s bandity v nějaké vzájemné dohodě.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Piráti v Khorinisu?",DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Kde se nachází tábor pirátů?",DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Piráti v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Moc o nich nevím. Upřímně řečeno, jsem je tehdy viděl poprvé.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//Oni se snaží skrývat ve stínech, v pozadí. Skoro každý z nich je hledaný zločinec.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Piráti mají pověru - Bojí se totiž šibenice. Proto na ně nikdy nenarazíš ve městě.
};

func void DIA_Addon_Elvrich_WhatExactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Pověz mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Holka z přístavu. Velmi pěkná. Pracovala pro toho bídáka Bromora. 
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Kde se nachází tábor pirátů?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Nedaleko od přístavu v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Když budeš stát na molu čelem k moři, tak tábor bude z prava.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//Nejprvě je malá zátoka, skrze kterou budeš muset přeplavat a budeš na místě.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Abych našel místo střetu s piráty. Musím jít do přístavu v Khorinisu, kde se mám postavit na molu čelem k moři. Pak budu muset skočit do moře a plavat podél břehu doprava.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,Dialog_Back,DIA_Addon_Elvrich_WhatExactly_Back);
};

func void DIA_Addon_Elvrich_WhatExactly_Back()
{
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
};


instance DIA_Addon_Elvrich_Bromor(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Bromor_Condition;
	information = DIA_Addon_Elvrich_Bromor_Info;
	description = "Bromor říkal, že mu Lucia ukradla zlatou mísu...";
};


func int DIA_Addon_Elvrich_Bromor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Bromor_LuciaStoleGold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_Bromor_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor říkal, že mu Lucia ukradla zlatou mísu...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, pokud Lucie opravdu něco ukradla, tak jí to banditi určitě sebrali.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Bromorova zlatá mísa je nejspíše u banditů žijících v lesním táboře na severu od Sekobovy farmy.");
};


instance DIA_Addon_Elvrich_WhereIsLucia(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information = DIA_Addon_Elvrich_WhereIsLucia_Info;
	description = "Kde je Lucie teď?";
};


func int DIA_Addon_Elvrich_WhereIsLucia_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_LuciasLetter != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Kde je Lucie teď?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Naše cesty se rozdělili na velké křižovatce u Onarovy farmy.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Banditi ji odvlekli do lesa za Sekobovu farmu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Innos ji ochraňuj!
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Lucii odvedli banditi! Vstoupili do lesa severně od Sekobovy farmy.");
	SC_KnowsLuciaCaughtByBandits = TRUE;
};


instance DIA_Addon_Elvrich_FernandosWaffen(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information = DIA_Addon_Elvrich_FernandosWaffen_Info;
	description = "Ti banditi, kteří tě drželi v zajetí, obdrželi dodávku zbraní?";
};


func int DIA_Addon_Elvrich_FernandosWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//Ti banditi, kteří tě drželi v zajetí, obdrželi dodávku zbraní?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//No jasně. Těch zbraní bylo tolik, že měli co dělat, aby je unesli.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Banditi se se všema těmato zbraněma táhli směrem k Sekobově farmě.
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"Stopy mě vedou do lesa, který se nachází severně od Sekobovy farmy. Někde se tam nacházi banditi jež nedávno obdrželi velkou dodávku zbraní.");
};


instance DIA_Addon_Elvrich_LuciaLetter(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Addon_Elvrich_LuciaLetter_Condition;
	information = DIA_Addon_Elvrich_LuciaLetter_Info;
	description = "Našel jsem dopis od Lucie.";
};


func int DIA_Addon_Elvrich_LuciaLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Našel jsem dopis od Lucie.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(rozrušeně) Co? Dej to sem!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(v zoufalství) NE! Tomu nevěřím. Já tomu prostě nemůžu uvěřit.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(v zoufalství) Nemohla mě takhle opustit.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//Vem si ten dopis zpátky! Nechci ho vidět. Věřím, že se ke mě jednoho dne vrátí.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Elvrich nechce uvěřit, že Lucie šla s bandity dobrovolně. Pořád doufá, že se vrátí, navzdory jejího dopisu na rozloučenou.");
	B_GivePlayerXP(XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
	if((MIS_FINDLOSTHUSB == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == FALSE))
	{
		ELVRIHMARRYGRITTATIMER = Wld_GetDay();
		ELVRIHMARRYGRITTAFLAG = TRUE;
	};
};


instance DIA_Addon_Elvrich_WasNun(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WasNun_Condition;
	information = DIA_Addon_Elvrich_WasNun_Info;
	permanent = FALSE;
	description = "Musíš se vrátit do města!";
};


func int DIA_Addon_Elvrich_WasNun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhereIsLucia) || (MIS_LuciasLetter == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//Musíš se vrátit do města!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//To je to, co se chystám udělat! Vratím se k mistru Thorbenovi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Ty půjdeš hledat bandity?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//Myslím, že asi jo...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Pokud bys našel Lucii, vzal bys ji zpět do města, že jo?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Uvidím, co se dá dělat.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Elvrich se vrátil k mistru Thorbenovi.");
	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	Npc_ExchangeRoutine(VLK_462_Thorben,"Elvrback");
	EquipItem(self,ItMw_1h_Bau_Mace);
};


instance DIA_Addon_Elvrich_PERM(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_PERM_Condition;
	information = DIA_Addon_Elvrich_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Elvrich_PERM_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_LuciasLetter != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Díky za záchranu!
};


instance DIA_ADDON_ELVRICH_ELVRICHGRITTA(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = dia_addon_elvrich_elvrichgritta_condition;
	information = dia_addon_elvrich_elvrichgritta_info;
	permanent = FALSE;
	description = "Jak jde život Elvrichu?";
};


func int dia_addon_elvrich_elvrichgritta_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_elvrichgritta_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGritta_01_00");	//Jak jde život Elvrichu?
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGritta_01_02");	//Nemůžeš se dát dohromady, co jsi dostal Luciin dopis?
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGritta_01_03");	//Už jsem se s tím smířil. Měl bych zapomenout na ní a soustředit se na reálné věci.
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGritta_01_06");	//A co Thorbenova neteř Gritta, ta by se ti nelíbila?
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGritta_01_07");	//No... (v rozpacích) No, ona je velice hezká! Řekl bych, že...
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGritta_01_08");	//Tak co ti brání ji říct o tvých pocitech?
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGritta_01_09");	//A co ty jsi zač - blázen? (vystrašený) Ne, člověče, to neudělám!
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGritta_01_14");	//V tom případě strávíš zbytek života sám!
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGritta_01_19");	//Hmm... možná máš pravdu! Skutečně bych si s ní měl promluvit.
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGritta_01_26");	//Pak vám přeji hodně štěstí.
	B_LogEntry(TOPIC_ELVRIHMARRYGRITTA,"Přesvědčil jsem Elvricha, aby promluvil s Grittou.");
	ELVRIHAGREEMARRY = TRUE;
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		Npc_ExchangeRoutine(VLK_418_Gritta,"GoMarry");
		Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"GoMarry");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ELVRICH_ELVRICHGRITTADONE(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = dia_addon_elvrich_elvrichgrittadone_condition;
	information = dia_addon_elvrich_elvrichgrittadone_info;
	permanent = FALSE;
	description = "Promluvil sis s Grittou?";
};


func int dia_addon_elvrich_elvrichgrittadone_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_elvrichgrittadone_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_00");	//Promluvil sis s Grittou?
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_01");	//Ano! (nadšeně) Děkuji za radu! Teď jsem šťastný!
	AI_Output(other,self,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_02");	//Tak to jsem rád!
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_03");	//Díky!
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_04");	//Nikdy nezapomenu, co jsi pro mě udělal a proto ti chci poděkovat!
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_05");	//Pokud bys někdy potřeboval nějaké nové paklíče, neváhej a přijď za mnou.
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_06");	//Vždy ti jich pár dám, a to zcela zadarmo!
	ELVRICHGIVEKEYLOCK = TRUE;
};


instance DIA_ADDON_ELVRICH_DAILYRATION(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 3;
	condition = dia_addon_elvrich_dailyration_condition;
	information = dia_addon_elvrich_dailyration_info;
	permanent = TRUE;
	description = "Co takhle pár paklíčů?";
};


func int dia_addon_elvrich_dailyration_condition()
{
	if((ELVRICHGIVEKEYLOCK == TRUE) && (ELVRICHGIVEKEYLOCKTIMER != Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_dailyration_info()
{
	var int randkeylock;
	randkeylock = 1 + Hlp_Random(3);
	AI_Output(other,self,"DIA_Addon_Elvrich_DailyRation_01_01");	//Co takhle pár paklíčů?
	AI_Output(self,other,"DIA_Addon_Elvrich_DailyRation_01_02");	//Jasně, tady si vezmi...
	B_GiveInvItems(self,other,ItKE_lockpick,randkeylock);
	AI_Output(other,self,"DIA_Addon_Elvrich_DailyRation_01_03");	//Díky.
	ELVRICHGIVEKEYLOCKTIMER = Wld_GetDay();
};

