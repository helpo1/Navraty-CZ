
func void B_CreateAmbientInv_VLK(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(16) + 2;
	if(goldAmount > 10)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Blueplant,richboy);
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Flask,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItFoMutton,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItPo_Health_01,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount * 2);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void b_createambientinv_xbs(var int InventorySet)
{
	var int richboy;
	richboy = Hlp_Random(2) + 1;
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Blueplant,richboy);
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItMi_Gold,Hlp_Random(16) + 2);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItMi_Joint,2);
		CreateInvItems(self,ItMi_OldCoin,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Flask,1);
		CreateInvItems(self,ItFo_Beer,2);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItFoMutton,richboy);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Beer,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItPo_Health_01,richboy);
		CreateInvItems(self,ItFo_Honey,1);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Forestberry,2);
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItFo_Beer,richboy);
	};
};

func void B_CreateAmbientInv_BAU(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(10) + 7;
	if(goldAmount > 12)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Forestberry,richboy);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItFo_Milk,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItPl_Planeberry,richboy);
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItPl_Blueplant,richboy);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Bread,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItPl_Forestberry,richboy);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItMi_Joint,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Cheese,4);
		CreateInvItems(self,ItFo_Beer,1);
	};
};

func void B_CreateAmbientInv_NOV(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(10) + 7;
	if(goldAmount > 12)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Forestberry,richboy);
		CreateInvItems(self,ItFo_Water,3);
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItFo_Fish,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Flask,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Apple,3);
		CreateInvItems(self,ItFo_Cheese,2);
		CreateInvItems(self,ItFo_Beer,2 + richboy);
		CreateInvItems(self,ItMi_Sulfur,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItPl_Blueplant,richboy);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Bread,2);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItPo_Mana_01,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Planeberry,2 + richboy);
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItFo_Beer,1);
	};
};

func void B_CreateAmbientInv_SLD(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(10) + 10;
	if(goldAmount > 15)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,richboy);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,richboy);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItFo_Sausage,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItMi_Joint,1 + richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItFo_Booze,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Sausage,richboy);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Booze,richboy);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Mushroom_02,3);
		CreateInvItems(self,ItFo_Booze,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
		CreateInvItems(self,ItFoMutton,2);
	};
};

func void B_CreateAmbientInv_KDF(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(20) + 30;
	if(goldAmount > 41)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,richboy);
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Mana_02,richboy);
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItMi_Flask,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItPl_Mushroom_01,richboy);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItPo_Health_03,richboy);
		CreateInvItems(self,ItFo_Booze,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,richboy);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItPl_Mana_Herb_01,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItPl_Blueplant,richboy * 2);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Mushroom_02,richboy);
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void B_CreateAmbientInv_MIL(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(20) + 15;
	if(goldAmount > 23)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,3);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItFo_Stew,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Health_01,richboy);
		CreateInvItems(self,ItPl_Health_Herb_01,3);
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItPl_Health_Herb_01,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItPl_Mushroom_01,richboy);
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Booze,3);
		CreateInvItems(self,ItFo_FishSoup,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,richboy);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItPl_Mushroom_02,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Mushroom_02,1);
		CreateInvItems(self,ItFo_Booze,richboy);
		CreateInvItems(self,ItFo_Sausage,3);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void B_CreateAmbientInv_DJG(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(15) + 35;
	if(goldAmount > 47)
	{
		richboy = 3;
	}
	else if(goldAmount > 44)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFo_Wine,richboy);
		CreateInvItems(self,ItPl_Mana_Herb_01,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItAt_WolfFur,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Milk,1);
		CreateInvItems(self,ItMi_Joint,richboy);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Bacon,richboy);
		CreateInvItems(self,ItPl_Speed_Herb_01,1);
		CreateInvItems(self,ItAt_BugMandibles,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItPl_SwampHerb,1);
		CreateInvItems(self,ItFo_Bacon,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItPl_Health_Herb_02,richboy);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPo_Health_02,1);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItFo_Wine,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		if(richboy > 2)
		{
			CreateInvItems(self,ItPo_Health_02,1);
		}
		else if(richboy > 1)
		{
			CreateInvItems(self,ItPo_Health_01,1);
		};
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItAt_SheepFur,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void B_CreateAmbientInv_PAL(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(30) + 20;

	if(goldAmount > 45)
	{
		richboy = 3;
	}
	else if(goldAmount > 38)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFo_Wine,richboy);
		CreateInvItems(self,ItFo_Bacon,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Booze,richboy);
		CreateInvItems(self,ItFo_Milk,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPl_Mana_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Bacon,richboy);
		CreateInvItems(self,ItPl_Mana_Herb_01,2);
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItPl_Health_Herb_03,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItPl_Health_Herb_02,richboy);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPo_Health_02,richboy);
		CreateInvItems(self,ItPl_Speed_Herb_01,2);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItPl_Health_Herb_02,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void B_CreateAmbientInv_DMT(var int InventorySet)
{
	var int richboy;

	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPo_Mana_01,richboy);
		CreateInvItems(self,ItMi_Pitch,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Mana_02,richboy);
		CreateInvItems(self,ItMi_Aquamarine,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItPo_Mana_01,richboy);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPo_Health_01,richboy);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItPo_Health_02,richboy);
	}
	else if(InventorySet == 6)
	{
		if(richboy > 1)
		{
			CreateInvItems(self,itpo_speed_02,1);
		}
		else
		{
			CreateInvItems(self,ItPo_Speed,1);
		};
		CreateInvItems(self,ItMi_Coal,1);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPo_Health_01,richboy);
	};
};

