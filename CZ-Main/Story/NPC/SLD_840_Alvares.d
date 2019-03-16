
instance SLD_840_Alvares(Npc_Default)
{
	name[0] = "Alvares";
	guild = GIL_BDT;
	id = 840;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_EnemyOverride] = TRUE;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Tough_Silas,BodyTex_B,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_PreStart_840;
};


func void Rtn_PreStart_840()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM2_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM2_PATH_02");
};

func void Rtn_Start_840()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM2_TO_TAVERN_08");
	TA_Smalltalk(22,0,8,0,"NW_FARM2_TO_TAVERN_08");
};

func void Rtn_Bigfarm_840()
{
	TA_Smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_05");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

func void rtn_tot_840()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

instance SLD_850_Kharim(Npc_Default)
{
	name[0] = "Kharim";
	guild = GIL_SLD;
	id = 850;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ITMW_1H_MACE_107);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Kharim,BodyTex_B,ItAr_Sld_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PreStart_850;
};

func void Rtn_PreStart_850()
{
	TA_Stand_ArmsCrossed(8,0,18,0,"NW_BIGFARM_CAMPON_PSI_00");
	TA_Stand_Drinking(18,0,22,0,"NW_BIGFARM_CAMPON_AD_1");
	TA_Sit_Bench(22,0,8,0,"NW_BIGFARM_CAMPON_PIR_AD_01_09");
};


instance SLD_851_Roscoe(Npc_Default)
{
	name[0] = "Roscoe";
	guild = GIL_SLD;
	id = 851;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Nagelkeule);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_Ratford,BodyTex_L,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PreStart_851;
};

func void Rtn_PreStart_851()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_DEMENTOR");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_TAVERNE_05");
};