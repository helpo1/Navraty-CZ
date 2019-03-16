
instance PAL_91170_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91170;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Grim,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_91170;
};


func void rtn_start_91170()
{
	TA_Sit_Campfire(9,0,23,0,"NW_BIGFARM_CAMPON_17");
	TA_Sit_Campfire(23,0,9,0,"NW_BIGFARM_CAMPON_17");
};

func void rtn_inbattle_91170()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8619");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8619");
};

