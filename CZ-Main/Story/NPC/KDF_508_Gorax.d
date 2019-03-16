
instance KDF_508_Gorax(Npc_Default)
{
	name[0] = "Gorax";
	guild = GIL_KDF;
	id = 508;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	Mdl_SetModelFatness(self,0);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_508;
};


func void Rtn_Start_508()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_WINEMAKER_01");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_MAGE02_BED_01");
};

func void rtn_inbattle_508()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_09");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_09");
};

func void rtn_campon_508()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_08");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_08");
};

