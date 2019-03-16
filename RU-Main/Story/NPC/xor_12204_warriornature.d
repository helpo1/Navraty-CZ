
instance XOR_12204_WARRIORNATURE(Npc_Default)
{
	name[0] = "Асгард";
	guild = GIL_OUT;
	npcType = npctype_main;
	level = 60;
	voice = 4;
	id = 12204;
	flags = NPC_FLAG_XARADRIM;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",169,BodyTex_N,itar_orearmor_NPC);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_SetFightSkills(self,100);
	CreateInvItems(self,ItPo_Health_03,10);
	EquipItem(self,itmw_2h_xaradrim);
	fight_tactic = FAI_HUMAN_STRONG;
	B_GiveNpcTalents(self);
	aivar[AIV_IgnoresArmor] = TRUE;
	daily_routine = rtn_start_12204;
};


func void rtn_start_12204()
{
	TA_Stand_Guarding(8,0,23,0,"WP_GUARDIANS_07");
	TA_Stand_Guarding(23,0,8,0,"WP_GUARDIANS_07");
};

func void rtn_tot_12204()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};
