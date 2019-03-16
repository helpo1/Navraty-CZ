
instance STRF_8123_Addon_Elk(Npc_Default)
{
	name[0] = "Elk";
	guild = GIL_STRF;
	id = 8123;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart04,BodyTex_N,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_8123;
};

func void Rtn_Start_8123()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8123");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8123");
};

func void Rtn_Tot_8123()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};