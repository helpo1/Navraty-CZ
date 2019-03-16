
instance KDW_140300_Addon_Myxir_CITY(Npc_Default)
{
	name[0] = "Myxir";
	guild = GIL_KDW;
	id = 140300;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_NormalBart_Cronos,BodyTex_P,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_140300;
};

func void Rtn_Start_140300()
{
	TA_Stand_Sweeping(7,0,9,0,"NW_CITY_UPTOWN_HUT_03_01_B");
	TA_Cook_Stove(9,0,11,0,"NW_CITY_UPTOWN_HUT_03_IN_01");
	TA_Study_WP(11,0,14,0,"MARKT");
	TA_Stand_ArmsCrossed(14,0,18,0,"NW_CITY_MERCHANT_TEMPLE_IN");
	TA_Sit_Bench(18,0,20,0,"NW_CITY_MERCHANT_PATH_15");
	TA_Sit_Throne(20,0,7,0,"NW_CITY_UPTOWN_HUT_03_SIT");
};

func void Rtn_JarCurse_140300()
{
	TA_Stand_ArmsCrossed(6,55,20,30,"AMBOSS");
	TA_Stand_ArmsCrossed(20,30,6,55,"AMBOSS");
};

func void rtn_orcatcbegan_140300()
{
	TA_Stand_ArmsCrossed(6,55,20,30,"NW_MONASTERY_CORRIDOR_09");
	TA_Stand_Guarding(20,30,6,55,"NW_MONASTERY_CORRIDOR_09");
};

func void rtn_campon_140300()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDW_04");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDW_04");
};

func void rtn_inbattle_140300()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8689");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8689");
};

instance KDW_1406_Mitras(Npc_Default)
{
	name[0] = "Mitras";
	guild = GIL_KDW;
	id = 1406;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_Weak_Cutter,BodyTex_P,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_1406;
};

func void Rtn_Start_1406()
{
	TA_Stand_ArmsCrossed(5,5,20,10,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
	TA_Stand_ArmsCrossed(20,10,5,5,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
};


instance KDW_1407_Norolas(Npc_Default)
{
	name[0] = "Norolas";
	guild = GIL_KDW;
	id = 1407;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal02,BodyTex_P,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_1407;
};

func void Rtn_Start_1407()
{
	TA_Study_WP(5,5,20,10,"WP_COAST_FOREST_04");
	TA_Stand_ArmsCrossed(20,10,5,5,"WP_COAST_FOREST_04");
};

func void Rtn_NetbekLager_1407()
{
	TA_Study_WP(5,0,13,0,"WP_COAST_BASE_09");
	TA_Stand_ArmsCrossed(13,0,20,0,"WP_COAST_BASE_09");
	TA_Sit_Bench(20,0,5,0,"WP_COAST_BASE_02");
};