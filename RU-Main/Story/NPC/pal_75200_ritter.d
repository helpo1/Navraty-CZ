
instance PAL_75200_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 75200;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal08,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_75200;
};


func void rtn_prestart_75200()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_09");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_09");
};

func void rtn_start_75200()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_75200()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

