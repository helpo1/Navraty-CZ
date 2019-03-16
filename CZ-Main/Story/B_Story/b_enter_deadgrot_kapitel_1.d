
func void b_enter_deadgrot_kapitel_1()
{
};


var int enterdeadgrot_kapitel2;

func void b_enter_deadgrot_kapitel_2()
{
	if(ENTERDEADGROT_KAPITEL2 == FALSE)
	{
		ENTERDEADGROT_KAPITEL2 = TRUE;
	};
};


var int enterdeadgrot_kapitel3;

func void b_enter_deadgrot_kapitel_3()
{
	if(ENTERDEADGROT_KAPITEL3 == FALSE)
	{
		ENTERDEADGROT_KAPITEL3 = TRUE;
	};
};


var int enterdeadgrot_kapitel4;

func void b_enter_deadgrot_kapitel_4()
{
	if(ENTERDEADGROT_KAPITEL4 == FALSE)
	{
		ENTERDEADGROT_KAPITEL4 = TRUE;
	};
};


var int enterdeadgrot_kapitel5;

func void b_enter_deadgrot_kapitel_5()
{
	if(ENTERDEADGROT_KAPITEL5 == FALSE)
	{
		ENTERDEADGROT_KAPITEL5 = TRUE;
	};
};


var int enterdeadgrot_kapitel6;

func void b_enter_deadgrot_kapitel_6()
{
	if(ENTERFREEMINE_KAPITEL6 == FALSE)
	{
		ENTERDEADGROT_KAPITEL6 = TRUE;
	};
};

func void b_enter_deadgrot()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_deadgrot_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_deadgrot_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_deadgrot_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_deadgrot_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_deadgrot_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_deadgrot_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = DEADGROT_ZEN;
	B_InitNpcGlobals();
};

