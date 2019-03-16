
instance PAL_6078_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6078;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword_Etlu);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal_Fletcher,BodyTex_P,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6078;
};


func void rtn_start_6078()
{
	TA_Stand_ArmsCrossed(8,0,19,0,"INSEL_BAUERNHAUS_167");
	TA_Sit_Bench(19,0,8,0,"INSEL_DORF_71");
};

