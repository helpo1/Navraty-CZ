
var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

func void Use_BookstandALCHEMY1_S1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Напитки магической энергии ");
		Doc_PrintLine(nDocID,0,"и их ингредиенты ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эссенция маны ");
		Doc_PrintLine(nDocID,0,"2 огненные крапивы ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Экстракт маны ");
		Doc_PrintLine(nDocID,0,"2 огненные травы ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эликсир маны ");
		Doc_PrintLine(nDocID,0,"2 огненных корня ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Любая работа на алхимическом столе требует применения специальной лабораторной колбы в которой и изготавливают напиток.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для приготовления напитков маны также используются: ");
		Doc_PrintLine(nDocID,1,"Луговой горец");
		Doc_PrintLine(nDocID,1,"Серафис");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для приготовления напитков магической энергии перманентного действия  необходим царский щавель.");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(ALchemy_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_1_permanent = TRUE;
			B_Say(self,self,"$ABOUTALCHEMY");
			RankPoints = RankPoints + 1;

			if(TalentCount_Alchemy[0] < 100)
			{
				TalentCount_Alchemy[0] += 1;
			};
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
		if((BookBonus_87 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_87 = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY2_S1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Напитки лечебной энергии ");
		Doc_PrintLine(nDocID,0,"и их ингредиенты ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебная эссенция ");
		Doc_PrintLine(nDocID,0,"2 лечебных растения ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебный экстракт ");
		Doc_PrintLine(nDocID,0,"2 лечебные травы");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебный эликсир");
		Doc_PrintLine(nDocID,0,"2 лечебных корня ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Любая работа на алхимическом столе требует применения специальной лабораторной колбы в которой и изготавливают напиток.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для приготовления любых лечебных напитков также используются: ");
		Doc_PrintLine(nDocID,1,"Луговой горец");
		Doc_PrintLine(nDocID,1,"Серафис");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для приготовления напитков жизненной энергии перманентного действия необходим царский щавель.");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(ALchemy_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_2_permanent = TRUE;
			B_Say(self,self,"$ABOUTALCHEMY");
			RankPoints = RankPoints + 1;

			if(TalentCount_Alchemy[0] < 100)
			{
				TalentCount_Alchemy[0] += 1;
			};
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
		if((BookBonus_88 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_88 = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY3_S1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Напитки постоянных изменений");
		Doc_PrintLine(nDocID,0,"и их ингредиенты ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эликсир ловкости");
		Doc_PrintLines(nDocID,0,"Ягода гоблина и царский щавель");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Напиток ускорения");
		Doc_PrintLines(nDocID,0,"Трава глорха и луговой горец");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Напиток двойного ускорения ");
		Doc_PrintLines(nDocID,0,"Перегонка напитка ускорения с еще одной травой глорха");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эликсир силы ");
		Doc_PrintLines(nDocID,0,"Драконий корень и царский щавель");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Эликсир жизни ");
		Doc_PrintLines(nDocID,0,"Три лечебных корня и луговой горец");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Эликсир духа");
		Doc_PrintLines(nDocID,1,"Огненный корень и царский щавель");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Приготовление этих рецептов - наивысшее искусство алхимии!");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(ALchemy_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_3_permanent = TRUE;
			B_Say(self,self,"$ABOUTALCHEMY");
			RankPoints = RankPoints + 1;

			if(TalentCount_Alchemy[0] < 100)
			{
				TalentCount_Alchemy[0] += 1;
			};
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
		if((BookBonus_89 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_89 = TRUE;
		};
	};
};