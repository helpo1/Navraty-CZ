
instance PAL_9142_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9142;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart09,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9142;
};


func void rtn_start_9142()
{
	TA_Smalltalk(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_06");
	TA_Smalltalk(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_06");
};

func void rtn_hunt_9142()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"LGR_HUNTPALADIN_04");
	TA_Smalltalk(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_06");
};

func void rtn_tot_9142()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

