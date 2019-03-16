const int Value_Fackel = 1;

instance ItLsTorch(C_Item)
{
	name = "Факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "Вероятность поджечь врага (режим боя):";
	count[2] = 15;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItLsFireTorch(C_Item)
{
	name = "Горящий факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Fackel;
	visual = "ITMI_FIRETORCH_01.3DS";
	effect = "SPELLFX_FIRE_TORCH";
	material = MAT_LEATHER;
	description = "Горящий факел";
	inv_animate = 1;
};

instance ItLsTorchburning(C_Item)
{
	name = "Горящий факел";
	mainflag = ITEM_KAT_LIGHT;
	flags = ITEM_TORCH;
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
	text[4] = "Горящий факел";
};

instance ItLsTorchburned(C_Item)
{
	name = "Факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH | ITEM_MULTI;
	value = 1;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	text[4] = "Сгоревший факел";
	description = name;
	inv_animate = 1;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "Цирковой факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH;
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};