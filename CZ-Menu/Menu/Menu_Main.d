
instance MENU_MAIN(C_MENU_DEF)
{
	backPic = MENU_BACK_PIC;
	musictheme = "SYS_Menu";
	items[0] = "MENUITEM_MAIN_HEADLINE";
	items[1] = "MENUITEM_MAIN_HEADLINE2";
	items[2] = "MENUITEM_MAIN_SAVEGAME_SAVE";
	items[3] = "MENUITEM_MAIN_SAVEGAME_LOAD";
	items[4] = "MENUITEM_MAIN_NEWGAME";
	items[5] = "MENUITEM_MAIN_OPTIONS";
	items[6] = "MENUITEM_MAIN_EXIT";
	defaultOutGame = 2;
	defaultInGame = 4;
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM | MENU_OVERTOP | MENU_NOANI;
};


const int MENU_MAIN_DY = 550;
const int MENU_MAIN_Y = 3600;

instance MENUITEM_MAIN_SAVEGAME_SAVE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Uložit hru";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 0);
	dimx = 8100;
	dimy = 750;
	onselaction_s[0] = "MENU_SAVEGAME_SAVE";
	onselaction[0] = SEL_ACTION_STARTMENU;
	flags = flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
	hideifoptionsectionset = "AST";
	hideifoptionset = "bCanSaveGame";
	hideonvalue = 0;
};

instance MENUITEM_MAIN_SAVEGAME_LOAD(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Načíst hru";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 1);
	dimx = 8100;
	dimy = 750;
	onselaction_s[0] = "MENU_SAVEGAME_LOAD";
	onselaction[0] = SEL_ACTION_STARTMENU;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nová hra";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 2);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME";
	flags = flags | IT_TXT_CENTER | IT_ONLY_OUT_GAME;
};

instance MENUITEM_MAIN_OPTIONS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Nastavení";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 3);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPTIONS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_EXIT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ukončit hru";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = MENU_MAIN_Y + (MENU_MAIN_DY * 4);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_LEAVE_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_HEADLINE2(C_MENU_ITEM_DEF)
{
	backPic = "menu_gothic.tga";
	posx = 250;
	posy = 1000;
	dimx = 7900;
	dimy = 2300;
	alphamode = "BLEND";
	alpha = 230;
	flags = flags | IT_TXT_CENTER;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_MAIN_HEADLINE(C_MENU_ITEM_DEF)
{
	backPic = "menu_gothicshadow.tga";
	posx = 0;
	posy = 0;
	dimx = 7900;
	dimy = 3300;
	alphamode = "BLEND";
	alpha = 50;
	flags = flags | IT_TXT_CENTER;
	flags = flags & ~IT_SELECTABLE;
};

