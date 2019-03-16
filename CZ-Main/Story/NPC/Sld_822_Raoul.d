
instance Sld_822_Raoul(Npc_Default)
{
	name[0] = "Raoul";
	guild = GIL_SLD;
	id = 822;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	CreateInvItems(self,ItRw_Arrow,5);
	CreateInvItems(self,ItRw_Sld_Bow,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ian,BodyTex_L,ITAR_SLD_L_V1);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_822;
};

func void Rtn_PreStart_822()
{
	TA_Stand_Guarding(8,0,18,0,"NW_BIGFARM_PATH_01");
	TA_Stand_Drinking(18,0,21,0,"NW_BIGFARM_CAMPON_PSI_GURU_05");
	TA_Stand_Guarding(21,0,8,0,"NW_BIGFARM_PATH_01");
};

func void Rtn_Start_822()
{
	TA_Stand_Guarding(8,0,18,0,"NW_BIGFARM_PATH_01");
	TA_Stand_Drinking(18,0,21,0,"NW_BIGFARM_PATH_01");
	TA_Stand_Guarding(21,0,8,0,"NW_BIGFARM_PATH_01");
};

func void rtn_inbattle_822()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8652");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8652");
};

