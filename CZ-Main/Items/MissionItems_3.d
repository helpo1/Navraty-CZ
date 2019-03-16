
const int AM_EyeProtFire = 50;
var int readbooksdone_99;

instance ItMi_InnosEye_MIS(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	text[2] = NAME_Prot_Fire;
	count[2] = AM_EyeProtFire;
	text[4] = "Oko pulzuje tajemnou energií...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_InnosEye_Bad(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Artefakt pulzuje tajemnou energií...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_FIRE] += AM_EyeProtFire;
};

func void UnEquip_InnosEye()
{
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
};

instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Discharged_Mis;
	on_unequip = unequip_itmi_innoseye_discharged_mis;
	text[2] = NAME_Prot_Fire;
	count[2] = AM_EyeProtFire;
	text[4] = "Oko je ztemnělé a vůbec nezáří...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	self.protection[PROT_FIRE] += AM_EyeProtFire;
};

func void unequip_itmi_innoseye_discharged_mis()
{
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
};


instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Broken_Mis;
	text[3] = TEXT_Innoseye_Setting;
	text[4] = TEXT_Innoseye_Gem;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = "Plná moc pro Pyrokara";
	text[4] = "Tenhle dokument zplnomocňuje svého majitele nosit Innosovo oko...";
	inv_animate = 1;
};


func void Use_PermissionToWearInnosEye()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nositel tohoto dokumentu může vstoupit do posvátných síní kláštera. Nechť je jeho přáním ohledně Innosova oka okamžitě vyhověno. Tyto rozkazy udílím z moci své pozice králova hlavního zástupce na ostrově a jsou pravomocné.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Lord Hagen");
	Doc_Show(nDocID);
};


instance ItWr_XardasBookForPyrokar_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Irdorathské síně";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasBookForPyrokar;
	inv_animate = 1;
};


func void Use_XardasBookForPyrokar()
{
	AI_Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Corneliův deník";
	text[4] = "Deník asistenta khoriniského místodržícího...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseCorneliusTagebuch;
	inv_animate = 1;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;

	if(Cornelius_IsLiar == FALSE)
	{
		B_LogEntry(TOPIC_RescueBennet,"Tenhle deník dokazuje, že Bennet je nevinný.");
		Cornelius_IsLiar = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jestli bude Larius takhle pokračovat, budu si muset najít jinou pozici.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Včera večer se mi stala prapodivná věc. Přišel ke mně jeden z těch černých zakuklenců, o kterých jsme toho v poslední době tolik slyšeli. Nebyl jsem moc nervózní, i když z tajemného návštěvníka přímo čišelo nějaké zlo a jeho moc byla skoro hmatatelná. Jeho hlas byl však klidný a příjemný - měl jsem pocit, že mu prostě musím věřit.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Nabídl mi 20 000 zlatých, když se postarám, aby byl jeden z těch žoldáků odsouzen a pověšen. To je příliš dobrá nabídka, než abych se začal vyptávat.");
	Doc_PrintLines(nDocID,1,"Samozřejmě že jsem souhlasil, protože ta chátra si stejně nic jiného nezaslouží. A zlato, které za to dostanu, mi zajistí slušné živobytí až do smrti.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Téměř jsem nemusel ani pohnout prstem. Jednoho z těch žoldáků už mají pod zámkem. Ať ho už obviní z čehokoli, bude viset. Skvělý způsob, jak dodržet své slovo a zajistit si bezstarostné stáří.");
	Doc_Show(nDocID);
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Almanach posedlých";
	text[4] = "Už jediný pohled na tuhle knihu začíná vzbuzovat šílenství...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_DementorObsessionBook;
	inv_animate = 1;
};


func void Use_DementorObsessionBook()
{
	var int nDocID;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);

	if(hero.guild == GIL_KDF)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,Font_Book_New);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Přijď ke mně síla tvá");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Z temných síní");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Přijď ke mně");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Paprskem světla neviditelného");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Vstup do mne a vzplaň");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");

		if(Kapitel >= 3)
		{
			Doc_PrintLine(nDocID,1,"Vino");
			Doc_PrintLine(nDocID,1,"Fernando");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Malak");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Bromor");
		};
		if(Kapitel >= 4)
		{
			Doc_PrintLine(nDocID,1,"Engrom");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Randolph");
			Doc_PrintLine(nDocID,1,"");
		};
		if(Kapitel >= 5)
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Sekob");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Brutus");
			Doc_PrintLine(nDocID,1,"");
		};
		Doc_Show(nDocID);
	};
};


