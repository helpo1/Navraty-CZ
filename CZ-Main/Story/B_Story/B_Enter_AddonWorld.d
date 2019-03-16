func void B_ENTER_ADDONWORLD_Kapitel_1()
{
	if((Sklaven_weg == TRUE) && (RemoveSklaven == FALSE))
	{
		B_RemoveNpc(STRF_1118_Addon_Patrick);
		B_RemoveNpc(STRF_1119_Addon_Monty);
		B_RemoveNpc(STRF_1120_Addon_Tonak);
		B_RemoveNpc(STRF_1121_Addon_Telbor);
		B_RemoveNpc(STRF_1122_Addon_Pardos);
		RemoveSklaven = TRUE;
	};
};

var int EnterADW_Kapitel2;

func void B_ENTER_ADDONWORLD_Kapitel_2()
{
	if(EnterADW_Kapitel2 == FALSE)
	{
		Wld_InsertNpc(bloodhound_uniq_02,"ADW_CANYON_PATH_TO_BANDITS_31");
		Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_TELEPORT_PATH_03");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_LIBRARY_40");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_31A");
		Wld_InsertNpc(Blattcrawler,"ADW_CANYON_PATH_TO_BANDITS_55");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_16A");
		Wld_InsertNpc(Wolf,"ADW_CANYON_PATH_TO_LIBRARY_37");
		Wld_InsertNpc(Wolf,"ADW_CANYON_PATH_TO_LIBRARY_12A");
		Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_14");
		Wld_InsertNpc(orcwarrior4,"ADW_CANYON_PATH_TO_LIBRARY_20");
		Wld_InsertNpc(orcwarrior4,"ADW_CANYON_ORCS_05");
		Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_05");
		Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_05");
		Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_02B");
		Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_11");
		Wld_InsertNpc(Waran,"ADW_ENTRANCE_PATH2BANDITS_05P");
		Wld_InsertNpc(Bloodfly,"ADW_ENTRANCE_PATH2BANDITS_10");
		Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
		Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_05");
		Wld_InsertNpc(orcwarrior3s,"ADW_VALLEY_PATH_035");
		Wld_InsertNpc(orcwarrior3s,"ADW_VALLEY_PATH_036");
		Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
		Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_115_F");
		Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_PATH_054_D");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");
		Wld_InsertNpc(Harpie,"ADW_VALLEY_BIGCAVE_06");
		Wld_InsertNpc(Harpie,"ADW_VALLEY_BIGCAVE_15");
		Wld_InsertNpc(Harpie,"ADW_VALLEY_BIGCAVE_15");
		Wld_InsertNpc(Harpie,"ADW_VALLEY_PATH_110");
		Wld_InsertNpc(Oster,"ADW_VALLEY_PATH_020");
		Wld_InsertNpc(Oster,"ADW_VALLEY_PATH_048_A");
		Wld_InsertNpc(Oster,"ADW_VALLEY_PATH_047_D");
		Wld_InsertNpc(Oster,"ADW_VALLEY_PATH_047_D");
		Wld_InsertNpc(Oster,"ADW_VALLEY_PATH_047_G");
		Wld_InsertNpc(Oster,"ADW_VALLEY_PATH_038_E");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_120_A");
		Wld_InsertNpc(Swamprat,"ADW_VALLEY_PATH_129_B");
		Wld_InsertNpc(Swamprat,"ADW_VALLEY_PATH_129_B");
		Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_024_A");
		Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_062");
		Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_102_A");
		Wld_InsertNpc(Swamprat,"ADW_VALLEY_PATH_043");
		Wld_InsertNpc(Minecrawler,"ADW_VALLEY_PATH_131");
		Wld_InsertNpc(Minecrawler,"ADW_VALLEY_PATH_132_A");
		Wld_InsertNpc(Minecrawler,"ADW_VALLEY_PATH_134");
		Wld_InsertNpc(Minecrawler,"ADW_VALLEY_PATH_135");
		Wld_InsertNpc(Minecrawler,"ADW_VALLEY_PATH_135");
		Wld_InsertNpc(Minecrawler,"ADW_VALLEY_PATH_135");
		Wld_InsertNpc(Zombie04,"ADW_VALLEY_PATH_072");
		Wld_InsertNpc(Zombie02,"ADW_VALLEY_PATH_073");
		EnterADW_Kapitel2 = TRUE;
	};
};


var int EnterADW_Kapitel3;

func void B_ENTER_ADDONWORLD_Kapitel_3()
{
	if(EnterADW_Kapitel3 == FALSE)
	{
		if(RavenAway == TRUE)
		{
			B_RemoveNpc(NONE_ADDON_112_Rhademes);
		};

		EnterADW_Kapitel3 = TRUE;
	};
};


