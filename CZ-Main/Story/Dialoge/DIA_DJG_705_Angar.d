
instance DIA_AngarDJG_EXIT(C_Info)
{
	npc = DJG_705_Angar;
	nr = 999;
	condition = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AngarDJG_HALLO(C_Info)
{
	npc = DJG_705_Angar;
	nr = 5;
	condition = DIA_AngarDJG_HALLO_Condition;
	information = DIA_AngarDJG_HALLO_Info;
	description = "Neznáme se?";
};


func int DIA_AngarDJG_HALLO_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Neznáme se? Ty jsi Cor Angar. Býval jsi templářem v táboře v bažinách.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//(rezignovaně) Říkej mi Angar. Ten titul už nepoužívám. Bratrstvo Spáče už neexistuje.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Zajímavé, ale vypadá to, jako bys mě už odněkud znal. Nějak si tě nemohu vybavit.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//Co to s tebou je?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//Ach, nebyl jsem jeden čas vůbec schopen usnout. Pořád jsem měl noční můry...

	if(MIS_Dragonhunter == LOG_Running)
	{
		B_LogEntry(TOPIC_Dragonhunter,"V Hornickém údolí jsem našel Angara.");
	};
};

func void B_SCTellsAngarAboutMadPsi()
{
	if(Angar_KnowsMadPsi == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//Bratrstvo Spáče si zotročilo zlo.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Tví dřívější přátelé z tábora v bažinách procházejí zemí v černých róbách a vypadají, že je vše, co se hýbe, neskutečně štve.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//O čem to mluvíš?
	};
};

func void B_SCTellsAngarAboutMadPsi2()
{
	if(Angar_KnowsMadPsi == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//Slouží nepříteli a nejsou ničím jiným než bezduchými válečníky zla.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//U všech bohů! Vědět to, nebyl bych tak zaslepeným. Už se to víckrát nestane, Přísahám.
		B_GivePlayerXP(XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};

func void b_sctellsangaraboutmadpsi3()
{
	AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_00");	//No, ale ne všechny to postihlo!
	AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_01");	//Jsou tu také ti, do nevstoupili k temným silám.

	if(HEROKNOWFORESTBASE == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_02");	//Tady v údolí jsem našel tábor vedený Baalem Netbekem, pamatuješ si na něj?
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_03");	//Také je tam hodně tvých bratří - například Gor Na Bar, tvůj žák.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_04_03");	//Gor Na Bar? Myslel jsem, že zemřel, když byl zaplaven starý důl!
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_04_04");	//Jsem rád, že přežil, to jsou dobré zprávy!
		B_GivePlayerXP(50);
	};
	if(MIS_KORANGAR == LOG_Running)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_04");	//Nedaleko průsmyku v Khorinisu je tábor Bratrstva - skupina přežívších, kteří si ještě zachovali zdravý rozum!
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_05");	//Vede je Baal Orun. Ten co byl dříve v bažinách.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_06");	//Bratrstvo Spáče stále existuje?
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_07");	//Ano, ale potřebují duchovního vůdce jako jsi ty!
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_08");	//Už více nevěří ve Spáče, ale potřebují někoho s kým budou mít stejnou sílu jako kdysi!
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_09");	//Baal Orun mě pověřil tvým nalezením - celé Bratrstvo tě potřebuje!
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_10");	//Ach... Být po tom všem zase v čele Bratrstva... Musím si to promyslet.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_11");	//Mysli rychle - tvý bratři zoufale potřebují svého vůdce.
		MIS_KORANGAR = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KORANGARMEET,LOG_SUCCESS);
		B_LogEntry(TOPIC_KORANGARMEET,"Řekl jsem Angarovi o táboře Bratrstva v Khorinisu u průsmyku. Angar byl silně překvapen! Řekl jsem mu, že Baal Orun ho potřebuje v táboře. Angar mi na to řekl, že si to promyslí.");
		B_GivePlayerXP(200);
	};
};


instance DIA_Angar_WIEKOMMSTDUHIERHER(C_Info)
{
	npc = DJG_705_Angar;
	nr = 6;
	condition = DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information = DIA_Angar_WIEKOMMSTDUHIERHER_Info;
	description = "Jak ses sem dostal?";
};


