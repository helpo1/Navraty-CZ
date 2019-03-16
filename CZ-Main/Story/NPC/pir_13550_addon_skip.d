
instance PIR_13550_ADDON_SKIP(Npc_Default)
{
	name[0] = "Skip";
	guild = GIL_PAL;
	id = 13550;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_FollowDist] = 300;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	CreateInvItems(self,ItPo_Health_03,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Pirat01,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_13550;
};


func void rtn_start_13550()
{
	TA_Stand_Drinking(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_18");
	TA_Stand_Drinking(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_18");
};

func void rtn_inbattle_13550()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8742");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8742");
};

func void rtn_ship_13550()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_13");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_13");
};

