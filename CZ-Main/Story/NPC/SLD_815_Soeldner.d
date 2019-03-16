
instance SLD_815_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 815;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal05,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_815;
};


func void Rtn_Start_815()
{
	TA_Sit_Campfire(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_01");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_ALLEE_01");
};

func void Rtn_BengarsFarm_815()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

func void rtn_inbattle_815()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8735");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8735");
};


instance SLD_842_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 842;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal05,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_prestart_842;
};


func void rtn_prestart_842()
{
	TA_Stand_Guarding(8,0,18,0,"NW_BIGFARM_GODAR");
	TA_Smoke_Joint(18,0,22,0,"NW_BIGFARM_CAMPON_PSI_00");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_GODAR");
};

func void rtn_start_842()
{
	TA_Stand_Guarding(8,0,18,0,"NW_BIGFARM_GODAR");
	TA_Stand_Guarding(18,0,22,0,"NW_BIGFARM_GODAR");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_GODAR");
};

instance SLD_843_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 843;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Thorus,BodyTex_B,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_prestart_843;
};


func void rtn_prestart_843()
{
	TA_Stand_Guarding(8,0,18,0,"NW_BIGFARM_PATH_05");
	TA_Stand_ArmsCrossed(18,0,22,0,"NW_BIGFARM_CAMPON_PSI_04");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_PATH_05");
};

func void rtn_start_843()
{
	TA_Stand_Guarding(8,0,18,0,"NW_BIGFARM_PATH_05");
	TA_Stand_Guarding(18,0,22,0,"NW_BIGFARM_PATH_05");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_PATH_05");
};


instance SLD_844_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 844;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal05,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_prestart_844;
};


func void rtn_prestart_844()
{
	TA_Stand_Drinking(8,0,18,0,"NW_BIGFARM_CAMPON_HUN_03");
	TA_Stand_Guarding(18,0,22,0,"NW_BIGFARM_CAMPON_PSI_09");
	TA_Smoke_Joint(22,0,8,0,"NW_BIGFARM_CAMPON_HUN_03");
};

func void rtn_start_844()
{
	TA_Stand_Drinking(8,0,18,0,"NW_BIGFARM_CAMPON_HUN_03");
	TA_Stand_Guarding(18,0,22,0,"NW_BIGFARM_CAMPON_HUN_03");
	TA_Smoke_Joint(22,0,8,0,"NW_BIGFARM_CAMPON_HUN_03");
};

instance SLD_845_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 845;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Torlof,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_845;
};


func void rtn_start_845()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_CAMPON_HUN_04");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_CAMPON_HUN_04");
};


instance SLD_846_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 846;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Torlof,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_846;
};


func void rtn_start_846()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_IN_01");
	TA_Stand_Drinking(22,0,8,0,"NW_TAVERNE_IN_01");
};


instance SLD_847_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 847;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal05,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_847;
};


func void rtn_start_847()
{
	TA_Stand_Guarding(8,0,18,0,"NW_SAGITTA_CAVE_08");
	TA_Stand_Drinking(18,0,22,0,"NW_SAGITTA_CAVE_08");
	TA_Stand_Guarding(22,0,8,0,"NW_SAGITTA_CAVE_08");
};

instance SLD_848_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 848;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Thorus,BodyTex_B,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_848;
};

func void rtn_start_848()
{
	TA_Stand_Guarding(8,0,18,0,"NW_SAGITTA_CAVE_05_99");
	TA_Stand_Guarding(18,0,22,0,"NW_SAGITTA_CAVE_05_99");
	TA_Stand_Drinking(22,0,8,0,"NW_SAGITTA_CAVE_05_99");
};
