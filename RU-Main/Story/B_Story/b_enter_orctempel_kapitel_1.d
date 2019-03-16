var int DeadOrcLeavePeaceDone;

func void b_enter_orctempel_kapitel_1()
{
};


var int enterorctemple_kapitel2;

func void b_enter_orctempel_kapitel_2()
{
	if(ENTERORCTEMPLE_KAPITEL2 == FALSE)
	{
		Wld_InsertNpc(Skeleton,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(Zombie04,"FP_ROAM_MEDITATE_01");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDITATE_05");
		Wld_InsertNpc(Zombie04,"FP_ROAM_MEDITATE_07");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDITATE_11");
		Wld_InsertNpc(Zombie04,"FP_ROAM_MEDITATE_13");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDITATE_15");
		Wld_InsertNpc(Zombie04,"FP_ROAM_MEDITATE_17");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NOVIZE_51");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NOVIZE_50");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NOVIZE_46");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_NOVIZE_32");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NOVIZE_30");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NOVIZE_36");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NOVIZE_37");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_02");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_03");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_06");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_NOVIZE_23");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_NOVIZE_18");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NOVIZE_22");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"FP_ROAM_NOVIZE_20");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"FP_ROAM_NOVIZE_15");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NOVIZE_13");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_14");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_16");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_NOVIZE_08");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_HRAMGUARD_18");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_HRAMGUARD_20");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_24");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_25");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_27");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_29");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_31");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_33");
		Wld_InsertNpc(Minecrawler,"FP_ROAM_HRAMGUARD_36");
		Wld_InsertNpc(Minecrawler,"FP_ROAM_HRAMGUARD_39");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_42");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_44");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_46");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_48");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_50");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_53");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_56");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_59");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_61");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_64");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_65");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_67");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_68");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_HRAMGUARD_69");
		Wld_InsertNpc(Minecrawler,"FP_ROAM_HRAMGUARD_71");
		Wld_InsertNpc(Minecrawler,"FP_ROAM_HRAMGUARD_73");
		Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_HRAMGUARD_77");
		Wld_InsertNpc(Minecrawler,"FP_ROAM_HRAMGUARD_78");
		Wld_InsertNpc(UNDEADORCWARRIORELITE,"FP_ROAM_HRAMGUARD_81");
		Wld_InsertNpc(UNDEADORCWARRIORELITE,"FP_ROAM_HRAMGUARD_83");
		Wld_InsertNpc(UNDEADORCWARRIORELITE,"FP_ROAM_HRAMGUARD_85");
		Wld_InsertNpc(UNDEADORCWARRIORELITE,"FP_ROAM_HRAMGUARD_87");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_91");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_100");
		Wld_InsertNpc(Zombie02,"FP_ROAM_HRAMGUARD_94");
		Wld_InsertNpc(Zombie02,"FP_ROAM_HRAMGUARD_97");
		Wld_InsertNpc(Zombie04,"FP_ROAM_HRAMGUARD_99");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_103");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_105");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_HRAMGUARD_109");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_112");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_108");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_116");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_HRAMGUARD_118");
		Wld_InsertNpc(UNDEADORCWARRIORELITE,"FP_ROAM_PRIESTGUARD_02");
		Wld_InsertNpc(UNDEADORCWARRIORELITE,"FP_ROAM_PRIESTGUARD_06");
		ENTERORCTEMPLE_KAPITEL2 = TRUE;
	};
};


var int enterorctemple_kapitel3;

func void b_enter_orctempel_kapitel_3()
{
	if(ENTERORCTEMPLE_KAPITEL3 == FALSE)
	{
		ENTERORCTEMPLE_KAPITEL3 = TRUE;
	};
};


var int enterorctemple_kapitel4;

func void b_enter_orctempel_kapitel_4()
{
	if(ENTERORCTEMPLE_KAPITEL4 == FALSE)
	{
		ENTERORCTEMPLE_KAPITEL4 = TRUE;
	};
};


var int enterorctemple_kapitel5;

