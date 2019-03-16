
instance TPL_8015_TEMPLER(Npc_Default)
{
	name[0] = NAME_TPL;
	guild = GIL_TPL;
	id = 8015;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_TEMPLER_2,BodyTex_N,itar_tpl_l);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8015;
};


func void rtn_start_8015()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_PSICAMP_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_PSICAMP_02");
};

func void rtn_campon_8015()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_05");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_05");
};

func void rtn_inbattle_8015()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8642");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8642");
};

