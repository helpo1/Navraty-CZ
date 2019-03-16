
func void b_enter_orcgraveyard_kapitel_1()
{
};


var int enterorcgraveyard_kapitel2;

func void b_enter_orcgraveyard_kapitel_2()
{
	if(ENTERORCGRAVEYARD_KAPITEL2 == FALSE)
	{
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_02");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_04");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_06");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_10");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_12");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_14");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_16");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_18");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_20");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_22");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_24");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_26");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_28");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_30");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_32");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_34");
		Wld_InsertNpc(orc_hram,"FP_ROAM_GRAVE_38");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_GRAVE_40");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_GRAVE_42");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_GRAVE_44");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_GRAVE_46");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_GRAVE_48");
		ENTERORCGRAVEYARD_KAPITEL2 = TRUE;
	};
};


var int enterorcgraveyard_kapitel3;

func void b_enter_orcgraveyard_kapitel_3()
{
	if(ENTERORCGRAVEYARD_KAPITEL3 == FALSE)
	{
		ENTERORCGRAVEYARD_KAPITEL3 = TRUE;
	};
};


var int enterorcgraveyard_kapitel4;

func void b_enter_orcgraveyard_kapitel_4()
{
	if(ENTERORCGRAVEYARD_KAPITEL4 == FALSE)
	{
		ENTERORCGRAVEYARD_KAPITEL4 = TRUE;
	};
};


var int enterorcgraveyard_kapitel5;

func void b_enter_orcgraveyard_kapitel_5()
{
	if(ENTERORCGRAVEYARD_KAPITEL5 == FALSE)
	{
		ENTERORCGRAVEYARD_KAPITEL5 = TRUE;
	};
};


var int enterorcgraveyard_kapitel6;

func void b_enter_orcgraveyard_kapitel_6()
{
	if(ENTERORCGRAVEYARD_KAPITEL6 == FALSE)
	{
		ENTERORCGRAVEYARD_KAPITEL6 = TRUE;
	};
};

func void b_enter_orcgraveyard()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_orcgraveyard_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_orcgraveyard_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_orcgraveyard_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_orcgraveyard_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_orcgraveyard_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_orcgraveyard_kapitel_6();
	};
	if((MIS_WAKONTEST == LOG_Running) && (NAGSHORTELLME == TRUE) && (URDAHISINSERT == FALSE))
	{
		Wld_InsertNpc(orcshaman_ur_dah,"FP_STAND_URDAH");
		URDAHISINSERT = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ORCGRAVEYARD_ZEN;
	B_InitNpcGlobals();
};

