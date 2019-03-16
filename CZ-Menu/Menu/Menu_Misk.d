
instance MENU_LEAVE_GAME(C_MENU_DEF)
{
	backPic = MENU_BACK_PIC;
	items[0] = "MENUITEM_LEAVE_GAME_HEADLINE";
	items[1] = "MENUITEM_LEAVE_GAME_YES";
	items[2] = "MENUITEM_LEAVE_GAME_NO";
	defaultOutGame = 2;
	defaultInGame = 2;
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM | MENU_OVERTOP | MENU_NOANI;
};

instance MENUITEM_LEAVE_GAME_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Opravdu chceš skončit?";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 3400;
	dimx = 8100;
	dimy = 750;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_TXT_CENTER;
};

instance MENUITEM_LEAVE_GAME_YES(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ano";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = 4400;
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "LEAVE_GAME";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};

instance MENUITEM_LEAVE_GAME_NO(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Ne";
	text[1] = "Returning ModTeam, 2017";
	posx = 0;
	posy = 5000;
	dimx = 8100;
	dimy = 750;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};

