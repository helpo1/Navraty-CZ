
instance PAL_91680_NATAN(Npc_Default)
{
	name[0] = "Nathan";
	guild = GIL_PAL;
	id = 91680;
	voice = 9;
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
	daily_routine = rtn_prestart_91680;
};


func void rtn_prestart_91680()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_07");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_07");
};

func void rtn_start_91680()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT_NATAN");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT_NATAN");
};

func void rtn_tot_91680()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_follow_91680()
{
	TA_Follow_Player(8,0,23,0,"NW_UDAR_ZASADA");
	TA_Follow_Player(23,0,8,0,"NW_UDAR_ZASADA");
};

func void rtn_campon_91680()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_45");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_45");
};

func void rtn_inbattle_91680()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8711");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8711");
};

