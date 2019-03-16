
instance PAL_6056_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6056;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword_Etlu);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBald01,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6056;
};


func void rtn_start_6056()
{
	TA_Practice_Sword(8,0,21,0,"INSEL_DORF_502");
	TA_Sit_Bench(21,0,8,0,"INSEL_DORF_98");
};

