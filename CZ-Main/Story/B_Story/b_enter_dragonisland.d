var int EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime;

func void b_enter_dragonisland()
{
	if((EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime == FALSE) && (UndeadDragonIsDead == TRUE))
	{
		Angar_DI_Party = LOG_SUCCESS;
		B_StartOtherRoutine(Angar_DI,"FireDragonIsland");
		B_StartOtherRoutine(Lee_DI,"UNDEADDRAGONDEAD");
		B_StartOtherRoutine(Diego_DI,"UNDEADDRAGONDEAD");
		B_StartOtherRoutine(Milten_DI,"UNDEADDRAGONDEAD");
		B_StartOtherRoutine(Gorn_DI,"UNDEADDRAGONDEAD");
		B_StartOtherRoutine(Lester_DI,"UNDEADDRAGONDEAD");
		EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
};

func void startup_newworld_part_dragon_island_01()
{
	Wld_InsertNpc(FireWaran,"FP_ROAM_DI_WARAN_01");
	Wld_InsertNpc(FireWaran,"FP_ROAM_DI_WARAN_02");
	Wld_InsertNpc(FireWaran,"FP_ROAM_DI_WARAN_03");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_03");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_45");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_02");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_01");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_04");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_44");
	Wld_InsertNpc(orkelite_addon3_di,"FP_ROAM_DI_ORK_BERSERK");
	Wld_InsertNpc(orkelite_addon3_di,"DI_ORKAREA_TROLL");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_12");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_13");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_DI_ORK_05");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_DI_ORK_35");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_DI_ORK_31");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_DI_ORK_21");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_DI_ORK_14");
	Wld_InsertNpc(orkelite_addon3_di,"FP_ROAM_DI_ORK_22");
	Wld_InsertNpc(orkelite_addon3_di,"FP_ROAM_DI_ORK_23");
	Wld_InsertNpc(orkelite_bowmenrest,"FP_STAND_DI_ORKBOWMEN_01");
	Wld_InsertNpc(orkelite_bowmenrest,"FP_STAND_DI_ORKBOWMEN_02");
	Wld_InsertNpc(OrcElite_Rest,"FP_STAND_DI_ORK_06");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_40");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_41");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_07");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_09");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_11");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_39");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_08");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_25");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_10");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_37");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_34");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_36");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_30");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_32");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_33");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_360");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_361");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_17");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_16");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_15");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_28A");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_28B");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_28");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_29A");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_29");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_19");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_20");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_18");
	Wld_InsertNpc(OrcElite_Roam_di,"FP_ROAM_DI_ORK_GUARD");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_01");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_02");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_03");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_04");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_05");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_06");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_07");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_08");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_09");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_10");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_11");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_12");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_13");
	Wld_InsertNpc(Warg,"FP_ROAM_DI_ORK_WARG_14");
	Wld_InsertNpc(OrkElite_AntiPaladinOrkOberst_DI,"DI_ORKOBERST");
	Wld_InsertNpc(OrcElite_DIOberst1_Rest,"FP_ROAM_DI_ORK_24");
	Wld_InsertNpc(OrcElite_DIOberst2_Rest,"FP_ROAM_DI_ORK_26");
	Wld_InsertNpc(OrcElite_DIOberst3_Rest,"FP_ROAM_DI_ORK_27");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"DI_ORKAREA_21");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"DI_DRACONIANAREA_21");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"DI_DRACONIANAREA_08");
	Wld_InsertNpc(Dragon_Fire_Island,"DI_DRACONIANAREA_14");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_01");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_02");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_03");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_04");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_05");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_06");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_07");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_08");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_09");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_10");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_11");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_12");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_13");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_14");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_15");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_16");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_17");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_18");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_19");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_20");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_21");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_22");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_23");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_24");
	Wld_InsertNpc(Draconian_Elite_Drt,"FP_ROAM_DI_DRACONIAN_25");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DI_ORKAREA_24");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DI_ORKAREA_23");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DI_PALZOMBIE_01");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DI_PALZOMBIE_02");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DI_DRACONIANAREA_22");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DI_DRACONIANAREA_23");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"FP_ROAM_DI_PALZOMBIE_03");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"FP_ROAM_DI_PALZOMBIE_04");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"FP_ROAM_DI_PALZOMBIE_05");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"FP_ROAM_DI_PALZOMBIE_06");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"FP_ROAM_DI_PALZOMBIE_07");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"FP_ROAM_DI_PALZOMBIE_08");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"FP_ROAM_DI_PALZOMBIE_09");
	Wld_InsertNpc(Skeleton_Lord_di,"FP_ROAM_DI_PALZOMBIE_10");
	Wld_InsertNpc(Skeleton_Lord_di,"FP_ROAM_DI_PALZOMBIE_11");
	Wld_InsertNpc(Skeleton_Lord_di,"FP_ROAM_DI_PALZOMBIE_12");
	Wld_InsertNpc(Skeleton_Lord_di,"FP_ROAM_DI_PALZOMBIE_13");
	Wld_InsertNpc(Skeleton_Lord_di,"FP_ROAM_DI_PALZOMBIE_14");
	Wld_InsertNpc(Skeleton_Lord_di,"FP_ROAM_DI_PALZOMBIE_15");
	Wld_InsertNpc(orkelite_addon2_di,"FP_ROAM_DI_ORK_BERSERK");
	Wld_InsertItem(ItMi_DarkPearl,"FP_ITEM_DI_ENTER_03");
	Wld_InsertItem(ItMi_Sulfur,"FP_ITEM_DI_ENTER_07");
	Wld_InsertItem(ItWr_ZugBruecke_MIS,"FP_ITEM_DI_ENTER_09");
	Wld_InsertNpc(dmt_121200_dagot,"TOT");
};

