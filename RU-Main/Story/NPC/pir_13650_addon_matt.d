
instance PIR_13650_ADDON_MATT(Npc_Default)
{
	name[0] = "Мэтт";
	guild = GIL_PAL;
	id = 13650;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_FollowDist] = 500;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal14,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_13650;
};


func void rtn_start_13650()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_06");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_06");
};

func void rtn_inbattle_13650()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8706");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8706");
};

func void rtn_ship_13650()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_IN_30");
	TA_Stand_Guarding(23,0,8,0,"SHIP_IN_30");
};

