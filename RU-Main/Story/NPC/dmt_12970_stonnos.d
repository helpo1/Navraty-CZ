
instance DMT_12970_STONNOS(Npc_Default)
{
	name[0] = "Стоннос, Владыка Скалы";
	guild = GIL_OUT;
	level = 500;
	voice = 18;
	id = 12970;
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
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_stoneguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_12970;
};


func void rtn_start_12970()
{
	TA_Read_Bookstand(8,0,21,0,"WP_GUARDIANS_STONNOS");
	TA_Read_Bookstand(21,0,8,0,"WP_GUARDIANS_STONNOS");
};

func void rtn_tot_12970()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,8,0,"TOT");
};


instance DMT_12971_STONNOS(Npc_Default)
{
	name[0] = "Стоннос, Владыка Скалы";
	guild = GIL_DMT;
	level = 500;
	voice = 18;
	id = 12971;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,57);
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_stoneguardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_12971;
};


func void rtn_start_12971()
{
	TA_Read_Bookstand(8,0,21,0,"WP_GUARDIANS_STONNOS");
	TA_Read_Bookstand(21,0,8,0,"WP_GUARDIANS_STONNOS");
};

func void rtn_tot_12971()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,8,0,"TOT");
};

instance Skeleton_Lord_LV(Npc_Default)
{
	name[0] = "Чел'Драк, древний лорд";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	id = 1814;
	voice = 18;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,777);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_ChelDrak_Right);
	EquipItem(self,ItMw_1H_ChelDrak_Left);
	effect = "SPELLFX_REDEYES";
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,ITAR_DEMON_ADDON);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	CreateInvItems(self,ItKe_LichKing,1);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	daily_routine = Rtn_Start_1814;
};

func void Rtn_Start_1814()
{
	TA_Sit_Throne(9,0,21,0,"LOSTVALLEY_CHELDRAK");
	TA_Sit_Throne(21,0,9,0,"LOSTVALLEY_CHELDRAK");
};

instance ILARAH(Npc_Default)
{
	name[0] = "Ктар'Ар, аватар Хаоса";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	voice = 18;
	id = 12972;
	voice = 18;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_Gender] = MALE;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,100);
	level = 2000;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMw_1H_IlArahBlade_Right_Npc);
	EquipItem(self,ItMw_1H_IlArahBlade_Left_Npc);
	fight_tactic = FAI_HUMAN_MASTER;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",3,DEFAULT,"Ske_Head",8,DEFAULT,ITAR_ILARAH);
	Mdl_SetModelFatness(self,2);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,0);
	daily_routine = rtn_start_12972;
};

func void rtn_start_12972()
{
	TA_Stand_IlARah(8,0,21,0,"KRATUK");
	TA_Stand_IlARah(21,0,8,0,"KRATUK");
};

func void rtn_tot_12972()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,8,0,"TOT");
};