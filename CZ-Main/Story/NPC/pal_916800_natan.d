
instance PAL_916800_NATAN(Npc_Default)
{
	name[0] = "Nathan";
	guild = GIL_PAL;
	id = 916800;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_916800;
};


func void rtn_start_916800()
{
	TA_Smalltalk(8,0,21,0,"PLFT_NATAN");
	TA_Smalltalk(21,0,8,0,"PLFT_NATAN");
};

func void rtn_tot_916800()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

