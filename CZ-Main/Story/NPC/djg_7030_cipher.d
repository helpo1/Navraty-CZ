
instance DJG_7030_CIPHER(Npc_Default)
{
	name[0] = "Cipher";
	guild = GIL_DJG;
	id = 7030;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,itar_djg_h_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_7030;
};


func void rtn_start_7030()
{
	TA_Stand_Guarding(8,0,23,0,"NW_BIGFARM_PATH_04_1");
	TA_Stand_Guarding(23,0,8,0,"NW_BIGFARM_PATH_04_1");
};

func void rtn_inbattle_7030()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8762");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8762");
};

