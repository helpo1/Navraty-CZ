
func void b_enter_orccity_kapitel_1()
{
};

var int enterorccity_kapitel2;

func void b_enter_orccity_kapitel_2()
{
	if(ENTERORCCITY_KAPITEL2 == FALSE)
	{
		ENTERORCCITY_KAPITEL2 = TRUE;
	};
};


var int enterorccity_kapitel3;

func void b_enter_orccity_kapitel_3()
{
	if(ENTERORCCITY_KAPITEL3 == FALSE)
	{
		ENTERORCCITY_KAPITEL3 = TRUE;
	};
};


var int enterorccity_kapitel4;

func void b_enter_orccity_kapitel_4()
{
	if(ENTERORCCITY_KAPITEL4 == FALSE)
	{
		ENTERORCCITY_KAPITEL4 = TRUE;
	};
};


var int enterorccity_kapitel5;

func void b_enter_orccity_kapitel_5()
{
	if(ENTERORCCITY_KAPITEL5 == FALSE)
	{
		ENTERORCCITY_KAPITEL5 = TRUE;
	};
};


var int enterorccity_kapitel6;

func void b_enter_orccity_kapitel_6()
{
	if(ENTERORCCITY_KAPITEL6 == FALSE)
	{
		ENTERORCCITY_KAPITEL6 = TRUE;
	};
};


var int enterorccity_insertsouls;

func void b_enter_orccity()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_orccity_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_orccity_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_orccity_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_orccity_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_orccity_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_orccity_kapitel_6();
	};
	if((MIS_Orcwayhero == LOG_SUCCESS) && (UrKarrasIsDead == FALSE) && (UrKarrasInsert == FALSE))
	{
		Wld_InsertNpc(Orc_8567_UrKarras,"ORC_CITY_URKARRAS");
		UrKarrasInsert = TRUE;
	};
	if((KAPITELORCATC == TRUE) && (MIS_EscapeMine == LOG_Success) && (OrcMineClosed == FALSE) && (MagicPlace02 == TRUE) && (MagicPlace03 == TRUE))
	{
		Wld_SendTrigger("EVT_ORCCITY_MINE");
		OrcMineClosed = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ORCCITY_ZEN;
	B_InitNpcGlobals();
};

var int enterorcoremine_kapitel1;

func void b_enter_orcoremine_kapitel_1()
{
	if(ENTERorcoremine_KAPITEL1 == FALSE)
	{
		ENTERorcoremine_KAPITEL1 = TRUE;
	};
};

var int enterorcoremine_kapitel2;

func void b_enter_orcoremine_kapitel_2()
{
	if(ENTERorcoremine_KAPITEL2 == FALSE)
	{

		ENTERorcoremine_KAPITEL2 = TRUE;
	};
};


var int enterorcoremine_kapitel3;

func void b_enter_orcoremine_kapitel_3()
{
	if(ENTERorcoremine_KAPITEL3 == FALSE)
	{
		ENTERorcoremine_KAPITEL3 = TRUE;
	};
};


var int enterorcoremine_kapitel4;

func void b_enter_orcoremine_kapitel_4()
{
	if(ENTERorcoremine_KAPITEL4 == FALSE)
	{
		ENTERorcoremine_KAPITEL4 = TRUE;
	};
};


var int enterorcoremine_kapitel5;

func void b_enter_orcoremine_kapitel_5()
{
	if(ENTERorcoremine_KAPITEL5 == FALSE)
	{
		ENTERorcoremine_KAPITEL5 = TRUE;
	};
};


var int enterorcoremine_kapitel6;

func void b_enter_orcoremine_kapitel_6()
{
	if(ENTERorcoremine_KAPITEL6 == FALSE)
	{
		ENTERorcoremine_KAPITEL6 = TRUE;
	};
};

var int enterorcoremine_insertsouls;

func void b_enter_orcoremine()
{
	var C_Npc venzelcheck;

	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_orcoremine_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_orcoremine_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_orcoremine_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_orcoremine_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_orcoremine_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_orcoremine_kapitel_6();
	};
	if(CanEnterOrcMine == FALSE)
	{
		ULUMULUISEQUIP = FALSE;
	};
	if(FindVenzel == TRUE)
	{
		venzelcheck = Hlp_GetNpc(STRF_8120_Addon_Gars);
		venzelcheck.name[0] = "Венцель";
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ORCOREMINE_ZEN;
	B_InitNpcGlobals();
};