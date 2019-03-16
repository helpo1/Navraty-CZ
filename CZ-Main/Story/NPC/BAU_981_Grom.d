
instance BAU_981_Grom(Npc_Default)
{
	name[0] = "Grom";
	guild = GIL_NONE;
	id = 981;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Gilbert,BodyTex_P,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_981;
};


func void Rtn_Start_981()
{
	TA_Sit_Campfire(8,0,23,0,"NW_CASTLEMINE_TROLL_04_C");
	TA_Sit_Campfire(23,0,8,0,"NW_CASTLEMINE_TROLL_04_C");
};

func void rtn_gotohunters_981()
{
	TA_Stand_Eating(8,0,20,0,"WP_NW_HUNTERCAMP_99");
	TA_Play_Lute(20,0,23,0,"WP_NW_HUNTERCAMP_04_1");
	TA_Sleep(23,0,8,0,"NW_HUNTERCAMP_SLEEP_03");
};

func void rtn_campon_981()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_08");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_08");
};

func void rtn_inbattle_981()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8677");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8677");
};

