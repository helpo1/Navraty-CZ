
prototype MST_DEFAULT_DRAGON_BLACK(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonBlack;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_BLACK;
	level = 1500;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 75000;
	attribute[ATR_HITPOINTS] = 75000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 600;
	damage[DAM_INDEX_FLY] = 250;
	fight_tactic = FAI_DRAGON;
	effect = "SPELLFX_REDFLAMEDRAGONAURA";
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

func void b_setvisuals_dragon_black()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Smag_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance DRAGON_BLACK(MST_DEFAULT_DRAGON_BLACK)
{
	name[0] = CZ_NAME_Monster_DragonBlack_Azgalor;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_black();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	CreateInvItems(self,ItMi_Mutagen_Mana_Strong,1);
	effect = "SPELLFX_REDFLAMEDRAGON";
};