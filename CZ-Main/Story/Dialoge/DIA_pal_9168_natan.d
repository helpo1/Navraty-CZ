/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(5x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_PAL_9168_NATAN_EXIT(C_Info)
{
	npc = pal_9168_natan;
	nr = 999;
	condition = dia_pal_9168_natan_exit_condition;
	information = dia_pal_9168_natan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9168_natan_exit_condition()
{
	return TRUE;
};

func void dia_pal_9168_natan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9168_NATAN_PICKPOCKET(C_Info)
{
	npc = pal_9168_natan;
	nr = 900;
	condition = dia_pal_9168_natan_pickpocket_condition;
	information = dia_pal_9168_natan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9168_natan_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9168_natan_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
	Info_AddChoice(dia_pal_9168_natan_pickpocket,Dialog_Back,dia_pal_9168_natan_pickpocket_back);
	Info_AddChoice(dia_pal_9168_natan_pickpocket,DIALOG_PICKPOCKET,dia_pal_9168_natan_pickpocket_doit);
};

func void dia_pal_9168_natan_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
};

func void dia_pal_9168_natan_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
};


instance DIA_PAL_9168_NATAN_RESCUEGAROND(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_rescuegarond_condition;
	information = dia_pal_9168_natan_rescuegarond_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9168_natan_rescuegarond_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (ALLAWAYFROMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_rescuegarond_info()
{
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_01");	//STÁT!... Jeden krok zpět!
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_03");	//Protože dle postavení skřetů se k něčemu chystají!
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_04");	//A pokud nechceš spáchat sebevraždu, věř mi a raději zůstaň zde.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_05");	//Já tě neznám... (Agresivně) Kdo jsi, jak ses sem dostal a co tu děláš?!
	MEETNATAN = TRUE;
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
	if((MIS_RESCUEGAROND == LOG_Running) || (MIS_RESCUEGAROND == LOG_SUCCESS))
	{
		Info_AddChoice(dia_pal_9168_natan_rescuegarond,"Jsem zde z rozkazu lorda Hagena.",dia_pal_9168_natan_rescuegarond_hagen);
	}
	else
	{
		Info_AddChoice(dia_pal_9168_natan_rescuegarond,"A ty to nepoznáš?",dia_pal_9168_natan_rescuegarond_cantsee);
	};
};

func void dia_pal_9168_natan_rescuegarond_cantsee()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_01");	//A ty to nepoznáš?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_02");	//Samozřejmě, nejsem slepý... (s úctou) Také vidím, že jsi paladin!
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_03");	//Samozřejmě, nejsem slepý... (lehkomyslně) Také vidím, že sloužíš v domobraně!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_04");	//Samozřejmě, nejsem slepý... (pádně) Také vidím, že jsi mágem Ohně!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_05");	//Samozřejmě, nejsem slepý... (pádně) Také vidím, že jsi mágem Vody!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_06");	//Samozřejmě, nejsem slepý... (nepřátelsky) Také vidím, že jsi temným mágem!
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_07");	//Samozřejmě, nejsem slepý... (hrozivě) Také vidím, že jsi žoldák!
	}
	else if((other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_08");	//Samozřejmě, nejsem slepý... (lhostejně) vidím, že patříš ke skupině sektářů!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_09");	//Samozřejmě, nejsem slepý... Vypadáš jako nějakej vagabund!
	};
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_10");	//Nezapomněl jsi na moji další otázku?! Nebo nevíš, že jsou v údolí skřeti?
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_12");	//No dobrá příteli... (udiveně) Jen někdo tak praštěnej sem může jít dobrovolně!
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_13");	//Pořád mě to někdo říká, ale jak vidíš jsem pořád naživu.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_14");	//No dobrá... (lhostejně) Nebudu se s tebou hádat! Je tvoje soukromá záležitost, jak se odpravit.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_15");	//Ale stejně si myslím, že by tě byla škoda, protože je nás na obranu málo.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_16");	//Ve skutečnosti jsme totiž odřízlí od lidských posil hordou skřetů.
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
};

