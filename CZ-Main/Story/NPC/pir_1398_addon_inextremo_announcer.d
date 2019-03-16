
instance PIR_1398_ADDON_INEXTREMO_ANNOUNCER(Npc_Default)
{
	name[0] = "Gillian";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 1;
	voice = 10;
	id = 1398;
	flags = 0;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_scorpionspec);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_THOMAS_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_THOMAS",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_1398;
};

func void rtn_start_1398()
{
	TA_Play_Lute(8,0,16,0,"OCR_ANNOUNCER");
	TA_Stand_ArmsCrossed(16,0,18,0,"OCR_ANNOUNCER");
	TA_Play_Lute(18,0,20,0,"OCR_ANNOUNCER");
	TA_Sit_Campfire(20,0,8,0,"OCR_ANNOUNCER");
};

func void Rtn_BonusStart_1398()
{
	TA_Play_Lute(8,0,16,0,"OCR_ANNOUNCER");
	TA_Concert(16,0,18,0,"OCR_ANNOUNCER");
	TA_Play_Lute(18,0,20,0,"OCR_ANNOUNCER");
	TA_Sit_Campfire(20,0,8,0,"OCR_ANNOUNCER");
};

func void rtn_taverne_1398()
{
	TA_Play_Lute(8,0,20,0,"OCR_ANNOUNCER");
	TA_Sit_Campfire(20,0,23,0,"OCR_ANNOUNCER");
	TA_Stand_ArmsCrossed(23,30,1,30,"NW_TAVERNE_KILLER");
	TA_Sit_Campfire(2,0,8,0,"OCR_ANNOUNCER");
};

func void rtn_waitfight_1398()
{
	TA_Play_Lute(8,0,20,0,"OCR_ANNOUNCER");
	TA_Sit_Campfire(20,0,22,0,"OCR_ANNOUNCER");
	TA_Smalltalk(22,0,23,59,"NW_CITY_KILLWAMBO_01");
	TA_Sit_Campfire(23,59,8,0,"OCR_ANNOUNCER");
};

func void rtn_logovo_1398()
{
	TA_Sit_Throne(8,0,20,0,"NW_CITY_HABOUR_KILL_01");
	TA_Sit_Throne(20,0,8,0,"NW_CITY_HABOUR_KILL_01");
};

func void rtn_logovobandit_1398()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_HANSLAGER_08");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_HANSLAGER_08");
};

func void rtn_gotobandit6_1398()
{
	TA_Sit_Bench(9,0,21,0,"NW_HANSLAGER_08_F");
	TA_Sit_Bench(21,0,9,0,"NW_HANSLAGER_08_F");
};

func void rtn_TOT_1398()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,9,0,"TOT");
};