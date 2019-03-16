
instance Pal_218_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_OUT;
	id = 218;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart05,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_218;
};


func void Rtn_Start_218()
{
	TA_Pray_Innos(6,0,7,0,"OW_PAL_WESTMINE_03");
	TA_Stand_Guarding(7,0,23,0,"OW_PATH_148_A");
	TA_Stand_Guarding(23,0,6,0,"OW_PATH_148_A");
};

func void rtn_grimesesc_218()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PAL_WESTMINE_02");
	TA_Stand_Guarding(23,0,8,0,"OW_PAL_WESTMINE_02");
};