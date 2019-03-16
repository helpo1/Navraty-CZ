
instance PIR_13520_ADDON_ALLIGATORJACK(Npc_Default)
{
	name[0] = "Аллигатор Джек";
	guild = GIL_PAL;
	id = 13520;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_FollowDist] = 800;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	CreateInvItems(self,ItPo_Health_02,4);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_CorAngar,BodyTex_B,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_13520;
};


func void rtn_start_13520()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_15");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_15");
};

func void rtn_inbattle_13520()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8745");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8745");
};

func void rtn_ship_13520()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_26");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_26");
};

