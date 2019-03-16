
instance STRF_8120_Addon_Gars(Npc_Default)
{
	name[0] = "Gars";
	guild = GIL_STRF;
	id = 8120;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_NoFightParker] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBald,BodyTex_P,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_8120;
};

func void Rtn_Start_8120()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8120");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8120");
};

func void Rtn_Meet_8120()
{
	TA_Stand_Guarding(8,0,23,0,"OM_LEVEL_02_BELIAR_04");
	TA_Stand_Guarding(23,0,8,0,"OM_LEVEL_02_BELIAR_04");
};

func void Rtn_Tot_8120()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8146_Hart(Npc_Default)
{
	name[0] = "Hart";
	guild = GIL_STRF;
	id = 8146;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,7);
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcAxe_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Scar,BodyTex_N,ITAR_ORC_L_HART);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,85);
	daily_routine = Rtn_Start_8146;
};

func void Rtn_Start_8146()
{
	TA_Practice_Sword(8,0,22,0,"ORC_CITY_HART");
	TA_Practice_Sword(22,0,8,0,"ORC_CITY_HART");
};

func void Rtn_Arena_8146()
{
	TA_Stand_Guarding(8,0,22,0,"ORC_CITY_ARENA_01");
	TA_Stand_Guarding(22,0,8,0,"ORC_CITY_ARENA_01");
};

func void Rtn_Tot_8146()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8147_Dagrag(Npc_Default)
{
	name[0] = CZ_NAME_Orc_Unique_Dagrag;
	guild = GIL_STRF;
	id = 8147;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,10);
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcAxe_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaScout",0,0,"Orc_HeadWarrior",8,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_8147;
};

func void Rtn_Start_8147()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_DAGRAG");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_DAGRAG");
};

func void Rtn_Arena_8147()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_ARENA_01");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_ARENA_01");
};

func void Rtn_Tot_8147()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8148_Gunnok(Npc_Default)
{
	name[0] = CZ_NAME_Orc_Unique_Gunnok;
	guild = GIL_STRF;
	id = 8148;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,11);
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_8148;
};

func void Rtn_Start_8148()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_GUNNOK");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_GUNNOK");
};

func void Rtn_Arena_8148()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_ARENA_01");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_ARENA_01");
};

func void Rtn_Tot_8148()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8149_Turuk(Npc_Default)
{
	name[0] = CZ_NAME_Orc_Unique_Turuk;
	guild = GIL_STRF;
	id = 8149;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,12);
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcAxe_04);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaTempl",0,0,"Orc_HeadWarrior",7,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_8149;
};

func void Rtn_Start_8149()
{
	TA_Practice_Sword(8,0,22,0,"ORC_CITY_TURUK");
	TA_Practice_Sword(22,0,8,0,"ORC_CITY_TURUK");
};

func void Rtn_Arena_8149()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_ARENA_01");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_ARENA_01");
};

func void Rtn_Tot_8149()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8150_UrTrok(Npc_Default)
{
	name[0] = CZ_NAME_Orc_Unique_Urtrok;
	guild = GIL_STRF;
	id = 8150;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,13);
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_01);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit1",DEFAULT,DEFAULT,"Orc_HeadWarrior",2,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_8150;
};

func void Rtn_Start_8150()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_URTROK");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_URTROK");
};

func void Rtn_Arena_8150()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_ARENA_01");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_ARENA_01");
};

func void Rtn_Tot_8150()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8151_Umrak(Npc_Default)
{
	name[0] = CZ_NAME_Orc_Unique_Umrak;
	guild = GIL_STRF;
	id = 8151;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,14);
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_8150;
};

func void Rtn_Start_8151()
{
	TA_Sit_Campfire_Orc(8,0,22,0,"ORC_CITY_UMRAK");
	TA_Sit_Campfire_Orc(22,0,8,0,"ORC_CITY_UMRAK");
};

func void Rtn_Arena_8151()
{
	TA_Stand_Guarding_Orc(8,0,22,0,"ORC_CITY_ARENA_01");
	TA_Stand_Guarding_Orc(22,0,8,0,"ORC_CITY_ARENA_01");
};

func void Rtn_Tot_8151()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_8152_UrTak(Npc_Default)
{
	name[0] = CZ_NAME_Orc_Unique_Urtak;
	guild = GIL_STRF;
	id = 8152;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_Gender] = MALE;
	B_SetAttributesToChapter(self,12);
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcAxe_04);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_8152;
};

func void Rtn_Start_8152()
{
	TA_Practice_Sword(8,0,22,0,"OM_LEVEL_02_TELEPORT");
	TA_Smoke_Pipe(22,0,8,0,"OM_LEVEL_02_TELEPORT");
};

func void Rtn_NearFight_8152()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_URTAK");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_URTAK");
};

