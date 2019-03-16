var int enterprioratworld_kapitel1;

func void b_enter_prioratworld_kapitel_1()
{
	if(ENTERPRIORATWORLD_KAPITEL1 == FALSE)
	{
		B_KillNpc(SEK_159_SLAVEOBSSEK);
		B_KillNpc(SEK_160_SLAVEOBSSEK);
		ENTERPRIORATWORLD_KAPITEL1 = TRUE;
	};
};

var int enterprioratworld_kapitel2;

func void b_enter_prioratworld_kapitel_2()
{
	if(ENTERPRIORATWORLD_KAPITEL2 == FALSE)
	{
		ENTERPRIORATWORLD_KAPITEL2 = TRUE;
	};
};


var int enterprioratworld_kapitel3;

func void b_enter_prioratworld_kapitel_3()
{
	if(ENTERPRIORATWORLD_KAPITEL3 == FALSE)
	{
		ENTERPRIORATWORLD_KAPITEL3 = TRUE;
	};
};


var int enterprioratworld_kapitel4;

func void b_enter_prioratworld_kapitel_4()
{
	if(ENTERPRIORATWORLD_KAPITEL4 == FALSE)
	{
		ENTERPRIORATWORLD_KAPITEL4 = TRUE;
	};
};


var int enterprioratworld_kapitel5;

func void b_enter_prioratworld_kapitel_5()
{
	if(ENTERPRIORATWORLD_KAPITEL5 == FALSE)
	{
		ENTERPRIORATWORLD_KAPITEL5 = TRUE;
	};
};


var int enterprioratworld_kapitel6;

func void b_enter_prioratworld_kapitel_6()
{
	if(ENTERPRIORATWORLD_KAPITEL6 == FALSE)
	{
		ENTERPRIORATWORLD_KAPITEL6 = TRUE;
	};
};

