
instance PIR_1356_Addon_Bill(Npc_Default)
{
	name[0] = "Билл";
	guild = GIL_PIR;
	id = 1356;
	voice = 3;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR1hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Drax,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_1356;
};


func void Rtn_PreStart_1356()
{
	TA_Saw(8,0,20,0,"ADW_PIRATECAMP_SAW_01");
	TA_Saw(20,0,8,0,"ADW_PIRATECAMP_SAW_01");
};

func void Rtn_Start_1356()
{
	TA_Saw(8,0,20,0,"ADW_PIRATECAMP_SAW_01");
	TA_Cook_Campfire(20,0,21,0,"WP_PIR_01");
	TA_Stand_Eating(21,0,22,0,"WP_PIR_01");
	TA_Sit_Campfire(22,0,8,0,"WP_PIR_01");
};

func void Rtn_GregIsBack_1356()
{
	TA_Cook_Campfire(8,0,20,0,"WP_PIR_01");
	TA_Stand_Eating(20,0,21,0,"WP_PIR_01");
	TA_Sit_Campfire(21,0,8,0,"WP_PIR_01");
};

func void rtn_tot_1356()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

