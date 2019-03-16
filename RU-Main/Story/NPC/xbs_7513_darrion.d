
instance XBS_7513_DARRION(Npc_Default)
{
	name[0] = "Даррион";
	guild = GIL_OUT;
	id = 7513;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_XBSMAIN;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert4);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",167,BodyTex_L,ITAR_Lester);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7513;
};


func void rtn_start_7513()
{
	TA_Smith_Fire(8,0,8,10,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(8,10,8,20,"WP_COAST_FOREST_117");
	TA_Smith_Fire(8,20,8,30,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(8,30,8,40,"WP_COAST_FOREST_117");
	TA_Smith_Cool(8,40,8,50,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(8,50,9,0,"WP_COAST_FOREST_116");
	TA_Smith_Fire(9,0,9,10,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(9,10,9,20,"WP_COAST_FOREST_117");
	TA_Smith_Fire(9,20,9,30,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(9,30,9,40,"WP_COAST_FOREST_117");
	TA_Smith_Cool(9,40,9,50,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(9,50,10,0,"WP_COAST_FOREST_116");
	TA_Smith_Fire(10,0,10,10,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(10,10,10,20,"WP_COAST_FOREST_117");
	TA_Smith_Fire(10,20,10,30,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(10,30,10,40,"WP_COAST_FOREST_117");
	TA_Smith_Cool(10,40,10,50,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(10,50,11,0,"WP_COAST_FOREST_116");
	TA_Smith_Fire(11,0,11,15,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(11,15,11,25,"WP_COAST_FOREST_117");
	TA_Smith_Fire(11,25,11,40,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(11,40,11,50,"WP_COAST_FOREST_117");
	TA_Smith_Cool(11,50,12,0,"WP_COAST_FOREST_119");
	TA_Smith_Fire(12,0,12,15,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(12,15,12,25,"WP_COAST_FOREST_117");
	TA_Smith_Fire(12,25,12,40,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(12,40,12,50,"WP_COAST_FOREST_117");
	TA_Smith_Cool(12,50,13,0,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(13,0,14,0,"WP_COAST_FOREST_116");
	TA_Smith_Fire(14,0,14,10,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(14,10,14,20,"WP_COAST_FOREST_117");
	TA_Smith_Fire(14,20,14,30,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(14,30,14,40,"WP_COAST_FOREST_117");
	TA_Smith_Cool(14,40,14,50,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(14,50,15,0,"WP_COAST_FOREST_116");
	TA_Smith_Fire(15,0,15,15,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(15,15,15,25,"WP_COAST_FOREST_117");
	TA_Smith_Fire(15,25,15,40,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(15,40,15,50,"WP_COAST_FOREST_117");
	TA_Smith_Cool(15,50,16,0,"WP_COAST_FOREST_119");
	TA_Smith_Fire(16,0,16,10,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(16,10,16,20,"WP_COAST_FOREST_117");
	TA_Smith_Fire(16,20,16,30,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(16,30,16,40,"WP_COAST_FOREST_117");
	TA_Smith_Cool(16,40,16,50,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(16,50,17,0,"WP_COAST_FOREST_116");
	TA_Smith_Fire(17,0,17,15,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(17,15,17,25,"WP_COAST_FOREST_117");
	TA_Smith_Fire(17,25,17,40,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(17,40,17,50,"WP_COAST_FOREST_117");
	TA_Smith_Cool(17,50,18,0,"WP_COAST_FOREST_119");
	TA_Smith_Fire(18,0,18,10,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(18,10,18,20,"WP_COAST_FOREST_117");
	TA_Smith_Fire(18,20,18,30,"WP_COAST_FOREST_118");
	TA_Smith_Anvil(18,30,18,40,"WP_COAST_FOREST_117");
	TA_Smith_Cool(18,40,18,50,"WP_COAST_FOREST_119");
	TA_Smith_Sharp(18,50,19,0,"WP_COAST_FOREST_116");
	TA_Sit_Chair(19,0,22,15,"WP_COAST_BASE_23");
	TA_Sleep(22,15,8,0,"WP_COAST_FOREST_122");
};

