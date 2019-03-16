
func void b_enter_freemine_kapitel_1()
{
};


var int enterfreemine_kapitel2;

func void b_enter_freemine_kapitel_2()
{
	if(ENTERFREEMINE_KAPITEL2 == FALSE)
	{
		ENTERFREEMINE_KAPITEL2 = TRUE;
	};
};


var int enterfreemine_kapitel3;

func void b_enter_freemine_kapitel_3()
{
	if(ENTERFREEMINE_KAPITEL3 == FALSE)
	{
		ENTERFREEMINE_KAPITEL3 = TRUE;
	};
};


var int enterfreemine_kapitel4;

func void b_enter_freemine_kapitel_4()
{
	if(ENTERFREEMINE_KAPITEL4 == FALSE)
	{
		ENTERFREEMINE_KAPITEL4 = TRUE;
	};
};


var int enterfreemine_kapitel5;

func void b_enter_freemine_kapitel_5()
{
	if(ENTERFREEMINE_KAPITEL5 == FALSE)
	{
		ENTERFREEMINE_KAPITEL5 = TRUE;
	};
};


var int enterfreemine_kapitel6;

func void b_enter_freemine_kapitel_6()
{
	if(ENTERFREEMINE_KAPITEL6 == FALSE)
	{
		if(Npc_IsDead(orkelite_addon4_chkflg_29) && (FREMINEISAGAIN == FALSE))
		{
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_01");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_02");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_03");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_05");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_06");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_07");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_08");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_09");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_10");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_11");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_12");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_13");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_14");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_15");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_16");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_17");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_18");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_19");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_20");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_21");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_22");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_23");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_24");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_25");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_CAMPFIRE_ORKFLAG_29");
			Wld_InsertNpc(MinecrawlerWarrior,"FM_116");
			Wld_InsertNpc(MinecrawlerWarrior,"FM_106");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_16");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_18");
			Wld_InsertNpc(MinecrawlerWarrior,"FM_66");
			Wld_InsertNpc(MinecrawlerWarrior,"FM_64");
			Wld_InsertNpc(MinecrawlerWarrior,"FM_63");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_10");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_27");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_30");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_34");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_32");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_26");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_27");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_28");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_05");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_06");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_21");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_07");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER_09");
			FREMINEISAGAIN = TRUE;
		};

		ENTERFREEMINE_KAPITEL6 = TRUE;
	};
};

func void b_enter_freemine()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_freemine_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_freemine_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_freemine_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_freemine_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_freemine_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_freemine_kapitel_6();
	};
	if((MIS_ScoutNewMine == LOG_Running) && (ScoutFreeMine == FALSE))
	{
		ScoutFreeMine = TRUE;
		B_LogEntry(TOPIC_ScoutNewMine,"Шахта захвачена орками! Навряд ли они дадут паладинам добывать тут руду. Надо сообщить об этом Гаронду. Или быть может сначала зачистить саму шахту?");
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = FREEMINE_ZEN;
	B_InitNpcGlobals();
};

var int ENTERORCMOUNTAIN_kapitel1;

func void b_enter_orcmountain_kapitel_1()
{
	if(ENTERORCMOUNTAIN_KAPITEL1 == FALSE)
	{
		ENTERORCMOUNTAIN_KAPITEL1 = TRUE;
	};
};

var int ENTERORCMOUNTAIN_kapitel2;

func void b_enter_orcmountain_kapitel_2()
{
	if(ENTERORCMOUNTAIN_KAPITEL2 == FALSE)
	{
		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(Kuta,"OZ_KUTA");
			Wld_InsertNpc(OreWarriorBug_Uinq,"FP_ROAM_RUDBUG_01_08");
		};

		ENTERORCMOUNTAIN_KAPITEL2 = TRUE;
	};
};


var int ENTERORCMOUNTAIN_kapitel3;

func void b_enter_orcmountain_kapitel_3()
{
	if(ENTERORCMOUNTAIN_KAPITEL3 == FALSE)
	{
		ENTERORCMOUNTAIN_KAPITEL3 = TRUE;
	};
};


var int ENTERORCMOUNTAIN_kapitel4;

func void b_enter_orcmountain_kapitel_4()
{
	if(ENTERORCMOUNTAIN_KAPITEL4 == FALSE)
	{
		ENTERORCMOUNTAIN_KAPITEL4 = TRUE;
	};
};


var int ENTERORCMOUNTAIN_kapitel5;

func void b_enter_orcmountain_kapitel_5()
{
	if(ENTERORCMOUNTAIN_KAPITEL5 == FALSE)
	{
		ENTERORCMOUNTAIN_KAPITEL5 = TRUE;
	};
};


var int ENTERORCMOUNTAIN_kapitel6;

func void b_enter_orcmountain_kapitel_6()
{
	if(ENTERORCMOUNTAIN_KAPITEL6 == FALSE)
	{
		ENTERORCMOUNTAIN_KAPITEL6 = TRUE;
	};
};

func void b_enter_orcmountain()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_orcmountain_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_orcmountain_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_orcmountain_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_orcmountain_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_orcmountain_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_orcmountain_kapitel_6();
	};
	if((DariusNWIns == TRUE) && (DariusRemove == FALSE))
	{
		B_RemoveNpc(SLD_852_Darius);
		DariusRemove = TRUE;
	};
	if((BretNWIns == TRUE) && (BretRemove == FALSE))
	{
		B_RemoveNpc(SLD_853_Bret);
		BretRemove = TRUE;
	};
	if((MIS_PashalQuest == LOG_SUCCESS) && (AvabulWar == FALSE))
	{
		Wld_InsertNpc(VLK_5570_Avabul,"ORM_AVABUL_01");
		B_KillNpc(DMT_4571_Jan);
		Wld_SendTrigger("EVT_ORCMOUNTAIN_HRAM_DOOR");
		AvabulWar = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ORCMOUNTAIN_ZEN;
	B_InitNpcGlobals();
};