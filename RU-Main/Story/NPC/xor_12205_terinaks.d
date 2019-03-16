
instance XOR_12205_TERINAKS(Npc_Default)
{
	name[0] = "Таринакс";
	guild = GIL_OUT;
	npcType = npctype_main;
	level = 100;
	voice = 4;
	id = 12205;
	flags = NPC_FLAG_XARADRIM;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",164,BodyTex_N,ITAR_Raven_Addon_TAR);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_SetFightSkills(self,100);
	CreateInvItems(self,ItPo_Health_03,10);
	EquipItem(self,itmw_2h_xaradrim);
	fight_tactic = FAI_HUMAN_MASTER;
	B_GiveNpcTalents(self);
	aivar[AIV_IgnoresArmor] = TRUE;
	daily_routine = rtn_start_12205;
};


func void rtn_start_12205()
{
	TA_Stand_Guarding(8,0,23,0,"WP_GUARDIANS_24");
	TA_Stand_Guarding(23,0,8,0,"WP_GUARDIANS_24");
};

func void rtn_tot_12205()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};
