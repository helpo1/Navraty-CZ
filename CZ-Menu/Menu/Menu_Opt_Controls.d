/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(23x) - upraveno pořadí a zarovnání možností

*/




instance MENU_OPT_CONTROLS(C_MENU_DEF)
{
	backPic = MENU_INPUT_BACK_PIC;
	items[0] = "MENU_ITEM_CHG_KEYS_HEADLINE";
	items[1] = "MENU_ITEM_KEY_UP";
	items[2] = "MENU_ITEM_KEY_DOWN";
	items[3] = "MENU_ITEM_KEY_LEFT";
	items[4] = "MENU_ITEM_KEY_RIGHT";
	items[5] = "MENU_ITEM_KEY_STRAFE_LEFT";
	items[6] = "MENU_ITEM_KEY_STRAFE_RIGHT";
	items[7] = "MENU_ITEM_KEY_JUMPCLIMBSTRAFE";
	items[8] = "MENU_ITEM_KEY_RUNMODETOGGLE";
	items[9] = "MENU_ITEM_KEY_SNEAK";
	items[10] = "MENU_ITEM_KEY_MAP";
	items[11] = "MENU_ITEM_KEY_WEAPON";
	items[12] = "MENU_ITEM_KEY_ACTION";
	items[13] = "MENU_ITEM_KEY_LOOK";
	items[14] = "MENU_ITEM_KEY_LOOK_FP";
	items[15] = "MENU_ITEM_KEY_INVENTORY";
	items[16] = "MENU_ITEM_KEY_SCREEN_STATUS";
	items[17] = "MENU_ITEM_KEY_SCREEN_LOG";
	items[18] = "MENU_ITEM_INP_UP";
	items[19] = "MENU_ITEM_INP_DOWN";
	items[20] = "MENU_ITEM_INP_LEFT";
	items[21] = "MENU_ITEM_INP_RIGHT";
	items[22] = "MENU_ITEM_INP_STRAFE_LEFT";
	items[23] = "MENU_ITEM_INP_STRAFE_RIGHT";
	items[24] = "MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	items[25] = "MENU_ITEM_INP_RUNMODETOGGLE";
	items[26] = "MENU_ITEM_INP_SNEAK";
	items[27] = "MENU_ITEM_INP_ACTION";
	items[28] = "MENU_ITEM_INP_WEAPON";
	items[29] = "MENU_ITEM_INP_MAP";
	items[30] = "MENU_ITEM_INP_LOOK";
	items[31] = "MENU_ITEM_INP_LOOK_FP";
	items[32] = "MENU_ITEM_INP_INVENTORY";
	items[33] = "MENU_ITEM_INP_SCREEN_STATUS";
	items[34] = "MENU_ITEM_INP_SCREEN_LOG";
	items[35] = "MENU_ITEM_KEY_WEAPON_LEFT";
	items[36] = "MENU_ITEM_KEY_WEAPON_RIGHT";
	items[37] = "MENU_ITEM_KEY_WEAPON_PARADE";
	items[38] = "MENU_ITEM_INP_WEAPON_LEFT";
	items[39] = "MENU_ITEM_INP_WEAPON_RIGHT";
	items[40] = "MENU_ITEM_INP_WEAPON_PARADE";
	items[41] = "MENU_ITEM_CHG_KEYS_SET_DEFAULT";
	items[42] = "MENUITEM_CHG_KEYS_BACK";
	items[43] = "MENU_ITEM_NEXTMENU";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENU_ITEM_NEXTMENU(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "- Ovládání AST -";
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 20) + CTRL_GROUP6;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onselaction_s[0] = "MENU_OPT_CONTROLS_EXTKEYS";
	onselaction[0] = SEL_ACTION_STARTMENU;
	flags = flags | IT_TXT_CENTER;
	hideifoptionsectionset = "GAME";
};

