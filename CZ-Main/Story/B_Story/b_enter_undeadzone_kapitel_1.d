
func void b_enter_undeadzone_kapitel_1()
{
};


var int enterundeadzone_kapitel2;

func void b_enter_undeadzone_kapitel_2()
{
	if(ENTERUNDEADZONE_KAPITEL2 == FALSE)
	{
		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(Stalker,"UZ_NOIRRET");
		};

		ENTERUNDEADZONE_KAPITEL2 = TRUE;
	};
};


var int enterundeadzone_kapitel3;

func void b_enter_undeadzone_kapitel_3()
{
	if(ENTERUNDEADZONE_KAPITEL3 == FALSE)
	{
		ENTERUNDEADZONE_KAPITEL3 = TRUE;
	};
};


var int enterundeadzone_kapitel4;

func void b_enter_undeadzone_kapitel_4()
{
	if(ENTERUNDEADZONE_KAPITEL4 == FALSE)
	{
		ENTERUNDEADZONE_KAPITEL4 = TRUE;
	};
};


var int enterundeadzone_kapitel5;

func void b_enter_undeadzone_kapitel_5()
{
	if(ENTERUNDEADZONE_KAPITEL5 == FALSE)
	{
		ENTERUNDEADZONE_KAPITEL5 = TRUE;
	};
};


var int enterundeadzone_kapitel6;

func void b_enter_undeadzone_kapitel_6()
{
	if(ENTERUNDEADZONE_KAPITEL6 == FALSE)
	{
		ENTERUNDEADZONE_KAPITEL6 = TRUE;
	};
};

func void b_enter_undeadzone()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_undeadzone_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_undeadzone_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_undeadzone_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_undeadzone_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_undeadzone_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_undeadzone_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = UNDEADZONE_ZEN;
	B_InitNpcGlobals();
};

