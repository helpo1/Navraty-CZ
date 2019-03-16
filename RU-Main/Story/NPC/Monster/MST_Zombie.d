
prototype Mst_Default_Zombie(C_Npc)
{
	name[0] = "Зомби";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 12;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,-1);
};

func void B_SetVisuals_Zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,-1);
};

func void B_SetVisuals_Zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,-1);
};

func void B_SetVisuals_Zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,-1);
};

func void b_setvisuals_necromacerzombie()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_Xardas);
};

func void b_setvisuals_psizombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",FACE_N_SEKTANT_1,DEFAULT,itar_sekbed);
};

func void b_setvisuals_psizombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",FACE_N_SEKTANT_2,DEFAULT,itar_sekbed);
};

func void b_setvisuals_psizombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",FACE_N_SEKTANT_4,DEFAULT,itar_sekbed);
};

func void b_setvisuals_psizombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",FACE_N_SEKTANT_5,DEFAULT,itar_sekbed);
};

func void b_setvisuals_psizombie05()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",FACE_N_SEKTANT_5,DEFAULT,itar_sekbed);
};

func void b_setvisuals_alefzombie()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",103,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_riordianzombie()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_kdw_h);
};

func void b_setvisuals_gomezworkersoul_1()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",80,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_2()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",81,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_3()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",82,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_4()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",83,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_5()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",84,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_6()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",85,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_7()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",86,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_8()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",87,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_9()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",88,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_10()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",89,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_11()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",90,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_12()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",91,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_13()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",92,DEFAULT,ITAR_Prisoner);
};

func void b_setvisuals_gomezworkersoul_14()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",93,DEFAULT,itar_prisonel);
};

func void b_setvisuals_gomezworkersoul_15()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Thief",94,DEFAULT,ITAR_Prisoner);
};

func void B_SetVisuals_Pal_Zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Pal_Zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Pal_Zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Pal_Zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Maya_Zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_MayaZombie_Addon);
};

func void B_SetVisuals_Maya_Zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
};

func void B_SetVisuals_Maya_Zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,ITAR_MayaZombie_Addon);
};

func void B_SetVisuals_Maya_Zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
};

func void ZS_Pal_ZOMBIE()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_Pal_ZOMBIE_RISE);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Pal_ZOMBIE_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DOWN");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Pal_ZOMBIE_END()
{
};

func void B_Pal_ZOMBIE_RISE()
{
	if(Npc_GetDistToNpc(self,hero) <= 1400)
	{
		AI_PlayAni(self,"T_RISE");
		AI_StartState(self,ZS_MM_Attack,0,"");
		self.bodyStateInterruptableOverride = FALSE;
		self.start_aistate = ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] = OnlyRoutine;
	};
};

