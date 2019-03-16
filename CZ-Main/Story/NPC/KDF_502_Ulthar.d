
instance KDF_502_Ulthar(Npc_Default)
{
	name[0] = "Ulthar";
	guild = GIL_KDF;
	id = 502;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_NormalBart01,BodyTex_L,ItAr_KDF_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	Mdl_SetModelFatness(self,0);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab01_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_502;
};

func void Rtn_Start_502()
{
	TA_Sit_Throne(8,0,11,0,"NW_MONASTERY_THRONE_03");
	TA_Potion_Alchemy(11,0,15,0,"NW_MONASTERY_MAGE02_01_ULTAR_01");
	TA_Sit_Throne(15,0,18,0,"NW_MONASTERY_MAGE02_01_ULTAR_02");
	TA_Read_Bookstand(18,0,20,0,"NW_MONASTERY_CHURCH_BOOK_01");
	TA_Sit_Throne(20,0,22,0,"NW_MONASTERY_THRONE_03");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_MAGE02_BED_ULTAR");
};

func void rtn_inbattle_502()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_03");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_03");
};

func void rtn_campon_502()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_02");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_02");
};