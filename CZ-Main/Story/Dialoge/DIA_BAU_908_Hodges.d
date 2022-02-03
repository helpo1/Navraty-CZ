/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



var int hosharpsword;

instance DIA_Hodges_Kap1_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap1_EXIT_Condition;
	information = DIA_Hodges_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_HALLO(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 1;
	condition = DIA_Hodges_HALLO_Condition;
	information = DIA_Hodges_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hodges_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Zdravím, jsem tu nový.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Neber si to nějak zle, ale není mi zrovna do řeči - jsem úplně hotovej.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Máš spoustu práce, co?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//To máš tedy pravdu. Bennet dělá tolik zbraní, že je ani nestačím brousit.
};


instance DIA_Hodges_TellAboutFarm(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TellAboutFarm_Condition;
	information = DIA_Hodges_TellAboutFarm_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o téhle farmě?";
};


func int DIA_Hodges_TellAboutFarm_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TellAboutFarm_Info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Co mi můžeš říct o téhle farmě?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//Tohle je Onarova farma.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//To velké stavení je jeho dům. Jedno křídlo přenechal žoldákům.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//My rolníci máme každý své lůžko ve stodole.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(překotně) Ale já jsem spokojený, je dobré mít lidi na hlídání farmy.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Tady za mnou je kuchyň.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Před kuchyní se nachází kovárna.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Možná budeš mít štěstí a Thekla pro tebe najde něco k jídlu.
};


instance DIA_Hodges_AboutSld(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_AboutSld_Condition;
	information = DIA_Hodges_AboutSld_Info;
	permanent = FALSE;
	description = "A co ti žoldáci?";
};


func int DIA_Hodges_AboutSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//A co ti žoldáci?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Onar je najal, aby drželi domobranu na uzdě.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Ale také hlídají farmu, ovce a rolníky.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Takže ani nepomysli na to, že bys mohl něco ukrást nebo se hrabat v něčí truhle.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Většinou totiž jen čekají na záminku někoho zmlátit.
};


instance DIA_Hodges_TRADE(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TRADE_Condition;
	information = DIA_Hodges_TRADE_Info;
	permanent = TRUE;
	description = "Mohu si od tebe koupit nějaké zbraně?";
	trade = TRUE;
};


func int DIA_Hodges_TRADE_Condition()
{
	if(Wld_IsTime(7,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Mohu si od tebe koupit nějaké zbraně?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//Moc toho nemám. Skoro všechny meče a sekery jsme odnesli do Onarova domu.
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};


instance DIA_Hodges_Kap2_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap2_EXIT_Condition;
	information = DIA_Hodges_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_Kap3_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap3_EXIT_Condition;
	information = DIA_Hodges_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_DontWork(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31;
	condition = DIA_Hodges_DontWork_Condition;
	information = DIA_Hodges_DontWork_Info;
	permanent = FALSE;
	description = "Proč nepracuješ?";
};


func int DIA_Hodges_DontWork_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Proč nepracuješ?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Tys to ještě neslyšel? Paladinové zavřeli Benneta.
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet,"Kováře Benneta uvěznili městští paladinové.");
};


instance DIA_Hodges_BennetAndSLD(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 33;
	condition = DIA_Hodges_BennetAndSLD_Condition;
	information = DIA_Hodges_BennetAndSLD_Info;
	permanent = FALSE;
	description = "Co na to žoldáci tady na farmě?";
};


func int DIA_Hodges_BennetAndSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//Co na to žoldáci tady na farmě?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Samozřejmě nevím, co mají za lubem, ale spousta z nich je fakt vytočená.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//To je pochopitelné.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Kdyby to bylo jen na nich, raději by hned napadli město, aby dostali Benneta ven.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Promluv si s Leem, možná bude mít něco, s čím můžeš pomoct.
};

instance DIA_Hodges_WhatHappened(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 3;
	condition = DIA_Hodges_WhatHappened_Condition;
	information = DIA_Hodges_WhatHappened_Info;
	permanent = TRUE;
	description = "Nauč mě ostřit zbraně. (1 VB, cena: 250 zlatých)";
};

