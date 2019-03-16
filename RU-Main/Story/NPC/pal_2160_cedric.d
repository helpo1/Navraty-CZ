
instance PAL_2160_CEDRIC(Npc_Default)
{
	name[0] = "Седрик";
	guild = GIL_PAL;
	id = 2160;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItAr_Shield_07_Cedrik);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = rtn_start_2160;
};


func void rtn_start_2160()
{
	TA_Smalltalk(7,0,19,0,"FP_CEDRIC");
	TA_Smalltalk(19,0,7,0,"FP_CEDRIC");
};

func void rtn_tot_2160()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