func void dia_pal_9168_natan_rescuegarond_hagen()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_01");	//Jsem zde z rozkazu lorda Hagena.
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_02");	//Mám zjistit situaci v Hornickém údolí.
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_03");	//A nejdůležitější paladin na ostrově chce vědět, co je s jeho lidmi!
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_04");	//Takže tebe poslal lord Hagen?! Hmmm... (zamyšleně) Pak je mi vše jasné.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_05");	//I já jsem zde z jeho rozkazu!
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
};


instance DIA_PAL_9168_NATAN_WHOYOU(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_whoyou_condition;
	information = dia_pal_9168_natan_whoyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_pal_9168_natan_whoyou_condition()
{
	if(MIS_ORCGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_whoyou_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_02");	//Jmenuji se Nathan. A jak můžeš vidět jsem paladin, zodpovědný pouze lordu Hagenu, našemu králi a Innosovi!
	if(Npc_KnowsInfo(other,dia_pal_2000_hagen_rescuegarondothers))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_03");	//Ach ano. Lord Hagen mi o tobě řekl.
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_04");	//Jsi jeden z těch, kteří se dobrovolně přihlásili na tuto výpravu?
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_10");	//Jsem zde za paladina Udara
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_13");	//Před několika lety mě zachránil život v jedné z ledových pustin Nordmaru na misi pro krále.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_14");	//Složil jsem posvátný slib Innosovi, že mu to oplatím.
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_15");	//Takže ti zachránil život? Jak k tomu došlo?!
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_16");	//Byli jsme posláni do jednoho údolí, kde žije muž, který pro království vyrábí výbušné šípy, při vstupu do jednoho údolí nás obklíčili skřeti...(pamatuju) ty svině byli všude.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_21");	//Když pomalu bylo jasné, že skřetů je příliš mnoho, najednou kolem mě padli dva skřeti a z prsou jim trčela šipka do kuše.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_22");	//A pak se Udar s mečem vrhl mezi nepřátele kolem mě a zuřivě máchal kolem sebe, abych se stihl zvednout ze země... (s úžasem)
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_25");	//A my jsme využili příležitost!... Naše skupina unikla, i když se zančnými ztrátami.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_26");	//Poté, když jsme začli utíkat pryč, skřeti nás sledovali.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_27");	//... ale jedna ze střel skřetů mě strefila do nohy! Spadnul jsem jak podťatej.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_28");	//Udar to viděl a přispěchal mi na pomoc bez ohledu na to, že už se blížili skřeti co nás pronásledovali.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_29");	//Zvednul mě a pomohl mi utíkat dál.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_30");	//Proto mu teď vděčím za můj život.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_31");	//Proto jsem tady, abych mu to mohl zplatit.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_32");	//Doufám, že mu to splatím.
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_33");	//Hmm... pěkná historka. Nevěděl jsem že je něčeho takového schopen.
		if(!Npc_IsDead(PAL_268_Udar))
		{
			MIS_NATANDOLG = LOG_Running;
			Log_CreateTopic(TOPIC_NATANDOLG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_NATANDOLG,LOG_Running);
			B_LogEntry(TOPIC_NATANDOLG,"Paladin Nathan mi řekl o tom, jak mu Udar zachránil život, proto se dobrovolně přihlásil do expedice lorda Hagena.");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_36");	//No, už to chápu.
	};
};


instance DIA_PAL_9168_NATAN_ZAMOK(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_zamok_condition;
	information = dia_pal_9168_natan_zamok_info;
	permanent = FALSE;
	description = "Proč nejsi v pevnosti?";
};


