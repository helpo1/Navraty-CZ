
prototype Mst_Addon_Stoneguardian(C_Npc)
{
	name[0] = "Каменный Страж";
	guild = GIL_Stoneguardian;
	aivar[AIV_MM_REAL_ID] = ID_Stoneguardian;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 250;
	damage[DAM_INDEX_FLY] = 100;
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

func void B_SetVisuals_Stoneguardian()
{
	Mdl_SetVisual(self,"StoneGuardian.mds");
	Mdl_SetVisualBody(self,"StG_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Stoneguardian_Undead()
{
	Mdl_SetVisual(self,"StoneGuardian.mds");
	Mdl_SetVisualBody(self,"StU_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Treant()
{
	Mdl_SetVisual(self,"Treant.mds");
	Mdl_SetVisualBody(self,"Treant_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Stoneguardian(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Ashtar(Mst_Addon_Stoneguardian)
{
	name[0] = "Древний каменный страж";
	level = 15;
	attribute[ATR_STRENGTH] = 370;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 135;
	protection[PROT_MAGIC] = 120;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Treant(Mst_Addon_Stoneguardian)
{
	name[0] = "Дух леса";
	guild = gil_summoned_golem;
	aivar[AIV_MM_REAL_ID] = id_summoned_golem;
	level = 0;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Treant();
	Npc_SetToFistMode(self);
};

instance Stoneguardian_Guard_TOT(Mst_Addon_Stoneguardian)
{
	name[0] = "Страж храма Слез";
	level = 20;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 200;
	damage[DAM_INDEX_FLY] = 100;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 155;
	protection[PROT_MAGIC] = 145;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Guard_Pyra(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 20;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 200;
	damage[DAM_INDEX_FLY] = 100;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_MineDead1(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_MineDead2(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_MineDead3(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_MineDead4(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Dead1(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItWr_HitPointStonePlate1_Addon,1);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Dead2(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Dead3(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_MerdarionsSchluessel(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Ornament(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItem(self,ItMi_Ornament_Addon);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Heiler(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ITKE_Addon_Heiler,1);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Sani01(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Sani02(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Sani03(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Sani04(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Sani05(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Sani06(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	B_SetVisuals_Stoneguardian();
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_NailedPortalADW1(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2400;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_NailedPortalADW2(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 3100;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_NailedValleyShowcase_01(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_NailedValleyShowcase_02(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 1000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_ADANOSTEMPELENTRANCE_01(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_ADANOSTEMPELENTRANCE_02(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_ADANOSTEMPELENTRANCE_03(Mst_Addon_Stoneguardian)
{
	aivar[AIV_MaxDistToWp] = 2000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_ADANOSTEMPELENTRANCE_04(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 900;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_05A(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 3000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_05B(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2700;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_05C(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2900;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_05D(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2400;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_05E(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2900;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_05F(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2800;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_09A(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2400;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_09B(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2400;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_09C(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2000;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_09D(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2400;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_09E(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2700;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_TREASUREPITS_09F(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 2900;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_RHADEMES_14A(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 700;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_RHADEMES_14B(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 1200;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_RHADEMES_14C(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 700;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_RHADEMES_14D(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 700;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_RHADEMES_14E(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 1200;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_RHADEMES_14F(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный Страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 95;
	aivar[AIV_MaxDistToWp] = 700;
	aivar[AIV_OriginalFightTactic] = FAI_Stoneguardian;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};


prototype SUMMONED_GUARDIAN_A(C_Npc)
{
	name[0] = "Рунный каменный страж";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SummonedGuardian;
	level = 0;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 120;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 125;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Stoneguardian();
};

instance Summoned_Guardian(SUMMONED_GUARDIAN_A)
{
	name[0] = "Рунный каменный страж";
	level = 0;
	B_SetVisuals_Stoneguardian();
};

instance SUMMONED_GUARDIAN_NOEXP(SUMMONED_GUARDIAN_A)
{
	name[0] = "Каменный страж";
	level = 1;
	aivar[AIV_PARTYMEMBER] = FALSE;
	B_SetAttitude(self,ATT_HOSTILE);
	B_SetVisuals_Stoneguardian();
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_AV_01(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный титан";
	guild = GIL_Stoneguardian;
	level = 75;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 325;
	protection[PROT_MAGIC] = 325;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 400;
	damage[DAM_INDEX_FLY] = 150;
	effect = "SPELLFX_ICE_SMOKE_FULL";
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian_Undead();
	Mdl_SetModelScale(self,1.5,1.5,1.5);
	CreateInvItems(self,ItMi_XunePart_01,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,5);
};

instance Stoneguardian_AV_02(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный титан";
	guild = GIL_Stoneguardian;
	level = 75;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 325;
	protection[PROT_MAGIC] = 325;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 400;
	damage[DAM_INDEX_FLY] = 150;
	effect = "SPELLFX_ICE_SMOKE_FULL";
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian_Undead();
	Mdl_SetModelScale(self,1.5,1.5,1.5);
	CreateInvItems(self,ItMi_ZunePart_02,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,5);
};


instance Stoneguardian_AV_03(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный титан";
	guild = GIL_Stoneguardian;
	level = 75;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 325;
	protection[PROT_MAGIC] = 325;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 400;
	damage[DAM_INDEX_FLY] = 150;
	effect = "SPELLFX_ICE_SMOKE_FULL";
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian_Undead();
	Mdl_SetModelScale(self,1.5,1.5,1.5);
	CreateInvItems(self,ItMi_YunePart_03,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,5);
};


instance Stoneguardian_AV_04(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный титан";
	guild = GIL_Stoneguardian;
	level = 75;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 325;
	protection[PROT_MAGIC] = 325;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 400;
	damage[DAM_INDEX_FLY] = 150;
	effect = "SPELLFX_ICE_SMOKE_FULL";
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian_Undead();
	Mdl_SetModelScale(self,1.5,1.5,1.5);
	CreateInvItems(self,ItMi_WunePart_04,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,5);
};

instance Stoneguardian_AV_05(Mst_Addon_Stoneguardian)
{
	name[0] = "Каменный титан";
	guild = GIL_Stoneguardian;
	level = 75;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 325;
	protection[PROT_MAGIC] = 325;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 400;
	damage[DAM_INDEX_FLY] = 150;
	effect = "SPELLFX_ICE_SMOKE_FULL";
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Stoneguardian_Undead();
	Mdl_SetModelScale(self,1.5,1.5,1.5);
	CreateInvItems(self,ItMi_UunePart_05,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,5);
};

instance Stoneguardian_Undead(Mst_Addon_Stoneguardian)
{
	name[0] = "Бессмертный страж";
	guild = GIL_Stoneguardian;
	level = 30;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 225;
	protection[PROT_MAGIC] = 225;
	B_SetVisuals_Stoneguardian_Undead();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};


instance Stoneguardian_Undead_NoExp(Mst_Addon_Stoneguardian)
{
	name[0] = "";
	guild = GIL_Stoneguardian;
	level = 1;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 225;
	protection[PROT_MAGIC] = 225;
	B_SetVisuals_Stoneguardian();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};

instance Stoneguardian_Undead_TT(Mst_Addon_Stoneguardian)
{
	name[0] = "Храмовый страж";
	guild = GIL_Stoneguardian;
	level = 45;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 90000;
	attribute[ATR_HITPOINTS] = 90000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 225;
	protection[PROT_MAGIC] = 225;
	damagetype = DAM_FLY;
	B_SetVisuals_Stoneguardian();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_StoneGuardianPiece,1);
};
