
instance MIL_3120_WULFGAR(Npc_Default)
{
	name[0] = "Вульфгар";
	guild = GIL_MIL;
	id = 3120;
	voice = 4;
	flags = 0;
	aivar[93] = TRUE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart06,BodyTex_N,ITAR_MIL_WULFGAR);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_3120;
};


func void rtn_start_3120()
{
	TA_Stand_ArmsCrossed(8,0,17,0,"FP_WULFGAR");
	TA_Stand_ArmsCrossed(17,0,8,0,"FP_WULFGAR");
};

func void rtn_tot_3120()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