func int dia_pal_9168_natan_zamok_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (CASTLEISDOWN == FALSE) && (KNOWABOUTGAROND == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_zamok_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_01");	//Proč nejsi v pevnosti?
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_02");	//Kvůli skřetům příteli! Před několika dny se pokusili o další útok a tentokrát se jim to podařilo.
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_03");	//Takže hrad padl?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_04");	//Bohužel ano... (smutně) jak jsme to mohli dopustit...
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_05");	//To nejsou dobré zprávy. Co je s Garondem a jeho lidmi?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_06");	//Přesně nevím, ale s největší pravděpodobností padli. Bylo by hloupé spoléhat na to, že by je skřeti ušetřili, a jestli ano, tak budou přežívší trpět ještě více!
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_07");	//Myslím, že by bylo dobré to zjistit.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_08");	//Opravdu?! Hmm... (udiveně) A jak to chceš udělat? Jít tam a požádat skřety?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_09");	//Rozřezali by tě na kusi, ještě než by ses dostal k pevnosti!
	CASTLEISDOWN = TRUE;
	NATATELLZAMOK = TRUE;
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry(TOPIC_RESCUEGAROND,"Zdá se, že Pevnost v Hornickém údolí padla! Skřeti ji obsadili a není jisté, jestli někdo přežil.");
	};
	Info_ClearChoices(dia_pal_9168_natan_zamok);
	Info_AddChoice(dia_pal_9168_natan_zamok,"Tak to nějak zkusím!",dia_pal_9168_natan_zamok_ulumulu);
	Info_AddChoice(dia_pal_9168_natan_zamok,"Pak tedy musíme dobít pevnost zpět!",dia_pal_9168_natan_zamok_noway);
};

func void dia_pal_9168_natan_zamok_ulumulu()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_UluMulu_01_01");	//Tak to nějak zkusím!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_UluMulu_01_04");	//Hmmm... (udiveně) No dobrá! Pkud jseš si jistý, pokračuj.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_UluMulu_01_05");	//Je pravda, že to není nejjistější!
	MIS_NEWSSURVIVERS = LOG_Running;
	Log_CreateTopic(TOPIC_NEWSSURVIVERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_Running);
	B_LogEntry(TOPIC_NEWSSURVIVERS,"Nedaleko zámku v údolí jsem potkal malou skupinku paladinů. Vede je paladin Nathan. Řekl mi, že pevnost v údolí padla a není jisté, jestli někdo přežil!");
	Log_AddEntry(TOPIC_NEWSSURVIVERS,"Nathan si myslí, že všichni obránci padli, ale měl bych se tam jít podívat, jestli to je pravda.");
	AI_StopProcessInfos(self);
};

