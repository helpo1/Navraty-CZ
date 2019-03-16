var int enteradanosvalley_kapitel1;
var int CactusPlantUp;

func void b_enter_adanosvalley_kapitel_1()
{
	if(ENTERadanosvalley_KAPITEL1 == FALSE)
	{
		ENTERadanosvalley_KAPITEL1 = TRUE;
	};
};

var int enteradanosvalley_kapitel2;

func void b_enter_adanosvalley_kapitel_2()
{
	if(ENTERadanosvalley_KAPITEL2 == FALSE)
	{
		ENTERadanosvalley_KAPITEL2 = TRUE;
	};
};


var int enteradanosvalley_kapitel3;

func void b_enter_adanosvalley_kapitel_3()
{
	if(ENTERadanosvalley_KAPITEL3 == FALSE)
	{
		ENTERadanosvalley_KAPITEL3 = TRUE;
	};
};


var int enteradanosvalley_kapitel4;

func void b_enter_adanosvalley_kapitel_4()
{
	if(ENTERadanosvalley_KAPITEL4 == FALSE)
	{
		ENTERadanosvalley_KAPITEL4 = TRUE;
	};
};


var int enteradanosvalley_kapitel5;

func void b_enter_adanosvalley_kapitel_5()
{
	if(ENTERadanosvalley_KAPITEL5 == FALSE)
	{
		ENTERadanosvalley_KAPITEL5 = TRUE;
	};
};


var int enteradanosvalley_kapitel6;

func void b_enter_adanosvalley_kapitel_6()
{
	if(ENTERadanosvalley_KAPITEL6 == FALSE)
	{
		ENTERadanosvalley_KAPITEL6 = TRUE;
	};
};

func void b_enter_adanosvalley()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_adanosvalley_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_adanosvalley_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_adanosvalley_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_adanosvalley_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_adanosvalley_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_adanosvalley_kapitel_6();
	};
	if((XardasDoMagicRoot == TRUE) && (CactusPlantUp == FALSE))
	{
		Wld_InsertItem(ItPl_CactusFlower,"FP_ROAM_AV_OAZISGUARD_03_08");
		Wld_InsertItem(ItPl_CactusFlower,"FP_ROAM_AV_OAZISGUARD_01_02");
		CactusPlantUp = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ADANOSVALLEY_ZEN;
	B_InitNpcGlobals();
};

var int entertearstemple_kapitel1;

func void b_enter_tearstemple_kapitel_1()
{
	if(ENTERtearstemple_KAPITEL1 == FALSE)
	{
		ENTERtearstemple_KAPITEL1 = TRUE;
	};
};

var int entertearstemple_kapitel2;

func void b_enter_tearstemple_kapitel_2()
{
	if(ENTERtearstemple_KAPITEL2 == FALSE)
	{
		ENTERtearstemple_KAPITEL2 = TRUE;
	};
};


var int entertearstemple_kapitel3;

func void b_enter_tearstemple_kapitel_3()
{
	if(ENTERtearstemple_KAPITEL3 == FALSE)
	{
		ENTERtearstemple_KAPITEL3 = TRUE;
	};
};


var int entertearstemple_kapitel4;

func void b_enter_tearstemple_kapitel_4()
{
	if(ENTERtearstemple_KAPITEL4 == FALSE)
	{
		ENTERtearstemple_KAPITEL4 = TRUE;
	};
};


var int entertearstemple_kapitel5;

func void b_enter_tearstemple_kapitel_5()
{
	if(ENTERtearstemple_KAPITEL5 == FALSE)
	{
		ENTERtearstemple_KAPITEL5 = TRUE;
	};
};


var int entertearstemple_kapitel6;

func void b_enter_tearstemple_kapitel_6()
{
	if(ENTERtearstemple_KAPITEL6 == FALSE)
	{
		ENTERtearstemple_KAPITEL6 = TRUE;
	};
};

func void b_enter_tearstemple()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_tearstemple_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_tearstemple_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_tearstemple_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_tearstemple_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_tearstemple_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_tearstemple_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = TEARSTEMPLE_ZEN;
	B_InitNpcGlobals();
};

var int enterlostvalley_kapitel1;

func void b_enter_lostvalley_kapitel_1()
{
	if(ENTERlostvalley_KAPITEL1 == FALSE)
	{
		ENTERlostvalley_KAPITEL1 = TRUE;
	};
};

var int enterlostvalley_kapitel2;

func void b_enter_lostvalley_kapitel_2()
{
	if(ENTERlostvalley_KAPITEL2 == FALSE)
	{
		ENTERlostvalley_KAPITEL2 = TRUE;
	};
};

var int enterlostvalley_kapitel3;

