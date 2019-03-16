
instance PIR_1390_Addon_InExtremo_DrPymonte(Npc_Default)
{
	name[0] = "Pymonte";
	npcType = npctype_main;
	guild = GIL_VLK;
	voice = 12;
	id = 1390;
	flags = 0;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	CreateInvItem(self,ItMi_IEHarfe);
	EquipItem(self,ItMw_Nagelknueppel);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_PYMONTE_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_PYMONTE",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,70);
	daily_routine = Rtn_Start_1390;
};

func void Rtn_Start_1390()
{
	TA_Concert(8,0,20,0,"OCR_IE_PYMONTE");
	TA_Stand_Eating(20,0,8,0,"OCR_IE_PYMONTE_STAND");
};

func void Rtn_BonusStart_1390()
{
	TA_Concert(8,0,16,0,"OCR_IE_PYMONTE");
	TA_Stand_ArmsCrossed(16,0,18,0,"OCR_IE_PYMONTE");
	TA_Concert(18,0,20,0,"OCR_IE_PYMONTE");
	TA_Stand_Eating(20,0,8,0,"OCR_IE_PYMONTE_STAND");
};

func void rtn_logovo_1390()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_CITY_HABOUR_KILL_03");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_CITY_HABOUR_KILL_03");
};

func void rtn_logovobandit_1390()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_HANSLAGER_00");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_HANSLAGER_00");
};

func void rtn_gotobandit1_1390()
{
	TA_Sit_Bench(0,0,12,0,"NW_HANSLAGER_00_F");
	TA_Sit_Bench(12,0,0,0,"NW_HANSLAGER_00_F");
};

func void rtn_KillCamp_1390()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_FOREST_VINOSKELLEREI_KILLERS_02");
	TA_Stand_Eating(12,0,0,0,"NW_FOREST_VINOSKELLEREI_KILLERS_02");
};

func void rtn_TOT_1390()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,9,0,"TOT");
};