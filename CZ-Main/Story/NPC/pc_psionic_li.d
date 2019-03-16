
instance PC_PSIONIC_LI(Npc_Default)
{
	name[0] = "Lester";
	guild = GIL_NONE;
	id = 8056;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	EquipItem(self,itmw_lester_sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Lester,BodyTex_P,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_8056;
};


func void rtn_start_8056()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"LI_MAN_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"LI_MAN_02");
};

func void rtn_runaway_8056()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_DECK_28");
	TA_Stand_ArmsCrossed(23,0,8,0,"SHIP_DECK_28");
};