func void b_enter_lostvalley_kapitel_3()
{
	if(ENTERlostvalley_KAPITEL3 == FALSE)
	{
		ENTERlostvalley_KAPITEL3 = TRUE;
	};
};

var int enterlostvalley_kapitel4;

func void b_enter_lostvalley_kapitel_4()
{
	if(ENTERlostvalley_KAPITEL4 == FALSE)
	{
		ENTERlostvalley_KAPITEL4 = TRUE;
	};
};

var int enterlostvalley_kapitel5;

func void b_enter_lostvalley_kapitel_5()
{
	if(ENTERlostvalley_KAPITEL5 == FALSE)
	{
		ENTERlostvalley_KAPITEL5 = TRUE;
	};
};

var int enterlostvalley_kapitel6;

func void b_enter_lostvalley_kapitel_6()
{
	if(ENTERlostvalley_KAPITEL6 == FALSE)
	{
		ENTERlostvalley_KAPITEL6 = TRUE;
	};
};

func void b_enter_lostvalley()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_lostvalley_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_lostvalley_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_lostvalley_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_lostvalley_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_lostvalley_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_lostvalley_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = LOSTVALLEY_ZEN;
	B_InitNpcGlobals();
};

var int enterituseldtower_kapitel1;

func void b_enter_ituseldtower_kapitel_1()
{
	if(ENTERituseldtower_KAPITEL1 == FALSE)
	{
		ENTERituseldtower_KAPITEL1 = TRUE;
	};
};

var int enterituseldtower_kapitel2;

func void b_enter_ituseldtower_kapitel_2()
{
	if(ENTERituseldtower_KAPITEL2 == FALSE)
	{
		ENTERituseldtower_KAPITEL2 = TRUE;
	};
};

var int enterituseldtower_kapitel3;

func void b_enter_ituseldtower_kapitel_3()
{
	if(ENTERituseldtower_KAPITEL3 == FALSE)
	{
		ENTERituseldtower_KAPITEL3 = TRUE;
	};
};

var int enterituseldtower_kapitel4;

func void b_enter_ituseldtower_kapitel_4()
{
	if(ENTERituseldtower_KAPITEL4 == FALSE)
	{
		ENTERituseldtower_KAPITEL4 = TRUE;
	};
};

var int enterituseldtower_kapitel5;

func void b_enter_ituseldtower_kapitel_5()
{
	if(ENTERituseldtower_KAPITEL5 == FALSE)
	{
		ENTERituseldtower_KAPITEL5 = TRUE;
	};
};

var int enterituseldtower_kapitel6;

func void b_enter_ituseldtower_kapitel_6()
{
	if(ENTERituseldtower_KAPITEL6 == FALSE)
	{
		ENTERituseldtower_KAPITEL6 = TRUE;
	};
};

func void b_enter_ituseldtower()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_ituseldtower_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_ituseldtower_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_ituseldtower_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_ituseldtower_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_ituseldtower_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_ituseldtower_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ITUSELDTOWER_ZEN;
	B_InitNpcGlobals();
};

var int enterashtartemple_kapitel1;

func void b_enter_ashtartemple_kapitel_1()
{
	if(ENTERashtartemple_KAPITEL1 == FALSE)
	{
		ENTERashtartemple_KAPITEL1 = TRUE;
	};
};

var int enterashtartemple_kapitel2;

func void b_enter_ashtartemple_kapitel_2()
{
	if(ENTERashtartemple_KAPITEL2 == FALSE)
	{
		ENTERashtartemple_KAPITEL2 = TRUE;
	};
};

var int enterashtartemple_kapitel3;

func void b_enter_ashtartemple_kapitel_3()
{
	if(ENTERashtartemple_KAPITEL3 == FALSE)
	{
		ENTERashtartemple_KAPITEL3 = TRUE;
	};
};

var int enterashtartemple_kapitel4;

func void b_enter_ashtartemple_kapitel_4()
{
	if(ENTERashtartemple_KAPITEL4 == FALSE)
	{
		ENTERashtartemple_KAPITEL4 = TRUE;
	};
};

var int enterashtartemple_kapitel5;

func void b_enter_ashtartemple_kapitel_5()
{
	if(ENTERashtartemple_KAPITEL5 == FALSE)
	{
		ENTERashtartemple_KAPITEL5 = TRUE;
	};
};

var int enterashtartemple_kapitel6;

func void b_enter_ashtartemple_kapitel_6()
{
	if(ENTERashtartemple_KAPITEL6 == FALSE)
	{
		ENTERashtartemple_KAPITEL6 = TRUE;
	};
};

func void b_enter_ashtartemple()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_ashtartemple_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_ashtartemple_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_ashtartemple_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_ashtartemple_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_ashtartemple_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_ashtartemple_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ASHTARTEMPLE_ZEN;
	B_InitNpcGlobals();
};