/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func void Use_ItWr_VatrasDiary - upraveny podmínky získání dovednosti vytvoření runy 'Blesk'

*/



func void b_checkadwinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKADW = FALSE;
	}
	else
	{
		CHECKADW = TRUE;
	};
};

func void b_checkoldworldinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKOLDW = FALSE;
	}
	else
	{
		CHECKOLDW = TRUE;
	};
};

instance ITWR_MAP_NEWWORLD_1(C_Item)
{
	name = "Mapa Khorinisu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};

instance ItWr_Map_AdanosValley_1(C_Item)
{
	name = "Prastaré spisy atronomů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_Map_AdanosValley;
	description = name;
	text[4] = "Texty jsou víceméně nečitelné...";
	inv_animate = 1;
};

func void Use_Map_AdanosValley()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AdanosValley.tga",TRUE);
	Doc_SetLevel(Document,"AddonWorld\AdanosValley.zen");
	Doc_Show(Document);
};

instance ITWR_MAP_ORCCITY_1(C_Item)
{
	name = "Mapa jeskyní";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_map_orccity;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Mapa jeskyní podzemního města skřetů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_map_orccity()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_orccity_2.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\ORCCITY.zen");
	Doc_SetLevelCoords(Document,-13000,18300,16800,-19200);
	Doc_Show(Document);
};


instance ITWR_MAP_NEWWORLD_CITY_1(C_Item)
{
	name = "Mapa města Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_City;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_City()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-6900,11800,21600,-9400);
	Doc_Show(Document);
};


instance ITWR_MAP_OLDWORLD_1(C_Item)
{
	name = "Mapa Hornického údolí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_OldWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ITWR_MAP_OLDWORLD_FOREST_1(C_Item)
{
	name = "Úplná mapa Hornického údolí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 450;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_map_oldworld_forest;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_map_oldworld_forest()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorldF.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ITWR_MAP_PSICAMP(C_Item)
{
	name = "Stará mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_PsiCamp;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Mapa starého tábora Bratrstva Spáče...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_PsiCamp()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_PsiCamp.tga",TRUE);
	Doc_Show(Document);
};

instance ITWR_MAP_ORCTEMPEL(C_Item)
{
	name = "Velmi stará mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_ORCTEMPEL;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Skřetí mapa podzemního Spáčova chrámu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_ORCTEMPEL()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetLevel(Document,"ORCTEMPEL.ZEN");
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_Temple.tga",1);
	Doc_Show(Document);
};

var int Lerne_Einhand;
var int Lerne_Zweihand;

instance ItWr_EinhandBuch(C_Item)
{
	name = "Umění boje";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Obrana jižních území";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseEinhandBuch;
	inv_animate = 1;
};

func void UseEinhandBuch()
{
	var int nDocID;
	var int rnd;

	if(Lerne_Einhand == FALSE)
	{
		DoLearn1H = TRUE;
		Lerne_Einhand = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_34 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_34 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Obrana jižních území");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Severní vojska mají nyní velké potíže s jižním lidem. V horkém přírodním klimatu zde preferují lehkou zbroj, která jim umožňuje vysokou pohyblivost. Proto mají úplně jiný styl boje, než je ten náš.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dobře známý manévr těchto válečníků je obrana jednoruční zbraní s úskokem do prostoru. Díky vyhnutí využijí sílu rozmachu k odvetnému úderu.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItWr_ZweihandBuch(C_Item)
{
	name = "Bitevní taktika";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dvojitý blok";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseZweihandBuch;
	inv_animate = 1;
};

func void UseZweihandBuch()
{
	var int nDocID;
	var int rnd;

	if(Lerne_Zweihand == FALSE)
	{
		DoLearn2H = TRUE;
		Lerne_Zweihand = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_35 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_35 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dvojitý blok");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Obrana čepelí znamená, že po pohlcení síly úderu lze okamžitě úder opětovat.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Blok obouruční zbraní proti těžkému útoku je užíván k vysílení protivníka.");
	Doc_Show(nDocID);
};


instance ITWR_OREBARONARMORLETTER(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_orebaronarmorletter;
	scemeName = "MAP";
	description = "Poznámka";
	inv_animate = 1;
};


func void use_orebaronarmorletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zbroj je dána k opravě, potvrzuji transport z hradu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gomez");
	Doc_Show(nDocID);
};


instance TAGEBUCHOT(C_Item)
{
	name = "Deník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Deník";
	text[0] = "Stará zaprášená kniha.";
	text[1] = "Nejsou v ní už žádné strany.";
	on_state[0] = usetagebuchot;
	inv_animate = 1;
};


func void usetagebuchot()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Den 23.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Ztratil jsem pojem o čase.");
	Doc_PrintLines(nDocID,0,"Myslím, že je to třiadvacet dní, co nás tu skřeti přinutili pracovat.");
	Doc_PrintLines(nDocID,0,"Práce je těžká a ty svině neznají slitování. Kdo nemůže, skončí pohozen tam, kde je.");
	Doc_PrintLines(nDocID,0,"Musím odsud utéct!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Den 28.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Pokračujeme v kopání jeskyně.");
	Doc_PrintLines(nDocID,0,"Už jsme vykopali velkou jeskyni, ale nevíme proč.");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Den 67.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,1,"Někdo mi řekl, že ti skřetí šamani nemají srdce, ale jak by mohli žít?");
	Doc_PrintLines(nDocID,1,"Viděl jsem meč, kterého se ti šamani tak bojí. Chtěl bych je s ním rozsekat na kousky.");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Den 78.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,1,"Meč leží v jedné z hal a střeží ho jeden ze šamanů. Bude to obtížné ho získat.");
	Doc_PrintLines(nDocID,1,"Já mizím. Deník tu nechám, třeba jednou někomu poslouží.");
	Doc_Show(nDocID);
};


instance ITWR_BLOODFLY_01(C_Item)
{
	name = "Krvavé mouchy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Krvavé mouchy";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_bloodfly_01;
	inv_animate = 1;
};


