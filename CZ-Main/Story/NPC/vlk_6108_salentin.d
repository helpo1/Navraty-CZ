
instance VLK_6108_SALENTIN(Npc_Default)
{
	name[0] = "Salentin";
	guild = GIL_BAU;
	id = 6108;
	voice = 12;
	npcType = npctype_main;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Bau_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Blade,BodyTex_L,ITAR_Bau_L_02);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_SetFightSkills(self,20);
	daily_routine = rtn_start_6108;
};


func void rtn_start_6108()
{
	TA_Rake_FP(6,0,19,35,"INSEL_JAGER_05");
	TA_Sit_Chair(19,35,6,0,"INSEL_JAGER_04");
};