instance ALEF_SOUL(Mst_Default_Zombie)
{
	name[0] = "Призрак Алефа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 30;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	effect = "SPELLFX_MOON_SMOKE";
	b_setvisuals_alefzombie();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance RIORDIAN_ZOMBIE(Mst_Default_Zombie)
{
	name[0] = "Риордиан";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 30;
	flags = 0;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	aivar[AIV_EnemyOverride] = TRUE;
	b_setvisuals_riordianzombie();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itmi_adanosamulet,1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance PSI_ZOMBIE_01(Mst_Default_Zombie)
{
	name[0] = "Зомби-послушник";
	level = 10;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_psizombie01();
	Npc_SetToFistMode(self);
};

instance PSI_ZOMBIE_02(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби-послушник";
	level = 15;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_psizombie02();
	Npc_SetToFistMode(self);
};

instance PSI_ZOMBIE_03(Mst_Default_Zombie)
{
	name[0] = "Зомби-послушник";
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_psizombie03();
	Npc_SetToFistMode(self);
};

instance PSI_ZOMBIE_04(Mst_Default_Zombie)
{
	name[0] = "Зомби-послушник";
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_psizombie04();
	Npc_SetToFistMode(self);
};

instance PSI_ZOMBIE_05(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби-послушник";
	level = 15;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_psizombie05();
	Npc_SetToFistMode(self);
};

instance Zombie01(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 12;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
};

instance ZOMBIE01_NONEEXP(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie02(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_Trf(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie03(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 12;
	damagetype = DAM_EDGE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie03();
	Npc_SetToFightMode(self,ItMw_StoneHammer);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
};

instance Zombie04(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	level = 17;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie04();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
};

instance ZOMBIE1_SENDSENYAK(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 1;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ZOMBIE2_SENDSENYAK(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 1;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ZOMBIE3_SENDSENYAK(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 1;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie03();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ZOMBIE4_SENDSENYAK(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 1;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie04();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_Addon_Knecht(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 15;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_Thorus_Addon);
	Npc_SetToFistMode(self);
};

instance ZOMBIE_ADDON_GOMEZ(Mst_Default_Zombie)
{
	name[0] = "Труп Гомеза";
	level = 20;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 2000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Hum_Head_Bald",163,DEFAULT,itar_gomez_addon);
	Npc_SetToFistMode(self);
};

instance Pal_Zombie01(Mst_Default_Zombie)
{
	name[0] = "Зомби паладина";
	level = 22;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Pal_Zombie01();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Pal_Zombie02(Mst_Default_Zombie)
{
	name[0] = "Зомби паладина";
	level = 22;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Pal_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Pal_Zombie03(Mst_Default_Zombie)
{
	name[0] = "Зомби паладина";
	level = 22;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Pal_Zombie03();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Pal_Zombie04(Mst_Default_Zombie)
{
	name[0] = "Зомби паладина";
	level = 22;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Pal_Zombie04();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie01(Mst_Default_Zombie)
{
	name[0] = "Зомби воина";
	level = 18;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Maya_Zombie01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie02(Mst_Default_Zombie)
{
	name[0] = "Зомби воина";
	level = 18;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Maya_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie03(Mst_Default_Zombie)
{
	name[0] = "Зомби воина";
	level = 18;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Maya_Zombie03();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie04(Mst_Default_Zombie)
{
	name[0] = "Зомби воина";
	level = 18;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie04_Totenw(Mst_Default_Zombie)
{
	name[0] = "Зомби воина";
	level = 18;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

instance Summoned_ZOMBIE(Mst_Default_Zombie)
{
	name[0] = "Зомби-слуга";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SummonedZombie;
	level = 0;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

instance GOMEZWORKERSOUL_1(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 1;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_1();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_2(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 2;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_2();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_3(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 3;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_3();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_4(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 4;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_4();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_5(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 5;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_5();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_6(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 6;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_6();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_7(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 7;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_7();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_8(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 8;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_8();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_9(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 9;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_9();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_10(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 10;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_10();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_11(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 11;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_11();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_12(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 12;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_12();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_13(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 5;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_13();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_14(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 5;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_14();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance GOMEZWORKERSOUL_15(Mst_Default_Zombie)
{
	name[0] = "Призрак рудокопа";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_GOMEZ;
	level = 15;
	voice = 5;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	b_setvisuals_gomezworkersoul_15();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance NECROMACERZOMBIE(Mst_Default_Zombie)
{
	name[0] = "Мирагул";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 150;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 9000;
	attribute[ATR_HITPOINTS] = 9000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1500;
	protection[PROT_FIRE] = 220;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 320;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	CreateInvItems(self,itwr_death1,1);
	CreateInvItems(self,ItPl_DarkClover,1);
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	b_setvisuals_necromacerzombie();
	Npc_SetToFistMode(self);
};

instance NECROMACERDEMONZOMBIE(Mst_Default_Zombie)
{
	name[0] = "Зомби некроманта Нергала";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 60;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1500;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 320;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	b_setvisuals_necromacerzombie();
	CreateInvItems(self,itmi_nergalcorpse,1);
	Npc_SetToFistMode(self);
};

instance ZOMBIE_MOD(Mst_Default_Zombie)
{
	name[0] = "Зомби";
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Mummy()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,2,"Zom_Head",2,DEFAULT,-1);
};

instance Mummy(Mst_Default_Zombie)
{
	name[0] = "Мумия";
	level = 25;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Mummy();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_Mummy_01(Mst_Default_Zombie)
{
	name[0] = "Мумия";
	level = 25;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Mummy();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_Mummy_02(Mst_Default_Zombie)
{
	name[0] = "Мумия";
	level = 25;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Mummy();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_Mummy_03(Mst_Default_Zombie)
{
	name[0] = "Мумия";
	level = 25;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Mummy();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_Mummy_04(Mst_Default_Zombie)
{
	name[0] = "Мумия";
	level = 25;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Mummy();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Stalker()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,3,"Zom_Head",3,DEFAULT,-1);
};

func void B_SetVisuals_Arahar()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,3,"Zom_Head",3,DEFAULT,ItAr_Arahar);
};

instance Stalker(Mst_Default_Zombie)
{
	name[0] = "Ниоррет";
	level = 200;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 320;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 350;
	B_SetVisuals_Stalker();
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	Npc_SetToFistMode(self);
	Npc_SetToFightMode(self,ItMw_2H_Sword_M_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_HP_Normal,1);
};

instance DarkZhnez(Mst_Default_Zombie)
{
	name[0] = "Темный жнец";
	level = 150;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	damagetype = DAM_EDGE;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 400;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	Mdl_SetVisual(self,"BDMN.MDS");
	Mdl_SetVisualBody(self,"BDMN_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,Bdmn_vob);
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItKe_DarkZhnez,1);
	CreateInvItems(self,ItMi_Mutagen_Str_Low,1);
	CreateInvItems(self,ItMi_LMD_Mutagen,1);
};

instance Skeleton_Baron_Malbar(Npc_Default)
{
	name[0] = "Мальбар";
	guild = GIL_SKELETON;
	id = 3010;
	flags = 0;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	npcType = npctype_main;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	level = 100;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 50;
	aivar[AIV_IgnoresArmor] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	effect = "SPELLFX_MAGIC_SMOKE";
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_YBerion,BodyTex_RavenDemon,ITAR_MALBAR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_Malbar;
};

func void Rtn_Start_Malbar()
{
	TA_Stand_WP(9,0,21,0,"LOCATION_19_03_SECOND_ETAGE6");
	TA_Stand_WP(21,0,9,0,"LOCATION_19_03_SECOND_ETAGE6");
};

func void b_setvisuals_soul_01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_Souls,0,"Zom_Head",FaceBabe_B_RedLocks2,DEFAULT,ItAr_Sekbed_Slave);
};

func void b_setvisuals_soul_02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_Souls,0,"Zom_Head",FaceBabe_B_RedLocks2,DEFAULT,-1);
};

instance PrisonSoul01(Mst_Default_Zombie)
{
	name[0] = "Душа";
	level = 1;
	aivar[AIV_EnemyOverride] = TRUE;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	b_setvisuals_soul_01();
	effect = "SPELLFX_MOON_SMOKE";
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance PrisonSoul02(Mst_Default_Zombie)
{
	name[0] = "Душа";
	level = 1;
	aivar[AIV_EnemyOverride] = TRUE;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	b_setvisuals_soul_02();
	effect = "SPELLFX_MOON_SMOKE";
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

//------------эпик данж----------------------

instance AraharPlague(Mst_Default_Zombie)
{
	name[0] = "Арах'Ар Чумной";
	level = 200;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 320;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	B_SetVisuals_Arahar();
	Npc_SetToFistMode(self);
	Npc_SetToFightMode(self,ItMw_PlagueStaff);
	CreateInvItems(self,ItKe_Arahar,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_AraharPlague_01(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_AraharPlague_02(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_AraharPlague_03(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_AraharPlague_04(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Zombie_AraharPlague_05(Mst_Default_Zombie)
{
	name[0] = "Чумной зомби";
	vars[1] = TRUE;
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 70;
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

//-------------------эпик------------------------------

instance Zombie_LV(Mst_Default_Zombie)
{
	name[0] = "Древний зомби";
	level = 40;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 170;
	B_SetVisuals_Stalker();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
};