var int EnterADW_Kapitel4;

func void B_ENTER_ADDONWORLD_Kapitel_4()
{
	if(EnterADW_Kapitel4 == FALSE)
	{
		B_StartOtherRoutine(BDT_1072_Addon_Logan,"Start");

		if((RavenAway == TRUE) && (AWORCINVASIONSTART == FALSE))
		{
			B_StartOtherRoutine(KDW_14000_Addon_Saturas_ADW,"OrcInvasion");
			B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"OrcInvasion");
			B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"OrcInvasion");
			B_StartOtherRoutine(KDW_14040_Addon_Riordian_ADW,"OrcInvasion");
			B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"OrcInvasion");

			if(MIS_LanceChange == LOG_Success)
			{
				B_StartOtherRoutine(NONE_ADDON_115_Eremit,"OrcInvasion");
			};
		};

		EnterADW_Kapitel4 = TRUE;
	};
};


var int EnterADW_Kapitel5;
var int UndeadInvasion;

func void B_ENTER_ADDONWORLD_Kapitel_5()
{
	if(EnterADW_Kapitel5 == FALSE)
	{
		if(Npc_IsDead(BDT_1097_Addon_Fisk) == FALSE)
		{
			B_RemoveNpc(BDT_1097_Addon_Fisk);
		};
		if(Npc_IsDead(BDT_1080_Addon_Tom) == FALSE)
		{
			B_RemoveNpc(BDT_1080_Addon_Tom);
		};
		if(Npc_IsDead(BDT_10014_Addon_Thorus) == FALSE)
		{
			B_RemoveNpc(BDT_10014_Addon_Thorus);
		};
		if(Npc_IsDead(BDT_1086_Addon_Scatty) == FALSE)
		{
			B_RemoveNpc(BDT_1086_Addon_Scatty);
		};
		if(Npc_IsDead(BDT_10022_Addon_Miguel) == FALSE)
		{
			B_RemoveNpc(BDT_10022_Addon_Miguel);
		};
		if(Npc_IsDead(BDT_1098_Addon_Snaf) == FALSE)
		{
			B_RemoveNpc(BDT_1098_Addon_Snaf);
		};
		if((MyxirSendSaturas == TRUE) && (UndeadInvasion == FALSE))
		{
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_01");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_05");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_07");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_09");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_11");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORKINCAMP_12");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_14");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_16");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_18");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_20");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORKINCAMP_22");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_24");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_26");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_28");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_30");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_32");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ORKINCAMP_35");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_37");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORKINCAMP_39");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_41");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_43");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_45");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORKINCAMP_47");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_49");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_51");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_53");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORKINCAMP_55");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_57");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ORKINCAMP_59");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ENTRANCEORCGUARD_01");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ENTRANCEORCGUARD_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_05");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_07");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_09");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Elite,"FP_CAMPFIRE_ORKINCAMP_01");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Elite,"FP_CAMPFIRE_ORKINCAMP_03");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Elite,"FP_CAMPFIRE_ORKINCAMP_05");
			Wld_InsertNpc(Skeleton_Mage_AV,"FP_CAMPFIRE_SWAMP_01");
			Wld_InsertNpc(Skeleton_Mage_AV,"FP_CAMPFIRE_VP1_02");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORCINADANOS_01");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ORCINADANOS_03");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORCINADANOS_05");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ZOBIE_01");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ZOBIE_03");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ZOBIE_05");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_03");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_04");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_CAMPFIRE_ELITEORCSHAMAN_04");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ENTRANCEORCGUARD_19");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ENTRANCEORCGUARD_21");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ENTRANCEORCGUARD_23");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ENTRANCEORCGUARD_25");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ENTRANCEORCGUARD_27");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ENTRANCEORCGUARD_29");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ENTRANCEORCGUARD_31");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_RHADEMES");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_ENTRANCE_17");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_ENTRANCE_20");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_ENTRANCE_13");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ADANOSTEMPEL_TREASUREPITS_05A");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ADANOSTEMPEL_TREASUREPITS_05C");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ADANOSTEMPEL_TREASUREPITS_05E");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_TREASUREPITS_09A");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_TREASUREPITS_09C");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_ADANOSTEMPEL_TREASUREPITS_09E");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ADANOSTEMPEL_RHADEMES_14A");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ADANOSTEMPEL_RHADEMES_14C");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ADANOSTEMPEL_RHADEMES_14E");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ADANOSTEMPEL_ORC_01");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ADANOSTEMPEL_ORC_03");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ADANOSTEMPEL_ORC_05");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ADANOSTEMPEL_ORC_07");
			Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_ADANOSTEMPEL_ORC_09");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_CAMPFIRE_ADANOSTEMPEL_ORC_08");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_11");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_13");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_15");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_17");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_CANYON_LIBRARY_04");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_CANYON_LIBRARY_LEFT_08");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_LIBRARY_LEFT_07");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_CANYON_LIBRARY_RIGHT_07");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_LIBRARY_RIGHT_13");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_LIBRARY_STONIE_01");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_LIBRARY_STONIE_05");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_ORCS_08");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_PATH_TO_LIBRARY_14");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_CANYON_PATH_TO_LIBRARY_19");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_CANYON_PATH_TO_LIBRARY_20");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_CANYON_ORCS_05");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_CANYON_ORCS_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Elite,"ADW_CANYON_ORCS_02");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_CAMPFIRE_ELITEORCSHAMAN_05");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_06");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_SENAT_SIDE_01");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_SENAT_SIDE_03");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_SENAT_GUARDIAN_01");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_SENAT_GUARDIAN_03");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_CAMPFIRE_ELITEORCSHAMAN_03");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"STRAND");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_VALLEY_PATH_131");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_VALLEY_PATH_132_A");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_134");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_135");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_135");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_CAMPFIRE_ELITEORCSHAMAN_02");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_07");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_08");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_VALLEY_PATH_064_A");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_VALLEY_PATH_072");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_VALLEY_PATH_073");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_CAMPFIRE_ELITEORCSHAMAN_01");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_09");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ELITEORCSHAMANGUARD_10");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_CANYON_TELEPORT_PATH_09");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_CANYON_TELEPORT_PATH_09");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ENTRANCE_PATH2BANDITS_10");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_ENTRANCE_PATH2BANDITS_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PORTALTEMPEL_08A");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PORTALTEMPEL_08B");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_BL_FLIES_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_BL_FLIES_06");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_LITTLE_HILL_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_LITTLE_HILL_04");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_04");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_SWAMP_05");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_LITTLE_SEA_01");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_LITTLE_SEA_02");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_SWAMP_LITTLE_SEA_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_12");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_13");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PATH_TO_BL_09");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_PATH_TO_BL_10");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PATH_TO_LOCH_01");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PATH_TO_LOCH_01");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_SWAMP_10");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_05");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_SENAT_MONSTER_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SENAT_MONSTER_04");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_HILLS_DOWN_06");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_HILLS_DOWN_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_LOCH_05");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_SWAMP_TO_BIGSEA_01");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PIRATECAMP_LONEBEACH_11");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PIRATECAMP_LONEBEACH_10");
			Wld_InsertNpc(Ancient_Warrior_02,"DAW_PIRTECAMP_LONEBEACH_07");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_PIRATECAMP_LONEBEACH_08");
			Wld_InsertNpc(Ancient_Warrior_02,"ADW_PIRATECAMP_LONEBEACH_04");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_PIRATCAMP_PLAIN_05");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_PIRATCAMP_PLAIN_05");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_033_A");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_035");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_036");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_VALLEY_BIGCAVE_06");
			Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_VALLEY_BIGCAVE_15");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_110");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_020");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_048_A");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_PATH_047_G");
			Wld_InsertNpc(Ancient_Warrior_01,"ADW_VALLEY_PATH_017");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_SHOWCASE1_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"ADW_VALLEY_SHOWCASE1_03");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ADWENTRANCEHRAM_02");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ADWENTRANCEHRAM_04");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_06");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ADWENTRANCEHRAM_08");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_10");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_12");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ADWENTRANCEHRAM_14");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_16");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_18");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_20");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ADWENTRANCEHRAM_22");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_24");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_26");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_30");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ADWENTRANCEHRAM_31");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_ADWENTRANCEHRAM_32");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ADWENTRANCEHRAM_34");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ADWENTRANCEHRAM_36");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_GOLDSHAHT_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_GOLDSHAHT_04");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_GOLDSHAHT_06");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_GOLDSHAHT_08");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_GOLDSHAHT_10");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_GOLDSHAHT_12");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_GOLDSHAHT_14");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_GOLDSHAHT_16");
			Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_GOLDSHAHT_18");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"FP_ROAM_GOLDSHAHT_20");
			UndeadInvasion = TRUE;
		};

		EnterADW_Kapitel5 = TRUE;
	};
};


