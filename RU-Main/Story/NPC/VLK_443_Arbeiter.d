
instance VLK_443_Arbeiter(Npc_Default)
{
	name[0] = "Рабочий";
	guild = GIL_VLK;
	id = 443;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_MM_RestStart] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_443;
};


func void Rtn_Start_443()
{
	TA_Saw(4,55,19,5,"NW_CITY_HABOUR_08");
	TA_Smalltalk(19,5,4,55,"NW_CITY_HABOUR_02");
};

