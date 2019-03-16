
instance PAL_25000_GAROND(Npc_Default)
{
	name[0] = "Garond";
	guild = GIL_PAL;
	id = 25000;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Raven,BodyTex_N,ITAR_PAL_H_V2_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_25000;
};


func void rtn_start_25000()
{
	TA_Stand_Guarding(8,0,21,0,"PLFT_GAROND");
	TA_Stand_Guarding(21,0,8,0,"PLFT_GAROND");
};

func void rtn_tot_25000()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

