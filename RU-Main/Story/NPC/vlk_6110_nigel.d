
instance VLK_6110_NIGEL(Npc_Default)
{
	name[0] = "Найджел";
	guild = GIL_VLK;
	id = 6110;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Cutter,BodyTex_P,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_6110;
};


func void rtn_start_6110()
{
	TA_Stand_Drinking(10,0,20,0,"NW_TAVERNE_IN_NIGEL");
	TA_Sleep(20,0,10,0,"NW_TAVERNE_IN_NIGEL_7");
};

func void rtn_onarfarm_6110()
{
	TA_Stand_ArmsCrossed(10,0,20,0,"NW_BIGFARM_NIGEL");
	TA_Sit_Chair(20,0,10,0,"NW_BIGFARM_KITCHEN_09");
};

func void rtn_tot_6110()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};
