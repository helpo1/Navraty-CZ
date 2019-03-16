
instance BDT_9004_BANDIT(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_VLK;
	id = 9004;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Mud,BodyTex_N,itar_bdt_f);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_9004;
};


func void rtn_start_9004()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_BENCHELBANDITS_06");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_BENCHELBANDITS_06");
};

