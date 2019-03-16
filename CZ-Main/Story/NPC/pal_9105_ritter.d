
instance PAL_9105_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9105;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart05,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9105;
};


func void rtn_start_9105()
{
	TA_Stand_ArmsCrossed(8,0,14,0,"LGR_TURM_01_14");
	TA_Stand_Guarding(14,0,18,0,"LGR_TURM_01_15");
	TA_Stand_ArmsCrossed(18,0,23,0,"LGR_TURM_01_12");
	TA_Stand_Guarding(23,0,8,0,"LGR_TURM_01_13");
};

func void rtn_tot_9105()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

