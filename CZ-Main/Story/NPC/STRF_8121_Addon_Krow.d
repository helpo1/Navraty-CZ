
instance STRF_8121_Addon_Krow(Npc_Default)
{
	name[0] = "Crow";
	guild = GIL_STRF;
	id = 8121;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	EquipItem(self,ItMw_StoneHammer);
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal01,BodyTex_B,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_8121;
};

func void Rtn_Start_8121()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8121");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8121");
};

func void Rtn_Tot_8121()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};
