const int Value_Fackel = 1;

instance ItLsTorch(C_Item)
{
	name = "Pochodeň";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "Šance na zapálení protivníka (v režimu boje):";
	count[2] = 15;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItLsFireTorch(C_Item)
{
	name = "Hořící pochodeň";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Fackel;
	visual = "ITMI_FIRETORCH_01.3DS";
	effect = "SPELLFX_FIRE_TORCH";
	material = MAT_LEATHER;
	description = "Hořící pochodeň";
	inv_animate = 1;
};

instance ItLsTorchburning(C_Item)
{
	name = "Hořící pochodeň";
	mainflag = ITEM_KAT_LIGHT;
	flags = ITEM_TORCH;
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
	text[4] = "Hořící pochodeň";
};

instance ItLsTorchburned(C_Item)
{
	name = "Pochodeň";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH | ITEM_MULTI;
	value = 1;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	text[4] = "Vyhořelá pochodeň...";
	description = name;
	inv_animate = 1;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "Cirkusová pochodeň";
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