func void useitwr_bloodfly_01()
{
	var int nDocID;
	var int kosten;
	var int rnd;

	if(READ_BLOODFLY == FALSE)
	{
		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		READ_BLOODFLY = TRUE;
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání žihadel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat žihadla krvavých much.");
		Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_36 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_36 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Krvavé mouchy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"O krvavých mouchách.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tam, kde je dostatečně vlhká půda a těžký vzduch, se usídlí tyto velké mouchy. Vábí je zápach mrtvých těl. Oběť otráví a pijí její krev.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Získat žihadlo může být komplikované, ale zkušený lovec by si měl poradit. Je nutné kolem něj provést řez a čekat, až odteče krev. Nožem odstraníme svalovinu a žihadlo nám vypadne.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ASTRONOMIE(C_Item)
{
	name = "Astronomie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Astronomie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useastronomie_s1;
	inv_animate = 1;
};

func void useastronomie_s1()
{
	var int nDocID;
	var int rnd;

	if(ASTRAL_ONCE == FALSE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,2);
		AI_Print(PRINT_READASTRAL);
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		ASTRAL_ONCE = TRUE;

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
	if((BookBonus_37 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_37 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"V centru všeho je Morgrad a jeho čtyři elementy: Temnota, Kámen, Voda a Oheň. Nebeská sféra pokrývá celý svět.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"V hierarchii výtvorů se člověk stává nástupcem. Duše ho spojuje s vyšším bytím - božským duchem, zatímco jeho přechodné tělo se skládá z hmoty Morgradu. Odráží obraz celého světa.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Po bitvě bohů se Temnota oddělila od Morgradu. Sídliště smrti a jeho patron Beliar skrývá v útrobách nepopsatelné temnoty něco, co je v rozporu se životem.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dle vůle Beliarovy Temnota vysílá své služebníky do Morgradu. Zachování života a rovnováhy ve světě hledá Adanos. Vůle Innosova dává světu světlo a teplo.");
	Doc_Show(nDocID);
};


instance ITWR_DEMONLANG(C_Item)
{
	name = "Jazyk démonů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Jazyk démonů";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_demonlang_s1;
	inv_animate = 1;
};


func void use_demonlang_s1()
{
	var int nDocID;
	var int rnd;

	if((KNOWDEMENTORLANGUAGE == FALSE) && (hero.lp >= 10))
	{
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		PLAYER_TALENT_FOREIGNLANGUAGE[3] = TRUE;
		AI_Print("Naučeno: Jazyk démonů");
		B_LogEntry(TOPIC_Language,LOGTEXT_ADDON_LANGUAGE_4);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		KNOWDEMENTORLANGUAGE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		hero.lp = hero.lp - 10;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else if((KNOWDEMENTORLANGUAGE == FALSE) && (hero.lp < 10))
	{
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(hero,hero,"$DONTREADYFORTHIS");
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
	if(KNOWDEMENTORLANGUAGE == TRUE)
	{
		if((BookBonus_38 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_38 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Tak, jak je znán jazyk démonů, není úplně přesně jejich jazykem, ale dialektem, kterým je možno domluvit se s nejvyššími zástupci tohoto druhu.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Skutečností je, že nejtajnější spisy, které vznikli v době stvoření světa, jsou psány výlučně v tomto jazyce. Každý z těchto textů jsou skutečným pokladem, pokud porozumíte jejich významu.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Navíc je to jazyk Temného boha. Všechny bytosti, které vytvořil Beliar a podléhají mu, jsou schopny porozumět starodávné řeči.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Obrátil se na své nejsilnější služebníky a vložil svou božskou vůli do jejich vědomí - proto se nazývá jazyk démonů.");
		Doc_Show(nDocID);
	};
};

var int god1_once;
var int god2_once;
var int god3_once;

instance LEHREN_DER_GOETTER1(C_Item)
{
	name = "Učení bohů - Svazek první";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Božská Doktrína";
	text[0] = "Svazek první";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter1_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter1_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD1_ONCE == FALSE)
	{
		GOD1_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
		B_GivePlayerXP(100);

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
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
	if((BookBonus_39 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_39 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Slyšte slovo boží, protože je jejich vůle, aby slyšeno bylo. Následujte jejich učení, protože je to jejich vůle. Naslouchejte jejich kněžím, kteří byli jimi vybráni.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Slova Innosova: Nepochybuj o slovech kněží, i přesto, že nerozumíš jejich smyslu, protože jsou známkou jejich vedení. Jsem žhnoucí slunce, světlo a život. Jít proti Slunci je jít proti mě. Udělej tak a upadneš v zatracení.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Slova Adanova: Žij a pracuj, protože člověk má přes den pracovat. Uč se a hledej znalosti, protože človek se má učit. Líní, ti nechť upadnou v zatracení.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Slova Beliarova: Ti, kteří činí proti boží vůli, ti budou potrestáni mnou. Jejich tělo pozná bolest, utrpení a smrt, jejich duše zůstanou navždy ve světě stínů.");
	Doc_Show(nDocID);
};


instance LEHREN_DER_GOETTER2(C_Item)
{
	name = "Učení bohů - Svazek druhý";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Božská Doktrína";
	text[0] = "Svazek druhý";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter2_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter2_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD2_ONCE == FALSE)
	{
		GOD2_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
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
	if((BookBonus_40 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_40 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nebyl zde den, nebyla zde ani noc, nic živého nebylo na světě. Ale byl zde Innos, jehož světlo vše ozářilo. Innos stvořil svět a život. Ale nic nemohlo žít v pohledu Innose, proto stvořil Slunce. Jenže jeho záře byla moc prudká. Tak se Innos rozdělil ve dvě a stvořil Beliara, svého bratra. Beliar přinesl do světa noc. Pak byly na zem posláni lidé. Innos se znovu rozdělil, aby stvořil Adana. Adanos pak dal lidem touhy, znalosti, zvědavost a smělost. A Innos byl šťasten, když viděl, co stvořil.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"A tak se Innos rozhodl svěřit lidi pod ochranu Adana. Beliar byl rozhněván, protože lidé ho nechtěli uctívat, když v noci, kterou vytvořil a vládl jí, spali. A tak si stvořil vlastní bytost, která měla uctívat jen jeho. Ale tato bytost nebyla jako ostatní lidé. Hněv naplnil Beliarovo srdce a svůj výtvor proklel: 'Nechtějí mě uctívat, dám jim tedy pocítit mou moc'. Tak z oné bytosti vznikla Smrt. Smrt, která pro Beliara bere životy.");
	Doc_Show(nDocID);
};


instance LEHREN_DER_GOETTER3(C_Item)
{
	name = "Učení bohů - Svazek třetí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Božská Doktrína";
	text[0] = "Svazek třetí";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter3_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter3_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD3_ONCE == FALSE)
	{
		GOD3_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
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
	if((BookBonus_41 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_41 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Innos dal lidem schopnost slyšet a mluvit. Propůjčil jim schopnost dělat zázraky a nazval ji magií. Lidé mohli měnit svět dle svého a utvářet si ho příjemnějším. Tak lidé získali přístup k božským silám tvoření. Ale nebyli jen takoví, kteří chtěli tvořit. A tak Innos uzmul sílu těm, kdo byly nehodni jeho velikosti. Ti, jimž byla magie ponechána, pak z vděčnosti postavili Innose nad ostatní bohy.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tito lidé byli respektováni a obávaní. Byli to první kněží. Ale mnoho z nich bylo žárlivých na schopnosti silnejších. Přiklonili se k Adanovi a ten jim dal zapomenout. Jenže skupina kneží se znesvářila a začala válka, protože každý chtěl uctívat jiného boha. Boží moc se stala jen o něco víc, než mýtem. I kněží se rozdělili. Ti, kteří stáli za Adanem, byli mágové Vody a ti, kteří zůstali s Innosem, byli mágové Ohně.");
	Doc_Show(nDocID);
};


var int magicore_once;

instance DAS_MAGISCHE_ERZ(C_Item)
{
	name = "Magická ruda";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Magie rudy";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usedas_magische_erz_s1;
	inv_animate = 1;
};


func void usedas_magische_erz_s1()
{
	var int nDocID;
	var int rnd;

	if(READ_MAGISCHE_ERZ == FALSE)
	{
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 5;
		READ_MAGISCHE_ERZ = TRUE;
	};
	if((MAGICORE_ONCE == FALSE) && (KNOWHOWPICKORE == FALSE))
	{
		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};
		if(HERO_HACKCHANCEORE >= 90)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,4);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,3);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,2);
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,1);
		};

		AI_Print(PRINT_LEARNPICKORE);
		Npc_SetTalentValue(self,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		MAGICORE_ONCE = TRUE;
		KNOWHOWPICKORE = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");

		if(ORE_TOPIC_EXIST == TRUE)
		{
			B_LogEntry(TOPIC_MAGICORE,"Nyní vím, jak těžit rudu.");
		}
		else
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			B_LogEntry(TOPIC_MAGICORE,"Nyní vím, jak těžit rudu.");
			ORE_TOPIC_EXIST = TRUE;
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

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Magie rudy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nejlepší rudné zbraně nepochybně pocházejí z khoriniské rudy. Je to ta nejčistší ruda na světě. Obsahuje nejvíce magie a je tou nejpevnější, kterou můžeme nalézt. Těmto zbraním se žádná obyčejná čepel nevyrovná.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Není pancíř, či zbroj, která by takovéto čepeli mohla odolat. Každý, kdo něco znamenal, nosil rudnou čepel z Myrtanského Khorinisu. Ale magie rudy přišla draho. Mnoho životů padlo při jejím dobývání. Jakoby ruda sama nechtěla opustit zemi.");
	Doc_Show(nDocID);
};

instance ItWr_GoldMake(C_Item)
{
	name = "Tavení zlata";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Tavení zlata";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_GoldMake;
	inv_animate = 1;
};

func void Use_ItWr_GoldMake()
{
	var int nDocID;
	var int rnd;

	if(KNOWHOWTOOREFUSGOLD == FALSE)
	{
		KNOWHOWTOOREFUSGOLD = TRUE;
		AI_Print("Naučeno: Tavení zlata");
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		B_LogEntry(TOPIC_STEELDRAW,"K přetavení zlatých nugetů na ingot potřebuji výheň a pětadvacet zlatých nugetů.");
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

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Tavení zlata");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Chcete-li získat jeden ingot, potřebujete asi čtvrtinu stovky zlatých nugetů. Zlato se vloží do pece, přivede na správnou teplotu a slévá se do formy přes síto.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

var int varant1_once;
var int varant2_once;

instance SCHLACHT_UM_VARANT1(C_Item)
{
	name = "Bitva o Varant - Svazek první";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bitva o Varant";
	text[0] = "Svazek první";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useschlacht_um_varant1_s1;
	inv_animate = 1;
};


func void useschlacht_um_varant1_s1()
{
	var int nDocID;
	var int rnd;

	if(VARANT1_ONCE == FALSE)
	{
		VARANT1_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(500);
		B_Say(self,self,"$HOWINTEREST");

		if((VARANT1_ONCE == TRUE) && (VARANT2_ONCE == TRUE))
		{
			DoLearn1H = TRUE;
			DoLearn2H = TRUE;
			Snd_Play("Levelup");
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
	if((BookBonus_43 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_43 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... Ale Rhobar se rozhodl zaútočit první. Seskupil jednotky a veškeré vojsko poslal na oslabené levé křídlo nepřítele. Neplýtvaje časem, šípy ani meči, jeho vojsko zničilo nepřítele. Vedl své vojáky dál, dál za hranice Varantu. Vědel, že musí zařídit, aby síly Gullana a Lukora nebyly schopny...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... sjednocení a doplnění posil...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... Gullan byl zabit a jeho jednotky uprchly. Rhobar nenechal nic náhodě a zničil zbytek nepřátelských sil. Lukor se rozhodl využít zaměstnanosti Rhobarovy armády a učinil poslední pokus o průlom jeho sil...");
	Doc_Show(nDocID);
};


instance SCHLACHT_UM_VARANT2(C_Item)
{
	name = "Bitva o Varant - Svazek druhý";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bitva o Varant";
	text[0] = "Svazek druhý";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useschlacht_um_varant2_s1;
	inv_animate = 1;
};


func void useschlacht_um_varant2_s1()
{
	var int nDocID;
	var int rnd;

	if(VARANT2_ONCE == FALSE)
	{
		VARANT2_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
		B_GivePlayerXP(500);

		if((VARANT1_ONCE == TRUE) && (VARANT2_ONCE == TRUE))
		{
			DoLearn1H = TRUE;
			DoLearn2H = TRUE;
			Snd_Play("Levelup");
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
	if((BookBonus_44 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_44 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výsledek války byl jasný. Varant byl kompletně poražen. Rhobar rozkázal nezdržovat se ve Varantu a dorazit zbývající nepřátele. Stále zde byly jednotky, které braly Lukora jako svého vůdce.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ale jeho armáda byla rozprášena a vojáci se připravovali na ústup. Pak jeden z nejlepších generálů Myrtany připravil past. Těžká pěchota Varantu nemohla bojovat v bažinatém prostředí. Celé údolí bylo zaplaveno vojskem. Bitva byla vyhrána.");
	Doc_Show(nDocID);
};


instance ITWR_SOULRIVER(C_Item)
{
	name = "Obětní rituály";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_soulriver_open;
	inv_animate = 1;
};


func void use_soulriver_open()
{
	var int nDocID;
	var int rnd;

	if(READ_SOULRIVER == FALSE)
	{
		B_LogEntry(TOPIC_MORIUSTEST,"Přečetl jsem knihu, o které mluvil Morius. Bylo v ní popsáno vše, co jsem potřeboval. Po přípravě extraktu bych ho měl obětovat na nějaké svatyni.");
		B_LogEntry_Quiet(TOPIC_MORIUSTEST,"Pro přípravu potřebuji Lucianovo srdce, síru, akvamarín, esenci many, černou perlu, a trávu z bažin. Vše se smíchá do laboratorní lahvičky v alchymistické koloně.");
		READ_SOULRIVER = TRUE;
		SOULRIVER = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_45 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_45 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Duše jakéhokoliv stvoření tohoto světa je pokládána za velmi cennou pro bohy.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Někdy byly i ty nejzávažnější hříchy odpuštěny, jestliže nositel víry obětoval takový dar. Kromě toho bylo nutné mít znalosti k získání duše tvora bez poškození jeho božské podstaty a struktury.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pro předání tohoto daru je nutné udělat z duše extrakt. Pak je nutné zašeptat modlitbu a vylít ho na svatyni.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"K přípravě extraktu jsou potřebné následující složky: sféra obsahující duši tvora, akvamarín, síra, černá perla, esence many a tráva z bažin, jako činidlo.");
	Doc_Show(nDocID);
};

instance ItWr_Azgolor(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[4] = "Na obálce knihy jsou symboly, připomínající magické runy.";
	on_state[0] = Use_Azgolorbook_Open;
	inv_animate = 1;
};

func void Use_Azgolorbook_Open()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(READ_AZGOLORBOOK == FALSE)
	{
		READ_AZGOLORBOOK = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		SEEKAZGOLOR = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		if(KNOWDEMENTORLANGUAGE == TRUE)
		{
			if(READ_AZGOLOR == FALSE)
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"V podzemním chrámu jsem našel podivnou knihu. Pravděpodobně je napsána v jazyce démonů... (lekce Strážců se mi teď hodily). Je v ní poznamenáno, jak užít prastarý artefakt, Oko hněvu, k vyvolání zlého boha, Azgalora - pána démonů. Nejdříve je nutné probudit Oko. To je jednoduché. Stačí kolona, krev skřeta a démona. Po probuzení je nutné provést posvátný rituál, který spočívá ve slovech síly a autority.");
				READ_AZGOLOR = TRUE;
			};
			if((BookBonus_46 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{	
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_46 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Oko hněvu - pradávný artefakt s mocí přivolat pána démonů, zlého boha Azgalora.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Jestli se někdo bude pokoušet o jeho přivolání, mel by dodržet jistý postup.");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Pro navrácení síly Oku je nezbytné připravit esenci z krve skřeta a démona, přidat pět kousků síry a nakonec Oko samotné.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Po probuzení Oka je třeba provést rituál na přivolání Azgalora.");
			Doc_Show(nDocID);
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
			B_LogEntry(TOPIC_URNAZULRAGE,"V podzemním chrámu jsem našel podivnou knihu napsanou v jazyce, kterému nerozumím. Budu muset najít někoho, kdo ho umí přečíst.");
		};
	};
};


instance ITWR_INNOSPRAY(C_Item)
{
	name = "Modlitebník Vyvoleného";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_innospray_open;
	inv_animate = 1;
};


func void use_innospray_open()
{
	var int nDocID;

	if(MARDUK_BOOKREAD == FALSE)
	{
		B_LogEntry(TOPIC_MAGICINNOSARMOR,"Teď už znám modlitbu Vyvoleného pro rituál posvěcení paladinské nebo rytířské zbroje.");
		MARDUK_BOOKREAD = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
	};
	if((BookBonus_47 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_47 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Modlitba Vyvoleného");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Můj všemohoucí bože, Innosi,");
	Doc_PrintLines(nDocID,1,"požehnej svému vyvolenému,");
	Doc_PrintLines(nDocID,1,"naplň ho svou silou i moudrostí,");
	Doc_PrintLines(nDocID,1,"aby mohl odolat Zlu i temnotě!");
	Doc_Show(nDocID);
};


instance ITWR_HAGENORDERFORT(C_Item)
{
	name = "Rozkazy lorda Hagena";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_hagenorderfort;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};


func void use_itwr_hagenorderfort()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"         Rozkazy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Tento dokument zaručuje vlastníkovi neomezený přístup do pevnosti Azgan.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Hagen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance itwr_pyrorderfort(C_Item)
{
	name = "Propustka od Pyrokara";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_pyrorderfort;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

func void use_itwr_pyrorderfort()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"         Nařízení");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Tento dokument zaručuje vlastníkovi neomezený přístup do pevnosti Azgan.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nejvýšší mág Ohně, Pyrokar");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_WATERMAGELETTER(C_Item)
{
	name = "Dopis od mágů Vody";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_watermageletter;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Dopis Saturase pro lorda Hagena.";
	inv_animate = 1;
};


func void use_itwr_watermageletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vážený lorde Hagene!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"tímto vás žádám, abyste zajistili ochranu magického portálu, který jsme našli při studiu ruin starých pyramid na severu ostrova. Zabráníme tím velkému množství nepříjemností, které by mohly nastat. Věřím, že rozumíte, co tím myslím.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Saturas, vůdce mágů Vody");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_TYONRECEPT(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Recept na elixír transformace vědomí";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_tyonrecept;
	inv_animate = 1;
};


func void use_itwr_tyonrecept()
{
	var int nDocID;

	if(NEORASCANTEACHRECEPTFORKDF == FALSE)
	{
		NEORASCANTEACHRECEPTFORKDF = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Recept na elixír transformace vědomí:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kost z kostlivce");
	Doc_PrintLine(nDocID,0,"Akvamarín");
	Doc_PrintLine(nDocID,0,"Černá perla");
	Doc_PrintLine(nDocID,0,"Ohnivý jazyk");
	Doc_PrintLine(nDocID,0,"Tráva z bažin");
	Doc_PrintLine(nDocID,0,"Ohnivý kořen");
	Doc_PrintLine(nDocID,0,"Kusadla důlního červa");
	Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
	Doc_PrintLine(nDocID,0,"Vejce důlního červa");
	Doc_PrintLine(nDocID,0,"Královský šťovík");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_TYONLIST(C_Item)
{
	name = "Dopis Baala Tyona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_tyonlist;
	scemeName = "MAP";
	description = "Dopis Baala Tyona";
	inv_animate = 1;
};


func void use_itwr_tyonlist()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ingredience:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vejce důlního červa");
	Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
	Doc_PrintLine(nDocID,0,"Královský šťovík");
	Doc_PrintLine(nDocID,0,"Ohnivý jazyk");
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

instance ITWR_FIRELIGHT(C_Item)
{
	name = "Magické zaříkadlo kouzla 'Ohnivý plášť'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uchovává podstatu kouzla";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance itwr_FireMeteor(C_Item)
{
	name = "Magické zaříkadlo kouzla 'Meteorit'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uchovává podstatu kouzla";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_TELEKINESIS(C_Item)
{
	name = "Magické zaříkadlo kouzla 'Vysátí ducha'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uchovává podstatu kouzla";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_CONTROL(C_Item)
{
	name = "Magické zaříkadlo kouzla 'Hypnóza'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uchovává podstatu kouzla";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_GuruWrath(C_Item)
{
	name = "Magické zaříkadlo kouzla 'Hněv elementů'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uchovává podstatu kouzla";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_KALOMSRECIPE(C_Item)
{
	name = "Recept Cor Kaloma";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Na zpracování trávy...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_kalomsrecipe;
	inv_animate = 1;
};


func void use_itwr_kalomsrecipe()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Recept na zpracování trávy z bažin");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pro produkci nejlepších odrůd musí být tráva z bažin promíchána s luční pohankou a pečlivě vysušena. A také je potřeba víc samotné trávy! Tím vytvoříte správnou koncentraci magické podstaty.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                - Kalom");
	Doc_Show(nDocID);

	if((KNOW_JOINTRECIPE == FALSE) && Npc_IsPlayer(self))
	{
		B_GivePlayerXP(50);
		KNOW_JOINTRECIPE = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		Log_CreateTopic(TOPIC_TalentHerb,LOG_NOTE);
		B_LogEntry(TOPIC_TalentHerb,"Ingredience pro ubalení SEVERNÍHO SOUMRAKU: 4x tráva z bažin a luční pohanka.");
		B_LogEntry_Quiet(TOPIC_TalentHerb,"Ingredience pro ubalení PŘIVOLÁVAČE SNU: 8x tráva z bažin a luční pohanka.");
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
	if((BookBonus_48 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_48 = TRUE;
	};
};


instance ITWR_FERNANDOLETTER(C_Item)
{
	name = "Doporučení pro Lariuse od Fernanda";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Doporučení pro Lariuse.";
	text[3] = "Prokazuje Gallahadovy kvality.";
	inv_animate = 1;
};

instance ITWR_LUTEROLETTER(C_Item)
{
	name = "Doporučení pro Lariuse od Lutera";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Doporučení pro Lariuse.";
	text[3] = "Prokazuje Gallahadovy kvality.";
	inv_animate = 1;
};

instance ITWR_GERBRANTLETTER(C_Item)
{
	name = "Doporučení pro Lariuse od Gerbrandta";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Doporučení pro Lariuse.";
	text[3] = "Prokazuje Gallahadovy kvality.";
	inv_animate = 1;
};

instance ITWR_SALANDRILLETTER(C_Item)
{
	name = "Doporučení pro Lariuse od Salandrila";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Doporučení pro Lariuse.";
	text[3] = "Prokazuje Glalahadovy kvality.";
	inv_animate = 1;
};

instance ITWR_VALENTINOLETTER(C_Item)
{
	name = "Doporučení pro Lariuse od Valentina";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Doporučení pro Lariuse.";
	text[3] = "Prokazuje Gallahadovy kvality.";
	inv_animate = 1;
};

instance ITWR_TALIASANRECOMENDEDLETTERS(C_Item)
{
	name = "Štos papírů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Štos doporučení pro Lariuse.";
	text[3] = "Prokazuje Gallahadovy kvality.";
	inv_animate = 1;
};

instance ITWR_ZURISDOCS(C_Item)
{
	name = "Balík dokumentů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Potvrzují vlastnické právo";
	text[3] = "na prodejní místo Jory.";
	text[4] = "Nesou Zurisův podpis.";
	inv_animate = 1;
};

instance ITWR_MANIAC(C_Item)
{
	name = "Příznaky mánie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_maniac;
	description = "Příznaky mánie";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itwr_maniac()
{
	var int nDocID;
	var int rnd;

	if(MANIAC_ONCE == FALSE)
	{
		B_GivePlayerXP(250);
		MANIAC_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_49 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_49 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Začátky mánie");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Během mých cest jsem tuto nákazu potkal u noviců mnohokrát. V takových komunitách je onemocnění těžko rozpoznatelné a šíří se mnohem rychleji. Podivné chování sektářů je vnímáno jako dar shora.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Ani nemá smysl se tímto zabývat, nemocní jsou i všichni jejich duchovní vůdci. Jeden ze subjektů se již nezmohl na žádná jiná slova než tato: Spáč procitne.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ITWR_RHETORIKBOOK(C_Item)
{
	name = "Základy rétoriky";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_rhetorikbook;
	description = "Základy rétoriky";
	inv_animate = 1;
};

func void use_itwr_rhetorikbook()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_01 == FALSE)
	{
		READBOOKSDONE_01 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 2;
			AI_Print("Rétorika + 2");
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
		Snd_Play("LevelUP");
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
	if((BookBonus_50 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_50 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_Red_R.tga",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Rétorika");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"1. Mluv jasné a přímé věty!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"2. Pozor na řeč těla. Mimika a gesta musí");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"odrážet úroveň toho, s kým mluvíš.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"3. Sleduj reakce partnera. Z nich možno odhadnout jeho myšlenky a očekávání.");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"4. Musíš pečlivě zvážit své argumenty a mluvit jen v podstatě.");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"5. Buď zdvořilý!");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ITWR_GERBRANDSECLET(C_Item)
{
	name = "Zapečetěný Gerbrandtův dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gerbrandseclet;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Gerbrandtův dopis pro člověka v hostinci.";
	inv_animate = 1;
};


func void use_itwr_gerbrandseclet()
{
	var int nDocID;
	CreateInvItems(self,itwr_gerbrandseclet_open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pomozte mi vyřešit problémy s člověkem jménem Wambo. Víte, co dělat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Měšec s penězi bude doručen společně s dopisem.");
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


instance ITWR_GERBRANDSECLET_OPEN(C_Item)
{
	name = "Gerbrandtův dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gerbrandseclet_open;
	scemeName = "MAP";
	description = name;
	text[2] = "Gerbrandtův dopis pro člověka v hostinci.";
	inv_animate = 1;
};


func void use_itwr_gerbrandseclet_open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pomozte mi vyřešit problémy s člověkem jménem Wambo. Víte, co dělat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Měšec s penězi bude doručen společně s dopisem.");
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

instance ITWR_HROMANIN_1(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Chromanin, část první";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_1;
	inv_animate = 1;
};

func void use_itwr_hromanin_1()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten, kdo je připraven zřeknout se všech pozemských vášní a následovat cestu pravdy, by měl vědět, kde se skrývá zdroj mé moci. Po jeho nalezení bude schopen zničit vše, co obsahuje tento svět a prokáže, že je hoden znalostí Chromaninu.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pod stínem starých tmavých skal byly kameny rozdrceny kvůli zlatu. Kryptu objevil a odplata... přišla. Ta strašná hodina přišla!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_01 == FALSE)
	{
		READ_HROMANIN_01 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if(CHAPTER1 == FALSE)
	{
		MIS_HROMANINQUEST = LOG_Running;
		Snd_Play("FoundRiddler");
		Log_CreateTopic(TOPIC_HROMANINQUEST,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_Running);
		B_LogEntry(TOPIC_HROMANINQUEST,"Našel jsem velmi zajímavou knihu - Chromanin! Autor dává na zřetel hlavně jednu vetu... 'Pod stínem starých tmavých skal byly kameny rozdrceny kvůli zlatu. Kryptu objevil a odplata... přišla. Ta strašná hodina přišla!' Sice tomu nerozumím, ale asi ješte nenadešel správný čas.");
		CHAPTER1 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == ABANDONEDMINE_ZEN)
		{
			Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_01");
			Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_02");
			Wld_InsertNpc(skeleton,"AM_HROMANIN_GUARD_03");
			Wld_InsertItem(ITWR_HROMANIN_2,"FP_ITEM_HROMANIN_02");
			CHAPTER2_Insert = TRUE;
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
	if((BookBonus_51 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_51 = TRUE;
	};
};


instance ITWR_HROMANIN_2(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Chromanin, část druhá";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_2;
	inv_animate = 1;
};


func void use_itwr_hromanin_2()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ve větru vizí Chromaninu se budoucnost otevře přede mnou. Veřím, že jsem připraven dát vše... ale to nestačilo. Otřásli mě do hloubky mé duše.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Kdo mrtvé vyrušil v odpočinku temných skal. Sám život dávno opustil a stal se mrtvým tělem. Jeskyně je plná bolesti, zla a strachu. A podzemní jezero je pokryto starou temnotou.");
	Doc_Show(nDocID);

	if(READ_HROMANIN_02 == FALSE)
	{
		READ_HROMANIN_02 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if(CHAPTER2 == FALSE)
	{
		B_GivePlayerXP(100);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Našel jsem další Chromanin a opět je v něm hádanka... 'Kdo mrtvé vyrušil v odpočinku temných skal. Sám život dávno opustil a stal se mrtvým tělem. Jeskyně je plná bolesti, zla a strachu. A podzemní jezero je pokryto starou temnotou.'");
		CHAPTER2 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == DEMONCAVE_ZEN)
		{
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_01");
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_03");
			Wld_InsertItem(ITWR_HROMANIN_3,"FP_ITEM_HROMANIN_03");
			CHAPTER3_Insert = TRUE;
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
	if((BookBonus_52 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_52 = TRUE;
	};
};


instance ITWR_HROMANIN_3(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Chromanin, část třetí";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_3;
	inv_animate = 1;
};


func void use_itwr_hromanin_3()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ó, bohové dávných dob! Jak je možné, že i nehodný člověk jako já, dostal tuto moc. Jak veliký je strach, že ztratit můžu vše, projevím-li nejmenší pochybnosti.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ruda a krev, touha a pot... budou předcházet hříchy. Zaslepenost mocí a zlatem - prokletí duší padne na každého!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_03 == FALSE)
	{
		READ_HROMANIN_03 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if(CHAPTER3 == FALSE)
	{
		B_GivePlayerXP(250);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Našel jsem třetí knihu. Možná už tomu začínám rozumět!... 'Ruda a krev, touha a pot... budou předcházet hříchy. Zaslepenost mocí a zlatem - prokletí duší padne na každého!'");
		CHAPTER3 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDMINE_ZEN)
		{
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_02");
			Wld_InsertNpc(SkeletonMage,"OM_HROMANIN_GUARD_03");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_05");
			Wld_InsertItem(ITWR_HROMANIN_4,"FP_ITEM_HROMANIN_04");
			CHAPTER4_Insert = TRUE;
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
	if((BookBonus_53 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_53 = TRUE;
	};
};


instance ITWR_HROMANIN_4(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Chromanin, část čtvrtá";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_4;
	inv_animate = 1;
};


func void use_itwr_hromanin_4()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Neodvážím se doufat, že proniknu Chromaninem. Pryč jsou dny plýtvání a prázdných slov. Nyní bude tak jednoduché dosáhnout naplnění a brzy to udělám.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Voda a kámen, život a smrt! Světlo pohasne v těchto hlubinách. Vrať se tam, kde už jsi byl, přikryj se rudou ze skal!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_04 == FALSE)
	{
		READ_HROMANIN_04 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if(CHAPTER4 == FALSE)
	{
		B_GivePlayerXP(500);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Čtvrtá kniha. Je možné, že mi jen chce poplést hlavu?!... 'Voda a kámen, život a smrt! Světlo pohasne v těchto hlubinách. Vrať se tam, kde už jsi byl, přikryj se rudou ze skal!'");
		CHAPTER4 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == DEMONSTOWER_ZEN)
		{
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"DT_HROMANIN_GUARD_03");
			Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_05");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_06");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_07");
			Wld_InsertItem(ITWR_HROMANIN_5,"FP_ITEM_HROMANIN_05");
			CHAPTER5_Insert = TRUE;
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
	if((BookBonus_54 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_54 = TRUE;
	};
};


instance ITWR_HROMANIN_5(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Chromanin, část pátá";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_5;
	inv_animate = 1;
};


func void use_itwr_hromanin_5()
{
	var int nDocID;
	var C_Npc riddler;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ale já touto cestou nepůjdu sám. Budu muset sdílet moc skrytou ve mně, s tím kdo mě najde, bude-li hoden. Doufám, že čekání nebude trvat dlouho...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Po staletí stála pevnost beze slov, hrozila nepřátelům kamennými zdmi. Zůstal jen prach a rozvaliny, a zlomyslné skřeky harpyjí.");
	Doc_Show(nDocID);

	if(READ_HROMANIN_05 == FALSE)
	{
		READ_HROMANIN_05 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if(CHAPTER5 == FALSE)
	{
		B_GivePlayerXP(750);
		B_LogEntry(TOPIC_HROMANINQUEST,"Může to být možné? Zajímalo by mě, co to všechno znamená... 'Po staletí stála pevnost beze slov, hrozila nepřátelům kamennými zdmi. Zůstal jen prach a rozvaliny, a zlomyslné skřeky harpyjí.'");
		Snd_Play("FoundRiddler");
		CHAPTER5 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_HROMANIN_GUARD_03");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Hrom,"OW_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_05");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_06");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_07");
			CHAPTER6_Insert = TRUE;
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
	if((BookBonus_55 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_55 = TRUE;
	};
};

instance ITWR_HROMANIN_6(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Chromanin, část šestá";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_6;
	inv_animate = 1;
};


func void use_itwr_hromanin_6()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Smrt je jen začátek...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Zkušený věštec předurčil chod hry. Na hlupáka čeká v pasti. Vrať se k němu brzy...");
	Doc_Show(nDocID);

	if(READ_HROMANIN_06 == FALSE)
	{
		READ_HROMANIN_06 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if(CHAPTER6 == FALSE)
	{
		B_GivePlayerXP(1000);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Cítím, že kruh se uzavírá...'Zkušený věštec předurčil chod hry. Na hlupáka čeká v pasti. Vrať se k němu brzy...'");
		CHAPTER6 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc(skeleton_lord_kadar,"OW_UNDEAD_DUNGEON_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"STONEHENGE");
			Wld_InsertNpc(skeleton_warrior_dark,"STONES");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_PATH_3_13");
			Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_STONES_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_STONES_02");
			Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_OW_PATH_3_13_02");
			HromGuard_Insert = TRUE;
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
	if((BookBonus_56 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_56 = TRUE;
	};
};

instance ITWR_HROMANIN(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_ITWR_HROMANIN;
	inv_animate = 1;
};

func void use_ITWR_HROMANIN()
{
	var int nDocID;
	var int rnd;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Smrt je jen začátek...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Takže vědění nebo svou duši? Koneckonců, co něčí život, to něčí jídlo. Pohltíš-li duší víc než tisíc, i věčné prokletí stane se výjimečným!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_ALL == FALSE)
	{
		B_GivePlayerXP(2000);
		READ_HROMANIN_ALL = TRUE;

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
	if((BookBonus_57 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_57 = TRUE;
	};
};

instance ITWR_NIGELLETTER(C_Item)
{
	name = "Dopis s doporučením od Nigela";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Dopis s doporučením pro Lutera.";
	text[3] = "Zmiňuje mé pozitivní stránky";
	text[4] = "a doporučení k mému přijetí do cechu obchodníků.";
	inv_animate = 1;
};

instance ITWR_EROLLETTER(C_Item)
{
	name = "Dopis s doporučením od Erola";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Dopis s doporučením pro Lutera.";
	text[3] = "Zmiňuje mé pozitivní stránky";
	text[4] = "a doporučení k mému přijetí do cechu obchodníků.";
	inv_animate = 1;
};

instance ITWR_BENGARORDERLETTER(C_Item)
{
	name = "Seznam zboží od Lutera";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Bengarovi od Lutera.";
	text[3] = "Uvádí seznam potřebných produktů";
	text[4] = "pro Lutera.";
	inv_animate = 1;
};

instance ITWR_GOMEZMAGICWORDS(C_Item)
{
	name = "Gomezova poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gomezmagicwords;
	scemeName = "MAP";
	description = name;
	text[3] = "Obsahuje magická slova, která přivolají";
	text[4] = "mágy Ohně, jež zemřeli Gomezovou rukou.";
	inv_animate = 1;
};


func void use_itwr_gomezmagicwords()
{
	var int nDocID;
	if((Npc_GetDistToWP(hero,"OC_MAGE_CENTER") <= 200) && (RESCUEGOMEZSTEPTHREE == TRUE) && (RESCUEGOMEZSTEPTHREEDONE == FALSE) && (FIREMAGECOMES == FALSE))
	{
		Snd_Play("MFX_SPAWN_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_InsertNpc(none_105_corristo,"OC_CORRISTO");
		Wld_InsertNpc(none_106_rodriguez,"OC_RODRIGUEZ");
		Wld_InsertNpc(none_107_damarok,"OC_DAMAROK");
		Wld_InsertNpc(none_108_drago,"OC_DRAGO");
		Wld_InsertNpc(none_109_torrez,"OC_TORREZ");
		FIREMAGECOMES = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Vyvolal jsem duše Corrista a mágů Ohně, které zavraždil Gomez. Musím si s nimi promluvit.");
	}
	else
	{
		AI_Print("Nic se nestalo...");
		Snd_Play("MFX_MASSDEATH_CAST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"FAR AKTUS BEK NOR KAR...");
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

instance ITWR_KAMPFKUNST(C_Item)
{
	name = "Mistr meče";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Mistr meče";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_kampfkunst;
	inv_animate = 1;
};


func void use_itwr_kampfkunst()
{
	var int nDocID;
	var int rnd;

	if(LEARN_MASTER == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearn1H = TRUE;
		DoLearn2H = TRUE;
		LEARN_MASTER = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_58 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_58 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"V průběhu dvou tisíc let bylo veškeré umění mistrů meče popsáno v tomto svazku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Obratnost, síla, přesnost, rychlost a reflexy. To jsou dovednosti, které by měly být trénovány a každý dobrý šermíř si jich cení.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tento svazek provázel válečníky celá staletí.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dokonalost, kterou dosáhl, zanechala nesmazatelnou známku. Epochy se vystřídaly a svět se změnil, ale učení harmonie vnitřních sil a pohybů těla jsou stále naživu.");
	Doc_Show(nDocID);
};


instance ITWR_ELEMENTAREARCANEI(C_Item)
{
	name = "Magické vědění";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Magické vědění";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_elementarearcanei;
	inv_animate = 1;
};


func void use_itwr_elementarearcanei()
{
	var int nDocID;
	var int rnd;

	if(ELEMENTARE_ONCE == FALSE)
	{
		B_GivePlayerXP(10);
		B_RaiseAttribute(self,ATR_MANA_MAX,5);
		AI_Print(PRINT_READASTRAL);
		ELEMENTARE_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_59 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_59 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Magické vědění");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Klasifikace magie podle pozemských názorů.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Léta výzkumu magie v tomto světě přinesla své ovoce. Je možno říci, že magie je element. A může ovlivňovat elementy ostatní, změnou jejich podstaty.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Spojení magie a elementu mu dává nejčistčí podobu, ale v přirodě se vyskytuje jen zřídka. Schopnost mága, vytvořit z ničeho hmotnou věc v tomhle světě, dokazuje, že magie dokáže vytvořit každý element.");
	Doc_Show(nDocID);
};

instance ITWR_JAGD_UND_BEUTE(C_Item)
{
	name = "Lov a kořist";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lovecké trofeje";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_jagd_und_beute;
	inv_animate = 1;
};

func void use_itwr_jagd_und_beute()
{
	var int nDocID;
	var int rnd;

	if(JAGD_UND_BEUTE_ONCE == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearnBow = TRUE;
		JAGD_UND_BEUTE_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_60 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_60 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tyto knihy prošly mnoha epochami a jejich rady jsou dodnes užívány učiteli loveckého umění. Velké boje na severu zanechaly odezvu - nikdo neumí tak dobře střílet z luku. Ale ani to z nich nedelá dobré lovce. Lov je něco víc, než zacházení se zbraní! Divoká příroda je tajemná a nepředvídatelná.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Lov s lukem není jen součást staré tradice, ale i nejrychlejší cesta, jak ulovit kořist. Po mnoho let střelecké techniky nepocítily žádné speciální změny a pravděpodobně tak tomu nebude ani v blízké budoucnosti. Co delá střelbu z luku při lovu tak samozřejmou? Tyto dovednosti jsou jeho součástí od počátku.");
	Doc_Show(nDocID);
};

instance MYRTANAS_LYRIK(C_Item)
{
	name = "Písně Myrtany";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Písně Myrtany";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemyrtanas_lyrik;
	inv_animate = 1;
};

func void usemyrtanas_lyrik()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_02 == FALSE)
	{
		READBOOKSDONE_02 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(10);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_61 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_61 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Píseň");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pokání");
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
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vše ztraceno jest, však slunce stále poznatelné.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Rok i období, stále nezměněné.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Paměť minulosti ruší důvod,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"zkoumat života původ.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"I duch bratrství, námi zapomenut, čeká.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Marné výhružky popravou, stejně,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"zvoleni jménem práva zvedají,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"že nikdy právo se ctí netají.");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance WAHRE_MACHT(C_Item)
{
	name = "Ryzí síla";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Ryzí síla";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usewahre_macht;
	inv_animate = 1;
};

func void usewahre_macht()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_03 == FALSE)
	{
		READBOOKSDONE_03 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(300);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_62 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_62 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ryzí síla");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Svatá povinnost zasvěceného");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pouze jedna věc rozlišuje mága od obyčejného človeka. Má schopnost ovlivňovat božskou moc, je bytostí, pro kterou hranice a zákony smrtelného světa nefungují.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pokud by mág mohl dosáhnout úrovně, ve které se mu podařilo překročit hranice své existence, stoupá nad zákony smrtelného světa. Může překročit hranice času a prostoru, dokonce i konec všeho, co existuje ve světě - ani smrt mu nemůže stát v cestě.");
	Doc_Show(nDocID);
};


instance MACHTVOLLE_KUNST(C_Item)
{
	name = "Mocné umění";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Mocné umění";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemachtvolle_kunst;
	inv_animate = 1;
};


func void usemachtvolle_kunst()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_04 == FALSE)
	{
		READBOOKSDONE_04 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_63 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_63 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mocné umění");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Práce pro začatečníky v umění Arkan.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Čím více mág chápe magii, tím lépe dokáže nakládat se svou magickou energií. Nejprve je unášen toky jako dřevo v potůčku. V té době se mu musí poskytnout příslušná péče, jinak ho potůček vyplaví na břeh. Ale jakmile potůček překoná, obrátí se do hluboké řeky.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Roste, stává se silnější každý den. Pozdeji nebude možno ho oslabit. Dovednost dosažení maximální moci je dar od bohů smrtelníkům, jež jsou hodni.");
	Doc_Show(nDocID);
};


instance GOETTERGABE(C_Item)
{
	name = "Dar bohů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dar bohů";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usegoettergabe;
	inv_animate = 1;
};


func void usegoettergabe()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_05 == FALSE)
	{
		READBOOKSDONE_05 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(40);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_64 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_64 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Magie");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Dar bohů");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Člověk se již mnoho století snaží porozumět podstatě magických zdrojů. Ale kde zahájit hledání? Jak vlastně popsat magii? Nejnestálejší esence ve vesmíru. Může zabíjet a léčit, tvořit i ničit.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jak vůbec vypadá? Jak může být člověku neviditelná, když je tak mocná? Magie je magická. Je to ten nejvíce překvapující dar bohů. Blahodárná síla, které vládnou jen ti, co jsou hodni.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Bartos z Laran");
	Doc_Show(nDocID);
};


instance GEHEIMNISSE_DER_ZAUBEREI(C_Item)
{
	name = "Záhady čarodějnictví";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Záhady čarodějnictví";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usegeheimnisse_der_zauberei;
	inv_animate = 1;
};


func void usegeheimnisse_der_zauberei()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_06 == FALSE)
	{
		READBOOKSDONE_06 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_65 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_65 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Záhady čarodějnictví");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Samotný mág je jenom uživatel magické moci, a ne její pán. Má schopnost ovlivňovat svět magické energie a provádět ji skrze sebe. Adept, oddaný vysokému umění magie, musí být schopen zkrotit svého ducha, aby toho dosáhl.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Síla jeho ducha pomáhá shromažďovat magické arkany, formovat, vázat a vnášet do našeho hmotného světa. V okamžiku nejvyšší koncentrace mág dokáže přenést svého ducha z našeho světa do jiných světů, odkud přichází síla. On je jen její průvodce.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Bartos z Laran");
	Doc_Show(nDocID);
};


instance ITWR_UMSONST_01(C_Item)
{
	name = "Marná cesta";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Marná cesta";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useumsonst_01;
	inv_animate = 1;
};


func void useumsonst_01()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_07 == FALSE)
	{
		READBOOKSDONE_07 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(150);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_66 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_66 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Marná cesta");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je to odměna všem, kteří si myslí, že lze najít nenalezitelné. Teď se radujte, neboť je to tak...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... další stránky chybí...");
	Doc_Show(nDocID);
};

instance REZEPTUREN(C_Item)
{
	name = "Recepty vín";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Recepty vín - svazek I.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = userezepturen;
	inv_animate = 1;
};

func void userezepturen()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_08 == FALSE)
	{
		READBOOKSDONE_08 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(25);
		Log_CreateTopic(TOPIC_SPECIALWINES,LOG_NOTE);
		AI_Print("Naučeno: Alchymie - 'Víno 'Balzám prozřetelnosti''");
		B_LogEntry(TOPIC_SPECIALWINES,"Ingredience pro VÍNO 'BALZÁM PROZŘETELNOSTI': 2x hrozen, 2x tráva z bažin, ohnivý jazyk a rum.");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_67 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_67 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Balzám prozřetelnosti:");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Proto se do jeho očí dostala žluč. Tato látka má horkou chuť. Pokud se dostane do očí, člověk začíná vidět hořkost světa, takže jeho moudrost roste. Stane se vidoucím! Hořkost a moudrost jsou závislé na sobě.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Slzy utrpení a zklamání také nesou hořkost a moudrost, utěšují člověka, který má bolesti. Hořkost a moudrost jsou opačné. Tam, kde je hořkost, není žádná moudrost, kde je moudrost - není hořkost.");
	Doc_Show(nDocID);
};


instance REZEPTUREN2(C_Item)
{
	name = "Recepty vín";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Recepty vín - svazek II.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = userezepturen2;
	inv_animate = 1;
};


func void userezepturen2()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_09 == FALSE)
	{
		READBOOKSDONE_09 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(25);
		Log_CreateTopic(TOPIC_SPECIALWINES,LOG_NOTE);
		AI_Print("Naučeno: Alchymie - 'Víno 'Zapomnění''");
		B_LogEntry(TOPIC_SPECIALWINES,"Ingredience pro VÍNO 'ZAPOMNĚNÍ': 4x hrozen, 2x srdce démona a 3x luční pohanka.");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_68 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_68 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Víno zapomnění");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nejlepší hrozny pro toto víno jsou ručně pestovány vysoko v horách Archolosu. Dovést toto víno k dokonalosti, to je hotové umení. Základní tajemství vína: Vždy by melo zůstat bezchybné. Při přípravě vína se hrozny překládají speciální travinou.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Viděli, jak mistr proměnil nejčistší pramen vody ve víno a byli ohromeni. Modlili se za jeho dar. Jako potrestání za lenost mistr uzavřel žáky do láhví a sám zmizel v ohnivém sloupu.");
	Doc_Show(nDocID);
};


instance ITWR_VARUSCONTENT(C_Item)
{
	name = "Seznam Varuse";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_varuscontent;
	description = name;
	text[2] = "Seznam nezbytného proviantu";
	text[3] = "pro paladiny od lorda Varuse.";
	inv_animate = 1;
};


func void use_itwr_varuscontent()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Seznam proviantu");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"50 kusů pečeného masa");
	Doc_PrintLine(nDocID,0,"15 - 20 láhví vody");
	Doc_PrintLine(nDocID,0,"5 láhví piva");
	Doc_PrintLine(nDocID,0,"20 pytlů mouky");
	Doc_PrintLine(nDocID,0,"3 krabice sýru");
	Doc_PrintLine(nDocID,0,"1 láhev vína");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zbytek záleží na tobě, Hagene.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Lord Varus");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_HAGENCONTENT(C_Item)
{
	name = "Seznam lorda Hagena";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_hagencontent;
	description = name;
	text[2] = "Seznam proviantu nezbytného pro paladiny.";
	inv_animate = 1;
};


func void use_itwr_hagencontent()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Seznam");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"75 kusů pečeného masa");
	Doc_PrintLine(nDocID,0,"25 - 30 láhví PITNÉ vody");
	Doc_PrintLine(nDocID,0,"10 láhví piva");
	Doc_PrintLine(nDocID,0,"35 pytlů mouky");
	Doc_PrintLine(nDocID,0,"8 krabic sýru");
	Doc_PrintLine(nDocID,0,"4 láhve vína");
	Doc_PrintLine(nDocID,0,"250 jablek");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		S pozdravem, lord Hagen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_VatrasTransferMagic(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_VatrasTransferMagic;
	scemeName = "MAPSEALED";
	description = "Magický svitek Vatrase";
	text[4] = "Vrací lidské vědomí...";
	inv_animate = 1;
};

func void Use_ItWr_VatrasTransferMagic()
{
	var C_Npc WereWl;

	WereWl = Hlp_GetNpc(Werewolf);

	if(Npc_GetDistToNpc(WereWl,hero) <= 500)
	{	
		B_GivePlayerXP(150);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",WereWl,WereWl,0,0,0,FALSE);
		WereWolfIsHuman = TRUE;
		WereWl.start_aistate = zs_mm_rtn_huntgone;
		AI_Standup(WereWl);
		AI_ContinueRoutine(WereWl);
	}
	else
	{
		B_Say(hero,hero,"$DONTWORK");
		CreateInvItems(hero,ItWr_VatrasTransferMagic,1);
	};
};

instance ITWR_XARDASGOBLINSCROLL(C_Item)
{
	name = "Svitek zapuzení";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_xardasgoblinscroll;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Zapudí vyvolaná stvoření";
	text[4] = "Dá se použít jen jednou...";
	inv_animate = 1;
};


func void use_itwr_xardasgoblinscroll()
{
	var int nDocID;
	var C_Npc xargob;
	xargob = Hlp_GetNpc(xardas_goblin);
	Snd_Play("MFX_MASSDEATH_CAST");
	if((XARDASGOBLINREADYAWAY == TRUE) && (MIS_GOBLINAWAY == LOG_Running))
	{
		xargob.start_aistate = zs_mm_rtn_demonrest;
		AI_Teleport(xargob,"TOT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		CreateInvItems(hero,itke_xardasgoblinkey,1);
		MIS_GOBLINAWAY = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GOBLINAWAY,LOG_SUCCESS);
		B_LogEntry(TOPIC_GOBLINAWAY,"Pomocí svitku jsem to podivné stvoření vypudil z tohoto světa.");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSDEM.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_XARDASDOCS_1(C_Item)
{
	name = "Xardasovy rukopisy, část první";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tlustý balík papírů...";
	inv_animate = 1;
};

instance ITWR_XARDASDOCS_2(C_Item)
{
	name = "Xardasovy rukopisy, část druhá";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tlustý balík papírů...";
	inv_animate = 1;
};

instance ITWR_XARDASDOCS_3(C_Item)
{
	name = "Xardasovy rukopisy, část druhá - originál";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tlustý balík papírů...";
	inv_animate = 1;
};

instance ITWR_LOSTISLANDMAP(C_Item)
{
	name = "Kamenná tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_LostIslandMap.3ds";
	material = MAT_STONE;
	on_state[0] = use_itwr_lostislandmap;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[2] = "Na přední straně tabulky je podivný vzor,";
	text[3] = "a na opačné je vyryto několik tajemných symbolů.";
	inv_animate = 1;
};


func void use_itwr_lostislandmap()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LOSTISLAND_MAP.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LETTERFALK(C_Item)
{
	name = "Dopis od Falka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letterfalk;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Dopis od Falka obchodníkovi Bosperovi.";
	inv_animate = 1;
};


func void use_itwr_letterfalk()
{
	var int nDocID;
	if((FALKLETTEROPENED == FALSE) && (MIS_LETTERFALK == LOG_Running))
	{
		CreateInvItems(hero,itwr_letterfalk_open,1);
		FALKLETTEROPENED = TRUE;
		B_LogEntry(TOPIC_LETTERFALK,"Otevřel jsem Falkův zapečetěný dopis. Chce v něm od Bospera alespoň sto šípů. Asi nebylo dobré dopis otevírat...");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Drahý příteli.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Docházejí mi šípy, tento dopis ti donese někdo z našich lidí - já teď nemohu jít osobně. A proto tě velmi žádám, abys mi poslal alespoň sto šípů po nositeli tohoto dopisu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Falk");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LETTERFALK_OPEN(C_Item)
{
	name = "Dopis od Falka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letterfalk_open;
	scemeName = "MAP";
	description = name;
	text[2] = "Otevřený dopis od Falka Bosperovi.";
	inv_animate = 1;
};


func void use_itwr_letterfalk_open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Drahý příteli.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Docházejí mi šípy, tento dopis ti donese někdo z našich lidí - já teď nemohu jít osobně. A proto tě velmi žádám, abys mi poslal alespoň sto šípů po nositeli tohoto dopisu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Falk");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_FALKGRANDFATHER_01(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_01;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý útržek papíru s poznámkami...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_01()
{
	var int nDocID;
	if(FINDFALKGRANDFATHERSEEK_01 == FALSE)
	{
		FINDFALKGRANDFATHERSEEK_01 = TRUE;
		if(Npc_KnowsInfo(hero,dia_hun_741_falk_grand))
		{
			B_GivePlayerXP(50);
			MIS_FALKGRANDFATHERSEEK = LOG_Running;
			Log_CreateTopic(TOPIC_FALKGRANDFATHERSEEK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_Running);
			B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Ve starých ruinách na severu ostrova jsem našel zvláštní papír s poznámkami. Velmi připomíná zbytky deníku lovce Bena. Slyšel jsem o něm mluvit Falka v táboře lovců. Možná bych mu to měl ukázat...");
			B_Say(self,self,"$HOWINTEREST");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dnes při lovu jsem trefil jedno velmi zvláštní zvíře. Nikdy jsem v těchto končinách nic takového neviděl. Kde se tu vzalo?! Možná... (nečitelný text)... Zkusím se po něm podívat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Ben ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_GALKGRANDFATHER_02(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_02;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s poznámkami...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_02()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_02 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(100);
		FINDFALKGRANDFATHERSEEK_02 = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"V jeskyni u tábora pirátů jsem našel další Benovu poznámku. Podle ní chce tuto část ostrova lépe prozkoumat.");
		Wld_InsertItem(itmi_falkgrandfatheritem_03,"FP_AW_ITEM_FALKGFWROTE_02");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nedaleko od jeskyně, kde jsem přebýval, jsem narazil na další divná zvířata. Nedaleko odtud... (nečitelný text)... Vše je to jednoduše překvapující! Zítra se do těch oblastí vydám.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Ben ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_HALKGRANDFATHER_03(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_03;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s poznámkami...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_03()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_03 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(50);
		FINDFALKGRANDFATHERSEEK_03 = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Podle Benových zápisků to vypadá, že jeho cesta ho zavedla do kaňonu. Možná další stopy budou tam.");
		Wld_InsertItem(itmi_falkgrandfatheritem_04,"FP_AW_ITEM_FALKGFWROTE_03");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dobrá lovecká oblast! Vše se to tu hemží nestvůrami a lovnou zvěří. Bohužel jsou nekteré z nich docela dost nebezpečné... Už delší dobu plánuji zajít do toho velkého kaňonu, protože tam určitě budou zvířata silnejší a vytrvalejší, kvůli náročným podmínkám.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Ben ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_JALKGRANDFATHER_04(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_04;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s poznámkami...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_04()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_04 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(100);
		FINDFALKGRANDFATHERSEEK_04 = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Vypadá to, že kaňon nebyl pro Bena dostatečně atraktivní. Napsal, že stvoření zde jsou daleko divočejší, než předpokládal a tak se přesunul dál. Jeho stopy pravděpodobně povedou velkou jeskyní u kaňonu, která ho spojuje s bažinou.");
		Wld_InsertItem(itwr_Kalkgrandfather_final,"FP_AW_ITEM_FALKGFWROTE_04");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kaňon se ukázal jako nadmíru nebezpečné místo, možná by nebylo špatné sbalit těch pár vecí, co mi ješte zbylo a vypadnout... Dneska ráno jsem v hoerách našel velikou jeskyni, která vypadala opravdu zajímavě, takže se tam asi půjdu podívat. Kdo ví, kam mě zavede...?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				Ben ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_KALKGRANDFATHER_FINAL(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_final;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s poznámkami...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_final()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_FINAL == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(150);
		FINDFALKGRANDFATHERSEEK_FINAL = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Podle zápisků viděl Ben v bažinách velmi zvláštní stvoření, podobné důlním červům. Samozřejme, že takový zkušený lovec asi nepromarní tak velkou příležitost a vydal se ho pronásledovat.");
		Wld_InsertItem(itwr_Lalkgrandfather_finalext,"FP_AW_ITEM_FALKGFWROTE_05");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Včera jsem nedaleko tábora zahlédl podivnou kreaturu. Připomíná důlního červa, ale při(nečitelný text)... Snad mě stopy dovedou k němu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Ben ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LALKGRANDFATHER_FINALEXT(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_finalext;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s poznámkami...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_finalext()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_FINALEXT == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(200);
		FINDFALKGRANDFATHERSEEK_FINALEXT = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Vypadá to, že Ben nebyl ve svém lovu úspěšný. Píše, že stvoření nemohl zabít...");
		Wld_InsertNpc(blattcrawlerex,"ADW_SWAMP_TO_BIGSEA_01");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nemůžu najít způsob, jak zabít toto stvoření... (nečitelný text)... Je moc obratné a pravidelně mi uniká. Ale zítra se vše změní.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Ben ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_ORCSORDER(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OrcN.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_orcsorder;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s nečitelnými symboly...";
	inv_animate = 1;
};


func void use_itwr_orcsorder()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);

	if(MIS_ORCORDER == LOG_Running)
	{
	 	if((PlayerKnowsOrcLanguage == TRUE) && (KNOWSTARANBUILD == FALSE))
		{
			B_LogEntry(TOPIC_ORCORDER,"Našel jsem dopis od kapitána skřetí lodě. Říká, že skřeti poslali skupinu otroků, aby vyrobili nové beranidlo pro dobití hradu. Zdá se, že tento oddíl by měl brzy dorazit do svého tábora poblíž pevnosti. Musím o tom co nejdříve informovat Alberta.");
			KNOWSTARANBUILD = TRUE;
		};
	};
};


instance ITWR_ANCIENT(C_Item)
{
	name = "Prastará tajemství";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_ancient;
	scemeName = "MAP";
	description = name;
	text[2] = "Kniha vyzařuje magické světlo...";
	text[3] = "Na obálce knihy jsou kapky krve.";
	inv_animate = 1;
};


func void use_itwr_ancient()
{
	var int nDocID;

	if(MEANDMILTENTELEPORTDCDONE == FALSE)
	{
		AI_Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_MASSDEATH_CAST");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - (hero.attribute[ATR_HITPOINTS] / 2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);

		if(ANCIENTBOOKBONUS == FALSE)
		{
			B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			ANCIENTBOOKBONUS = TRUE;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			B_Say(self,self,"$HOWINTEREST");
		};
		if((BookBonus_69 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_69 = TRUE;
		};
	};
};


instance ITWR_NECRONOMICON(C_Item)
{
	name = "Nekronomikon";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_necronomicon;
	scemeName = "MAP";
	description = name;
	text[2] = "Kniha vyzařuje temnou auru...";
	inv_animate = 1;
};


func void use_itwr_necronomicon()
{
	var int nDocID;
	if(hero.guild == GIL_KDM)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);

		if(NECRONOMICONBONUS == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			B_RaiseAttribute(hero,ATR_MANA_MAX,10);
			Snd_Play("Levelup");
			NECRONOMICONBONUS = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else
	{
		AI_Print("Kouzlo knihy mi nedovoluje otevřít ji...");
		Snd_Play("MFX_MASSDEATH_CAST");
		if(NECRONOMICONBONUSTRY == FALSE)
		{
			NECRONOMICONBONUSTRY = TRUE;
		};
	};
};

instance ITWR_XARDASPAINT(C_Item)
{
	name = "Portrét mága Ohně";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_xardaspaint;
	scemeName = "MAP";
	description = "Portrét mága Ohně";
	text[2] = "Mág reprezentující svůj řád.";
	text[3] = "Někoho mi to silně připomíná...";
	inv_animate = 1;
};


func void use_itwr_xardaspaint()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"XardasPaint.TGA",0);
	Doc_Show(nDocID);
};


instance ITWR_ORTEGOLETTER(C_Item)
{
	name = "Poznámky Ortegy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_ortegoletter;
	scemeName = "MAP";
	description = name;
	text[2] = "Pomačkaný papír se špatným rukopisem...";
	inv_animate = 1;
};


func void use_itwr_ortegoletter()
{
	var int nDocID;

	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE))
	{
		B_GivePlayerXP(50);
		READORTEGO = TRUE;
		B_LogEntry(TOPIC_KILLIGNAZ,"V jedné z jeskyní u Khorinisu jsem potkal muže jménem Ortega. Pravděpodobně na někoho čekal a spletl si mě s ním. Z naší konverzace jsem vyrozuměl, že Ortega je vrah a čeká na svého zaměstnavatele. Jakmile zjistil, že já to nejsem, pokusil se mě zabít, ale byl příliš pomalý... Našel jsem u něj dopis, ve kterém někdo chtěl zabít Ignaze, zavražděného alchymistu. Myslím, že Ortega čekal na svou odměnu. Nyní je jasné, že Constantino je nevinný! Měl bych zde ale chvíli počkat, abych zjistil, kdo je Ortegův zaměstnavatel.");
		B_StartOtherRoutine(KDF_503_Karras,"MeetKiller");
		AI_Teleport(KDF_503_Karras,"NW_CITY_SMFOREST_04");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jméno, které potřebuješ - Ignaz, alchymista. Najdi ho a nedělej kolem toho moc velký rozruch. Na smluveném místě za tebou pak přijdu s odměnou.");
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


instance ITWR_DJG_ARMOR(C_Item)
{
	name = "Nákresy plátů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OldP.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_djg_armor;
	scemeName = "MAP";
	description = name;
	text[2] = "Nákresy plátů zbroje z důlního červa";
	inv_animate = 1;
};

func void use_itwr_djg_armor()
{
	var int nDocID;
	if(KNOWMAKECRAWLERARMOR == FALSE)
	{
		B_GivePlayerXP(100);
		KNOWMAKECRAWLERARMOR = TRUE;
		Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování ZBROJE Z KRUNÝŘŮ DŮLNÍHO ČERVA: železný ingot, prykyřice a 10x krunýř důlního červa.");
		Log_AddEntry(TOPIC_HUNTERSARMOR,"Našel jsem Wolfovu truhlu! Jak řekl, nákres byl v ní. Jde se vyrábět zbroj!");
		B_Say(self,self,"$HOWINTEREST");
	};
	if((BookBonus_70 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_70 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"DJGArmorCrawlerLetter.TGA",0);
	Doc_Show(nDocID);
};


instance ITWR_LETTERORESWORD(C_Item)
{
	name = "Poznámky od Hagena";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letteroresword;
	scemeName = "MAP";
	description = name;
	text[2] = "Je zde popsán postup výroby rudných čepelí...";
	inv_animate = 1;
};


func void use_itwr_letteroresword()
{
	var int nDocID;

	if(KNOWNORESWORD == FALSE)
	{
		KNOWNORESWORD = TRUE;
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování PROSTÉHO RUDNÉHO MEČE: ingot magické rudy.");
		B_Say(self,self,"$SMITHBOOK");
	};
	if((BookBonus_71 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_71 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba rudné čepele je složitá, ale jen tehdy, má-li být precizní. Pro válečné účely stačí jeden ingot magické rudy a postup výroby je stejný jako u normálního meče. Avšak narozdíl od něj je tento velmi odolný a navržen k paladinskému stylu boje.");
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

instance ITWR_TRANSFERENERGY(C_Item)
{
	name = "Nosič energie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_transferenergy;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Tento svitek obsahuje kouzlo přenosu energie.";
	inv_animate = 1;
};

func void use_itwr_transferenergy()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		if((Npc_HasItems(hero,ItMi_Avatar_Dark) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Fire) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Water) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Stone) >= 1) && ((SIMPLEBLACK_1H_ONME == TRUE) || (SIMPLEBLACK_2H_ONME == TRUE)))
		{
			B_GivePlayerXP(1500);
			AI_UnequipWeapons(hero);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Dark,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Fire,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Water,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Stone,1);

			if(SIMPLEBLACK_1H_ONME == TRUE)
			{
				if(Npc_HasItems(hero,itmw_1h_simpleblack) >= 1)
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack,1);
				}
				else if(Npc_HasItems(hero,itmw_1h_simpleblack_dex) >= 1)
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic_dex,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack_dex,1);
				}
				else
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack,1);
				};
			}
			else
			{
				CreateInvItems(hero,itmw_2h_blessedblack_magic,1);
				Npc_RemoveInvItems(hero,itmw_2h_simpleblack,1);
			};

			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			NETBEKLEADME_STEP2DONE = TRUE;
			AI_Print(PRINT_MAKESUPERSWORD);
			B_LogEntry(TOPIC_GUARDIANS,"Vytvořil jsem meč, s jehož pomocí můžu porazit Strážce. Je čas je navštívit.");
		}
		else
		{
			AI_Print("Nic se nestalo...");
			Snd_Play("MFX_MASSDEATH_CAST");
			CreateInvItems(self,itwr_transferenergy,1);
		};
	}
	else
	{
		AI_Print("Nic se nestalo...");
		Snd_Play("MFX_MASSDEATH_CAST");
		CreateInvItems(self,itwr_transferenergy,1);
	};
};

instance ITWR_DRAGONTALE(C_Item)
{
	name = "Ústa draka - svazek první";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Ústa draka";
	text[0] = "Svazek první";
	text[4] = "Prastarý svazek je obepnut plameny...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_dragontale;
	inv_animate = 1;
};


func void use_itwr_dragontale()
{
	var int nDocID;
	var int rnd;

	if(DRAGONTALE_1 == FALSE)
	{
		DRAGONTALE_1 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(500);
		hero.lp = hero.lp + 2;
		AI_Print("+ 2 VB");
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_72 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_72 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Po mnoho století byli draci považováni za nejnebezpečnější stvoření na světě. Stačilo se jen podívat, jak mocní a silní byli!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Většinou žili v hlubokých a vysokých horách, kam se nemohla lidksá noha dostat, nebo přebývali v temných jeskyních, perfektně ukrytí před zraky nežádaných návštevníků.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jen blázen by zkřížil cestu drakovi - jeho plamen dokáže téměř cokoliv proměnit na popel... Po človeku zbydou možná jen vzpomínky!");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ale někteří odvážní lidé dokázali zjistit, že i draci mají slabá místa...");
	Doc_Show(nDocID);
};


instance ITWR_DRAGONTALE_2(C_Item)
{
	name = "Ústa draka - svazek druhý";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Ústa draka";
	text[0] = "Svazek druhý";
	text[4] = "Prastarý svazek je obepnut plameny...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_dragontale_2;
	inv_animate = 1;
};


func void use_itwr_dragontale_2()
{
	var int nDocID;
	var int rnd;

	if(DRAGONTALE_2 == FALSE)
	{
		DRAGONTALE_2 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(500);
		hero.lp = hero.lp + 2;
		AI_Print("+ 2 VB");
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_73 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_73 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Draci jsou téměř neporazitelní! Silné šupiny kryjí jejich těla od hlavy až po ocas, ani nejostřejší meč nepronikne. Šípy jsou proti nim také bezmocné.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nicméně to neznamená, že drak nemůže být zabit. Slabé místo je břicho, které není pokryto tak silnými šupinami. Do něj je možno zasadit smrtlený úder. Jenže aby to bylo možné, musíte se první dostat k drakovi, což je samozřejmě dosti obtížné.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"To ale není vše, čím nás drak může ohrozit. Téměř kadžý drak, který se dožije dospělosti, je zbehlý v magii. Draci si také velice rychle vypěstují odolnost proti nebezpečí v prostředí, kde žijí.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Potom jsou ledoví draci z Nordmaru extrémě odolní proti mrazu a ohniví draci z Varantu proti žáru. Samozřejmě to platí i naopak a ledového draka snadno zraníme ohněm, stejně jako ohnivého ledem.");
	Doc_Show(nDocID);
};


instance ITWR_DEMONTALE(C_Item)
{
	name = "Stíny noci";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[4] = "Na obálce knihy je vyryt obrys temného démona...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_demontale;
	inv_animate = 1;
};


func void use_itwr_demontale()
{
	var int nDocID;
	var int rnd;

	if(DEMONTALE == FALSE)
	{
		DEMONTALE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(200);
		hero.lp = hero.lp + 2;
		AI_Print("+ 2 VB");
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_74 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_74 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nejkrvežíznivější a nejstrašnější stvoření, která vytvořil Beliar, bůh temnot, jsou démoni! Slepě následují svého pána, šíříce smrt a hrůzu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Démoni disponují velkou silou a mocí, jejich zápal je nutí zabít vše, co je slabší, než oni.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Kromě toho nejsou zranitelní ohněm, ani téměř žádnou zbraní. A jen velmi silná magie dokáže tyto bytosti tmy zapudit.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Toho, kdo jim padne do spárů, bez milosti mučí, dokud nezemře bolestí a vyčerpáním...");
	Doc_Show(nDocID);
};

instance ITWR_DRAGSTONE(C_Item)
{
	name = "Drahé kameny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_ITWR_DRAGSTONE;
	inv_animate = 1;
};

func void use_ITWR_DRAGSTONE()
{
	var int nDocID;
	var int rnd;

	if(DRAGSTONE == FALSE)
	{
		B_GivePlayerXP(50);
		DRAGSTONE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_75 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_75 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Mnoho drahých kamenů obsahuje určité magické vlastnosti. Ačkoli, jen některé z nich jsou známé.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Například rubín dává svému majiteli moc, smaragd zase zručnost.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Před použitím by kámen měl být vhodně zpracován na klenotnickém stole. Až poté může být použit.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Způsob zpracování drahých kamenů je znám pouze vybraným klenotníkům.");
	Doc_Show(nDocID);
};

instance ITWR_SKELETONTALE(C_Item)
{
	name = "Chmurné volání";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_skeletontale;
	inv_animate = 1;
};


func void use_itwr_skeletontale()
{
	var int nDocID;
	var int rnd;

	if(SKELETONTALE == FALSE)
	{
		B_GivePlayerXP(150);
		SKELETONTALE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_76 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_76 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ti, kdož zemřeli a žili nečestně, čeká vzkříšení jejich těl a boj za Beliara.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bezduché legie válečníků smrti čekají na hodinu, kdy jim jejich pán nařídí bojovat proti Innosovi. Nikdo je nezastaví!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Neznají odpočinku, lítosti ani únavy! Všichni, kdo neuctí jejich pána, budou zničeni.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jen svatý oheň Innose jim dokáže vzdorovat...");
	Doc_Show(nDocID);
};


instance ITWR_GOLEMBOOK1(C_Item)
{
	name = "Arkanum Golum - Svazek I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usegolembook1;
	description = "Arkanum Golum";
	text[0] = "Svazek I";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usegolembook1()
{
	var int nDocID;
	var int rnd;

	if(GOLEMTALE_1 == FALSE)
	{
		B_GivePlayerXP(100);
		GOLEMTALE_1 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_77 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_77 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Arkanum Golum - Svazek I");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kamenný golem");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Tito obři jsou téměř neporazitelní. Meče, sekery, luky, nic z toho jim nepůsobí sebemenší poškození.");
	Doc_PrintLines(nDocID,0,"Jediný zaznamenaný případ, kdy se někomu podařilo zničit kamenného golema, byl ten, kdy ho jeden žoldák zkusil praštit svým kladivem.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Bažinný golem");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Jen ti, kdo už stáli tváří v tvář těmto kreaturám, vědí, jaké nebezpečí představují pro poutníky.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jsou odolní vůči magii a kladivu, ale meč je rozseká na kousky.");
	Doc_Show(nDocID);
};


instance ITWR_GOLEMBOOK2(C_Item)
{
	name = "Arkanum Golum - Svazek II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usegolembook2;
	description = "Arkanum Golum";
	text[0] = "Svazek II";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usegolembook2()
{
	var int nDocID;
	var int rnd;

	if(GOLEMTALE_2 == FALSE)
	{
		B_GivePlayerXP(100);
		GOLEMTALE_2 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_78 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_78 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"ARKANUM GOLUM - Svazek II");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ledový golem");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Ledový golem je podobný, jako kamenný, ale z ledu. Všechny zbraně sjedou po kluzkém povrchu.");
	Doc_PrintLines(nDocID,0,"Poutníci by měli také vědet, že golem má moc zmrazit vše, co je z vody, takže i krev v žilách...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Mágové Ohně ale shledali, že není těžké je rozpustit pomocí dostatečného žáru.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ohnivý golem");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Tito tvorové mohou člověka promenit v hořící pochodeň.");
	Doc_PrintLines(nDocID,1,"Nejlepší obranou je dobré ledové kouzlo.");
	Doc_Show(nDocID);
};


instance ELEMENTARE_ARCANEI(C_Item)
{
	name = "Základy magie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Základy magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_elementare_arcanei;
	inv_animate = 1;
};


func void use_elementare_arcanei()
{
	var int nDocID;
	var int rnd;

	if(ELEMENTAREARCANEI == FALSE)
	{
		B_GivePlayerXP(100);
		ELEMENTAREARCANEI = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_79 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_79 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Základy magie");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Místo magie ve světě");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Najít místo magie a její spoj se základními elementy, to je snad nejčastější a nejneúspešnejší výzkum. Každý ví, že takové místo existuje, ale ješte ho nikdo nenašel.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Každý element v jeho přirozené formě je spojen s magií. Jejich spojení je na místě magie přerušeno a magie se od něj může odpoutat. Takové místo však nidko nikdy nenašel. Schopnost mága vytvořit či vyvolat elementy přesto dokazuje, že ono místo existovat musí a magie je nejsilnější moc ve vesmíru.");
	Doc_Show(nDocID);
};

instance ITWR_1TESTFONT(C_Item)
{
	name = "Testovací svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_1TESTFONT;
	scemeName = "MAP";
	description = name;
	text[2] = "Gerbrandtův dopis pro chlapa v hostinci.";
	inv_animate = 1;
};

func void use_1TESTFONT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pomoz mi vyřešit problém s člověkem jménem Wambo. Však víš, co dělat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Platba za služby je součástí tohohle dopisu.");
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

instance ITWR_2TESTFONT(C_Item)
{
	name = "Testovací kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin, část I";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_2TESTFONT;
	inv_animate = 1;
};

func void use_2TESTFONT()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten kdo je připraven se vzdáti všech pozemských vášní a následovat pouze cestu pravdy musí přijít také na to, kde se nachází zdroj mé síly. Kdo ho najde, bude poté muset zničit všechno, co ho spojuje s tímto světem. Potom se ukáže jestli je hodet pochopit pravdy Chromaninu.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Moudrý člověk dříve než začne bdět o budoucnu, pochopí minulost.");
	Doc_Show(nDocID);
};

instance ItWr_MonasterySecret(C_Item)
{
	name = "Přízračný plamen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_STONOS_XRONIKS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_MonasterySecret;
	inv_animate = 1;
};

func void Use_ItWr_MonasterySecret()
{
	var int nDocID;
	var int rnd;

	if(MonasterySecret == FALSE)
	{
		B_GivePlayerXP(150);
		MonasterySecret = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		MIS_MonasterySecret = LOG_Running;
		Log_CreateTopic(TOPIC_MonasterySecret,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MonasterySecret,LOG_Running);
		B_LogEntry(TOPIC_MonasterySecret,"Existuje mnoho legend a jedna z nich je o jistém artefaktu schopném vyvolat na pomoc skutečného draka! Nikdo neví, zda je to pravda nebo ne, ale historie zmiňuje mága-alchymistu, kterému se podařilo vytvořit takový objekt. Pokud by čtenář této knihy, chtěl najít tento artefakt, pak se říká, že by měl začít hledat místo zvané Amon Shen... Co to asi znamená?");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_80 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_80 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Existuje mnoho legend a jedna z nich je o jistém artefaktu schopném vyvolat na pomoc skutečného draka!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nikdo neví, zda je to pravda nebo ne, ale historie zmiňuje mága-alchymistu, kterému se podařilo vytvořit takový objekt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Přivolané stvoření není tak silné jako stvoření Beliara, ale jeho síla může rozdrtit celou armádu.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pokud by čtenář této knihy, chtěl najít tento artefakt, pak se říká, že by měl začít hledat místo zvané Amon Shen...");
	Doc_Show(nDocID);
};

instance ITWr_MonasterySecretLeadOW(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ITWr_MonasterySecretLeadOW;
	scemeName = "MAP";
	description = name;
	text[2] = "Starý kus papíru s nesrozumitelnými poznámkami...";
	inv_animate = 1;
};

func void use_ITWr_MonasterySecretLeadOW()
{
	var int nDocID;

	if((MonasterySecretLeadOW == FALSE) && (MIS_MonasterySecret == LOG_Running))
	{
		B_GivePlayerXP(100);
		MonasterySecretLeadOW = TRUE;
		B_LogEntry(TOPIC_MonasterySecret,"Všechno, co jsem dokázal zjistit z textu, který jsem našel, je jméno Creol.");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... (nečitelný text) ... Creol ... (nečitelný text)...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Osair_Read(C_Item)
{
	name = "Psaní";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Osair_Read;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Otevřený dopis Osaira k Nrozasovi.";
	inv_animate = 1;
};

func void Use_ItWr_Osair_Read()
{
	var int nDocID;

	if(MIS_OsairDemand == FALSE)
	{
		MIS_OsairDemand = LOG_Running;
		Log_CreateTopic(TOPIC_OsairDemand,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OsairDemand,LOG_Running);
		B_LogEntry(TOPIC_OsairDemand,"Jak zajímavé! Na žádost Nrozase chce Osair dostat kůži černého jeskynního trola. Pokud tu trofej dokážu získat, může to hrát v můj prospěch.");
		B_Say(self,self,"$HOWINTEREST");
		Wld_InsertNpc(TROLL_BLACK_AGE_PW,"PW_CAVEBLACKTROLL");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Drahý Nrozasi!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Souhlasím s tím, že ti pošlu víc lidského materiálu, pokud se vrátime k otázce vzácné kůže černého jeskynního trola, kterou jsem tebe dlouho žádal. Přemýšlej o tom!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Osair");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_ConstRecept(C_Item)
{
	name = "Alchymistický recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_ConstRecept;
	inv_animate = 1;
};

func void Use_ItWr_ConstRecept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Seznam ingrediencí:");
	Doc_PrintLine(nDocID,0,"Akvamarín");
	Doc_PrintLine(nDocID,0,"Stříbrný prsten");
	Doc_PrintLine(nDocID,0,"Voda");
	Doc_PrintLine(nDocID,0,"Kost z kostlivce");
	Doc_PrintLine(nDocID,0,"Tráva z bažin");
	Doc_PrintLine(nDocID,0,"Sýr");
	Doc_PrintLine(nDocID,0,"Tmavé houby");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fingersliste(C_Item)
{
	name = "Nákres";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Fingersliste;
	scemeName = "MAP";
	description = "Seznam";
	text[4] = "Pokyny pro výrobu meče 'Zlatá jehla'...";
	inv_animate = 1;
};

func void Use_ItWr_Fingersliste()
{
	var int nDocID;
	var int rnd;

	if(Lovkach_W8 == FALSE)
	{
		B_GivePlayerXP(300);
		AI_Print("Naučeno: Kovářství - 'Zlatá jehla'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování ZLATÉ JEHLY: 5x ingot magické rudy, černá ruda, zlatý ingot, 8x síra, 3x křemen, 4x pryskyřice a černá perla.");
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
		Lovkach_W8 = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		MIS_TellAboutFingers = LOG_Success;
		Log_SetTopicStatus(TOPIC_TellAboutFingers,LOG_Success);
		B_LogEntry(TOPIC_TellAboutFingers,"Znám postup pro výrobu meče 'Zlatá jehla'.");
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
	if((BookBonus_81 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_81 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Zlatá jehla'... komponenty:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"...- pět ingotů magické rudy");
	Doc_PrintLine(nDocID,0,"- kus černé rudy");
	Doc_PrintLine(nDocID,0,"- zlatý prut");
	Doc_PrintLine(nDocID,0,"- osm kusů síry");
	Doc_PrintLine(nDocID,0,"- tři kusy ledového křemene");
	Doc_PrintLine(nDocID,0,"- čtyři hrnky pryskyřice");
	Doc_PrintLine(nDocID,0,"- černá perla...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_VatrasDiary(C_Item)
{
	name = "Vatrasův deník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_VatrasDiary;
	inv_animate = 1;
};

func void Use_ItWr_VatrasDiary()
{
	var int nDocID;
	var int rnd;

	if(VatrasDiaryBonus == FALSE)
	{
		B_GivePlayerXP(500);
		B_Say(self,self,"$HOWINTEREST");
		VatrasDiaryBonus = TRUE;
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
	if((BookBonus_82 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_82 = TRUE;
	};
	if((PLAYER_TALENT_RUNES[SPL_Zap] == FALSE) && (((hero.guild == GIL_NOV) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR)) || (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1)))
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,1);
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		Snd_Play("Levelup");
		Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
		AI_Print("Naučeno: Tvorba run - 'Blesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy BLESK: svitek kouzla a kamenný krystal.");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Návod na vytvoření runy - 'Blesk'");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tato runa je začátkem magie prvního kruhu magie Vody. Pro její výrobu potřebuji hlavně runový kámen, kamenný krystal a svitek příslušného kouzla. Zvláštní pozornost by měla být věnována kvalitě použitých komponentů, jinak runa neposkytne požadované účinky.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

//-------------------------rybalka-----------------------

instance PC_ANGEL_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_ANGEL_end_condition;
	information = PC_ANGEL_end_info;
	permanent = TRUE;
	description = "KONEC";
};

func int PC_ANGEL_end_condition()
{
	if(AngelIsOn == TRUE)
	{
		return TRUE;
	};
};

func void PC_ANGEL_end_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	Ext_RemoveFromSlot(hero,"BIP01 R HAND");
	Npc_RemoveInvItems(hero,ItSe_FAngel,Npc_HasItems(hero,ItSe_FAngel));
	AngelIsOn = FALSE;
};

instance PC_ANGEL_CATCH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_ANGEL_CATCH_condition;
	information = PC_ANGEL_CATCH_info;
	permanent = TRUE;
	description = "Vylovit rybu.";
};

func int PC_ANGEL_CATCH_condition()
{
	if(AngelIsOn == TRUE)
	{
		return TRUE;
	};
};

func void PC_ANGEL_CATCH_info()
{
	if(FishDay != Wld_GetDay())
	{
		CountFish += 1;

	 	if(Wld_IsTime(4,0,8,0) || Wld_IsTime(19,0,21,0) || (Wld_IsRaining() == TRUE))
		{
			if(Hlp_Random(100) >= 40)
			{
				CreateInvItems(hero,ItFo_Fish,1);
				AI_PrintClr("Chytil jsi rybu!",83,152,48);
				B_Say(hero,hero,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr("Nic jsi nechytil...",177,58,17);
				B_Say(hero,hero,"$NOTHINGTOGET02");
			};
		}
		else
		{
			if(Hlp_Random(100) >= 80)
			{
				CreateInvItems(hero,ItFo_Fish,1);
				AI_PrintClr("Chytil jsi rybu!",83,152,48);
				B_Say(hero,hero,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr("Nic jsi nechytil...",177,58,17);
				B_Say(hero,hero,"$NOTHINGTOGET02");
			};
		};
		if(CountFish >= 10)
		{
			FishDay = Wld_GetDay();
			CountFish = FALSE;
		};
	}
	else
	{
		CountFish = FALSE;
		AI_Print("Pro dnešek už stačilo...");
		B_Say(hero,hero,"$IDLE_SPECIAL");
	};
};

instance ItWr_HagenLoanDocs(C_Item)
{
	name = "Královský certifikát";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HagenLoanDocs;
	scemeName = "MAP";
	description = name;
	text[4] = "Osvědčení o vlastnictví pozemku...";
	inv_animate = 1;
};


func void Use_ItWr_HagenLoanDocs()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"         Certifikát");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Tento dokument uděluje právo vlastnit pozemek vedle staré věže Atros a přilehlý rudný důl.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Hagen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

var int CheckWantedPosterRocks;
var int CheckWantedPosterDexter;
var int CheckWantedPosterNestor;
var int CheckWantedPosterKriks;
var int CheckWantedPosterBart;
var int CheckWantedPosterSkiron;

instance ItWr_DexterWantedPoster(C_Item)
{
	name = "Zatykač";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexterWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Oznamení o stíhání bandity - Dextera";
	inv_animate = 1;
};

func void Use_ItWr_DexterWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterDexter == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Dexter. Odměna za živého či mrtvého - 2500 zlatých.");
			CheckWantedPosterDexter = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Dexter. Odměna za živého či mrtvého - 2500 zlatých.");
			CheckWantedPosterDexter = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Zatykač");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Úřady Khorinisu hledají banditu jménem Dexter. Odměna za živého či mrtvého - 2500 zlatých.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Andre");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_NestorWantedPoster(C_Item)
{
	name = "Zatykač";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_NestorWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Oznámení o stíhání bandity - 'Kanibal' Nestor";
	inv_animate = 1;
};

func void Use_ItWr_NestorWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterNestor == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Nestor, přezdívaný 'Kanibal'. Odměna za živého či mrtvého - 2000 zlatých.");
			CheckWantedPosterNestor = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Nestor, přezdívaný 'Kanibal'. Odměna za živého či mrtvého - 2000 zlatých.");
			CheckWantedPosterNestor = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Zatykač");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Úřady Khorinisu hledají banditu jménem Nestor, přezdívaný 'Kanibal'. Odměna za živého či mrtvého - 2000 zlatých.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Andre");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_KriksWantedPoster(C_Item)
{
	name = "Zatykač";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_KriksWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Oznámení o stíhání bandity - 'Břitva' Kriks";
	inv_animate = 1;
};

func void Use_ItWr_KriksWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterKriks == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Kriks, přezdívaný 'Břitva'. Odměna za živého či mrtvého - 1500 zlatých.");
			CheckWantedPosterKriks = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Kriks, přezdívaný 'Břitva'. Odměna za živého či mrtvého - 1500 zlatých.");
			CheckWantedPosterKriks = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Zatykač");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Úřady Khorinisu hledají banditu jménem Kriks, přezdívaný 'Břitva'. Odměna za živého či mrtvého - 1500 zlatých.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Andre");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_BartWantedPoster(C_Item)
{
	name = "Zatykač";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_BartWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Oznámení o stíhání bandity - 'Skrček' Bart";
	inv_animate = 1;
};

func void Use_ItWr_BartWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterBart == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Bart, přezdívaný 'Skrček'. Odměna za živého či mrtvého - 1250 zlatých.");
			CheckWantedPosterBart = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Bart, přezdívaný 'Skrček'. Odměna za živého či mrtvého - 1250 zlatých.");
			CheckWantedPosterBart = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Zatykač");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Úřady Khorinisu hledají banditu jménem Bart, přezdívaný 'Skrček'. Odměna za živého či mrtvého - 1250 zlatých.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Andre");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_SkironWantedPoster(C_Item)
{
	name = "Zatykač";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_SkironWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Oznámení o stíhání bandity - Skiron 'Řezník'";
	inv_animate = 1;
};

func void Use_ItWr_SkironWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterSkiron == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Skiron, přezdívaný 'Řezník'. Odměna za živého či mrtvého - 1000 zlatých.");
			CheckWantedPosterSkiron = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Skiron, přezdívaný 'Řezník'. Odměna za živého či mrtvého - 1000 zlatých.");
			CheckWantedPosterSkiron = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Zatykač");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Úřady Khorinisu hledají banditu jménem Skiron, přezdívaný 'Řezník'. Odměna za živého či mrtvého - 1000 zlatých.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Andre");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_RocksWantedPoster(C_Item)
{
	name = "Zatykač";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_RocksWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Oznámení o stíhání bandity - Roks 'Čipera'";
	inv_animate = 1;
};

func void Use_ItWr_RocksWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterRocks == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Roks, přezdívaný 'Čipera'. Odměna za živého či mrtvého - 750 zlatých.");
			CheckWantedPosterRocks = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Úřady Khorinisu hledají banditu jménem Roks, přezdívaný 'Čipera'. Odměna za živého či mrtvého - 750 zlatých.");
			CheckWantedPosterRocks = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Zatykač");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Úřady Khorinisu hledají banditu jménem Roks, přezdívaný 'Čipera'. Odměna za živého či mrtvého - 750 zlatých.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Lord Andre");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_StonePower(C_Item)
{
	name = "Bílá skála";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bílá skála";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_StonePower;
	inv_animate = 1;
};

func void Use_ItWr_StonePower()
{
	var int nDocID;
	var int rnd;

	if((MIS_SwampSecret == LOG_Running) && (StonePower == FALSE))
	{
		B_LogEntry(TOPIC_SwampSecret,"Zdá se, že magická podstata trávy z bažin je skutečně tvořena kouzlem země a skal. Myslím, že Saturas bude mít zájem podívat se na tuhle starou tabulku.");
		StonePower = TRUE;
	};
	if(StonePowerRead == FALSE)
	{
		B_Say(self,self,"$HOWINTEREST");
		StonePowerRead = TRUE;

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
	if((BookBonus_158 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_158 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
	Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"A bílá skála porodila semeno života i pohltilo toto semeno sílu skály. Toto semeno dalo klíček, ale tento klíček byl měkký, a proto síla skály mu dala kouzlo.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Klíček, obdařený kouzlem skály, byl rovnoměrně rozdělen mezi semena a ty vítr přivedl do vzdálených koutů světa.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ti, na oplátku, rozdávají své kouzlo svým semenům a tak na světě vyrostlo nesčetné množství výhonků.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"V každém z nich bylo síly bílé skály nesčetně krát méně.");
	Doc_Show(nDocID);
};

instance ItWr_HighRunes(C_Item)
{
	name = "Vyšší runy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Vyšší runy";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_HighRunes;
	inv_animate = 1;
};

func void Use_ItWr_HighRunes()
{
	var int nDocID;
	var int rnd;

	if(HighRunes == FALSE)
	{
		HighRunes = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_159 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_159 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Vyšší runy");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pro vytvoření magických run se někdy používají různé typy runových kámenů. Vše závisí na tom, jak mocnou runu je potřeba vytvořit.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pro kouzla prvního a druhého kruhu magie jsou používány běžné runové kámeny, pro třetí a čtvrtý kruh jsou starší runy a pro nejtěžší runy pátého a šestého kruhu, ty nejvyšší!");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Xardas");
	Doc_Show(nDocID);
};

instance ItWr_DragonHigh(C_Item)
{
	name = "Síla rudy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DragonHigh;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

func void Use_ItWr_DragonHigh()
{
	var int nDocID;

	if((DragonHigh == FALSE) && (hero.guild == GIL_DJG))
	{
		DragonHigh = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"... věřím, že magická ruda je klíčem k vítězství! Možná, pokud by se touto rudou podařilo pokrýt zbroj, stane se tak mnohem silnější. Nicméně, není mnoho těch co to dokáže...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Grach, drakobijec");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};