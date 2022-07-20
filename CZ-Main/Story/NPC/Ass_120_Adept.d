
instance Ass_120_Adept(Npc_Default)
{
	name[0] = NAME_AssAdeptWound;
	guild = GIL_BDT;
	id = 120;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_01,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_120;
};

func void Rtn_Start_120()
{
	TA_Sit_Campfire(0,0,12,0,"NW_FOREST_VINOSKELLEREI_01");
	TA_Sit_Campfire(12,0,0,0,"NW_FOREST_VINOSKELLEREI_01");
};

func void Rtn_Tot_120()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};


instance Ass_121_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 121;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	CreateInvItems(self,ItAm_MasiafKey,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_121;
};

func void Rtn_Start_121()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_FOREST_ASS_ATTACK_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_FOREST_ASS_ATTACK_01");
};

func void Rtn_Tot_121()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};


instance Ass_122_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 122;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_122;
};

func void Rtn_Start_122()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_FOREST_ASS_ATTACK_02");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_FOREST_ASS_ATTACK_02");
};

func void Rtn_Tot_122()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_123_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 123;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_123;
};

func void Rtn_Start_123()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_FOREST_ASS_ATTACK_03");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_FOREST_ASS_ATTACK_03");
};

func void Rtn_Tot_123()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_124_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 124;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_124;
};

func void Rtn_Start_124()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_FOREST_ASS_ATTACK_04");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_FOREST_ASS_ATTACK_04");
};

func void Rtn_Tot_124()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_125_Tiamant(Npc_Default)
{
	name[0] = "Tiamant Krvavý, převor Masyafu";
	guild = GIL_BDT;
	id = 125;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,7);
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_MASIAF_TIAMANT);
	EquipItem(self,ITMW_FAKESWORD_01);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Prior_Rage,BodyTex_L,ITAR_ASSASINS_02_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_125;
};

func void Rtn_Start_125()
{
	TA_Stand_Guarding(10,0,21,0,"PW_TIAMANT");
	TA_Practice_Sword(21,0,22,0,"PW_HANIAR_ACOLYATS");
	TA_Smoke_Joint(22,0,23,0,"PW_TEMPLE_HANIAR_SMOKE");
	TA_Stand_Eating(23,0,0,0,"PW_HANIAR_EAT");
	TA_Sit_Throne(0,0,10,0,"PW_TIAMANT");
};

func void Rtn_MasiafRitual_125()
{
	TA_Stand_Dementor(0,0,12,0,"PW_TIAMANT_RITUAL");
	TA_Stand_Dementor(12,0,0,0,"PW_TIAMANT_RITUAL");
};

func void Rtn_DeathMatch_125()
{
	TA_Stand_Guarding(0,0,12,0,"PW_TIAMANT_DEATHMATCH");
	TA_Stand_Guarding(12,0,0,0,"PW_TIAMANT_DEATHMATCH");
};

func void Rtn_Battle_125()
{
	TA_Smalltalk_DeathMatch(0,0,12,0,"PW_TIAMANT_DEATHMATCH");
	TA_Smalltalk_DeathMatch(12,0,0,0,"PW_TIAMANT_DEATHMATCH");
};

func void Rtn_Tot_125()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_126_Haniar(Npc_Default)
{
	name[0] = "Haniar Slepý, převor Masyafu";
	guild = GIL_BDT;
	id = 126;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,7);
	attribute[ATR_STRENGTH] = 900;
	aivar[REAL_STRENGTH] = 900;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_MASIAF_HANIAR);
	EquipItem(self,ITMW_FAKESWORD_01);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Prior_Blind,BodyTex_L,ITAR_ASSASINS_02_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_126;
};

func void Rtn_Start_126()
{
	TA_Smoke_Joint(9,0,10,0,"PW_TEMPLE_HANIAR_SMOKE");
	TA_Preach_Haniar(10,0,20,0,"PW_HANIAR");
	TA_Stand_Eating(20,0,21,0,"PW_HANIAR_EAT");
	TA_Smoke_Joint(21,0,22,0,"PW_TEMPLE_HANIAR_SMOKE");
	TA_Sit_Throne(22,0,9,0,"PW_HANIAR_THRONE");
};

func void Rtn_LetterWrite_126()
{
	TA_Study_WP(10,0,20,0,"PW_HANIAR");
	TA_Study_WP(20,0,21,0,"PW_HANIAR");
	TA_Study_WP(21,0,9,0,"PW_HANIAR");
	TA_Study_WP(9,0,10,0,"PW_HANIAR");
};

func void Rtn_HideMeet_126()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_HANIAR_HIDE");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_HANIAR_HIDE");
};

func void Rtn_MasiafRitual_126()
{
	TA_Stand_Dementor(0,0,12,0,"PW_HANIAR_RITUAL");
	TA_Stand_Dementor(12,0,0,0,"PW_HANIAR_RITUAL");
};

func void Rtn_DeathMatch_126()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_HANIAR_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_HANIAR_DEATHMATCH");
};

func void Rtn_Battle_126()
{
	TA_Smalltalk_DeathMatch(0,0,12,0,"PW_HANIAR_DEATHMATCH");
	TA_Smalltalk_DeathMatch(12,0,0,0,"PW_HANIAR_DEATHMATCH");
};

func void Rtn_TrueBattle_126()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_DEATHMATCH");
};

func void Rtn_TOT_126()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"TOT");
	TA_Stand_ArmsCrossed(12,0,0,0,"TOT");
};

func void Rtn_OsairMeet_126()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_HANIAR_MEET");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_HANIAR_MEET");
};

instance Ass_127_Osair(Npc_Default)
{
	name[0] = "Osair Bezcitný, převor Masyafu";
	guild = GIL_BDT;
	id = 127;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,7);
	attribute[ATR_STRENGTH] = 750;
	aivar[REAL_STRENGTH] = 750;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_MASIAF_OSAIR);
	EquipItem(self,ITMW_FAKESWORD_01);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Prior_Rock,BodyTex_B,ITAR_ASSASINS_02_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	CreateInvItems(self,ItWr_MoonBladesRezept,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_127;
};

