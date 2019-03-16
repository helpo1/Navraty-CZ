
instance BDT_7530_BANDIT_H(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 7530;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender2);
	EquipItem(self,ItRw_Bow_M_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItAt_SheepFur,3);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = rtn_start_7530;
};


func void rtn_start_7530()
{
	TA_Sit_Campfire(8,0,22,0,"NW_CITY_SMFOREST_BANDIT_04");
	TA_Sit_Campfire(22,0,8,0,"NW_CITY_SMFOREST_BANDIT_04");
};

