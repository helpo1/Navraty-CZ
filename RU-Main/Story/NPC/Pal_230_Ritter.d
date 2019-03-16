
instance Pal_230_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 230;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart22,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_230;
};

func void Rtn_Start_230()
{
	TA_Stand_Plaz(7,0,9,0,"PLAZ_04");
	TA_Practice_Sword(9,0,18,0,"NW_CITY_PALCAMP_14");
	TA_Stand_Plaz(18,0,20,0,"PLAZ_04");
	TA_Sleep(20,0,7,0,"SHIP_IN_06");
};

func void Rtn_ShipFree_230()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_08");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_08");
};

func void rtn_tot_230()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_01(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6680;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	Mdl_SetVisual(self,"HumanS.mds");
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6680;
};

func void Rtn_Start_6680()
{
	TA_Stand_WP(8,0,23,0,"CAD_ARI_FLUCHTTUNNEL_DUNGEON_ENTRANCE");
	TA_Stand_WP(23,0,8,0,"CAD_ARI_FLUCHTTUNNEL_DUNGEON_ENTRANCE");
};

func void rtn_tot_6680()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};


instance skeleton_knight_gw_02(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6681;
	voice = 18;
	flags = 0;
	level = 25;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6681;
};

func void Rtn_Start_6681()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_01");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_01");
};

func void rtn_tot_6681()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_03(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6682;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6682;
};

func void Rtn_Start_6682()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_02");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_02");
};

func void rtn_tot_6682()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_04(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6683;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6683;
};

func void Rtn_Start_6683()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_03");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_03");
};

func void rtn_tot_6683()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_05(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6684;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6684;
};

func void Rtn_Start_6684()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_04");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_04");
};

func void rtn_tot_6684()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_06(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6685;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6685;
};

func void Rtn_Start_6685()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_05");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_05");
};

func void rtn_tot_6685()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_07(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6686;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6686;
};

func void Rtn_Start_6686()
{
	TA_Stand_WP(8,0,23,0,"CAD_ARI_01");
	TA_Stand_WP(23,0,8,0,"CAD_ARI_01");
};

func void rtn_tot_6686()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_08(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6687;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6687;
};

func void Rtn_Start_6687()
{
	TA_Stand_WP(8,0,23,0,"CAD_ARI_02");
	TA_Stand_WP(23,0,8,0,"CAD_ARI_02");
};

func void rtn_tot_6687()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_09(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6688;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6688;
};

func void Rtn_Start_6688()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_06");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_06");
};

func void rtn_tot_6688()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_10(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6689;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6689;
};

func void Rtn_Start_6689()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_07");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_07");
};

func void rtn_tot_6689()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance skeleton_knight_gw_11(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_SKELETON;
	id = 6690;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,58);
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_6690;
};

func void Rtn_Start_6690()
{
	TA_Stand_WP(8,0,23,0,"GW_DUNGEON_09");
	TA_Stand_WP(23,0,8,0,"GW_DUNGEON_09");
};

func void rtn_tot_6690()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};