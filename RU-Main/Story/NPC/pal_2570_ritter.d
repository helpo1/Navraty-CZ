
instance PAL_2570_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 2570;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_2570;
};


func void rtn_prestart_2570()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_06");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_06");
};

func void rtn_start_2570()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_2570()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

