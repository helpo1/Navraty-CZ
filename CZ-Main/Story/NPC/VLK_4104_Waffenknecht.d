
instance VLK_4104_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4104;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Grim,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4104;
};


func void Rtn_Start_4104()
{
	TA_Stand_Guarding(4,0,21,0,"OC_GUARD_PALISADE_04");
	TA_WacheFackel(21,0,4,0,"OC_GUARD_PALISADE_04");
};

