
instance PIR_13530_ADDON_MORGAN(Npc_Default)
{
	name[0] = "Morgan";
	guild = GIL_PAL;
	id = 13530;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Doppelaxt);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough_Santino,BodyTex_L,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_13530;
};


func void rtn_start_13530()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_14");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_14");
};

func void rtn_inbattle_13530()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8746");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8746");
};

func void rtn_ship_13530()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_37");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_37");
};

