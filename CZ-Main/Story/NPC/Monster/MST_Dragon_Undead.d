
prototype Mst_Default_Dragon_Undead(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonUndead;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_UNDEAD;
	level = 1000;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 75000;
	attribute[ATR_HITPOINTS] = 75000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 700;
	damage[DAM_INDEX_FLY] = 300;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MaxDistToWp] = 650;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};

func void B_SetVisuals_Dragon_Undead()
{
	Mdl_SetVisual(self,"Dragon_Dark.mds");
	Mdl_SetVisualBody(self,"Dragon_Undead_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Dragon_Undead(Mst_Default_Dragon_Undead)
{
	B_SetVisuals_Dragon_Undead();
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	effect = "spellfx_undead_dragon";
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItMi_Mutagen_Mana_Strong,1);
};