func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_AngarDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//Jak ses sem dostal?
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01A");	//Po pádě bariéry jsem se schoval v horách. Pak jsem došel tady do lesa.
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01B");	//A kvůli nočním můrám a bolesti hlavy jsem se schoval na tomhle místě.
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01C");	//Nicméně tu není bezpečno, takže pravděpodobně brzy zase půjdu.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01D");	//Poté, co zanikla bariéra, jsem se ukryl v horách. Pak bylo načase, abych začal něco dělat.
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01E");	//Bloudil jsem několik dní a pak jsem se náhle objevil na tomhle hradě. Neptej se mě, co se stalo. Já to nevím.
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//A jako by toho bylo málo, ještě jsem ztratil amulet, který jsem měl už dlouhá léta. Nejspíš se zblázním, když se mi ho nepodaří znovu nalézt.
	Log_CreateTopic(TOPIC_AngarsAmulett,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett,LOG_Running);
	B_LogEntry(TOPIC_AngarsAmulett,"Angar ztratil svůj amulet a teď se ho zoufale snaží najít.");
	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,Dialog_Back,DIA_Angar_WIEKOMMSTDUHIERHER_gehen);
	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"Kde přesně jsi ten amulet ztratil?",DIA_Angar_WIEKOMMSTDUHIERHER_amulett);
	if(SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"Bratrstvo Spáče si zotročilo zlo.",DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	}
	else
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"Co se stalo s ostatníma z tábora v bažinách?",DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	};
	if(DJG_Angar_SentToStones == FALSE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER,"Co budeš dělat dál?",DIA_Angar_WIEKOMMSTDUHIERHER_nun);
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//Kde přesně jsi ten amulet ztratil?

	if(DJG_Angar_SentToStones == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//Někde na jihu, krátce předtím, než jsem se objevil tady na hradě.
		B_LogEntry(TOPIC_AngarsAmulett,"Amulet by měl ležet kdesi na jihu. Angar se po něm jde podívat.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//Někde musí být.
		B_LogEntry(TOPIC_AngarsAmulett,"Amulet se nachází u kamenné hrobky na jihu Hornického údolí.");
	};

	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//Bojím se, že ho někdo ukradl. Musím ho za každou cenu dostat zpátky.
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere()
{
	if(SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//Co se stalo s ostatníma z tábora v bažinách?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//Poslední věc, na kterou si pamatuju, bylo zničení bariéry a nervy drásající jekot, který ho doprovázel.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//V panické hrůze jsme se vrhli k zemi a svíjeli se bolestí. Ten zvuk... Pořád sílil.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//A pak, když bylo po všem, se všichni zbláznili a s hlasitým řevem zmizeli ve tmě.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//Od té doby sem je neviděl.
	if(SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2();
	};
	if((MIS_KORANGAR == LOG_Running) || (HEROKNOWFORESTBASE == TRUE))
	{
		b_sctellsangaraboutmadpsi3();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//Co budeš dělat dál?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//Nejdřív si budu muset trochu odpočinout, abych mohl začít hledat svůj ztracený amulet.
	if(Kapitel >= 4)
	{
		if(MIS_KORANGAR == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_05");	//Pak... Možná bych se mohl vrátit do Bratrstva?
			AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_06");	//Průběhem let v kolonii to byl můj jediný domov domov - a já ho měl rád...
			AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_07");	//Nikdy bych ho za nic nevyměnil.
		}
		else
		{
			AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//Zaslechl jsem něco o dracích.
			AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//Také se povídá, že se do Hornického údolí vydalo mnoho válečníků na jejich lov.
			AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//Uvažuju o tom, že bych se k nim přidal.
		};
	};
	Angar_willDJGwerden = TRUE;
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen()
{
	Info_ClearChoices(DIA_Angar_WIEKOMMSTDUHIERHER);
};


instance DIA_Angar_SCTellsAngarAboutMadPsi2(C_Info)
{
	npc = DJG_705_Angar;
	nr = 7;
	condition = DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information = DIA_Angar_SCTellsAngarAboutMadPsi2_Info;
	description = "Bratrstvo Spáče si zotročilo zlo.";
};


func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition()
{
	if((SC_KnowsMadPsi == TRUE) && (Angar_KnowsMadPsi == FALSE) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};


instance DIA_Angar_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar;
	nr = 7;
	condition = DIA_Angar_FOUNDAMULETT_Condition;
	information = DIA_Angar_FOUNDAMULETT_Info;
	description = "Našel jsem tvůj amulet.";
};


func int DIA_Angar_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER))
	{
		return TRUE;
	};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//Našel jsem tvůj amulet.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//Díky. Myslel jsem, že už ho nikdy neuvidím.
	B_GiveInvItems(other,self,ItAm_Mana_Angar_MIS,1);
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP(XP_AngarDJGUndeadMage);
};

func void DIA_Angar_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
	Info_AddChoice(DIA_Angar_FOUNDAMULETT,"Proč je pro tebe tak důležitý?",DIA_Angar_FOUNDAMULETT_besonders);
	Info_AddChoice(DIA_Angar_FOUNDAMULETT,"Co budeš dělat teď?",DIA_Angar_FOUNDAMULETT_nun);
};