func void Rtn_Start_127()
{
	TA_Sit_Throne(0,0,12,0,"PW_OSAIR");
	TA_Sit_Throne(12,0,0,0,"PW_OSAIR");
};

func void Rtn_DeathMatch_127()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_DEATHMATCH");
};

func void Rtn_MasiafRitual_127()
{
	TA_Stand_Dementor(0,0,12,0,"PW_OSAIR_RITUAL");
	TA_Stand_Dementor(12,0,0,0,"PW_OSAIR_RITUAL");
};

func void Rtn_GotoHram_127()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_ROADTOHRAM_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_ROADTOHRAM_01");
};

func void Rtn_OsairMeet_127()
{
	TA_Smalltalk(0,0,12,0,"PW_OSAIR_MEET");
	TA_Smalltalk(12,0,0,0,"PW_OSAIR_MEET");
};

func void Rtn_Tot_127()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_128_Nrozas(Npc_Default)
{
	name[0] = "Nrozas Zmije, převor Masyafu";
	guild = GIL_BDT;
	id = 128;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,7);
	attribute[ATR_STRENGTH] = 750;
	aivar[REAL_STRENGTH] = 750;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_MASIAF_NROZAS);
	EquipItem(self,ITMW_FAKESWORD_01);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Prior_Poison,BodyTex_B,ITAR_ASSASINS_02_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	CreateInvItems(self,ItWr_Unpoison,1);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_128;
};

func void Rtn_Start_128()
{
	TA_Potion_Alchemy(9,0,12,0,"PW_NROZAS");
	TA_Study_WP(12,0,15,0,"PW_NROZAS_OUT");
	TA_Potion_Alchemy(15,0,18,0,"PW_NROZAS");
	TA_Study_WP(18,0,21,0,"PW_NROZAS_OUT");
	TA_Potion_Alchemy(21,0,23,0,"PW_NROZAS");
	TA_Sit_Throne(23,0,9,0,"PW_NROZAS_SIT");
};

func void Rtn_MasiafRitual_128()
{
	TA_Stand_Dementor(0,0,12,0,"PW_NROZAS_RITUAL");
	TA_Stand_Dementor(12,0,0,0,"PW_NROZAS_RITUAL");
};

func void Rtn_DeathMatch_128()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_NROZAS_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_NROZAS_DEATHMATCH");
};

func void Rtn_TrueBattle_128()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_HANIAR_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_HANIAR_DEATHMATCH");
};

func void Rtn_WineDrink_128()
{
	TA_Stand_Drinking(0,0,12,0,"PW_NROZAS_OUT");
	TA_Stand_Drinking(12,0,0,0,"PW_NROZAS_OUT");
};

func void Rtn_TOT_128()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"TOT");
	TA_Stand_ArmsCrossed(12,0,0,0,"TOT");
};

instance Ass_129_DeadNrozas(Npc_Default)
{
	name[0] = "Prokletý převor Masyafu";
	guild = GIL_DMT;
	id = 129;
	voice = 19;
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,556);
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_MASIAF_NROZAS);
	EquipItem(self,ITMW_FAKESWORD_01);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_YBerion,BodyTex_B,ITAR_ASSASINS_DEAD);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_129;
};

func void Rtn_Start_129()
{
	TA_Potion_Alchemy(9,0,12,0,"PW_INNER_DEMON_SPAWN_ALCH_01");
	TA_Potion_Alchemy(12,0,15,0,"PW_INNER_DEMON_SPAWN_ALCH_02");
	TA_Potion_Alchemy(15,0,18,0,"PW_INNER_DEMON_SPAWN_ALCH_01");
	TA_Potion_Alchemy(18,0,21,0,"PW_INNER_DEMON_SPAWN_ALCH_02");
	TA_Potion_Alchemy(21,0,23,0,"PW_INNER_DEMON_SPAWN_ALCH_01");
	TA_Potion_Alchemy(23,0,9,0,"PW_INNER_DEMON_SPAWN_ALCH_02");
};

func void Rtn_Tot_129()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_130_CorGalomDemon(Npc_Default)
{
	name[0] = "Cor Kalom";
	guild = GIL_DMT;
	id = 130;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[90] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,8);
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Prior_CorGalomDemon,BodyTex_Prior_KorGalomDemon,ITAR_ASSASINS_CORGALOM);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	CreateInvItems(self,ItKe_CorGalom,1);
	CreateInvItems(self,ItMi_DragonStaffPiece_04,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_130;
};

func void Rtn_Start_130()
{
	TA_Practice_Magic(0,0,12,0,"PW_INNER_TEMPLE_BOSS_MAIN");
	TA_Practice_Magic(12,0,0,0,"PW_INNER_TEMPLE_BOSS_MAIN");
};

func void Rtn_Tot_130()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_131_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 131;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_131;
};

func void Rtn_Start_131()
{
	TA_Stand_Guarding(0,0,12,0,"PW_TEMPLE_GUARD_01");
	TA_Stand_Guarding(12,0,0,0,"PW_TEMPLE_GUARD_01");
};

func void Rtn_Tot_131()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_132_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 132;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_132;
};

func void Rtn_Start_132()
{
	TA_Stand_Guarding(4,0,21,0,"PW_TEMPLE_GUARD_02");
	TA_WacheFackel(21,0,4,0,"PW_TEMPLE_GUARD_02");
};

func void Rtn_Tot_132()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//------------Okhrana Osaira

instance Ass_133_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 133;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_133;
};

func void Rtn_Start_133()
{
	TA_Stand_Guarding(0,0,12,0,"PW_GROT_PRISION_OSAIR_GUARD_01");
	TA_Stand_Guarding(12,0,0,0,"PW_GROT_PRISION_OSAIR_GUARD_01");
};

