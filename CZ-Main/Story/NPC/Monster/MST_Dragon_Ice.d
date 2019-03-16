
prototype Mst_Default_Dragon_Ice(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonIce;
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_ICE;
	level = 1000;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 550;
	attribute[ATR_HITPOINTS_MAX] = 55000;
	attribute[ATR_HITPOINTS] = 55000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 450;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 450;
	damagetype = DAM_MAGIC | DAM_FLY;
	damage[DAM_INDEX_MAGIC] = 500;
	damage[DAM_INDEX_FLY] = 240;
	fight_tactic = FAI_DRAGON;
	effect = "SPELLFX_ICEDRAGONAURA";
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

func void B_SetVisuals_Dragon_Ice()
{
	Mdl_SetVisual(self,"Dragon_IceX.mds");
	Mdl_SetVisualBody(self,"Dragon_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Dragon_Ice(Mst_Default_Dragon_Ice)
{
	name[0] = CZ_NAME_Monster_DragonIce_Finkreg;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	B_SetVisuals_Dragon_Ice();
	CreateInvItems(self,ItKe_IceDragon,1);
	Npc_SetToFistMode(self);
	effect = "SPELLFX_ICEDRAGON";
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItMi_Mutagen_Mana_Normal,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
};