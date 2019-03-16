
func void b_enter_firecave_kapitel_1()
{
};


var int enterfirecave_kapitel2;

func void b_enter_firecave_kapitel_2()
{
	if(ENTERFIRECAVE_KAPITEL2 == FALSE)
	{
		ENTERFIRECAVE_KAPITEL2 = TRUE;
	};
};


var int enterfirecave_kapitel3;

func void b_enter_firecave_kapitel_3()
{
	if(ENTERFIRECAVE_KAPITEL3 == FALSE)
	{
		ENTERFIRECAVE_KAPITEL3 = TRUE;
	};
};


var int enterfirecave_kapitel4;

func void b_enter_firecave_kapitel_4()
{
	if(ENTERFIRECAVE_KAPITEL4 == FALSE)
	{
		ENTERFIRECAVE_KAPITEL4 = TRUE;
	};
};


var int enterfirecave_kapitel5;

func void b_enter_firecave_kapitel_5()
{
	if(ENTERFIRECAVE_KAPITEL5 == FALSE)
	{
		ENTERFIRECAVE_KAPITEL5 = TRUE;
	};
};


var int enterfirecave_kapitel6;

func void b_enter_firecave_kapitel_6()
{
	if(ENTERFIRECAVE_KAPITEL6 == FALSE)
	{
		ENTERFIRECAVE_KAPITEL6 = TRUE;
	};
};

func void b_enter_firecave()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_firecave_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_firecave_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_firecave_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_firecave_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_firecave_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_firecave_kapitel_6();
	};

	Wld_SetTime(12,0);
	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = FIRECAVE_ZEN;
	B_InitNpcGlobals();
};


var int enterginnokworld_kapitel1;

func void b_enter_ginnokworld_kapitel_1()
{
	if(ENTERginnokworld_KAPITEL1 == FALSE)
	{
		ENTERginnokworld_KAPITEL1 = TRUE;
	};
};

var int enterginnokworld_kapitel2;

func void b_enter_ginnokworld_kapitel_2()
{
	if(ENTERginnokworld_KAPITEL2 == FALSE)
	{
		ENTERginnokworld_KAPITEL2 = TRUE;
	};
};


var int enterginnokworld_kapitel3;

func void b_enter_ginnokworld_kapitel_3()
{
	if(ENTERginnokworld_KAPITEL3 == FALSE)
	{
		ENTERginnokworld_KAPITEL3 = TRUE;
	};
};


var int enterginnokworld_kapitel4;

func void b_enter_ginnokworld_kapitel_4()
{
	if(ENTERginnokworld_KAPITEL4 == FALSE)
	{
		ENTERginnokworld_KAPITEL4 = TRUE;
	};
};


var int enterginnokworld_kapitel5;

func void b_enter_ginnokworld_kapitel_5()
{
	if(ENTERginnokworld_KAPITEL5 == FALSE)
	{
		ENTERginnokworld_KAPITEL5 = TRUE;
	};
};


var int enterginnokworld_kapitel6;

func void b_enter_ginnokworld_kapitel_6()
{
	if(ENTERginnokworld_KAPITEL6 == FALSE)
	{
		ENTERginnokworld_KAPITEL6 = TRUE;
	};
};

func void b_enter_ginnokworld()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_ginnokworld_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_ginnokworld_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_ginnokworld_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_ginnokworld_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_ginnokworld_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_ginnokworld_kapitel_6();
	};
	Wld_SetTime(12,0);
	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = GINNOKWORLD_ZEN;
	B_InitNpcGlobals();
};

func void b_enter_DragonTemple_kapitel_1()
{
};

var int enterDragonTemple_kapitel2;

func void b_enter_DragonTemple_kapitel_2()
{
	if(ENTERDragonTemple_KAPITEL2 == FALSE)
	{
		ENTERDragonTemple_KAPITEL2 = TRUE;
	};
};

var int enterDragonTemple_kapitel3;

func void b_enter_DragonTemple_kapitel_3()
{
	if(ENTERDragonTemple_KAPITEL3 == FALSE)
	{
		ENTERDragonTemple_KAPITEL3 = TRUE;
	};
};

var int enterDragonTemple_kapitel4;

func void b_enter_DragonTemple_kapitel_4()
{
	if(ENTERDragonTemple_KAPITEL4 == FALSE)
	{
		ENTERDragonTemple_KAPITEL4 = TRUE;
	};
};


var int enterDragonTemple_kapitel5;

func void b_enter_DragonTemple_kapitel_5()
{
	if(ENTERDragonTemple_KAPITEL5 == FALSE)
	{
		ENTERDragonTemple_KAPITEL5 = TRUE;
	};
};

var int enterDragonTemple_kapitel6;

func void b_enter_DragonTemple_kapitel_6()
{
	if(ENTERDragonTemple_KAPITEL6 == FALSE)
	{
		Wld_InsertNpc(Dragon_Undead,"DRT_BOSS");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_START_02");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_START_01");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_11");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_02");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_01");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_04");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_03");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_06");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_05");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_TOPLEVEL_02");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_TOPLEVEL_06");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_TOPLEVEL_03");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_TOPLEVEL_05");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_FLOOR_03");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_09");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_FLOOR_05");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_FLOOR_04");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FIREGOLEM_HALL_01");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FIREGOLEM_HALL_03");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FIREGOLEM_HALL_04");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FIREGOLEM_HALL_05");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FINALPATH_01");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FINALPATH_04");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FINAL_02");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FIREDEVIL_01");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_FIREDEVIL_02");
		Wld_InsertNpc(Skeleton_Lord_Champion,"FP_ROAM_LOA_DRACHENTEMPEL_MAIN_FLOOR_08");
		ENTERDragonTemple_KAPITEL6 = TRUE;
	};
};

func void b_enter_dragontemple()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_DragonTemple_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_DragonTemple_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_DragonTemple_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_DragonTemple_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_DragonTemple_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_DragonTemple_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = DRAGONTEMPLE_ZEN;
	B_InitNpcGlobals();
};

func void b_enter_Goldmine_kapitel_1()
{
};

var int enterGoldmine_kapitel2;

func void b_enter_Goldmine_kapitel_2()
{
	if(ENTERGoldmine_KAPITEL2 == FALSE)
	{
		ENTERGoldmine_KAPITEL2 = TRUE;
	};
};

var int enterGoldmine_kapitel3;

func void b_enter_Goldmine_kapitel_3()
{
	if(ENTERGoldmine_KAPITEL3 == FALSE)
	{
		ENTERGoldmine_KAPITEL3 = TRUE;
	};
};

var int enterGoldmine_kapitel4;

func void b_enter_Goldmine_kapitel_4()
{
	if(ENTERGoldmine_KAPITEL4 == FALSE)
	{
		ENTERGoldmine_KAPITEL4 = TRUE;
	};
};


var int enterGoldmine_kapitel5;

func void b_enter_Goldmine_kapitel_5()
{
	if(ENTERGoldmine_KAPITEL5 == FALSE)
	{
		ENTERGoldmine_KAPITEL5 = TRUE;
	};
};

var int enterGoldmine_kapitel6;

func void b_enter_Goldmine_kapitel_6()
{
	if(ENTERGoldmine_KAPITEL6 == FALSE)
	{
		ENTERGoldmine_KAPITEL6 = TRUE;
	};
};

func void b_enter_Goldmine()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_Goldmine_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_Goldmine_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_Goldmine_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_Goldmine_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_Goldmine_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_Goldmine_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = GOLDMINE_ZEN;
	B_InitNpcGlobals();
};