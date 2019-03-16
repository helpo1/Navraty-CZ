
instance VLK_7526_WAFFENKNECHT(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 7526;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_CSP_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart22,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = rtn_start_7526;
};


func void rtn_start_7526()
{
	TA_Saw(8,10,23,10,"WP_COAST_CAMP_06");
	TA_Sit_Bench(23,10,8,10,"WP_COAST_CAMP_03");
};

func void rtn_dead_7526()
{
	TA_Stand_WP(8,0,20,0,"OC_TO_PRISON");
	TA_Stand_WP(20,0,8,0,"OC_TO_PRISON");
};