instance MENU_OPT_CONTROLS_EXTKEYS(C_MENU_DEF)
{
	backPic = MENU_INPUT_BACK_PIC;
	items[0] = "MENU_ITEM_CHG_EXTKEYS_HEADLINE";
	items[1] = "MENU_ITEM_KEY_STAMINA";
	items[2] = "MENU_ITEM_KEY_QUICKHEALTH";
	items[3] = "MENU_ITEM_KEY_QUICKMANA";
	items[4] = "MENU_ITEM_KEY_QUICKSPEED";
	items[5] = "MENU_ITEM_KEY_UNPOISON";
	items[6] = "MENU_ITEM_KEY_SPRINT";
	items[7] = "MENU_ITEM_KEY_RESSURECT";
	items[8] = "MENU_ITEM_KEY_DIARY";
	items[9] = "MENU_ITEM_KEY_ARROWSBOLTS";
	items[10] = "MENU_ITEM_KEY_MAGICARROWSBOLTS";
	items[11] = "MENU_ITEM_KEY_HOLYARROWSBOLTS";
	items[12] = "MENU_ITEM_KEY_FIREARROWSBOLTS";
	items[13] = "MENU_ITEM_KEY_POISONARROWSBOLTS";
	items[14] = "MENU_ITEM_KEY_MOUNT";
	items[15] = "MENU_ITEM_INP_STAMINA";
	items[16] = "MENU_ITEM_INP_QUICKHEALTH";
	items[17] = "MENU_ITEM_INP_QUICKMANA";
	items[18] = "MENU_ITEM_INP_QUICKSPEED";
	items[19] = "MENU_ITEM_INP_UNPOISON";
	items[20] = "MENU_ITEM_INP_SPRINT";
	items[21] = "MENU_ITEM_INP_RESSURECT";
	items[22] = "MENU_ITEM_INP_DIARY";
	items[23] = "MENU_ITEM_INP_ARROWSBOLTS";
	items[24] = "MENU_ITEM_INP_MAGICARROWSBOLTS";
	items[25] = "MENU_ITEM_INP_HOLYARROWSBOLTS";
	items[26] = "MENU_ITEM_INP_FIREARROWSBOLTS";
	items[27] = "MENU_ITEM_INP_POISONARROWSBOLTS";
	items[28] = "MENU_ITEM_INP_MOUNT";
	items[29] = "MENU_ITEM_KEY_ELITE";
	items[30] = "MENU_ITEM_INP_ELITE";
	items[31] = "MENU_ITEM_KEY_QUICKINFO";
	items[32] = "MENU_ITEM_INP_QUICKINFO";
	items[33] = "MENU_ITEM_KEY_TURNACRO";
	items[34] = "MENU_ITEM_INP_TURNACRO";
	items[35] = "MENU_ITEM_KEY_USETORCH";
	items[36] = "MENU_ITEM_INP_USETORCH";
	items[37] = "MENU_ITEM_KEY_OGONEK";
	items[38] = "MENU_ITEM_INP_OGONEK";
	items[39] = "MENU_ITEM_KEY_ANGEL";
	items[40] = "MENU_ITEM_INP_ANGEL";
	items[41] = "MENU_ITEM_KEY_REGENMOBS";
	items[42] = "MENU_ITEM_INP_REGENMOBS";
	items[43] = "MENU_ITEM_KEY_RENDER";
	items[44] = "MENU_ITEM_INP_RENDER";
	items[45] = "MENU_ITEM_KEY_SCREENSHOT";
	items[46] = "MENU_ITEM_INP_SCREENSHOT";
	items[47] = "MENU_ITEM_KEY_MARVIN";
	items[48] = "MENU_ITEM_INP_MARVIN";
	items[49] = "MENU_ITEM_KEY_BRAKECHEST";
	items[50] = "MENU_ITEM_INP_BRAKECHEST";
	items[51] = "MENUITEM_CHG_KEYS_BACK_EXT";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};


