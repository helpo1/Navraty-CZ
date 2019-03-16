
instance PAL_2510_ORIC(Npc_Default)
{
	name[0] = "Oric";
	guild = GIL_PAL;
	id = 2510;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Lee_Dhnlich,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_prestart_2510;
};


func void rtn_prestart_2510()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_02");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_02");
};

func void rtn_start_2510()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_2510()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_campon_2510()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_61");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_61");
};

func void rtn_inbattle_2510()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8731");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8731");
};

