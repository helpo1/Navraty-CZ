
instance PAL_202_Albrecht(Npc_Default)
{
	name[0] = "Альбрехт";
	guild = GIL_PAL;
	id = 202;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_202;
};


func void Rtn_Start_202()
{
	TA_Read_WriteBookstand(8,0,23,0,"NW_CITY_ALBRECHT");
	TA_Read_WriteBookstand(23,0,8,0,"NW_CITY_ALBRECHT");
};

func void rtn_tot_202()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_campon_202()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_65");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_65");
};

func void rtn_inbattle_202()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8736");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8736");
};