func void dia_pal_9168_natan_zamok_noway()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_01");	//Pak musíme dobít pevnost zpět!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_02");	//Hmm... (zamyšleně) Dobrý nápad! Abych řekl pravdu, už jsem o tom přemýšlel.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_03");	//Nicméně nás není dost, abychom bojovali proti celé armádě skřetů.
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_06");	//A co máš na mysli?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_07");	//Hmmm... (zamyšleně) Slyšel jsem, že v údolí je skupinka drakobijců.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_08");	//Myslím, že společně bychom proti skřetům měli větší šanci!
	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(DRGHUNTER01ISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_17");	//Dobře to dopadne věř mi.
			AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_18");	//Jejich vůdce je mrtev a bez něj toho moc nezmůžou.
			AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_19");	//A odkud to víš?!
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_09");	//Obávám se, že všichni jsou už mrtví
			AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_10");	//A jak to víš?!
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_11");	//Věř mi, je to tak!. Tak co, budem bojovat bez nich!
		AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_12");	//Ano,škoda...(rozrušený)budeme simuset poct sami.
		AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_13");	//Myslím, že bychom měli začít s útokem! Dej vědět až budeš připravený.
		AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_14");	//Dobře.
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Nedaleko hradu v údolí jsem potkal skupinu paladinů. Vede je paladin Nathan. Řekl mi, že pevnost padla a neví, jestli někdo přežil. Měl bych to zjistit.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Nejlepší způsob, jak vše zjistit bude dobít pevnost zpět. V údolí je skupina drakobijců, se kterou by to bylo jednodušší, ale řekl jsem Nathanovi, že jsou po smrti a musíme hrad dobít sami.");
		Info_ClearChoices(dia_pal_9168_natan_zamok);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_15");	//Tak jo, pokusím se je najít. Pokud to skřeti neudělali přede mnou!
		AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_16");	//Dobrá, počkáme zde na tebe.
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Nedaleko hradu v údolí jsem potkal skupinu paladinů. Vede je paladin Nathan. Řekl mi, že pevnost padla a neví, jestli někdo přežil. Měl bych to zjistit.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Nejlepší způsob, jak vše zjistit bude dobít pevnost zpět. V údolí je skupina drakobijců, se kterou by to bylo jednodušší, měl bych se po nich podívat a přesvěčit je, aby se k nám přidali.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERS(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurvivers_condition;
	information = dia_pal_9168_natan_newssurvivers_info;
	permanent = FALSE;
	description = "Byl jsem v pevnosti.";
};


func int dia_pal_9168_natan_newssurvivers_condition()
{
	if((KNOWABOUTGAROND == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOK == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurvivers_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_01");	//Byl jsem v pevnosti.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_02");	//Opravdu?!...(napjatě)A co jsi zjistil?!
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_03");	//Garond s pár paladinama jsou naživu.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_07");	//Nejdříve bychom měli osvobodit Garonda a jeho muže!
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_08");	//Nevíme, jak dlouho je ty kreatury budou potřebovat.
	if((MIS_NATANDOLG == LOG_Running) && (UDARKNOWSNATAN == TRUE))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_10");	//Mimochodem, mezi paladiny které skřeti vězní je i váš přítel Udar! On také padl do zajetí.
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_11");	//Udar je v pevnosti?! Jo! Takže ho ještě mohu zachránit.
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_12");	//Prokletí skřeti!... (rozlobeně)Tak jednoduše je z toho vyjít nenechám.
		AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_13");	//Myslím, že máš šanci zplatit Udarovi dluh.
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_14");	//Bez pochyby! Při první šanci to udělám.
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_15");	//Díky, že jsi mi to řekl. Teď mě nic nezastaví na cestě k pevnosti!
		B_LogEntry(TOPIC_NATANDOLG,"Jak Nathan slyšel, že Udar žije, rozhodl se zaútočit. Zdá se, že teď ho nezastaví ani celá armáda!");
	}
	else
	{
		B_GivePlayerXP(100);
	};
	KNOWSITUATIONCASTLE = TRUE;
};


instance DIA_PAL_9168_NATAN_ZAMOKKNOWN(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_zamokknown_condition;
	information = dia_pal_9168_natan_zamokknown_info;
	permanent = FALSE;
	description = "Proč jste tady?!";
};


func int dia_pal_9168_natan_zamokknown_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_zamokknown_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_01");	//Jaká je situace?
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_02");	//Před několika dny, skřeti znovu zaútočil na hrad, a tentokrát se jim to podařilo.
	if(KNOWABOUTGAROND == TRUE)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_04");	//Co?!... (napjatě) Ty jsi tam byl? A co jsi zjistil?
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_05");	//Garond a pár paladinů jsou naživu.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_09");	//Musíme co nejdříve zachránit Garonda a jeho lidi.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_10");	//Nevíme, jak dlouho je ty kreatury budou potřebovat.
		KNOWSITUATIONCASTLE = TRUE;
		if(Npc_KnowsInfo(other,dia_orc_8566_urhan_paladincost))
		{
			if(BOGNARREFUSETALK == TRUE)
			{
				Info_ClearChoices(dia_pal_9168_natan_zamokknown);
				Info_AddChoice(dia_pal_9168_natan_zamokknown,"Je nezbytné zkusit dobít pevnost zpět!",dia_pal_9168_natan_zamokknown_noway);
			}
			else
			{
				AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_11");	//Souhlasím! Musíme si pospíšit.
			};
		}
		else
		{
			Info_ClearChoices(dia_pal_9168_natan_zamokknown);
			Info_AddChoice(dia_pal_9168_natan_zamokknown,"Souhlasím! Musíme si pospíšit.",dia_pal_9168_natan_zamokknown_ulumulu);
			Info_AddChoice(dia_pal_9168_natan_zamokknown,"Musíme se snažit získat hrad zpět!",dia_pal_9168_natan_zamokknown_noway);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_12");	//Co?! (netrpělivě) Byl jsi tam?! Někdo přežil?!
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_13");	//Nevím, ale měli bychom to zjistit.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_14");	//Hmmm... A jak to chceš udělat?!
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_15");	//Rozsekají tě na kusy ještě než se dostaneš k pevnosti!
		NATATELLZAMOKTWO = TRUE;
		Info_ClearChoices(dia_pal_9168_natan_zamokknown);
		Info_AddChoice(dia_pal_9168_natan_zamokknown,"Nech to na mě!.",dia_pal_9168_natan_zamokknown_ulumulu);
		Info_AddChoice(dia_pal_9168_natan_zamokknown,"Musíme pevnost dobít zpět!",dia_pal_9168_natan_zamokknown_noway);
	};
};

