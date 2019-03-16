
instance PAL_258_Keroloth(Npc_Default)
{
	name[0] = "Керолот";
	guild = GIL_PAL;
	id = 258;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal20,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_258;
};


func void Rtn_Start_258()
{
	TA_Stand_Guarding(8,0,19,0,"OC_CENTER_05_B");
	TA_Roast_Scavenger(19,0,8,0,"OC_CAMPFIRE_BARBQ");
};

func void Rtn_Tot_258()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};