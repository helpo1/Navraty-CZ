
prototype Mst_Default_Dragon_Rock(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonRock;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_ROCK;
	level = 500;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 450;
	protection[PROT_POINT] = 2000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 350;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 400;
	damage[DAM_INDEX_FLY] = 220;
	fight_tactic = FAI_DRAGON;
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

func void B_SetVisuals_Dragon_Rock()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Rock_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Dragon_Rock(Mst_Default_Dragon_Rock)
{
	name[0] = CZ_NAME_Monster_DragonRock_Pedrakan;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	CreateInvItems(self,ItKe_StoneDragon,1);
	B_SetVisuals_Dragon_Rock();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Normal,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
};