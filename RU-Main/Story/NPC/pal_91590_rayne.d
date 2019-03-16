
instance PAL_91590_RAYNE(Npc_Default)
{
	name[0] = "Рейн";
	guild = GIL_PAL;
	id = 91590;
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
	daily_routine = rtn_start_91590;
};


func void rtn_start_91590()
{
	TA_Smalltalk(9,0,20,0,"NW_BIGFARM_CAMPON_47");
	TA_Smalltalk(20,0,9,0,"NW_BIGFARM_CAMPON_47");
};

func void rtn_inbattle_91590()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8713");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8713");
};

