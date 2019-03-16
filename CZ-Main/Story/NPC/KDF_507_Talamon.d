
instance KDF_507_Talamon(Npc_Default)
{
	name[0] = "Talamon";
	guild = GIL_KDF;
	id = 507;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Saturas,BodyTex_B,ItAr_KDF_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	daily_routine = Rtn_Start_507;
};


func void Rtn_Start_507()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_MONASTERY_CELLAR_15");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_MONASTERY_CELLAR_15");
};

func void rtn_inbattle_507()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_08");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_08");
};

func void rtn_campon_507()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_07");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_07");
};

