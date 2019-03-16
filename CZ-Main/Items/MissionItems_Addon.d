
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = "Zpráva pro Vatrase";
	text[4] = "Tato zpráva je pečlivě zapečetěna...";
	inv_animate = 1;
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milý Vatrasi!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Měl jsi pravdu. Opravdu to vypadá, že šlo o uctívače Adana. Ten ornament, který jsme našli, je teď ale mnohem důležitější. Nejspíš se jedná o nějaký artefakt - klíč. Musíme ho prostudovat důkladněji. Vyšli, prosím, někoho z 'Kruhu Vody', aby nám ho přinesl zpátky.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Saturas");
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"U jednoho z banditů jsem našel zprávu, kterou měl Cavalorn doručit mágovi Vody Vatrasovi. Takže teď je to na mně.");
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Jedno zdejší uskupení si říká 'Kruh Vody' a v jeho čele podle všeho stojí mágové Vody.");
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Cavalorn patří do 'Kruhu Vody'.");
	};
	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = "Zpráva pro Vatrase";
	text[4] = "Pečeť na zprávě byla zlomena...";
	inv_animate = 1;
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "Kamenný úlomek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kamenný úlomek velikého kruhového ornamentu...";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
	inv_animate = 1;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "Kamenný úlomek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Kamenný úlomek velikého kruhového ornamentu...";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
	inv_animate = 1;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = "Nefariusova mapa";
	text[4] = "Na této mapě jsou vyznačena místa, kde jsou chybějící části ornamentu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Ornaments()
{
	var int Document;
	SC_SAW_ORNAMENT_MAP = TRUE;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ITWR_MAP_NEWWORLD_DEXTER_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = "Mapa Khorinisu";
	text[4] = "Na této mapě je vyznačen tábor vůdce banditů Dextera...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Dexter()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


prototype Rangerring_Prototype(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = "Akvamarínový prsten";
	text[3] = "Tenhle prsten je poznávacím znamením 'Kruhu Vody'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};
		SCIsWearingRangerRing = TRUE;
		AI_Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};
		RangerRingIsLaresRing = FALSE;
	};
};


instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	text[4] = "Tenhle prsten patří Laresovi...";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[4] = "Tenhle prsten patří mně...";
};

instance ItRi_LanceRing(Rangerring_Prototype)
{
	text[4] = "Tenhle prsten patří Lanceovi...";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Kruhový ornament";
	text[4] = "Tenhle kruhový ornament otevírá magický portál...";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_animate = 1;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Martinův doporučující dopis";
	text[4] = "Doporučující dopis pro velitele domobrany lorda Andreho...";
	inv_animate = 1;
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Velevážený lorde Andre!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Spolu s tímto dopisem k Vám posílám i nadějného rekruta domobrany. Shledal jsem ho užitečným, pečlivým a důsledným při řešení složitých úkolů. Jsem si jistý, že stejně dobře bude chránit krále i občany tohoto města!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Proviantmistr Martin");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = "Ravenovy rozkazy";
	text[4] = "Tenhle dopis jsem sebral banditovi Dexterovi...";
	inv_animate = 1;
};


var int Use_RavensKidnapperMission_Addon_OneTime;

