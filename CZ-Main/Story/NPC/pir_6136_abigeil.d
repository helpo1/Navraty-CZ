
instance PIR_6136_ABIGEIL(Npc_Default)
{
	name[0] = "Abigail";
	guild = GIL_PIR;
	id = 6136;
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
	EquipItem(self,ItMw_Addon_PIR1hSword);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	//Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",5,0,"SRN_HEAD_HAIR7",6,0,armr_G1_v6); //prototip Seraphia
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",Face_N_Horatio,BodyTexBabe_F,ItAr_Abigal);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6136;
};


func void rtn_start_6136()
{
	TA_Stand_Guarding(9,0,12,0,"ADW_PIRATECAMP_BEACH_24_99");
	TA_Study_WP(12,0,16,0,"ADW_PIRATECAMP_BEACH_ABIGEIL_03");
	TA_Stand_Eating(16,0,18,0,"ADW_PIRATECAMP_BEACH_ABIGEIL_01");
	TA_Stand_Guarding(18,0,22,0,"ADW_PIRATECAMP_BEACH_ABIGEIL_01");
	TA_Stand_Guarding(22,0,9,0,"ADW_PIRATECAMP_BEACH_ABIGEIL_02");
};

func void rtn_PlaySong_6136()
{
	TA_Play_Lute(22,0,8,0,"ADW_PIRATECAMP_BEACH_ABIGEIL_01");
	TA_Play_Lute(8,0,22,0,"ADW_PIRATECAMP_BEACH_ABIGEIL_01");
};

func void rtn_tot_6136()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};