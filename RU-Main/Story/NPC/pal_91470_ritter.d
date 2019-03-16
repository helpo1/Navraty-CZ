
instance PAL_91470_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91470;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart03,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_91470;
};


func void rtn_start_91470()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_54");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_54");
};

func void rtn_inbattle_91470()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8722");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8722");
};

