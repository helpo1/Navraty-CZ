
instance PAL_2680_UDAR(Npc_Default)
{
	name[0] = "Удар";
	guild = GIL_PAL;
	id = 2680;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_Crossbow_H_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal_Stone,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_2680;
};


func void rtn_prestart_2680()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_04");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_04");
};

func void rtn_start_2680()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT_UDAR");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT_UDAR");
};

func void rtn_tot_2680()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_orcstrap_2680()
{
	TA_Stand_Guarding(8,0,23,0,"NW_UDAR_ZASADA");
	TA_Stand_Guarding(23,0,8,0,"NW_UDAR_ZASADA");
};

func void rtn_campon_2680()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_59");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_59");
};

func void rtn_inbattle_2680()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8729");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8729");
};

