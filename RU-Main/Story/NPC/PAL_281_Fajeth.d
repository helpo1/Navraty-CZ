
instance PAL_281_Fajeth(Npc_Default)
{
	name[0] = "Фаджет";
	guild = GIL_OUT;
	id = 281;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Fingers,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_281;
};


func void Rtn_Start_281()
{
	TA_Stand_Eating(3,0,4,0,"OW_NEWMINE_09");
	TA_Stand_Guarding(4,0,15,0,"OW_NEWMINE_09");
	TA_Stand_Eating(15,0,16,0,"OW_NEWMINE_09");
	TA_Stand_Guarding(16,0,3,0,"OW_NEWMINE_09");
};

