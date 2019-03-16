
instance NONE_ADDON_111_Quarhodron(Npc_Default)
{
	name[0] = "Quarhodron";
	guild = GIL_NONE;
	id = 111;
	voice = 11;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	protection[PROT_POINT] = 9000;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Ske_Head",0,BodyTex_N,ITAR_Ancient);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_111;
};

func void Rtn_Start_111()
{
	TA_Ghost(8,0,23,0,"ADW_ANCIENTGHOST");
	TA_Ghost(23,0,8,0,"ADW_ANCIENTGHOST");
};

func void Rtn_TOT_111()
{
	TA_Ghost(8,0,23,0,"TOT");
	TA_Ghost(23,0,8,0,"TOT");
};

instance NONE_ADDON_1158_Quarhodron(Npc_Default)
{
	name[0] = "Quarhodron";
	guild = GIL_SKELETON;
	id = 1158;
	voice = 11;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	protection[PROT_POINT] = 1000;
	B_SetAttributesToChapter(self,56);
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Ske_Head",0,BodyTex_N,ITAR_Ancient);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMW_1H_LostSoul,1);
	daily_routine = Rtn_Start_1158;
};

func void Rtn_Start_1158()
{
	TA_Ghost_Main(8,0,23,0,"AV_UNDEADTHRONE");
	TA_Ghost_Main(23,0,8,0,"AV_UNDEADTHRONE");
};

func void Rtn_TOT_1158()
{
	TA_Ghost_Main(8,0,23,0,"TOT");
	TA_Ghost_Main(23,0,8,0,"TOT");
};