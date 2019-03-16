
instance HUN_745_RAFFA(Npc_Default)
{
	name[0] = "Raffa";
	guild = GIL_NONE;
	id = 745;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Bow_M_04);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_CoolPock,BodyTex_N,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_745;
};

func void rtn_start_745()
{
	TA_Sit_Bench(8,0,19,0,"NW_HUNTERCAMP_04");
	TA_Roast_Scavenger(19,0,23,0,"NW_HUNTERCAMP_05");
	TA_Sleep(23,0,8,0,"NW_HUNTERCAMP_SLEEP_02");
};

func void rtn_campon_745()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_00");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_00");
};

func void rtn_inbattle_745()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_06");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_06");
};