func void dia_pal_9168_natan_zamokknown_ulumulu()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_01");	//Nech to na mě!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_04");	//Hmm... (udiveně) Dobrá, tak jo! Dělej co myslíš.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_05");	//Nemyslím si, že se ti to povede...
	MIS_NEWSSURVIVERS = LOG_Running;
	Log_CreateTopic(TOPIC_NEWSSURVIVERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_Running);
	B_LogEntry(TOPIC_NEWSSURVIVERS,"Neddaleko od průchodu do Hornického údolí jsem potkal nevelkou skupinu paladinů vedenou paladinem Nathanem. Řekl mi, že pevnost padla.");
	Log_AddEntry(TOPIC_NEWSSURVIVERS,"Nathan si myslí, že všichni obránci padli. Měl bych to prověřit.");
	AI_StopProcessInfos(self);
};

func void dia_pal_9168_natan_zamokknown_noway()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_01");	//Musíme ji dobít zpět!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_02");	//Hmm... (zymyšleně) Dobrý nápad, taky jsem na to pomyslel.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_03");	//Nicméně nás není dost, abychom porazili armádu skřetů.
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_06");	//A co navrhuješ?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_07");	//Hmm... (zamyšleně) Slyšel jsem, že v údolí jsou drakobijci.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_08");	//Myslím, že kdyby se k nám přidali, měli bychom daleko větší šanci na vítězství.
	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_09");	//Obávám se, že už jsou všichni mrtví.
			AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_10");	//Ale jak to víš?!
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_11");	//Snad to dobře dopadne.
			AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_12");	//Jejich vůdce je mrtvý. A bez něj je to jen banda neschopných slabochů. Takže asi nic.
			AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_13");	//Jak to víš?!
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_14");	//Věř mi, je to tak, takže je třeba bojovat bez nich!
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_15");	//Ano, škoda... Dobrá, připravte se na útok.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_16");	//Myslím, že je nejvhodnější doba na útok. Dej vědět, až budeš připravenej.
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_17");	//Dobře.
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Nedaleko od průchodu do Hornického údolí jsem potkal malou skupinu paladinů. Vede je jistý Nathan. Řekl mi, že skřeti podnikli další útok na hrad a ten padl. Nathan věří, že všichni obránci hradu jsou mrtví, ale není si jistý. Měl bych to prověřit.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Myslím, že nejlepší cesta bude dobít zpět pevnost! Nathan souhlasil, když půjdou i drakobijci, kteří se usadili v údolí. Když jsem mu ale oznámil, že je po nich. Rozhodl, že zaútočíme vlastními silami!");
		Info_ClearChoices(dia_pal_9168_natan_zamokknown);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_18");	//Dobrá, zkusím je najít. Doufám, že je skřeti už nenašli!
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_19");	//Dobře, počkáme tu na tebe.
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Nedaleko od průchodu do Hornického údolí jsem potkal malou skupinu paladinů. Vede je jistý Nathan. Řekl mi, že skřeti podnikli další útok na hrad a ten padl. Nathan věří, že všichni obránci hradu jsou mrtví, ale není si jistý. Měl bych to prověřit.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Myslím, že nejlepší cesta bude dobít zpět pevnost! Nathan souhlasil, když půjdou i drakobijci, kteří se usadili v údolí. Myslím, že je půjdu zkusit najít.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERSTWO(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurviverstwo_condition;
	information = dia_pal_9168_natan_newssurviverstwo_info;
	permanent = FALSE;
	description = "Ohledně pevnosti.";
};


