
instance PIR_13660_ADDON_BRANDON(Npc_Default)
{
	name[0] = "Brandon";
	guild = GIL_PAL;
	id = 13660;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_FollowDist] = 400;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hAxe);
	CreateInvItems(self,ItPo_Health_03,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Tough_Okyl,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_13660;
};


func void rtn_start_13660()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_05");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_05");
};

func void rtn_inbattle_13660()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8705");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8705");
};

func void rtn_ship_13660()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_27");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_27");
};