func void Rtn_Elevator_8152()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_ELEVATOR_URTAK");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_ELEVATOR_URTAK");
};

func void Rtn_FollowHero_8152()
{
	TA_Follow_Player(8,0,22,0,"OM_ARENA_CENTER_03");
	TA_Follow_Player(22,0,8,0,"OM_ARENA_CENTER_03");
};

func void Rtn_Tot_8152()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//----------------orki UrTrala-------------------------------------

instance STRF_2153_Fighter(Npc_Default)
{
	name[0] = CZ_NAME_Orc_WarriorBlackElite;
	guild = GIL_STRF;
	id = 2153;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2153;
};

func void Rtn_Start_2153()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_01");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_01");
};

func void Rtn_Elevator_2153()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_ELEVATOR_01");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_ELEVATOR_01");
};

func void Rtn_FollowHero_2153()
{
	TA_Follow_Player(8,0,22,0,"OM_ARENA_CENTER_03");
	TA_Follow_Player(22,0,8,0,"OM_ARENA_CENTER_03");
};

func void Rtn_Tot_2153()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_2154_Fighter(Npc_Default)
{
	name[0] = CZ_NAME_Orc_WarriorBlackElite;
	guild = GIL_STRF;
	id = 2154;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2154;
};

func void Rtn_Start_2154()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_02");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_02");
};

func void Rtn_Elevator_2154()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_ELEVATOR_02");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_ELEVATOR_02");
};

func void Rtn_FollowHero_2154()
{
	TA_Follow_Player(8,0,22,0,"OM_ARENA_CENTER_03");
	TA_Follow_Player(22,0,8,0,"OM_ARENA_CENTER_03");
};

func void Rtn_Tot_2154()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_2155_Fighter(Npc_Default)
{
	name[0] = CZ_NAME_Orc_WarriorBlackElite;
	guild = GIL_STRF;
	id = 2155;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2155;
};

func void Rtn_Start_2155()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_03");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_03");
};

func void Rtn_Elevator_2155()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_ELEVATOR_03");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_ELEVATOR_03");
};

func void Rtn_FollowHero_2155()
{
	TA_Follow_Player(8,0,22,0,"OM_ARENA_CENTER_03");
	TA_Follow_Player(22,0,8,0,"OM_ARENA_CENTER_03");
};

func void Rtn_Tot_2155()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_2156_Fighter(Npc_Default)
{
	name[0] = CZ_NAME_Orc_WarriorBlackElite;
	guild = GIL_STRF;
	id = 2156;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2156;
};

func void Rtn_Start_2156()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_04");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_04");
};

func void Rtn_Elevator_2156()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_ELEVATOR_04");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_ELEVATOR_04");
};

func void Rtn_FollowHero_2156()
{
	TA_Follow_Player(8,0,22,0,"OM_ARENA_CENTER_03");
	TA_Follow_Player(22,0,8,0,"OM_ARENA_CENTER_03");
};

func void Rtn_Tot_2156()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance STRF_2157_Fighter(Npc_Default)
{
	name[0] = CZ_NAME_Orc_WarriorBlackEliteElder;
	guild = GIL_STRF;
	id = 2157;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,14);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_OrcSword_02);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2157;
};

func void Rtn_Start_2157()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_05");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_05");
};

func void Rtn_Elevator_2157()
{
	TA_Stand_WP(8,0,22,0,"ORCMINE_FIGHTER_ELEVATOR_05");
	TA_Stand_WP(22,0,8,0,"ORCMINE_FIGHTER_ELEVATOR_05");
};

func void Rtn_FollowHero_2157()
{
	TA_Follow_Player(8,0,22,0,"OM_ARENA_CENTER_03");
	TA_Follow_Player(22,0,8,0,"OM_ARENA_CENTER_03");
};

func void Rtn_Tot_2157()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//----------------------Ragnar-----------------------------------