func int dia_pal_9168_natan_newssurviverstwo_condition()
{
	if((KNOWABOUTGAROND == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOKTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurviverstwo_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_01");	//Byl jsem v pevnosti.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_02");	//Opravdu?!... A co jsi zjistil?!
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_03");	//Garond a pár paladinů jsou naživu.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_07");	//Nejdříve bychom měli osvobodit Garonda a jeho muže!
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_08");	//Nevíme, jak dlouho je ty kreatury budou potřebovat.
	KNOWSITUATIONCASTLE = TRUE;
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERSUDAR(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurviversudar_condition;
	information = dia_pal_9168_natan_newssurviversudar_info;
	permanent = FALSE;
	description = "Mám novinky.";
};


func int dia_pal_9168_natan_newssurviversudar_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARKNOWSNATAN == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && Npc_KnowsInfo(hero,dia_pal_9168_natan_zamokknown))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurviversudar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_03");	//Mezi zajmutými paladiny byl i tvůj přítel Udar.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_04");	//Udar je v pevnosti?! Jo! Takže ho ještě mohu zachránit.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_05");	//Prokletí skřeti!... Tak jednoduše je z toho vyjít nenechám.
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_06");	//Myslím, že je to tvoje šance zplatit dluh.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_07");	//A při první příležitosti to udělám.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_08");	//Díky, že jsi mi to řekl. Teď mě nic nezastaví na cestě k pevnosti!
	B_LogEntry(TOPIC_NATANDOLG,"Jak Nathan slyšel, že Udar žije, rozhodl se zaútočit. Zdá se, že teď ho nezastaví ani celá armáda!");
};


instance DIA_PAL_9168_NATAN_HOWAROUND(C_Info)
{
	npc = pal_9168_natan;
	nr = 2;
	condition = dia_pal_9168_natan_condition;
	information = dia_pal_9168_natan_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_pal_9168_natan_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (Npc_KnowsInfo(hero,dia_pal_9168_natan_zamok) || Npc_KnowsInfo(hero,dia_pal_9168_natan_zamokknown)))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_01_00");	//Jaká je situace?
	if(MIS_STURMCASTLE == LOG_Running)
	{
		if(CASTLEISFREE == TRUE)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_01");	//Dokázali jsme to! Pevnost je opět naše!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_02");	//Ale na velké oslavy to není. Nemyslím, že si to skřeti nechají líbit
			AI_StopProcessInfos(self);
		}
		else
		{
			if(KNOWSITUATIONCASTLE == TRUE)
			{
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_04");	//Měli bychom Garonda a ostatní vytáhnout z pracek skřetů. Nemůžeme je tu jen tak nechat.
				AI_StopProcessInfos(self);
			};
			if(PALADINREADYATTACK == FALSE)
			{
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_06");	//Zatím je všude klid... (vážně) Ale to může být jen zdání!
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_07");	//Nikdy nevíš, kdy přijdou skřeti a pak je dobré být připravenej.
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_08");	//Takže ty musíš pokud možno co nejrychleji nají tuhle patrolu. Nesmíme ztratit ani minutu!
				AI_Output(other,self,"DIA_Pal_9168_Natan_01_09");	//Dobře už jdou.
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_10");	//Měli bychom si pohnout, než skřeti zjistí co se chystá?!
				AI_StopProcessInfos(self);
			};
		};
	}
	else if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		if(KNOWSITUATIONCASTLE == FALSE)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_12");	//Zatím je všude klid... (vážně) Ale to může být jen zdání!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_13");	//Nikdy nevíš, kdy přijdou skřeti a pak je dobré být připravenej.
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_14");	//Takže, je třeba co nejrychleji se dostat do hradu a zjistit, co se tam děje.
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_15");	//Nesmíme ztratit ani minutu!
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_17");	//Měli bychom vyrvat Garonda a jeho lidi z rukou skřetů. Nesmíme jim je nechat napospas.
			AI_StopProcessInfos(self);
		};
	}
	else if(PALADINCASTELFREE == TRUE)
	{
		if(MIS_STURMCASTLE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_19");	//Tak je to lepší, když je Garond a jeho lidi s námi!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_20");	//Nyní musíme co nejrychleji pryč, než si toho skřeti všimnou.
		}
		else if(MIS_NEWSSURVIVERS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_22");	//Tak je to lepší, když je Garond a jeho lidi s námi!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_23");	//Nyní bychom měli co nejdříve odejít!
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_25");	//Mohlo být i líp... (vážně)
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_01_26");	//Mohlo být i líp... (vážně)
	};
};