func int DIA_Hodges_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_HALLO) && (KNOWHOWSHARPWEAPON == FALSE) && Wld_IsTime(7,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info()
{
	if((other.lp >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 250))
	{
		KNOWHOWSHARPWEAPON = TRUE;
		other.lp = other.lp - 1;
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(other,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Hodges_WhatHappened_03_05");	//Dobrá, dívej se a zapamatuj si to, co ti teď ukážu. Vše, co potřebuješ, jsou nějaké rezavé nebo vykované zbraně.

		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSHARP"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_BIGFARM_SMITH_SHARP");
			AI_AlignToWP(self);
			AI_UseMob(self,"BSSHARP",5);
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_07");	//Vezmi meč, přitlač vrchní stranu čepele...
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_08");	//... pozvolna přecházej po brusu napravo a nalevo...
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_09");	//... již zpola hotový meč vyžaduje rovnoměrnější tlak na celou čepel...
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_10");	//... aby nedošlo při broušení k jeho přehrátí nebo pokroucení.
			AI_UseMob(self,"BSSHARP",-1);
			B_TurnToNpc(self,other);
		};

		AI_Print(PRINT_LearnSharp);
		Snd_Play("LevelUP");
	}
	else if(other.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 250)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Hodges_WhatHappened_03_90");	//Nemáš dost zlata! Vrať se později.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Hodges_Kap4_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap4_EXIT_Condition;
	information = DIA_Hodges_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_Kap5_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap5_EXIT_Condition;
	information = DIA_Hodges_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_PICKPOCKET(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 900;
	condition = DIA_Hodges_PICKPOCKET_Condition;
	information = DIA_Hodges_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hodges_PICKPOCKET_Condition()
{
	return C_Beklauen(15,10);
};

func void DIA_Hodges_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
	Info_AddChoice(DIA_Hodges_PICKPOCKET,Dialog_Back,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hodges_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};

func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};


instance DIA_Hodges_DarkWeb(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32;
	condition = DIA_Hodges_DarkWeb_Condition;
	information = DIA_Hodges_DarkWeb_Info;
	permanent = FALSE;
	description = "Bennet říká, že jsi s ním šel do města, když byl zatčen.";
};

func int DIA_Hodges_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (HodjesTalk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DarkWeb_Info()
{
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_00");	//Bennet říká, že jsi s ním šel do města, když byl zatčen.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_01");	//Jo, je to tak. S Bennetem jsme chtěli koupit ocelové ingoty od obchodníka Hakona.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_02");	//Od Hakona? Ale co zákaz o prodeji na farmu?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_03");	//S Bennetem jsou staří přátelé! Takže mu Hakon stále dodává ten správný materiál do kovárny.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_04");	//Proč se vlastně ptáš?
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_05");	//Teď se ptám já. Kde jsi byl při zatčení?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_06");	//Já? Hmmm... jsem pil kořalku v hospodě Coragona. A problém je v tom...
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_07");	//Jak si zdrhnul domobraně?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_08");	//Když jsem slyšel, že Bennet byl zatčen za vraždu paladina, šel jsem přímo na farmu.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_09");	//Stráže se mě ani nepokusili zastavit. Zřejmě jim stačil Bennet.
	B_LogEntry(TOPIC_DarkWeb,"Hodges pil kořalku v hospodě Coragona, když byl Bennet zatčen. Když se to dozvěděl, zamířil přímo na farmu a stráže ho nechaly. Myslely, že skutečného vraha Lothara už chytily. Ale mám takový pocit že Hodges něco skrývá, měl bych na něj nějak zatlačit aby se rozmluvil...");
};

instance DIA_Hodges_DarkWeb_Done(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32;
	condition = DIA_Hodges_DarkWeb_Done_Condition;
	information = DIA_Hodges_DarkWeb_Done_Info;
	permanent = TRUE;
	description = "Lžeš!";
};

func int DIA_Hodges_DarkWeb_Done_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(other,DIA_Hodges_DarkWeb) == TRUE) && (HodjesBookGive == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DarkWeb_Done_Info()
{
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_01_00");	//Lžeš!
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_01_01");	//Co?!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_01_02");	//Lord Hagen mi řekl, že sleduje muže, který přišel do města spolu s Bennetem.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_01_03");	//Ale podařilo se mu uniknout. A jak jsem pochopil, ten člověk jsi byl ty!
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_01_04");	//To je nesmysl?! Mohl by to být někdo... Jsem tady vůbec a...
	Info_ClearChoices(DIA_Hodges_DarkWeb_Done);
	Info_AddChoice(DIA_Hodges_DarkWeb_Done,"Vrátíme se k našemu rozhovoru.",DIA_Hodges_DarkWeb_Done_BACK);

	// if(RhetorikSkillValue[1] >= 50)
	// {
		Info_AddChoice(DIA_Hodges_DarkWeb_Done,
			ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 50, TRUE), "Podívej, je to moc důležité."),
			// "Podívej, je to moc důležité.",
			DIA_Hodges_DarkWeb_Done_DoIt);
	// };
};

