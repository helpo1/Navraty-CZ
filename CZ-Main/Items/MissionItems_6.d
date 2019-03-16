/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void Use_XardasNotfallBeutel - upraveny výpisy
func void Use_RezeptFuerMegaTrank - opraven bonus po přečtení
func void Use_Diary_BlackNovice - opraven bonus po přečtení

*/




instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[4] = "Tenhle měšec obsahuje nějaký tvrdý předmět a jakýsi dokument...";
	inv_animate = 1;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	// concatText = ConcatStrings(PRINT__ERHALTEN,"dva");
	// concatText = ConcatStrings(concatText,PRINT__ITEMS);
	// concatText = ConcatStrings(concatText,"a");
	concatText = ConcatStrings("Získány ","2");
	concatText = ConcatStrings(concatText," předměty");
	AI_Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = "Varovný dopis od Xardase";
	inv_animate = 1;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Můj mladý chráněnče, hluboce jsi mě zklamal. Jak to, že jsi odplul a přitom sis nevzal Innosovo oko? Mohu jen doufat, že tvoje nedbalost má své hranice. Jinak svět nikdy nezbavíš zla a já tě budu muset za tvou hloupost náležitě potrestat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Xardas");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = "Starý dopis";
	text[4] = "Starý dopis, psaný roztřesenou rukou...";
	inv_animate = 1;
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Selhal jsem! Nadarmo jsem se snažil přivést Inubise zpět na cestu dobra. Inubis opět vstal z mrtvých! Nyní se chce pomstít za své prokletí prastarému řádu paladinů, kteří ho vyhnali.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nechť Innos spasí naše duše!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ivan");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

var int LastDoorToUndeadFT;

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = "Poznámky temného mága";
	inv_animate = 1;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"KHADOSH");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"EMEM KADAR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Oko moci nechť osvítí tvou cestu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);

	if(LastDoorToUndeadFT == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath,"V poznámkách temného mága jsou uvedena slova KHADOSH EMEM KADAR. Zní to jako nějaké zaklínadlo, ale já nemám ani ponětí, k čemu by mohlo sloužit. A co je vůbec to Oko moci?");
		LastDoorToUndeadFT = TRUE;
	};
};

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = "Prastarý recept";
	inv_animate = 1;
};


func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;
	nDocID = Doc_Create();

	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
			PLAYER_TALENT_ALCHEMY_11 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Embarla Firgasto'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro EMBARLA FIRGASTO: čistý alkohol, 9x dračí vejce, černá perla a síra.");
		};
		if((BookBonus_162 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_162 = TRUE;
		};
	};

	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Embarla Firgasto");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"devět dračích vajec, černá perla a špetka síry. Tekutinu přivést do varu a za stálého míchání prohnat destilačním aparátem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Elixír užívat opatrně, neb má silné vedlejší účinky a může narušit vnitřní strukturu many uživatele.");
	Doc_Show(nDocID);
};

var int Diary_BlackNovice;

instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Deník";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Deník temného novice";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
	inv_animate = 1;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Už tu čekám na předvolání víc jak měsíc. Začínám pochybovat, že mě vůbec kdy vezmou. Přesto jsem vždycky udělal všechno, co po mě chtěli, i když jim většinou akorát dělám poslíčka jako nějaká stará služka.");
	Doc_PrintLines(nDocID,0,"Klíčník mi nařídil, abych zavřel všechny závory, ale ještě jsem se k tomu vůbec nedostal. Když to takhle půjde dál, bude moci branou procházet každý otrapa.");
	Doc_PrintLines(nDocID,0,"Je to ostuda, že si nemohu zapamatovat správné kombinace.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Už dávno bych se vplížil do velké síně. Nemohu se dočkat, až uvidím Pána. Zajímalo by mě, jestli mě k němu pustí, až se stanu jedním z nich.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Včera jsem zkusil štěstí, ale opustilo mě v komnatách se dvěma pákami, ještě než jsem mohl ve správném pořadí stisknout tři spínače v západním křídle. Ten pes ty komnaty zamkl! Zítra se pokusím nějak zmocnit jeho klíče...");
	Doc_Show(nDocID);

	if(Diary_BlackNovice == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath,"Deník temného novice se zmiňuje o komnatách s pákami, klíčníkovi, kombinacích spínačů a dalších věcech. Měl bych si to zapamatovat - mohlo by se mi to později hodit.");
		Diary_BlackNovice = TRUE;

		if((BookBonus_163 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_163 = TRUE;
		};
	};
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = "Starý dopis";
	inv_animate = 1;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je mi fuk, jestli ten most dokážete přejít z druhé strany, nebo ne. Pro mne za mne si všichni klidně shnijte v pekle! Dokud jsem na svém panství, ten most zůstane zatažen. A jestli ještě někoho přistihnu, jak se snaží lukem strefit do těch spínačů, vlastnoručně ho pověsím na nejbližším sloupu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Archol");
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "Oko moci";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[4] = "Kus nefritu neobyčejného tvaru připomínající dračí oko...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_PRISONSOUL(C_Item)
{
	name = "Kus kamene";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[3] = "Matný kámen neznámé odrody...";
	text[4] = "Tvarem připomíná zavřené oko...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_PRISONSOUL_AWAKE(C_Item)
{
	name = "Oko hněvu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[3] = "Kámen vyzařuje energii neznámého původu...";
	text[4] = "Tvarem připomíná zavřené oko...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCBLOOD(C_Item)
{
	name = "Skřetí krev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Hustá kapalina černého zabarvení...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_BARLOKHEART(C_Item)
{
	name = "Krev démona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Krev démona ohně karmínového zabarvení a ostrého sírového zápachu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};