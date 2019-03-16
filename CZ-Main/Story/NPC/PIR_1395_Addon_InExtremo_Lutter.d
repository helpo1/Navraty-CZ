
instance PIR_1395_Addon_InExtremo_Lutter(Npc_Default)
{
	name[0] = "Lutter";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 4;
	voice = 7;
	id = 1395;
	flags = 0;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	CreateInvItem(self,ItMi_IEDrumScheit);
	EquipItem(self,ItMw_Piratensaebel);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Lutter_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Lutter",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,85);
	daily_routine = Rtn_Start_1395;
};


func void Rtn_Start_1395()
{
	TA_Concert(8,0,20,0,"OCR_IE_LUTTER");
	TA_Smalltalk(20,0,8,0,"OCR_IE_LUTTER");
};

func void Rtn_BonusStart_1395()
{
	TA_Concert(8,0,16,0,"OCR_IE_LUTTER");
	TA_Stand_ArmsCrossed(16,0,18,0,"OCR_IE_LUTTER");
	TA_Concert(18,0,20,0,"OCR_IE_LUTTER");
	TA_Smalltalk(20,0,8,0,"OCR_IE_LUTTER");
};

func void rtn_logovo_1395()
{
	TA_Read_Bookstand(8,0,20,0,"NW_CITY_HABOUR_KILL_04");
	TA_Read_Bookstand(20,0,8,0,"NW_CITY_HABOUR_KILL_04");
};

func void rtn_logovobandit_1395()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_HANSLAGER_05");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_HANSLAGER_05");
};

func void rtn_gotobandit3_1395()
{
	TA_Stand_Drinking(0,0,12,0,"NW_HANSLAGER_05_F");
	TA_Stand_Drinking(12,0,0,0,"NW_HANSLAGER_05_F");
};

func void rtn_KillCamp_1395()
{
	TA_Sit_Chair(0,0,12,0,"NW_FOREST_VINOSKELLEREI_KILLERS_03");
	TA_Sit_Chair(12,0,0,0,"NW_FOREST_VINOSKELLEREI_KILLERS_03");
};

func void rtn_TOT_1395()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,9,0,"TOT");
};