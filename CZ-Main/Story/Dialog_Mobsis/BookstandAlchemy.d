
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
		Doc_PrintLine(nDocID,0,"Lektvary many");
		Doc_PrintLine(nDocID,0,"a jejich přísady");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Esence many");
		Doc_PrintLine(nDocID,0,"2 ohnivé kopřivy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Extrakt many");
		Doc_PrintLine(nDocID,0,"2 ohnivé býlí");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixír many");
		Doc_PrintLine(nDocID,0,"2 ohnivé kořeny");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Alchymista ke své práci vždy potřebuje laboratorní lahvičku, do které pak nalije hotový lektvar.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K namíchání elixíru posilujícího magickou moc potřebuješ zvláštní přísadu a rostlinu:");
		Doc_PrintLine(nDocID,1,"Luční pohanka");
		Doc_PrintLine(nDocID,1,"Modrý bez");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K namíchání lektvarů trvale měnících některou z duševních či tělesných vlastností potřebuješ určitou rostlinu jménem královský šťovík");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLine(nDocID,0,"Lektvary many");
		Doc_PrintLine(nDocID,0,"a jejich přísady");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Esence many");
		Doc_PrintLine(nDocID,0,"2 ohnivé kopřivy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Extrakt many");
		Doc_PrintLine(nDocID,0,"2 ohnivé býlí");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixír many");
		Doc_PrintLine(nDocID,0,"2 ohnivé kořeny");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Alchymista ke své práci vždy potřebuje laboratorní lahvičku, do které pak nalije hotový lektvar.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K namíchání elixíru posilujícího magickou moc potřebuješ zvláštní přísadu a rostlinu:");
		Doc_PrintLine(nDocID,1,"Luční pohanka");
		Doc_PrintLine(nDocID,1,"Modrý bez");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K namíchání lektvarů trvale měnících některou z duševních či tělesných vlastností potřebuješ určitou rostlinu jménem královský šťovík");
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
			AI_Print("Inteligence + 1");
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
		Doc_PrintLines(nDocID,0,"Speciální lektvary a lektvary pro trvalé změny");
		Doc_PrintLine(nDocID,0,"a jejich přísady");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixír obratnosti");
		Doc_PrintLines(nDocID,0,"1 gobliní bobule");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Lektvar rychlosti");
		Doc_PrintLines(nDocID,0,"1 chňapavčí býlí");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Dvojitý lektvar rychlosti");
		Doc_PrintLines(nDocID,0,"Destilace lektvaru rychlosti s 1 nebo více kusů chňapavčího býlí.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixír síly");
		Doc_PrintLines(nDocID,0,"1 dračí kořen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Elixír života");
		Doc_PrintLines(nDocID,0,"1 léčivý kořen");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Elixír ducha");
		Doc_PrintLines(nDocID,1,"1 ohnivý kořen");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Aplikace těchto receptů je nejvyšším alchymistickým uměním, které vyžaduje jistou praxi. Když to pojmu všeobecně, ne každý kdo ví, jak namíchat léčivý lektvar z léčivého kořene, má dost zkušeností, aby se pokusil i o přípravu těchto elixírů, u nichž jednu z přísad vždy tvoří královský šťovík.");
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
			AI_Print("Inteligence + 1");
			BookBonus_89 = TRUE;
		};
	};
};