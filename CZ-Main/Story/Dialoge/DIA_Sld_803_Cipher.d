
instance DIA_Cipher_EXIT(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 999;
	condition = DIA_Cipher_EXIT_Condition;
	information = DIA_Cipher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cipher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_Hello(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 1;
	condition = DIA_Cipher_Hello_Condition;
	information = DIA_Cipher_Hello_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int DIA_Cipher_Hello_Condition()
{
	return TRUE;
};

func void DIA_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Hej, neznám tě odněkud?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//Je to možné...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//Pokoušel jsem se v kolonii obchodovat s trávou z bažin, vzpomínáš?
};


instance DIA_Cipher_TradeWhat(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TradeWhat_Condition;
	information = DIA_Cipher_TradeWhat_Info;
	permanent = FALSE;
	description = "A s čímpak obchoduješ teď?";
};


func int DIA_Cipher_TradeWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TradeWhat_Info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//A s čímpak obchoduješ teď?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ach, neptej se mě.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//Přinesl jsem si s sebou z Hornického údolí celý pytlík téhle trávy.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Hodně žoldáků dostane tu a tam chuť si trochu zakouřit. Vydělal jsem si takhle bokem trochu peněz.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Ale nějaký bastard mi ukradl z truhly všechnu trávu!
	Log_CreateTopic(Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherPaket,LOG_Running);
	B_LogEntry(Topic_CipherPaket,"Žoldáku Cipherovi se ztratil balík trávy z bažin.");

	if(!Npc_IsDead(Bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Jsem si docela jistej, že to byl Bodo. Obývá stejnou místnost jako já a vždycky se na mě kření jako nějakej idiot...
		B_LogEntry(Topic_CipherPaket,"Domnívá se, že zlodějem je Bodo.");
	};
	MIS_Cipher_Paket = LOG_Running;
};

instance DIA_Cipher_MoreDrugs(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_MoreDrugs_Condition;
	information = DIA_Cipher_MoreDrugs_Info;
	permanent = FALSE;
	description = "Celý balíček trávy?!";
};

func int DIA_Cipher_MoreDrugs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_MoreDrugs_Info()
{
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_00");	//Celý balíček trávy?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_01");	//A tebe to překvapuje? V kolonii to bylo extrémně horké zboží.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_02");	//Jeho výrobou se nezbývali jenom ty šílení blázni v močálech.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_03");	//Mimochodem...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_04");	//Dokonce znám místo, kde můžeš získat ještě jeden takový balíček!
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_05");	//Opravdu? A kde?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_06");	//(smích) Chceš si vydělat peníze navíc, co?
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_07");	//To nemohu odmítnout.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_08");	//Svého času jeden chlap jménem Jacko měl laboratoř na spracování trávy, poblíž vchodu do Nového tábora.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_09");	//Měl tam celou zásobu trávy!
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_10");	//Myslíš, že tam mohlo ještě něco zůstat?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_11");	//Možná... (zamyšleně) Pravda, zkontrolovat to bude velmi obtížné! Koneckonců jsou tam všude okolo skřeti.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_12");	//Ale pokud se někdy rozhodneš vrátit do Hornického údolí, zkus se tam podívat.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_13");	//Jen nezapomeň co jsem ti říkal o tom místě!
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_14");	//Neboj se. Všechno si pamatuju.
	MIS_MoreDrugs = LOG_Running;
	Log_CreateTopic(Topic_MoreDrugs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Running);
	B_LogEntry(Topic_MoreDrugs,"Cipher mě řekl o tajné laboratoři na výrobu trávy, byla poblíž vchodu do Nového tábora.");
};

instance DIA_Cipher_MoreDrugs_Done(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_MoreDrugs_Done_Condition;
	information = DIA_Cipher_MoreDrugs_Done_Info;
	permanent = FALSE;
	description = "Mám sebou další balíček trávy.";
};

