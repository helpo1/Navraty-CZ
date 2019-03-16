
instance PIR_13890_ADDON_TOM(Npc_Default)
{
	name[0] = "Том";
	guild = GIL_PAL;
	id = 13890;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FIGHTER",Face_N_Normal19,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_13890;
};


func void rtn_start_13890()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_02");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_02");
};

func void rtn_inbattle_13890()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8702");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8702");
};

func void rtn_ship_13890()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_IN_28");
	TA_Stand_Guarding(23,0,8,0,"SHIP_IN_28");
};