instance DIA_PAL_9168_NATAN_CANREADYATTACK(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_canreadyattack_condition;
	information = dia_pal_9168_natan_canreadyattack_info;
	permanent = FALSE;
	description = "Ohledně drakobijců...";
};


func int dia_pal_9168_natan_canreadyattack_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (PALADINREADYATTACK == FALSE) && ((DGJREFUSEPALADIN == TRUE) || (DGJJOINPALADIN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_canreadyattack_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_01");	//Ohledně drakobijců...
	AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_02");	//Máš něco nového?!
	AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_03");	//Ano! Našel jsem jejich skupinu a navrhnul jsem jim, aby se přidali.
	AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_04");	//Co na to řekli?!
	if(DGJJOINPALADIN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_05");	//Souhlasili, jdou do bitvi s námi.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_06");	//To jsou dobré zprávy! Skřetům teď nic nepomůže!
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_07");	//Myslím, že je možné začít s útokem! Řekni, až budeš připravenej.
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_08");	//Dobře.
		B_LogEntry(TOPIC_STURMCASTLE,"Když paladin Nathan slyšel o souhlasu drakobijců, řekl, že můžeme zaútočit!");
		PALADINREADYATTACK = TRUE;
		b_readydgjattack();
	}
	else if(DGJREFUSEPALADIN == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_09");	//Nemyslím si že pro nás budou přínosem.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_10");	//Proč tak uvažuješ?!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_11");	//Ti zbabělci se posrali, jak se dozvěděli, co cheš dělat.
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_12");	//Takže se musíme obejít bez nich!
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_13");	//Ano, je to škoda...
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_14");	//Myslím, že jsme připraveni. Dej vědět až budeš i ty!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_15");	//Dobře.
		B_LogEntry(TOPIC_STURMCASTLE,"Nathan byl zklamán, když zjistil rozhodnutí drakobijců. Nyní je to jen na nás.");
		PALADINREADYATTACK = TRUE;
	}
	else if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_16");	//Bojím se, že už jsou všichni mrtví.
			AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_17");	//Jak to výš?!
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_18");	//Nic! Jejich vůdce je mrtev, a bez něj je to jen banda podělaných slabochů. Takže asi nic!
			AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_19");	//Jak to víš?!
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_20");	//Věř mi, je to tak. Musíme jít do bitvi bez nich!
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_21");	//škoda... Dobrá, nic jiného nám nezbývá.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_22");	//Myslím, že jsme připraveni. Dej vědět, až budeš i ty!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_23");	//Dobře.
		B_LogEntry(TOPIC_STURMCASTLE,"Nathan byl zklamaný, když slyšel noviny o drakobijcích. Musíme to zvládnout vlastními silami!");
		PALADINREADYATTACK = TRUE;
	};
};


