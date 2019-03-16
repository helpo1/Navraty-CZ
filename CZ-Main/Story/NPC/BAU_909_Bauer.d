
instance BAU_909_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 909;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal01,BodyTex_B,ITAR_Bau_L_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_909;
};


func void Rtn_Start_909()
{
	TA_Stand_Guarding(8,0,20,0,"NW_BIGFARM_STABLE_OUT_01");
	TA_Stand_Drinking(20,0,8,0,"NW_BIGFARM_CAMPON_PIR_12");
};