func void Rtn_GotoHram_133()
{
	TA_Stand_Guarding(0,0,12,0,"PW_OSAIR_ROADTOHRAM_GUARD_01");
	TA_Stand_Guarding(12,0,0,0,"PW_OSAIR_ROADTOHRAM_GUARD_01");
};

func void Rtn_Tot_133()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_134_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 134;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_134;
};

func void Rtn_Start_134()
{
	TA_WacheFackel(4,0,21,0,"PW_GROT_PRISION_OSAIR_GUARD_02");
	TA_WacheFackel(21,0,4,0,"PW_GROT_PRISION_OSAIR_GUARD_02");
};

func void Rtn_GotoHram_134()
{
	TA_Stand_Guarding(0,0,12,0,"PW_OSAIR_ROADTOHRAM_GUARD_02");
	TA_Stand_Guarding(12,0,0,0,"PW_OSAIR_ROADTOHRAM_GUARD_02");
};

func void Rtn_Tot_134()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_135_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 135;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_135;
};

func void Rtn_Start_135()
{
	TA_Stand_Guarding(0,0,12,0,"PW_GROT_PRISION_OSAIR_GUARD_03");
	TA_Stand_Guarding(12,0,0,0,"PW_GROT_PRISION_OSAIR_GUARD_03");
};

func void Rtn_Tot_135()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_136_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 136;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_136;
};

func void Rtn_Start_136()
{
	TA_Stand_Guarding(0,0,12,0,"PW_GROT_PRISION_OSAIR_GUARD_04");
	TA_Stand_Guarding(12,0,0,0,"PW_GROT_PRISION_OSAIR_GUARD_04");
};

func void Rtn_Tot_136()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_137_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 137;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_137;
};

func void Rtn_Start_137()
{
	TA_WacheFackel(4,0,21,0,"PW_GROT_PRISION_GUARDIAN");
	TA_WacheFackel(21,0,4,0,"PW_GROT_PRISION_GUARDIAN");
};

func void Rtn_Tot_137()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//-----------------------Khram Masiaf----------------------------------------


instance Ass_138_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 138;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_138;
};

func void Rtn_Start_138()
{
	TA_Sit_Campfire(10,0,20,0,"PW_HANIAR_ACOLYATS_01");
	TA_Study_WP(20,0,10,0,"PW_HANIAR_ACOLYATS_01_OUT");
};

func void Rtn_Ritual_138()
{
	TA_Study_WP(10,0,20,0,"PW_HANIAR_ACOLYATS_01_OUT");
	TA_Study_WP(20,0,10,0,"PW_HANIAR_ACOLYATS_01_OUT");
};

func void Rtn_DeathMatch_138()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_138_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_138_DEATHMATCH");
};

func void Rtn_Tot_138()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_139_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 139;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_139;
};

func void Rtn_Start_139()
{
	TA_Stand_Guarding(10,0,20,0,"PW_HANIAR_ACOLYATS_02");
	TA_Smalltalk(20,0,10,0,"PW_HANIAR_ACOLYATS_02_OUT");
};

func void Rtn_Ritual_139()
{
	TA_Smalltalk(10,0,20,0,"PW_HANIAR_ACOLYATS_02_OUT");
	TA_Smalltalk(20,0,10,0,"PW_HANIAR_ACOLYATS_02_OUT");
};

func void Rtn_DeathMatch_139()
{
	TA_Stand_Guarding(0,0,12,0,"PW_139_DEATHMATCH");
	TA_Stand_Guarding(12,0,0,0,"PW_139_DEATHMATCH");
};

func void Rtn_Tot_139()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_140_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 140;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	EquipItem(self,ItRw_Arabic_Bow);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_140;
};

func void Rtn_Start_140()
{
	TA_Stand_WP(10,0,20,0,"PW_HANIAR_ACOLYATS_03");
	TA_Study_WP(20,0,10,0,"PW_TEMPLE_700");
};

func void Rtn_Ritual_140()
{
	TA_Study_WP(10,0,20,0,"PW_TEMPLE_700");
	TA_Study_WP(20,0,10,0,"PW_TEMPLE_700");
};

func void Rtn_DeathMatch_140()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_140_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_140_DEATHMATCH");
};

func void Rtn_Tot_140()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_141_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 141;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_141;
};

func void Rtn_Start_141()
{
	TA_Sit_Campfire(10,2,20,2,"PW_HANIAR_ACOLYATS_04");
	TA_Smalltalk(20,2,10,2,"PW_HANIAR_ACOLYATS_04_OUT");
};

func void Rtn_Ritual_141()
{
	TA_Smalltalk(10,2,20,2,"PW_HANIAR_ACOLYATS_04_OUT");
	TA_Smalltalk(20,2,10,2,"PW_HANIAR_ACOLYATS_04_OUT");
};

func void Rtn_DeathMatch_141()
{
	TA_Stand_Guarding(0,0,12,0,"PW_141_DEATHMATCH");
	TA_Stand_Guarding(12,0,0,0,"PW_141_DEATHMATCH");
};

func void Rtn_Tot_141()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};


instance Ass_142_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 142;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_142;
};

func void Rtn_Start_142()
{
	TA_Study_WP(0,0,12,0,"PW_TEMPLE_25");
	TA_Study_WP(12,0,0,0,"PW_TEMPLE_25");
};

func void Rtn_Tot_142()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_143_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 143;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_143;
};

func void Rtn_Start_143()
{
	TA_Pray_Sleeper_FP(0,0,12,0,"PW_TEMPLE_26");
	TA_Pray_Sleeper_FP(12,0,0,0,"PW_TEMPLE_26");
};

func void Rtn_Tot_143()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_144_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 144;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_144;
};

func void Rtn_Start_144()
{
	TA_Smoke_Waterpipe(0,0,12,0,"PW_TEMPLE_17");
	TA_Smoke_Waterpipe(12,0,0,0,"PW_TEMPLE_17");
};

func void Rtn_DeathMatch_144()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_144_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_144_DEATHMATCH");
};

func void Rtn_Tot_144()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_145_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 145;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_145;
};

