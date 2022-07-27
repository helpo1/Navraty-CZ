
instance DIA_Addon_Greg_NW_EXIT(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 999;
	condition = DIA_Addon_Greg_NW_EXIT_Condition;
	information = DIA_Addon_Greg_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToGregNW = TRUE;
};

instance DIA_Addon_Greg_NW_PICKPOCKET(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 900;
	condition = DIA_Addon_Greg_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Greg_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_NW_PICKPOCKET);
};

func void DIA_Addon_Greg_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_NW_PICKPOCKET);
};

instance DIA_Addon_Greg_NW_Hallo(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Hallo_Condition;
	information = DIA_Addon_Greg_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_Hallo_Condition()
{
	if(GregLocation == Greg_Farm1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Psst. Hej ty, pojď sem.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//Co se děje?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Na cestě do města? Něco důležitého?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//(culí se) Poslouchej. Připadáš mi jako chytrej kluk. Vsadím se, že ty to dotáhneš daleko.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Určitě se nedáš jen tak někým oblbnout. Takže na rovinu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Nechtěl by sis vydělat trochu zlata?
	PlayerTalkedToGregNW = TRUE;
	SC_MeetsGregTime = 1;
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Měl bych jít.",DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Dost kecání! Řekni mi co chceš.",DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Nevypadáš že máš nějaké zlato.",DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Schováváš se tady?",DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Proč ne?",DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Měl bych jít.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//(podrážděně) Takže mi nepomůžeš. To si budu pamatovat kámo. Ještě se uvidíme.
	AI_StopProcessInfos(self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Proč ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Musíš prominout starýmu nevzdělanýmu mořskýmu vlkovi. Jsem tu novej a neznám zákony téhle země.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Hořce jsem zjistil, že cestující z daleka nejsou v tomhle městě vítáni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//(žalostně) Teď jsem ale úplně ztracenej a nemůžu se dostat do města.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//Musím se zúčastnit velice důležitýho obchodu a moji společníci nepřijmou odklad dobře, jestli víš, co tím myslím.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Mohl bys mi pomoci dostat se přes tyhle městský stráže?
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Podivný chlap s páskou přes oko se chce dostat do města. Předpokládám, že bych ho měl dostat přes městské stráže.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_Running;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Nevypadáš že máš nějaké zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//(skromně) No určitě nemám známosti jako sir tvého formátu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Ale jistě neodmítneš malý příspěvek k svému obrovskému bohatství, že jo?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Tak co? Můžu se na tebe spolehnout?
};

func void DIA_Addon_Greg_NW_Hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//Dost kecání! Řekni mi co chceš...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Vidíš? To je přesně to je to, co mám na mysli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//Pár hezkých slovíček tě neohromí.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//Hned mi bylo jasné, že jsi tvrdý obchodník.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//A jelikož jsi obchodník, určitě se zajímáš o to, jak získat nějaké to zlato.
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Schováváš se tady?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Nikdy! Takovej nesmysl. Jen mám rád, když můžu být mezi stromy, aby mi nefučelo přímo do obličeje.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//Ale co ty? Chceš tu práci?
};


instance DIA_Addon_Greg_NW_Stadtwachen(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information = DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent = TRUE;
	description = "Ohledně stráží...";
};


func int DIA_Addon_Greg_NW_Stadtwachen_Condition()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//Ohledně stráží...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//No? Napadlo tě něco?
	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Ještě to promyslím.",DIA_Addon_Greg_NW_Stadtwachen_nochnicht);
	if(DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Zkusil jsi je uplatit?",DIA_Addon_Greg_NW_Stadtwachen_geld);
	};
	if((DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE) && Npc_HasItems(other,ItWr_Passierschein))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Mám propustku.",DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};
	if((MIS_Addon_Lester_PickForConstantino != 0) && (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Sběrači bylinek jsou pouštěni.",DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) || Npc_HasItems(other,ITAR_Bau_M))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"S těmihle farmářskými hadry tě tam pustí.",DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//S těmihle farmářskými hadry tě tam pustí.
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		B_GiveInvItems(other,self,ITAR_Bau_L,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITAR_Bau_M,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//To je ono. Věděl jsem, že se na tebe můžu spolehnout.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//(šklebí se) Nikdo mě nebude otravovat, když budu převlečenej za venkovskýho vidláka.
	if(Npc_HasItems(self,ITAR_Bau_L))
	{
		AI_EquipArmor(self,ITAR_Bau_L);
	}
	else
	{
		AI_EquipArmor(self,ITAR_Bau_M);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Výborně. A tady je tvá zasloužená odměna.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//(naštvaně) Cože? Zatracených padesát zlatek? To nemůžeš myslet vážně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//(blahosklonně) Zlato není vše, příteli. Prozatím si vem aspoň to.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//Ale mám pocit, že se nevidíme naposledy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//A kdo ví? Třeba ti to někdy oplatím. Opatruj se.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	B_LogEntry(TOPIC_Addon_Greg_NW,"Dal jsem mu farmářský oděv. S ním se do města dostane lehce.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//Ještě to budu muset promyslet.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//(vážně) Dobře, ale pohni si. Nemůžu ztrácet čas.
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwachen_Schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//Mám propustku.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(cynicky) Jasně, budu předstírat, že jsem občan, že?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//(pohoršeně) Podívej se na mě, chlapče. Tomu nikdo věřit nebude.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Sběrači bylinek jsou do města pouštěni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//(zaskočeně) Co? Vypadám snad, jako kdybych hopsal někde v lese a sbíral kytičky?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//Co třeba úplatek?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//(rozmarně) Kdyby mi to pomohlo, už bych to zkusil.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};


instance DIA_Addon_Greg_NW_PERM(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_PERM_Condition;
	information = DIA_Addon_Greg_NW_PERM_Info;
	permanent = TRUE;
	description = "Ještě jedna věc...";
};


func int DIA_Addon_Greg_NW_PERM_Condition()
{
	if(((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Ještě jedna věc...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//(arogantně) Poslouchej, chlapče. Mám teď něco hodně důležitýho na práci...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//(výhružně) Promluvíme si potom. Jasný?!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_MeetGregSecondTime(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information = DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Podívejme se!
	if(MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Venkovánek.
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Kluk, který mi nepomohl. Tak se znovu setkáváme, co?
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(naštvaně) Myslel jsem, že mi pomůžeš. Ale ty jsi místo toho prostě pláchnul.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//Myslel sis, že tam ztvrdnu navždy, co?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//Tady to máš. Pomoz si sám, protože nikdo jiný ti nepomůže. Znovu se z toho tak lehce nevyvlíkneš.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Přišel jsi právě včas.
	SC_SawGregInTaverne = TRUE;
};


instance DIA_Addon_Greg_NW_wer(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_wer_Condition;
	information = DIA_Addon_Greg_NW_wer_Info;
	description = "Kdo vlastně jsi?";
};


func int DIA_Addon_Greg_NW_wer_Condition()
{
	if(GregLocation >= Greg_Taverne)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//Kdo vlastně jsi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//To tě nemusí zajímat.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Kdybych ti chtěl říct, kdo jsem, už bych to udělal - jasný?
};


instance DIA_Addon_Greg_NW_was(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_was_Condition;
	information = DIA_Addon_Greg_NW_was_Info;
	description = "Co ode mě potřebuješ?";
};


func int DIA_Addon_Greg_NW_was_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Greg_Search_Dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Hledám jednoho chlápka. Nebyl ve městě a tihle opilci taky neví kde je.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Je vyzáblej, černovlasej a nosí červenou zbroj.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//Pokud vím, tak byl vězněm v trestanecké kolonii. Myslím, že jeho jméno začíná na 'D'.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Muž s páskou přes oko hledá někoho, jehož jméno začíná na 'D'.");
	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Co ode mě chceš?
	if(MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//Pořád máš problémy s městskou stráží?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(útočně) Ti ukážu problémy, ty pitomče.
	};
	B_Greg_Search_Dexter();
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Myslíš Diega?",DIA_Addon_Greg_NW_was_Diego);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"Nejmenuje se náhodou Dexter?",DIA_Addon_Greg_NW_was_Dexter);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nkdo mě nenapadá.",DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//Mohlo by to být jeho jméno. Nejsem si jistej.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//Budu si jistej, až ho uvidím.
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Ještě něco?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//(kysele) Jasně, ty hlupáku. Ještě něco.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Potřebuju zbraně. Potřebuju něco k jídlu. A zlato by taky bodlo.
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nemůžu ti pomoct.",DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Občerstvení? Jsi v hostinci!",DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Zbraně? Žoldáci mají zbraně.",DIA_Addon_Greg_NW_was_SLD);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Tady máš 10 zlatých.",DIA_Addon_Greg_NW_was_HierGold);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Ve městě jsi nenašel žádného obchodníka se zbraněmi?",DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Zlato? Všichni chceme zlato.",DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Nemůžu ti pomoct.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(rozlobeně) Tak nemůžeš, jo? Spíš nechceš.
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//To už je podruhé, cos mě nechal na holičkách.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//Dám ti dobrou radu: Ujisti se, že se nepotkáme znovu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Tak to si zapamatuju.
	};
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Zlato? Všichni chceme zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Možná. A co bys s ním dělal? Prochlastal ho, nebo ho utratil v bordelu.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//A TY máš snad lepší nápad?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//(naštvaně) Plazil by ses přede mnou pod šutrem, kdybys věděl, co všechno jsem už udělal.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Takže nebuď hňup, nebo ti budu muset zavřít hubu.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//Ve městě jsi nenašel žádného obchodníka se zbraněmi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//To snad nemyslíš vážně! Vždyť vše co tam měli, byl šrot.
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Tady máš 10 zlatých.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(směje se) Ty nešťastníku, nech si svou almužnu. Mám lepší plán.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Poblíž je jedna jeskyně, do které jsem ukryl pár věciček.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//Akorát tam není pro mě samotnýho bezpečno. Chci abys mi s tím pomohl.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Nabídl jsem muži s páskou přes oko pár zlaťáků, ale nechtěl je. Místo toho ho mám sledovat do jedné jeskyně.");
	MIS_Addon_Greg_RakeCave = LOG_Running;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Zbraně? Žoldáci mají zbraně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Zajímavé. Slyšel jsem, že ten velkostatkář jménem Onar najal pár chlapů.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//(směje se) Na suchozemskou krysu to není špatný.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//Dobrej nápad. Asi bych se tam měl porozhlídnout.
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Občerstvení? Jsi v hostinci!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Ten tupej barman mi nedá nic, pokud mu nezaplatím.
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Někdo mě napadá.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//Tak mluv.
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Není to Diego?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//Nejmenuje se Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};


instance DIA_Addon_Greg_NW_RakeCaveLos(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description = "Pojďme do té jeskyně.";
};


func int DIA_Addon_Greg_NW_RakeCaveLos_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Pojďme do té jeskyně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Následuj mě.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void B_Greg_GoNow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//(komanduje) Co tu tak stojíš? Běž dovnitř a dones mi ty věci.
};


instance DIA_Addon_Greg_NW_RakeCaveThere(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCaveThere_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Dobře, kamaráde. Tady je ta jeskyně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//A tady máš krumpáč.
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Zahrabal jsem je tam někde. Označil jsem to křížem.
	B_Greg_GoNow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//Co budeš dělat ty?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//Někdo ti musí hlídat záda. Tak běž.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Ten chlap chce, abych se v jeskyni porozhlédl po jeho věcech. Zahrabal je a místo označil křížem. Také mi dal krumpáč.");
	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay();
};


instance DIA_Addon_Greg_NW_RakeCavePlundered(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information = DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition()
{
	if(((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Co ti tak trvalo? Našel si to?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Ano, našel jsem váček s penězi.",DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Ne.",DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Ne.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//Snažíš se mě oškubat?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//(předstírá nevinu) Opravdu tam nic nebylo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Zatraceně. Věděl jsem, že ti supi to vykradou.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//No nic. Nic se neděje prcku. Musím jít, uvidíme se později.
	AI_StopProcessInfos(self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};


var int B_Greg_RakePlaceBriefing_OneTime;

func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Dobře. Další věci by měly být na malým ostrůvku na jezeře se dvěma vodopády.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//Další dvě místa jsou nahoře v pastvinách.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Jedno je za farmou a druhý je u průsmyku, vedle vodopádů.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//Od tam vedou schody k pozemku toho velkostatkáře... Onara.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//Pod schodama je poslední flek.
	if(B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW,"Jsou tady další poklady 1) na malém ostrůvku na jezeře se dvěma vodopády 2) nahoře v pastvinách za farmou 3) vedle vstupu do průsmyku u vodopádů. 4) pod schodama vedoucími z pastvin k velkostatkáři Onarovi.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Ano. Vykopal jsem měšec zlata.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(chamtivě) Dej to sem.
	if(Npc_HasItems(other,ItSe_GoldPocket25) || (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		if(B_GiveInvItems(other,self,ItSe_GoldPocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Tady ho máš.
		}
		else if(B_GiveInvItems(other,self,ItMi_Gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//Uvnitř bylo 25 zlatých. Na, vem si je.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Skvěle. Takže tu stále jsou.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//Nakonec nebudeš tak neschopnej.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Teď poslouchej. Zakopal jsem jich víc.
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//Počkám na tebe na křižovatce mezi poli toho velkostatkáře. Nezklam mě. Mohl bys toho litovat, jasný?
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//Už je nemám.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Nech toho. Nebo to z tebe mám snad vymlátit?
		AI_StopProcessInfos(self);
		MIS_Addon_Greg_RakeCave = LOG_FAILED;
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Addon_Greg_NW_LakeCave(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 100;
	condition = DIA_Addon_Greg_NW_LakeCave_Condition;
	information = DIA_Addon_Greg_NW_LakeCave_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_LakeCave_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (Greg_SuchWeiter == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_LakeCave_Info()
{
	B_Greg_GoNow();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_WhereTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information = DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent = TRUE;
	description = "Kdeže jsi ty věci ukryl?";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Kdeže jsi ty věci ukryl?
	B_Greg_RakePlaceBriefing();
};


instance DIA_Addon_Greg_NW_AllTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_AllTreasures_Condition;
	information = DIA_Addon_Greg_NW_AllTreasures_Info;
	permanent = FALSE;
	description = "Je to tvůj poklad?";
};

func int DIA_Addon_Greg_NW_AllTreasures_Condition()
{
	if(Greg_SuchWeiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_AllTreasures_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_AllTreasures_01_00");	//To jsou tvé věci?
	AI_Output(self,other,"DIA_Addon_Greg_NW_AllTreasures_01_01");	//Samozřejmě, že ne! Měl jsem hodně času nahrabat si na horší časy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_AllTreasures_01_02");	//Ale věř mi, o těhlech věcech je lepší nemluvit.
	AI_Output(other,self,"DIA_Addon_Greg_NW_AllTreasures_01_03");	//Proč?
	AI_Output(self,other,"DIA_Addon_Greg_NW_AllTreasures_01_04");	//Heh... (tajemně) Vzhledem k mé minulosti...
	AI_Output(other,self,"DIA_Addon_Greg_NW_AllTreasures_01_05");	//Ach, to určitě hodně vysvětluje.
};

instance DIA_Addon_Greg_NW_PermTaverne(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 99;
	condition = DIA_Addon_Greg_NW_PermTaverne_Condition;
	information = DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent = TRUE;
	description = "Ještě jedna věc...";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition()
{
	if(((GregLocation == Greg_Bigcross) && (Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_Addon_Greg_RakeCave == LOG_SUCCESS))) || ((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_PermTaverne_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Ještě jedna věc...
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Prvně mi sežeň ty věci, který jsem zakopal. Pak si můžeme promluvit.
	}
	else if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Děkuju ti, žes mi pomohl. Ale to z nás nedělá kámoše, jasný?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//Už jsme kecali dost.
	};
};


instance DIA_Addon_Greg_NW_Bigcross(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Bigcross_Condition;
	information = DIA_Addon_Greg_NW_Bigcross_Info;
	description = "Je vše v pořádku?";
};


func int DIA_Addon_Greg_NW_Bigcross_Condition()
{
	if((GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_Bigcross_Info()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED) || (MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Podívejte kdo to je, pan Nespolehlivý.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//Je vše v pořádku?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Jakž takž. Ti žoldáci mi moc nepomohli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//Očekával jsem, že budou mít aspoň něco.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Ale je to jen parta tupců a kecalů.
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//A co ty věci, které jsem zahrabal? Našel jsi je?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Ne, všechny ještě ne.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Tak si pospěš. Nemůže to být tak těžký.
		};
	};
};


instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information = DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description = "Cos od žoldáků vlastně chtěl?";
};


func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Cos od žoldáků vlastně chtěl?
	if(SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//Už jsem ti říkal, že hledám chlápka v červené zbroji.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Ale ti idioti neměli ponětí o kom mluvím.
	};
};


instance DIA_Addon_Greg_NW_DexterFound(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_DexterFound_Condition;
	information = DIA_Addon_Greg_NW_DexterFound_Info;
	description = "Myslím, že hledáš chlápka jménem Dexter.";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_DexterFound_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Myslím, že hledáš chlápka jménem Dexter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Zatraceně, jak mám asi vědět jak se jmenuje?
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Ale já jo.",DIA_Addon_Greg_NW_DexterFound_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Můžu ti pomoct ho najít.",DIA_Addon_Greg_NW_DexterFound_together);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Vím, kde ho můžeš najít.",DIA_Addon_Greg_NW_DexterFound_wo);
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//Ale já jo.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//Vím, kde ho můžeš najít.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//(překvapeně) Vážně? MLUV!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Je nedaleko odsud.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Zdá se, že je vůdcem nějaké tlupy banditů.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//(sarkasticky se směje) Ano, to bude on.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Věděl jsem, že je ten starej parchant někde tady zalezlej.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//Teď jen prolezu všechny krysí díry v okolí a najdu ho.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Najdu ho - a nepotřebuju k tomu tvou pomoc.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Možná bychom za ním mohli zajít společně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Pěkně ho srovnám. K tomu tě nepotřebuju.
};

instance DIA_Addon_Greg_NW_CaughtDexter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter_Info;
	important = TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(hlasitě) Kde je ta svině?!
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Kdo? Vůdce? Tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//(hlasitě) Tak se mi kliď z cesty.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};

instance DIA_Addon_Greg_NW_WodennNu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WodennNu_Condition;
	information = DIA_Addon_Greg_NW_WodennNu_Info;
	important = TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WodennNu_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//(naštvaně) Kam šel?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//Byl tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//(komanduje) Tak jdi a najdi ho!
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_NW_CaughtDexter2(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important = TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_DexterFound) && (DexterIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Hah. Dexter to má za sebou, co?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Vypadá to tak.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Prohledej ho, jestli něco nemá.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Addon_Greg_NW_RavensLetter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RavensLetter_Condition;
	information = DIA_Addon_Greg_NW_RavensLetter_Info;
	description = "Našel jsem u Dextera tenhle dopis.";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2) && Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon) && (DexterIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Našel jsem u Dextera tenhle dopis.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Ukaž mi to.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//Zatraceně, to mi vůbec nepomůže.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Neměl jsem ho nechat chcípnout aniž bych se ho na něco zeptal.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Ty asi nevíš jak přejít přes hory na severo-východě Khorinisu, že ne?

	if((Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE) && (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Možná skrz podzemní tunel. Mágové Vody zrovna studují jakýsi portál, který vede do severo-východních hor.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//(nevrle) Co je to za blbost?!
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//(vysmívá se) Heh, mágové Vody. Nemůžeš přijít s něčím lepším?
	};

	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Ne.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(povzdech) Takže jsem tu uvízl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter byl má poslední naděje.
};


instance DIA_Addon_Greg_NW_WasWillstDu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information = DIA_Addon_Greg_NW_WasWillstDu_Info;
	description = "Co jsi chtěl od Dextera?";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_RavensLetter))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//Co jsi chtěl od Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//Přišel jsem z poza hor na severo-východě ostrova. Chci se dostat zpátky.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Doufal jsem, že tenhle blb bude vědět, jak se tam dostat bez lodi.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Co je na druhé straně hor?",DIA_Addon_Greg_NW_WasWillstDu_da);

	if(Skip_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Potkal jsem piráta jménem Skip nedaleko přístavu.",DIA_Addon_Greg_NW_WasWillstDu_Skip);
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//Co je na druhé straně hor?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//Můžu ti doporučit snad jen to, abys tam nechodil.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Je to tam tvrdý. Slaboch jako ty by tam dlouho nepřežil.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//Potkal jsem piráta jménem Skip nedaleko přístavu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//Ten idiot. Čekal jsem tam tři dny. Proč tam přišel až teď?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Hned co se trochu zmátořím, dostane co proto.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Addon_Greg_NW_FoundTreasure(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information = DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent = TRUE;
	description = "Našel jsem ty věci, cos zakopal.";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Našel jsem ty věci, cos zakopal.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Pak bys měl mít asi sto zlaťáků, zlatý pohár, stříbrný kalich a amulet. Dej to sem!
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Nemám je u sebe.",DIA_Addon_Greg_NW_FoundTreasure_not);

	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_CupGold) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Tady to máš.",DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Tady to máš.

	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Měšec se sto zlatými.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//Sto zlatých.
	};
	if(B_GiveInvItems(other,self,ItMi_CupGold,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Zlatý pohár.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Stříbrný kalich.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//A amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Velmi dobře. Máš štěstí, že nejsi tak blbej, abys s tím utekl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Tady je tvůj podíl.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nemám je u sebe.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Tak pro to dojdi, než se naštvu.
	AI_StopProcessInfos(self);
};
