
instance SLD_819_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 819;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Tough_Drago,BodyTex_P,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_819;
};

func void Rtn_PreStart_819()
{
	TA_Stand_Drinking(7,45,18,0,"NW_BIGFARM_KITCHEN_03");
	TA_Stand_Eating(18,0,21,0,"NW_BIGFARM_CAMPON_PSI_ANGAR");
	TA_Sleep(21,0,7,45,"NW_BIGFARM_HOUSE_15_SLEEP");
};

func void Rtn_Start_819()
{
	TA_Stand_Drinking(7,45,18,0,"NW_BIGFARM_KITCHEN_03");
	TA_Stand_Eating(18,0,21,0,"NW_BIGFARM_KITCHEN_03");
	TA_Sleep(21,0,7,45,"NW_BIGFARM_HOUSE_15_SLEEP");
};

func void rtn_inbattle_819()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8655");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8655");
};

