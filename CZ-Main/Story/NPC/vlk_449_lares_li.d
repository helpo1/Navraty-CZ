
instance VLK_449_LARES_LI(Npc_Default)
{
	name[0] = "Lares";
	guild = GIL_NONE;
	id = 8065;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_lares_axt);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8065;
};


func void rtn_start_8065()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_CREW_05");
	TA_Stand_Guarding(23,0,8,0,"SHIP_CREW_05");
};

