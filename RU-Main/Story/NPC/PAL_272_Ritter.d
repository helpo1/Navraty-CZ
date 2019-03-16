
instance PAL_272_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 272;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal08,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_272;
};


func void Rtn_Start_272()
{
	TA_Guard_Passage(8,0,22,0,"OC_GUARD_ENTRANCE");
	TA_Sit_Chair(22,0,8,0,"OC_GUARD_ROOM_01_FIRE");
};

func void rtn_attack_272()
{
	TA_Stand_Guarding(8,0,22,0,"OC_TO_GUARD");
	TA_Stand_Guarding(22,0,8,0,"OC_TO_GUARD");
};

