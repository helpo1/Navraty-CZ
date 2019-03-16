
instance PIR_61450_BRENDIK(Npc_Default)
{
	name[0] = "Brendik";
	guild = GIL_PAL;
	id = 61450;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	level = 12;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_61450;
};


func void rtn_start_61450()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_00");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_00");
};

func void rtn_inbattle_61450()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8700");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8700");
};

func void rtn_ship_61450()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_22");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_22");
};