func void B_CreateAmbientInv_STRF(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItMi_Addon_GoldNugget,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItMi_Joint,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ITMI_SNUGGET,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItMi_OldCoin,1);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItMi_Sulfur,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItMi_Coal,1);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_SwampHerb,1);
	};
};

func void B_CreateAmbientInv_PIR(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(25) + 25;
	if(goldAmount > 39)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(self,ItFo_Addon_Grog,richboy);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Addon_Grog,2);
		CreateInvItems(self,ItMi_Gold,goldAmount);
		CreateInvItems(self,ItMi_Joint,3);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,richboy);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_RingGold,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Addon_Grog,2);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItFo_Addon_Rum,richboy);
		CreateInvItems(self,ItFo_Addon_Pfeffer_01,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItMi_Gold,goldAmount);
		CreateInvItems(self,ItPl_Forestberry,richboy);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Addon_Grog,richboy);
		CreateInvItems(self,ItFo_Bread,1);
		if(richboy > 1)
		{
			CreateInvItems(self,ItPo_Health_01,1);
		};
	};
};

func void B_CreateAmbientInv_BDT(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(25) + 25;
	if(goldAmount > 45)
	{
		richboy = 3;
	}
	else if(goldAmount > 37)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,richboy);
		CreateInvItems(self,ItKE_lockpick,1 + richboy);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItMi_Joint,3);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,richboy);
		CreateInvItems(self,ItPo_Health_01,1);
		if(richboy > 2)
		{
			CreateInvItems(self,ItPo_Health_01,1);
		};
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItFo_Beer,2);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItKE_lockpick,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		if(richboy > 2)
		{
			CreateInvItems(self,ItPo_Health_01,1);
		};
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Forestberry,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItKE_lockpick,2 + richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void B_CreateAmbientInvAssasins(var int InventorySet)
{
	var int goldAmount;
	var int richboy;
	goldAmount = Hlp_Random(25) + 25;
	if(goldAmount > 45)
	{
		richboy = 3;
	}
	else if(goldAmount > 37)
	{
		richboy = 2;
	}
	else
	{
		richboy = 1;
	};
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,richboy);
		CreateInvItems(self,ItKE_lockpick,1 + richboy);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,richboy);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItMi_Joint,3);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,richboy);
		CreateInvItems(self,ItPo_Health_01,1);
		if(richboy > 2)
		{
			CreateInvItems(self,ItPo_Health_01,1);
		};
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItFo_Beer,2);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItKE_lockpick,richboy);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		if(richboy > 2)
		{
			CreateInvItems(self,ItPo_Health_01,1);
		};
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Forestberry,richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItFo_Fish,richboy);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItKE_lockpick,2 + richboy);
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};

func void B_CreateAmbientInv(var C_Npc slf)
{
	var int zufall;
	zufall = Hlp_Random(7);

	if(slf.guild == GIL_VLK)
	{
		B_CreateAmbientInv_VLK(zufall);
	}
	else if(c_npcbelongstocoast(slf) == TRUE)
	{
		b_createambientinv_xbs(zufall);
	}
	else if(slf.guild == GIL_BAU)
	{
		B_CreateAmbientInv_BAU(zufall);
	}
	else if(slf.guild == GIL_NOV)
	{
		B_CreateAmbientInv_NOV(zufall);
	}
	else if(slf.guild == GIL_SLD)
	{
		B_CreateAmbientInv_SLD(zufall);
	}
	else if(slf.guild == GIL_KDF)
	{
		B_CreateAmbientInv_KDF(zufall);
	}
	else if(slf.guild == GIL_MIL)
	{
		B_CreateAmbientInv_MIL(zufall);
	}
	else if(slf.guild == GIL_DJG)
	{
		B_CreateAmbientInv_DJG(zufall);
	}
	else if(slf.guild == GIL_PAL)
	{
		B_CreateAmbientInv_PAL(zufall);
	}
	else if(slf.guild == GIL_DMT)
	{
		B_CreateAmbientInv_DMT(zufall);
	}
	else if(slf.guild == GIL_STRF)
	{
		B_CreateAmbientInv_STRF(zufall);
	}
	else if(slf.guild == GIL_PIR)
	{
		B_CreateAmbientInv_PIR(zufall);
	}
	else if(slf.guild == GIL_BDT)
	{
		if(slf.npcType == NPCTYPE_PALMORA)
		{
			B_CreateAmbientInv_PAL(zufall);
		}
		else
		{
			B_CreateAmbientInv_BDT(zufall);
		};
	}
	else
	{
		B_CreateAmbientInv_BAU(zufall);
	};
};

func void B_CreateAmbientInv_Ass(var C_Npc slf)
{
	var int zufall;
	zufall = Hlp_Random(7);
	B_CreateAmbientInvAssasins(zufall);
};

func void b_createambientinv_om(var int rich)
{
	var int goldAmount;

	goldAmount = Hlp_Random(50);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);

	if(goldAmount > 0)
	{
		CreateInvItems(self,ItMi_Gold,goldAmount);
	};
};