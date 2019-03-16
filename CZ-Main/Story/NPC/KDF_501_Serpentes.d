
instance KDF_501_Serpentes(Npc_Default)
{
	name[0] = "Serpentes";
	guild = GIL_KDF;
	id = 501;
	voice = 10;
	flags = 0;
	aivar[93] = TRUE;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_PSIONIC",Face_N_ImportantGrey,BodyTex_N,ItAr_KDF_H_NPC);
	Mdl_SetModelFatness(self,-2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	Mdl_SetModelFatness(self,0);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab01_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_501;
};

func void Rtn_Start_501()
{
	TA_Sit_Throne(8,0,14,0,"NW_MONASTERY_THRONE_02");
	TA_Read_Bookstand(14,0,18,0,"NW_MONASTERY_MAGE01_BED_01");
	TA_Sit_Throne(18,0,22,0,"NW_MONASTERY_MAGE01_012_TEMP_02");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_MAGE01_012_TEMP_03");
};

func void rtn_inbattle_501()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_02");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_02");
};

func void rtn_campon_501()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_01");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_01");
};
