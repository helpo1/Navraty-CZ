
instance PAL_91300_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91300;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_91300;
};


func void rtn_start_91300()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_30");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_30");
};

func void rtn_inbattle_91300()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8628");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8628");
};

