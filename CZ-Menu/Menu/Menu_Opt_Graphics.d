
instance MENU_OPT_GRAPHICS(C_MENU_DEF)
{
	items[0] = "MENUITEM_GRA_HEADLINE";
	items[1] = "MENUITEM_GRA_BACK";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENUITEM_GRA_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_BACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	text[1] = "";
	posx = 1000;
	posy = MENU_BACK_Y + 300;
	dimx = 6192;
	dimy = MENU_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