func void DIA_Angar_FOUNDAMULETT_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//Proč je pro tebe tak důležitý?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//Byl to dárek.
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Aha.
};

func void DIA_Angar_FOUNDAMULETT_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//Co budeš dělat teď?
	if(MIS_KORANGAR == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_03");	//Prostě jsem se rozhodl že se vrátím ke svým bratrům. Neopustím je v tak těžkých časech.
		AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_04");	//Možná se ještě někdy setkáme. Sbohem.
		ANGARISBACK = TRUE;
		AI_StopProcessInfos(self);
		if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
		{
			Npc_ExchangeRoutine(self,"LeavingOW");
		};
	}
	else
	{
		ANGARISNOBACK = TRUE;
		AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Vypadnu z tohodle zatracenýho údolí.
		AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Možná se ještě někdy setkáme. Sbohem.
		AI_StopProcessInfos(self);
		if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
		{
			Npc_ExchangeRoutine(self,"LeavingOW");
		};
	};
};


instance DIA_Angar_DJG_ANWERBEN(C_Info)
{
	npc = DJG_705_Angar;
	nr = 8;
	condition = DIA_Angar_DJG_ANWERBEN_Condition;
	information = DIA_Angar_DJG_ANWERBEN_Info;
	description = "Možná bych ti mohl pomoct s nalezením toho amuletu.";
};


func int DIA_Angar_DJG_ANWERBEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DJG_ANWERBEN_Info()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Možná bych ti mohl pomoct s nalezením toho amuletu.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Proč ne. Trocha pomoci nemůže škodit.
	if(DJG_Angar_SentToStones == FALSE)
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Už musím jít.",DIA_Angar_DJG_ANWERBEN_gehen);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Kam chceš vyrazit?",DIA_Angar_DJG_ANWERBEN_wo);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Kdy půjdeš?",DIA_Angar_DJG_ANWERBEN_wann);
	};
	if((Angar_willDJGwerden == TRUE) && (Kapitel >= 4))
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN,"Co ti drakobijci?",DIA_Angar_DJG_ANWERBEN_DJG);
	};
};

func void DIA_Angar_DJG_ANWERBEN_DJG()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//Co ti drakobijci?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//Promluvím si s nimi později. Možná se jim moje silné paže budou hodit.
};

func void DIA_Angar_DJG_ANWERBEN_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//Kdy půjdeš?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//Jakmile mi bude líp.
};

func void DIA_Angar_DJG_ANWERBEN_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//Kam chceš vyrazit?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//Měl bych se vydat na jih, tam, co jsem byl naposled.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//Je tam jeskynní hrob obklopený balvany.
};

func void DIA_Angar_DJG_ANWERBEN_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//Už musím jít.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Buď opatrný.
	AI_StopProcessInfos(self);
};


instance DIA_AngarDJG_WASMACHSTDU(C_Info)
{
	npc = DJG_705_Angar;
	nr = 9;
	condition = DIA_AngarDJG_WASMACHSTDU_Condition;
	information = DIA_AngarDJG_WASMACHSTDU_Info;
	description = "Něco je špatně?";
};


func int DIA_AngarDJG_WASMACHSTDU_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,DIA_Angar_DJG_ANWERBEN) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//Něco je špatně?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//Slyšels to? Ještě nikdy jsem v celém svém životě neslyšel tak příšerný zvuk!
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//Co myslíš? Neslyšel jsem ani hlásku!
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//Celá tahle oblast páchne smrtí a zkázou. Ta zahnívající stvoření hlídají skalní přístup do krypty, tam před námi.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//Skrývá se tam něco příšerného a vysílá to své nohsledy na povrch země.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//Jsem si téměř jistý, že jsem ten amulet ztratil někde tady.
	if((Angar_willDJGwerden == TRUE) && (MIS_KORANGAR != LOG_SUCCESS))
	{
		Info_AddChoice(DIA_AngarDJG_WASMACHSTDU,"Mluvil jsi s drakobijci?",DIA_AngarDJG_WASMACHSTDU_DJG);
	};
};

func void DIA_AngarDJG_WASMACHSTDU_DJG()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Mluvil jsi s drakobijci?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Ano. Ale očekával jsem společenstvo podobné tomu, co jsme měli v táboře v bažinách.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//Ti chlapi ale nejsou nic víc než jen divoká nesourodá sbírka naprostých pitomců. To není nic pro mě.
};


instance DIA_AngarDJG_WHATSINTHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 10;
	condition = DIA_AngarDJG_WHATSINTHERE_Condition;
	information = DIA_AngarDJG_WHATSINTHERE_Info;
	description = "Co se skrývá v té jeskyni ve skalách?";
};


