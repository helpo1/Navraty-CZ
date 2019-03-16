
instance STRF_8141_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave_Orc;
	guild = GIL_STRF;
	id = 8141;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart01,BodyTex_P,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,0);
	EquipItem(self,ItMw_StoneHammer);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_8141;
};


func void Rtn_Start_8141()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8141");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8141");
};

func void Rtn_Tot_8141()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};
