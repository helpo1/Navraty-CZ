
instance PAL_91500_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91500;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal08,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_91500;
};


func void rtn_start_91500()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_51");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_51");
};

func void rtn_inbattle_91500()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8718");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8718");
};

