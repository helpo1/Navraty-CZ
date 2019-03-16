
instance NONE_106_RODRIGUEZ(Npc_Default)
{
	name[0] = "Родригез";
	guild = GIL_NONE;
	id = 106;
	voice = 11;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",44,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_106;
};


func void rtn_start_106()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_RODRIGUEZ");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_RODRIGUEZ");
};

func void rtn_tot_106()
{
	TA_Ghost(8,0,23,0,"TOT");
	TA_Ghost(23,0,8,0,"TOT");
};

