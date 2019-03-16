
instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = "Dopis od Xardase";
	inv_animate = 1;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jestli se všechno stane tak, jak čekám, měl bys teď vyhledat Irdorathské síně. Potřebné informace najdeš v knize, kterou jsi donesl Pyrokarovi. Otevřeš ji slovy 'XARAK BENDARDO'.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ještě se uvidíme!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Xardas");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Xardas mi ve svém dopise sdělil, jaká slova otevřou knihu Irdorathské síně.");
	};
	MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
};


instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Irdorathské síně";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
	inv_animate = 1;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		AI_Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Podařilo se mi otevřít Xardasovu knihu. Obsahovala tajnou zprávu a podivný klíč. Kdo ví, na co dalšího ještě v klášterním sklepení narazím.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		AI_Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
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
	on_state[0] = Use_HallsofIrdorath_Open;
	inv_animate = 1;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;

	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Přečetl jsem Xardasovu knihu. Zmiňovala se o nějaké tajné knihovně. Musí se nacházet někde v klášterním sklepení.");
		ItWr_SCReadsHallsofIrdorath = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... a tak jsem ukryl vstup do knihovny za tajnými dveřmi, abych ochránil své záznamy o Beliarových chrámech.");
	Doc_PrintLines(nDocID,0,"Kdyby se o nich dozvěděli moji bratři, určitě by je všechny zničili, zaslepenci.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Teď vědí pouze to, že tyto chrámy kdysi existovaly.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pro jistotu jsem ale pověřil několik služebníků, aby knihovnu střežili.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tenhle klíč otevírá poslední dveře.");
	Doc_Show(nDocID);
};

var int BookBonusRhet;

instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Stará zaprášená kniha";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
	inv_animate = 1;
};

func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;

	if((BookBonus_30 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_30 = TRUE;
	};
	if(BookBonusRhet == FALSE)
	{
		BookBonusRhet = TRUE;
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_WOOD_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_WOOD_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... nyní vím jistě, že tou stavbou jsou Irdorathské síně. Leží na ostrově nedaleko khoriniského přístavu. Je zřejmé, že Beliar má zájem o rudné doly...");
	Doc_PrintLines(nDocID,0,"");

	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"... čím jsou silnější, tím lépe mu budou sloužit jako nemrtví otroci. Takto proměnění paladinové pak dokáží každému válečníkovi pořádně zatopit. Já jen doufám, že si ostatní nevšimnou, že jsem jednoho dostal až sem dolů...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... ten proměněný paladin už nereaguje na žádné podněty. Jeho zbroj i ostatní věci jsem uložil v zadní místnosti, jejíž dveře lze otevřít pouze zevnitř. Aby se tam někdo dostal, bude potřebovat teleportační runu. Pokyny na její výrobu jsem zapsal do almanachu, aby je Vyvolený jednou našel...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"... znamení hovoří jasně! Až přijde Vyvolený, bude potřebovat veškerou pomoc, kterou mu budeme moci poskytnout. Beliar už je příliš silný. Povedlo se mi získat některé velmi cenné artefakty, které ukryji právě tady. Domnívám se totiž, že Vyvolený bude pocházet přímo z našich řad,");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,1,"a právě proto jsem pro něj příslušné pokyny zapsal do almanachu.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... teď už to vím jistě. Ruku osudu nezadržíme. Až Beliar získá potřebnou moc, povstane a bude se snažit ovládnout svět. Musím vyhledat Vyvoleného, jinak je náš úděl zpečetěn.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"... přijde válka, válka o osud celého světa. Ale zdá se mi, že znamení dokážu rozpoznat jenom já - všichni ostatní si jich vůbec nevšímají. Já však vím, že se objeví Vyvolený a jeho příchod bude věštit válku. Válku tak starou jako sám čas - ale její konec je už na obzoru");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,1,"a já tady nebudu jen tak stát s rukama v klíně a pozorovat, jak ostatní berou osud světa do svých rukou!");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... prostudoval jsem prastaré spisy a zjistil jsem, jak vyrobit legendární zbraně dávných dračích pánů. Zatím ale nemám ponětí, jak získat potřebné ingredience - pro jistotu jsem ale návod také zaznamenal do almanachu. Kdo ví, jaké hrůzy nám budoucnost přinese - možná se budeme muset postavit i lítým drakům.");
	};

	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = "Zmačkaný dopis";
	text[4] = "Nevelká poznámka, která vypadla z knihy 'Irdorathské síně'...";
	inv_animate = 1;
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lampa vnáší světlo do podzemí...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = "Námořní mapa k ostrovu Irdorath";
	text[4] = "Mapa ukazující přesnou polohu ostrova Irdorath...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if((MIS_ShipIsFree == FALSE) && (Kapitel < 6))
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship,"Nejspíš se budu muset dostat na podivný ostrov našich nepřátel. K tomu budu ale potřebovat loď, posádku a kapitána.");
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
	MIS_SCKnowsWayToIrdorath = TRUE;
};


instance ITMI_SEAMAPLOSTISLAND(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itmi_seamaplostisland;
	description = "Námořní mapa k tajemnému ostrovu";
	text[4] = "Na mapě je vyznačen ostrov samotný a přesná cesta k němu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itmi_seamaplostisland()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = "Plná moc";
	text[4] = "Dokument umožňující přístup na paladinskou loď...";
	inv_animate = 1;
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"	Plná moc");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tenhle dokument oprávňuje svého držitele se po neomezenou dobu volně pohybovat na královské válečné galéře lorda Hagena a vést ji, kamkoliv uzná za vhodné.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- královská pečeť -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask_Sky.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Innosovy slzy";
	text[4] = "Účinky neznámé...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask_Sky.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Innosovy slzy";
	text[3] = "Mágům Ohně propůjčí tenhle lektvar nezměrnou moc...";
	text[4] = "Tomu, kdo k nim nepatří ale přinese jenom smrt...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_PotionOfDeath()
{
	var int KarmaInnos;

	KarmaInnos = INNOSPRAYCOUNT - INNOSCRIMECOUNT;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,50);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	}
	else if(KarmaInnos >= 500)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		B_RaiseAttribute_Bonus(self,ATR_HITPOINTS_MAX,50);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ITAM_AMULETTOFDEATH_MIS_SKY.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	description = "Božská Innosova aura";
	text[0] = NAME_Prot_Phis;
	count[0] = 40;
	text[1] = NAME_Prot_Point;
	count[1] = 40;
	text[2] = NAME_Prot_Fire;
	count[2] = 40;
	text[3] = NAME_Prot_Magic;
	count[3] = 40;
	text[4] = "Nositele tohoto amuletu ochraňuje samotný Innos...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 40;
	self.protection[PROT_BLUNT] += 40;
	self.protection[PROT_POINT] += 40;
	self.protection[PROT_FIRE] += 40;
	self.protection[PROT_MAGIC] += 40;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 40;
	self.protection[PROT_BLUNT] -= 40;
	self.protection[PROT_POINT] -= 40;
	self.protection[PROT_FIRE] -= 40;
	self.protection[PROT_MAGIC] -= 40;
};

instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Sagittin lék";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[4] = "Léčivý nápoj působící proti kocovině...";
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};