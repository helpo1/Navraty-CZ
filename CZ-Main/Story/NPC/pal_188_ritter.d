
instance PAL_188_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 188;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Kharim,BodyTex_B,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_188;
};


func void rtn_start_188()
{
	TA_Stand_Guarding(9,0,23,0,"NW_GUARDPORTAL_01");
	TA_Stand_Guarding(23,0,9,0,"NW_GUARDPORTAL_01");
};

func void rtn_tot_188()
{
	TA_Stand_Guarding(9,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,9,0,"TOT");
};
