
instance PAL_91510_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91510;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Okyl,BodyTex_N,itar_pal_h_v1_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_91510;
};


func void rtn_start_91510()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_50");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_50");
};

func void rtn_inbattle_91510()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8717");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8717");
};

