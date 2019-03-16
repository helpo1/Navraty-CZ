
func void b_enter_oldmine_kapitel_1()
{
};


var int enteroldmine_kapitel2;

func void b_enter_oldmine_kapitel_2()
{
	if(ENTEROLDMINE_KAPITEL2 == FALSE)
	{
		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(Shivana,"OM_HROMANIN_GUARD_03");
			Wld_InsertNpc(Minecrawler,"OM_038");
			Wld_InsertNpc(Minecrawler,"OM_039");
			Wld_InsertNpc(MinecrawlerWarrior,"OM_189");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_94");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_89");
			Wld_InsertNpc(Minecrawler,"OM_024");
			Wld_InsertNpc(Minecrawler,"OM_028");
			Wld_InsertNpc(Minecrawler,"OM_030");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER17_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER19_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER20_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER21_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER21_03");
			Wld_InsertNpc(skeleton_dark,"FP_ROAM_DEMON_03");
			Wld_InsertNpc(skeleton_dark,"FP_ROAM_DEMON_05");
			Wld_InsertNpc(skeleton_dark,"FP_ROAM_DEMON_07");
			Wld_InsertNpc(skeleton_dark,"FP_ROAM_DEMON_09");
			Wld_InsertNpc(skeleton_dark,"FP_ROAM_DEMON_11");
		};

		ENTEROLDMINE_KAPITEL2 = TRUE;
	};
};


var int enteroldmine_kapitel3;

func void b_enter_oldmine_kapitel_3()
{
	if(ENTEROLDMINE_KAPITEL3 == FALSE)
	{
		ENTEROLDMINE_KAPITEL3 = TRUE;
	};
};


var int enteroldmine_kapitel4;

func void b_enter_oldmine_kapitel_4()
{
	if(ENTEROLDMINE_KAPITEL4 == FALSE)
	{
		ENTEROLDMINE_KAPITEL4 = TRUE;
	};
};


var int enteroldmine_kapitel5;

func void b_enter_oldmine_kapitel_5()
{
	if(ENTEROLDMINE_KAPITEL5 == FALSE)
	{
		ENTEROLDMINE_KAPITEL5 = TRUE;
	};
};


var int enteroldmine_kapitel6;

func void b_enter_oldmine_kapitel_6()
{
	if(ENTEROLDMINE_KAPITEL6 == FALSE)
	{
		if(Npc_IsDead(skeleton_warrior_dark_fireshpere) && (OLDMINEISAGAIN == FALSE))
		{
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_03");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_05");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_06");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_07");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_08");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_09");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_10");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_11");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_12");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_13");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_14");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_15");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_16");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_17");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_18");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_19");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_20");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_21");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_22");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_23");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_24");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_25");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_26");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_27");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_28");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_29");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_30");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_31");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_32");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_33");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_34");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_35");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_36");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_37");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_38");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_39");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_40");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_41");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_42");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_43");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_44");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_45");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_46");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_47");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_48");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_49");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_50");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_51");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_52");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_53");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_OM_54");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_OM_55");
			Wld_InsertNpc(Minecrawler,"OM_033");
			Wld_InsertNpc(Minecrawler,"OM_038");
			Wld_InsertNpc(Minecrawler,"OM_039");
			Wld_InsertNpc(Minecrawler,"OM_042");
			Wld_InsertNpc(Minecrawler,"OM_043");
			Wld_InsertNpc(MinecrawlerWarrior,"OM_190");
			Wld_InsertNpc(MinecrawlerWarrior,"OM_189");
			Wld_InsertNpc(MinecrawlerWarrior,"OM_191");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_95");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_94");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_89");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_88");
			Wld_InsertNpc(Minecrawler,"OM_CAVE1_76");
			Wld_InsertNpc(Minecrawler,"OM_024");
			Wld_InsertNpc(Minecrawler,"OM_028");
			Wld_InsertNpc(Minecrawler,"OM_030");
			Wld_InsertNpc(Minecrawler,"OM_031");
			Wld_InsertNpc(Minecrawler,"OM_133");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER16_03");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER16_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER16_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER16_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER17_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER17_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER19_01");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER19_04");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER19_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER19_03");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER20_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER20_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER21_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER21_03");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER21_01");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER21_02");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_CRAWLER22_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER22_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER22_03");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_CRAWLER22_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_01");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_02");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_03");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_04");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_05");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_06");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_07");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_08");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_09");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_10");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_DEMON_11");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_DEMON_12");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_DEMON_13");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_DEMON_14");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_DEMON_15");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_DEMON_16");
			Wld_InsertNpc(minecrawlerqueen,"OM_065");
			OLDMINEISAGAIN = TRUE;
		};

		ENTEROLDMINE_KAPITEL6 = TRUE;
	};
};

func void b_enter_oldmine()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_oldmine_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_oldmine_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_oldmine_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_oldmine_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_oldmine_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_oldmine_kapitel_6();
	};
	if((RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZENTERSOULS == FALSE))
	{
		Wld_InsertNpc(gomezworkersoul_1,"OM_GOMEZWORKERSOUL_01");
		Wld_InsertNpc(gomezworkersoul_2,"OM_GOMEZWORKERSOUL_02");
		Wld_InsertNpc(gomezworkersoul_3,"OM_GOMEZWORKERSOUL_03");
		Wld_InsertNpc(gomezworkersoul_4,"OM_GOMEZWORKERSOUL_04");
		Wld_InsertNpc(gomezworkersoul_5,"OM_GOMEZWORKERSOUL_05");
		Wld_InsertNpc(gomezworkersoul_6,"OM_GOMEZWORKERSOUL_06");
		Wld_InsertNpc(gomezworkersoul_7,"OM_GOMEZWORKERSOUL_07");
		Wld_InsertNpc(gomezworkersoul_8,"OM_GOMEZWORKERSOUL_08");
		Wld_InsertNpc(gomezworkersoul_9,"OM_GOMEZWORKERSOUL_09");
		Wld_InsertNpc(gomezworkersoul_10,"OM_GOMEZWORKERSOUL_10");
		Wld_InsertNpc(gomezworkersoul_11,"OM_GOMEZWORKERSOUL_11");
		Wld_InsertNpc(gomezworkersoul_12,"OM_GOMEZWORKERSOUL_12");
		Wld_InsertNpc(gomezworkersoul_13,"OM_GOMEZWORKERSOUL_13");
		Wld_InsertNpc(gomezworkersoul_14,"OM_GOMEZWORKERSOUL_14");
		Wld_InsertNpc(gomezworkersoul_15,"OM_GOMEZWORKERSOUL_15");
		RESCUEGOMEZENTERSOULS = TRUE;
	};
	if((MIS_HROMANINQUEST == LOG_Running) && (CHAPTER3 == TRUE) && (CHAPTER4_Insert == FALSE))
	{
		Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_01");
		Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_02");
		Wld_InsertNpc(SkeletonMage,"OM_HROMANIN_GUARD_03");
		Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_04");
		Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_05");
		Wld_InsertItem(ITWR_HROMANIN_4,"FP_ITEM_HROMANIN_04");
		CHAPTER4_Insert = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = OLDMINE_ZEN;
	B_InitNpcGlobals();
};

