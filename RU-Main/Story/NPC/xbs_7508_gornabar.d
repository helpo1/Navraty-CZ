
instance XBS_7508_GORNABAR(Npc_Default)
{
	name[0] = "Гор На Бар";
	guild = GIL_OUT;
	id = 7508;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_XBSMAIN;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_NewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Zweihaender2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Normal_GorNaBar,BodyTex_N,itar_tpl_s);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_7508;
};


func void rtn_start_7508()
{
	TA_Stand_Eating(7,10,7,40,"WP_COAST_BASE_27");
	TA_Stand_ArmsCrossed(7,40,7,10,"WP_COAST_BASE_27");
};