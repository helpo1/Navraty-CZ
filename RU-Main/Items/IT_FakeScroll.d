
instance Fakescroll(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ITWR_MAGICPAPER(C_Item)
{
	name = "Рунная бумага";
	mainflag = ITEM_KAT_DOCS | ITEM_MULTI;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Рунная бумага";
	text[4] = "Используется для создания магических свитков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_OLDBOOK1(C_Item)
{
	name = "Повести древних - Том 1";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Повести древних";
	text[0] = "Том 1";
	text[4] = "Страницы фолианта окутаны ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_OLDBOOK2(C_Item)
{
	name = "Повести древних - Том 2";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Повести древних";
	text[0] = "Том 2";
	text[4] = "Страницы фолианта окутаны ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_OLDBOOK3(C_Item)
{
	name = "Повести древних - Том 3";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Повести древних";
	text[0] = "Том 3";
	text[4] = "Страницы фолианта окутаны ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_OLDBOOK4(C_Item)
{
	name = "Повести древних - Том 4";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Повести древних";
	text[0] = "Том 4";
	text[4] = "Страницы фолианта окутаны ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_OLDBOOK5(C_Item)
{
	name = "Повести древних - Том 5";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Повести древних";
	text[0] = "Том 5";
	text[4] = "Страницы фолианта окутаны ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_OLDBOOK6(C_Item)
{
	name = "Древний свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Scroll_Double.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[4] = "Этот свиток - ключ к фолиантам Древних...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};