func void Rtn_Start_145()
{
	TA_Smoke_Waterpipe(0,0,12,0,"PW_TEMPLE_18");
	TA_Smoke_Waterpipe(12,0,0,0,"PW_TEMPLE_18");
};

func void Rtn_DeathMatch_145()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_145_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_145_DEATHMATCH");
};

func void Rtn_Tot_145()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_146_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 146;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_146;
};

func void Rtn_Start_146()
{
	TA_Smoke_Joint(0,0,12,0,"PW_TEMPLE_19");
	TA_Smoke_Joint(12,0,0,0,"PW_TEMPLE_19");
};

func void Rtn_DeathMatch_146()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_146_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_146_DEATHMATCH");
};

func void Rtn_Tot_146()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_147_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 147;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_147;
};

func void Rtn_Start_147()
{
	TA_Stand_Eating(0,0,12,0,"PW_TEMPLE_20");
	TA_Stand_Drinking(12,0,0,0,"PW_TEMPLE_20");
};

func void Rtn_DeathMatch_147()
{
	TA_Stand_Guarding(0,0,12,0,"PW_147_DEATHMATCH");
	TA_Stand_Guarding(12,0,0,0,"PW_147_DEATHMATCH");
};

func void Rtn_Tot_147()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_148_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 148;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_148;
};

func void Rtn_Start_148()
{
	TA_Smalltalk(0,0,12,0,"PW_TEMPLE_30");
	TA_Smalltalk(12,0,0,0,"PW_TEMPLE_30");
};

func void Rtn_DeathMatch_148()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_148_DEATHMATCH");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_148_DEATHMATCH");
};

func void Rtn_Tot_148()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_149_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 149;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_149;
};

func void Rtn_Start_149()
{
	TA_Smalltalk(0,0,12,0,"PW_TEMPLE_31");
	TA_Smalltalk(12,0,0,0,"PW_TEMPLE_31");
};

func void Rtn_DeathMatch_149()
{
	TA_Stand_Guarding(0,0,12,0,"PW_149_DEATHMATCH");
	TA_Stand_Guarding(12,0,0,0,"PW_149_DEATHMATCH");
};

func void Rtn_Tot_149()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_150_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 150;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_150;
};

func void Rtn_Start_150()
{
	TA_Practice_Sword(6,0,22,0,"PW_TEMPLE_10");
	TA_Study_WP(22,0,6,0,"PW_TEMPLE_10");
};

func void Rtn_Tot_150()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_151_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 151;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_151;
};

func void Rtn_Start_151()
{
	TA_Practice_Sword(6,0,22,0,"PW_TEMPLE_14");
	TA_Study_WP(22,0,6,0,"PW_TEMPLE_14");
};

func void Rtn_Tot_151()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_152_Adept(Npc_Default)
{
	name[0] = "Stín Masyafu";
	guild = GIL_BDT;
	id = 152;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_152;
};

func void Rtn_Start_152()
{
	TA_Stand_Guarding(4,0,21,0,"PW_TEMPLE_WATCHER");
	TA_WacheFackel(21,0,4,0,"PW_TEMPLE_WATCHER");
};

func void Rtn_Tot_152()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//---------------------Gonsales----------------------


instance NONE_1190_Assasin(Npc_Default)
{
	name[0] = "Gonzales";
	guild = GIL_VLK;
	id = 1190;
	voice = 13;
	flags = 0;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,55);
	attribute[ATR_STRENGTH] = 500;
	aivar[REAL_STRENGTH] = 500;
	attribute[ATR_HITPOINTS] = 9000;
	attribute[ATR_HITPOINTS_MAX] = 9000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_KATANA);
	EquipItem(self,ITRW_G3_SILENTDEATH_BOW_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Assasin,BodyTex_Assasin,ITAR_GONSALES);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1190;
};

func void Rtn_Start_1190()
{
	TA_Sit_Campfire(8,0,20,0,"PW_GONSALES");
	TA_Sit_Campfire(20,0,8,0,"PW_GONSALES");
};

func void Rtn_FollowMasiafTemple_1190()
{
	TA_Follow_Player(8,0,20,0,"PW_TEMPLE_HASIM_TEMP");
	TA_Follow_Player(20,0,8,0,"PW_TEMPLE_HASIM_TEMP");
};

func void Rtn_InTemple_1190()
{
	TA_Sit_Throne(8,0,20,0,"PW_HANIAR_THRONE");
	TA_Sit_Throne(20,0,8,0,"PW_HANIAR_THRONE");
};

func void Rtn_TOT_1190()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void Rtn_Temple_1190()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"PW_TEMPLE_GONSALES");
	TA_Stand_ArmsCrossed(20,0,8,0,"PW_TEMPLE_GONSALES");
};

func void Rtn_FollowOsairKill_1190()
{
	TA_Guide_Player(8,0,20,0,"PW_OSAIR_ROADTOHRAM_01");
	TA_Guide_Player(20,0,8,0,"PW_OSAIR_ROADTOHRAM_01");
};

func void Rtn_MasiafTempleWait_1190()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"PW_TEMPLE_WAIT_GONSALES");
	TA_Stand_ArmsCrossed(20,0,8,0,"PW_TEMPLE_WAIT_GONSALES");
};

func void Rtn_FollowHideMeet_1190()
{
	TA_Guide_Player(8,0,20,0,"PW_GOLD_CAVEORE_TEMP_06");
	TA_Guide_Player(20,0,8,0,"PW_GOLD_CAVEORE_TEMP_06");
};

func void Rtn_MeetHaniar_1190()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_MEET");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_MEET");
};


//------------------Raby poslushniki


instance SEK_153_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 153;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_1,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_153;
};


func void rtn_start_153()
{
	TA_Sit_Campfire(5,0,24,0,"PW_GROT_PRISION_SLAVE_01");
	TA_Sit_Campfire(24,0,5,0,"PW_GROT_PRISION_SLAVE_01");
};

func void Rtn_Tot_153()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_154_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 154;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_2,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_154;
};


