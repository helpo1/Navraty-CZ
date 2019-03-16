
func void b_enter_abandonedmine_kapitel_1()
{
};


var int enterabandonedmine_kapitel2;

func void b_enter_abandonedmine_kapitel_2()
{
	if(ENTERABANDONEDMINE_KAPITEL2 == FALSE)
	{
		ENTERABANDONEDMINE_KAPITEL2 = TRUE;
	};
};


var int enterabandonedmine_kapitel3;

func void b_enter_abandonedmine_kapitel_3()
{
	if(ENTERABANDONEDMINE_KAPITEL3 == FALSE)
	{
		ENTERABANDONEDMINE_KAPITEL3 = TRUE;
	};
};


var int enterabandonedmine_kapitel4;

func void b_enter_abandonedmine_kapitel_4()
{
	if(ENTERABANDONEDMINE_KAPITEL4 == FALSE)
	{
		ENTERABANDONEDMINE_KAPITEL4 = TRUE;
	};
};


var int enterabandonedmine_kapitel5;

func void b_enter_abandonedmine_kapitel_5()
{
	if(ENTERABANDONEDMINE_KAPITEL5 == FALSE)
	{
		ENTERABANDONEDMINE_KAPITEL5 = TRUE;
	};
};


var int enterabandonedmine_kapitel6;

func void b_enter_abandonedmine_kapitel_6()
{
	if(ENTERABANDONEDMINE_KAPITEL6 == FALSE)
	{
		if(Npc_IsDead(skeleton_warrior_dark_watershpere) && (MINEMAGEISDEAD == FALSE))
		{
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_01");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_02");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_03");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_04");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_05");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_06");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_07");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_08");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_09");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_10");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_11");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_12");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_13");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_14");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_15");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_16");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_17");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_18");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_19");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_20");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_21");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_22");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_23");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_24");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_25");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_26");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_27");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_28");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_29");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_30");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_31");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_32");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_33");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_34");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_35");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_36");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_37");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_38");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_39");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_40");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_41");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_42");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_43");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_44");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_45");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_46");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_47");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_48");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_49");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_50");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_51");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_52");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_53");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_54");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_55");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_56");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_57");
			Wld_InsertNpc(Minecrawler,"FP_ROAM_ABANDONEDMINE_58");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_59");
			Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_ABANDONEDMINE_60");
			Wld_InsertNpc(minecrawlerqueen,"AM_40");
			MINEMAGEISDEAD = TRUE;
		};

		ENTERABANDONEDMINE_KAPITEL6 = TRUE;
	};
};

func void b_enter_abandonedmine()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_abandonedmine_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_abandonedmine_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_abandonedmine_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_abandonedmine_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_abandonedmine_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_abandonedmine_kapitel_6();
	};
	if((MIS_HROMANINQUEST == LOG_Running) && (CHAPTER1 == TRUE) && (CHAPTER2_Insert == FALSE))
	{
		Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_01");
		Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_02");
		Wld_InsertNpc(skeleton,"AM_HROMANIN_GUARD_03");
		Wld_InsertItem(ITWR_HROMANIN_2,"FP_ITEM_HROMANIN_02");
		CHAPTER2_Insert = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ABANDONEDMINE_ZEN;
	B_InitNpcGlobals();
};