instance STRF_8160_Ragnar(Npc_Default)
{
	name[0] = "Ragnar";
	guild = GIL_OUT;
	id = 8160;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal01,BodyTex_B,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	CreateInvItems(self,ItPl_UnWeed,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_8160;
};

func void Rtn_Start_8160()
{
	TA_Sit_Campfire(0,0,12,0,"NW_RAGNAR");
	TA_Sit_Campfire(12,0,0,0,"NW_RAGNAR");
};

func void Rtn_Pear_8160()
{
	TA_Stand_Eating(0,0,12,0,"NW_RAGNAR");
	TA_Stand_Eating(12,0,0,0,"NW_RAGNAR");
};

func void Rtn_SLDDead_8160()
{
	TA_Stand_WP(0,0,12,0,"NW_BIGFARM_ALLEE_01");
	TA_Stand_WP(12,0,0,0,"NW_BIGFARM_ALLEE_01");
};

func void Rtn_StandNOV_8160()
{
	TA_Pick_FP(8,0,21,0,"NW_MONSTERY_HERB_01");
	TA_Stand_Eating(21,0,8,0,"NW_MONASTERY_GRASS_05");
};

func void Rtn_Neoras_8160()
{
	TA_Read_Bookstand(7,0,10,0,"NW_MONASTERY_ALCHEMY_01_NEOR_01");
	TA_Study_WP(10,0,14,0,"NW_MONASTERY_ALCHEMY_01_NEOR_04");
	TA_Potion_Alchemy(14,0,18,0,"NW_MONASTERY_ALCHEMY_01_NEOR_04");
	TA_Read_Bookstand(18,0,22,0,"NW_MONASTERY_ALCHEMY_01_NEOR_01");
	TA_Sit_Throne(22,0,7,0,"NW_MONASTERY_ALCHEMY_01_NEOR_02");
};

func void Rtn_Pyrokar_8160()
{
	TA_Stand_WP(8,0,21,0,"NW_MONASTERY_CHURCH_04");
	TA_Stand_WP(21,0,8,0,"NW_MONASTERY_CHURCH_04");
};

func void Rtn_StandKDF_8160()
{
	TA_Stand_Guarding(8,0,21,0,"NW_MONASTERY_WTMG_01");
	TA_Stand_Guarding(21,0,8,0,"NW_MONASTERY_WTMG_01");
};

func void Rtn_StandMIL_8160()
{
	TA_Stand_Guarding(4,0,21,0,"NW_CITY_HABOUR_HUT_03_IN_02");
	TA_WacheFackel(21,0,4,0,"NW_CITY_HABOUR_HUT_03_IN_02");
};
func void Rtn_StandMILH_8160()
{
	TA_Stand_Guarding(0,0,12,0,"NW_CITY_UPTOWN_PATH_16");
	TA_Stand_Guarding(12,0,0,0,"NW_CITY_UPTOWN_PATH_16");
};

func void Rtn_StandSLD_8160()
{
	TA_Stand_Drinking(8,0,20,0,"NW_BIGFARM_PATH_BIFF_01");
	TA_Sit_Bench(20,0,8,0,"NW_BIGFARM_RUDAR_2");
};

func void Rtn_Tot_8160()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//----------------------Nort-----------------------------------

instance NDW_8161_Nort(Npc_Default)
{
	name[0] = "Nort";
	guild = GIL_OUT;
	id = 8161;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal01,BodyTex_B,ITAR_NDW_L);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_8161;
};

func void Rtn_Start_8161()
{
	TA_Stand_Eating(0,0,12,0,"ADW_ENTRANCE_PLATEAU_15");
	TA_Stand_Eating(12,0,0,0,"ADW_ENTRANCE_PLATEAU_15");
};

func void Rtn_FollowPir_8161()
{
	TA_Follow_Player(8,0,22,0,"ADW_PIRATECAMP_WAY_03");
	TA_Follow_Player(22,0,8,0,"ADW_PIRATECAMP_WAY_03");
};

func void Rtn_PirateCamp_8161()
{
	TA_Study_WP(0,0,12,0,"ADW_PIRATECAMP_BEACH_21");
	TA_Study_WP(12,0,0,0,"ADW_PIRATECAMP_BEACH_21");
};

func void Rtn_Tot_8161()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};


//----------------------Bandity Ragnara--------------------------------------------------------------

instance BDT_10046_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10046;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Addon_BanditTrader);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mud,BodyTex_N,ITAR_BDT_V);
	Mdl_SetModelFatness(self,1);
	CreateInvItems(self,ItWr_RagnarBand,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10046;
};

func void Rtn_Start_10046()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_FARM1_CITYWALL_RIGHT_04");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_FARM1_CITYWALL_RIGHT_04");
};

func void Rtn_Tot_10046()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance BDT_10047_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10047;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Addon_BanditTrader);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Cipher_neu,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10047;
};

func void Rtn_Start_10047()
{
	TA_Sit_Campfire(0,0,12,0,"NW_FARM1_CITYWALL_RIGHT_04");
	TA_Sit_Campfire(12,0,0,0,"NW_FARM1_CITYWALL_RIGHT_04");
};

func void Rtn_Tot_10047()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};


instance BDT_10048_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10048;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Addon_BanditTrader);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Pacho,BodyTex_B,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10048;
};


func void Rtn_Start_10048()
{
	TA_Sit_Campfire(0,0,12,0,"NW_FARM1_CITYWALL_RIGHT_04");
	TA_Sit_Campfire(12,0,0,0,"NW_FARM1_CITYWALL_RIGHT_04");
};

func void Rtn_Tot_10048()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

