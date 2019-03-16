
func void on_teleport_up()
{
	if((HashGorBattleStart == FALSE) || (HashGorIsDead == TRUE))
	{
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(hero);
		AI_Teleport(hero,"GRYD_UP");
	};
};

func void on_teleport_down()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"GRYD_DOWN");
};

func void on_teleport_up_orccity()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"ORC_CITY_TELEPORT_DOWN");
};

func void ORC_ARENA_EXIT_ORCCITY()
{
	if((ArenaFightNow == TRUE) && (MIS_OrcArena == LOG_Running))
	{
		B_LogEntry_Failed(TOPIC_OrcArena);
		UrKanPissOff = TRUE;
		MIS_OrcArena = LOG_FAILED;
		Npc_ExchangeRoutine(STRF_8146_Hart,"Start");
	};
};

func void on_teleport_down_orccity()
{
	if((ArenaFightNow == TRUE) && (MIS_OrcArena == LOG_Running))
	{
		B_LogEntry_Failed(TOPIC_OrcArena);
		UrKanPissOff = TRUE;
		MIS_OrcArena = LOG_FAILED;
		Npc_ExchangeRoutine(STRF_8146_Hart,"Start");
	};

	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"ORC_CITY_TELEPORT_UP");
};

func void on_use_orcoremine_01_s1()
{
	if(CanEnterOrcMine == FALSE)
	{
		ULUMULUISEQUIP = FALSE;
	};
	if(OrcMineClosed == TRUE)
	{
		ULUMULUISEQUIP = FALSE;
	};
	if(Npc_HasItems(hero,ItKe_OrcOreMine) >= 1)
	{
		Npc_RemoveInvItems(hero,ItKe_OrcOreMine,Npc_HasItems(hero,ItKe_OrcOreMine));
	};
};

func void on_use_treasure_03_s1()
{
	ULUMULUISEQUIP = FALSE;
};

func void on_use_treasure_02_s1()
{
	ULUMULUISEQUIP = FALSE;
};

func void on_use_treasure_01_s1()
{
	ULUMULUISEQUIP = FALSE;
};

func void check_orccity_gate()
{
	if((CHECK_ORCCITYGATE_01 == TRUE) && (CHECK_ORCCITYGATE_02 == TRUE))
	{
		Wld_SendTrigger("EVT_GATE_ORCCITY_01");
	};
};

func void open_orccity_gate_01()
{
	CHECK_ORCCITYGATE_01 = TRUE;
	check_orccity_gate();
};

func void open_orccity_gate_02()
{
	CHECK_ORCCITYGATE_02 = TRUE;
	check_orccity_gate();
};

