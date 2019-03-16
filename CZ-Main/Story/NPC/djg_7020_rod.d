
instance DJG_7020_ROD(Npc_Default)
{
	name[0] = "Rod";
	guild = GIL_DJG;
	id = 7020;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ToughBart01,BodyTex_N,itar_djg_m_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_7020;
};


func void rtn_start_7020()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_BIGFARM_PATH_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_BIGFARM_PATH_02");
};

func void rtn_inbattle_7020()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8763");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8763");
};

