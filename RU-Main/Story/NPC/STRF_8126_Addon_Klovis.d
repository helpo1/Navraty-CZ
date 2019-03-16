
instance STRF_8126_Addon_Klovis(Npc_Default)
{
	name[0] = "Кловис";
	guild = GIL_STRF;
	id = 8126;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_NoFightParker] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Gilbert,BodyTex_N,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_8126;
};

func void Rtn_Start_8126()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8126");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8126");
};

func void Rtn_Tot_8126()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};