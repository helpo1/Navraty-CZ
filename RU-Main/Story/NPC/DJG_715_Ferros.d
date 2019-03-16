
instance DJG_715_Ferros(Npc_Default)
{
	name[0] = "Ферос";
	guild = GIL_DJG;
	id = 715;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_715;
};


func void Rtn_Start_715()
{
	TA_Stand_Eating(8,0,23,0,"OC_JAN");
	TA_Stand_Eating(23,0,8,0,"OC_JAN");
};