func int DIA_AngarDJG_WHATSINTHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_AngarDJG_WASMACHSTDU) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WHATSINTHERE_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//Co se skrývá v té jeskyni ve skalách?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//Něco mi nechce dovolit se k té jeskyni přiblížit!
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//Střeží ji magická stvoření. Viděl jsem je v noci, jak prohledávají okolí. Nechutnost sama.
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//Obrátili se nazpět a zmizeli mezi stromy. A tys měl pocit, jako by vysáli všechen život z okolí jako houba vysává vodu.
	B_LogEntry(TOPIC_Dragonhunter,"Našel jsem Angara v Hornickém údolí.");
};


instance DIA_AngarDJG_WANTTOGOINTHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 11;
	condition = DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information = DIA_AngarDJG_WANTTOGOINTHERE_Info;
	description = "Jdeme společně.";
};


func int DIA_AngarDJG_WANTTOGOINTHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_AngarDJG_WHATSINTHERE) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info()
{
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//Jdeme společně.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//Zkusím to. Ale buď opatrný.
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_AngarAngriff = TRUE;
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_AngarDJG_UndeadMageDead(C_Info)
{
	npc = DJG_705_Angar;
	nr = 13;
	condition = DIA_AngarDJG_UndeadMageDead_Condition;
	information = DIA_AngarDJG_UndeadMageDead_Info;
	important = TRUE;
};


func int DIA_AngarDJG_UndeadMageDead_Condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_AngarAngriff == TRUE) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UndeadMageDead_Info()
{
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//(křičí) Jenom smrt a zkáza. Musím se odsud dostat.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_AngarDJG_UNDEADMAGECOMES(C_Info)
{
	npc = DJG_705_Angar;
	nr = 13;
	condition = DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information = DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important = TRUE;
};


func int DIA_AngarDJG_UNDEADMAGECOMES_Condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,DIA_AngarDJG_WANTTOGOINTHERE) && (Npc_KnowsInfo(other,DIA_AngarDJG_UndeadMageDead) == FALSE) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info()
{
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//(šeptá) Tady to je! Slyšels to?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_Angar_WASISTLOS(C_Info)
{
	npc = DJG_705_Angar;
	nr = 14;
	condition = DIA_Angar_WASISTLOS_Condition;
	information = DIA_Angar_WASISTLOS_Info;
	description = "Co se děje?";
};


func int DIA_Angar_WASISTLOS_Condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_Angar_WASISTLOS_Info()
{
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//Co se děje?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//Dál už s tebou jít nemůžu.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//Něco mi říká, že se odsud živý nedostanu.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//Nedokážu to vysvětlit, ale...
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//Měl bych se z týhle zpropadený země dostat co nejrychlejš. Jinak mě potká stejný osud jako mé bratry.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Pokaždý, když narazím na tyhle... zplozence pekel, mám pocit, jako bych bojoval proti vlastním lidem.
	};
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Dragonhunter,"Angar prostě odešel. Při boji se všemi těmi nemrtvými měl pocit, jako by bojoval s vlastními druhy.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_Angar_WHYAREYOUHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 15;
	condition = DIA_Angar_WHYAREYOUHERE_Condition;
	information = DIA_Angar_WHYAREYOUHERE_Info;
	description = "Angare! Co tady děláš?";
};


func int DIA_Angar_WHYAREYOUHERE_Condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Angar_WHYAREYOUHERE_Info()
{
	AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");	//Angare! Co tady děláš?
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//Byl jsem na cestě k průsmyku, když jsem narazil na skřety. Nedokázal jsem ty bezbožný barbary setřást.
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//Zatím tady počkám a pak projdu průsmykem. Uvidíme se na druhé straně!
	B_LogEntry(TOPIC_Dragonhunter,"Opět jsem se potkal s Angarem. Ještě pořád zůstává v Hornickém údolí.");
	B_GivePlayerXP(XP_AngarDJGAgain);
	AI_StopProcessInfos(self);
};


instance DIA_Angar_PERMKAP4(C_Info)
{
	npc = DJG_705_Angar;
	condition = DIA_Angar_PERMKAP4_Condition;
	information = DIA_Angar_PERMKAP4_Info;
	permanent = TRUE;
	description = "Vážně tě můžu nechat samotného?";
};


func int DIA_Angar_PERMKAP4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Angar_WHYAREYOUHERE))
	{
		return TRUE;
	};
};

func void DIA_Angar_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//Vážně tě můžu nechat samotného?
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Jasně. Jdi. Uvidíme se.
	AI_StopProcessInfos(self);
};


instance DIA_Angar_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar;
	nr = 900;
	condition = DIA_Angar_PICKPOCKET_Condition;
	information = DIA_Angar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_PICKPOCKET_Condition()
{
	return C_Beklauen(47,55);
};

func void DIA_Angar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
	Info_AddChoice(DIA_Angar_PICKPOCKET,Dialog_Back,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

