
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
		Doc_PrintLine(nDocID,0,"PRVNÍ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy prvního kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Spánek -");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Spáčovo kopí -");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Křemen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvoření runy jsou potřeba všechny požadované ingredience.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu vytvořit, musí znát magickou formuli a mít runový kámen, stejně jako i svitek příslušného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak může runu vytvořit na runovém stole.");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"DRUHÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy druhého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Větrná pěst -");
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Spletité kořeny -");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvoření runy jsou potřeba všechny požadované ingredience.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu vytvořit, musí znát magickou formuli a mít runový kámen, stejně jako i svitek příslušného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak může runu vytvořit na runovém stole.");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"TŘETÍ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy třetího kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Strach -");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Zapomnění -");
		Doc_PrintLine(nDocID,0,"Akvamarín");
		Doc_PrintLine(nDocID,0,"Křemen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Tlaková vlna -");
		Doc_PrintLine(nDocID,0,"Křídlo krvavé mouchy");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvoření runy jsou potřeba všechny požadované ingredience.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu vytvořit, musí znát magickou formuli a mít runový kámen, stejně jako i svitek příslušného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak může runu vytvořit na runovém stole.");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"ČTVRTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy čtvrtého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Vyvolání bažinného golema -");
		Doc_PrintLine(nDocID,0,"Srdce bažinného golema");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Jedovaté kousnutí -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Jed");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");

		if(LegoSpellElevate == TRUE)
		{
			Doc_PrintLine(nDocID,0,"- Elevace -");
			Doc_PrintLine(nDocID,0,"Tráva z bažin");
			Doc_PrintLine(nDocID,0,"Síra");
			Doc_PrintLine(nDocID,0,"Uhlí");
			Doc_PrintLine(nDocID,0,"Ledový křemen");
		};

		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvoření runy jsou potřeba všechny požadované ingredience.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu vytvořit, musí znát magickou formuli a mít runový kámen, stejně jako i svitek příslušného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak může runu vytvořit na runovém stole.");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"PÁTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy pátého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Tornádo -");
		Doc_PrintLine(nDocID,0,"Křídlo krvavé mouchy");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Křemen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Strašný zápach -");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvoření runy jsou potřeba všechny požadované ingredience.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu vytvořit, musí znát magickou formuli a mít runový kámen, stejně jako i svitek příslušného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak může runu vytvořit na runovém stole.");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"ŠESTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy šestého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Hněv elementů -");
		Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
		Doc_PrintLine(nDocID,0,"Srdce ohnivého golema");
		Doc_PrintLine(nDocID,0,"Srdce ledového golema");
		Doc_PrintLine(nDocID,0,"Srdce bažinného golema");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Zemětřesení -");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Akvamarín");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvoření runy jsou potřeba všechny požadované ingredience.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu vytvořit, musí znát magickou formuli a mít runový kámen, stejně jako i svitek příslušného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak může runu vytvořit na runovém stole.");
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
			AI_Print("Inteligence + 1");
			BookBonus_142 = TRUE;
		};
	};
};