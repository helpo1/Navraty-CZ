
instance PAL_273_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 273;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mordrag,BodyTex_P,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_273;
};


func void Rtn_Start_273()
{
	TA_Smalltalk(8,0,23,0,"OC_TO_MAGE");
	TA_Smalltalk(23,0,8,0,"OC_KNECHTCAMP_02");
};

func void rtn_attack_273()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_GUARD_01");
};