func int DIA_Cipher_MoreDrugs_Done_Condition()
{
	if((MIS_MoreDrugs == LOG_Running) && (Npc_HasItems(hero,ItMi_JointPacket_OW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cipher_MoreDrugs_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_Done_01_00");	//Mám sebou další balíček trávy.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_01");	//(usmívá se) Byl jsi tam! No to jsi statečný muž.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_02");	//Bude to tak: ty mě dáš ten balíček a já ti dám polovinu jeho obvyklé ceny.
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_Done_01_03");	//A kolik je to ve zlatě?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_04");	//Nech mě přemýšlet... asi tak 1000 zlatých, přímo na ruku.
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_Done_01_05");	//Domluveni, tady máš ten balíček.
	B_GiveInvItems(other,self,ItMi_JointPacket_OW,1);
	Npc_RemoveInvItems(self,ItMi_JointPacket_OW,1);
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_06");	//Výborně! Teď aspoň nebude můj život na tédle farmě nuda.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_07");	//Tady je tvůj podíl, tak to všechno nepropi! (smích)
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_MoreDrugs = LOG_Success;
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Success);
	B_LogEntry(Topic_MoreDrugs,"Prodal jsem balíček Cipherovi za 1000 zlatých.");
	AI_StopProcessInfos(self);
};

instance DIA_Cipher_DoWithThief(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DoWithThief_Condition;
	information = DIA_Cipher_DoWithThief_Info;
	permanent = FALSE;
	description = "Co tedy chceš s tím zlodějem udělat?";
};

func int DIA_Cipher_DoWithThief_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DoWithThief_Info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//Co tedy chceš s tím zlodějem udělat?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Jednou ho určitě nachytám, jak bude kouřit mojí trávu.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//A pak si najdu nějaké odlehlé místo a dám mu takovou lekci, na kterou do smrti nezapomene.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Kdybych ho napadnul tady uprostřed dvora, ostatní rolníci by si toho všimli a já bych si to odskákal.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//Jak to?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//To je jednoduché. Nemůžeme zmlátit rolníky, jinak bychom Leeovi zaplatili pokutu. Takhle to chce Onar.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//A čím více svědků u toho je, tím více poprasku kolem toho bude. A to by se nám prodražilo.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Takže tu věc vyřídím hezky nenápadně...
};


instance DIA_Cipher_WannaJoin(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_WannaJoin_Condition;
	information = DIA_Cipher_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se přidat k Leeovým lidem!";
};


func int DIA_Cipher_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Chci se přidat k Leeovým lidem!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Leeovým lidem?! Jestli Lee bude pokračovat tímhle způsobem, tak už brzy jeho nebudou!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Proč?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Lee byl vždycky kliďas. To byl v kolonii taky.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Ale poslední dobou to už přehání. Chce si sem prostě jen tak sednout a čekat, dokud paladinové nezemřou hladem.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Sylvio si myslí, že bychom měli trochu vyčistit malé farmy a okolí města.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//Myslím, že by se měl co nejdříve úplně změnit.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//V týhle chvíli tu většina z nás sedí s rukama v klíně - i tak se chceš k nám pořád přidat?
};


instance DIA_Cipher_YesJoin(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_YesJoin_Condition;
	information = DIA_Cipher_YesJoin_Info;
	permanent = FALSE;
	description = "Chci se stát jedním z vás a je mi jedno jak!";
};


func int DIA_Cipher_YesJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_YesJoin_Info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Chci se stát jedním z vás a je mi jedno jak!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//Už víš, že musíme nechat o každém novém rekrutovi hlasovat?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//Na co narážíš?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//No, už jsem hodně dlouho nic nekouřil. Přines mi trochu trávy z bažin a dostaneš můj hlas.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Jistě se ti podaří nějakou splašit.
	MIS_Cipher_BringWeed = LOG_Running;
	Log_CreateTopic(Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_Running);
	B_LogEntry(Topic_CipherHerb,"Cipher se za mě zaručí, pokud mu přinesu nějakou trávu z bažin.");
};


instance DIA_Cipher_Joints(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_Joints_Condition;
	information = DIA_Cipher_Joints_Info;
	permanent = TRUE;
	description = "Co se týče trávy z bažin...";
};


