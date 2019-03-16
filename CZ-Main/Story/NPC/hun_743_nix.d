
instance HUN_743_NIX(Npc_Default)
{
	name[0] = "Nix";
	guild = GIL_NONE;
	id = 743;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Crossbow_L_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal14,BodyTex_N,ItAr_HuntArmor_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_743;
};


func void rtn_start_743()
{
	TA_Stand_Guarding(21,0,9,0,"NW_HUNTERCAMP_NIX");
	TA_Stand_Guarding(21,0,9,0,"NW_HUNTERCAMP_NIX");
};

func void rtn_recover_743()
{
	TA_Saw(9,0,21,0,"NW_HUNTERCAMP_01");
	TA_Stand_Guarding(21,0,9,0,"WP_NW_HUNTERCAMP_09");
};

func void rtn_campon_743()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_02");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_02");
};

func void rtn_inbattle_743()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_08");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_08");
};

