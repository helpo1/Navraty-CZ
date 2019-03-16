
instance PAL_9159_RAYNE(Npc_Default)
{
	name[0] = "Rayne";
	guild = GIL_PAL;
	id = 9159;
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
	daily_routine = rtn_start_9159;
};


func void rtn_start_9159()
{
	TA_Study_WP(9,0,20,0,"LGR_ZUFLUCH_01_99");
	TA_Sit_Bench(20,0,9,0,"LGR_TURM_01_01_99");
};

func void rtn_tot_9159()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

