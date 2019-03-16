
instance PIR_1397_ADDON_INEXTREMO_CHARLOTTE(Npc_Default)
{
	name[0] = "Шарлотта";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 1;
	voice = 16;
	id = 1397;
	flags = 0;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[93] = TRUE;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 20;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",6,0,"SRN_HEAD_HAIR3",2,0,armr_G1_v3); //Прототип Шарлотта
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,80);
	B_SetFightSkills(self,25);
	daily_routine = rtn_start_1397;
};


func void rtn_start_1397()
{
	ta_charlotte_dance(8,0,20,0,"OCR_CHARLOTTE");
	TA_Play_Lute(20,0,8,0,"OCR_CHARLOTTE");
};

func void rtn_logovo_1397()
{
	TA_Cook_Stove(8,0,20,0,"NW_CITY_HABOUR_KILL_02");
	TA_Cook_Stove(20,0,8,0,"NW_CITY_HABOUR_KILL_02");
};

func void rtn_logovobandit_1397()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_HANSLAGER_07");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_HANSLAGER_07");
};

func void rtn_gotobandit5_1397()
{
	TA_Stand_Guarding(0,0,12,0,"NW_HANSLAGER_07_F");
	TA_Stand_Guarding(12,0,0,0,"NW_HANSLAGER_07_F");
};

func void rtn_KillCamp_1397()
{
	TA_Cook_Cauldron(0,0,12,0,"NW_FOREST_VINOSKELLEREI_KILLERS_05");
	TA_Cook_Cauldron(12,0,0,0,"NW_FOREST_VINOSKELLEREI_KILLERS_05");
};

func void rtn_TOT_1397()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,9,0,"TOT");
};