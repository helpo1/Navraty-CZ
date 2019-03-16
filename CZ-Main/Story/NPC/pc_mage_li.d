
instance PC_MAGE_LI(Npc_Default)
{
	name[0] = "Milten";
	guild = GIL_KDF;
	id = 8055;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8055;
};


func void rtn_start_8055()
{
	TA_Study_WP(8,0,23,0,"LI_MAN_03");
	TA_Stand_Guarding(23,0,8,0,"LI_MAN_03");
};

func void rtn_cave_8055()
{
	TA_Stand_Guarding(8,0,23,0,"DEM_CAVE_01");
	TA_Stand_Guarding(23,0,8,0,"DEM_CAVE_01");
};

func void rtn_follow_8055()
{
	TA_Follow_Player(8,0,23,0,"DEM_CAVE_01");
	TA_Follow_Player(23,0,8,0,"DEM_CAVE_01");
};

func void rtn_runaway_8055()
{
	TA_Study_WP(8,0,23,0,"SHIP_CREW_19");
	TA_Study_WP(23,0,8,0,"SHIP_CREW_19");
};