instance ItWr_PyrokarsObsessionList(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PyrokarsObsessionList;
	scemeName = "MAP";
	description = "Pyrokarův magický svitek";
	inv_animate = 1;
};


func void Use_PyrokarsObsessionList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posedlí:");

	if(Kapitel >= 3)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Fernando");
		Doc_PrintLine(nDocID,0,"Vino");
		Doc_PrintLine(nDocID,0,"Malak");
		Doc_PrintLine(nDocID,0,"Bromor");
	};
	if(Kapitel >= 4)
	{
		Doc_PrintLine(nDocID,0,"Engrom");
		Doc_PrintLine(nDocID,0,"Randolph");
	};
	if(Kapitel >= 5)
	{
		Doc_PrintLine(nDocID,0,"Sekob");
		Doc_PrintLine(nDocID,0,"Brutus");
		Doc_PrintLine(nDocID,0,"");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[4] = "Lék na černou horečku...";
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = "Vycházková hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_RADIUS;
	count[3] = range;
	text[4] = "Na rukojeti je vyvedeno ozdobné písmeno 'M'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MalethsBanditGold(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
	text[4] = "Měšec plný zlata...";
	inv_animate = 1;
};

func void Use_MalethsBanditGold()
{
	B_PlayerFindItem(ItMi_Gold,300);
};


instance ItMi_Moleratlubric_MIS(C_Item)
{
	name = "Sádlo z krysokrta";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_Pitch_New.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_BabosLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosLetter;
	scemeName = "MAP";
	description = "Dopis pro Baba";
	inv_animate = 1;
};


func void Use_BabosLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Milý Babo,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Určitě se divíš, jak to, že ti píšeme. Přejeme ti do budoucna jen to nejlepší a jako dárek na rozloučenou ti posíláme obrázek, abys měl na co vzpomínat za dlouhých večerů v klášteře. Hodně štěstí - snad se ti ta malůvka bude líbit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Feht a Bonka");
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Kresba";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = "Obrázek nahé ženy";
	inv_animate = 1;
};


func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Pinup.TGA",0);
	Doc_Show(nDocID);
};


instance ItWr_BabosDocs_MIS(C_Item)
{
	name = "Svazek papírů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosDocs;
	scemeName = "MAPSEALED";
	description = name;
	text[4] = "Několik dokumentů srolovaných dohromady...";
	inv_animate = 1;
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Božská moc hvězd";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
	inv_animate = 1;
};


var int Astronomy_once;

func void Use_Astronomy()
{
	var int nDocID;

	if(Astronomy_once == FALSE)
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Astronomy_once = TRUE;
	};
	if((BookBonus_25 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_25 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... ale když se síla vola spojí s ideály válečníka, pak se střezte událostí, které mohou nastat.");
	Doc_PrintLines(nDocID,0,"Nespoutaná síla vola a vytrvalost válečníka dokáže narušit pradávnou rovnováhu sil. Hranice mezi dimenzemi pak začne slábnout - až nakonec bude tak tenká, že k nám ze světa stínů snadno proniknou Beliarovy nestvůry.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Války ze starých časů nám budiž příkladem, jak něco takového dopadá. I když tehdy byla vazba mezi světy ještě stále pevná, stoupenci zla sem přinesli smrt a zkázu, před kterou lidstvo ochránil pouze Innos a jeho vyvolený.");
	Doc_PrintLines(nDocID,1,"Innos nás chraň, jestli by se měla podobná hrozba znovu objevit, protože žádný další Innosův vyvolený nepřišel už víc jak sto let.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[4] = "Lék proti posedlosti...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	if(Npc_IsPlayer(self))
	{
		B_ClearSCObsession(self);
	};
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",self,self,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_GolemChest;
	description = "Měšec";
	text[4] = "Tenhle měšec je plný mincí...";
	inv_animate = 1;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	AI_Print(PRINT_FoundGold50);
	AI_Print(PRINT_FoundRing);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
};


instance ITWR_SHATTEREDGOLEM_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = "Velice stará mapa";
	text[4] = "Jedno místo je vyznačeno křížkem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_ShatteredGolem_Mis()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_DiegosLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = "Dopis od Diega";
	text[4] = "Tenhle dopis je adresován Gerbrandtovi...";
	inv_animate = 1;
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Gerbrandte, víš, měl jsi mě radši zabít. Teď jsem zpátky ve městě a hledám tě. A až tě najdu, nadělám z tebe sekanou. Znáš mě už dost dlouho, abys věděl, že se jen tak lehce oblbnout nenechám. Jestli je ti život milý, tak si sbalíš fidlátka a svůj obchod přenecháš mně. Tím si budeme kvit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Diego");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_DiegosTreasure;
	description = "Diegův starý měšec";
	text[4] = "Měšec přesmíru nacpaný zlatem...";
	inv_animate = 1;
};


func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;
	B_PlayerFindItem(ItMi_Gold,DiegosTreasure);
};


instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name = "Svěcená voda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = "Svěcená voda";
	text[4] = "Tuhle láhev svěcené vody mi dal mág Ohně Ulthar...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


var int ItWr_MinenAnteil_Mis_OneTime;

instance ItWr_MinenAnteil_Mis(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = "Akcie";
	text[4] = "Cenný papír zaručující vlastnictví rudného naleziště...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_MinenAnteil_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tímto dokumentem uděluje král a vládce této říše jeho nositeli právo kutat na území pod královskou správou a vykonávat na něm úřad prospektora.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Královský prospektor");
	Doc_PrintLine(nDocID,0,"Salandril");
	Doc_Show(nDocID);
	SC_KnowsProspektorSalandril = TRUE;
	if(ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile,"Ten chlapík, který prodal důlní akcie obchodníkům, se jmenuje Salandril. Najdu ho nejspíš v horní čtvrti Khorinisu, jestli tedy už před spravedlností neutekl někam dál.");
		if(Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile,"Salandril je mrtev. Musím to oznámit Serpentesovi.");
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};


instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Amulet přivolávání duší";
	text[4] = "Amulet ochrany před temnou magií Pátračů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = "Kus kamene";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_KarrasBlessedStone_Mis_Sky.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[4] = "Kámen ze svaté půdy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RichterKomproBrief;
	scemeName = "MAP";
	description = "Rozkazy od soudce";
	text[4] = "Tuhle poznámku napsal soudce města Khorinis...";
	inv_animate = 1;
};


func void Use_RichterKomproBrief()
{
	var int nDocID;
	SCKnowsRichterKomproBrief = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Morgaharde, ty mizerný budižkničemu! Buď vyplníš moje rozkazy, nebo se naštvu a nechám vás všechny zavřít, až zčernáte! Musíte to provést zítra v noci. Larius už začíná něco tušit. Jestli ty důkazy nezničíme teď, pak už může být pozdě. Postarám se, aby ses s ním setkal dneska večer na tržišti.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_MorgahardTip(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};


func void Use_MorgahardTip()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pokračuji dál. Doufám, že až se to trochu uklidní, zase se setkáme. Žádné strachy, hoši. Když selže všechno ostatní, požádám Onara, aby na to dohlédl. Bude to v pořádku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"M.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_MAP_SHRINE_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = "Mapa oltářů";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Shrine_MIS()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_VinosKellergeister_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Duch vína";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_VinosKellergeister_Mis;
	inv_animate = 1;
};


