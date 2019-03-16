
instance BDT_10401_Addon_DeadBandit(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 10401;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	level = 20;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	CreateInvItems(self,ItMi_ChaliceGold,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart01,BodyTex_P,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_10401;
};


func void Rtn_Start_10401()
{
	TA_Stand_WP(8,0,16,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	TA_Stand_WP(16,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
};


instance BDT_DARONGIVEGOLD_MIS_1(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 104101;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	level = 20;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	EquipItem(self,ItAr_BDT_M);
	CreateInvItems(self,ItMi_ChaliceGold,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal16,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_104101;
};


func void rtn_start_104101()
{
	TA_Stand_WP(8,0,16,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_WP(16,0,8,0,"NW_MONASTERY_BRIDGE_01");
};


instance BDT_DARONGIVEGOLD_MIS_2(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 104201;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	level = 20;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItAr_BDT_M);
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_ChaliceGold,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Erpresser,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_104201;
};


func void rtn_start_104201()
{
	TA_Stand_WP(8,0,16,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_WP(16,0,8,0,"NW_MONASTERY_BRIDGE_01");
};


instance BDT_DARONGIVEGOLD_MIS_3(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 104301;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	level = 20;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_ChaliceGold,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	EquipItem(self,ItAr_BDT_M);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough02,BodyTex_L,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_104301;
};


func void rtn_start_104301()
{
	TA_Stand_WP(8,0,16,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_WP(16,0,8,0,"NW_MONASTERY_BRIDGE_01");
};


instance BDT_DARONGIVEGOLD_MIS_4(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 104401;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	level = 20;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_ChaliceGold,1);
	EquipItem(self,ItAr_BDT_M);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart01,BodyTex_P,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_104401;
};


func void rtn_start_104401()
{
	TA_Stand_WP(8,0,16,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_WP(16,0,8,0,"NW_MONASTERY_BRIDGE_01");
};


instance BDT_DARONGIVEGOLD_MIS_5(Npc_Default)
{
	name[0] = "Bandita";
	guild = GIL_BDT;
	id = 104501;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	level = 20;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItAr_BDT_M);
	CreateInvItems(self,ItMi_ChaliceGold,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_104501;
};


func void rtn_start_104501()
{
	TA_Stand_WP(8,0,16,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_WP(16,0,8,0,"NW_MONASTERY_BRIDGE_01");
};

