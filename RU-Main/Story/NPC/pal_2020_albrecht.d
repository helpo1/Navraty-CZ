
instance PAL_2020_ALBRECHT(Npc_Default)
{
	name[0] = "Альбрехт";
	guild = GIL_PAL;
	id = 2020;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_2020;
};


func void rtn_start_2020()
{
	TA_Smalltalk(8,0,23,0,"FP_ALBRECHT");
	TA_Smalltalk(23,0,8,0,"FP_ALBRECHT");
};

func void rtn_tot_2020()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

