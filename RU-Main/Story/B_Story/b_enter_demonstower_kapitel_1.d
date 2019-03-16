
func void b_enter_demonstower_kapitel_1()
{
};


var int enterdemonstower_kapitel2;

func void b_enter_demonstower_kapitel_2()
{
	if(ENTERDEMONSTOWER_KAPITEL2 == FALSE)
	{
		ENTERDEMONSTOWER_KAPITEL2 = TRUE;
	};
};


var int enterdemonstower_kapitel3;

func void b_enter_demonstower_kapitel_3()
{
	if(ENTERDEMONSTOWER_KAPITEL3 == FALSE)
	{
		ENTERDEMONSTOWER_KAPITEL3 = TRUE;
	};
};


var int enterdemonstower_kapitel4;

func void b_enter_demonstower_kapitel_4()
{
	if(ENTERDEMONSTOWER_KAPITEL4 == FALSE)
	{
		ENTERDEMONSTOWER_KAPITEL4 = TRUE;
	};
};


var int enterdemonstower_kapitel5;

func void b_enter_demonstower_kapitel_5()
{
	if(ENTERDEMONSTOWER_KAPITEL5 == FALSE)
	{
		ENTERDEMONSTOWER_KAPITEL5 = TRUE;
	};
};


var int enterdemonstower_kapitel6;

func void b_enter_demonstower_kapitel_6()
{
	if(ENTERFREEMINE_KAPITEL6 == FALSE)
	{
		ENTERDEMONSTOWER_KAPITEL6 = TRUE;
	};
};

func void b_enter_demonstower()
{
	var C_Npc shemroncheck;
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_demonstower_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_demonstower_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_demonstower_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_demonstower_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_demonstower_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_demonstower_kapitel_6();
	};
	if((MIS_HROMANINQUEST == LOG_Running) && (CHAPTER4 == TRUE) && (CHAPTER5_Insert == FALSE))
	{
		Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_01");
		Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_02");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"DT_HROMANIN_GUARD_03");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"DT_HROMANIN_GUARD_04");
		Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_05");
		Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_06");
		Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_07");
		Wld_InsertItem(ITWR_HROMANIN_5,"FP_ITEM_HROMANIN_05");
		CHAPTER5_Insert = TRUE;
	};
	if(SHEMRONKNOWS == TRUE)
	{
		shemroncheck = Hlp_GetNpc(shemron_demon);
		shemroncheck.name[0] = "Шемрон, пятый демон легиона Элигора";
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = DEMONSTOWER_ZEN;
	B_InitNpcGlobals();
};

