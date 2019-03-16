
func void b_enter_freeminelager_kapitel_1()
{
};


var int enterfreeminelager_kapitel2;

func void b_enter_freeminelager_kapitel_2()
{
	if(ENTERFREEMINELAGER_KAPITEL2 == FALSE)
	{
		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_06");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_07");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_10");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_11");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_14");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_15");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_18");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_19");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_18");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_19");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_22");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_23");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_26");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_27");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_30");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_31");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_34");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_FMC_35");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_38");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FMC_39");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_FMC_42");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_FMC_01");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_FMC_04");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_FMC_05");
			Wld_InsertNpc(DragonSnapper,"FP_ROAM_FMC_MONSTER_02");
			Wld_InsertNpc(Bloodfly,"FP_ROAM_FMC_MONSTER_05");
			Wld_InsertNpc(orcdog,"FP_ROAM_FMC_MONSTER_08");
			Wld_InsertNpc(Warg,"FP_ROAM_FMC_MONSTER_12");
		};

		ENTERFREEMINELAGER_KAPITEL2 = TRUE;
	};
};


var int enterfreeminelager_kapitel3;

func void b_enter_freeminelager_kapitel_3()
{
	if(ENTERFREEMINELAGER_KAPITEL3 == FALSE)
	{
		ENTERFREEMINELAGER_KAPITEL3 = TRUE;
	};
};


var int enterfreeminelager_kapitel4;

func void b_enter_freeminelager_kapitel_4()
{
	if(ENTERFREEMINELAGER_KAPITEL4 == FALSE)
	{
		ENTERFREEMINELAGER_KAPITEL4 = TRUE;
	};
};


var int enterfreeminelager_kapitel5;

func void b_enter_freeminelager_kapitel_5()
{
	if(ENTERFREEMINELAGER_KAPITEL5 == FALSE)
	{
		ENTERFREEMINELAGER_KAPITEL5 = TRUE;
	};
};


var int enterfreeminelager_kapitel6;

func void b_enter_freeminelager_kapitel_6()
{
	if(ENTERFREEMINELAGER_KAPITEL6 == FALSE)
	{
		ENTERFREEMINELAGER_KAPITEL6 = TRUE;
	};
};

func void b_enter_freeminelager()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_freeminelager_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_freeminelager_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_freeminelager_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_freeminelager_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_freeminelager_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_freeminelager_kapitel_6();
	};
	if((MIS_ScoutNewMine == LOG_Running) && (ScoutFreeLager == FALSE))
	{
		ScoutFreeLager = TRUE;
		B_LogEntry(TOPIC_ScoutNewMine,"Průchod vedoucí do jednoho dolu je řízen skřety. Je třeba zjistit, co se děje v samotném dolu. Ale je nepravděpodobné, že by mě tam skřeti pustili.");
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = FREEMINELAGER_ZEN;
	B_InitNpcGlobals();
};

