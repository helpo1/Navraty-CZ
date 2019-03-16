
instance PAL_9168_NATAN(Npc_Default)
{
	name[0] = "Nathan";
	guild = GIL_PAL;
	id = 9168;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_9168;
};


func void rtn_start_9168()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_PALADIN_OUT_12");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_PALADIN_OUT_12");
};

func void rtn_follow_9168()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_9168()
{
	TA_Stand_Guarding(8,0,23,0,"OC_SMITH_01");
	TA_Stand_Guarding(23,0,8,0,"OC_SMITH_01");
};

func void rtn_palexit_9168()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17");
};

func void rtn_tot_9168()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

