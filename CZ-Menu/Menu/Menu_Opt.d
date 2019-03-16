
instance MENU_OPTIONS(C_MENU_DEF)
{
	items[0] = "MENUITEM_OPT_HEADING";
	items[1] = "MENUITEM_SYSTEMPACK";
	items[2] = "MENUITEM_ASTCONSOLE";
	items[3] = "MENUITEM_OPT_GAME";
	items[4] = "MENUITEM_OPT_VIDEO";
	items[5] = "MENUITEM_OPT_AUDIO";
	items[6] = "MENUITEM_OPT_EXT";
	items[7] = "MENUITEM_OPT_CONTROLS";
	items[8] = "MENUITEM_PERF";
	items[9] = "MENUITEM_PERF_CHOICE";
	items[10] = "MENUITEM_OPT_BACK";
	defaultOutGame = 0;
	defaultInGame = 0;
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};


const int MENU_OPT_DY = 600;
const int MENU_OPT_START_Y = 2000;

instance MENUITEM_OPT_HEADING(C_MENU_ITEM_DEF)
{
	text[0] = "";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y - (MENU_OPT_DY * 1);
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_SYSTEMPACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastavení SP";
	text[1] = "Nastavení balíčku SystemPack";
	posx = 0;
	posy = MENU_OPT_START_Y - (MENU_OPT_DY * 2);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_SYSTEMPACK";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_ASTCONSOLE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastavení AST";
	text[1] = "Nastavení balíčku Agama Script Tools";
	posx = 0;
	posy = MENU_OPT_START_Y - (MENU_OPT_DY * 1);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_AST_CONSOLE";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_GAME(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastavení hry";
	text[1] = "Nastavení stylu hraní";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 0);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_VIDEO(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastavení grafiky";
	text[1] = "Nastavení grafické karty, rozlišení, jasu a kontrastu";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 1);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_VIDEO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_AUDIO(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastavení zvuku";
	text[1] = "Nastavení hudby a zvuků ve hře";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 2);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_AUDIO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_EXT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Optimalizace";
	text[1] = "Nastavení výkonu a kvality";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 3);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_EXT";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_CONTROLS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ovládání";
	text[1] = "Nastavení klávesnice a myši";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 4);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_CONTROLS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Styl ovládání";
	text[1] = "Styl ovládání boje ve hře";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 6);
	dimx = 8192;
	dimy = 800;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	text[0] = "Gothic 2|Gothic 1";
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 4100 - 2000;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 6) + 650;
	dimx = 4000;
	dimy = 350;
	onchgsetoption = "useGothic1Controls";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_BACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	text[1] = "";
	posx = 1000;
	posy = MENU_BACK_Y + 300;
	dimx = 6192;
	dimy = MENU_OPT_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};


func int update_perfoptions()
{
	Apply_Options_Performance();
	return 0;
};

