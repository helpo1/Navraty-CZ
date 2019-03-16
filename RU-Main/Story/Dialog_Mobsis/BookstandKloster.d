
func void Use_Bookstand_Rune_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Рунический камень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rune_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Руны и их ингредиенты ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Учитель Иннос");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Приказы Инноса ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rules_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Правила");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_01_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны первого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненная стрела -");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Изготовителю должна быть известна формула магии, он должен иметь рунический камень, а также свиток заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только если эти условия выполнены он может приступить к изготовлению руны.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_KDF_CIRCLE_01 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDF_CIRCLE_01 = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_102 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_102 = TRUE;
		};
	};
};

func void Use_Bookstand_Kreise_02_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны второго Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненный шар -");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");

		if(LegoSpells == TRUE)
		{
			Doc_PrintLine(nDocID,0,"- Огненная вспышка -");
			Doc_PrintLine(nDocID,0,"Сера");
			Doc_PrintLine(nDocID,0,"Смола");
		};

		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Изготовителю должна быть известна формула магии, он должен иметь рунический камень, а также свиток заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только если эти условия выполнены он может приступить к изготовлению руны.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_KDF_CIRCLE_02 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDF_CIRCLE_02 = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_103 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_103 = TRUE;
		};
	};
};

func void Use_Bookstand_Kreise_03_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны третьего Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненная буря -");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв огненного голема -");
		Doc_PrintLine(nDocID,0,"Сердце огненного голема");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненная клетка -");
		Doc_PrintLine(nDocID,0,"Cера");
		Doc_PrintLine(nDocID,0,"Cмола");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Изготовителю должна быть известна формула магии, он должен иметь рунический камень, а также свиток заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только если эти условия выполнены он может приступить к изготовлению руны.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_KDF_CIRCLE_03 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDF_CIRCLE_03 = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_104 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_104 = TRUE;
		};
	};
};

func void Use_Bookstand_Kreise_04_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны четвертого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Большой огненный шар -");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Покров огня -");
		Doc_PrintLine(nDocID,0,"Магическая формула заклинания");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Изготовителю должна быть известна формула магии, он должен иметь рунический камень, а также свиток заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только если эти условия выполнены он может приступить к изготовлению руны.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_KDF_CIRCLE_04 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDF_CIRCLE_04 = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_105 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_105 = TRUE;
		};
	};
};

func void Use_Bookstand_Kreise_05_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны пятого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненный шторм -");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненный взрыв -");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Изготовителю должна быть известна формула магии, он должен иметь рунический камень, а также свиток заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только если эти условия выполнены он может приступить к изготовлению руны.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_KDF_CIRCLE_05 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDF_CIRCLE_05 = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_106 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_106 = TRUE;
		};
	};
};

func void Use_Bookstand_Kreise_06_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны шестого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Огненный дождь -");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Метеорит -");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для изготовления руны необходимы ВСЕ указанные ингредиенты.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Изготовителю должна быть известна формула магии, он должен иметь рунический камень, а также свиток заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только если эти условия выполнены он может приступить к изготовлению руны.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_KDF_CIRCLE_06 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDF_CIRCLE_06 = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_107 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_107 = TRUE;
		};
	};
};