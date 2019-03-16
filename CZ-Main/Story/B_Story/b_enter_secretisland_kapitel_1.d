
var int entersecretisland_kapitel1;

func void b_enter_secretisland_kapitel_1()
{
	if(ENTERSECRETISLAND_KAPITEL1 == FALSE)
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		MEHASTRIRAVAR = TRUE;
		ENTERSECRETISLAND_KAPITEL1 = TRUE;
	};
};


var int entersecretisland_kapitel2;

func void b_enter_secretisland_kapitel_2()
{
	if(ENTERSECRETISLAND_KAPITEL2 == FALSE)
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		MEHASTRIRAVAR = TRUE;
		ENTERSECRETISLAND_KAPITEL2 = TRUE;
	};
};


var int entersecretisland_kapitel3;

func void b_enter_secretisland_kapitel_3()
{
	if(ENTERSECRETISLAND_KAPITEL3 == FALSE)
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		MEHASTRIRAVAR = TRUE;
		ENTERSECRETISLAND_KAPITEL3 = TRUE;
	};
};


var int entersecretisland_kapitel4;

func void b_enter_secretisland_kapitel_4()
{
	if(ENTERSECRETISLAND_KAPITEL4 == FALSE)
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		MEHASTRIRAVAR = TRUE;
		ENTERSECRETISLAND_KAPITEL4 = TRUE;
	};
};


var int entersecretisland_kapitel5;

func void b_enter_secretisland_kapitel_5()
{
	if(ENTERSECRETISLAND_KAPITEL5 == FALSE)
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		MEHASTRIRAVAR = TRUE;
		ENTERSECRETISLAND_KAPITEL5 = TRUE;
	};
};


var int entersecretisland_kapitel6;

func void b_enter_secretisland_kapitel_6()
{
	if(ENTERSECRETISLAND_KAPITEL6 == FALSE)
	{
		Wld_InsertNpc(Molerat,"FP_ROAM_INSEL_MOLERAT_01");
		Wld_InsertNpc(Molerat,"FP_ROAM_INSEL_MOLERAT_02");
		Wld_InsertNpc(Molerat,"FP_ROAM_INSEL_MOLERAT_06");
		Wld_InsertNpc(Molerat,"FP_ROAM_INSEL_MOLERAT_07");
		Wld_InsertNpc(Wolf,"FP_ROAM_INSEL_ORKS_1000");
		Wld_InsertNpc(Bloodfly,"INSEL_ORKS_10");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_83");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_83");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_83");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_83");
		Wld_InsertNpc(Bloodfly,"INSEL_NATUR_85");
		Wld_InsertNpc(Bloodfly,"INSEL_NATUR_85");
		Wld_InsertNpc(Bloodfly,"INSEL_NATUR_1000");
		Wld_InsertNpc(Bloodfly,"INSEL_NATUR_1000");
		Wld_InsertNpc(Molerat,"INSEL_NATUR_103");
		Wld_InsertNpc(Molerat,"INSEL_NATUR_104");
		Wld_InsertNpc(Molerat,"INSEL_DORF_531");
		Wld_InsertNpc(Swamprat,"FP_INSEL_ROAM_TIERE_19");
		Wld_InsertNpc(Scavenger,"FP_INSELROAM_TIERE_16");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_17");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_18");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_07");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_08");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_05");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_06");
		Wld_InsertNpc(Keiler,"FP_ROAM _INSEL_TIERE_42");
		Wld_InsertNpc(Keiler,"FP_ROAM _INSEL_TIERE_41");
		Wld_InsertNpc(Keiler,"FP_INSEL_ROAM_TIERE_45");
		Wld_InsertNpc(Keiler,"FP_INSEL_ROAM_TIERE_47");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_48");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_49");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_50");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_90");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_91");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_92");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_93");
		Wld_InsertNpc(Bloodfly,"FP_INSEL_ROAM_TIERE_52");
		Wld_InsertNpc(Bloodfly,"FP_INSEL_ROAM_TIERE_54");
		Wld_InsertNpc(Molerat,"FP_INSEL_ROAM_TIERE_54");
		Wld_InsertNpc(Molerat,"FP_INSEL_ROAM_TIERE_56");
		Wld_InsertNpc(Bloodfly,"INSEL_DORF_538");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_47");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_48");
		Wld_InsertNpc(Wolf,"INSEL_NATUR_62");
		Wld_InsertNpc(Wolf,"INSEL_DRAUSSEN_04");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_02");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_04");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_07");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_10");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_26");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_18");
		Wld_InsertNpc(Lurker,"FP_ROAM_INSEL_LURKER_13");
		Wld_InsertNpc(Lurker,"INSEL_NATUR_124");
		Wld_InsertNpc(Lurker,"INSEL_NATUR_500");
		Wld_InsertNpc(Lurker,"INSEL_NATUR_21");
		Wld_InsertNpc(Lurker,"INSEL_NATUR_19");
		Wld_InsertNpc(Waran,"FP_INSEL_ROAM_TIERE_86");
		Wld_InsertNpc(Waran,"FP_INSEL_ROAM_TIERE_84");
		Wld_InsertNpc(Waran,"FP_INSEL_ROAM_TIERE_85");
		Wld_InsertNpc(Waran,"FP_INSEL_ROAM_TIERE_80");
		Wld_InsertNpc(Waran,"FP_INSEL_ROAM_TIERE_81");
		Wld_InsertNpc(Waran,"FP_ROAM_EMILIO_01");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_58");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_59");
		Wld_InsertNpc(Scavenger,"FP_INSEL_ROAM_TIERE_60");
		Wld_InsertNpc(Wolf,"FP_INSEL_ROAM_TIERE_76");
		Wld_InsertNpc(Wolf,"FP_INSEL_ROAM_TIERE_78");

		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		MEHASTRIRAVAR = TRUE;
		ENTERSECRETISLAND_KAPITEL6 = TRUE;
	};
};

func void b_enter_secretisland()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_secretisland_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_secretisland_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_secretisland_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_secretisland_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_secretisland_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_secretisland_kapitel_6();
	};
	if((TRANSFERARMORISEQUIPED == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_L,0,"Hum_Head_Bald",Face_N_Normal_Blade,0,NO_ARMOR);
		PLAYERISTRANSFER = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = SECRETISLAND_ZEN;
	B_InitNpcGlobals();
};

