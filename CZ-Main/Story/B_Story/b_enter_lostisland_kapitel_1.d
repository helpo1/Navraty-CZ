
func void b_enter_lostisland_kapitel_1()
{
};


var int enterlostisland_kapitel2;

func void b_enter_lostisland_kapitel_2()
{
	if(ENTERLOSTISLAND_KAPITEL2 == FALSE)
	{
		ENTERLOSTISLAND_KAPITEL2 = TRUE;
	};
};


var int enterlostisland_kapitel3;

func void b_enter_lostisland_kapitel_3()
{
	if(ENTERLOSTISLAND_KAPITEL3 == FALSE)
	{
		ENTERLOSTISLAND_KAPITEL3 = TRUE;
	};
};


var int enterlostisland_kapitel4;

func void b_enter_lostisland_kapitel_4()
{
	if(ENTERLOSTISLAND_KAPITEL4 == FALSE)
	{
		ENTERLOSTISLAND_KAPITEL4 = TRUE;
	};
};


var int enterlostisland_kapitel5;

func void b_enter_lostisland_kapitel_5()
{
	if(ENTERLOSTISLAND_KAPITEL5 == FALSE)
	{
		ENTERLOSTISLAND_KAPITEL5 = TRUE;
	};
};


var int enterlostisland_kapitel6;

func void b_enter_lostisland_kapitel_6()
{
	if(ENTERLOSTISLAND_KAPITEL6 == FALSE)
	{
		if((JorgenIsCaptain == TRUE) && (DI_CHECK_JORGEN == TRUE))
		{
			LI_CHECK_JORGEN = TRUE;
		};
		if((TorlofIsCaptain == TRUE) && (DI_CHECK_TORLOF == TRUE))
		{
			LI_CHECK_TORLOF = TRUE;
		};
		if((JackIsCaptain == TRUE) && (DI_CHECK_JACK == TRUE))
		{
			LI_CHECK_JACK = TRUE;
		};
		if((Lee_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_LEE == TRUE))
		{
			LI_CHECK_LEE = TRUE;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_MAGE == TRUE))
		{
			LI_CHECK_MAGE = TRUE;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_PSIONIC == TRUE))
		{
			LI_CHECK_PSIONIC = TRUE;
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			LI_CHECK_MARIO = TRUE;
		};
		if((Wolf_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_WOLF == TRUE))
		{
			LI_CHECK_WOLF = TRUE;
		};
		if((Vatras_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_VATRAS == TRUE))
		{
			LI_CHECK_VATRAS = TRUE;
		};
		if((Bennet_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_BENNET == TRUE))
		{
			LI_CHECK_BENNET = TRUE;
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_THIEF == TRUE))
		{
			LI_CHECK_THIEF = TRUE;
		};
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_FIGHTER == TRUE))
		{
			LI_CHECK_FIGHTER = TRUE;
		};
		if((Lares_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_LARES == TRUE))
		{
			LI_CHECK_LARES = TRUE;
		};
		if((Biff_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_BIFF == TRUE))
		{
			LI_CHECK_BIFF = TRUE;
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_ANGAR == TRUE))
		{
			LI_CHECK_ANGAR = TRUE;
		};
		if((Girion_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_GIRION == TRUE))
		{
			LI_CHECK_GIRION = TRUE;
		};
		if(DI_CHECK_PEDRO == TRUE)
		{
			LI_CHECK_PEDRO = TRUE;
		};
		if((JorgenIsCaptain == TRUE) && (DI_CHECK_JORGEN == FALSE))
		{
			Wld_InsertNpc(vlk_4250_jorgen_li,"SHIP_CREW_CAPTAIN");
		};
		if((JackIsCaptain == TRUE) && (DI_CHECK_JACK == FALSE))
		{
			Wld_InsertNpc(vlk_444_jack_li,"SHIP_CREW_CAPTAIN");
		};
		if((TorlofIsCaptain == TRUE) && (DI_CHECK_TORLOF == FALSE))
		{
			Wld_InsertNpc(sld_801_torlof_li,"SHIP_CREW_CAPTAIN");
		};
		if((Lee_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_LEE == FALSE))
		{
			Wld_InsertNpc(sld_800_lee_li,"SHIP_CREW_01");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_MAGE == FALSE))
		{
			Wld_InsertNpc(pc_mage_li,"LI_MAN_03");
			MILTENLIHERE = TRUE;
			COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH + 1;
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_PSIONIC == FALSE))
		{
			Wld_InsertNpc(pc_psionic_li,"LI_MAN_02");
			LESTERLIHERE = TRUE;
			COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH + 1;
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Wolf_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_WOLF == FALSE))
		{
			Wld_InsertNpc(sld_811_wolf_li,"SHIP_DECK_29");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Vatras_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_VATRAS == FALSE))
		{
			Wld_InsertNpc(vlk_439_vatras_li,"SHIP_IN_22");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Bennet_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_BENNET == FALSE))
		{
			Wld_InsertNpc(sld_809_bennet_li,"SHIP_SMITH_FIRE");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_THIEF == FALSE))
		{
			Wld_InsertNpc(pc_thief_li,"LI_MAN_01");
			DIEGOLIHERE = TRUE;
			COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH + 1;
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_FIGHTER == FALSE))
		{
			Wld_InsertNpc(pc_fighter_li,"LI_MAN_04");
			GORNLIHERE = TRUE;
			COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH + 1;
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Lares_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_LARES == FALSE))
		{
			Wld_InsertNpc(vlk_449_lares_li,"SHIP_CREW_05");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Biff_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_BIFF == FALSE))
		{
			Wld_InsertNpc(djg_713_biff_li,"SHIP_DECK_32");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_ANGAR == FALSE))
		{
			Wld_InsertNpc(djg_705_angar_li,"LI_MAN_05");
			ANGARLIHERE = TRUE;
			COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH + 1;
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((Girion_IsOnBoard == LOG_SUCCESS) && (DI_CHECK_GIRION == FALSE))
		{
			Wld_InsertNpc(pal_207_girion_li,"SHIP_DECK_18");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if((DI_CHECK_PEDRO == FALSE) && (PEDROWITHUS == TRUE))
		{
			Wld_InsertNpc(nov_600_pedro_li,"SHIP_DECK_05");
			COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE + 1;
		};
		if(CAPITANORDERDIAWAY == TRUE)
		{
			b_extrocontinue_avi();
			Wld_SetTime(17,0);
		};
		ENTERLOSTISLAND_KAPITEL6 = TRUE;
	};
};

func void b_enter_lostisland()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_lostisland_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_lostisland_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_lostisland_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_lostisland_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_lostisland_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_lostisland_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = LOSTISLAND_ZEN;
	B_InitNpcGlobals();
};