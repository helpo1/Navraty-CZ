
prototype Mst_Default_Dragon_Swamp(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonSwamp;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_SWAMP;
	level = 350;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 35000;
	attribute[ATR_HITPOINTS] = 35000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 450;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 350;
	damage[DAM_INDEX_FLY] = 210;
	fight_tactic = FAI_DRAGON;
	effect = "SPELLFX_SWAMPDRAGONAURA";
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};

func void B_SetVisuals_Dragon_Swamp()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Swamp_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Dragon_Swamp(Mst_Default_Dragon_Swamp)
{
	name[0] = CZ_NAME_Monster_DragonSwamp_Pandrodor;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	CreateInvItems(self,ItKe_SwampDragon,1);
	B_SetVisuals_Dragon_Swamp();
	Npc_SetToFistMode(self);
	effect = "SPELLFX_SWAMPDRAGON";
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItMi_Mutagen_Dex_Normal,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
};