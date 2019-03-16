
instance VLK_414_Hanna(Npc_Default)
{
	name[0] = "Hanna";
	guild = GIL_VLK;
	id = 414;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	aivar[AIV_Gender] = FEMALE;
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",5,0,"SRN_HEAD_HAIR3",2,0,ITAR_VlkBabe_L_New); //Prototyp Sagitta
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_414;
};

func void Rtn_Start_414()
{
	TA_Stand_ArmsCrossed(8,0,12,0,"NW_CITY_HANNA");
	TA_Stand_Sweeping(12,0,15,0,"NW_CITY_MERCHANT_SHOP03_IN_06");
	TA_Stand_ArmsCrossed(15,0,18,0,"NW_CITY_HANNA");
	TA_Stand_Sweeping(18,0,21,0,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Stand_ArmsCrossed(21,0,8,0,"NW_CITY_HANNA");
};

func void rtn_inprision_414()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_HANNA_INPRISION");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_HANNA_INPRISION");
};

