
instance NONE_110_Urshak(Mst_Default_OrcShaman)
{
	name[0] = "Ур-Шак";
	guild = GIL_FRIENDLY_ORC;
	id = 110;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[93] = TRUE;
	voice = 18;
	flags = 0;
	level = 1;
	npcType = NPCTYPE_FRIEND;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaOrc",DEFAULT,DEFAULT,"Orc_HeadShaman",0,DEFAULT,-1);
	fight_tactic = FAI_ORC;
	daily_routine = Rtn_PreStart_110;
};


func void Rtn_PreStart_110()
{
	TA_Stand_WP(8,0,22,0,"OW_URSHAK");
	TA_Stand_WP(22,0,8,0,"OW_URSHAK");
};

func void Rtn_Start_110()
{
	TA_Stand_WP(8,0,22,0,"OW_HOSHPAK_04");
	TA_Stand_WP(22,0,8,0,"OW_HOSHPAK_04");
};

func void rtn_orcatc_110()
{
	TA_Stand_WP(8,0,22,0,"OC_MAGE_LAB_ALCHEMY");
	TA_Stand_WP(22,0,8,0,"OC_MAGE_LAB_ALCHEMY");
};

