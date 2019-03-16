
func void Use_Runemaking_KDW_CIRC1_S1()
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
		Doc_PrintLines(nDocID,0,"Руны первого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Молния -");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Ледяная стрела -");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
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
		if(READ_KDW_CIRCLE_01 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDW_CIRCLE_01 = TRUE;
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
		if((BookBonus_96 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_96 = TRUE;
		};
	};
};

func void Use_Runemaking_KDW_CIRC2_S1()
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
		Doc_PrintLines(nDocID,0,"Руны второго Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Ледяное копье -");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв снежной стаи -");
		Doc_PrintLine(nDocID,0,"Шкура волка");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");

		if(LegoSpells == TRUE)
		{
			Doc_PrintLine(nDocID,0,"- Ледяная вспышка -");
			Doc_PrintLine(nDocID,0,"Горный хрусталь");
			Doc_PrintLine(nDocID,0,"Ледяной кварц");
		};

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
		if(READ_KDW_CIRCLE_02 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDW_CIRCLE_02 = TRUE;
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
		if((BookBonus_97 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_97 = TRUE;
		};
	};
};

func void Use_Runemaking_KDW_CIRC3_S1()
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
		Doc_PrintLine(nDocID,0,"- Ледяная глыба -");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Шаровая молния -");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"Сера");
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
		if(READ_KDW_CIRCLE_03 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDW_CIRCLE_03 = TRUE;
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
		if((BookBonus_98 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_98 = TRUE;
		};
	};
};

func void Use_Runemaking_KDW_CIRC4_S1()
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
		Doc_PrintLine(nDocID,0,"- Удар молнии -");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв ледяного голема -");
		Doc_PrintLine(nDocID,0,"Сердце ледяного голема");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
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
		if(READ_KDW_CIRCLE_04 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDW_CIRCLE_04 = TRUE;
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
		if((BookBonus_99 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_99 = TRUE;
		};
	};
};

func void Use_Runemaking_KDW_CIRC5_S1()
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
		Doc_PrintLine(nDocID,0,"- Ледяная волна -");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Кулак воды -");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
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
		if(READ_KDW_CIRCLE_05 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDW_CIRCLE_05 = TRUE;
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
		if((BookBonus_100 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_100 = TRUE;
		};
	};
};

func void Use_Runemaking_KDW_CIRC6_S1()
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
		Doc_PrintLine(nDocID,0,"- Шторм -");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Крыло кровавого шершня");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Гейзер -");
		Doc_PrintLine(nDocID,0,"Аквамарин");
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
		if(READ_KDW_CIRCLE_06 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_KDW_CIRCLE_06 = TRUE;
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
		if((BookBonus_101 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_101 = TRUE;
		};
	};
};