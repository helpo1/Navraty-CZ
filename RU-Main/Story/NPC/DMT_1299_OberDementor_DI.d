
instance DMT_1299_OberDementor_DI(Npc_Default)
{
	name[0] = "Деметор, страж Зверя";
	guild = GIL_DMT;
	id = 1299;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	bodyStateInterruptableOverride = TRUE;
	level = 500;
	attribute[ATR_STRENGTH] = 500;
	aivar[REAL_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 500;
	aivar[REAL_DEXTERITY] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	aivar[REAL_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_LastDoorToUndeadDrgDI_MIS,1);
	CreateInvItems(self,ItKe_ChestMasterDementor_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1299;
};

func void Rtn_Start_1299()
{
	TA_Stand_Dementor(8,0,23,0,"DI_SCHWARZMAGIER");
	TA_Stand_Dementor(23,0,8,0,"DI_SCHWARZMAGIER");
};