func void init_newworld_part_dragon_island_01()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

func void startup_newworld_part_dragon_undead_01()
{
	Wld_InsertNpc(Skeleton_Lord_Archol,"DI_ARCHOL");
	Wld_InsertNpc(Skeleton_Archol1,"DI_ARCHOL_SKELETON_01");
	Wld_InsertNpc(Skeleton_Archol2,"DI_ARCHOL_SKELETON_02");
	Wld_InsertNpc(Skeleton_Archol3,"DI_ARCHOL_SKELETON_03");
	Wld_InsertNpc(Skeleton_Archol4,"DI_ARCHOL_SKELETON_04");
	Wld_InsertNpc(Skeleton_Archol5,"DI_ARCHOL_SKELETON_05");
	Wld_InsertNpc(Skeleton_Archol6,"DI_ARCHOL_SKELETON_06");
	Wld_InsertNpc(DMT_DementorAmbient_Master,"DI_DRACONIANAREA_53");
	Wld_InsertNpc(DMT_DementorAmbient_Master,"DI_DRACONIANAREA_52");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"DI_DRACONIANAREA_55");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DI_DRACONIANAREA_55");
	Wld_InsertNpc(Skeleton_Lord_di,"DI_DRACONIANAREA_56");
	Wld_InsertNpc(Skeleton_Lord_di,"DI_DRACONIANAREA_56");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"DI_DRACONIANAREA_51");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DI_DRACONIANAREA_51");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"DI_DRACONIANAREA_51");
	Wld_InsertNpc(Skeleton_Lord_di,"WP_UNDEAD_SPAWN_POINT_01");
	Wld_InsertNpc(Skeleton_Lord_di,"WP_UNDEAD_LEFT_DOWN_06");
	Wld_InsertNpc(orkelite_addon3,"WP_UNDEAD_SPAWN_POINT_02");
	Wld_InsertNpc(orkelite_addon3,"WP_UNDEAD_SPAWN_POINT_03");
	Wld_InsertNpc(Skeleton_Lord_di,"WP_UNDEAD_SPAWN_POINT_04");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"WP_UNDEAD_SPAWN_POINT_05");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"WP_UNDEAD_SPAWN_POINT_06");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"WP_UNDEAD_SPAWN_POINT_07");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"WP_UNDEAD_SPAWN_POINT_08");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"DRAGONISLAND_UNDEAD_04_01");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DRAGONISLAND_UNDEAD_04_02");
	Wld_InsertNpc(Skeleton_Lord_di,"DRAGONISLAND_UNDEAD_08_01");
	Wld_InsertNpc(Skeleton_Lord_di,"DRAGONISLAND_UNDEAD_08_02");
	Wld_InsertNpc(SKELETON_KNIGHT_DI,"DRAGONISLAND_UNDEAD_08_03");
	Wld_InsertNpc(SKELETON_KNIGHT_SHIELD_DI,"DRAGONISLAND_UNDEAD_08_04");
	Wld_InsertItem(ItWr_Rezept_MegaDrink_MIS,"FP_ITEM_DI_BLACKNOV_01");
	Wld_InsertItem(ItWr_Diary_BlackNovice_MIS,"FP_ITEM_DI_BLACKNOV_02");
};

