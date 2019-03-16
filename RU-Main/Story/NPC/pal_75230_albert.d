
instance PAL_75230_ALBERT(Npc_Default)
{
	name[0] = "Альберт";
	guild = GIL_PAL;
	id = 75230;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_75230;
};


func void rtn_prestart_75230()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_02");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_02");
};

func void rtn_start_75230()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_75230()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_campon_75230()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_57");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_57");
};

func void rtn_inbattle_75230()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8726");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8726");
};

