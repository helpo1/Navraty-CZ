
instance BDT_1020_Bandit_L(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 1020;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Mud,BodyTex_N,itar_bdt_f);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	TA_Guard_Passage(0,0,12,0,"NW_TROLLAREA_PATH_47");
	TA_Guard_Passage(12,0,0,0,"NW_TROLLAREA_PATH_47");
};

