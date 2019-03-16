
instance PIR_13640_ADDON_PIRAT(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PAL;
	id = 13640;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_FollowDist] = 700;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dusty,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_13640;
};


func void rtn_start_13640()
{
	TA_Stand_Drinking(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_07");
	TA_Stand_Drinking(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_07");
};

func void rtn_inbattle_13640()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8707");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8707");
};

func void rtn_ship_13640()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_38");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_38");
};

