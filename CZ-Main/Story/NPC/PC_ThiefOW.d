
instance PC_ThiefOW(Npc_Default)
{
	name[0] = "Diego";
	guild = GIL_NONE;
	id = 1;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_FollowDist] = 300;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	level = 1;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_diego_degen);
	EquipItem(self,itrw_diego_bow);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_03,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1;
};


func void Rtn_Start_1()
{
	TA_Sit_Bench(8,0,23,0,"LOCATION_02_05");
	TA_Sit_Bench(23,0,8,0,"LOCATION_02_05");
};

func void Rtn_Follow_1()
{
	TA_Follow_Player(8,0,23,0,"LOCATION_02_05");
	TA_Follow_Player(23,0,8,0,"LOCATION_02_05");
};

func void Rtn_Tot_1()
{
	TA_Sit_Bench(8,0,23,0,"TOT");
	TA_Sit_Bench(23,0,8,0,"TOT");
};

func void Rtn_Xardas_1()
{
	TA_Stand_Eating(8,0,23,0,"OW_PATH_129");
	TA_Stand_Eating(23,0,8,0,"OW_PATH_129");
};

func void Rtn_Fajeth_1()
{
	TA_Stand_Eating(8,0,23,0,"OW_ORC_LOOKOUT_2_03");
	TA_Stand_Eating(23,0,8,0,"OW_ORC_LOOKOUT_2_03");
};

func void Rtn_Silvestro_1()
{
	TA_Stand_Eating(8,0,23,0,"SPAWN_OW_SCAVENGER_01_DEMONT5");
	TA_Stand_Eating(23,0,8,0,"SPAWN_OW_SCAVENGER_01_DEMONT5");
};

func void Rtn_Grimes_1()
{
	TA_Smoke_Joint(8,0,23,0,"OW_PATH_155");
	TA_Smoke_Joint(23,0,8,0,"OW_PATH_155");
};

func void Rtn_Pass_1()
{
	TA_Sit_Campfire(8,0,23,0,"START");
	TA_Sit_Campfire(23,0,8,0,"START");
};

instance PC_Follower(Npc_Default)
{
	name[0] = "Společník";
	guild = GIL_NONE;
	id = 11112;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_FollowDist] = 300;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	level = 1;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_diego_degen);
	EquipItem(self,itrw_diego_bow);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_03,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_11112;
};

func void Rtn_Start_11112()
{
	TA_Follow_Player(8,0,23,0,"LOCATION_02_05");
	TA_Follow_Player(23,0,8,0,"LOCATION_02_05");
};