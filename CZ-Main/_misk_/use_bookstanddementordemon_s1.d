/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(12x) RhetorikSkillValue - opraveno navýšení rétoriky nad maximum

*/




func void use_bookstanddementordemon_s1()
{
	var C_Npc her;
	var int nDocID;
	var int randomtext;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);
	};
	if(NECRODEMONAPPEAR == FALSE)
	{
		Wld_InsertNpc(necromacerdemonzombie,"FP_ROAM_DARKTOWER_06");
		NECRODEMONAPPEAR = TRUE;
	};
};

func void Use_BookstandDementor_S1()
{
	var C_Npc her;
	var int nDocID;
	var int randomtext;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			randomtext = Hlp_Random(5);

			if(randomtext == 0)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"Tvé střechy jsou postavené z mrtvého dřeva. Tvé stěny jsou postavené z mrtvého kamene. Tvé sny jsou zložené z mrtvých myšlenek.");
				Doc_PrintLines(nDocID,0,"No oni vrátí se křičíce, smějíce, pějíce, vrátí se k životu, vezmou, cos ukradl, s vřískotem stáhnou kůži z tvých mrtvých kostí.");
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Lidé jsou slepí hlupáci, sbírají poklady, lačnějí po zlatých špercích a řetězech.");
				Doc_PrintLines(nDocID,1,"Temný bůh temnotou a bolestí je osvobodí, jejich kosti a duše jak pokrm svůj posbírá.");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_01 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_01 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
						AI_Print("Rétorika + 1");
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
				if((BookBonus_119 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_119 = TRUE;
				};
			}
			else if(randomtext == 1)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"To náš Pán potrestal je. On dal jim moc svůj ráj naplnit.");
				Doc_PrintLines(nDocID,0,"Leč oni odmítli, či schopnosti neměli. Proč tohle stalo se navždy záhadou zůstane.");
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"No zřejmé je, že za chyby své trest si odnesli. Jejich civilizace zmizela, aby ta naše vzejít mohla.");
				Doc_PrintLines(nDocID,1,"A teď cestu musí uvolnit Pánovi našemu - bohu Temnoty, jenž touží teď své plány vykonat.");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_02 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_02 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
						AI_Print("Rétorika + 1");
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
				if((BookBonus_120 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_120 = TRUE;
				};
			}
			else if(randomtext == 2)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"Brzy bude vše posvěcené dechem Pána. A všichni ti, kteří ho odmítli, to pocití na sobě.");
				Doc_PrintLines(nDocID,0,"Každý bude posvěcen a vyčištěn. I nepomůže jim jejich falešný bůh, protože on není nic před silou Pána.");
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Démoni roztrhaj jejich maso na kousky a řeky zčervenaj od jejich krve. Slunce již nikdy nevyjde pro žádného z nich.");
				Doc_PrintLines(nDocID,1,"Všichni budou vstřebáni posvátnou Temnotou a červeným závojem Zabudnutí!");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_03 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_03 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
						AI_Print("Rétorika + 1");
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
				if((BookBonus_121 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_121 = TRUE;
				};
			}
			else if(randomtext == 3)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"V jednom pohybu, Mistr ukončí všechny lidské útrapy a vyčistí cestu, aby mohl Pán znova zostoupit na svět.");
				Doc_PrintLines(nDocID,0,"Nikdo neunikne jeho pohledu a trestu. V jeho jméně vybudujeme nový svět, kterého podstata je mimo chápání těch ubohých zvěřů.");
				Doc_PrintLines(nDocID,0,"Nastane čas tmy a temnoty na věky věků!");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Požehnané buď jméno jeho - v modlitbách k němu najdeme sílu rozdrvit nepřátele.");
				Doc_PrintLines(nDocID,1,"Uvolníme všechnu zuřivost na bezverné blázny - aby nikdo nepochyboval o síle našeho Pána.");
				Doc_PrintLines(nDocID,1,"A živí budou závidět mrtvým!");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_04 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_04 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
						AI_Print("Rétorika + 1");
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
				if((BookBonus_122 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_122 = TRUE;
				};
			}
			else if(randomtext == 4)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"Já jsem ten s příbytkem ve tmě...");
				Doc_PrintLine(nDocID,0,"Smrt je mým dechem...");
				Doc_PrintLine(nDocID,0,"Mé nohy pevně stojí na hrobech,");
				Doc_PrintLine(nDocID,0,"A vzkřísení mrtvých je mým pokrmem!");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"Boj se jména mého, člověk.");
				Doc_PrintLine(nDocID,1,"Já, kníže všeho pokrytého stínem.");
				Doc_PrintLine(nDocID,1,"ve vší majestátnosti noci,");
				Doc_PrintLine(nDocID,1,"Stavím temné stěny času.");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_05 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_05 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
						AI_Print("Rétorika + 1");
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
				if((BookBonus_123 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_123 = TRUE;
				};
			};
		};
	};
};

