/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(4x) opraven waypoint (NW_BILGOT_01 -> NW_PASS_GATE_01)
func void Rtn_InTower_41200 - upraveny rutiny (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))

*/




instance VLK_4120_Bilgot(Npc_Default)
{
	name[0] = "Bilgot";
	guild = GIL_OUT;
	id = 4120;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,4);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Cutter,BodyTex_P,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4120;
};


func void Rtn_Start_4120()
{
	TA_Sit_Campfire(8,0,23,0,"OW_NEWMINE_11");
	TA_Sit_Campfire(23,0,8,0,"OW_NEWMINE_11");
};

func void Rtn_FollowToOCBridge_4120()
{
	TA_Follow_Player(8,0,23,0,"OW_NEWMINE_11");
	TA_Follow_Player(23,0,8,0,"OW_NEWMINE_11");
};

func void Rtn_FleeOutOfOW_4120()
{
	TA_Sit_Campfire(8,0,23,0,"START");
	TA_Sit_Campfire(23,0,8,0,"START");
};

func void Rtn_Tot_4120()
{
	TA_Sit_Campfire(8,0,23,0,"TOT");
	TA_Sit_Campfire(23,0,8,0,"TOT");
};

instance VLK_41200_Bilgot(Npc_Default)
{
	name[0] = "Bilgot";
	guild = GIL_OUT;
	id = 41200;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Cutter,BodyTex_P,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_41200;
};

func void Rtn_Start_41200()
{
	TA_Sit_Campfire(8,0,23,0,"NW_PASS_GATE_01");
	TA_Sit_Campfire(23,0,8,0,"NW_PASS_GATE_01");
};

func void Rtn_FollowMe_41200()
{
	TA_Follow_Player(8,0,23,0,"NW_PASS_GATE_01");
	TA_Follow_Player(23,0,8,0,"NW_PASS_GATE_01");
};

func void Rtn_InTower_41200()
{
	TA_Sit_Campfire(8,0,12,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
	TA_Saw(12,0,15,0,"NW_CASTLEMINE_PATH_HUT_02");
	TA_MakeArrows(15,0,19,0,"NW_CASTLEMINE_HUT_08");
	TA_Sit_Bench(19,0,21,0,"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
	TA_Sit_Campfire(21,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
};

func void Rtn_Tot_41200()
{
	TA_Stand_WP(8,0,23,0,"TOT");
	TA_Stand_WP(23,0,8,0,"TOT");
};