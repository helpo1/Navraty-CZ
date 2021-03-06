
instance STRF_1142_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1142;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	EquipItem(self,ItMw_StoneHammer);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_1142;
};


func void Rtn_Start_1142()
{
	TA_Stand_WP(8,0,23,0,"BL_UP_PLACE_04_SIDE_02");
	TA_Stand_WP(23,0,8,0,"BL_UP_PLACE_04_SIDE_02");
};

func void Rtn_Tot_1142()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};
