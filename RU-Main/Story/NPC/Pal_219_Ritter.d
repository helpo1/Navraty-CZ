
instance Pal_219_Ritter(Npc_Default)
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
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBald01,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_219;
};

func void Rtn_Start_219()
{
	TA_Pray_Innos(7,0,8,0,"OW_PAL_WESTMINE_03");
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_264");
	TA_Stand_Guarding(23,0,7,0,"OW_PATH_264");
};

func void rtn_grimesesc_219()
{
	TA_Pray_Innos(6,0,17,0,"OW_PAL_WESTMINE_03");
	TA_Pray_Innos(17,0,6,0,"OW_PAL_WESTMINE_03");
};