func void use_bookstanddementor1_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Původ světa");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Kdysi nebylo nic, posvatné nic, jehož jménem byl Chaos a jemuž vládl pán temnoty a prázdnoty Mordragu.");
			Doc_PrintLines(nDocID,0,"Taktéž božské elementy - Země, Voda, Kámen a Oheň, byly zrozeny v prázdnotě, odrážející její podstatu.");
			Doc_PrintLines(nDocID,0,"Ale tam, kde vládne Chaos - tam není místo pro boží moudrost. A elementy byly zaslepené touhou si přivlastnit vše okolo sebe.");
			Doc_PrintLines(nDocID,0,"A tak plynuli století a tisícletí a boje mezi nimi nebylo konce...");
			Doc_PrintLine(nDocID,0," ");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID,1,"Jen když si uvědomili, že tam, kde vládne Chaos není pro nich místa, elementy vymyslely jediný způsob existence míru.");
			Doc_PrintLines(nDocID,1,"Když získaly souhlas všech, elementy mohly vyhnat veliký Chaos a tam, kde ho porazili, změnit k lepšímu pána prázdnoty.");
			Doc_PrintLines(nDocID,1,"A v halách původní moci ho navždy skryly za tajemné dvěře a zapečatily na věčnost.");
			Doc_PrintLines(nDocID,1,"A tak vznikl svět.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_01 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_01 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_124 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_124 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor2_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Božští strážci");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Části nejednoty daly světu novou tvár, a skoro nikdo neví pravou příčinu.");
			Doc_PrintLines(nDocID,0,"Jejich cíl je prostý a bere svůj začátek v příčině vytvoření míru a jeho podstatě v různých podobách.");
			Doc_PrintLines(nDocID,0,"Bylo tam i slovo, i znamení, které dalo bratrem sílu a moudrost, aby odolali tomu, kdo rozdrvil srdce světa Tvůrců.");
			Doc_PrintLines(nDocID,0,"A aby vyplnili vůli Tvůrců až do konce času.");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID,1,"Každý vdýchl život jeho výtvoru a dal sílu, aby mohl pomoct bratrem s ich cílem.");
			Doc_PrintLines(nDocID,1,"Byli si rovni a nikdo se nepovyšoval, ale jejich podstata byla odrazem tajných přání Tvůrců.");
			Doc_PrintLines(nDocID,1,"Ve vášnivém hledání moci zapomněli, z čeho byli vytvoreni. A jeden z bratrů pustil ruku svého bratra.");
			Doc_PrintLines(nDocID,1,"A to byl konec i začátek - moudrosti a hlouposti, která trvá až dodnes.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_02 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_02 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_125 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_125 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor3_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Cesta Strážce");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Je nemožné nájít nepřítomné a změrat nekonečné. Podstata cesty není v hledání, nýbrž v realizaci cílů.");
			Doc_PrintLines(nDocID,0,"Ten, jež vstoupí na cestu neukazuje moudrosť Soudce ani mile, ani nahněvaně - smysl existence je v obou.");
			Doc_PrintLines(nDocID,0,"Tato moudrost v sebe skrývá cíl, jež nemůže následovat cestu zachování pravé rovnováhy - s charakterem chaosu.");
			Doc_PrintLines(nDocID,0,"Uzřít jí není dáno každému. A jenom vybráni můžou rozhodovat o tom, komu to bude dovolené.");
			Doc_PrintLines(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID,1,"Smysl téhle cesty je nemožné pochopit anebo definovat slovami. To je podstata porozumení, míru a osudu.");
			Doc_PrintLines(nDocID,1,"Když se pohneme kupředu, skrytou cestu osvítí boží moudrost a Jeho cíl se stane jasným.");
			Doc_PrintLines(nDocID,1,"Také životy budou uspořádané do jednoho kruhu a osud se bude opakovat - jenom jedna sféra může být idealní pro Rovnováhu.");
			Doc_PrintLines(nDocID,1,"Aby dala hodnotu tomu, co ve světě skutečně zaváží.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_03 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_03 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_126 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_126 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor4_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Kroniky Strážců, část I.");
			Doc_PrintLine(nDocID,0,"Část I");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Podstatou Rovnováhy je nestrannost. Akceptovat něčí stranu, milovat anebo se hněvat znamená ztratit Rovnováhu.");
			Doc_PrintLines(nDocID,0,"Poté se na nikoho není možné spoléhat. Naše bremeno není závislé od našeho současného stavu.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Spoléhat se na druhých je slabostí pro silné, ale sílou pro slabé.");
			Doc_PrintLines(nDocID,1,"Moudrost a Rovnováha leží v poznání své povahy v průběhu času.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_04 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_04 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_127 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_127 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor5_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Kroniky Strážců, část II.");
			Doc_PrintLine(nDocID,0,"Část II");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Jsou tací, pro kterých jsou vedomosti štítem a tací, pro kterých jsou zbraní. Ani jeden z těchto pohledů není vyvážený, ale jeden je méně nesmyslný.");
			Doc_PrintLines(nDocID,0,"Ten, kterého vědomosti jsou obmědzené jenom na to, co už ostatní vědí, je rovnaký blázen jako ten, jež se neobtěžuje studiem.");
			Doc_PrintLines(nDocID,0,"Poklad poznání je nejcennější na světě, a tak je přimeraně chráněný.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Kámen nemůže vědět, jaké dláto ho rozotne; ocel nemůže vědět, v jakém ohni shoří.");
			Doc_PrintLines(nDocID,1,"Když tě dochytí smrt a zoufalstvo, nebi se do prsou a nepřeklínej zlomyslný osud.");
			Doc_PrintLines(nDocID,1,"Ale chval Tvůrce za skoušku, která tě ovplyvnila.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_05 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_05 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_128 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_128 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor6_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Kroniky Strážců, část III.");
			Doc_PrintLine(nDocID,0,"Část III");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Starověký úpadek se znovu objevil. Mohlo to narušit Rovnováhu, ale my věděli, že bychom měli ostat ostražiti v případě, že by to přišlo.");
			Doc_PrintLines(nDocID,0,"Nikomu nemohlo být dovoleno zasáhnout. A někteří lidi pochybovali o pravdě Tvůrců.");
			Doc_PrintLines(nDocID,0,"Ale tlak trval, někteří zvítězili, a ti, kteří pochybovali, položili základný kámen nového chrámu.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Používaje naši čest jako štít mezi nebem a zemí, nemali bychom ztrácet moudrosť.");
			Doc_PrintLines(nDocID,1,"Ať jsou v bezpečí pod zámkem, ale vždy k dispozici a oddani. Budoucí generace závisí od našich činů.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_06 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_06 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_129 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_129 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor7_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Kroniky Strážců, část IV.");
			Doc_PrintLine(nDocID,0,"Část IV");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"I když naše vědomosti o světě jsou veliké, některé fenomény se ukázali být složitějšími, než jsme předpokládali.");
			Doc_PrintLines(nDocID,0,"Nejneočakávanejší spojení se zároveň ukázali být nejúčinnějšími.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Pozeraje se na relikvie najdené objavitelmi jsme zjistili, jakou úroveň může civilizace dosáhnout.");
			Doc_PrintLines(nDocID,1,"A při pohledě na starobylé ruiny jsme si uvědomili, jaké to může být nebězpečné.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_07 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_07 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
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
			if((BookBonus_130 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_130 = TRUE;
			};
		};
	};
};