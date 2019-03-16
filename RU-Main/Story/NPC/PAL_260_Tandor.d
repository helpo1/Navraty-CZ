
instance PAL_260_Tandor(Npc_Default)
{
	name[0] = "Тандор";
	guild = GIL_PAL;
	id = 260;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Schwert2);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_260;
};


func void Rtn_Start_260()
{
	TA_Stand_Guarding(8,0,23,0,"OC_STAND_TANDOR_01");
	TA_Stand_Guarding(23,0,8,0,"OC_STAND_TANDOR_01");
};

func void Rtn_PostenVerlassen_260()
{
	TA_Practice_Sword(8,0,23,0,"OC_CENTER_03");
	TA_Stand_Eating(23,0,8,0,"OC_CENTER_03");
};

func void rtn_attack_260()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_GUARD_01");
	TA_Stand_Eating(23,0,8,0,"OC_PRISON_GUARD_01");
};

func void rtn_TOT_260()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};
