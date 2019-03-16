
func void use_bookstand_dmt_circ1_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны первого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Стрела мрака -");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв скелета -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Одержимость -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Эктоплазма");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Смола");
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
		if(READ_DMT_CIRCLE_01 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_01 = TRUE;
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
		if((BookBonus_131 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_131 = TRUE;
		};
	};
};

func void use_bookstand_dmt_circ2_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны второго Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Раздирание души -");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв зомби -");
		Doc_PrintLine(nDocID,0,"Уголь");
		Doc_PrintLine(nDocID,0,"Мертвая плоть");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Истощение -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
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
		if(READ_DMT_CIRCLE_02 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_02 = TRUE;
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
		if((BookBonus_132 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_132 = TRUE;
		};
	};
};

func void use_bookstand_dmt_circ3_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны третьего Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Копье тьмы -");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Рой -");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв скелета воина -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
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

		if(READ_DMT_CIRCLE_03 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_03 = TRUE;
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
		if((BookBonus_133 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_133 = TRUE;
		};
	};
};

func void use_bookstand_dmt_circ4_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны четвертого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Призыв демона -");
		Doc_PrintLine(nDocID,0,"Сердце демона");
		Doc_PrintLine(nDocID,0,"Сера х2");
		Doc_PrintLine(nDocID,0,"Смола х3");
		Doc_PrintLine(nDocID,0,"Уголь");
		Doc_PrintLine(nDocID,0,"Черный жемчуг х3");
		Doc_PrintLine(nDocID,0,"Высший рунный камень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Шар смерти -");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Смола");
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
		if(READ_DMT_CIRCLE_04 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_04 = TRUE;
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
		if((BookBonus_134 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_134 = TRUE;
		};
	};
};

func void use_bookstand_dmt_circ5_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны пятого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Армия тьмы -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Сердце каменного голема");
		Doc_PrintLine(nDocID,0,"Сердце демона");
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
		if(READ_DMT_CIRCLE_05 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_05 = TRUE;
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
		if((BookBonus_135 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_135 = TRUE;
		};
	};
};

func void use_bookstand_dmt_circ6_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны шестого Круга и необходимые для их изготовления ингредиенты: ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Черный туман -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Эктоплазма");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Крик мертвых -");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Сердце демона");
		Doc_PrintLine(nDocID,0,"Череп");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
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
		if(READ_DMT_CIRCLE_06 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_06 = TRUE;
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
		if((BookBonus_136 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_136 = TRUE;
		};
	};
};