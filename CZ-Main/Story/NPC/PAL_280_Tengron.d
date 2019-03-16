
instance PAL_280_Tengron(Npc_Default)
{
	name[0] = "Tengron";
	guild = GIL_OUT;
	id = 280;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_ToughBald01,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_280;
};


func void Rtn_Start_280()
{
	TA_Stand_Eating(7,0,8,0,"OW_NEWMINE_02");
	TA_Stand_Guarding(8,0,22,0,"OW_NEWMINE_02");
	TA_Stand_Eating(22,0,23,0,"OW_NEWMINE_02");
	TA_Stand_Guarding(23,0,8,0,"OW_NEWMINE_02");
};

func void Rtn_RunAfterVirtualRefugee_280()
{
	TA_RunToWP(8,0,23,0,"OW_PATH_06_05");
	TA_RunToWP(23,0,8,0,"OW_PATH_06_05");
};

