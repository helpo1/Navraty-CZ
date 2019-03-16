
instance DIA_Hakon_EXIT(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 999;
	condition = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Sperre(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Sperre_Condition;
	information = DIA_Hakon_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hakon_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Sperre_Info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Ztrať se, ty kriminálníku! Canthar mi řekl, jakej mizernej bastard jseš!
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Hallo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Hallo_Condition;
	information = DIA_Hakon_Hallo_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Hakon_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Jsem Hakon, prodavač zbraní.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//V tyhle dny by měl mít každý muž u sebe zbraň. Zvlášť, když se vydá za hradby.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Hakon prodává na tržišti zbraně.");
};


instance DIA_Hakon_Trade(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 99;
	condition = DIA_Hakon_Trade_Condition;
	information = DIA_Hakon_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Hakon_Trade_Condition()
{
	if(Wld_IsTime(6,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Ukaž mi své zboží.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//Je pro mě velkou ctí, když se o mé zboží zajímá představitel svaté církve.
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_02");	//Je pro mě velkou ctí, když se o mé zboží zajímá představitel mágů Vody.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_03");	//V mém sortimentu se nachází opravdu mocné zbraně.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_04");	//Ochránci města potřebují dobrý meč!
	}
	else if(hero.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_05");	//Asi jste minul osvícený, ale můžete to zkusit.
	}
	else if(hero.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_06");	//Takže mezi vámi, ukouřen... uh... členy Bratrstva taky jsou skuteční vojáci? Také mám skutečnou zbraň!
	}
	else if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_07");	//Proč zbraně nekromante? Máš zatracený síly Beliara! 
	};

	B_GiveTradeInv(self);
};

instance DIA_Addon_Hakon_MissingPeople(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Addon_Hakon_MissingPeople_Condition;
	information = DIA_Addon_Hakon_MissingPeople_Info;
	description = "Nevíš náhodou něco o ztracených obyvatelích Khorinisu?";
};


func int DIA_Addon_Hakon_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Hakon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Nevíš náhodou něco o ztracených obyvatelích Khorinisu?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Viděl jsem mnoho lidí procházet východní branou.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//Některé z nich jsem v životě neviděl. A mnoho z nich se nikdy nevrátilo.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Ale, něco opravdu divného se asi děje.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//Tamhle byl nějaký týpek. Myslím, že se jmenoval Joe. Pořád se vychloubal, že bude brzy pracháč.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Vyzvídal, jak se má dostat do jedné z městských věží, kam si domobrana ukládá zbraně.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//Potom jsem ho už nikdy neviděl. Chodil jsem okolo něj každý den, dokud se neztratil.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Byl jsem udiven, když ho domobrana zatkla a ptala se nás na něj.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Lord Andre nevěděl, o čem jsem mluvil a nechtěl o tom chlápkovi už slyšet.
	Log_CreateTopic(TOPIC_Addon_Joe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe,LOG_Running);
	B_LogEntry(TOPIC_Addon_Joe,"Hakon, obchodník v Khorinisu, vídal chlápka jménem Joe, než se ztratil. Joe se chtěl dostat do jedné z městských věží, kde si domobrana skladovala zbraně.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_OutOfTown(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_OutOfTown_Condition;
	information = DIA_Hakon_OutOfTown_Info;
	permanent = FALSE;
	description = "Řekni mi něco o okolí města.";
};


func int DIA_Hakon_OutOfTown_Condition()
{
	return TRUE;
};

func void DIA_Hakon_OutOfTown_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Řekni mi něco o okolí města.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Je to tam čím dál nebezpečnější.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Jednak kvůli banditům, a taky kvůli divoké zvěři.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Vypadá to, jako by ani zvířata v těchhle zatracených časech neměla čím zahnat hlad.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Odvažují se k městu stále blíž.
};


instance DIA_Hakon_Paladine(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Paladine_Condition;
	information = DIA_Hakon_Paladine_Info;
	permanent = FALSE;
	description = "Víš něco o paladinech?";
};


