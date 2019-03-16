
instance HUN_742_ALFRED(Npc_Default)
{
	name[0] = "Alfred";
	guild = GIL_NONE;
	id = 742;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal02,BodyTex_N,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_742;
};


func void rtn_start_742()
{
	TA_Stand_Eating(10,0,20,30,"NW_HUNTERCAMP_06");
	TA_Sleep(20,30,10,0,"NW_HUNTERCAMP_SLEEP_04");
};

func void rtn_campon_742()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_03");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_03");
};

func void rtn_inbattle_742()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_09");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_09");
};

