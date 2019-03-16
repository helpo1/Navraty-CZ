
instance DJG_705_ANGAR_LI(Npc_Default)
{
	name[0] = "Angar";
	guild = GIL_DJG;
	id = 8050;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ANGAR_SCHWERT);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_CorAngar,BodyTex_B,ITAR_CorAngar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_8050;
};


func void rtn_start_8050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"LI_MAN_05");
	TA_Stand_ArmsCrossed(23,0,8,0,"LI_MAN_05");
};

func void rtn_runaway_8050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_CREW_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"SHIP_CREW_03");
};

