
func void use_bookstand_gur_circ1_s1()
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
		Doc_PrintLine(nDocID,0,"- Сон -");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Копье Спящего -");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
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
		if(READ_GUR_CIRCLE_01 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_GUR_CIRCLE_01 = TRUE;
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
		if((BookBonus_137 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_137 = TRUE;
		};
	};
};

func void use_bookstand_gur_circ2_s1()
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
		Doc_PrintLine(nDocID,0,"- Кулак ветра-");
		Doc_PrintLine(nDocID,0,"Уголь");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Опутать корнями -");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Болотная трава");
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
		if(READ_GUR_CIRCLE_02 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_GUR_CIRCLE_02 = TRUE;
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
		if((BookBonus_138 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_138 = TRUE;
		};
	};
};

func void use_bookstand_gur_circ3_s1()
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
		Doc_PrintLine(nDocID,0,"- Страх -");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Забвение -");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Ударная волна -");
		Doc_PrintLine(nDocID,0,"Крыло кровавого шершня");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
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
		if(READ_GUR_CIRCLE_03 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_GUR_CIRCLE_03 = TRUE;
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
		if((BookBonus_139 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_139 = TRUE;
		};
	};
};

func void use_bookstand_gur_circ4_s1()
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
		Doc_PrintLine(nDocID,0,"- Призыв болотного голема -");
		Doc_PrintLine(nDocID,0,"Сердце болотного голема");
		Doc_PrintLine(nDocID,0,"Болотная трава");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Ядовитый укус -");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Яд");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");

		if(LegoSpellElevate == TRUE)
		{
			Doc_PrintLine(nDocID,0,"- Возвышение -");
			Doc_PrintLine(nDocID,0,"Болотник");
			Doc_PrintLine(nDocID,0,"Сера");
			Doc_PrintLine(nDocID,0,"Уголь");
			Doc_PrintLine(nDocID,0,"Ледяной кварц ");
		};

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
		if(READ_GUR_CIRCLE_04 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_GUR_CIRCLE_04 = TRUE;
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
		if((BookBonus_140 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_140 = TRUE;
		};
	};
};

func void use_bookstand_gur_circ5_s1()
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
		Doc_PrintLine(nDocID,0,"- Смерч -");
		Doc_PrintLine(nDocID,0,"Крыло кровавого шершня");
		Doc_PrintLine(nDocID,0,"Болотная трава");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Ужасное зловоние -");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
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
		if(READ_GUR_CIRCLE_05 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_GUR_CIRCLE_05 = TRUE;
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
		if((BookBonus_141 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_141 = TRUE;
		};
	};
};

func void use_bookstand_gur_circ6_s1()
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
		Doc_PrintLine(nDocID,0,"- Гнев Стихий -");
		Doc_PrintLine(nDocID,0,"Сердце каменного голема");
		Doc_PrintLine(nDocID,0,"Сердце огненного голема");
		Doc_PrintLine(nDocID,0,"Сердце ледяного голема");
		Doc_PrintLine(nDocID,0,"Сердце болотного голема");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Землетрясение -");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Сердце каменного голема");
		Doc_PrintLine(nDocID,0,"Болотник");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"Смола");
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

		if(READ_GUR_CIRCLE_06 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_GUR_CIRCLE_06 = TRUE;
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
		if((BookBonus_142 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_142 = TRUE;
		};
	};
};