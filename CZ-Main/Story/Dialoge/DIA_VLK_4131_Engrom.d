
instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HALLO(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HALLO_Info;
	description = "Jak se vede?";
};


func int DIA_Engrom_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Naprd.
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Hmmm...
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//Co mužu říct. Celé dny nemužem koukat na nic jiného než na tuhle zatracenou řeku.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Nalevo se flákají skřeti, napravo banditi a kazdý den jím akorát číhavčí maso. Víš, už mi to všecko leze krkem.
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = "A nikdy jsi nepřemýšlel, že odtud odjedeš?";
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//A nikdy jsi nepřemýšlel, že odtud odjedeš?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//No jasne, to přeci není vubec žádný problém!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Nejdřív se prosekám tlupami skřetů, pozdravím všecky ty ostatní příšery, co tu všude procházejí, a pak proste projdu prusmykem!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//To by přece zvládlo i malé dítě.
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Já se sem ale taky dostal.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Chceš mi nakukat, žes proste prošel prusmykem?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//V podstate jo!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Tak to jsi mel teda kliku. Dokud tu bude všechno vzhuru nohama, ani se odsud nehnu.
};


instance DIA_Engrom_Jagd(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = "Jak jde lov?";
};

func int DIA_Engrom_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Jedinou útěchu vidím v lovu, ale rád bych tu někdy viděl i něco jiného než pořád ty nechutný číhavce.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP4_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP4_EXIT_Condition;
	information = DIA_Engrom_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = "Tak co, jde to dobře?";
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = "Posedlo tě zlo.";
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Posedlo tě zlo.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Dovol mi, abych ti pomohl.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(křičí) Nesahej na mě!
	B_NpcClearObsessionByDMT(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,ZS_Flee,0,"");
};


instance DIA_Engrom_KAP5_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP5_EXIT_Condition;
	information = DIA_Engrom_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP6_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP6_EXIT_Condition;
	information = DIA_Engrom_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_PICKPOCKET(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 900;
	condition = DIA_Engrom_PICKPOCKET_Condition;
	information = DIA_Engrom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Engrom_PICKPOCKET_Condition()
{
	return C_Beklauen(10,5);
};

func void DIA_Engrom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,Dialog_Back,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

instance DIA_Engrom_Goblins(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Goblins_Condition;
	information = DIA_Engrom_Goblins_Info;
	permanent = FALSE;
	description = "Vyzerá, že tě něco trápí.";
};

func int DIA_Engrom_Goblins_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Goblins_Info()
{
	AI_Output(other,self,"DIA_Engrom_Goblins_01_01");	//Vyzerá, že tě něco trápí.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_02");	//To ti goblini. (nervónze) Prokletí goblini.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_03");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_Engrom_Goblins_01_04");	//Chlape, mluvím o goblinech, který jse usadili v jeskyni pod náma.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_05");	//Dohánějí me k šílenství více než všetci ti skřeti okolo hradu.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_06");	//A ty by si se jich chtěl zbavit.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_07");	//Och, to by bolo dokonalé! Ale...
	AI_Output(other,self,"DIA_Engrom_Goblins_01_08");	//Nejaký problém?
	AI_Output(self,other,"DIA_Engrom_Goblins_01_09");	//Problém je, že se na ne nemužu odhodlat.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_10");	//Príliš jse bojím výšek nato abych skočil a jít dokola je hotová sebevražda.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_11");	//Chápu. Radši tu budeš sedeť a časem se scvokneš. Dobrá volba!
	AI_Output(self,other,"DIA_Engrom_Goblins_01_12");	//Velmi vtipné. (Zatrpklo) Nemáš potuchy, co za strašné zvuky v noci vychádzajú z té jeskyně.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_13");	//Jinak bych ti to ani nespomínal.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_14");	//Dobře! Jestli pujdu okolo skusím se o ty tvé gobliny postarat.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_15");	//Urob mi laskavost! Veř mi, nezustanu ti nic dlžný.
	MIS_EngromGoblins = LOG_Running;
	Log_CreateTopic(TOPIC_EngromGoblins,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EngromGoblins,LOG_Running);
	B_LogEntry(TOPIC_EngromGoblins,"Lovec Engrom pomaly ale jistě šílí díky goblinum, který se usadili v jeskyni poblíž. Byl by vděčný kdybych se o ně postaral.");
};


instance DIA_Engrom_Goblins_Done(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Goblins_Done_Condition;
	information = DIA_Engrom_Goblins_Done_Info;
	permanent = FALSE;
	description = "Dneska si užiješ tichou noc.";
};

func int DIA_Engrom_Goblins_Done_Condition()
{
	if((MIS_EngromGoblins == LOG_Running) && (Npc_IsDead(Engrom_Goblin_01) == TRUE) && (Npc_IsDead(Engrom_Goblin_02) == TRUE) && (Npc_IsDead(Engrom_Goblin_03) == TRUE) && (Npc_IsDead(Engrom_Goblin_04) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Goblins_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Engrom_Goblins_Done_01_01");	//Dneska si užiješ tichou noc.
	AI_Output(self,other,"DIA_Engrom_Goblins_Done_01_02");	//Díky ti kámo, konečne se pořádne vyspím.
	AI_Output(self,other,"DIA_Engrom_Goblins_Done_01_03");	//Vem si tuhle kuži ze stínové šelmy. 
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	AI_Output(self,other,"DIA_Engrom_Goblins_Done_01_04");	//To je vše, co ti mužu nabídnout.
	AI_Output(other,self,"DIA_Engrom_Goblins_Done_01_05");	//V pořádku, to stačí.
	MIS_EngromGoblins = LOG_Success;
	Log_SetTopicStatus(TOPIC_EngromGoblins,LOG_Success);
	B_LogEntry(TOPIC_EngromGoblins,"Řekl jsem Engromovi, že už muže klindě spávat. Jako podekování mi dal kuži ze stínové šelmy.");
};