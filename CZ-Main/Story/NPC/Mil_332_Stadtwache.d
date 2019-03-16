
instance Mil_332_Stadtwache(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 332;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Stone,BodyTex_N,ITAR_TOWNGUARD);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_332;
};


func void Rtn_Start_332()
{
	TA_Stand_ArmsCrossed(4,0,21,0,"NW_CITY_ENTRANCE_BACK_GUARD_01_82");
	TA_WacheFackel(21,0,4,0,"NW_CITY_ENTRANCE_BACK_GUARD_01_82");
};

instance Mil_3320_Stadtwache(Npc_Default)
{
	name[0] = "Domobránce";
	guild = GIL_BDT;
	id = 3320;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Stone,BodyTex_N,ITAR_Mil_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_3320;
};

func void Rtn_Start_3320()
{
	TA_Stand_ArmsCrossed(4,0,21,0,"OW_PATH_1_17_1");
	TA_Stand_ArmsCrossed(21,0,4,0,"OW_PATH_1_17_1");
};

instance Mil_3321_Stadtwache(Npc_Default)
{
	name[0] = "Domobránce";
	guild = GIL_BDT;
	id = 3321;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	aivar[AIV_EnemyOverride] = TRUE;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Weak_Markus_Kark,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_3321;
};

func void Rtn_Start_3321()
{
	TA_Stand_ArmsCrossed(4,0,21,0,"OW_PATH_1_17");
	TA_WacheFackel(21,0,4,0,"OW_PATH_1_17");
};

instance Mil_3322_Stadtwache(Npc_Default)
{
	name[0] = "Domobránce";
	guild = GIL_BDT;
	id = 3322;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	aivar[AIV_EnemyOverride] = TRUE;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Graham,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_3322;
};

func void Rtn_Start_3322()
{
	TA_Stand_ArmsCrossed(4,0,21,0,"START");
	TA_Stand_ArmsCrossed(21,0,4,0,"START");
};