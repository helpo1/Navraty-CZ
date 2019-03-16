
instance PIR_1391_Addon_InExtremo_TheFlail(Npc_Default)
{
	name[0] = "Флейл";
	npcType = npctype_main;
	guild = GIL_VLK;
	voice = 3;
	id = 1391;
	flags = 0;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	CreateInvItem(self,ItMi_IELaute);
	EquipItem(self,ItMw_Nagelkeule);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_FLAIL_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_FLAIL",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,100);
	daily_routine = Rtn_Start_1391;
};


func void Rtn_Start_1391()
{
	TA_Concert(8,0,20,0,"OCR_IE_FLAIL");
	TA_Sit_Bench(20,0,8,0,"OCR_IE_FLAIL_SIT");
};

func void Rtn_BonusStart_1391()
{
	TA_Concert(8,0,16,0,"OCR_IE_FLAIL");
	TA_Stand_ArmsCrossed(16,0,18,0,"OCR_IE_FLAIL");
	TA_Concert(18,0,20,0,"OCR_IE_FLAIL");
	TA_Sit_Bench(20,0,8,0,"OCR_IE_FLAIL_SIT");
};

func void rtn_logovo_1391()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_HABOUR_KILL_06");
	TA_Stand_Eating(20,0,8,0,"NW_CITY_HABOUR_KILL_06");
};

func void rtn_logovobandit_1391()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_HANSLAGER_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_HANSLAGER_01");
};

func void rtn_gotobandit2_1391()
{
	TA_Stand_Guarding(0,0,12,0,"NW_HANSLAGER_01_F");
	TA_Stand_Guarding(12,0,0,0,"NW_HANSLAGER_01_F");
};

func void rtn_KillCamp_1391()
{
	TA_Potion_Alchemy(0,0,12,0,"NW_FOREST_VINOSKELLEREI_KILLERS_02");
	TA_Potion_Alchemy(12,0,0,0,"NW_FOREST_VINOSKELLEREI_KILLERS_02");
};

func void rtn_TOT_1391()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,9,0,"TOT");
};