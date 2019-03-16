
instance DMT_12140_TEGON(Npc_Default)
{
	name[0] = "Тегон, Хранитель Тьмы";
	guild = GIL_OUT;
	level = 500;
	voice = 18;
	id = 12140;
	flags = 0;
	flags = NPC_FLAG_IMMORTAL;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_12140;
};


func void rtn_start_12140()
{
	TA_Read_Bookstand(8,0,21,0,"WP_GUARDIANS_TEGON");
	TA_Read_Bookstand(21,0,8,0,"WP_GUARDIANS_TEGON");
};

func void rtn_tot_12140()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"TOT");
	TA_Stand_ArmsCrossed(21,0,8,0,"TOT");
};

