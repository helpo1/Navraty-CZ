
instance VLK_491_Vanja(Npc_Default)
{
	name[0] = "Вания";
	guild = GIL_VLK;
	id = 491;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",0,0,"SRN_HEAD_HAIR6",5,0,armr_G1_v1);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_Gender] = FEMALE;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_491;
};


func void Rtn_Start_491()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	TA_Smalltalk(23,0,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

func void Rtn_Alone_491()
{
	TA_Sleep(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	TA_Sleep(23,0,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

