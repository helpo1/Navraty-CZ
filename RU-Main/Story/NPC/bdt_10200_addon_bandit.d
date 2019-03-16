
instance BDT_10200_ADDON_BANDIT(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10200;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart12,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_10200;
};


func void rtn_start_10200()
{
	TA_Stand_Eating(9,0,21,0,"ADW_CANYON_PATH_TO_BANDITS_22");
	TA_Stand_Eating(21,0,9,0,"ADW_CANYON_PATH_TO_BANDITS_22");
};

