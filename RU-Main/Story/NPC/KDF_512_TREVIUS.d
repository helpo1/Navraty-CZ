
instance KDF_512_TREVIUS(Npc_Default)
{
	name[0] = "Тревиус";
	guild = GIL_KDF;
	id = 512;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Corristo,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_512;
	CreateInvItems(self,itwr_xardasdocs_3,1);
};

func void rtn_start_512()
{
	TA_Sleep(8,0,22,0,"NW_FARM2_TAVERNCAVE1_02");
	TA_Sleep(22,0,8,0,"NW_FARM2_TAVERNCAVE1_02");
};