func void Use_RavensKidnapperMission_Addon()
{
	var int nDocID;
	if((Use_RavensKidnapperMission_Addon_OneTime == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Tak teď už to mám černé na bílém. Za těmi únosy khoriniských obyvatel stojí bývalý rudobaron Raven. Skrývá se kdesi za horami severovýchodně od města. Tenhle dokument by měl vidět Vatras.");
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dextere! Jestli v nejbližší době neuneseš z města nějaký další lidi a nepošleš mi je, čekaj nás vážný potíže s hochy v naší základně. Nutně potřebuju další otroky, nebo budu mít brzo na krku vzpouru. Nemusím ti říkat, co to znamená, viď? Už jsem se skoro dostal do chrámu, takže teď si rozhodně nemůžu dovolit žádný takovýhle potíže.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Raven");
	Doc_Show(nDocID);
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Vatrasův doporučující dopis";
	text[4] = "Tenhle dopis mi pomůže dostat se do kláštera mágů Ohně...";
	inv_animate = 1;
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bratři Ohně!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Právě jsem se dozvěděl, že za vstup do vašich řad vyžadujete nějaký poplatek. Proto s tímto dopisem posílám zbožného muže, který by se rád stal vaším novicem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = "Posvěcená soška Innose";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue * 10;
	visual = "ItMi_InnosStatue_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_GoblinnosStatue_Daron_New(C_Item)
{
	name = "Posvěcená soška Innose";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue * 5;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Vypadá nějak podezřele...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_LuciasLoveLetter_Addon;
	scemeName = "MAP";
	description = "Dopis na rozloučenou od Lucie";
	inv_animate = 1;
};


func void Use_LuciasLoveLetter_Addon()
{
	var int nDocID;

	if(MIS_LuciasLetter == FALSE)
	{
		MIS_LuciasLetter = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
		B_LogEntry(TOPIC_Addon_Lucia,"Lucia napsala Elvrichovi dopis na rozloučenou. To by ho mohlo zajímat.");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milovaný Elvrichu! Nemám slova, kterými bych se ti mohla omluvit. Vím, že bude těžké to pochopit, ale došla jsem k závěru, že bude pro nás oba lepší, když si najdeš nějakou slušnější holku, než jsem já. Odcházím a už se nevrátím. Sbohem!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lucia");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_Rake(C_Item)
{
	name = "Hrábě";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "G3_Item_Tool_Rake_01.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Use_Rake()
{
	if(Npc_IsPlayer(self) && (RakeBONUS == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 50;
		AI_NoticePrint(3000,4098,NAME_Addon_RakeBonus);
		RakeBONUS = TRUE;
	};
};

instance ItRi_Addon_BanditTrader(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Zdobený prsten";
	text[4] = "Symbol cechu zámořských kupců Araxos...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[4] = "Tenhle dopis jsem našel u banditů za Sekobovou farmou...";
	inv_animate = 1;
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	var int nDocID;
	BanditTrader_Lieferung_Gelesen = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"15 krátkých mečů");
	Doc_PrintLines(nDocID,0,"20 kordů");
	Doc_PrintLines(nDocID,0,"25 bochníků chleba");
	Doc_PrintLines(nDocID,0,"15 láhví vína");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"To bylo naposledy! Už to začíná být moc o hubu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Fernando");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Našel jsem dokument, který prokazuje, že Fernando je ten, kdo doručuje zbraně banditům.");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = "Zpráva pro Saturase";
	text[4] = "Tato zpráva je pečlivě zapečetěna...";
	inv_animate = 1;
};

func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milý Saturasi!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Doufám, že brzy dosáhnete svého cíle. Tady ve městě je poslední dobou klid, ale bojím se, aby to nebylo jen ticho před bouří. Měli byste si pospíšit. A ještě jedna věc: posílám vám pomoc. Doručitel této zprávy je opravdu výjimečný člověk. Úplně jistě to říci nemohu, ale mohl by to být ON. Vyzkoušej ho.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Vatras");
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = "Zpráva pro Saturase";
	text[4] = "Pečeť na zprávě byla zlomena...";
	inv_animate = 1;
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_Am_DexStrg;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Amulet pátrací bludičky";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name = "Maso z močálové krysy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_ItFo_Addon_Krokofleisch;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
	inv_animate = 1;
};

func void Use_ItFo_Addon_Krokofleisch()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	on_equip = Equip_MorgansRing;
	on_unequip = UnEquip_MorgansRing;
	wear = WEAR_EFFECT;
	description = "Morganův prsten";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 5;
	text[4] = "Tenhle prsten je zdoben spoustou krásných run...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_MorgansRing()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,5);
	};
};

func void UnEquip_MorgansRing()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-5);
	};
};

