
instance VLK_7531_WAFFENKNECHT(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 7531;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_CSP_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Kriegskeule);
	EquipItem(self,ItRw_Bow_L_02);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart09,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = rtn_start_7531;
};


func void rtn_start_7531()
{
	TA_Stand_Drinking(7,10,7,14,"WP_COAST_FOREST_45");
	TA_Stand_Eating(7,14,7,20,"WP_COAST_FOREST_42");
	TA_Stand_Drinking(7,20,7,28,"WP_COAST_FOREST_40");
	TA_Stand_Eating(7,28,7,35,"WP_COAST_FOREST_38");
	TA_Stand_ArmsCrossed(7,35,23,25,"WP_COAST_FOREST_38");
	TA_Stand_Eating(23,25,23,32,"WP_COAST_FOREST_38");
	TA_Stand_Drinking(23,32,23,40,"WP_COAST_FOREST_40");
	TA_Stand_Eating(23,40,23,46,"WP_COAST_FOREST_42");
	TA_Stand_Drinking(23,46,23,50,"WP_COAST_FOREST_45");
	TA_Sleep(23,50,7,10,"WP_COAST_CAMP_06A");
};

func void rtn_dead_7531()
{
	TA_Stand_WP(8,0,20,0,"OC_CAMPFIRE_OUT_02");
	TA_Stand_WP(20,0,8,0,"OC_CAMPFIRE_OUT_02");
};

