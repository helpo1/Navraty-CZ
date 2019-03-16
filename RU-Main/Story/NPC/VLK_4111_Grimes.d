
instance VLK_4111_Grimes(Npc_Default)
{
	name[0] = "Граймс";
	guild = GIL_OUT;
	id = 4111;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_MM_RestStart] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_StoneHammer);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_ImportantGrey,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_4111;
};

func void Rtn_Start_4111()
{
	TA_Pick_Ore(2,30,23,0,"OW_MINE2_GRIMES");
	TA_Sit_Campfire(23,0,2,30,"OW_PAL_WESTMINE_SIT");
};

func void rtn_followme_4111()
{
	TA_Follow_Player(5,0,20,0,"OW_MINE2_GRIMES");
	TA_Follow_Player(20,0,5,0,"OW_MINE2_GRIMES");
};

func void rtn_nearpassow_4111()
{
	TA_Stand_WP(5,0,20,0,"OW_PATH_1_17");
	TA_Stand_WP(20,0,5,0,"OW_PATH_1_17");
};

func void rtn_tot_4111()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

instance VLK_41110_GRIMESNW(Npc_Default)
{
	name[0] = "Граймс";
	guild = GIL_NONE;
	id = 41110;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_ImportantGrey,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_41110;
};

func void rtn_start_41110()
{
	TA_Stand_WP(2,30,23,0,"NW_ENTERVALLEY_09");
	TA_Stand_WP(23,0,2,30,"NW_ENTERVALLEY_09");
};

func void rtn_followme_41110()
{
	TA_Follow_Player(5,0,20,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
	TA_Follow_Player(20,0,5,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
};

func void rtn_intower_41110()
{
	TA_Pick_Ore(10,0,14,0,"NW_CASTLEMINE_13");
	TA_Stand_Eating(14,0,16,0,"NW_CASTLEMINE_HUT_03");
	TA_Pick_Ore(16,0,18,0,"NW_CASTLEMINE_13");
	TA_Sit_Bench(18,0,21,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
	TA_Stand_Eating(21,0,23,0,"NW_CASTLEMINE_HUT_03");
	TA_Sit_Campfire(23,0,10,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
};

instance VLK_41111_HUNTYNW(Npc_Default)
{
	name[0] = "Ханти";
	guild = GIL_NONE;
	id = 41111;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal17,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_41111;
};

func void rtn_start_41111()
{
	TA_Stand_WP(23,0,5,30,"NW_ENTERVALLEY_09");
	TA_Stand_WP(5,30,23,0,"NW_ENTERVALLEY_09");
};

func void rtn_followme_41111()
{
	TA_Follow_Player(5,0,20,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
	TA_Follow_Player(20,0,5,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
};

func void rtn_intower_41111()
{
	TA_Pick_Ore(8,0,12,0,"NW_CASTLEMINE_04_IRON");
	TA_Stand_Eating(12,0,14,0,"NW_CASTLEMINE_HUT_03");
	TA_Sit_Campfire(14,0,16,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
	TA_Pick_Ore(16,0,20,0,"NW_CASTLEMINE_04_IRON");
	TA_Sit_Campfire(20,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
};