
instance PAL_2520_PARCIVAL(Npc_Default)
{
	name[0] = "Парсиваль";
	guild = GIL_PAL;
	id = 2520;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ITKE_TWOSTORE,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_Tough_Drago,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_prestart_2520;
};


func void rtn_prestart_2520()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_03");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_03");
};

func void rtn_start_2520()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_2520()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_campon_2520()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_60");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_60");
};

func void rtn_inbattle_2520()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8730");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8730");
};

