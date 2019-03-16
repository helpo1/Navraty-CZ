
instance PIR_61360_ABIGEIL(Npc_Default)
{
	name[0] = "Абигаль";
	guild = GIL_PAL;
	id = 61360;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_Addon_PIR1hSword);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	//Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",5,0,"SRN_HEAD_HAIR7",6,0,armr_G1_v6); //прототип Seraphia
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",Face_N_Horatio,BodyTexBabe_F,ItAr_Abigal);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_61360;
};


func void rtn_start_61360()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_01");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_01");
};

func void rtn_inbattle_61360()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8701");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8701");
};

func void rtn_ship_61360()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_05");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_05");
};
