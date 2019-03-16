
instance DMT_1212_DAGOT(Npc_Default)
{
	name[0] = "Дагот";
	guild = GIL_NONE;
	level = 500;
	voice = 18;
	id = 1212;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_1212;
};


func void rtn_start_1212()
{
	TA_Read_Bookstand(8,0,21,0,"NW_XARDAS_TOWER_IN1_28");
	TA_Read_Bookstand(21,0,8,0,"NW_XARDAS_TOWER_IN1_28");
};

func void rtn_waitinmagecircle_1212()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_DMT_1212_DAGOT");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_DMT_1212_DAGOT");
};

func void rtn_waitinsecretlab_1212()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_HRN_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_HRN_01");
};

func void rtn_tot_1212()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};


//-----------------------------маги Хранителей----------------------------------

instance DMT_13001_DARKMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Тьмы";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13001;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13001;
};

func void rtn_start_13001()
{
	TA_Circle(8,0,21,0,"TPL_058");
	TA_Circle(21,0,8,0,"TPL_058");
};

instance DMT_13002_DARKMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Тьмы";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13002;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13002;
};

func void rtn_start_13002()
{
	TA_Circle(8,0,21,0,"TPL_124");
	TA_Circle(21,0,8,0,"TPL_124");
};

instance DMT_13003_DARKMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Тьмы";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13003;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13003;
};

func void rtn_start_13003()
{
	TA_Circle(8,0,21,0,"TPL_193_09");
	TA_Circle(21,0,8,0,"TPL_193_09");
};

instance DMT_13004_STONEMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Скалы";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13004;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_stoneguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13004;
};

func void rtn_start_13004()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_04");
	TA_Circle(21,0,8,0,"DM_RITUAL_04");
};

instance DMT_13005_STONEMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Скалы";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13005;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_stoneguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13005;
};

func void rtn_start_13005()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_05");
	TA_Circle(21,0,8,0,"DM_RITUAL_05");
};

instance DMT_13006_STONEMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Скалы";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13006;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_stoneguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13006;
};

func void rtn_start_13006()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_06");
	TA_Circle(21,0,8,0,"DM_RITUAL_06");
};

instance DMT_13007_FIREMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Огня";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13007;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_fireguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13007;
};

func void rtn_start_13007()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_07");
	TA_Circle(21,0,8,0,"DM_RITUAL_07");
};

instance DMT_13008_FIREMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Огня";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13008;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_fireguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13008;
};

func void rtn_start_13008()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_08");
	TA_Circle(21,0,8,0,"DM_RITUAL_08");
};

instance DMT_13009_FIREMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Огня";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13009;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_fireguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13009;
};

func void rtn_start_13009()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_09");
	TA_Circle(21,0,8,0,"DM_RITUAL_09");
};

instance DMT_13010_WATERMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Воды";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13010;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_waterguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13010;
};

func void rtn_start_13010()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_10");
	TA_Circle(21,0,8,0,"DM_RITUAL_10");
};

instance DMT_13011_WATERMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Воды";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13011;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_waterguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13011;
};

func void rtn_start_13011()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_11");
	TA_Circle(21,0,8,0,"DM_RITUAL_11");
};


instance DMT_13012_WATERMAGE(Npc_Default)
{
	name[0] = "Маг-хранитель Воды";
	guild = GIL_DMT;
	level = 500;
	voice = 19;
	id = 13012;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_waterguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_13012;
};

func void rtn_start_13012()
{
	TA_Circle(8,0,21,0,"DM_RITUAL_12");
	TA_Circle(21,0,8,0,"DM_RITUAL_12");
};