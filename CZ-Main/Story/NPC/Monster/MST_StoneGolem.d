
prototype Mst_Default_StoneGolem(C_Npc)
{
	name[0] = CZ_NAME_Monster_StoneGolem;
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	bodyStateInterruptableOverride = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 170;
	damage[DAM_INDEX_FLY] = 100;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_StoneGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_stonegolem_osta()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gos_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_WindGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Gol_Wnd_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_stone_ork()
{
	Mdl_SetVisual(self,"Osta.mds");
	Mdl_SetVisualBody(self,"Osta_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_XranFeng()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"GOL_BODY_XRFR",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance WindGolem(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_SandWhirlwind;
	level = 50;
	flags = NPC_FLAG_GHOST;
	aivar[AIV_MM_REAL_ID] = ID_SANDGOLEM;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 25;
	damagetype = DAM_FLY;
	b_setvisuals_WindGolem();
	effect = "SPELLFX_SAND_SMOKE";
	Npc_SetToFistMode(self);
};

func void ZS_GolemDown()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_GolemRise);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_GolemDown_LOOP()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_GolemDown_END()
{
};

func void B_GolemRise()
{
	if((Npc_GetDistToNpc(self,hero) <= 700) && (Mob_HasItems("NW_GOLEMCHEST",ItSe_Golemchest_Mis) == 0))
	{
		AI_PlayAni(self,"T_RISE");
		self.noFocus = FALSE;
		self.name[0] = CZ_NAME_Monster_StoneGolem;
		self.flags = 0;
		AI_StartState(self,ZS_MM_Attack,0,"");
		self.start_aistate = ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] = OnlyRoutine;
	};
};

instance StoneGolem(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance StoneGolem_Trf(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem;
	level = 12;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance StoneGolem_Avatar(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem;
	level = 12;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 350;
	damage[DAM_INDEX_FLY] = 100;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance STONEGOLEM_1(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	damage[DAM_INDEX_FLY] = 170;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance STONEGOLEM_NOEXP(Mst_Default_StoneGolem)
{
	level = 1;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance STONEGOLEM_OSTA(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_Tenevik;
	guild = GIL_STONEGOLEM;
	level = 50;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	b_setvisuals_stonegolem_osta();
	Npc_SetToFistMode(self);
};

instance STONE_ORK(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_StoneOrcGuardian;
	level = 35;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 111;
	protection[PROT_EDGE] = 111;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 25;
	b_setvisuals_stone_ork();
	Npc_SetToFistMode(self);
};

instance Summoned_Golem(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_Summoned;
	guild = gil_summoned_golem;
	aivar[AIV_MM_REAL_ID] = id_summoned_golem;
	level = 0;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance Shattered_Golem(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_EMPTY;
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	start_aistate = ZS_GolemDown;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance SHATTERED_GOLEM_01(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_EMPTY;
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	start_aistate = ZS_GolemDown;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance SHATTERED_GOLEM_02(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_EMPTY;
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	start_aistate = ZS_GolemDown;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance SHATTERED_GOLEM_03(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_EMPTY;
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	start_aistate = ZS_GolemDown;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance SHATTERED_GOLEM_04(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_EMPTY;
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	level = 12;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	start_aistate = ZS_GolemDown;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MagicGolem(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_Magic;
	level = 50;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance STONEGOLEM_UNIQ(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_Antramentor;
	level = 50;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	aivar[90] = TRUE;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itke_tarakot,1);
	CreateInvItems(self,ItMi_Ruby,1);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Low,1);
};

func void B_SetVisuals_Avatar_Stone()
{
	Mdl_SetVisual(self,"Avatar.mds");
	Mdl_SetVisualBody(self,"Avatar_Body_Rock",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Avatar_Fire()
{
	Mdl_SetVisual(self,"Avatar.mds");
	Mdl_SetVisualBody(self,"Avatar_Body_Fire",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Avatar_Water()
{
	Mdl_SetVisual(self,"Avatar.mds");
	Mdl_SetVisualBody(self,"Avatar_Body_Ice",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance StoneGolem_Dragon(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_StoneElemental;
	level = 1;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 250;
	damage[DAM_INDEX_FLY] = 100;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Avatar_Stone();
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	Npc_SetToFistMode(self);
};

//--------------Avatary---------------------------------------

instance Avatar_Stone(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_Kametor_Title;
	guild = GIL_STONEGOLEM;
	flags = 0;
	bodyStateInterruptableOverride = TRUE;
	level = 1000;
	aivar[AIV_MM_REAL_ID] = ID_STONEAVATAR;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 50000;
	attribute[ATR_HITPOINTS] = 50000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 400;
	fight_tactic = FAI_STONEGOLEM;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 600;
	damage[DAM_INDEX_FLY] = 100;
	aivar[AIV_EnemyOverride] = TRUE;
	effect = "SPELLFX_LIGHT_SMOKE";
	CreateInvItems(self,ItMi_Avatar_Stone,1);
	B_SetVisuals_Avatar_Stone();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_HP_Strong,1);
};

instance Avatar_Fire(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem_Faragon_Title;
	guild = GIL_FIREGOLEM;
	level = 1000;
	flags = 0;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_FIREAVATAR;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 400;
	fight_tactic = FAI_STONEGOLEM;
	damagetype = DAM_BLUNT | DAM_FIRE;
	damage[DAM_INDEX_BLUNT] = 650;
	damage[DAM_INDEX_FIRE] = 250;
	aivar[AIV_EnemyOverride] = TRUE;
	effect = "SPELLFX_FIRES_SMOKE";
	B_SetVisuals_Avatar_Fire();
	CreateInvItems(self,ItMi_Avatar_Fire,1);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Strong,1);
};

instance Avatar_Water(Mst_Default_IceGolem)
{
	name[0] = CZ_NAME_Monster_IceGolem_Eysray_Title;
	level = 1000;
	flags = 0;
	bodyStateInterruptableOverride = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_ICEAVATAR;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 550;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 450;
	protection[PROT_POINT] = 2000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 500;
	fight_tactic = FAI_STONEGOLEM;
	aivar[AIV_EnemyOverride] = TRUE;
	damagetype = DAM_BLUNT | DAM_MAGIC;
	damage[DAM_INDEX_BLUNT] = 700;
	damage[DAM_INDEX_MAGIC] = 250;
	B_SetVisuals_Avatar_Water();
	effect = "SPELLFX_SNOW_SMOKE";
	CreateInvItems(self,ItMi_Avatar_Water,1);
	Npc_SetToFistMode(self);
};

instance XranFreg(Mst_Default_StoneGolem)
{
	name[0] = CZ_NAME_Monster_StoneGolem_Fregarakh;
	level = 1000;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	attribute[ATR_STRENGTH] = 2500;
	attribute[ATR_DEXTERITY] = 2500;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	aivar[AIV_EnemyOverride] = TRUE;
	effect = "SPELLFX_STONESPHERE";
	b_setvisuals_XranFeng();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_Str_Strong,1);
};