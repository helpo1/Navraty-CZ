
func void B_Extro_Avi()
{
	if((Npc_IsDead(PC_Thief_DI) == FALSE) && (Npc_IsDead(PC_Fighter_DI) == FALSE))
	{
		DiegAndGornAreOnboard = TRUE;
	};

	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Credits_Extro.BIK");
	PlayVideo("Credits2.BIK");

	if(DiegAndGornAreOnboard == TRUE)
	{
		PlayVideo("Extro_AllesWirdGut.BIK");
	};
	ExitSession();
};

func void b_extrocontinue_avi()
{
	Log_SetTopicStatus(TOPIC_HallenVonIrdorath,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_BackToShip,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_MyCrew,LOG_SUCCESS);
	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Extro_AllesWirdGut.BIK");
	PlayVideo("RET2_Storm.BIK");
};

func void b_end_avi()
{
	ENDGAMECREDITS = TRUE;
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"SHIP_IN_10");
	//Wld_SendTrigger("EVT_CAMERA_ENDGAME");
};