func int DIA_Hakon_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Paladine_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Víš něco o paladinech?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Ano! Ti chlapi mi maří moje obchody!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//Všechno, co si při nejlepší vůli můžeš v tomhle městě koupit, je krátký meč.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Seberou všechno, co je delší než stopu a půl.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(jízlivě) A na oplátku se teď můžu v hotelu válet zdarma - ha!
};


instance DIA_Hakon_WoWaffen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_WoWaffen_Condition;
	information = DIA_Hakon_WoWaffen_Info;
	permanent = FALSE;
	description = "Odkud bereš své zbraně?";
};


func int DIA_Hakon_WoWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Hakon_WoWaffen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Odkud bereš své zbraně?
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Odnikud! Až doteď byl mým dodavatelem Harad.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Až doteď byl mým dodavatelem kovář Harad.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Nedělá teď na ničem jiném než na zakázce pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Pracuje pro ty chlápky dnem i nocí jako magor bez nároku na odměnu. Má dojem, že to jeho povinnost.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//Všechno, co ti můžu nabídnout, jsou zbytky mých zásob.
};


instance DIA_Hakon_HaradBandits(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_HaradBandits_Condition;
	information = DIA_Hakon_HaradBandits_Info;
	permanent = FALSE;
	description = "Harad mi řekl o útoku banditů.";
};


func int DIA_Hakon_HaradBandits_Condition()
{
	if(Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hakon_HaradBandits_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad mi řekl o útoku banditů.
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Hm? A?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//Dá mi souhlas pro přijetí do učení, když se vypořádám s těmi bandity.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(smích) Starý dobrý Harad. To asi bude způsob, jakým se mi chtěl omluvit za to, že pro mě nemůže dělat žádné zbraně.
};


instance DIA_Hakon_Banditen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Banditen_Condition;
	information = DIA_Hakon_Banditen_Info;
	permanent = FALSE;
	description = "Co víš o banditech?";
};


func int DIA_Hakon_Banditen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hakon_HaradBandits) || Npc_KnowsInfo(hero,DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Banditen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Co o nich vím? Cestou do města mě oloupili!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//A nejsem jediný. To se jen tak nezmění.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Domobrana se je snaží vyslídit, ale nějak se to nedaří.
	MIS_HakonBandits = LOG_Running;
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HakonBanditen,LOG_Running);
	B_LogEntry(TOPIC_HakonBanditen,"Hakona, obchodníka se zbraněmi, okradli za městem banditi.");
};


instance DIA_Hakon_Wieviel(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Wieviel_Condition;
	information = DIA_Hakon_Wieviel_Info;
	permanent = FALSE;
	description = "Můžu se o to postarat.";
};


func int DIA_Hakon_Wieviel_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//Můžu se o to postarat.
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Co, TY se chceš pustit do banditů? To jako ty sám? Ty jsi asi dost dobrý bojovník, co?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Jak moc ti na tom záleží?
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//Chceš se dostat k Haradovým biblím, co?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Nemyslím, že bych ti za to měl platit.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//Je to pěkně nebezpečné.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//No, mě to nevadí. Jestli ty bandity přemůžeš, dám ti 100 zlatých.
		MIS_HakonBanditsPay = TRUE;
	};
	Info_ClearChoices(DIA_Hakon_Banditen);
};


instance DIA_Hakon_Miliz(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_Miliz_Condition;
	information = DIA_Hakon_Miliz_Info;
	permanent = FALSE;
	description = "Nemáš ponětí, kdo z domobrany se pátrání účastnil?";
};


func int DIA_Hakon_Miliz_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Miliz_Info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Nemáš ponětí, kdo z domobrany se pátrání účastnil?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Jo, ten chlapík se jmenoval Pablo. Spolu s pár ostatními po banditech pátrali, ale nikoho nenašli.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//A nevíš, kde bych toho Pabla našel?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Je na stráži ve městě. Buď ho potkáš v chrámové uličce, nebo v dolní čtvrti.
	B_LogEntry(TOPIC_HakonBanditen,"Neúspěšného pátrání po banditech se účastnil i Pablo, příslušník městské gardy.");
};