func void rtn_start_154()
{
	TA_Sit_Campfire(5,0,24,0,"PW_GROT_PRISION_SLAVE_02");
	TA_Sit_Campfire(24,0,5,0,"PW_GROT_PRISION_SLAVE_02");
};

func void Rtn_Tot_154()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_155_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 155;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_3,BodyTex_B,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_155;
};


func void rtn_start_155()
{
	TA_Stand_WP(5,0,24,0,"PW_GROT_PRISION_SLAVE_03");
	TA_Stand_WP(24,0,5,0,"PW_GROT_PRISION_SLAVE_03");
};

func void Rtn_Tot_155()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_156_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 156;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_4,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_156;
};


func void rtn_start_156()
{
	TA_Sit_Campfire(8,0,21,0,"PW_GROT_PRISION_SLAVE_04");
	TA_Sit_Campfire(21,0,8,0,"PW_GROT_PRISION_SLAVE_04");
};

func void Rtn_FollowMe_156()
{
	TA_Follow_Player(8,0,20,0,"PW_OSAIR");
	TA_Follow_Player(20,0,8,0,"PW_OSAIR");
};

func void Rtn_OsairReady_156()
{
	TA_Stand_WP(8,0,20,0,"PW_OSAIR_BETRAY");
	TA_Stand_WP(20,0,8,0,"PW_OSAIR_BETRAY");
};

func void Rtn_Tot_156()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_157_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 157;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_157;
};


func void rtn_start_157()
{
	TA_Stand_WP(8,0,21,0,"PW_GROT_PRISION_SLAVE_05");
	TA_Stand_WP(21,0,8,0,"PW_GROT_PRISION_SLAVE_05");
};

func void Rtn_Tot_157()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_158_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 158;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_158;
};


func void rtn_start_158()
{
	TA_Stand_WP(8,0,21,0,"PW_GROT_PRISION_SLAVE_06");
	TA_Stand_WP(21,0,8,0,"PW_GROT_PRISION_SLAVE_06");
};

func void Rtn_Tot_158()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_159_SLAVEOBSSEK(Npc_Default)
{
	name[0] = "";
	guild = GIL_STRF;
	id = 159;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_159;
};


func void rtn_start_159()
{
	TA_Stand_WP(8,0,21,0,"PW_TEMPLE_PIT_01");
	TA_Stand_WP(21,0,8,0,"PW_TEMPLE_PIT_01");
};

func void Rtn_Tot_159()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_160_SLAVEOBSSEK(Npc_Default)
{
	name[0] = "";
	guild = GIL_STRF;
	id = 160;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_160;
};

func void rtn_start_160()
{
	TA_Stand_WP(8,0,21,0,"PW_TEMPLE_PIT_02");
	TA_Stand_WP(21,0,8,0,"PW_TEMPLE_PIT_02");
};

func void Rtn_Tot_160()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//---------------Poslushniki Masiafa-------------------------


instance Ass_161_Adept(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 161;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_161;
};

func void Rtn_Start_161()
{
	TA_Stand_Sweeping(0,0,12,0,"PW_TEMPLE_AKO_01");
	TA_Smoke_Joint(12,0,0,0,"PW_TEMPLE_AKO_03");
};

func void Rtn_Tot_161()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_162_Adept(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 162;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_162;
};

func void Rtn_Start_162()
{
	TA_Smoke_Joint(0,0,12,0,"PW_TEMPLE_AKO_03");
	TA_Stand_Sweeping(12,0,0,0,"PW_TEMPLE_AKO_02");
};

func void Rtn_Tot_162()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_163_Adept(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 163;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_163;
};

func void Rtn_Start_163()
{
	TA_Study_WP(0,0,12,0,"PW_TEMPLE_AKO_04");
	TA_Study_WP(12,0,0,0,"PW_TEMPLE_AKO_04");
};

func void Rtn_Tot_163()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_164_Adept(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 164;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_164;
};

func void Rtn_Start_164()
{
	TA_Stand_Sweeping(8,0,20,0,"PW_TEMPLE_AKO_05");
	TA_Smoke_Joint(20,0,8,0,"PW_TEMPLE_AKO_05");
};

func void Rtn_Tot_164()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_165_Adept(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 165;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_165;
};
func void Rtn_Start_165()
{
	TA_Stand_Eating(0,0,12,0,"PW_TEMPLE_AKO_06");
	TA_Stand_Eating(12,0,0,0,"PW_TEMPLE_AKO_06");
};

func void Rtn_Tot_165()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_166_Adept(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 166;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_166;
};

func void Rtn_Start_166()
{
	TA_Stand_Guarding(0,0,12,0,"PW_TEMPLE_27");
	TA_Stand_Guarding(12,0,0,0,"PW_TEMPLE_27");
};

func void Rtn_Tot_166()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

//------------------------Konvoy---------------------------


instance Ass_167_Adept_Convoy(Npc_Default)
{
	name[0] = "Novic Masyafu";
	guild = GIL_BDT;
	id = 167;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	self.senses_range = 300;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_167;
};

func void Rtn_Start_167()
{
	TA_Stand_WP(6,0,7,0,"PW_GROT_PRISION_CONVOY");
	TA_Stand_WP(7,0,8,0,"PW_CONVOY_START_01");
	TA_Stand_WP(8,0,20,0,"PW_CONVOY_END");
	TA_Stand_WP(20,0,21,0,"PW_GROT_PRISION_CONVOY");
	TA_Stand_WP(21,0,6,0,"PW_CONVOY_END");
};

func void rtn_StartNoFake_167()
{
	TA_Stand_WP(6,0,7,0,"PW_GROT_PRISION_CONVOY");
	TA_Stand_WP(7,0,20,0,"PW_CONVOY_END");
	TA_Stand_WP(20,0,21,0,"PW_GROT_PRISION_CONVOY");
	TA_Stand_WP(21,0,6,0,"PW_CONVOY_END");
};

func void Rtn_Tot_167()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_168_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 168;
	level = 1;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_2,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	EquipItem(self,ItAr_SklavenFessel);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_168;
};

