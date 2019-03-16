
instance PAL_752300_ALBERT(Npc_Default)
{
	name[0] = "Альберт";
	guild = GIL_PAL;
	id = 752300;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_752300;
};


func void rtn_start_752300()
{
	TA_Stand_Guarding(8,0,21,0,"PLFT_ALBERT");
	TA_Stand_Guarding(21,0,8,0,"PLFT_ALBERT");
};

func void rtn_tot_752300()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