func int DIA_Cipher_Joints_Condition()
{
	if(MIS_Cipher_BringWeed == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cipher_Joints_Info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Co se týče trávy z bažin...
	if(MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//Přinesl jsi mi zpátky můj balíček trávy! Teď bude všechno v pořádku!

		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Samozřejmě budu hlasovat pro tebe.
			B_LogEntry(TOPIC_SLDRespekt,"Když se budu chtít přidat k žoldákům, Cipher se za mě přimluví.");
		};

		MIS_Cipher_BringWeed = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(DIA_Cipher_Joints);
		Info_AddChoice(DIA_Cipher_Joints,"Uvidím, co se dá dělat...",DIA_Cipher_Joints_Running);

		if(Npc_HasItems(other,ItMi_Joint) > 0)
		{
			Info_AddChoice(DIA_Cipher_Joints,"Tady máš pár stébel...",DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Uvidím, co se dá dělat.
	Info_ClearChoices(DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Tady máš pár stébel.
	if(B_GiveInvItems(other,self,ItMi_Joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ach! Ty jsi můj člověk!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//Máš můj hlas.
			B_LogEntry(TOPIC_SLDRespekt,"Když se budu chtít přidat k žoldákům, Cipher se za mě přimluví.");
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_GivePlayerXP(XP_CipherWeed);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//To je všechno? Tohle vykouřím na jeden zátah!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//To je nejméně na deset špeků.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//V každém případě máš můj hlas, aby ses k nám přidal.
		};
	};
	Info_ClearChoices(DIA_Cipher_Joints);
};

instance DIA_Cipher_TRADE(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TRADE_Condition;
	information = DIA_Cipher_TRADE_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};

func int DIA_Cipher_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && Wld_IsTime(7,35,23,35))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Ukaž mi své zboží.

	if(Npc_HasItems(self,ItMi_Joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Jistě! Jak je libo.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//V téhle chvíli nemám žádnou trávu. Nechceš něco jiného?
	};
};


instance DIA_Cipher_DarDieb(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarDieb_Condition;
	information = DIA_Cipher_DarDieb_Info;
	permanent = FALSE;
	description = "Vím, kdo ti sebral tvojí trávu.";
};


func int DIA_Cipher_DarDieb_Condition()
{
	if(((Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE)) && !Npc_IsDead(Dar))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarDieb_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//Vím, kdo ti sebral tvojí trávu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Kdo? Byl to Bodo?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Ne - udělal to jeden z žoldáků. Jmenuje se Dar.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//Ten parchant! Kde je?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Tím, že ho najdeš, si nepomůžeš. Už nemá ten balíček u sebe... Prodal ho v Khorinisu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//KDE JE?!

	if(Npc_GetDistToWP(Dar,"NW_BIGFARM_KITCHEN_DAR") < 300)
	{
		AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//Za kuchyní, za rohem...
	};

	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//DOKONČÍM TO!
	AI_StopProcessInfos(self);
	CipherGoDar = TRUE;
};

instance DIA_Cipher_DarLOST(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarLOST_Condition;
	information = DIA_Cipher_DarLOST_Info;
	permanent = FALSE;
	description = "Skutečně jsi dal Darovi co proto... Cítíš se teď líp?";
};


func int DIA_Cipher_DarLOST_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarLOST_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Skutečně jsi dal Darovi co proto... Cítíš se teď líp?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(povzdech) Joo, cítím se fajn.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Předpokládám, že ale ON ne...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Ten malej žebrák se nemá co štrachat v mojí truhle!
	B_GivePlayerXP(XP_Ambient * 2);
};


instance DIA_Cipher_KrautPaket(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_KrautPaket_Condition;
	information = DIA_Cipher_KrautPaket_Info;
	permanent = FALSE;
	description = "Není tenhle balíček trávy náhodou tvůj?";
};


func int DIA_Cipher_KrautPaket_Condition()
{
	if((Npc_HasItems(other,ItMi_HerbPaket) > 0) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cipher_KrautPaket_Info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Není tenhle balíček trávy náhodou tvůj?
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//No, jasně! Kde jsi ho sebral?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//To je dlouhý příběh...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//To nevadí, opravdu jsi slušnej chlapík.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Tady, vezmi si tohle jako odměnu. Užij si to!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Joint,10);
	B_GivePlayerXP(XP_Cipher_KrautPaket);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Teď mě nech trochu pracovat...
	CreateInvItems(self,ItMi_Joint,40);
	Npc_RemoveInvItems(self,ItMi_HerbPaket,1);
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_CipherPaket);
};


instance DIA_CipherSLD_PICKPOCKET(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 900;
	condition = DIA_CipherSLD_PICKPOCKET_Condition;
	information = DIA_CipherSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_CipherSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(65,65);
};

func void DIA_CipherSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,Dialog_Back,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

