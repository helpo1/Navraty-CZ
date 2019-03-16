
instance NONE_100_Xardas(Npc_Default)
{
	name[0] = "Xardas";
	guild = GIL_NONE;
	id = 100;
	voice = 14;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	aivar[93] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Xardas,BodyTex_N,ITAR_Xardas);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	EquipItem(self,ItMW_Xardas_Stab);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_PreStart_100;
};

func void Rtn_PreStart_100()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_XARDAS_START");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_XARDAS_START");
};

func void Rtn_Start_100()
{
	TA_Stand_ArmsCrossed(4,0,23,0,"NW_XARDAS_TOWER_IN1_32");
	TA_Stand_ArmsCrossed(23,0,4,0,"NW_XARDAS_TOWER_IN1_32");
};

func void rtn_xar_100()
{
	TA_Read_Bookstand(8,0,23,0,"NW_XARDAS_TOWER_IN1_28");
	TA_Sit_Throne(23,0,8,0,"NW_XARDAS_TOWER_IN1_32");
};

func void Rtn_RitualInnosEyeRepair_100()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void Rtn_MageSpeech_100()
{
	TA_MageSpeech(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	TA_MageSpeech(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void Rtn_RitualInnosEye_100()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void Rtn_Tot_100()
{
	TA_Circle(8,0,23,0,"TOT");
	TA_Circle(23,0,8,0,"TOT");
};

func void rtn_drained_100()
{
	ta_drained_yberion(23,0,7,0,"NW_XARDAS_ALEFCAST");
	ta_drained_yberion(7,0,23,0,"NW_XARDAS_ALEFCAST");
};

func void rtn_waitforplayerritual_100()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_XARDAS_RITUAL_00");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_XARDAS_RITUAL_00");
};

func void rtn_xardasritual_100()
{
	ta_xardasritual_xardas(8,0,23,0,"NW_XARDAS_RITUAL_00");
	ta_xardasritual_xardas(23,0,8,0,"NW_XARDAS_RITUAL_00");
};

func void rtn_xardasritualdrained_100()
{
	ta_drained_yberion(23,0,7,0,"NW_XARDAS_RITUAL_00");
	ta_drained_yberion(7,0,23,0,"NW_XARDAS_RITUAL_00");
};

func void rtn_Alchemy_100()
{
	TA_Potion_Alchemy(23,0,7,0,"NW_XARDAS_TOWER_IN1_29");
	TA_Potion_Alchemy(7,0,23,0,"NW_XARDAS_TOWER_IN1_29");
};

instance NONE_1192_Fregeal(Npc_Default)
{
	name[0] = "Fregeal";
	guild = GIL_NONE;
	id = 1192;
	voice = 14;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	aivar[93] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_Fregal,BodyTex_N,ITAR_Bau_M_Ext);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	EquipItem(self,ITMW_STAFFDRUID);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_1192;
};

func void Rtn_Start_1192()
{
	TA_Read_Bookstand(8,0,12,0,"NW_FOREST_PATH_80_1_DRUID_02");
	TA_Sit_Bench(12,0,15,0,"NW_FOREST_PATH_80_1_DRUID_06");
	TA_Read_Bookstand(15,0,20,0,"NW_FOREST_PATH_80_1_DRUID_02");
	TA_Sit_Bench(20,0,23,0,"NW_FOREST_PATH_80_1_DRUID_06");
	TA_Sleep(23,0,8,0,"NW_FOREST_PATH_80_1_DRUID_03");
};
