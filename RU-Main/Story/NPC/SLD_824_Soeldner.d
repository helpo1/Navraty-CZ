
instance SLD_824_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 824;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_ToughBald01,BodyTex_B,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_824;
};


func void Rtn_Start_824()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"NW_BIGFARM_HOUSE_OUT_02");
	TA_Stand_ArmsCrossed(21,0,8,0,"NW_BIGFARM_HOUSE_OUT_02");
};

func void rtn_inbattle_824()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8649");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8649");
};

