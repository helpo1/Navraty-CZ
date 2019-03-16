
instance BDT_1002_Bandit_L(Npc_Default)
{
	name[0] = "Бродяга";
	guild = GIL_BDT;
	id = 1002;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal02,BodyTex_P,itar_bdt_f);
	Mdl_SetModelFatness(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	start_aistate = ZS_Bandit;
};