func void rtn_start_168()
{
	TA_Stand_WP(6,0,7,0,"PW_GROT_PRISION_CONVOY");
	TA_Stand_WP(7,0,8,0,"PW_CONVOY_START_02");
	TA_Stand_WP(8,0,20,0,"PW_CONVOY_END");
	TA_Stand_WP(20,0,6,0,"PW_GROT_PRISION_SLAVE_CONVOY");
};

func void Rtn_FollowMasiafTemple_168()
{
	TA_Follow_Player(8,0,20,0,"PW_NROZAS");
	TA_Follow_Player(20,0,8,0,"PW_NROZAS");
};

func void rtn_Nrozas_168()
{
	TA_Stand_Sweeping(8,0,21,0,"PW_CONVOY_END");
	TA_Stand_Sweeping(21,0,8,0,"PW_CONVOY_END");
};

func void rtn_NoFake_168()
{
	TA_Stand_Sweeping(8,0,20,0,"PW_CONVOY_END");
	TA_Stand_Sweeping(20,0,8,0,"PW_CONVOY_END");
};

func void Rtn_Tot_168()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance SEK_169_SLAVEOBSSEK(Npc_Default)
{
	name[0] = "Otrok Marius";
	guild = GIL_STRF;
	id = 169;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_4,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_169;
};

func void rtn_start_169()
{
	TA_Stand_Sweeping(8,0,21,0,"PW_TEMPLE_MARIUS_01");
	TA_Stand_Sweeping(21,0,8,0,"PW_TEMPLE_MARIUS_02");

};

func void Rtn_Tot_169()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance Ass_170_Adept(Npc_Default)
{
	name[0] = "Hasim Zubolam";
	guild = GIL_BDT;
	id = 170;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_170;
};

func void Rtn_Start_170()
{
	TA_Smoke_Waterpipe(0,0,12,0,"PW_TEMPLE_HASIM");
	TA_Smoke_Waterpipe(12,0,0,0,"PW_TEMPLE_HASIM");
};

func void Rtn_FollowHero_170()
{
	TA_Follow_Player(8,0,22,0,"PW_HASIM_DEAD");
	TA_Follow_Player(22,0,8,0,"PW_HASIM_DEAD");
};

func void rtn_tot_170()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_171_Adept(Npc_Default)
{
	name[0] = "Narug Nájezdník";
	guild = GIL_BDT;
	id = 171;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_04,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_171;
};

func void Rtn_Start_171()
{
	TA_Stand_Guarding(0,0,12,0,"PW_NARUG");
	TA_Stand_Guarding(12,0,0,0,"PW_NARUG");
};

//-------------------------------------------------Strazha vnutrennego svyatilishcha-------------------------------------

instance Ass_182_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 182;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_182;
};

func void Rtn_Start_182()
{
	TA_Stand_Guarding(0,0,12,0,"PW_CAVEORE_04");
	TA_Stand_Guarding(12,0,0,0,"PW_CAVEORE_04");
};

func void rtn_tot_182()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_172_Adept_Demon(Npc_Default)
{
	name[0] = "Strážce svatyně";
	guild = GIL_BDT;
	id = 172;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01_Demon,BodyTex_Masiaf_02,ITAR_SANCUARY_GUARD);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_172;
};

func void Rtn_Start_172()
{
	TA_Stand_Guarding(0,0,12,0,"PW_INNER_GUARD_01");
	TA_Stand_Guarding(12,0,0,0,"PW_INNER_GUARD_01");
};

func void rtn_tot_172()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_173_Adept_Demon(Npc_Default)
{
	name[0] = "Strážce svatyně";
	guild = GIL_BDT;
	id = 173;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02_Demon,BodyTex_Masiaf_01,ITAR_SANCUARY_GUARD);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_173;
};

func void Rtn_Start_173()
{
	TA_Stand_Guarding(0,0,12,0,"PW_INNER_GUARD_02");
	TA_Stand_Guarding(12,0,0,0,"PW_INNER_GUARD_02");
};

func void rtn_tot_173()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_174_Adept_Demon(Npc_Default)
{
	name[0] = "Strážce svatyně";
	guild = GIL_BDT;
	id = 174;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02_Demon,BodyTex_Masiaf_01,ITAR_SANCUARY_GUARD);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_174;
};

func void Rtn_Start_174()
{
	TA_Stand_Guarding(0,0,12,0,"PW_INNER_GUARD_03");
	TA_Stand_Guarding(12,0,0,0,"PW_INNER_GUARD_03");
};

func void rtn_tot_174()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_175_Adept_Demon(Npc_Default)
{
	name[0] = "Strážce svatyně";
	guild = GIL_BDT;
	id = 175;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01_Demon,BodyTex_Masiaf_02,ITAR_SANCUARY_GUARD);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_175;
};

func void Rtn_Start_175()
{
	TA_Stand_Guarding(0,0,12,0,"PW_INNER_GUARD_04");
	TA_Stand_Guarding(12,0,0,0,"PW_INNER_GUARD_04");
};

func void rtn_tot_175()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_178_Prior_ArchDemon(Npc_Default)
{
	name[0] = "Haniar Slepý, převor Masyafu";
	guild = GIL_BDT;
	id = 178;
	voice = 9;
	flags = 0;
	aivar[90] = TRUE;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,7);
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_MASIAF_HANIAR_Demon);
	EquipItem(self,ITMW_FAKESWORD_01);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Prior_Blind,BodyTex_B,ITAR_ASSASINS_02);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_178;
};

func void Rtn_Start_178()
{
	TA_Pray_Sleeper_FP(0,0,12,0,"PW_INNER_GUARD_05");
	TA_Pray_Sleeper_FP(12,0,0,0,"PW_INNER_GUARD_05");
};

func void rtn_tot_178()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SEK_179_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 179;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	EquipItem(self,ItMw_StoneHammer);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_179;
};


