
instance XOR_12206_WARRIORNATURE(Npc_Default)
{
	name[0] = "Асгард";
	guild = GIL_OUT;
	npcType = npctype_main;
	level = 60;
	voice = 4;
	id = 12206;
	flags = NPC_FLAG_IMMORTAL;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_ASGARDSWORD);
	B_SetAttributesToChapter(self,14);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",165,BodyTex_N,ITAR_Raven_Addon_NPC_NE);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_SetFightSkills(self,100);
	B_GiveNpcTalents(self);
	CreateInvItems(self,ItPo_Health_03,10);
	daily_routine = rtn_tot_12206;
};

func void rtn_start_12206()
{
	TA_Stand_Guarding(8,0,23,0,"WP_TEST_01");
	TA_Stand_Guarding(23,0,8,0,"WP_TEST_01");
};

func void rtn_tot_12206()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

