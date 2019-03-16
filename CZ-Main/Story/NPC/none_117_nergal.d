
instance NONE_117_NERGAL(Npc_Default)
{
	name[0] = "Nergal";
	guild = GIL_DMT;
	id = 117;
	voice = 9;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	B_SetAttributesToChapter(self,8);
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ItAr_KDM_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_117;
};


func void rtn_start_117()
{
	ta_xardasritual_nergal(8,0,23,0,"NW_XARDAS_SOUL");
	ta_xardasritual_nergal(23,0,8,0,"NW_XARDAS_SOUL");
};

func void rtn_tot_117()
{
	TA_Stand_WP(8,0,23,0,"TOT");
	TA_Stand_WP(23,0,8,0,"TOT");
};

func void rtn_failritual_117()
{
	TA_Stand_WP(8,0,23,0,"NW_XARDAS_SOUL");
	TA_Stand_WP(23,0,8,0,"NW_XARDAS_SOUL");
};