instance FakeUnitor(C_Item)
{
	name = "Ohniskový kámen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Focus(C_Item)
{
	name = "Ohniskový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Krystal soustřeďující magickou energii...";
	inv_animate = 1;
};

instance ItMi_UnSharp_MagicCrystal(C_Item)
{
	name = "Kus krystalu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Obsahuje magickou energii...";
	inv_animate = 1;
};

instance ItMi_MagicCrystal(C_Item)
{
	name = "Magický ohniskový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Magický krystal soustřeďující energii...";
	inv_animate = 1;
};

instance ItMi_Addon_Steel_Paket(C_Item)
{
	name = "Balík oceli";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Těžký balík se značným množstvím oceli...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Stará kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[4] = "Tabulka je pokryta nápisy v prastarém jazyce...";
	text[5] = NAME_Value;
	count[5] = 10;
	inv_animate = 1;
};


func void Use_StonePlateCommon()
{
	var int nDocID;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,-1,70,50,90,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Kasta válečnická na naše hlavy hněv boží seslala.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"QUARHODRONŮV následovník RHADEMES byl zapuzen, leč zlomoc jeho i z místa jeho vyhnanství k nám pronikla.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Byli jsme proti ní zcela bezmocní.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"ADANŮV hněv padl na JHARKENDAR!");
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_01(C_Item)
{
	name = "Červená kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_01;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[4] = "Tabulka je pokryta nápisy v prastarém jazyce Stavitelů...";
	inv_animate = 1;
};


func void Use_Addon_Stone_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"My, tři poslední vůdcové z Rady pěti, jali jsme se v síních chrámových rozličné pasti rozmístiti a vchod ukrýti, by meč již nikdy světla denního nespatřil.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_05(C_Item)
{
	name = "Žlutá kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_05;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[4] = "Tabulka je pokryta nápisy v prastarém jazyce Stavitelů...";
	inv_animate = 1;
};


func void Use_Addon_Stone_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"První past vytvořil jsem já, jenž proti rozhodnutí Tří jsem brojil. A pouze já vchodu správného znám.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_03(C_Item)
{
	name = "Modrá kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_03;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Tabulka je pokryta nápisy v prastarém jazyce Stavitelů...";
	inv_animate = 1;
};


func void Use_Addon_Stone_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Druhou past KHARDIMON sestrojil. A pouze on, jenž cestu Světla následuje, do třetí komnaty nakonec vejde.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_04(C_Item)
{
	name = "Zelená kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_04;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Tabulka je pokryta nápisy v prastarém jazyce Stavitelů...";
	inv_animate = 1;
};


func void Use_Addon_Stone_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Třetí past jest dílem QUARHODRONOVÝM. A pouze on ví, jak portál otevříti.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_02(C_Item)
{
	name = "Fialová kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_02;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Tabulka je pokryta nápisy v prastarém jazyce Stavitelů...";
	inv_animate = 1;
};


func void Use_Addon_Stone_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"A byl to též QUARHODRON, kdo s pomocí KHARDIMONOVOU vnější bránu chrámu uzavřel. Nikdo z nich rituál nepřežil.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Zůstal jsem pouze já, bych vám celý příběh vyprávěl.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Doufám, že RHADEMES v chrámu hníti bude navěky!");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name = "Zlatý kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Tohle navigační zařízení je vyrobeno z ryzího zlata...";
	inv_animate = 1;
};

instance ItSE_Addon_FrancisChest(C_Item)
{
	name = NAME_Chest;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = FrancisChest;
	description = "Truhlice s pokladem";
	text[4] = "Velice těžká...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void FrancisChest()
{
	CreateInvItems(hero,ItMi_ChestGold,1);
	CreateInvItems(hero,ItMw_FrancisDagger_Mis,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_CupGold,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
	Snd_Play("Geldbeutel");
};

instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Francisova účetní kniha";
	text[4] = "V téhle knize jsou veškeré záznamy o rozdělení pirátské kořisti...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseFrancisAbrechnung_Mis;
	inv_animate = 1;
};


func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Obchodní loď 'Mořská panna'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Celková kořist: 14560 zlatých");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posádka: 9840");
	Doc_PrintLine(nDocID,0,"Důstojníci: 2500");
	Doc_PrintLine(nDocID,0,"Kapitán: 1000");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Můj podíl: 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Obchodní loď 'Miriam'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Celková kořist: 4890 zlatých");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posádka: 2390");
	Doc_PrintLine(nDocID,0,"Důstojníci: 500");
	Doc_PrintLine(nDocID,0,"Kapitán: 500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Můj podíl: 1000");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Obchodní loď 'Nico'");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Celková kořist: 9970 zlatých");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Posádka: 5610");
	Doc_PrintLine(nDocID,1,"Důstojníci: 1500");
	Doc_PrintLine(nDocID,1,"Kapitán: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Můj podíl: 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Obchodní loď 'Maria'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Celková kořist: 7851 zlatých");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Posádka: 4400");
	Doc_PrintLine(nDocID,1,"Důstojníci: 750");
	Doc_PrintLine(nDocID,1,"Kapitán: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Můj podíl: 1701");
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Gregův deník";
	text[4] = "Lodní deník vůdce pirátů...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGregsLogbuch;
	inv_animate = 1;
};


