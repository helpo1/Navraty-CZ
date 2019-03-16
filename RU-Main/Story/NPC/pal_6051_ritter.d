
instance PAL_6051_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6051;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_DropDeadAndKill] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword_Etlu);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough01,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6051;
};


func void rtn_start_6051()
{
	TA_Stand_Guarding(9,0,23,0,"INSEL_DORF_58");
	TA_Stand_Guarding(23,0,9,0,"INSEL_DORF_58");
};