const int CTRL_SP1_1 = 720;
const int CTRL_SP1_2 = 3100;
const int CTRL_SP1_3 = 6000;
const int CTRL_DIMX = 4600;
const int CTRL_Y_STEP = 260;
const int CTRL_Y_STEP2 = 180;
const int CTRL_Y_TITLE = 500;
const int CTRL_Y_START = 1000;
const int CTRL_GROUP1 = 0;
const int CTRL_GROUP2 = 180;
const int CTRL_GROUP3 = 360;
const int CTRL_GROUP4 = 540;
const int CTRL_GROUP5 = 720;
const int CTRL_GROUP6 = 900;

instance MENU_ITEM_KEY_QUICKHEALTH(C_MENU_ITEM_DEF)
{
	text[0] = "Lektvar hojivé síly";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP2;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_QUICKHEALTH(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD1";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_STAMINA(C_MENU_ITEM_DEF)
{
	text[0] = "Lektvar výdrže";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP2;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_STAMINA(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD3";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_QUICKMANA(C_MENU_ITEM_DEF)
{
	text[0] = "Lektvar many";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP2;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_QUICKMANA(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD2";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_QUICKSPEED(C_MENU_ITEM_DEF)
{
	text[0] = "Lektvar rychlosti";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP2;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_QUICKSPEED(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD4";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_UNPOISON(C_MENU_ITEM_DEF)
{
	text[0] = "Odstranit oslabující účinky";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP2;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_UNPOISON(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD5";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_USETORCH(C_MENU_ITEM_DEF)
{
	text[0] = "Pochodeň / lucerna";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_USETORCH(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD6 / NUMPAD8";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_OGONEK(C_MENU_ITEM_DEF)
{
	text[0] = "Přivolat bludičku";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_OGONEK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD7";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_ARROWSBOLTS(C_MENU_ITEM_DEF)
{
	text[0] = "Vybavit se obyčejnými šípy / šipkami";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_ARROWSBOLTS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD1";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_MAGICARROWSBOLTS(C_MENU_ITEM_DEF)
{
	text[0] = "Vybavit se magickými šípy / šipkami";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_MAGICARROWSBOLTS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD2";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_HOLYARROWSBOLTS(C_MENU_ITEM_DEF)
{
	text[0] = "Vybavit se posvěcenými šípy / šipkami";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_HOLYARROWSBOLTS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD3";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_FIREARROWSBOLTS(C_MENU_ITEM_DEF)
{
	text[0] = "Vybavit se ohnivými šípy";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_FIREARROWSBOLTS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD4";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_POISONARROWSBOLTS(C_MENU_ITEM_DEF)
{
	text[0] = "Vybavit se otrávenými šípy";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_POISONARROWSBOLTS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD5";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_MOUNT(C_MENU_ITEM_DEF)
{
	text[0] = "Přivolat létající koberec";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_MOUNT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD6";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_REGENMOBS(C_MENU_ITEM_DEF)
{
	text[0] = "Zapnout regeneraci vyvolaných monster";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_REGENMOBS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD7";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_ANGEL(C_MENU_ITEM_DEF)
{
	text[0] = "Rybařit";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_ANGEL(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD8";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_RESSURECT(C_MENU_ITEM_DEF)
{
	text[0] = "Použít svitek oživení";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_RESSURECT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+NUMPAD9";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_RENDER(C_MENU_ITEM_DEF)
{
	text[0] = "Naostřit zbraň";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_RENDER(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "NUMPAD9";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_SCREENSHOT(C_MENU_ITEM_DEF)
{
	text[0] = "Vypnout hudbu";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_SCREENSHOT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "U";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_SPRINT(C_MENU_ITEM_DEF)
{
	text[0] = "Zapnout sprint";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_SPRINT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "~";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_TURNACRO(C_MENU_ITEM_DEF)
{
	text[0] = "Zapnout režim úkroků";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 20) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_TURNACRO(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "T";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 20) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_ELITE(C_MENU_ITEM_DEF)
{
	text[0] = "Pořídit snímek obrazovky";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 21) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_ELITE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "F12";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 21) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_DIARY(C_MENU_ITEM_DEF)
{
	text[0] = "Otevřít knihu návodů a receptů";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 22) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_DIARY(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "C";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 22) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_QUICKINFO(C_MENU_ITEM_DEF)
{
	text[0] = "Zapnout informace na obrazovce";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 23) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_QUICKINFO(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "I";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 23) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_MARVIN(C_MENU_ITEM_DEF)
{
	text[0] = "Vylomit zámek truhly (obratnost)";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 24) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_MARVIN(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "LSHIFT+Y";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 24) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_KEY_BRAKECHEST(C_MENU_ITEM_DEF)
{
	text[0] = "Vylomit zámek truhly (síla)";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 25) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_SPRINT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
	hideifoptionsectionset = "GAME";
};

instance MENU_ITEM_INP_BRAKECHEST(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "Y";
	text[1] = "";
	posx = CTRL_SP1_3;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 25) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
};

instance MENUITEM_CHG_KEYS_BACK_EXT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	text[1] = "";
	posx = 4000;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP2;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_CHG_KEYS_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = CTRL_Y_TITLE;
	dimx = 8100;
	fontname = MENU_FONT_BRIGHT;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_CHG_EXTKEYS_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = CTRL_Y_TITLE;
	dimx = 8100;
	fontname = MENU_FONT_BRIGHT;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_KEY_UP(C_MENU_ITEM_DEF)
{
	text[0] = "Dopředu";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_UP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_DOWN(C_MENU_ITEM_DEF)
{
	text[0] = "Dozadu";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_DOWN";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Otočit vlevo";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Otočit vpravo";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Úkrok vlevo";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Úkrok vpravo";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	text[0] = "Skok";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	text[0] = "Pomalá chůze";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RUNMODETOGGLE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SNEAK(C_MENU_ITEM_DEF)
{
	text[0] = "Plížení";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SNEAK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_MAP(C_MENU_ITEM_DEF)
{
	text[0] = "Mapa";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_MAP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_WEAPON(C_MENU_ITEM_DEF)
{
	text[0] = "Vytasit zbraň";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_ACTION(C_MENU_ITEM_DEF)
{
	text[0] = "Akce";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_ACTION";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK(C_MENU_ITEM_DEF)
{
	text[0] = "Rozhlížení";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK_FP(C_MENU_ITEM_DEF)
{
	text[0] = "Pohled z první osoby";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK_FP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_INVENTORY(C_MENU_ITEM_DEF)
{
	text[0] = "Inventář";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_INVENTORY";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	text[0] = "Statistiky";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP1;
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_DISABLED;
};

instance MENU_ITEM_INP_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[0] = "B";
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_KEY_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	text[0] = "Deník";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_LOG";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_WEAPON_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Útok vlevo";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_WEAPON_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Útok vpravo";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_WEAPON_PARADE(C_MENU_ITEM_DEF)
{
	text[0] = "Krytí";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 20) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_PARADE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_UP(C_MENU_ITEM_DEF)
{
	backPic = MENU_KBDINPUT_BACK_PIC;
	text[1] = "";
	type = MENU_ITEM_INPUT;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onchgsetoption = "keyUp";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_DOWN(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyDown";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeLeft";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySMove";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySlow";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SNEAK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySneak";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_MAP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowMap";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_WEAPON(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyWeapon";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_ACTION(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyAction";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLook";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK_FP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLookFP";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_INVENTORY(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyInventory";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowLog";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_WEAPON_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyActionLeft";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_WEAPON_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyActionRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_WEAPON_PARADE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 20) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backPic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyParade";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_CHG_KEYS_SET_DEFAULT(C_MENU_ITEM_DEF)
{
	text[0] = "Původní nastavení";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP5;
	dimy = 300;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETDEFAULT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CHG_KEYS_BACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	text[1] = "";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 20) + CTRL_GROUP6;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

