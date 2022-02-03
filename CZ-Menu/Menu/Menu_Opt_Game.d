/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

instance MENUITEM_GAME_AUTOAIM, instance MENUITEM_GAME_AUTOAIM_CHOICE - nastavení automatického míření nahrazeno nastavením GFA

*/



instance MENU_OPT_GAME(C_MENU_DEF)
{
	items[0] = "MENUITEM_GAME_LEGENDSAVE";
	items[1] = "MENUITEM_GAME_LEGENDSAVE_CHOICE";
	items[2] = "MENUITEM_GAME_KARMASTATUS";
	items[3] = "MENUITEM_GAME_KARMASTATUS_CHOICE";
	items[4] = "MENUITEM_GAME_HTFSTATUS";
	items[5] = "MENUITEM_GAME_HTFSTATUS_CHOICE";
	items[6] = "MENUITEM_GAME_WATCHTIME";
	items[7] = "MENUITEM_GAME_WATCHTIME_CHOICE";
	items[8] = "MENUITEM_GAME_ALTHAIR";
	items[9] = "MENUITEM_GAME_ALTHAIR_CHOICE";
	items[10] = "MENUITEM_GAME_STEAL";
	items[11] = "MENUITEM_GAME_STEAL_CHOICE";
	items[12] = "MENUITEM_GAME_INVERSE";
	items[13] = "MENUITEM_GAME_INVERSE_CHOICE";
	items[14] = "MENUITEM_GAME_SUB_TITLES";
	items[15] = "MENUITEM_GAME_SUB_TITLES_CHOICE";
	items[16] = "MENUITEM_GAME_FIGHTFOCUS";
	items[17] = "MENUITEM_GAME_FIGHTFOCUS_CHOICE";
	items[18] = "MENUITEM_GAME_INTERACTFOCUS";
	items[19] = "MENUITEM_GAME_INTERACTFOCUS_CHOICE";
	items[20] = "MENUITEM_GAME_MUSCLE";
	items[21] = "MENUITEM_GAME_MUSCLE_CHOICE";
	items[22] = "MENUITEM_M";
	items[23] = "MENUITEM_M_CHOICE";
	items[24] = "MENUITEM_MSENSITIVITY";
	items[25] = "MENUITEM_MSENSITIVITY_SLIDER";
	items[26] = "MENUITEM_GAME_OLDCONTROLS";
	items[27] = "MENUITEM_GAME_OLDCONTROLS_CHOICE";
	items[28] = "MENUITEM_GAME_AUTOAIM";
	items[29] = "MENUITEM_GAME_AUTOAIM_CHOICE";
	items[30] = "MENUITEM_GAME_BACK";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENUITEM_GAME_LEGENDSAVE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ukládání hry";
	text[1] = "Zapnout možnost ukládání hry na legendární obtížnosti";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 8);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LEGENDSAVE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 8)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bCanSaveLeg";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_KARMASTATUS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ukazatele karmy";
	text[1] = "Zapnout ukazatele stavu karmy na obrazovce";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 7);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_KARMASTATUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 7)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowKarma";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_HTFSTATUS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ukazatele hladu / žízně / únavy";
	text[1] = "Zapnout ukazatele hladu, žízně a únavy na obrazovce";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 6);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_HTFSTATUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 6)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bHFTStatus";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_WATCHTIME(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zobrazení dne a času";
	text[1] = "Zapnout zobrazení dne a času ve hře";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 5);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_WATCHTIME_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 5)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bWatchTime";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_ALTHAIR(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zobrazení atributů hrdiny";
	text[1] = "Zapnout zobrazení hlavních atributů na obrazovce";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 4);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_ALTHAIR_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 4)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowHMS";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_STEAL(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "AST kapsářství";
	text[1] = "Zapnout nový styl krádeží ve hře";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_STEAL_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 3)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bCanNewSteal";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_INVERSE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Převrátit ovládání";
	text[1] = "Zapnout inverzi ovládání ve hře";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INVERSE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 2)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "camLookaroundInverse";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SUB_TITLES(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Titulky";
	text[1] = "Zapnout zobrazování titulků ve hře";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SUB_TITLES_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 1)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "subTitles";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_FIGHTFOCUS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zaměření boje";
	text[1] = "Typ zvýraznění stávajícího cíle";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIGHTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Žádné|Okno|Zjasnění|Obojí";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "highlightMeleeFocus";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_INTERACTFOCUS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Počet sloupců inventáře";
	text[1] = "Počet sloupců zobrazených v herním inventáři";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INTERACTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "0|1|2|3|4|5|6";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "invMaxColumns";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_MUSCLE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zvětšení postav";
	text[1] = "Zvětšení modelů NPC na základě jejich síly";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_MUSCLE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bScaleStr";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_M(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zapnout myš";
	text[1] = "Zapnout ovládání myší ve hře";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_M_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "enableMouse";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MSENSITIVITY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Citlivost myši";
	text[1] = "Citlivost myši ve hře";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MSENSITIVITY_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	text[0] = "";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4) + MENU_SLIDER_YPLUS;
	dimx = 2000;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "mouseSensitivity";
	onchgsetoptionsection = "GAME";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_OLDCONTROLS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Množství krve";
	text[1] = "Množství doprovodných efektů krve ve hře";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_OLDCONTROLS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Žádná|Málo|Středně|Mnoho";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bloodDetail";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_AUTOAIM(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Volné míření";
	text[1] = "Zapnout systém volného míření pro luky a kuše";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_AUTOAIM_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "freeAimingEnabled";
	onchgsetoptionsection = "GFA";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_BACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	text[1] = "";
	posx = 1000;
	posy = 7000;
	dimx = 6192;
	dimy = MENU_SOUND_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

