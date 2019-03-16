
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
		Doc_PrintLine(nDocID,0,"PRVNÍ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy prvního kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Temný šíp -");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Vyvolání kostlivce -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Posedlost -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Ektoplazma");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"DRUHÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy druhého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Rozervání duše -");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Vyvolání zombie -");
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID,0,"Maso z mrtvoly");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Únava -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Kamenný krystal");
		Doc_PrintLine(nDocID,0,"Křemen");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"TŘETÍ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy třetího kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Temné kopí -");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Křemen");
		Doc_PrintLine(nDocID,0,"Kamenný krystal");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Roj hmyzu -");
		Doc_PrintLine(nDocID,0,"Akvamarín");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Vyvolání kostlivého válečníka -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Černá perla");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"ČTVRTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy čtvrtého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Vyvolání démona -");
		Doc_PrintLine(nDocID,0,"Srdce démona");
		Doc_PrintLine(nDocID,0,"Síra x2");
		Doc_PrintLine(nDocID,0,"Pryskyřice x3");
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID,0,"Černá perla x3");
		Doc_PrintLine(nDocID,0,"Vyšší runový kámen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Koule smrti -");
		Doc_PrintLine(nDocID,0,"Ohnivý jazyk");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"PÁTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy pátého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Armáda temnot -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
		Doc_PrintLine(nDocID,0,"Srdce démona");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"ŠESTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy šestého kruhu a ingredience potřebné k jejich vytvoření:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Černá mlha -");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Ektoplazma");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Řev mrtvých -");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Srdce démona");
		Doc_PrintLine(nDocID,0,"Lebka");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"Síra");
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
			AI_Print("Inteligence + 1");
			BookBonus_136 = TRUE;
		};
	};
};