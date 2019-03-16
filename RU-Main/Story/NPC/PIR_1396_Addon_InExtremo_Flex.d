
instance PIR_1396_Addon_InExtremo_Flex(Npc_Default)
{
	name[0] = "Флекс";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 4;
	flags = 0;
	voice = 13;
	id = 1396;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	CreateInvItem(self,ItMi_IEDudelBlau);
	EquipItem(self,ItMw_Piratensaebel);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Flex_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Flex",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,80);
	daily_routine = Rtn_Start_1396;
};

func void Rtn_Start_1396()
{
	TA_Concert(8,0,20,0,"OCR_IE_FLEX");
	TA_Smalltalk(20,0,8,0,"OCR_IE_FLEX");
};

func void Rtn_BonusStart_1396()
{
	TA_Concert(8,0,16,0,"OCR_IE_FLEX");
	TA_Stand_ArmsCrossed(16,0,18,0,"OCR_IE_FLEX");
	TA_Concert(18,0,20,0,"OCR_IE_FLEX");
	TA_Smalltalk(20,0,8,0,"OCR_IE_FLEX");
};

func void rtn_logovo_1396()
{
	TA_Sit_Chair(8,0,20,0,"NW_CITY_HABOUR_KILL_05");
	TA_Sit_Chair(20,0,8,0,"NW_CITY_HABOUR_KILL_05");
};

func void rtn_logovobandit_1396()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_HANSLAGER_06");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_HANSLAGER_06");
};

func void rtn_gotobandit4_1396()
{
	TA_Stand_Eating(0,0,12,0,"NW_HANSLAGER_06_F");
	TA_Stand_Eating(12,0,0,0,"NW_HANSLAGER_06_F");
};

func void rtn_KillCamp_1396()
{
	TA_Cook_Campfire(0,0,12,0,"NW_FOREST_VINOSKELLEREI_KILLERS_01");
	TA_Cook_Campfire(12,0,0,0,"NW_FOREST_VINOSKELLEREI_KILLERS_01");
};

func void rtn_TOT_1396()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,9,0,"TOT");
};