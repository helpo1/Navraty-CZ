
instance Mil_309_Stadtwache(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 309;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Weak_Herek,BodyTex_N,ITAR_TOWNGUARD);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_309;
};


func void Rtn_Start_309()
{
	TA_Stand_ArmsCrossed(3,0,21,0,"NW_CITY_ENTRANCE_GUARD_01_81");
	TA_WacheFackel(21,0,3,0,"NW_CITY_ENTRANCE_GUARD_01_81");
};

