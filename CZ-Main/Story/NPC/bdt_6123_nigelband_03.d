
instance BDT_6123_NIGELBAND_03(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6123;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert2);
	B_CreateAmbientInv(self);
	CreateInvItems(self,itse_nigelpocket,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Normal01,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,85);
	daily_routine = rtn_start_6123;
};


func void rtn_start_6123()
{
	TA_Stand_Drinking(0,0,12,0,"NW_BDT_NIGEL_03");
	TA_Stand_Drinking(12,0,0,0,"NW_BDT_NIGEL_03");
};

