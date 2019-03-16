
instance PAL_2170_MARCOS(Npc_Default)
{
	name[0] = "Маркос";
	guild = GIL_PAL;
	id = 2170;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ItPo_Health_03,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_prestart_2170;
};


func void rtn_prestart_2170()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_08");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_08");
};

func void rtn_start_2170()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_2170()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_campon_2170()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_63");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_63");
};

func void rtn_inbattle_2170()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8733");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8733");
};