var int EnterADW_Kapitel6;

func void B_ENTER_ADDONWORLD_Kapitel_6()
{
	if(EnterADW_Kapitel6 == FALSE)
	{
		B_RemoveNpc(KDW_14040_Addon_Riordian_ADW);

		if(AWORCINVASIONSTOP == TRUE)
		{
			B_StartOtherRoutine(KDW_14000_Addon_Saturas_ADW,"Start");
			B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"Start");
			B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"Start");
			B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"Start");

			if(MIS_LanceChange == LOG_Success)
			{
				B_StartOtherRoutine(NONE_ADDON_115_Eremit,"WaterMage");
			};
		};
		if(RavenAway == TRUE)
		{
			Wld_InsertNpc(StonePuma,"ADW_CANYON_MINE1_01");
			Wld_InsertNpc(StonePuma,"ADW_CANYON_PATH_TO_LIBRARY_07A");
			Wld_InsertNpc(StonePuma,"ADW_CANYON_PATH_TO_LIBRARY_36");
			Wld_InsertNpc(StonePuma,"ADW_CANYON_PATH_TO_MINE2_04");
			Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
			Wld_InsertNpc(Razor,"ADW_CANYON_TELEPORT_PATH_03");
			Wld_InsertNpc(Razor,"ADW_CANYON_TELEPORT_PATH_04");
			Wld_InsertNpc(Razor,"ADW_CANYON_PATH_TO_LIBRARY_40");
			Wld_InsertNpc(Razor,"ADW_CANYON_PATH_TO_LIBRARY_03");
			Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_BANDITS_52");
			Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_31A");
			Wld_InsertNpc(Blattcrawler,"ADW_CANYON_PATH_TO_BANDITS_55");
			Wld_InsertNpc(Shadowbeast,"ADW_CANYON_PATH_TO_BANDITS_06E");
			Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_16A");
			Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_17");
			Wld_InsertNpc(DragonSnapper,"ADW_CANYON_ORCS_09");
			Wld_InsertNpc(StonePuma,"ADW_CANYON_PATH_TO_LIBRARY_37");
			Wld_InsertNpc(StonePuma,"ADW_CANYON_PATH_TO_LIBRARY_12A");
			Wld_InsertNpc(Bloodhound,"ADW_CANYON_PATH_TO_MINE2_09");
			Wld_InsertNpc(Bloodhound,"ADW_CANYON_PATH_TO_MINE2_06");
			Wld_InsertNpc(Razor,"ADW_CANYON_PATH_TO_BANDITS_26");
			Wld_InsertNpc(Razor,"ADW_CANYON_PATH_TO_BANDITS_24");
			Wld_InsertNpc(Razor,"ADW_CANYON_PATH_TO_BANDITS_66");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_22");
			Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_22");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_21");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_17");
			Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_14");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_14");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_62");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_19");
			Wld_InsertNpc(Blattcrawler,"ADW_CANYON_PATH_TO_BANDITS_06");
			Wld_InsertNpc(Blattcrawler,"ADW_CANYON_PATH_TO_BANDITS_09");
			Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE1_13");
			Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_MINE1_10");
			Wld_InsertNpc(Minecrawler,"ADW_CANYON_MINE1_05");
			Wld_InsertNpc(StonePuma,"ADW_ENTRANCE");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_PLATEAU_08");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_05");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_02B");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_VALLEY_11");
			Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_08");
			Wld_InsertNpc(Waran,"ADW_ENTRANCE_PATH2BANDITS_05P");
			Wld_InsertNpc(Bloodfly,"ADW_ENTRANCE_PATH2BANDITS_10");
			Wld_InsertNpc(Bloodfly,"ADW_ENTRANCE_PATH2BANDITS_03");
			Wld_InsertNpc(Waran,"ADW_ENTRANCE_PATH2BANDITS_05");
			Wld_InsertNpc(Razor,"ADW_ENTRANCE_RUIN1_01");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_RUIN1_01");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
			Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_13");
			Wld_InsertNpc(skeleton_warrior,"ADW_PORTALTEMPEL_08A");
			Wld_InsertNpc(skeleton_warrior,"ADW_PORTALTEMPEL_08B");
			Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_PATH2BANDITSCAVE1_05");
			Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_PATH2BANDITSCAVE1_06");
			Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_05");
			Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
			Wld_InsertNpc(Shadowbeast,"ADW_ENTRANCE_2_PIRATECAMP_22");
			Wld_InsertNpc(Swampshark,"ADW_PATH_TO_GOLEM_05");
			Wld_InsertNpc(Swampshark,"ADW_PATH_TO_GOLEM_06");
			Wld_InsertNpc(Swampshark,"ADW_PATH_TO_GOLEM_08");
			Wld_InsertNpc(Swampshark,"ADW_SWAMP_GOLEM_02");
			Wld_InsertNpc(Swampshark,"ADW_SWAMP_GOLEM_03");
			Wld_InsertNpc(Swampshark,"ADW_SWAMP_GOLEM_04");
			Wld_InsertNpc(Bloodfly,"ADW_BL_FLIES_03");
			Wld_InsertNpc(Bloodfly,"ADW_BL_FLIES_04");
			Wld_InsertNpc(Bloodfly,"ADW_BL_FLIES_06");
			Wld_InsertNpc(Bloodfly,"ADW_BL_FLIES_07");
			Wld_InsertNpc(Gobbo_Black,"ADW_BANDIT_VP1_05");
			Wld_InsertNpc(Swampshark,"ADW_SWAMP_WAND_01");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_WAND_02");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_WAND_03");
			Wld_InsertNpc(Alligator,"ADW_CANYON_PATH_TO_BANDITS_01B");
			Wld_InsertNpc(bloodfly_poison,"ADW_LITTLE_HILL_03");
			Wld_InsertNpc(bloodfly_poison,"ADW_LITTLE_HILL_04");
			Wld_InsertNpc(Bloodfly,"ADW_SWAMP_04");
			Wld_InsertNpc(Bloodfly,"ADW_SWAMP_05");
			Wld_InsertNpc(Bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
			Wld_InsertNpc(Bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
			Wld_InsertNpc(bloodfly_poison,"ADW_SWAMP_LITTLE_SEA_03");
			Wld_InsertNpc(bloodfly_poison,"ADW_SWAMP_12");
			Wld_InsertNpc(Bloodfly,"ADW_SWAMP_13");
			Wld_InsertNpc(Alligator,"ADW_PFUETZE_01");
			Wld_InsertNpc(Alligator,"ADW_PFUETZE_02");
			Wld_InsertNpc(Alligator,"ADW_PFUETZE_03");
			Wld_InsertNpc(Alligator,"ADW_PFUETZE_04");
			Wld_InsertNpc(Gobbo_Warrior,"ADW_BANDIT_VP1_07_D");
			Wld_InsertNpc(Gobbo_Black,"ADW_BANDIT_VP1_07_E");
			Wld_InsertNpc(Gobbo_Black,"ADW_BANDIT_VP1_07_F");
			Wld_InsertNpc(Gobbo_Black,"ADW_SWAMP_LITTLE_SEA_03_B");
			Wld_InsertNpc(Gobbo_Black,"ADW_SWAMP_09_C");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HOHLWEG_01");
			Wld_InsertNpc(Alligator,"ADW_SWAMP_LOCH_01");
			Wld_InsertNpc(Waran,"ADW_SWAMP_LOCH_02");
			Wld_InsertNpc(Waran,"ADW_SWAMP_LOCH_03");
			Wld_InsertNpc(Alligator,"ADW_SWAMP_LOCH_04");
			Wld_InsertNpc(Gobbo_Black,"ADW_SWAMP_08_D");
			Wld_InsertNpc(Gobbo_Black,"ADW_SWAMP_08_E");
			Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
			Wld_InsertNpc(SwampDrone,"ADW_PATH_TO_BL_10");
			Wld_InsertNpc(bloodfly_poison,"ADW_PATH_TO_BL_10");
			Wld_InsertNpc(bloodfly_poison,"ADW_PATH_TO_LOCH_01");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HILLS_DOWN_05");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_10");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_13");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_14");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_06");
			Wld_InsertNpc(Bloodfly,"ADW_SWAMP_05");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_12");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_BF_NEST_06");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HOHLWEG_03");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HOHLWEG_04");
			Wld_InsertNpc(Waran,"ADW_SENAT_MONSTER_01");
			Wld_InsertNpc(Waran,"ADW_SENAT_MONSTER_02");
			Wld_InsertNpc(Waran,"ADW_SENAT_MONSTER_03");
			Wld_InsertNpc(Waran,"ADW_SENAT_MONSTER_04");
			Wld_InsertNpc(Waran,"ADW_SENAT_05");
			Wld_InsertNpc(Alligator,"ADW_SWAMP_HILLS_DOWN_07");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HILLS_DOWN_05");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HILLS_DOWN_06");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HILLS_DOWN_03");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_15");
			Wld_InsertNpc(Alligator,"ADW_HOHLWEG_CENTER");
			Wld_InsertNpc(Alligator,"FP_ROAM_BF_NEST_26");
			Wld_InsertNpc(Alligator,"ADW_BANDITSCAMP_RAKEPLACE_03");
			Wld_InsertNpc(SwampDrone,"ADW_CANYON_PATH_TO_BANDITS_02");
			Wld_InsertNpc(SwampDrone,"ADW_PFUETZE_02");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_LOCH_05");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_LOCH_06");
			Wld_InsertNpc(Alligator,"ADW_SWAMP_TO_BIGSEA_01");
			Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HOHLWEG_05");
			Wld_InsertNpc(Alligator,"ADW_SWAMP_07");
			Wld_InsertNpc(Lurker,"ADW_PIRATECAMP_ISLE1_01");
			Wld_InsertNpc(Waran,"ADW_PIRATECAMP_LONEBEACH_11");
			Wld_InsertNpc(Waran,"ADW_PIRATECAMP_LONEBEACH_12");
			Wld_InsertNpc(FireWaran,"ADW_PIRATECAMP_LONEBEACH_10");
			Wld_InsertNpc(FireWaran,"DAW_PIRTECAMP_LONEBEACH_07");
			Wld_InsertNpc(FireWaran,"ADW_PIRATECAMP_LONEBEACH_08");
			Wld_InsertNpc(Waran,"ADW_PIRATECAMP_LONEBEACH_05");
			Wld_InsertNpc(Waran,"ADW_PIRATECAMP_LONEBEACH_04");
			Wld_InsertNpc(Shadowbeast,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
			Wld_InsertNpc(Lurker,"ADW_PIRATECAMP_SECRETCAVE_01");
			Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_PLAIN_01");
			Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_PLAIN_02");
			Wld_InsertNpc(Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
			Wld_InsertNpc(Waran,"ADW_PIRATECAMP_WATERHOLE_08");
			Wld_InsertNpc(Lurker,"ADW_PIRATECAMP_WATERHOLE_04");
			Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_01");
			Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_033_A");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_035");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_036");
			Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_115_E");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_PATH_003_A");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_BIGCAVE_18");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_PATH_012");
			Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_115_F");
			Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_054_B");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_PATH_054_B");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_PATH_054_D");
			Wld_InsertNpc(Gobbo_Black,"ADW_VALLEY_PATH_054_E");
			Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_054_F");
			Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_BIGCAVE_06");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_BIGCAVE_15");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_110");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_020");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_BIGCAVE_01");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_048_A");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_047_D");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_047_G");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_038_E");
			Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_038_J");
			Wld_InsertNpc(Shadowbeast,"ADW_VALLEY_PATH_029");
			Wld_InsertNpc(skeleton_warrior,"ADW_VALLEY_PATH_020_CAVE_05");
			Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
			Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_120_A");
			Wld_InsertNpc(Alligator,"ADW_VALLEY_PATH_027");
			Wld_InsertNpc(Alligator,"ADW_VALLEY_PATH_045");
			Wld_InsertNpc(Alligator,"ADW_VALLEY_PATH_129_B");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_024_A");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_125");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_062");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_102_A");
			Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_116_A");
			Wld_InsertNpc(Alligator,"ADW_VALLEY_PATH_043");
			Wld_InsertNpc(Blattcrawler,"ADW_VALLEY_PATH_053");
			Wld_InsertNpc(Bloodfly,"ADW_VALLEY_PATH_017");
			Wld_InsertNpc(Bloodfly,"ADW_VALLEY_PATH_058");
			Wld_InsertNpc(StonePuma,"ADW_VALLEY_SHOWCASE1_02");
			Wld_InsertNpc(StonePuma,"ADW_VALLEY_SHOWCASE1_03");
			Wld_InsertNpc(schildkroete,"FP_ROAM_ADW_TURTLE_01_01");
			Wld_InsertNpc(schildkroete,"FP_ROAM_ADW_TURTLE_02_01");
			Wld_InsertNpc(schildkroete,"FP_ROAM_ADW_TURTLE_03_01");
			Wld_InsertNpc(schildkroete,"FP_ROAM_ADW_TURTLE_04_01");
			Wld_InsertNpc(schildkroete,"FP_ROAM_ADW_TURTLE_05_01");
			Wld_InsertNpc(schildkroete,"FP_ROAM_ADW_TURTLE_06_01");
		};
		EnterADW_Kapitel6 = TRUE;
	};
};