func void b_enter_orctempel_kapitel_5()
{
	if(ENTERORCTEMPLE_KAPITEL5 == FALSE)
	{
		ENTERORCTEMPLE_KAPITEL5 = TRUE;
	};
};


var int enterorctemple_kapitel6;

func void b_enter_orctempel_kapitel_6()
{
	if(ENTERORCTEMPLE_KAPITEL6 == FALSE)
	{
		ENTERORCTEMPLE_KAPITEL6 = TRUE;
	};
};

var int ENTERORCTEMPLE_SLEEPER;

func void b_enter_orctempel_sleeper()
{
	if((ENTERORCTEMPLE_SLEEPER == FALSE) && (SLEEPERINSHRAM == TRUE) && (DARKMAGE_ISDEAD == TRUE))
	{
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_01");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_NOVIZE_49");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_NOVIZE_54");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_51");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_44");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_29");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_31");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_33");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_HRAMGUARD_11");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_HRAMGUARD_10");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_01");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_04");
		Wld_InsertNpc(Demon,"FP_ROAM_HRAMGUARD_05");
		Wld_InsertNpc(Demon,"FP_ROAM_HRAMGUARD_08");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_24");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_17");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_22");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_20");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_16");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_14");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_12");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_13");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_NOVIZE_12");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_14");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_16");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NOVIZE_10");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_09");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_07");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_19");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_20");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_21");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_22");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_23");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_24");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_25");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_27");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_29");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_31");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_33");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_34");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_42");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_44");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_46");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_48");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_50");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_52");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_54");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_56");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_58");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_60");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_62");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_HRAMGUARD_63");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_64");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_65");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_66");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_68");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_80");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_82");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_84");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_86");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_88");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_HRAMGUARD_89");
		Wld_InsertNpc(Demon,"FP_ROAM_HRAMGUARD_90");
		Wld_InsertNpc(Demon,"FP_ROAM_HRAMGUARD_92");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_AXE,"FP_ROAM_HRAMGUARD_93");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK,"FP_ROAM_HRAMGUARD_96");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_AXE,"FP_ROAM_HRAMGUARD_99");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_HRAMGUARD_101");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_102");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_104");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_106");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_108");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_110");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_112");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_114");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_HRAMGUARD_115");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_116");
		Wld_InsertNpc(DemonLord,"FP_ROAM_HRAMGUARD_118");
		Wld_InsertNpc(DemonLord,"FP_ROAM_PRIESTGUARD_01");
		Wld_InsertNpc(DemonLord,"FP_ROAM_PRIESTGUARD_03");
		Wld_InsertNpc(DemonLord,"FP_ROAM_PRIESTGUARD_05");
		Wld_InsertNpc(DemonLord,"FP_ROAM_PRIESTGUARD_07");
		Wld_InsertNpc(DemonLord,"FP_ROAM_PRIESTGUARD_08");

		Wld_InsertNpc(Demon_SleeperIns,"TPL_395");
		ENTERORCTEMPLE_SLEEPER = TRUE;
		SleeperInRage = TRUE;
	};
};