func void rtn_start_179()
{
	TA_Pick_Ore(8,0,21,0,"PW_CAVEORE_01");
	TA_Pick_Ore(21,0,8,0,"PW_CAVEORE_01");
};

func void rtn_tot_179()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};


instance SEK_180_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 180;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_4,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_180;
};

func void rtn_start_180()
{
	TA_Pick_Ore(8,0,21,0,"PW_CAVEORE_02");
	TA_Pick_Ore(21,0,8,0,"PW_CAVEORE_02");
};

func void rtn_tot_180()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SEK_181_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 181;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_4,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_181;
};

func void rtn_start_181()
{
	TA_Pick_Ore(8,0,21,0,"PW_CAVEORE_03");
	TA_Pick_Ore(21,0,8,0,"PW_CAVEORE_03");
};

func void rtn_tot_181()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

//---------------pomoshniki priorov----------------------


instance Ass_183_Adept(Npc_Default)
{
	name[0] = "Kaduin";
	guild = GIL_BDT;
	id = 183;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_183;
};

func void Rtn_Start_183()
{
	TA_Smoke_Joint(0,0,12,0,"PW_TEMPLE_KADUIN");
	TA_Smoke_Joint(12,0,0,0,"PW_TEMPLE_KADUIN");
};

func void rtn_tot_183()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_184_Adept(Npc_Default)
{
	name[0] = "Hoakin";
	guild = GIL_BDT;
	id = 184;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_03);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_184;
};

func void Rtn_Start_184()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_TEMPLE_HOAKIN");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_TEMPLE_HOAKIN");
};

func void Rtn_Osair_184()
{
	TA_Stand_Guarding(0,0,12,0,"PW_TEMPLE_HOAKIN");
	TA_Stand_Guarding(12,0,0,0,"PW_TEMPLE_HOAKIN");
};

func void Rtn_Pray_184()
{
	TA_Pray_Sleeper_FP(0,0,12,0,"PW_TEMPLE_HOAKIN_PRAY");
	TA_Pray_Sleeper_FP(12,0,0,0,"PW_TEMPLE_HOAKIN_PRAY");
};

func void Rtn_Tiamant_184()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_TEMPLE_HOAKIN_TIAMANT");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_TEMPLE_HOAKIN_TIAMANT");
};

func void rtn_FollowGoldOre_184()
{
	TA_Follow_Player(8,0,21,0,"PW_GOLD_CAVEORE_03");
	TA_Follow_Player(21,0,8,0,"PW_GOLD_CAVEORE_03");
};

func void Rtn_GoldOre_184()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"PW_GOLD_CAVEORE_03");
	TA_Stand_ArmsCrossed(21,0,8,0,"PW_GOLD_CAVEORE_03");
};

func void rtn_tot_184()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_185_Adept(Npc_Default)
{
	name[0] = "Luka";
	guild = GIL_BDT;
	id = 185;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_01,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	CreateInvItems(self,ItWr_Luka,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_185;
};

func void Rtn_Start_185()
{
	TA_Stand_ArmsCrossed(6,0,22,0,"PW_CAVEGOLDORE_01");
	TA_Smoke_Joint(22,0,6,0,"PW_CAVEGOLDORE_01");
};

func void rtn_tot_185()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SEK_186_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 186;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_2,BodyTex_N,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_186;
};

func void rtn_start_186()
{
	TA_Sit_Campfire(5,0,24,0,"PW_GROT_GOLDORE_SLAVE_01");
	TA_Sit_Campfire(24,0,5,0,"PW_GROT_GOLDORE_SLAVE_01");
};

func void rtn_FollowGoldOre_186()
{
	TA_Follow_Player(8,0,21,0,"PW_GOLD_CAVEORE_01");
	TA_Follow_Player(21,0,8,0,"PW_GOLD_CAVEORE_01");
};

func void rtn_GoldOre_186()
{
	TA_Pick_Ore(8,0,21,0,"PW_GOLD_CAVEORE_01");
	TA_Pick_Ore(21,0,8,0,"PW_GOLD_CAVEORE_01");
};

func void rtn_tot_186()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SEK_387_SLAVEOBSSEK(Npc_Default)
{
	name[0] = NAME_SLAVEOBSSEK;
	guild = GIL_STRF;
	id = 387;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_3,BodyTex_B,ItAr_Sekbed_Slave);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_387;
};

func void rtn_start_387()
{
	TA_Stand_WP(5,0,24,0,"PW_GROT_GOLDORE_SLAVE_02");
	TA_Stand_WP(24,0,5,0,"PW_GROT_GOLDORE_SLAVE_02");
};

func void rtn_FollowGoldOre_387()
{
	TA_Follow_Player(8,0,21,0,"PW_GOLD_CAVEORE_02");
	TA_Follow_Player(21,0,8,0,"PW_GOLD_CAVEORE_02");
};

func void rtn_GoldOre_387()
{
	TA_Pick_Ore(8,0,21,0,"PW_GOLD_CAVEORE_02");
	TA_Pick_Ore(21,0,8,0,"PW_GOLD_CAVEORE_02");
};

func void rtn_tot_387()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_388_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 388;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_388;
};

func void Rtn_Start_388()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_CAVEGOLDORE_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_CAVEGOLDORE_01");
};


func void Rtn_GuardShaht_388()
{
	TA_Smoke_Joint(0,0,12,0,"PW_GOLD_CAVEORE_GUARD_01");
	TA_Smoke_Joint(12,0,0,0,"PW_GOLD_CAVEORE_GUARD_01");
};

func void rtn_tot_388()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_389_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 389;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_389;
};

func void Rtn_Start_389()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_GOLD_CAVEORE_TEMP_19");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_GOLD_CAVEORE_TEMP_19");
};

func void Rtn_GuardShaht_389()
{
	TA_Stand_Eating(0,0,12,0,"PW_GOLD_CAVEORE_GUARD_02");
	TA_Stand_Drinking(12,0,0,0,"PW_GOLD_CAVEORE_GUARD_02");
};

func void rtn_tot_389()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_390_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 390;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_390;
};

