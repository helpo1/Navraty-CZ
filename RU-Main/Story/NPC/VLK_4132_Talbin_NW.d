
instance VLK_4132_Talbin_NW(Npc_Default)
{
	name[0] = "Тальбин";
	guild = GIL_NONE;
	id = 4132;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Bullit,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_PreStart_4132;
};


func void Rtn_PreStart_4132()
{
	TA_Stand_Eating(8,0,23,0,"LEVELCHANGE");
	TA_Stand_Eating(23,0,8,0,"LEVELCHANGE");
};

func void Rtn_Farm_4132()
{
	TA_Stand_Eating(8,0,23,0,"NW_FARM2_OUT_07");
	TA_Stand_Eating(23,0,8,0,"NW_FARM2_OUT_07");
};

func void Rtn_GoHuntCamp_4132()
{
	TA_Stand_Guarding(8,0,20,0,"NW_HUNTERCAMP_05");
	TA_Stand_Guarding(20,0,8,0,"NW_HUNTERCAMP_05");
};

func void Rtn_HuntCamp_4132()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	TA_Stand_Drinking(23,0,8,0,"NW_HUNTERCAMP_05");
};

func void Rtn_InCastle_4132()
{
	TA_Stand_Guarding(8,0,12,0,"TOT");
	TA_Saw(12,0,15,0,"NW_CASTLEMINE_PATH_HUT_02");
	TA_MakeArrows(15,0,19,0,"NW_CASTLEMINE_HUT_08");
	TA_Sit_Bench(19,0,21,0,"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
	TA_Sit_Campfire(21,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
};