func void b_enter_orctempel_orcinc()
{
	if((DARKMAGE_ISDEAD == TRUE) && (ORCINHRAMAGAIN == FALSE) && (SleeperInRage == FALSE) && (OrcIsBackTemple == TRUE))
	{
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_KALOMGUARD_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_KALOMGUARD_01");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_NOVIZE_49");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_NOVIZE_54");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_51");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_52");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_50");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_44");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_45");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_46");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_47");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_29");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_39");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_31");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_32");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_33");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_30");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_34");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_35");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_36");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_37");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_NOVIZE_38");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_HRAMGUARD_11");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_HRAMGUARD_10");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_01");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_03");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_04");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_05");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_06");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_07");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_08");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_24");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_23");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_18");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_17");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_22");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_21");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_20");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_19");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_16");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_15");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_14");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_13");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_12");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_13");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_NOVIZE_12");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_11");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_14");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_15");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_16");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_17");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_10");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_09");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_08");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_06");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_18");
		Wld_InsertNpc(orkelite_addon2,"EVT_TPL_13_SPAWN_FP_ROAM_ROOMRIGHT_01");
		Wld_InsertNpc(orkelite_addon2,"EVT_TPL_13_SPAWN_FP_ROAM_ROOMLEFT_01");
		Wld_InsertNpc(orkelite_addon2,"EVT_TPL_13_SPAWN_FP_ROAM_ROOMCENTER_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_19");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_20");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_21");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_22");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_23");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_24");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_25");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_26");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_27");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_28");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_29");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_30");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_31");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NOVIZE_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_32");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_33");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_34");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_41");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_42");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_43");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_44");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_45");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_46");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_47");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_48");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_49");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_50");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_51");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_52");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_53");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_54");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_55");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_56");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_57");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_58");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_59");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_60");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_61");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_62");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_HRAMGUARD_63");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_64");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_65");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NOVIZE_01");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_66");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_67");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_68");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_69");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_70");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_80");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_81");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_82");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_83");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_84");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_85");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_86");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_87");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_88");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_HRAMGUARD_89");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_90");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_91");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_92");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_100");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_95");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_93");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_94");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_96");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_97");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_98");
		Wld_InsertNpc(orcwarrior1,"FP_ROAM_HRAMGUARD_99");
		Wld_InsertNpc(orcshaman_roam,"FP_ROAM_HRAMGUARD_101");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_102");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_103");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_104");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_105");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMGUARD_106");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_107");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_108");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_109");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_110");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_111");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_112");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_113");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_114");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_HRAMGUARD_115");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_116");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_117");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_HRAMGUARD_118");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_01");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_02");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_03");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_04");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_05");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_06");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_07");
		Wld_InsertNpc(orc_hram_roam,"FP_ROAM_PRIESTGUARD_08");
		ORCINHRAMAGAIN = TRUE;
	};
};

var int enterorctemple_insertsouls;
var int OldOrcBooksIns;

func void b_enter_orctempel()
{
	B_InitNpcGlobals();

	if(Kapitel >= 1)
	{
		b_enter_orctempel_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_orctempel_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_orctempel_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_orctempel_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_orctempel_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_orctempel_kapitel_6();
	};
	if((DragonUndeadIsDead == TRUE) && (SleeperInRage == FALSE))
	{
		b_enter_orctempel_sleeper();
	};
	if((DARKMAGE_ISDEAD == TRUE) && (ORCINHRAMAGAIN == FALSE) && (SleeperInRage == FALSE))
	{
		b_enter_orctempel_orcinc();
	};
	if((ELEMTITANSINS == TRUE) && (ENTERORCTEMPLE_INSERTSOULS == FALSE))
	{
		Wld_InsertNpc(DMT_13001_DARKMAGE,"TPL_058");
		Wld_InsertNpc(DMT_13002_DARKMAGE,"TPL_124");
		Wld_InsertNpc(DMT_13003_DARKMAGE,"TPL_193_09");
		ENTERORCTEMPLE_INSERTSOULS = TRUE;
	};
	if((MIS_NagDumgar == LOG_Running) && (OldOrcBooksIns == FALSE))
	{
		Wld_InsertItem(ItWr_AboutNagDumgar_P1,"FP_ITEM_NAGDUMGAR_01");
		Wld_InsertItem(ItWr_AboutNagDumgar_P2,"FP_ITEM_NAGDUMGAR_02");
		OldOrcBooksIns = TRUE;
	};
	if((MIS_NagDumgar == LOG_Running) && (DeadRabOrkovInsert == TRUE) && (DeadRabOrkovInsertDone == FALSE))
	{
		Wld_InsertNpc(Orc_8569_DeadOrc,"OT_DEADORC_SPEAK");
		DeadRabOrkovInsertDone = TRUE;
	};
	if((DeadOrcLeavePeace == TRUE) && (DeadOrcLeavePeaceDone == FALSE))
	{
		B_RemoveMonster(Orc_8569_DeadOrc);
		DeadOrcLeavePeaceDone = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = ORCTEMPEL_ZEN;
	B_InitNpcGlobals();
};