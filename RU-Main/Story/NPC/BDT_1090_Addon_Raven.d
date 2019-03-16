
instance BDT_1090_Addon_Raven(Npc_Default)
{
	name[0] = "Ворон";
	guild = GIL_BDT;
	id = 1090;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	level = 100;
	aivar[93] = TRUE;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_MANA_MAX] = 666666;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	protection[PROT_FLY] = IMMUNE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_BeliarWeapon_Raven);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Raven,BodyTex_N,itar_ravenarmor_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1090;
};

func void Rtn_Start_1090()
{
	TA_Pray_Innos_FP(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Pray_Innos_FP(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

func void Rtn_WaitforPlayer_1090()
{
	TA_Stand_WP(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Stand_WP(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

func void Rtn_TOT_1090()
{
	TA_Stand_WP(9,0,21,0,"TOT");
	TA_Stand_WP(21,0,9,0,"TOT");
};

instance BDT_2090_Addon_Raven(Npc_Default)
{
	name[0] = "Ворон";
	guild = GIL_DEMON;
	id = 2090;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	level = 500;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 666;
	attribute[ATR_DEXTERITY] = 666;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	protection[PROT_FLY] = IMMUNE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_RAVENELITE);
	CreateInvItems(self,ItMw_BeliarWeapon_Raven,1);
	CreateInvItems(self,ITMI_RAVENGOLDRING,1);
	CreateInvItems(self,ItMi_BeliarPowerStone,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",FaceBabe_N_BlondTattoo,BodyTex_RavenDemon,ITAR_Raven_Demon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2090;
};

func void Rtn_Start_2090()
{
	TA_Pray_Innos_FP(9,0,21,0,"OASE_030");
	TA_Pray_Innos_FP(21,0,9,0,"OASE_030");
};

func void Rtn_Summon_2090()
{
	TA_Stand_Summon(9,0,21,0,"OASE_030");
	TA_Stand_Summon(21,0,9,0,"OASE_030");
};

func void Rtn_Battle_2090()
{
	TA_Stand_WP(9,0,21,0,"OASE_030");
	TA_Stand_WP(21,0,9,0,"OASE_030");
};