
func void b_enter_guardianchambers_kapitel_1()
{
};


var int enterguardianchambers_kapitel2;

func void b_enter_guardianchambers_kapitel_2()
{
	if(ENTERGUARDIANCHAMBERS_KAPITEL2 == FALSE)
	{
		ENTERGUARDIANCHAMBERS_KAPITEL2 = TRUE;
	};
};


var int enterguardianchambers_kapitel3;

func void b_enter_guardianchambers_kapitel_3()
{
	if(ENTERGUARDIANCHAMBERS_KAPITEL3 == FALSE)
	{
		ENTERGUARDIANCHAMBERS_KAPITEL3 = TRUE;
	};
};


var int enterguardianchambers_kapitel4;

func void b_enter_guardianchambers_kapitel_4()
{
	if(ENTERGUARDIANCHAMBERS_KAPITEL4 == FALSE)
	{
		ENTERGUARDIANCHAMBERS_KAPITEL4 = TRUE;
	};
};


var int enterguardianchambers_kapitel5;

func void b_enter_guardianchambers_kapitel_5()
{
	if(ENTERGUARDIANCHAMBERS_KAPITEL5 == FALSE)
	{
		ENTERGUARDIANCHAMBERS_KAPITEL5 = TRUE;
	};
};


var int enterguardianchambers_kapitel6;

func void b_enter_guardianchambers_kapitel_6()
{
	if(ENTERGUARDIANCHAMBERS_KAPITEL6 == FALSE)
	{
		ENTERGUARDIANCHAMBERS_KAPITEL6 = TRUE;
	};
};

func void b_enter_guardianchambers()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_guardianchambers_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_guardianchambers_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_guardianchambers_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_guardianchambers_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_guardianchambers_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_guardianchambers_kapitel_6();
	};
	if(PLAYVIDEOGUARDIANS == FALSE)
	{
		PlayVideo("RET2_TeleportGuardians.bik");
		PLAYVIDEOGUARDIANS = TRUE;
	};
	if((DAGOTTELLALL == TRUE) && (TRFGUARDDONE == FALSE))
	{
		B_StartOtherRoutine(dmt_12120_dagot,"TOT");
		B_StartOtherRoutine(dmt_12130_morius,"TOT");
		B_StartOtherRoutine(dmt_12140_tegon,"TOT");
		B_StartOtherRoutine(dmt_12150_kelios,"TOT");
		B_StartOtherRoutine(dmt_12160_demos,"TOT");
		B_StartOtherRoutine(dmt_12170_farion,"TOT");
		B_StartOtherRoutine(dmt_12180_gader,"TOT");
		B_StartOtherRoutine(dmt_12190_narus,"TOT");
		B_StartOtherRoutine(dmt_12200_wakon,"TOT");
		B_StartOtherRoutine(xor_12201_warriornature,"TOT");
		B_StartOtherRoutine(xor_12202_warriornature,"TOT");
		B_StartOtherRoutine(xor_12203_warriornature,"TOT");
		B_StartOtherRoutine(xor_12204_warriornature,"TOT");
		B_StartOtherRoutine(xor_12205_terinaks,"TOT");
		B_StartOtherRoutine(dmt_12970_stonnos,"TOT");

		Wld_InsertNpc(GuardChamber_Demon,"WP_GUARDIANS_14");
		Wld_InsertNpc(GuardChamber_Demon,"WP_GUARDIANS_15");
		Wld_InsertNpc(GuardChamber_Demon,"WP_GUARDIANS_DEMON_03");
		Wld_InsertNpc(GuardChamber_Demon,"WP_GUARDIANS_DEMON_04");
		Wld_InsertNpc(GuardChamber_Demon_Portal,"WP_GUARDIANS_24");

		Wld_InsertNpc(dmt_12971_stonnos,"WP_GUARDIANS_STONNOS");

		if(ONCEOPENSTONNOSCHAMBER == TRUE)
		{
			Wld_SendTrigger("EVT_ENTER_STONNOSCHAMBER");
			CANREOPENGATEAFTERDEATH = TRUE;
		};
	
		TRFGUARDDONE = TRUE;
	};

	Wld_SetTime(20,0);
	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = GUARDIANCHAMBERS_ZEN;
	GuardChamberCount = FALSE;
	B_InitNpcGlobals();
};

func void b_enter_haosworld_kapitel_1()
{
};


var int enterhaosworld_kapitel2;

func void b_enter_haosworld_kapitel_2()
{
	if(ENTERhaosworld_KAPITEL2 == FALSE)
	{
		ENTERhaosworld_KAPITEL2 = TRUE;
	};
};


var int enterhaosworld_kapitel3;

func void b_enter_haosworld_kapitel_3()
{
	if(ENTERhaosworld_KAPITEL3 == FALSE)
	{
		ENTERhaosworld_KAPITEL3 = TRUE;
	};
};


var int enterhaosworld_kapitel4;

func void b_enter_haosworld_kapitel_4()
{
	if(ENTERhaosworld_KAPITEL4 == FALSE)
	{
		ENTERhaosworld_KAPITEL4 = TRUE;
	};
};


var int enterhaosworld_kapitel5;

func void b_enter_haosworld_kapitel_5()
{
	if(ENTERhaosworld_KAPITEL5 == FALSE)
	{
		ENTERhaosworld_KAPITEL5 = TRUE;
	};
};


var int enterhaosworld_kapitel6;

func void b_enter_haosworld_kapitel_6()
{
	if(ENTERhaosworld_KAPITEL6 == FALSE)
	{
		ENTERhaosworld_KAPITEL6 = TRUE;
	};
};

func void b_enter_haosworld()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_haosworld_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_haosworld_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_haosworld_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_haosworld_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_haosworld_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_haosworld_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = HAOSWORLD_ZEN;
	B_InitNpcGlobals();
};

func void b_enter_pashalworld_kapitel_1()
{
};


var int enterpashalworld_kapitel2;

func void b_enter_pashalworld_kapitel_2()
{
	if(ENTERpashalworld_KAPITEL2 == FALSE)
	{
		ENTERpashalworld_KAPITEL2 = TRUE;
	};
};


var int enterpashalworld_kapitel3;

func void b_enter_pashalworld_kapitel_3()
{
	if(ENTERpashalworld_KAPITEL3 == FALSE)
	{
		ENTERpashalworld_KAPITEL3 = TRUE;
	};
};


var int enterpashalworld_kapitel4;

func void b_enter_pashalworld_kapitel_4()
{
	if(ENTERpashalworld_KAPITEL4 == FALSE)
	{
		ENTERpashalworld_KAPITEL4 = TRUE;
	};
};


var int enterpashalworld_kapitel5;

func void b_enter_pashalworld_kapitel_5()
{
	if(ENTERpashalworld_KAPITEL5 == FALSE)
	{
		ENTERpashalworld_KAPITEL5 = TRUE;
	};
};


var int enterpashalworld_kapitel6;

func void b_enter_pashalworld_kapitel_6()
{
	if(ENTERpashalworld_KAPITEL6 == FALSE)
	{
		ENTERpashalworld_KAPITEL6 = TRUE;
	};
};

func void b_enter_pashalworld()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_pashalworld_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_pashalworld_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_pashalworld_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_pashalworld_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_pashalworld_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_pashalworld_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = PASHALWORLD_ZEN;
	B_InitNpcGlobals();
};