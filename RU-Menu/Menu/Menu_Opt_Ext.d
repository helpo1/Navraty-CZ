
instance MENU_OPT_EXT(C_MENU_DEF)
{
	items[0] = "MENUITEM_EXT_HEADLINE";
	items[1] = "MENUITEM_GRA_TEXQUAL";
	items[2] = "MENUITEM_GRA_TEXQUAL_SLIDER";
	items[3] = "MENUITEM_GRA_MODEL_DETAIL";
	items[4] = "MENUITEM_GRA_MODEL_DETAIL_SLIDER";
	items[5] = "MENUITEM_GRA_SIGHT";
	items[6] = "MENUITEM_GRA_SIGHT_CHOICE";
	items[7] = "MENUITEM_EXT_FFT";
	items[8] = "MENUITEM_EXT_FFT_CHOICE";
	items[9] = "MENUITEM_EXT_OBJWIND";
	items[10] = "MENUITEM_EXT_OBJWIND_CHOICE";
	items[11] = "MENUITEM_EXT_CLOUDSHADOW";
	items[12] = "MENUITEM_EXT_CLOUDSHADOW_CHOICE";
	items[13] = "MENUITEM_EXT_RADIALFOG";
	items[14] = "MENUITEM_EXT_RADIALFOG_CHOICE";
	items[15] = "MENUITEM_GRA_SKY_EFFECTS";
	items[16] = "MENUITEM_GRA_SKY_EFFECTS_CHOICE";
	items[17] = "MENUITEM_EXT_INDOORLIGHT";
	items[18] = "MENUITEM_EXT_INDOORLIGHT_CHOICE";
	items[19] = "MENUITEM_EXT_SEEOBJECT";
	items[20] = "MENUITEM_EXT_SEEOBJECT_CHOICE";
	items[21] = "MENUITEM_EXT_BACK_EXIT";
	items[22] = "MENUITEM_GRA_BACK";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENUITEM_EXT_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_TEXQUAL(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Качество текстур";
	text[1] = "Определяет детализацию используемых текстур";
	posx = 0;
	posy = MENU_START_Y - (MENU_DY * 6);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_TEXQUAL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 5000;
	posy = (MENU_START_Y - (MENU_DY * 6)) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "texDetailIndex";
	onchgsetoptionsection = "INTERNAL";
	userfloat[0] = 5;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_GRA_MODEL_DETAIL(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Качество моделей";
	text[1] = "Определяет детализацию моделей в игре";
	posx = 0;
	posy = MENU_START_Y - (MENU_DY * 5);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_MODEL_DETAIL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 5000;
	posy = (MENU_START_Y - (MENU_DY * 5)) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "modelDetail";
	onchgsetoptionsection = "PERFORMANCE";
	userfloat[0] = 10;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION;
};

instance MENUITEM_GRA_SIGHT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Расстояние обзора";
	text[1] = "Определяет расстояние игрового обзора";
	posx = 0;
	posy = MENU_START_Y - (MENU_DY * 4);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = (MENU_START_Y - (MENU_DY * 4)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "sightValue";
	onchgsetoptionsection = "PERFORMANCE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION | IT_TXT_CENTER;
};

instance MENUITEM_EXT_FFT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Эффект волн";
	text[1] = "Создает эффект волн на воде";
	posx = 0;
	posy = MENU_START_Y - (MENU_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_FFT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = (MENU_START_Y - (MENU_DY * 3)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zWaterAniEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_OBJWIND(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Эффект ветра";
	text[1] = "Создает эффект ветра";
	posx = 0;
	posy = MENU_START_Y - (MENU_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_OBJWIND_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = (MENU_START_Y - (MENU_DY * 2)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zWindEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_CLOUDSHADOW(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Тени от облаков";
	text[1] = "Создает эффект теней от облаков";
	posx = 0;
	posy = MENU_START_Y - (MENU_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_CLOUDSHADOW_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = (MENU_START_Y - (MENU_DY * 1)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zCloudShadowScale";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_RADIALFOG(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Эффект тумана";
	text[1] = "Создает эффект тумана";
	posx = 0;
	posy = MENU_START_Y + (MENU_DY * 0);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_RADIALFOG_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 0) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zFogRadial";
	onchgsetoptionsection = "RENDERER_D3D";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_SKY_EFFECTS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Эффекты погоды";
	text[1] = "Эффекты дождя и снега";
	posx = 0;
	posy = MENU_START_Y + (MENU_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_SKY_EFFECTS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 1) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "skyEffects";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_INDOORLIGHT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Динамический свет";
	text[1] = "Подсветка предметов (возможно снижение FPS)";
	posx = 0;
	posy = MENU_START_Y + (MENU_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_INDOORLIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zVobPointLight";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_GAMECACHE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Системный кэш";
	text[1] = "Позволяет использовать кэширование памяти";
	posx = 0;
	posy = MENU_START_Y + (MENU_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_GAMECACHE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bSysCache";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_RAM(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Мониторинг памяти";
	text[1] = "Отображение статуса используемой игрой памяти";
	posx = 0;
	posy = MENU_START_Y + (MENU_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_RAM_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|да";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bToggleRam";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_SEEOBJECT(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Детализация мира";
	text[1] = "Дальность прорисовки объектов (возможно снижение FPS)";
	posx = 0;
	posy = MENU_START_Y + (MENU_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_SEEOBJECT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "нет|низкая|среднея|высокая";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zVobFarClipZScale";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_BACK_EXIT(C_MENU_ITEM_DEF)
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

instance MENUITEM_EXT_BACK(C_MENU_ITEM_DEF)
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

