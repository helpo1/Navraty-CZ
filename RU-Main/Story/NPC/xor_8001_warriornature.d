
instance XOR_12207_WARRIORNATURE(Npc_Default)
{
	name[0] = "";
	guild = GIL_NONE;
	npcType = npctype_main;
	level = 60;
	voice = 4;
	id = 12207;
	aivar[93] = TRUE;
	flags = NPC_FLAG_XARADRIM;
	aivar[94] = NPC_EPIC;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,7);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",164,BodyTex_N,ITAR_Raven_Addon_TAR);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_SetFightSkills(self,100);
	CreateInvItems(self,ItPo_Health_03,10);
	EquipItem(self,itmw_2h_xaradrim);
	fight_tactic = FAI_HUMAN_MASTER;
	B_GiveNpcTalents(self);
	aivar[AIV_IgnoresArmor] = TRUE;
	daily_routine = rtn_start_12207;
};

func void rtn_start_12207()
{
	TA_Stand_Guarding(23,0,8,0,"NW_XARDAS_TOWER_VALLEY_09");
	TA_Stand_Guarding(8,0,23,0,"NW_XARDAS_TOWER_VALLEY_09");
};

func void rtn_guide_12207()
{
	TA_Guide_Player(8,0,23,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Guide_Player(23,0,8,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
};

func void rtn_guard_12207()
{
	TA_Stand_Guarding(8,0,23,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Guarding(23,0,8,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
};

func void rtn_TOT_12207()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};