func void Rtn_Start_390()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_GOLD_CAVEORE_TEMP_18");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_GOLD_CAVEORE_TEMP_18");
};

func void Rtn_GuardShaht_390()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_GOLD_CAVEORE_GUARD_03");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_GOLD_CAVEORE_GUARD_03");
};

func void rtn_tot_390()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_391_Adept(Npc_Default)
{
	name[0] = "Famid";
	guild = GIL_BDT;
	id = 391;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_391;
};

func void Rtn_Start_391()
{
	TA_Stand_Eating(8,0,9,0,"PW_FAMID");
	TA_Stand_Drinking(9,0,10,0,"PW_FAMID");
	TA_Stand_ArmsCrossed(10,0,15,0,"PW_FAMID");
	TA_Smoke_Joint(15,0,20,0,"PW_138_DEATHMATCH");
	TA_Stand_Eating(20,0,21,0,"PW_FAMID");
	TA_Stand_Drinking(21,0,22,0,"PW_FAMID");
	TA_Play_Lute(22,0,8,0,"PW_FAMID");
};

func void Rtn_OsairMeet_391()
{
	TA_Stand_Guarding(0,0,12,0,"PW_OSAIR_MEET_GUARD_01");
	TA_Stand_Guarding(12,0,0,0,"PW_OSAIR_MEET_GUARD_01");
};

func void rtn_tot_391()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_392_Adept(Npc_Default)
{
	name[0] = "Rafat";
	guild = GIL_BDT;
	id = 392;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_02,BodyTex_Masiaf_02,ITAR_ASSASINS_04);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_392;
};

func void Rtn_Start_392()
{
	TA_Pray_Sleeper_FP(6,0,22,0,"PW_TEMPLE_HOAKIN_PRAY");
	TA_Smoke_Joint(22,0,6,0,"PW_RAFAT");
};

func void Rtn_OsairMeet_392()
{
	TA_WacheFackel(0,0,12,0,"PW_OSAIR_MEET_GUARD_03");
	TA_WacheFackel(12,0,0,0,"PW_OSAIR_MEET_GUARD_03");
};

func void Rtn_PrayInHram_392()
{
	TA_Pray_Sleeper_FP(0,0,12,0,"PW_TEMPLE_RAFAT_PRAY");
	TA_Pray_Sleeper_FP(12,0,0,0,"PW_TEMPLE_RAFAT_PRAY");
};

func void rtn_tot_392()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_393_Adept(Npc_Default)
{
	name[0] = "Nazim";
	guild = GIL_BDT;
	id = 393;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_393;
};

func void Rtn_Start_393()
{
	TA_WacheFackel(20,0,6,0,"PW_NAZIM");
	TA_Stand_ArmsCrossed(6,0,20,0,"PW_NAZIM");
};

func void Rtn_OsairMeet_393()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_MEET_GUARD_02");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_MEET_GUARD_02");
};

func void Rtn_WaitInOsairCave_393()
{
	TA_Stand_Drinking(0,0,12,0,"PW_NAZIM_OSAIR_CAVE");
	TA_Stand_Drinking(12,0,0,0,"PW_NAZIM_OSAIR_CAVE");
};

func void rtn_tot_393()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_394_Adept(Npc_Default)
{
	name[0] = "Kudir";
	guild = GIL_BDT;
	id = 394;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_394;
};

func void Rtn_Start_394()
{
	TA_Study_WP(23,0,3,0,"PW_KUDIR");
	TA_Study_WP(3,0,0,23,"TOT");
};

func void Rtn_OsairMeet_394()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_MEET_GUARD_04");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_MEET_GUARD_04");
};

func void rtn_tot_394()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_395_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 395;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_395;
};

func void Rtn_Start_395()
{
	TA_WacheFackel(0,0,12,0,"PW_OSAIR_MEET_GUARD_05");
	TA_WacheFackel(12,0,0,0,"PW_OSAIR_MEET_GUARD_05");
};

func void rtn_tot_395()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_396_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 396;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_396;
};

func void Rtn_Start_396()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_MEET_GUARD_05_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_MEET_GUARD_05_01");
};

func void rtn_tot_396()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_397_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 397;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,555);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_397;
};

func void Rtn_Start_397()
{
	TA_Stand_Guarding(0,0,12,0,"PW_OSAIR_MEET_GUARD_05_02");
	TA_Stand_Guarding(12,0,0,0,"PW_OSAIR_MEET_GUARD_05_02");
};

func void rtn_tot_397()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_398_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 398;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,556);
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Npc_Right);
	EquipItem(self,ItMw_1H_AssBlade_Npc_Left);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = Rtn_Start_398;
};

func void Rtn_Start_398()
{
	TA_Stand_Guarding(0,0,12,0,"PW_OSAIR_MEET_GUARD_01");
	TA_Stand_Guarding(12,0,0,0,"PW_OSAIR_MEET_GUARD_01");
};

func void rtn_tot_398()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_399_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 399;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_399;
};

func void Rtn_Start_399()
{
	TA_WacheFackel(0,0,12,0,"PW_OSAIR_MEET_GUARD_03");
	TA_WacheFackel(12,0,0,0,"PW_OSAIR_MEET_GUARD_03");
};

func void rtn_tot_399()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_598_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 598;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_598;
};

func void Rtn_Start_598()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_MEET_GUARD_02");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_MEET_GUARD_02");
};

func void rtn_tot_598()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ass_599_Adept(Npc_Default)
{
	name[0] = "Elitní stín Masyafu";
	guild = GIL_BDT;
	id = 599;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_AssBlade_Known);
	B_CreateAmbientInv_Ass(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Masiaf_03,BodyTex_Masiaf_01,ITAR_ASSASINS_01);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_599;
};

func void Rtn_Start_599()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"PW_OSAIR_MEET_GUARD_04");
	TA_Stand_ArmsCrossed(12,0,0,0,"PW_OSAIR_MEET_GUARD_04");
};

func void rtn_tot_599()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};
