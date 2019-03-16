
instance VLK_4145_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4145;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart09,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4145;
};


func void Rtn_Start_4145()
{
	TA_Stand_Guarding(4,0,21,0,"OC_GUARD_PALISADE_07");
	TA_WacheFackel(21,0,4,0,"OC_GUARD_PALISADE_07");
};

func void rtn_attack_4145()
{
	TA_Smalltalk(8,0,23,0,"OC_CENTER_03");
	TA_Sit_Campfire(23,0,8,0,"OC_KNECHTCAMP_01");
};

