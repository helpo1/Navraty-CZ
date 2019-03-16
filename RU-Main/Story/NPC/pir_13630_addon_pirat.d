
instance PIR_13630_ADDON_PIRAT(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PAL;
	id = 13630;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_FollowDist] = 600;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR2hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_13630;
};


func void rtn_start_13630()
{
	TA_Stand_Drinking(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_08");
	TA_Stand_Drinking(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_08");
};

func void rtn_inbattle_13630()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8708");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8708");
};

func void rtn_ship_13630()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_26");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_26");
};

