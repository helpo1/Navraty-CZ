
instance HUN_744_BAREM(Npc_Default)
{
	name[0] = "Barem";
	guild = GIL_NONE;
	id = 744;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Sharky,BodyTex_B,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_744;
};


func void rtn_start_744()
{
	TA_Stand_Guarding(9,0,21,0,"WP_NW_HUNTERCAMP_08");
	TA_Stand_Eating(21,0,9,0,"NW_HUNTERCAMP_06");
};

func void rtn_campon_744()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_01");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_01");
};

func void rtn_inbattle_744()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_11");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_11");
};

