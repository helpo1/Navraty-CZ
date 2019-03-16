
instance STRF_8124_Addon_Morigan(Npc_Default)
{
	name[0] = "Morigan";
	guild = GIL_STRF;
	id = 8124;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_NoFightParker] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak12,BodyTex_N,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,5);
	daily_routine = Rtn_Start_8124;
};

func void Rtn_Start_8124()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8124");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8124");
};

func void Rtn_Tot_8124()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};