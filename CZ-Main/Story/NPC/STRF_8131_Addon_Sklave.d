
instance STRF_8131_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave_Orc;
	guild = GIL_STRF;
	id = 8131;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Weak_Asghan,BodyTex_N,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,-1);
	EquipItem(self,ItMw_StoneHammer);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_8131;
};

func void Rtn_Start_8131()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8131");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8131");
};

func void Rtn_Tot_8131()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};