func void DIA_Hodges_DarkWeb_Done_BACK()
{
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_BACK_01_00");	//Vrátíme se k našemu rozhovoru.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_BACK_01_01");	//Nech mě na pokoji!
	AI_StopProcessInfos(self);
};

func void DIA_Hodges_DarkWeb_Done_DoIt()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_00");	//Podívej, je to moc důležité.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_01");	//Lord Hagen běsní! Hledá vraha Lothara a dříve či později se dostane k tobě.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_02");	//A potom ti nikdo nepomůže. Ani Lee nebo jeho žoldáci.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_03");	//Proto je ve tvém vlastním zájmu mi říct, jak to bylo doopravdy, nebo řeknu lordu Hagenovi, že jsem našel vraha jeho paladina.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_04");	//CO?! JAK, ty... to nedělej!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_05");	//Ještě uvidíš.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_06");	//Sakra! Dobře, Beliar s vámi. Řeknu ti všechno, co vím.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_07");	//Ale slib, že o tom nikomu nepovíš.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_08");	//Slibuju. Můžeš začít. 
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_09");	//Tu noc jsem opravdu pil v hospodě u Coragona a po několika hodinách zábavy jsem chtěl na záchod.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_10");	//Pak jsem šel k jižní bráně města, našel jsem na samotě keř a teprve potom jsem si rozhodl ulevit, když tu náhle...
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_11");	//Co?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_12");	//... nedaleko jsem spatřil paladina a dokonce i nějaké lidi v černém, temném hávu. Byli jako mágové. 
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_13");	//Stáli vedle sebe a já přemýšlel o tom, co si říkají.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_14");	//Pak druhý vzal nějakou knihu a začal číst, zcela neznámně a řekl jediné slovo.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_15");	//Skutečně z nich mám ještě stále husí kůži!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_16");	//Jaké slovo?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_17");	//Och... Nevzpomínám si, ale zdá se, že pronášel nějaké magické kouzlo.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_18");	//A paladin?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_19");	//Stál jako mrtvý. Byl jsem překvapený jeho klidnou reakcí na to, co se dělo.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_20");	//A pak jsem viděl, jak začal svítit svitek toho mága a odhodil paladina.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_21");	//Zřejmě bylo už moc pozdě. Jeho společník objal jeho tělo a z paladina vypukl oheň.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_22");	//Padl na zem a nehýbal se.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_23");	//A ten druhý?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_24");	//Druhý, jak se zdálo se vytratil. Byl tam - pak záblesk a už si ho nepamatuji... to je všechno. 
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_25");	//A co jsi udělal?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_26");	//Pochcal se strachy! Všechno proběhlo potichu, stejně jako potichu ležel paladin na zemi. Ale on byl mrtvý.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_27");	//Sebral jsem svitek, který upustil vrah, chtěl jsem si ho prohlédnout. Bolestně jsem přemýšlel, co je tam napsáno.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_28");	//Ale v té chvíli tam běžela i městská stráž! Snažili se mě chytit, ale že jsem si dal, strhal jsem se na umřití.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_29");	//To je vše. Pak tři dny pití v hospodě. Nemohl jsem se uklidnit...
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_30");	//Dobře, neboj. Všechno je u konce!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_31");	//Udělal jsi správnou věc, když si mi to řekl. A taky je správně, že sis neprohlížel ten svitek.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_32");	//Mohl by tě snadno zabít. Mimochodem, máš ho s sebou?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_33");	//Ano, je to tady. Můžeš si to vzít. Jsem zděšen pouze při vzpomínce na něj. Ale bál jsem se to vyhodit.
	B_GiveInvItems(self,other,ItMi_DarkScroll,1);
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_34");	//Děkuju.
	HodjesBookGive = TRUE;
	B_LogEntry(TOPIC_DarkWeb,"Povedlo se mi přesvědčit Hodgese říct mi pravdu. Zdá se, že Lothar byl zabit bytostí v černém. Zabili ho magií, to je důvod proč nejsou na místě známky boje. Byl znehybněn, aby nemohl vzdorovat, potom ho usmrtili a bylo pozdě. Musím se zamyslet co s tím svitkem...");
	AI_StopProcessInfos(self);
};