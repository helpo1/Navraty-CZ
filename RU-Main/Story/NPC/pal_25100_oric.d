
instance PAL_25100_ORIC(Npc_Default)
{
	name[0] = "Орик";
	guild = GIL_PAL;
	id = 25100;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Lee_Dhnlich,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_25100;
};


func void rtn_start_25100()
{
	TA_Stand_Guarding(8,0,21,0,"PLFT_ORIC");
	TA_Stand_Guarding(21,0,8,0,"PLFT_ORIC");
};

func void rtn_tot_25100()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

