
instance PAL_2530_WACHE(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 2530;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Pacho,BodyTex_B,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_2530;
};


func void rtn_prestart_2530()
{
	TA_Stand_Guarding(4,0,21,0,"NW_ENTERVALLEY_05");
	TA_WacheFackel(21,0,4,0,"NW_ENTERVALLEY_05");
};

func void rtn_start_2530()
{
	TA_Stand_Guarding(4,0,21,0,"NW_ENTERPALFORT");
	TA_WacheFackel(21,0,4,0,"NW_ENTERPALFORT");
};

func void rtn_tot_2530()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

