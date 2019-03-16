
instance BAU_982_Grimbald(Npc_Default)
{
	name[0] = "Гримбальд";
	guild = GIL_NONE;
	id = 982;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Normal_Kirgo,BodyTex_B,ItAr_HuntArmor_H_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_982;
};


func void Rtn_Start_982()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_PATH_79");
	TA_Stand_Guarding(23,0,8,0,"NW_TROLLAREA_PATH_79");
};

func void Rtn_Jagd_982()
{
	TA_RunToWP(8,0,23,0,"NW_TROLLAREA_PATH_80");
	TA_RunToWP(23,0,8,0,"NW_TROLLAREA_PATH_80");
};

func void Rtn_JagdOver_982()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_PATH_79");
	TA_Stand_Guarding(23,0,8,0,"NW_TROLLAREA_PATH_79");
};

func void rtn_orcatcbegan_982()
{
	TA_Stand_Guarding(6,55,20,30,"NW_HUNTERCAMP_GRIMBALD");
	TA_Stand_Guarding(20,30,6,55,"NW_HUNTERCAMP_GRIMBALD");
};

func void rtn_campon_982()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_07");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_07");
};

func void rtn_inbattle_982()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8767");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8767");
};

