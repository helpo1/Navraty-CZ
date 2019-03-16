
instance MENU_STATUS(C_MENU_DEF)
{
	items[0] = "MENU_ITEM_STATUS_HEADING";
	dimx = 3072;
	dimy = 4096;
	flags = flags | MENU_SHOW_INFO | MENU_OVERTOP | MENU_NOANI;
	backPic = "";
};


const int STAT_A_X1 = 500;
const int STAT_A_X2 = 2300;
const int STAT_A_X3 = 3000;
const int STAT_A_X4 = 3400;
const int STAT_B_X1 = 3800;
const int STAT_B_X2 = 6000;
const int STAT_B_X3 = 7200;
const int STAT_B_X4 = 7700;
const int STAT_PLYHEAD_Y = 1000;
const int STAT_PLY_Y = 1450;
const int STAT_ATRHEAD_Y = 3250;
const int STAT_ATR_Y = 3700;
const int STAT_ARMHEAD_Y = 5650;
const int STAT_ARM_Y = 6100;
const int STAT_TALHEAD_Y = 1000;
const int STAT_TAL_Y = 1450;
const int STAT_DY = 300;

instance MENU_ITEM_STATUS_HEADING(C_MENU_ITEM_DEF)
{
	text[0] = "";
	text[1] = "";
	posx = STAT_A_X1;
	posy = STAT_PLYHEAD_Y;
	dimx = STAT_A_X4 - STAT_A_X1;
	dimy = STAT_DY;
	fontname = STAT_FONT_NEW;
	flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;
};