instance DIA_PAL_9168_NATAN_SURVIVERSFAILED(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_surviversfailed_condition;
	information = dia_pal_9168_natan_surviversfailed_info;
	permanent = FALSE;
	description = "Musíme zaútočit na hrad!";
};


func int dia_pal_9168_natan_surviversfailed_condition()
{
	if((MIS_NEWSSURVIVERS == LOG_Running) && (MIS_STURMCASTLE == FALSE) && (BOGNARREFUSETALK == TRUE) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_surviversfailed_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_01");	//Musíme zaútočit na hrad!
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_02");	//Hmmm... Nápad je to dobrý, také jsem o tom uvažoval.
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_03");	//Nicméně máme proti sobě armádu skřetů.
	AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_06");	//Co navrhuješ?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_07");	//Hmmm... Slyšel jsem, že v údolí se usadili drakobijci.
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_08");	//Myslím, že by nám mohli pomoci při útoku na pevnost!

	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_09");	//Bojím se, že už jsou všichni mrtví.
			AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_10");	//Jak to víš?!
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_17");	//Nemyslím, že budou přínosem.
			AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_18");	//Jejich vůdce je mrtev, a bez něj je to jen banda podělaných slabochů. Takže asi nic!
			AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_19");	//Ale jak to víš?!
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);

			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_11");	//Věř mi, musíme do útoku bez nich!
		AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_12");	//Škoda... Dobrá, dobudeme to vlastní silou.
		AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_13");	//Myslím, že můžeme začít s útokem. Dej vědět, až budeš připraven!
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_14");	//Dobře.
		MIS_NEWSSURVIVERS = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_OBSOLETE);
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Nathan souhlasil s mojim nápadem dobít pevnost zpět, ale stěžuje si, že je nás málo. Říkal, že v údolí jsou drakobijci, ale když jsem mu řekl, že jsou mrtví, souhlasil s útokem.");
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_15");	//Dobrá, zkusím je najít, jestli to předemnou neudělali skřeti!
		AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_16");	//Dobrá, počkáme zde na tebe.
		MIS_NEWSSURVIVERS = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_OBSOLETE);
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Vše co nám zbývá je pokusit se získat pevnost zpět. Nathan říkal, že bych měl najít drakobijce, aby nám pomohli. Půjdu se po nich podívat.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_READYATTACK(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_readyattack_condition;
	information = dia_pal_9168_natan_readyattack_info;
	permanent = TRUE;
	description = "Začněme s útokem!";
};

func int dia_pal_9168_natan_readyattack_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (PALADINREADYATTACK == TRUE) && (PALADINATTACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_readyattack_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_01_01");	//Začněme s útokem!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_01_02");	//Nuže... Jsi připraven?
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
	Info_AddChoice(dia_pal_9168_natan_readyattack,"Ne vydrž chvilku.",dia_pal_9168_natan_readyattack_wait);
	Info_AddChoice(dia_pal_9168_natan_readyattack,"Jsem připravenej.",dia_pal_9168_natan_readyattack_attack);
};

func void dia_pal_9168_natan_readyattack_wait()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Wait_01_01");	//Ne vydrž chvilku.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Wait_01_02");	//Jasně, jak chceš.
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
};

func void dia_pal_9168_natan_readyattack_attack()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_01");	//Jsem připravenej.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_02");	//Tak jdeme.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_03");	//Myslím, že by bylo správné abys vedl útok.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_04");	//Všichni na tebe spoléháme. Nezklam nás.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_05");	//Vpřed, za Innose! (bojovně)
	PALADINATTACK = TRUE;
	B_LogEntry(TOPIC_STURMCASTLE,"Útok na pevnost začal...");
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
	Info_AddChoice(dia_pal_9168_natan_readyattack,"Na steč!",dia_pal_9168_natan_readyattack_go);
};

func void dia_pal_9168_natan_readyattack_go()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Go_01_01");	//Na zteč!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	b_paladinattackcastle();
};