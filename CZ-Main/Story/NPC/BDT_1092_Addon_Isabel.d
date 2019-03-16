instance SLD_10920_Loa(Npc_Default)
{
	name[0] = "Loa";
	guild = GIL_SLD;
	id = 10920;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,7);
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ChiefRapier_Loa);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS");
	Mdl_SetVisualBody(self,"SRNGLM_LOA_BODY",-1,-1,"SRNGLM_LOA_HEAD",-1,0,-1);
	Mdl_ApplyOverlayMds(self,"SRN_GLM_LOA.MDS");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PreStart_10920;
};

func void Rtn_PreStart_10920()
{
	TA_Stand_Eating(8,0,9,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Sit_Bench(9,0,12,0,"NW_BIGFARM_RUDAR_2");
	TA_Practice_Sword(12,0,15,0,"NW_BIGFARM_CAMPON_PSI_GURU_04");
	TA_Stand_ArmsCrossed(15,0,18,30,"NW_BIGFARM_CAMPON_PIR_19");
	TA_Dance_Kira(18,30,21,0,"NW_BIGFARM_CAMPON_PSI_GURU_04");
	TA_Stand_Eating(21,0,22,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_15_LEA");
};


func void Rtn_Start_10920()
{
	TA_Stand_Eating(8,0,9,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Sit_Bench(9,0,12,0,"NW_BIGFARM_RUDAR_2");
	TA_Practice_Sword(12,0,15,0,"NW_BIGFARM_CAMPON_PSI_GURU_04");
	TA_Stand_ArmsCrossed(15,0,18,30,"NW_BIGFARM_CAMPON_PIR_19");
	TA_Sit_Bench(18,30,21,0,"NW_BIGFARM_RUDAR_2");
	TA_Play_Lute(21,0,22,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_15_LEA");
};

func void Rtn_Mayak_10920()
{
	TA_Stand_Eating(8,0,9,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Sit_Bench(9,0,12,0,"NW_BIGFARM_RUDAR_2");
	TA_Practice_Sword(12,0,15,0,"NW_BIGFARM_CAMPON_PSI_GURU_04");
	TA_Stand_ArmsCrossed(15,0,18,30,"NW_BIGFARM_CAMPON_PIR_19");
	TA_Sit_Bench(18,30,21,0,"NW_BIGFARM_RUDAR_2");
	TA_Play_Lute(21,0,22,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Sleep(22,0,0,0,"NW_BIGFARM_HOUSE_15_LEA");
	TA_Stand_ArmsCrossed(0,0,4,0,"NW_LIGHTHOUSE_IN_18");
	TA_Sleep(4,0,8,0,"NW_BIGFARM_HOUSE_15_LEA");
};

func void Rtn_PreLoveScene_10920()
{
	TA_Stand_WP(8,0,18,0,"NW_LIGHTHOUSE_IN_14");
	TA_Stand_WP(18,0,8,0,"NW_LIGHTHOUSE_IN_14");
};

func void Rtn_LoveScene_10920()
{
	TA_Stand_ArmsCrossed(8,0,18,0,"NW_LIGHTHOUSE_OUT_LOA_01");
	TA_Stand_ArmsCrossed(18,0,8,0,"NW_LIGHTHOUSE_OUT_LOA_01");
};

func void Rtn_Guide_10920()
{
	TA_Guide_Player(8,0,20,0,"NW_DARKFOREST_IN_01_56");
	TA_Guide_Player(20,0,8,0,"NW_DARKFOREST_IN_01_56");
};

func void Rtn_Follow_10920()
{
	TA_Follow_Player(8,0,20,0,"NW_BIGFARM_TORLOF");
	TA_Follow_Player(20,0,8,0,"NW_BIGFARM_TORLOF");
};

func void Rtn_FunParty_10920()
{
	TA_Sit_Campfire(8,0,23,0,"NW_DARKFOREST_IN_LOA_PARTY");
	TA_Sit_Campfire(23,0,8,0,"NW_DARKFOREST_IN_LOA_PARTY");
};

func void Rtn_TOT_10920()
{
	TA_Stand_WP(8,0,18,0,"TOT");
	TA_Stand_WP(18,0,8,0,"TOT");
};

instance SLD_10921_Loa_ADW(Npc_Default)
{
	name[0] = "Loa";
	guild = GIL_PIR;
	id = 10921;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,7);
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ChiefRapier_Loa);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS");
	Mdl_SetVisualBody(self,"SRNGLM_LOA_BODY",-1,-1,"SRNGLM_LOA_HEAD",-1,0,-1);
	Mdl_ApplyOverlayMds(self,"SRN_GLM_LOA.MDS");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_10921;
};

func void Rtn_Start_10921()
{
	TA_Stand_ArmsCrossed(10,0,18,0,"ADW_LOA_SHIP");
	TA_Stand_ArmsCrossed(18,0,10,0,"ADW_LOA_SHIP");
};

func void Rtn_TOT_10921()
{
	TA_Stand_WP(8,0,18,0,"TOT");
	TA_Stand_WP(18,0,8,0,"TOT");
};