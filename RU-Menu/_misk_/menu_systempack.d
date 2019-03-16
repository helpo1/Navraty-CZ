
instance MENU_SYSTEMPACK(C_MENU_DEF)
{
	items[0] = "MENUITEM_SYSTEMPACK_CELLS";
	items[1] = "MENUITEM_SYSTEMPACK_CELLS_CHOICE";
	items[2] = "MENUITEM_SYSTEMPACK_NOTAKEANI";
	items[3] = "MENUITEM_SYSTEMPACK_NOTAKEANI_CHOICE";
	items[4] = "MENUITEM_SYSTEMPACK_SCALEINTF";
	items[5] = "MENUITEM_SYSTEMPACK_SCALEINTF_CHOICE";
	items[6] = "MENUITEM_SUB_SPBACK_EXIT";
	items[7] = "MENUITEM_SUB_SPBACK";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENUITEM_SYSTEMPACK_CELLS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Размер ячеек инвентаря";
	text[1] = "Задает размер ячеек инвентаря в игре";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_SYSTEMPACK_CELLS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|92|93|94|95|96|97|98|99|100";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "InventoryCellSize";
	onchgsetoptionsection = "INTERFACE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

instance MENUITEM_SYSTEMPACK_NOTAKEANI(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Отключить анимацию сбора";
	text[1] = "Отключить анимацию сбора предметов";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_SYSTEMPACK_NOTAKEANI_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "No_Take_Anim";
	onchgsetoptionsection = "PARAMETERS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

instance MENUITEM_SYSTEMPACK_RMBNOTAKEANI(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Кнопка действия";
	text[1] = "Меняет основную кнопку действия в игре";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_DISABLED;
};

instance MENUITEM_SYSTEMPACK_RMBNOTAKEANI_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "по умолчанию|ПКМ";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "RMB_No_Take_Anim";
	onchgsetoptionsection = "PARAMETERS";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

instance MENUITEM_SYSTEMPACK_SCALEINTF(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Размер интерфейса";
	text[1] = "Изменение размера интерфейса в игре";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_SYSTEMPACK_SCALEINTF_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "по умолчанию|большой|огромный";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "Scale";
	onchgsetoptionsection = "INTERFACE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

instance MENUITEM_SYSTEMPACK_CONSOLEFPS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Показывать FPS";
	text[1] = "Отображает текущий FPS на экране";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_SYSTEMPACK_CONSOLEFPS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "Show_FPS_Counter";
	onchgsetoptionsection = "DEBUG";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_SUB_SPBACK_EXIT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Применить изменения";
	text[1] = "При изменении параметров необходим перезапуск игры";
	posx = 1000;
	posy = 6500;
	dimx = 6192;
	dimy = MENU_SOUND_DY;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_LEAVE_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_SUB_SPBACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Назад";
	text[1] = "";
	posx = 1000;
	posy = 7000;
	dimx = 6192;
	dimy = MENU_SOUND_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

