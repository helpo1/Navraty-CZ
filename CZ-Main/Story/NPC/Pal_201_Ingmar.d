
instance Pal_201_Ingmar(Npc_Default)
{
	name[0] = "Ingmar";
	guild = GIL_PAL;
	id = 201;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_ToughBart01,BodyTex_N,ITAR_PAL_H_V1_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_201;
};

func void Rtn_Start_201()
{
	TA_Stand_Guarding(7,0,9,0,"PLAZ_MASTER");
	TA_Stand_WP(9,0,12,0,"NW_CITY_CITYHALL_WARROOM_02");
	TA_Study_WP(12,0,15,0,"NW_CITY_CITYHALL_WARROOM_05");
	TA_Smalltalk(15,0,18,0,"NW_CITY_INGMAR");
	TA_Stand_Guarding(18,0,20,0,"PLAZ_MASTER");
	TA_Read_Bookstand(20,0,8,10,"NW_CITY_LEOMAR_READ");
};

func void rtn_tot_201()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_campon_201()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_66");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_66");
};

func void rtn_inbattle_201()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8737");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8737");
};

