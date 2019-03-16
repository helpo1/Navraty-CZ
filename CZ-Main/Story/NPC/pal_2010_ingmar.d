
instance PAL_2010_INGMAR(Npc_Default)
{
	name[0] = "Ingmar";
	guild = GIL_PAL;
	id = 2010;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_ToughBart01,BodyTex_N,ITAR_PAL_H_V1_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_2010;
};


func void rtn_start_2010()
{
	TA_Stand_WP(8,0,23,0,"FP_INGMAR");
	TA_Stand_WP(23,0,8,0,"FP_INGMAR");
};

func void rtn_tot_2010()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

