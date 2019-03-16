
prototype Mst_Default_Dragon_Fire(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonFire;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_FIRE;
	level = 750;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 50000;
	attribute[ATR_HITPOINTS] = 50000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 450;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 250;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 450;
	damage[DAM_INDEX_FLY] = 230;
	fight_tactic = FAI_DRAGON;
	effect = "SPELLFX_FIREDRAGONAURA";
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;

};

func void B_SetVisuals_Dragon_Fire()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_FIRE_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Dragon_Rune()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_RUNE_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Dragon_Fire(Mst_Default_Dragon_Fire)
{
	name[0] = CZ_NAME_Monster_DragonFire_Feomatar;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	B_SetVisuals_Dragon_Fire();
	Npc_SetToFistMode(self);
	effect = "SPELLFX_FIREDRAGON";
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItKe_FireDragon,1);
	CreateInvItems(self,ItMi_Mutagen_HP_Normal,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
};

instance Summoned_Dragon(Mst_Default_Dragon_Fire)
{
	name[0] = CZ_NAME_Monster_DragonFire_Summoned;
	guild = gil_summoned_golem;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DRAGON;
	level = 0;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 275;
	protection[PROT_FLY] = 750;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Dragon_Rune();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	effect = "SPELLFX_FIREDRAGON";
};

prototype MST_DEFAULT_DRAGON_RED(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonRed;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_RED;
	level = 1250;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 50000;
	attribute[ATR_HITPOINTS] = 50000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 450;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 400;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 650;
	damage[DAM_INDEX_FLY] = 250;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};

func void b_setvisuals_dragon_red()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_REDS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Dragon_Fire_Island(MST_DEFAULT_DRAGON_RED)
{
	name[0] = CZ_NAME_Monster_DragonRed_Trakanon;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_red();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	effect = "SPELLFX_FIREDRAGON";
	CreateInvItems(self,ItMi_Mutagen_Str_Normal,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
};

instance Dragon_Rune(MST_DEFAULT_DRAGON_RED)
{
	name[0] = CZ_NAME_EMPTY;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_red();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	effect = "SPELLFX_FIREDRAGON";
	CreateInvItems(self,ItMi_Mutagen_Str_Normal,1);
};
