
func void b_enter_demoncave_kapitel_1()
{
};


var int enterdemoncave_kapitel2;

func void b_enter_demoncave_kapitel_2()
{
	if(ENTERDEMONCAVE_KAPITEL2 == FALSE)
	{
		ENTERDEMONCAVE_KAPITEL2 = TRUE;
	};
};


var int enterdemoncave_kapitel3;

func void b_enter_demoncave_kapitel_3()
{
	if(ENTERDEMONCAVE_KAPITEL3 == FALSE)
	{
		ENTERDEMONCAVE_KAPITEL3 = TRUE;
	};
};


var int enterdemoncave_kapitel4;

func void b_enter_demoncave_kapitel_4()
{
	if(ENTERDEMONCAVE_KAPITEL4 == FALSE)
	{
		ENTERDEMONCAVE_KAPITEL4 = TRUE;
	};
};


var int enterdemoncave_kapitel5;

func void b_enter_demoncave_kapitel_5()
{
	if(ENTERDEMONCAVE_KAPITEL5 == FALSE)
	{
		ENTERDEMONCAVE_KAPITEL5 = TRUE;
	};
};


var int enterdemoncave_kapitel6;

func void b_enter_demoncave_kapitel_6()
{
	if(ENTERDEMONCAVE_KAPITEL6 == FALSE)
	{
		ENTERDEMONCAVE_KAPITEL6 = TRUE;
	};
};

func void b_enter_demoncave()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_demoncave_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_demoncave_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_demoncave_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_demoncave_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_demoncave_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_demoncave_kapitel_6();
	};
	if((MIS_HROMANINQUEST == LOG_Running) && (CHAPTER2 == TRUE) && (CHAPTER3_Insert == FALSE))
	{
		Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_01");
		Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_02");
		Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_03");
		Wld_InsertItem(ITWR_HROMANIN_3,"FP_ITEM_HROMANIN_03");
		CHAPTER3_Insert = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = DEMONCAVE_ZEN;
	B_InitNpcGlobals();
};

