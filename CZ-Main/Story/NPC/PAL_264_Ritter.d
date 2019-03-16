
instance PAL_264_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 264;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ratford,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_264;
};


func void Rtn_Start_264()
{
	TA_Stand_Guarding(8,0,19,0,"OC_GUARD_STORE_01");
	TA_Stand_Guarding(19,0,8,0,"OC_GUARD_STORE_01");
};

func void rtn_attack_264()
{
	TA_Smalltalk(8,0,23,0,"OC_CENTER_02");
	TA_Sit_Campfire(23,0,8,0,"OC_KNECHTCAMP_01");
};

func void rtn_camp_264()
{
	TA_Sit_Campfire(8,0,23,0,"OC_KNECHTCAMP_01");
	TA_Sit_Campfire(23,0,8,0,"OC_KNECHTCAMP_01");
};

