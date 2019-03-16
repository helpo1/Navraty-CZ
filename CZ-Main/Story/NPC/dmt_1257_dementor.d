
instance DMT_1257_DEMENTOR(Npc_Default)
{
	name[0] = "Zigos";
	guild = GIL_NONE;
	id = 1257;
	voice = 19;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_1257;
};


func void rtn_start_1257()
{
	TA_Stand_Dementor(8,0,23,0,"TOT");
	TA_Stand_Dementor(23,0,8,0,"TOT");
};

func void rtn_nwidol01_1257()
{
	TA_Stand_Dementor(8,0,23,0,"NW_IDOL_01_00");
	TA_Stand_Dementor(23,0,8,0,"NW_IDOL_01_00");
};

func void rtn_adwidol01_1257()
{
	TA_Stand_Dementor(8,0,23,0,"ADW_IDOL_01_00");
	TA_Stand_Dementor(23,0,8,0,"ADW_IDOL_01_00");
};

func void rtn_adwidol02_1257()
{
	TA_Stand_Dementor(8,0,23,0,"ADW_IDOL_02_00");
	TA_Stand_Dementor(23,0,8,0,"ADW_IDOL_02_00");
};

func void rtn_owidol01_1257()
{
	TA_Stand_Dementor(8,0,23,0,"OW_IDOL_01_00");
	TA_Stand_Dementor(23,0,8,0,"OW_IDOL_01_00");
};

func void rtn_owidol02_1257()
{
	TA_Stand_Dementor(8,0,23,0,"OW_IDOL_02_00");
	TA_Stand_Dementor(23,0,8,0,"OW_IDOL_02_00");
};