func void Use_VinosKellergeister_Mis()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_99 == FALSE)
	{
		READBOOKSDONE_99 = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
		RankPoints = RankPoints + 1;
		B_LogEntry(TOPIC_COOK,"Ingredience pro GIN: 10x kořalka.");
	}
	else
	{
		rnd = Hlp_Random(100);
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_26 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_26 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Moc hroznů");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... už jsem toho v životě vyzkoušel spoustu, ale tohle ovoce, které mi minulý týden přivezli z ciziny, předčí všechna má očekávání...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... šťáva z těchto hroznů je daleko vydatnější než cokoliv, co lze získat v těchto končinách...");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... takže zatím to jde dobře. Ale pořád mi nedá spát pomyšlení, co by se mohlo stát, kdyby mě chytli při výrobě toho ginu. Radši ani nechci vědět, co by domobrana provedla. Možná by mě dokonce hodili přes bariéru...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... začínají mít podezření. Radši se odsud vypařím a počkám, až se věci trochu uklidní. Vrátím se, až budu mít jistotu, že po mně už nejdou...");
	Doc_Show(nDocID);
};


instance ITWR_DEATH1(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ITWR_DEATH1;
	scemeName = "MAP";
	description = "Dech smrti I";
	text[4] = "První část receptu na přípravu lektvaru 'Dech smrti'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITWR_DEATH1()
{
	var int nDocID;
	var int rnd;

	if(KNOWS_BREATH_OF_DEATH1 == FALSE)
	{
		B_GivePlayerXP(250);
		KNOWS_BREATH_OF_DEATH1 = TRUE;

		if(MIS_ROBA_XARDAS == LOG_Running)
		{
			B_LogEntry(TOPIC_XARDAS_ROBA,"Našel jsem první část receptu...");
		};

		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);

		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_27 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_27 = TRUE;
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Dech smrti'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Srdce démona - 1 kus");
	Doc_PrintLine(nDocID,0,"Kost z kostlivce - 20 kusů");
	Doc_PrintLine(nDocID,0,"Maso z mrtvoly - 5 kusů");
	Doc_PrintLine(nDocID,0,"Lebka - 1 kus");
	Doc_PrintLine(nDocID,0,"Královský šťovík - 2 kusy");
	Doc_PrintLine(nDocID,0,"Dračí kořen - 2 kusy");
	Doc_PrintLine(nDocID,0,"Gobliní bobule - 2 kusy");
	Doc_PrintLine(nDocID,0,"Sluneční aloe - 1 kus");
	Doc_PrintLine(nDocID,0,"Ohnivý kořen - 1 kus");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"______________");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"KONEC PRVNÍ ČÁSTI RECEPTU");
	Doc_PrintLines(nDocID,0,"______________");
	Doc_Show(nDocID);
};


instance ITWR_DEATH2(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ITWR_DEATH2;
	scemeName = "MAP";
	description = "Dech smrti II";
	text[4] = "Druhá část receptu na přípravu lektvaru 'Dech smrti'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITWR_DEATH2()
{
	var int nDocID;
	var int rnd;

	if(KNOWS_BREATH_OF_DEATH2 == FALSE)
	{
		B_GivePlayerXP(250);
		KNOWS_BREATH_OF_DEATH2 = TRUE;

		if(MIS_ROBA_XARDAS == LOG_Running)
		{
			B_LogEntry(TOPIC_XARDAS_ROBA,"Našel jsem druhou část receptu...");
		};

		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);

		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_28 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_28 = TRUE;
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Dech smrti'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"______________");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"POKRAČOVÁNÍ PRVNÍ ČÁSTI RECEPTU");
	Doc_PrintLines(nDocID,0,"______________");
	Doc_PrintLine(nDocID,0,"Modrý bez - 10 kusů");
	Doc_PrintLine(nDocID,0,"Černá perla - 1 kus");
	Doc_PrintLine(nDocID,0,"Ohnivý jazyk - 3 kusy");
	Doc_PrintLine(nDocID,0,"Akvamarín - 5 kusů");
	Doc_PrintLine(nDocID,0,"Perla - 3 kusy");
	Doc_PrintLine(nDocID,0,"Kamenný krystal - 10 kusů");
	Doc_PrintLine(nDocID,0,"Křemen - 5 kusů");
	Doc_PrintLine(nDocID,0,"Červený pepř - 1 kus");
	Doc_PrintLine(nDocID,0,"Víno 'Balzám prozřetelnosti' - 1 láhev");
	Doc_PrintLine(nDocID,0,"Elixír čisté many - 1 láhev");
	Doc_PrintLine(nDocID,0,"Voda - 15 láhví");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};