
instance BAU_983_Dragomir(Npc_Default)
{
	name[0] = "Dragomir";
	guild = GIL_NONE;
	id = 983;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	B_CreateAmbientInv(self);
	CreateInvItems(self,itwr_bloodfly_01,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Lee_Dhnlich,BodyTex_N,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_983;
};


func void Rtn_Start_983()
{
	TA_Sit_Bench(8,0,22,0,"NW_HUNTERCAMP_03");
	TA_Sleep(22,0,8,0,"NW_HUNTERCAMP_SLEEP_05");
};

func void rtn_campon_983()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_06");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_06");
};

func void rtn_inbattle_983()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8676");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8676");
};