func void init_newworld_part_dragon_undead_01()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

func void startup_newworld_part_dragon_final_01()
{
	Wld_InsertNpc(DMT_DementorAmbientWalker_DI_01,"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc(DMT_DementorAmbientWalker_DI_02,"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc(DMT_DementorAmbientWalker_DI_03,"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc(DMT_DementorAmbientWalker_DI_04,"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc(DMT_DementorAmbientWalker_DI_05,"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc(DMT_DementorAmbientWalker_DI_06,"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc(DMT_DementorAmbient_Master,"DI_UNDEADDRAGONTEMPEL_20");
	Wld_InsertNpc(DMT_DementorAmbient_Master,"DI_UNDEADDRAGONTEMPEL_23");
	Wld_InsertNpc(DMT_1299_OberDementor_DI,"DI_SCHWARZMAGIER");
	Wld_InsertNpc(Skeleton_Lord_di,"DI_UNDEADDRAGON_TRAP_01");
	Wld_InsertNpc(Skeleton_Lord_di,"DI_UNDEADDRAGON_TRAP_02");
	Wld_InsertNpc(Skeleton_Lord_di,"DI_UNDEADDRAGON_TRAP_03");
};

func void init_newworld_part_dragon_final_01()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

func void startup_dragonisland()
{
	if(UndeadDragonIsDead == FALSE)
	{
		if(JorgenIsCaptain == TRUE)
		{
			Wld_InsertNpc(VLK_4250_Jorgen_DI,"SHIP_DECK_01");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Wld_InsertNpc(SLD_801_Torlof_DI,"SHIP_DECK_01");
		};
		if(JackIsCaptain == TRUE)
		{
			Wld_InsertNpc(VLK_444_Jack_DI,"SHIP_DECK_01");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(SLD_800_Lee_DI,"SHIP_DECK_01");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(PC_Mage_DI,"SHIP_DECK_01");
			
			if(Lester_IsOnBoard != LOG_SUCCESS)
			{
				B_StartOtherRoutine(PC_Mage_DI,"SittingShipDI");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(PC_Psionic_DI,"SHIP_DECK_01");

			if(MiltenNW_IsOnBoard != LOG_SUCCESS)
			{
				B_StartOtherRoutine(PC_Psionic_DI,"SittingShipDI");
			};
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(None_101_Mario_DI,"SHIP_DECK_01");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(SLD_811_Wolf_DI,"SHIP_DECK_01");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(VLK_439_Vatras_DI,"SHIP_DECK_01");
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(SLD_809_Bennet_DI,"SHIP_DECK_01");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(PC_Thief_DI,"SHIP_DECK_01");

			if(Lares_IsOnBoard != LOG_SUCCESS)
			{
				B_StartOtherRoutine(PC_Thief_DI,"SittingShipDI");
			};
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(PC_Fighter_DI,"SHIP_DECK_01");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(VLK_449_Lares_DI,"SHIP_DECK_01");
	
			if(Diego_IsOnBoard != LOG_SUCCESS)
			{
				B_StartOtherRoutine(VLK_449_Lares_DI,"SittingShipDI");
			};
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(DJG_713_Biff_DI,"SHIP_DECK_01");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(DJG_705_Angar_DI,"SHIP_DECK_01");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Wld_InsertNpc(Pal_207_Girion_DI,"SHIP_DECK_01");
		};
		Wld_InsertNpc(NOV_600_Pedro_DI,"SHIP_DECK_01");
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_03");
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_07");
		startup_newworld_part_dragon_island_01();
		startup_newworld_part_dragon_undead_01();
		startup_newworld_part_dragon_final_01();
		PlayVideo("SHIP.BIK");
		Log_CreateTopic(TOPIC_HallenVonIrdorath,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_HallenVonIrdorath,LOG_Running);
		Log_AddEntry(TOPIC_HallenVonIrdorath,"Konečně jsme dorazili do doupěte nepřítele a jen Innos ví, jaké stvoření na mě čekají v této obrovské hoře.");
		B_Kapitelwechsel(6,DRAGONISLAND_ZEN);
	};
};

func void init_dragonisland()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	CurrentLevel = DRAGONISLAND_ZEN;

	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};

	b_cycle_trigger_04();
	b_enter_dragonisland();
};