func void b_enter_prioratworld()
{
	B_InitNpcGlobals();

	if(MasiafUp == FALSE)
	{
		Wld_InsertNpc(Ass_125_Tiamant,"PW_TIAMANT");
		Wld_InsertNpc(Ass_126_Haniar,"PW_HANIAR");
		Wld_InsertNpc(Ass_127_Osair,"PW_OSAIR");
		Wld_InsertNpc(Ass_128_Nrozas,"PW_NROZAS");
		Wld_InsertNpc(Ass_131_Adept,"PW_TEMPLE_GUARD_01");
		Wld_InsertNpc(Ass_132_Adept,"PW_TEMPLE_GUARD_02");
		Wld_InsertNpc(Ass_133_Adept,"PW_GROT_PRISION_OSAIR_GUARD_01");
		Wld_InsertNpc(Ass_134_Adept,"PW_GROT_PRISION_OSAIR_GUARD_02");
		Wld_InsertNpc(Ass_135_Adept,"PW_GROT_PRISION_OSAIR_GUARD_03");
		Wld_InsertNpc(Ass_136_Adept,"PW_GROT_PRISION_OSAIR_GUARD_04");
		Wld_InsertNpc(Ass_137_Adept,"PW_GROT_PRISION_GUARDIAN");
		Wld_InsertNpc(Ass_138_Adept,"PW_HANIAR_ACOLYATS_01");
		Wld_InsertNpc(Ass_139_Adept,"PW_HANIAR_ACOLYATS_02");
		Wld_InsertNpc(Ass_140_Adept,"PW_HANIAR_ACOLYATS_03");
		Wld_InsertNpc(Ass_141_Adept,"PW_HANIAR_ACOLYATS_04");
		Wld_InsertNpc(Ass_142_Adept,"PW_TEMPLE_25");
		Wld_InsertNpc(Ass_143_Adept,"PW_TEMPLE_26");
		Wld_InsertNpc(Ass_144_Adept,"PW_TEMPLE_17");
		Wld_InsertNpc(Ass_145_Adept,"PW_TEMPLE_18");
		Wld_InsertNpc(Ass_146_Adept,"PW_TEMPLE_19");
		Wld_InsertNpc(Ass_147_Adept,"PW_TEMPLE_20");
		Wld_InsertNpc(Ass_148_Adept,"PW_TEMPLE_30");
		Wld_InsertNpc(Ass_149_Adept,"PW_TEMPLE_31");
		Wld_InsertNpc(Ass_150_Adept,"PW_TEMPLE_10");
		Wld_InsertNpc(Ass_151_Adept,"PW_TEMPLE_14");
		Wld_InsertNpc(Ass_152_Adept,"PW_TEMPLE_WATCHER");
		Wld_InsertNpc(SEK_153_SLAVEOBSSEK,"PW_GROT_PRISION_SLAVE_01");
		Wld_InsertNpc(SEK_154_SLAVEOBSSEK,"PW_GROT_PRISION_SLAVE_02");
		Wld_InsertNpc(SEK_155_SLAVEOBSSEK,"PW_GROT_PRISION_SLAVE_03");
		Wld_InsertNpc(SEK_156_SLAVEOBSSEK,"PW_GROT_PRISION_SLAVE_04");
		Wld_InsertNpc(SEK_157_SLAVEOBSSEK,"PW_GROT_PRISION_SLAVE_05");
		Wld_InsertNpc(SEK_158_SLAVEOBSSEK,"PW_GROT_PRISION_SLAVE_06");
		Wld_InsertNpc(Ass_161_Adept,"PW_TEMPLE_AKO_01");
		Wld_InsertNpc(Ass_162_Adept,"PW_TEMPLE_AKO_03");
		Wld_InsertNpc(Ass_163_Adept,"PW_TEMPLE_AKO_04");
		Wld_InsertNpc(Ass_164_Adept,"PW_TEMPLE_AKO_05");
		Wld_InsertNpc(Ass_165_Adept,"PW_TEMPLE_AKO_06");
		Wld_InsertNpc(Ass_166_Adept,"PW_TEMPLE_27");
		Wld_InsertNpc(SEK_159_SLAVEOBSSEK,"PW_TEMPLE_PIT_01");
		Wld_InsertNpc(SEK_160_SLAVEOBSSEK,"PW_TEMPLE_PIT_02");
		Wld_InsertNpc(Ass_130_CorGalomDemon,"PW_INNER_TEMPLE_BOSS_MAIN");
		Wld_InsertNpc(Demon_PW_BOSS_GUARD_WAY,"PW_INNER_TEMPLE_BOSS_02");
		Wld_InsertNpc(Ass_172_Adept_Demon,"PW_INNER_GUARD_01");
		Wld_InsertNpc(Ass_173_Adept_Demon,"PW_INNER_GUARD_02");
		Wld_InsertNpc(Ass_174_Adept_Demon,"PW_INNER_GUARD_03");
		Wld_InsertNpc(Ass_175_Adept_Demon,"PW_INNER_GUARD_04");
		Wld_InsertNpc(Ass_178_Prior_ArchDemon,"PW_INNER_GUARD_05");
		Wld_InsertNpc(Demon_PW_01,"PW_INNER_DEMONCAVE_01");
		Wld_InsertNpc(Demon_PW_02,"PW_INNER_DEMONCAVE_02");
		Wld_InsertNpc(Demon_PW_03,"PW_INNER_DEMONCAVE_03");
		Wld_InsertNpc(Demon_PW_04,"PW_INNER_DEMONCAVE_04");
		Wld_InsertNpc(Demon_PW_BOSS_GUARD_01,"PW_INNER_TEMPLE_BOSS_MAIN_GUARD_01");
		Wld_InsertNpc(Demon_PW_BOSS_GUARD_02,"PW_INNER_TEMPLE_BOSS_MAIN_GUARD_02");
		Wld_InsertNpc(Demon_PW_BOSS_GUARD_03,"PW_INNER_TEMPLE_BOSS_MAIN_GUARD_03");
		Wld_InsertNpc(SEK_179_SLAVEOBSSEK,"PW_CAVEORE_01");
		Wld_InsertNpc(SEK_180_SLAVEOBSSEK,"PW_CAVEORE_02");
		Wld_InsertNpc(SEK_181_SLAVEOBSSEK,"PW_CAVEORE_03");
		Wld_InsertNpc(Ass_182_Adept,"PW_CAVEORE_04");
		MasiafUp = TRUE;
	};
	if((MIS_FollowMasiafLair == LOG_SUCCESS) && (GonsalesPW_Up == FALSE) && (GonsalesNWIsDead == FALSE))
	{
		Wld_InsertNpc(NONE_1190_Assasin,"PW_GONSALES");
		GonsalesPW_Up = TRUE;
	};
	if((KnowWhoRebels == TRUE) && (MariusIns == FALSE))
	{
		Wld_InsertNpc(SEK_169_SLAVEOBSSEK,"PW_TEMPLE_MARIUS_01");
		MariusIns = TRUE;
	};
	if(Kapitel >= 1)
	{
		b_enter_prioratworld_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_prioratworld_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_prioratworld_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_prioratworld_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_prioratworld_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_prioratworld_kapitel_6();
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = PRIORATWORLD_ZEN;
	B_InitNpcGlobals();
};