func void UseGregsLogbuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Už mám tý pláže plný zuby. Všude nic než písek. Už se ani pořádně nevyspím, protože mě všecko svědí. Raven už by měl konečně navalit zlato za vězně, abychom mohli znova vyrazit na moře. Musím si s tím nafrněným kreténem promluvit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Co si to ten šmejd dovoluje? Nařídil těm svejm smradlavejm vlezdoprdelkům, aby mě nepustili dovnitř! Tak tohle si šeredně odskáče! Vlastníma rukama udělám z toho jeho patolízala Bloodwyna žrádlo pro ryby!");
	Doc_PrintLines(nDocID,0,"Jestli brzo nezaplatí, přestanu si brát servítky.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLines(nDocID,1,"Ti banditi začínají být drzí jak opice. Ještě pořád mi nezaplatili za poslední dodávku. Ale nemáme dost informací. Musím zjistit, co má Raven za lubem.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vezmu většinu posádky na pevninu a zajistíme tu rudu. Francis s pár lidma zatím zůstane tady a opevní tábor.");
	Doc_PrintLines(nDocID,1,"Abychom neztráceli čas, dal jsem Bonesovi tu zbroj. Proplíží se do tábora banditů a zjistí, co vlastně Raven plánuje.");
	Greg_GaveArmorToBones = TRUE;
	Doc_Show(nDocID);
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "Kamenná tabulka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	description = "Quarhodronova kamenná tabulka";
	text[4] = "Tenhle prastarý artefakt otevírá vstup do Adanova chrámu...";
	inv_animate = 1;
};


func void Use_TempelTorKey()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jhehedra Akhantar");
	Doc_Show(nDocID);
};

instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name = "Bloodwynova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_Addon_Masiafadept_Kopf(C_Item)
{
	name = "Hlava novice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_Ituseld_Kopf(C_Item)
{
	name = "Itu'Seldova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_DeadManHead(C_Item)
{
	name = "Hlava zběha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ITWR_ADDON_TREASUREMAP_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = "Mapa pokladů";
	text[4] = "Na mapě jsou vyznačena nějaká místa...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_TreasureMap()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Láhev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = "Zapečetěná láhev";
	text[4] = "Uvnitř láhve je malý kus papíru...";
	inv_animate = 1;
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(itwr_addon_treasuremap_1,1);
};


instance itmi_erolskelch(C_Item)
{
	name = "Stříbrný kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice_Sky.3DS";
	material = MAT_METAL;
	description = "Stříbrný kalich";
	text[4] = "Na vnější straně je několik hlubokých škrábanců...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_OrcHeal(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Svitek léčení";
	text[4] = "Magie tohoto svitku dokáže vyléčit jakékoli stvoření...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_OrcGonez(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItKe_OrcGonez;
	material = MAT_METAL;
	description = name;
	text[3] = "Půlkruhovitý klíč s výřezy pod rozličnými úhly...";
	text[4] = "Na spodní části je pod vrstvou špíny nečitelný nápis...";
	inv_animate = 1;
};

func void Use_ItKe_OrcGonez()
{
	if(MIS_OldOrcKey == FALSE)
	{
		B_PlayerFindItem(ItKe_OldOrcKey,1);
		MIS_OldOrcKey = LOG_Running;
		Log_CreateTopic(TOPIC_OldOrcKey,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OldOrcKey,LOG_Running);
		B_LogEntry(TOPIC_OldOrcKey,"Našel jsem nějaký podivný klíč. Zřejmě je to dílo nějakého skřeta, jelikož je na něm jasně vidět nápis ve skřetím jazyce. Ale od čeho je?");
	};
};

//------------------------------------------Kvest Ur-Tralla------------------------------------------------

instance ItWr_AboutNagDumgar_P1(C_Item)
{
	name = "Stará tabulka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Stará skřetí deska";
	text[3] = "Stará ošumělá skřetí tabulka...";
	text[4] = "Celá tabulka je pokryta nápisy ve skřetím jazyce...";
	on_state[0] = Use_ItWr_AboutNagDumgar_P1;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P1()
{
	var int nDocID;

	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KnowAboutNagDumgar_P1 == FALSE)
		{
			if(MIS_NagDumgar == LOG_Running)
			{
				B_GivePlayerXP(150);
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
				};

				KnowAboutNagDumgar_P1 = TRUE;
				B_LogEntry(TOPIC_NagDumgar,"Našel jsem zvláštní skřetí tabulku! Zřejmě popisuje, co se stalo, když vůdce skřetů Nag-Dumgar vedl do chrámu výpravu s cílem najít démona, který byl odpovědný za smrt jejich bratrů. Podle všeho byl příčinou smrti jejich oddílu zlý šaman, kterého poslouchali všichni nemrtví v chrámu. Všichni skřeti, kteří padli do jeho rukou byli obětováni. Samotný Nag-Dumgar patrně zradil své bratry a začal sloužit tomuto šamanovi... a zůstal naživu.");

				if((KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE))
				{
					Log_AddEntry(TOPIC_NagDumgar,"Vypadá to, že situace se poněkud vyjasňuje... Ten krutý šaman, kterému sloužil Nag-Dumgar, a nejvyšší skřetí šaman Hash-Gor jsou patrně jeden a ten samý skřet! Myslím, že bych se o něm měl pokusit dovědět něco dalšího - ale od koho a kde?! Ve staré Xardasově věži možná zůstaly nějaké záznamy ohledně Spáčova chrámu a Hash-Gora. Měl bych se tam porozhlédnout...");
				};
				if((CurrentLevel == OldWorld_Zen) && (KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE) && (XardasOrcBooksIns == FALSE))
				{
					Wld_InsertItem(ItWr_AboutNagDumgar_P3,"FP_ITEM_NAGDUMGAR_03");
					XardasOrcBooksIns = TRUE;
					KnowAboutNagDumgar_P3IN = TRUE;
				};
			};
		}
		else
		{
			var int rnd;
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
		if((BookBonus_31 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_31 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Náš vůdce nás zavedl hlouběji do chrámové jeskyně...");
		Doc_PrintLines(nDocID,0,"Všude kolem leží znetvořená těla našich bratrů. Zřejmě tady nastala opravdová jatka!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"S obrovskými ztrátami jsme dosáhli vnitřního dvora chrámu. Všechno je tady zamořeno mrtvými!");
		Doc_PrintLines(nDocID,0,"V temnotě se pořád míhají nějaké stíny a to děsné sténání nás pomalu přivádí k šílenství.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID,1,"V jedné ze svatyní chrámu jsme potkali mrtvého šamana. Řekl nám, že tady všichni zemřeme!");
		Doc_PrintLines(nDocID,1,"Poté nás ze všech stran obklíčili obživlé mrtvoly. Nezbývalo nám než bojovat nebo zemřít...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten zlý šaman den co den na obětním stole prolévá krev mých bratrů. Velikým nožem jim rozerve tělo a pak sní jejich srdce!");
		Doc_PrintLines(nDocID,1,"Vedle něho jsem viděl Nag-Dumgara! Teď slouží tomu šamanovi.");
		Doc_Show(nDocID);
	}
	else
	{
		B_Say(self,self,"$CANTREADTHIS");

		if((MIS_NagDumgar == LOG_Running) && (PlayerKnowsOrcLanguageNeed == FALSE))
		{
			PlayerKnowsOrcLanguageNeed = TRUE;
			B_LogEntry(TOPIC_NagDumgar,"Abych si to mohl přečíst, musím se nejdříve naučit skřetímu jazyku...");
		};	
	};
};

instance ItWr_AboutNagDumgar_P2(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_AboutNagDumgar_P2;
	scemeName = "MAP";
	description = "Starý skřetí pergamen";
	text[4] = "Na pergamenu je několik nápisů ve skřetím jazyce...";
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P2()
{
	var int nDocID;
	
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KnowAboutNagDumgar_P2 == FALSE)
		{
			if(MIS_NagDumgar == LOG_Running)
			{
				B_GivePlayerXP(150);
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
				};

				KnowAboutNagDumgar_P2 = TRUE;
				B_LogEntry(TOPIC_NagDumgar,"U jednoho ze skřetích šamanů ve Spáčově chrámu jsem našel podivný skřetí pergamen. Soudíc podle jeho obsahu skřeti přinášeli svému krutému démonu oběti, aby je nepostihl jeho hněv. Dopis taky zmiňuje jméno nejvyššího šamana Hash-Gora, který zřejmě tyhle ohavné rituály vykonával. Zřejmě požíval mezi skřety veliké vážnosti a měl značnou moc.");

				if((KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE))
				{
					Log_AddEntry(TOPIC_NagDumgar,"Vypadá to, že situace se poněkud vyjasňuje... Ten krutý šaman, kterému sloužil Nag-Dumgar, a nejvyšší skřetí šaman Hash-Gor jsou patrně jeden a ten samý skřet! Myslím, že bych se o něm měl pokusit dovědět něco dalšího - ale od koho a kde?! Ve staré Xardasově věži možná zůstaly nějaké záznamy ohledně Spáčova chrámu a Hash-Gora. Měl bych se tam porozhlédnout...");
				};
				if((CurrentLevel == OldWorld_Zen) && (KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE) && (XardasOrcBooksIns == FALSE))
				{
					Wld_InsertItem(ItWr_AboutNagDumgar_P3,"FP_ITEM_NAGDUMGAR_03");
					XardasOrcBooksIns = TRUE;
					KnowAboutNagDumgar_P3IN = TRUE;
				};
			};
		}
		else
		{
			var int rnd;
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
		if((BookBonus_32 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_32 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book_Letter);
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Varrag-Beku!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Už nemám téměř žádné otroky na oběť našemu pánu. Pokud se obětní oltář přestane zalévat krví, my všichni ucítíme jeho strašný hněv! Snad ti to nemusím pořád připomínat. Nebo snad chceš zaujmout jejich místo ty sám?!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Hash-Gor, nejvyšší šaman");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
	}
	else
	{
		B_Say(self,self,"$CANTREADTHIS");

		if((MIS_NagDumgar == LOG_Running) && (PlayerKnowsOrcLanguageNeed == FALSE))
		{
			PlayerKnowsOrcLanguageNeed = TRUE;
			B_LogEntry(TOPIC_NagDumgar,"Abych si to mohl přečíst, musím se nejdříve naučit skřetímu jazyku...");
		};	
	};
};

instance ItWr_AboutNagDumgar_P3(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Xardasův starý deník";
	text[4] = "Temný mág si do něj zapisoval některé své staré objevy...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_AboutNagDumgar_P3;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P3()
{
	var int nDocID;

	if(KnowAboutNagDumgar_P3 == FALSE)
	{
		if(MIS_NagDumgar == LOG_Running)
		{
			B_GivePlayerXP(150);
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			KnowAboutNagDumgar_P3 = TRUE;
			B_LogEntry(TOPIC_NagDumgar,"Myslím, že jsem našel, co jsem hledal! Xardas se patrně sám zajímal o Hash-Gora. Zejména o nějaký artefakt - rituální nůž nejvyššího šamana, pomocí kterého uměl oživovat a ovládat mrtvých. Možná se právě v tomhle ukrývá tajemství Nag-Dumgara. Nicméně pro začátek musím najít Hash-Gora nebo to, co z něho zbylo a získat ten obětní nůž. Kdopak asi ví, kde je Hash-Gor teď?");
		};
	}
	else
	{
		var int rnd;
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
	if((BookBonus_33 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_33 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... Jak jsem již zjistil, na stavbě chrámu se podílelo pět skřetích šamanů. Stejně mě ale sužují nejasné pochybnosti, že za tím vším stál ještě někdo jiný. Mnoho skřetů, které jsem vyslechl, zmiňovalo jméno Hash-Gor! Podle všeho byl nejvyšším šamanem klanu, který chrám vybudoval. Co když byl právě on hlavním stavitelem Spáčova chrámu? ...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... Povedlo se mi zjistit, že Hash-Gor nepřetržitě přinášel rituální oběti jako dar nějakému mocnému démonovi. K tomuto účelu vlastnil i speciální rituální nůž, pomocí kterého - alespoň podle slov skřetů - uměl oživovat a ovládat mrtvých! Z pohledu nekromancie ve mně tenhle předmět vyvolává mimořádný zájem. Je ale velice nepravděpodobné, že bych ho někdy získal do svých rukou.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ItMi_NestorHead(C_Item)
{
	name = "Hlava 'Kanibala' Nestora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_NestorHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_KriksHead(C_Item)
{
	name = "Hlava 'Břitvy' Krikse";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_KriksHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_BartHead(C_Item)
{
	name = "Hlava 'Skrčka' Barta";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_BartHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_SkironHead(C_Item)
{
	name = "Hlava Skirona 'Řezníka'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_SkironHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_RocksHead(C_Item)
{
	name = "Hlava Rokse 'Čipery'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RocksHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_DexterHead(C_Item)
{
	name = "Dexterova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DexterHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};