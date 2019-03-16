
instance PAL_9161_GUARDWATCH(Npc_Default)
{
	name[0] = "Glantz";
	guild = GIL_PAL;
	id = 9161;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Grim,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9161;
};


func void rtn_start_9161()
{
	TA_Stand_ArmsCrossed(7,0,20,0,"LGR_RATSHAUS_17");
	TA_Stand_Guarding(20,0,7,0,"LGR_RATSHAUS_17");
};

func void rtn_tot_9161()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

