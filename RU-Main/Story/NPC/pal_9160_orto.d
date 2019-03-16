
instance PAL_9160_ORTO(Npc_Default)
{
	name[0] = "Орто";
	guild = GIL_PAL;
	id = 9160;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Grim,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9160;
};


func void rtn_start_9160()
{
	TA_Stand_ArmsCrossed(7,0,20,0,"LGR_EINGANG_01");
	TA_Sit_Bench(20,0,7,0,"LGR_HAUS_02_01_99");
};

func void rtn_hunt_9160()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"LGR_HUNTPALADIN_05");
	TA_Sit_Bench(21,0,8,0,"LGR_HAUS_02_01_99");
};

func void rtn_tot_9160()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