var int enteradw_insertsouls;
var int CurseAncientRemoveDone;
var int OthSklRemove;
var int PlaceAdanosWeapon;
var int PlaceFireShadowGuards;

func void b_enter_addonworld()
{
	var C_Npc ashtarcheck;
	var int randomplace;

	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		B_ENTER_ADDONWORLD_Kapitel_1();
	};
	if(Kapitel >= 2)
	{
		B_ENTER_ADDONWORLD_Kapitel_2();
	};
	if(Kapitel >= 3)
	{
		B_ENTER_ADDONWORLD_Kapitel_3();
	};
	if(Kapitel >= 4)
	{
		B_ENTER_ADDONWORLD_Kapitel_4();
	};
	if(Kapitel >= 5)
	{
		B_ENTER_ADDONWORLD_Kapitel_5();
	};
	if(Kapitel >= 6)
	{
		B_ENTER_ADDONWORLD_Kapitel_6();
	};

	if(ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_ONETIME == FALSE)
	{
		B_KillNpc(PIR_1370_Addon_Angus);
		B_KillNpc(PIR_1371_Addon_Hank);
		B_KillNpc(VLK_4304_Addon_William);
		B_KillNpc(NONE_Addon_114_Lance_ADW);
		B_KillNpc(STRF_1131_Addon_Sklave);
		B_KillNpc(STRF_1132_Addon_Sklave);
		B_KillNpc(STRF_1133_Addon_Sklave);
		B_KillNpc(STRF_1134_Addon_Sklave);
		B_KillNpc(STRF_1135_Addon_Sklave);
		B_KillNpc(STRF_1141_Addon_Sklave);
		B_KillNpc(STRF_1142_Addon_Sklave);
		B_KillNpc(STRF_1143_Addon_Sklave);
		B_KillNpc(STRF_1144_Addon_Sklave);
		B_KillNpc(BDT_10400_Addon_DeadBandit);
		B_KillNpc(BDT_10401_Addon_DeadBandit);
		B_KillNpc(Stoneguardian_MineDead1);
		B_KillNpc(Stoneguardian_MineDead2);
		B_KillNpc(Stoneguardian_MineDead3);
		B_KillNpc(Stoneguardian_MineDead4);
		ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_ONETIME = TRUE;
	};
	if((FORTUNOAWFLAG == TRUE) && (FORTUNODONEALL == FALSE))
	{
		FORTUNODONEALL = TRUE;
		B_RemoveNpc(BDT_1075_Addon_Fortuno);
	};
	if((BRENDIKGOCAMP == TRUE) && (BRENDIKGOCAMPDONE == FALSE))
	{
		B_StartOtherRoutine(pir_6145_brendik,"GoCamp");
		BRENDIKGOCAMPDONE = TRUE;
	};
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_01_DONE == TRUE) && (BENBEGINSEARCH == FALSE))
	{
		Wld_InsertItem(itmi_falkgrandfatheritem_02,"FP_AW_ITEM_FALKGFWROTE_01");
		BENBEGINSEARCH = TRUE;
	};
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESKDW_PIR == FALSE))
	{
		if(KDW_JOINHAGEN == TRUE)
		{
			B_RemoveNpc(KDW_14000_Addon_Saturas_ADW);
			B_RemoveNpc(KDW_14010_Addon_Cronos_ADW);
			B_RemoveNpc(KDW_14020_Addon_Nefarius_ADW);
			B_RemoveNpc(KDW_14050_Addon_Merdarion_ADW);
		};
		if(PIR_JOINHAGEN == TRUE)
		{
			B_RemoveNpc(PIR_1320_Addon_Greg);
			B_RemoveNpc(PIR_1350_Addon_Francis);
			B_RemoveNpc(PIR_1351_Addon_Samuel);
			B_RemoveNpc(PIR_1352_Addon_AlligatorJack);
			B_RemoveNpc(PIR_1353_Addon_Morgan);
			B_RemoveNpc(PIR_1354_Addon_Henry);
			B_RemoveNpc(PIR_1355_Addon_Skip);
			B_RemoveNpc(PIR_1356_Addon_Bill);
			B_RemoveNpc(PIR_1357_Addon_Garett);
			B_RemoveNpc(PIR_1360_Addon_PIRAT);
			B_RemoveNpc(PIR_1361_Addon_PIRAT);
			B_RemoveNpc(PIR_1362_Addon_Bones);
			B_RemoveNpc(PIR_1363_Addon_PIRAT);
			B_RemoveNpc(PIR_1364_Addon_Pirat);
			B_RemoveNpc(PIR_1365_Addon_Matt);
			B_RemoveNpc(PIR_1366_Addon_Brandon);
			B_RemoveNpc(PIR_1367_Addon_Owen);
			B_RemoveNpc(PIR_1389_Addon_Tom);
			B_RemoveNpc(pir_6136_abigeil);
			B_RemoveNpc(pir_6145_brendik);
		};
		MOVEFORCESKDW_PIR = TRUE;
	};
	if((MIS_BELIARHELPME == LOG_OBSOLETE) && (MEHASTRIRAVAR == TRUE) && (DEMENTORDISAPPEAR == FALSE))
	{
		B_StartOtherRoutine(dmt_1257_dementor,"Start");
		DEMENTORDISAPPEAR = TRUE;
	};
	if((SEARCHULUMULU == TRUE) && (SwampSharkRes == FALSE))
	{
		Wld_InsertNpc(Swampshark,"ADW_SHARK_02");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_03");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_04");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_05");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_06");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_07");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_08");
		Wld_InsertNpc(Swampshark,"ADW_SHARK_09");
		SwampSharkRes = TRUE;
	};
	if((Sklaven_Flucht == TRUE) && (OthSklRemove == FALSE))
	{
		B_RemoveNpc(STRF_1128_Addon_Sklave);
		B_RemoveNpc(STRF_1129_Addon_Sklave);
		B_RemoveNpc(STRF_1130_Addon_Sklave);
		B_RemoveNpc(STRF_1136_Addon_Sklave);
		B_RemoveNpc(STRF_1137_Addon_Sklave);
		B_RemoveNpc(STRF_1138_Addon_Sklave);
		B_RemoveNpc(STRF_1139_Addon_Sklave);
		B_RemoveNpc(STRF_1140_Addon_Sklave);
		OthSklRemove = TRUE;
	};
	if(DRAGONGOLDMEET == TRUE)
	{
		ashtarcheck = Hlp_GetNpc(none_103_dragon_gold);
		ashtarcheck.name[0] = "Ashtar";
	};
	if((CurseAncientRemove == TRUE) && (CurseAncientRemoveDone == FALSE))
	{
		B_StartOtherRoutine(NONE_ADDON_1159_Rhademes,"FreeMe");
		CurseAncientRemoveDone = TRUE;
	};
	if((MyxirIsBack == TRUE) && (MyxirAway == FALSE))
	{
		B_RemoveNpc(Myxir_ADW);
		MyxirAway = TRUE;
	};
	if((TellAboutAdanosWeapon == TRUE) && (PlaceAdanosWeapon == FALSE))
	{
		randomplace = Hlp_Random(4);

		if(randomplace == 0)
		{
			Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_01");
		}
		else if(randomplace == 1)
		{
			Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_02");
		}
		else if(randomplace == 2)
		{
			Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_03");
		}
		else
		{
			Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_04");
		};

		TELLABOUTSTONEGUARD = TRUE;
		PlaceAdanosWeapon = TRUE;
	};
	if((InsFireShadowGuards == TRUE) && (PlaceFireShadowGuards == FALSE))
	{
		Wld_InsertNpc(Shadowbeast_Addon_Fire,"ADW_CANYON_PATH_TO_BANDITS_06E"); 
		Wld_InsertNpc(Shadowbeast_Addon_Fire_CanyonLib,"ADW_CANYON_LIBRARY_04");
		Wld_InsertNpc(Shadowbeast_Addon_Fire_Lib,"ADW_CANYON_LIBRARY_LEFT_08");
		Wld_InsertNpc(Shadowbeast_Addon_Fire_Lib,"ADW_CANYON_LIBRARY_LEFT_07");
		Wld_InsertNpc(Shadowbeast_Addon_Fire_Lib,"ADW_CANYON_LIBRARY_RIGHT_07");
		Wld_InsertNpc(Shadowbeast_Addon_Fire_Lib,"ADW_CANYON_LIBRARY_RIGHT_13");
		PlaceFireShadowGuards = TRUE;
	};
	if((LoaGoDrakia == TRUE) && (LoaGoDrakiaPlace == FALSE))
	{
		Wld_InsertNpc(SLD_10921_Loa_ADW,"ADW_LOA_SHIP"); 
		LoaGoDrakiaPlace = TRUE;
	};
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestGuardStep == TRUE) && (KinjartsIns == FALSE))
	{
		if(Kapitel < 4)
		{
			Wld_InsertNpc(BDT_4568_KINJARTS,"BL_UP_PLACE_04_B");
		}
		else
		{
			Wld_InsertNpc(BDT_4568_KINJARTS,"ADW_PIRATECAMP_CAVE3_01");
			B_StartOtherRoutine(BDT_4568_KINJARTS,"Invasion");
		};

		KinjartsIns = TRUE;
	};
	if((PashalQuestGuardStep == TRUE) && (KinjartsIns == FALSE) && (Kapitel < 4))
	{
		Wld_InsertNpc(BDT_4568_KINJARTS,"AW_KINJARTS_01");
		KinjartsIns = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ADDONWORLD_ZEN;
	B_InitNpcGlobals();
};