instance DIA_Hakon_Wo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Wo_Condition;
	information = DIA_Hakon_Wo_Info;
	permanent = FALSE;
	description = "Kde tě přepadli?";
};


func int DIA_Hakon_Wo_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wo_Info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Kde tě přepadli?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//U Akilova statku. Když odsud vyjdeš městskou branou a pak se dáš cestou doprava, nemůžeš to minout.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Za chvíli narazíš na pár schodů - a právě odtamtud se na mě ti bastardi vyřítili. Vsadím se, že někde v těch lesích mají doupě.
};


instance DIA_Hakon_Success(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Success_Condition;
	information = DIA_Hakon_Success_Info;
	permanent = FALSE;
	description = "Už jsem ty bandity vyřídil.";
};


func int DIA_Hakon_Success_Condition()
{
	if((MIS_HakonBandits == LOG_Running) && (Npc_IsDead(BDT_10621_Bandit_L) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Success_Info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//Už jsem ty bandity vyřídil.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Opravdu? To by mohl říct každý. Máš nějaký důkaz?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(povzdech) To se tam mám vrátit a usekat jim hlavy, nebo co?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(rychle) Ne - to snad ani nebude nutné. Věřím ti.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Prokázal jsi městským obchodníkům nesmírnou službu.
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Harad bude spokojený - aspoň myslím.
	};
	if(MIS_HakonBanditsPay == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//A tady máš slíbenou odměnu.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Hakon_Bandits);
};


instance DIA_Hakon_Minenanteil(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Minenanteil_Condition;
	information = DIA_Hakon_Minenanteil_Info;
	permanent = FALSE;
	description = "Kde jsi sehnal ty důlní akcie, které prodáváš?";
};


func int DIA_Hakon_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Kde jsi sehnal ty důlní akcie, které prodáváš?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Je mi líto, ale to ti nemůžu prozradit. Je to moc nebezpečné.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_PICKPOCKET(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 900;
	condition = DIA_Hakon_PICKPOCKET_Condition;
	information = DIA_Hakon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hakon_PICKPOCKET_Condition()
{
	return C_Beklauen(45,65);
};

func void DIA_Hakon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,Dialog_Back,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};


instance DIA_Hakon_Kapitel2(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Kapitel2_Condition;
	information = DIA_Hakon_Kapitel2_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hakon_Kapitel2_Condition()
{
	if((Kapitel >= 2) && (Canthar_Sperre == FALSE) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Kapitel2_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//Už zase TY!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad konečně skončil s tou zatrachtilou misí pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//To značí, že ti teď můžu nabídnout nové zbraně. Máš zájem?
};


instance DIA_HAKON_HANNAISPRISION(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = dia_hakon_hannaisprision_condition;
	information = dia_hakon_hannaisprision_info;
	permanent = FALSE;
	description = "Slyšel jsem, že tě okradli.";
};


func int dia_hakon_hannaisprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONHAKON == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_hannaisprision_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Hakon_HannaIsPrision_01_00");	//Slyšel jsem, že tě okradli.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_01");	//Ano, pravda!...
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_02");	//Ale je to celé nějaké divné.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_04");	//Pro začátek - znám Hannu více jak rok.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_05");	//Takže bych dal ruku do ohně za to, že je to poctivý člověk.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_06");	//Neměla důvod krást mi tyto věci.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_07");	//Hotel Hanně vydělává dobré peníze a má se dobře.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_09");	//No a kromě toho, ten svědek...
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_11");	//Och, ano! Ten! Říká, že Hannu viděl, jak se mi hrabe v truhle.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_12");	//Ale Hanna celý den hlídá v přízemí vchod do hotelu.
	AI_Output(other,self,"DIA_Hakon_HannaIsPrision_01_13");	//A proč mi to všechno říkáš?
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_14");	//Prostě tomu nevěřím. Musel to být někdo jiný.
	AI_Output(other,self,"DIA_Hakon_HannaIsPrision_01_15");	//Aha. A co je na tom tak divného?
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_18");	//To ano. Jeden prsten. Šmejd, ale byl památný.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_19");	//A nebyl nalezen mezi kradenými věcmi!
	AI_Output(other,self,"DIA_Hakon_HannaIsPrision_01_22");	//Dobře, podívám se na to. Díky za informace!
	AI_Output(self,other,"DIA_Hakon_HannaIsPrision_01_23");	//Snad se to vše vyjasní.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Mluvil jsem s Hakonem o Hanně z hotelu. Je obviněna z krádeže. Hakon mi ale řekl, že se stalo něco divného. Když u Hanny našli kradené věci, nebyl tam jeden starý prsten... A ani sám Hakon nevěří, že by to Hanna udělala. Hotel jí přece vydělává až až. Měl bych se na to podívat.");
	KNOWSHANNAINPRISIONABIGEIL = TRUE;
};


