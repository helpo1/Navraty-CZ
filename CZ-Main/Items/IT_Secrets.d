/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void Use_ItMi_VatrasPurse - zamezeno nesplnitelnosti úkolu
func void GoldPocket100 - upraven nalezený objem zlata (75 -> 100)

*/



const int Value_Shell_01 = 30;
const int Value_Shell_02 = 60;
var int Shell_Opener;

func void B_OpenShell()
{
	Shell_Opener = Hlp_Random(100);

	if(Shell_Opener <= 1)
	{
		B_PlayerFindItem(ItMi_Addon_WhitePearl,1);
	}
	else if(Shell_Opener <= 2)
	{
		B_PlayerFindItem(ItMi_DarkPearl,1);
	}
	else
	{
		B_PlayerFindItem(ItFo_Addon_Shellflesh,1);
	};
};

instance ItMi_Addon_Shell_01(C_Item)
{
	name = "Škeble";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shell_01;
	visual = "ItMi_Shell_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Shell_01;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

func void Use_Shell_01()
{
	B_OpenShell();
};

instance ItMi_Addon_Shell_02(C_Item)
{
	name = "Mušle ve tvaru rohu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shell_02;
	visual = "ItMi_Shell_02.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Shell_02;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

func void Use_Shell_02()
{
	B_OpenShell();
};

instance ItSe_ErzFisch(C_Item)
{
	name = "Kulatá ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ErzFisch;
	description = name;
	text[4] = "V této rybě je cosi ukryto...";
	inv_animate = 1;
};

func void Use_ErzFisch()
{
	if(BELIARCURSEYOU == FALSE)
	{
		B_PlayerFindItem(ItMi_Nugget,1);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};

instance ItSe_GoldFisch(C_Item)
{
	name = "Těžká ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_GoldFisch;
	description = name;
	text[4] = "V této rybě je cosi ukryto...";
	inv_animate = 1;
};


func void Use_GoldFisch()
{
	if(BELIARCURSEYOU == FALSE)
	{
		B_PlayerFindItem(ItMi_Gold,50);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};


instance ItSe_Ringfisch(C_Item)
{
	name = "Malá ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Ringfisch;
	description = name;
	text[4] = "V této rybě je cosi ukryto...";
	inv_animate = 1;
};


func void Use_Ringfisch()
{
	if(BELIARCURSEYOU == FALSE)
	{
		B_PlayerFindItem(ItRi_Prot_Fire_01,1);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};


instance ItSe_LockpickFisch(C_Item)
{
	name = "Lehká ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_LockpickFisch;
	description = name;
	text[4] = "V této rybě je cosi ukryto...";
	inv_animate = 1;
};


func void Use_LockpickFisch()
{
	if(BELIARCURSEYOU == FALSE)
	{
		B_PlayerFindItem(ItKE_lockpick,3);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};

instance ItMi_PocketFingers(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItMi_PocketFingers;
	description = "Fingersův měšec";
	text[4] = "Měšec přesmíru nacpaný zlatem...";
	inv_animate = 1;
};

func void Use_ItMi_PocketFingers()
{
	B_PlayerFindItem(ItMi_Gold,1000);
};

instance ItMi_VatrasPurse(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItMi_VatrasPurse;
	description = "Vatrasův měšec";
	text[4] = "Měšec přesmíru nacpaný zlatem...";
	inv_animate = 1;
};

func void Use_ItMi_VatrasPurse()
{
	B_PlayerFindItem(ItMi_Gold,300);

	/* if(MIS_LobartMeal == LOG_Running)
	{
		MIS_LobartMeal = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_LobartMeal);
	}; */
};

instance ItMi_HaniarPurse(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SPEC.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItMi_HaniarPurse;
	description = "Haniarův měšec";
	text[3] = "Měšec přesmíru nacpaný zlatem...";
	text[4] = "Na měšci je vyšitý symbol vidoucího oka...";
	inv_animate = 1;
};

func void Use_ItMi_HaniarPurse()
{
	B_PlayerFindItem(ItMi_Gold,1000);
};


instance ItMi_PurseOsair(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SPEC.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItMi_OsairPurse;
	description = "Osairův měšec";
	text[3] = "Měšec přesmíru nacpaný zlatem...";
	text[4] = "Na měšci je vyšitý symbol okovů pro otroky...";
	inv_animate = 1;
};

func void Use_ItMi_OsairPurse()
{
	B_PlayerFindItem(ItMi_Gold,500);
};


instance ItSe_GoldPocket25(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SMALL.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket25;
	description = "Měšec";
	text[4] = "V měšci cinká několik mincí...";
	inv_animate = 1;
};

func void GoldPocket25()
{
	var int pGold;

	if(BELIARCURSEYOU == FALSE)
	{
		pGold = 25;
		B_PlayerFindItem(ItMi_Gold,pGold);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};

instance ITSE_LANZPOCKET(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SMALL.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_itse_lanzpocket;
	description = "Glantzův měšec";
	text[4] = "";
	inv_animate = 1;
};

func void use_itse_lanzpocket()
{
	B_PlayerFindItem(ITRI_LANZRING,1);
	B_PlayerFindItem(ItMi_Gold,300);
};

instance ItSe_GoldPocket50(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_MEDIUM.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket50;
	description = "Měšec";
	text[4] = "Těžký měšec plný zlatých mincí...";
	inv_animate = 1;
};

func void GoldPocket50()
{
	var int pGold;

	if(BELIARCURSEYOU == FALSE)
	{
		pGold = 50;
		B_PlayerFindItem(ItMi_Gold,pGold);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};


instance ItSe_GoldPocket100(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100;
	description = "Měšec";
	text[4] = "Pořádně těžký měšec, naditý mincemi...";
	inv_animate = 1;
};


func void GoldPocket100()
{
	var int pGold;

	if(BELIARCURSEYOU == FALSE)
	{
		pGold = 100;
		B_PlayerFindItem(ItMi_Gold,pGold);
	}
	else
	{
		B_Say(self,self,"$NOTHINGTOGET02");
		AI_Print("Uvnitř nic není...");
	};
};

instance ItSe_GoldPocket100_Ignaz(C_Item)
{
	name = "Ignazův měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100_Ignaz;
	description = "Měšec";
	text[4] = "Pořádně těžký měšec, naditý mincemi...";
	inv_animate = 1;
};

func void GoldPocket100_Ignaz()
{
	B_PlayerFindItem(ItMi_Gold,100);
};

instance ITSE_GERBRANDPOCKET(C_Item)
{
	name = "Gerbrandtův měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_itse_gerbrandpocket;
	description = name;
	text[4] = "Pořádně těžký měšec, naditý mincemi...";
	inv_animate = 1;
};


func void use_itse_gerbrandpocket()
{
	B_PlayerFindItem(ItMi_Gold,250);
};


instance ITSE_NIGELPOCKET(C_Item)
{
	name = "Nigelův měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2000;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_itse_nigelpocket;
	description = name;
	text[4] = "Výjimečně těžký měšec, naditý mincemi...";
	inv_animate = 1;
};


func void use_itse_nigelpocket()
{
	B_PlayerFindItem(ItMi_Gold,2000);

	if(MIS_NIGELMATTER == LOG_Running)
	{
		MIS_NIGELMATTER = LOG_Failed;
		B_LogEntry_Failed(TOPIC_NIGELMATTER);
	};
};


instance ITSE_TALIASANPOCKET(C_Item)
{
	name = "Gallahadův měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_itse_taliasanpocket;
	description = name;
	text[4] = "Pořádně těžký měšec, naditý mincemi...";
	inv_animate = 1;
};


func void use_itse_taliasanpocket()
{
	B_PlayerFindItem(ItMi_Gold,1000);
};


instance ItSe_HannasBeutel(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SMALL.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = HannasBeutel;
	description = "Měšec";
	text[4] = "Tenhle měšec mi dala Hanna, majitelka hotelu...";
	inv_animate = 1;
};


func void HannasBeutel()
{
	CreateInvItems(hero,ItKE_lockpick,10);
	CreateInvItems(hero,ItKe_ThiefTreasure,1);
	AI_Print(PRINT_HannasBeutel);
};


instance ITSE_LUTTEROBIGPOCKET(C_Item)
{
	name = "Luterův měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket2500;
	description = "Luterův měšec";
	text[3] = "Měšec vrchovatě naplněný zlatými mincemi...";
	text[4] = "Lutero mi ho dal jako příspěvek cechu na obchod se Zurisem...";
	inv_animate = 1;
};


func void goldpocket2500()
{
	B_PlayerFindItem(ItMi_Gold,2500);
};

instance ItSe_Weapon_Sack(C_Item)
{	
	name	= "Balík zbraní";
	mainflag =	ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "NW_City_Weapon_Bag_01.3ds";
	material = MAT_LEATHER;
	scemeName	= "MAPSEALED";
	on_state[0] = Use_Weapon_Sack;
	description = name;
	text[4] = "Velký kožený pytel plný zbraní...";	
	inv_animate = 1;	
};

func void Use_Weapon_Sack()
{
	AI_Print("Našel jsi mnoho různých zbraní..."); 
	CreateInvItems (self,ItMw_1H_Mace_L_03,1);
	CreateInvItems (self,ItMw_1H_Vlk_Sword,2);
	CreateInvItems (self,ItMw_1H_Vlk_Dagger,3);
	CreateInvItems (self,ItMw_Schwert4,1);
	CreateInvItems (self,ItMw_2H_Sld_Sword,1);
	CreateInvItems (self,ItMw_Shortsword3,2);
};

instance ItSe_Arrow_Sack(C_Item)
{	
	name	= "Toulec se šípy";
	mainflag =	ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Quiver_Sky.3ds";
	material = MAT_LEATHER;
	scemeName	= "MAPSEALED";
	on_state[0] = Use_Arrow_Sack;
	description = name;
	text[4] = "Velký kožený toulec plný šípů...";		
	inv_animate = 1;
};

func void Use_Arrow_Sack()
{
	var int Rnd_Arrow;

	AI_Print("Našel jsi několik šípů..."); 
	Rnd_Arrow = 20;
	CreateInvItems(self,ItRw_Arrow,Rnd_Arrow);
};

instance ItSe_GOLDSTACK(C_Item)
{
	name = "Zlaté mince";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ITMI_KARIBIK_GOLDHAUFEN.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_ITMI_KARIBIK_GOLDHAUFEN;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITMI_KARIBIK_GOLDHAUFEN()
{
	B_PlayerFindItem(ItMi_Gold,50);
};

instance ItSl_GoldPocket(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_GoldPocket.3ds";
	material = MAT_LEATHER;
	description = "Měšec";
	inv_animate = 1;
};

instance ItSl_GoldPocket_Woman(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_GoldPocket_Woman.3ds";
	material = MAT_LEATHER;
	description = "Měšec";
	inv_animate = 1;
};

instance ItSl_GoldPocket_Woman_New(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_GoldPocket_Woman_New.3ds";
	material = MAT_LEATHER;
	description = "Měšec";
	inv_animate = 1;
};

instance ItSl_HeroBags(C_Item)
{
	name = "Brašna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_HeroBags.3DS";
	material = MAT_LEATHER;
	description = "Brašna";
	inv_animate = 1;
};

instance ItSl_CraitBag(C_Item)
{
	name = "Sedlová brašna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_CraitBag.3ds";
	material = MAT_LEATHER;
	description = "Brašna";
	inv_animate = 1;
};

instance ItSl_HeroPocket(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_GoldPocket.3ds";
	material = MAT_LEATHER;
	description = "Měšec";
	inv_animate = 1;
};

instance ItSl_GoldPocket_None(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SMALL.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItSl_GoldPocket_None;
	description = "Měšec";
	text[4] = "V měšci cinká několik mincí...";
	inv_animate = 1;
};

func void Use_ItSl_GoldPocket_None()
{
	var int pGold;

	pGold = 10;
	B_PlayerFindItem(ItMi_Gold,pGold);
};

instance ItSl_GoldPocket_Low(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_SMALL.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItSl_GoldPocket_Low;
	description = "Měšec";
	text[4] = "V měšci cinká několik mincí...";
	inv_animate = 1;
};

func void Use_ItSl_GoldPocket_Low()
{
	var int pGold;

	pGold = 25;
	B_PlayerFindItem(ItMi_Gold,pGold);
};

instance ItSl_GoldPocket_Medium(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_MEDIUM.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItSl_GoldPocket_Medium;
	description = "Měšec";
	text[4] = "Těžký měšec plný zlatých mincí...";
	inv_animate = 1;
};

func void Use_ItSl_GoldPocket_Medium()
{
	var int pGold;

	pGold = 50;
	B_PlayerFindItem(ItMi_Gold,pGold);
};

instance ItSl_GoldPocket_Full(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ItSl_GoldPocket_Full;
	description = "Měšec";
	text[4] = "Pořádně těžký měšec, naditý mincemi...";
	inv_animate = 1;
};

func void Use_ItSl_GoldPocket_Full()
{
	var int pGold;

	pGold = 75;
	B_PlayerFindItem(ItMi_Gold,pGold);
};

instance Itar_Avabul_Wings(C_Item)
{
	name = "Avabulina křídla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itar_Avabul_Wings.3DS";
	material = MAT_LEATHER;
	description = "Avabulina křídla";
	inv_animate = 1;
};

instance Itar_Ghost_Candle(C_Item)
{
	name = "Přízračná lucerna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_GHOST_CANDLE_01.3DS";
	effect = "SPELLFX_GHOST_CANDLE";
	material = MAT_LEATHER;
	description = "Přízračná lucerna";
	inv_animate = 1;
};

instance ITMI_GHOST_TORCH_01(C_Item)
{
	name = "Přízračná pochodeň";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_GHOST_TORCH_01.3DS";
	effect = "SPELLFX_GHOST_TORCH";
	material = MAT_LEATHER;
	description = "Přízračná pochodeň";
	inv_animate = 1;
};