instance DIA_HAKON_HANNAISPRISIONRING(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = dia_hakon_hannaisprisionring_condition;
	information = dia_hakon_hannaisprisionring_info;
	permanent = FALSE;
	description = "To je tvůj prsten?";
};


func int dia_hakon_hannaisprisionring_condition()
{
	if(Npc_HasItems(hero,itri_hakonmissring) >= 1)
	{
		return TRUE;
	};
};

func void dia_hakon_hannaisprisionring_info()
{
	AI_Output(other,self,"DIA_Hakon_HannaIsPrisionRing_01_00");	//To je tvůj prsten?
	AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_01");	//Ano, ten mi ukradli!
	AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_02");	//Ale jak jsi ho našel?!... (udiveně)
	AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_15");	//To je dlouhá historie...
	AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_04");	//Hmm... A co s ním teď uděláš?!

	if(HANNAISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_06");	//Myslím, že ho využiješ lépe než já.
		AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_07");	//Takže si ho můžeš nechat pro sebe.
		AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_08");	//Nicméně jednou mi to oplatíš!
		HAKONRINGAFTER = TRUE;
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_11");	//Jestli proti tomu nic nemáš, vzal bych si ho zpět!
		AI_Output(other,self,"DIA_Hakon_HannaIsPrisionRing_01_12");	//Jasně, tady je!
		B_GiveInvItems(other,self,itri_hakonmissring,1);
		Npc_RemoveInvItems(self,itri_hakonmissring,1);
		AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_13");	//Díky příteli...
		AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRing_01_14");	//Přijmi toto zlato!
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
};


instance DIA_HAKON_HANNAISPRISIONRINGAFTER(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = dia_hakon_hannaisprisionringafter_condition;
	information = dia_hakon_hannaisprisionringafter_info;
	permanent = FALSE;
	description = "O prstenu.";
};


func int dia_hakon_hannaisprisionringafter_condition()
{
	if((Npc_HasItems(hero,itri_hakonmissring) >= 1) && (HAKONRINGAFTER == TRUE) && (HANNAISFREE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_hannaisprisionringafter_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Hakon_HannaIsPrisionRingAfter_01_01");	//O prstenu.
	B_GiveInvItems(other,self,itri_hakonmissring,1);
	Npc_RemoveInvItems(self,itri_hakonmissring,1);
	AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRingAfter_01_02");	//Díky příteli.
	AI_Output(self,other,"DIA_Hakon_HannaIsPrisionRingAfter_01_03");	//Přijmi toto zlato!
	B_GiveInvItems(self,other,ItMi_Gold,100);
};

instance DIA_Hakon_HauntedLH(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_HauntedLH_condition;
	information = DIA_Hakon_HauntedLH_info;
	permanent = FALSE;
	description = "Znáš jméno - Stefan?";
};

func int DIA_Hakon_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Hakon_HauntedLH_01_01");	//Znáš jméno - Stefan?
	AI_Output(self,other,"DIA_Hakon_HauntedLH_01_02");	//Ne, to jsem nikdy neslyšel.
	B_LogEntry(TOPIC_HauntedLighthouse,"Obchodník Hakon nic neví o muži se jménem Stefan.");
};