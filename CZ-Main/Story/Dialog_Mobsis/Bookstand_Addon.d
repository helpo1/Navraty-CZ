var int AshtarBookBonus_01;
var int AshtarBookBonus_02;
var int AshtarBookBonus_03;

var int AshtarBook_01;
var int AshtarBook_02;
var int AshtarBook_03;

func void Use_Bookstand_Addon_BL_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Důl");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Crimson: 79 zlatých nugetů předáno a přetaveno");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Scatty: předáno zboží v hodnotě 250 zlatých");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Garaz: 6 zlatých nugetů předáno");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Všechny stráže: 9 zlatých nugetů předáno");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Tábor:");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ravenovy stráže: 25 zlatých");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Finn: 60 zlatých");
		Doc_PrintLines(nDocID,1,"Lennar: 40 zlatých");
		Doc_PrintLines(nDocID,1,"Emilio: 50 zlatých");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ostatní: 20 zlatých");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Huno, Fisk, Snaf: podle zboží");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Lovci: Musí vyřídit vůdce! Franco: 7 zlatých nugetů předáno");
		Doc_Show(nDocID);
	};
};

func void use_bookstandfirecavetest_s1()
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
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Vy, kteří se odvažíte vyzvat Oheň - vězte, že máte před sebou těžkou zkoušku.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"A jen ten, kdo dokáže překonat Pravého ducha Ohně - projde!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READFIRECAVE == FALSE)
		{
			B_GivePlayerXP(100);
			READFIRECAVE = TRUE;
			B_LogEntry(TOPIC_KELIOSTEST,"Abych prošel zkouškou, budu muset najít Pravého ducha Ohně a porazit ho!");
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
		if((BookBonus_108 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_108 = TRUE;
		};
	};
};

func void USE_BOOKIMARAH_s1()
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
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Ten, kdo hledá poznaní, ho vždy najde. Otázkou však je, jakou hodnotu pro něj toto poznání bude mít...");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Takže se teď jen zeptám - jaká bude moje cena?");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(READIMARAH == FALSE)
		{
			B_GivePlayerXP(200);
			READIMARAH = TRUE;
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
		if((BookBonus_157 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_157 = TRUE;
		};
	};
};

var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;

func int C_CanReadBookStand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Use_BookstandMaya()
{
	if(BookstandMayaArt == 1)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"... pouze STRÁŽCI SMRTI mohou povolat předky.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jejich nepřítomnost jim velice chyběla. Beze předků nemohli vést lidi.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"LÉČITELÉ byli posláni, aby zapečetili portál a zničili klíč. Jen Adanos ví, co se s nimi stalo a jestli se jim úkol podařil.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"VÁLEČNICKÁ KASTA byla zničena Adanovým hněvem. Srdce starého válečníka bylo zlomeno.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Pouze zbylí KNĚŽÍ dávali lidem naději na znovuzrození jejich města.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Ale my, UČENCI, jsme již znali hořkou pravdu. JHARKENDAR padl a byl pohřben časem.");
		Doc_PrintLines(StPl_nDocID,1,"");

		if((BookBonus_109 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_109 = TRUE;
		};
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES byl pohřben v Adanově chrámu, ale moc meče zlomena nebyla.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jeho moc byla příliš velká. Zabíjení a ničení na ulicích by nikdy neskončilo.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"A tak až samotný Adonos vše ukončil svým hněvem. Jedinou vlnou zatopil celé město.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Jen několik vyšších budov zůstalo, vše ostatní bylo zničeno.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Několik lidí katastrofu přežilo, jenže neměli už dostatek sil, aby dokázali obnovit slávu a velikost města.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"A tak byl osud JHARKENDARU zpečetěn.");
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
		if((BookBonus_110 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_110 = TRUE;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Stáří QUARHODRONOVI bránilo v tom vést armádu. A tak kněží využili toho, že spadá pod jejich moc.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"A přikázali mu, aby se vzdal svého titulu vůdce a odevzdal meč.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Rada pěti chtěla jednat o jeho následníkovi, ale Válečnická kasta s tím nesouhlasila.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"RHADEMES, syn QUARHODRON byl navrhnut a zvolen Válečnickou kastou, jakožto nový vůdce.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON důvěřoval svému rodu, a tak souhlasil a odstoupil.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Odevzdal svůj meč svému synovi v naději, že mu bude vládnout stejně pevně, jako on.");

		if((BookBonus_111 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_111 = TRUE;
		};
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES byl ale slabý. Vůle meče ho přemohla a on se stal jen jeho loutkou.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES v moci meče přinesl vlastním lidem zkázu a utrpení. Ani léčitelé nebyli schopni utrpení zastavit či zmírnit.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Meč brzy pochopil, že jsou lidé příliš slabí na to, aby se mu dokázali postavit.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jen od našich předků, hrozil odpor.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Proto RHADEMES nechal všechny Strážce smrti popravit, což znamenalo konec všech nadějí.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Mnoho Strážců smrti zemřelo, když se pokoušeli povolat naše předky na pomoc JHARKENDARU.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Válka zuřila v ulicích, a tak se léčitelé rozhodli zapečetit vstup do údolí.");

		if((BookBonus_112 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_112 = TRUE;
		};
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"QUARHODRON, nejvyšší kněz KHARDIMON a já jsme se v těchto síních snažili přijít na to, jak porazit RHADEMESE a 'meč'.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"QUARHODRON a KHARDIMON se domnívali, že nejlepší bude zničit RHADEMESE v bitvě, společnými silami. Ale JÁ znal sílu meče příliš dobře na to, abych s tímto návrhem souhlasil.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Použil jsem svého práva k zamítnutí ostatních dvou a namísto toho jsem se rozhodl oklamat RHADAMESE lstí.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON uposlechl moji radu a nechal se uzavřít v Adanově chrámu. Pak poslal pro svého syna a požádal ho o pomoc.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Hněv jeho syna nabral takové velikosti, že rozbořil chrám, aby osvobodil svého otce.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Uvědomil si příliš pozdě, jaké jsou naše skutečné úmysly.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON zapečetil chrám přede všemi a RHADEMES byl v pasti. Uvězněn na věčnost i s mečem.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"");

		if((BookBonus_113 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_113 = TRUE;
		};
	};
};

func void InitUse_BookstandMaya()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(C_CanReadBookStand())
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Use_BookstandMaya();
			Doc_Show(StPl_nDocID);
		};
	};
	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	var int rnd;
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_1_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_02_S1()
{
	var int rnd;
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_2_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_03_S1()
{
	var int rnd;
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_3_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_04_S1()
{
	var int rnd;
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_4_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_05_S1()
{
	var int rnd;
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_5_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandAshtar_01_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_01 == FALSE)
			{
				AshtarBook_01 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

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
			if((AshtarBookBonus_01 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				AshtarBookBonus_01 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"... i Adanos řekl - žijte a množte se, mé děti! Všechna požehnání tohoto světa vám daruji a s nimi božskou moc moji.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... a tajemství Adanovy magie bylo odhaleno člověku, aby jí mohl vládnout a chránit rovnováhu v tomto světě.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandAshtar_02_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_02 == FALSE)
			{
				AshtarBook_02 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

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
			if((AshtarBookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				AshtarBookBonus_02 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"... a byl mezi nimi jeden, který vynikal svou sílou a odvahou, mimo jiné. A Adanos ho učinil svým válečníkem, aby udeřil na nepřátele své.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... a stal se velkým válečníkem a oslavovali ho po mnoho staletí pro jeho skutky při Adanově slávě.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandAshtar_03_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_03 == FALSE)
			{
				AshtarBook_03 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

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
			if((AshtarBookBonus_03 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				AshtarBookBonus_03 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"... a byl podobný stínu a nikdo ho nemohl najít, pokud by sám nechtěl. A objevil se jen tehdy, když ho povolal Adanos.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... a nabídl dary na oltář Adanův, které získal na lovu, takže stádo nezemřelo. Adanos přijal dary a obdaroval ho svou milostí.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func int CHELDRAKBOOK_COND()
{
	if((StartLvStory == TRUE) && (OpenHramDone == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void Use_BookstandChelDrak_01_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_01 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ve starých spisech ohledně vstupu do chrámu, našel jsem podivné záznamy. Možná mi nějak pomohou pochopit, jak to tedy je.");
					StartLvStoryFR = TRUE;
				};

				LV_Story_01 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Jen hodný může vejít do chrámu..., verš tu naznačuje, že není nutné běžet... nepospíchejte, hledejte cestu ve své duši.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Musíte pochopit pouze tohle: jediný průchod je ten správný... když vyřešíte mou hádanku, poklad se zjeví přímo před vámi.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_02_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_02 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ve starých spisech ohledně vstupu do chrámu, našel jsem podivné záznamy. Možná mi nějak pomohou pochopit, jak to tedy je.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"První nápis zní: 'Mezi světlem a teplem, mezi pomstou a dobrem, třetí bratr vládne vodám, každy ho za to chválí.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Druhý nápis zní: 'Bílý mráz jehož hranici světlo nastavilo, tou cestou vrásčité tváře neprojdou, ti, u nichž život je na pokraji.'...");
				LV_Story_02 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Mezi světlem a teplem, mezi pomstou a dobrem, třetí bratr vládne vodám, každy ho za to chválí.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Bílý mráz jehož hranici světlo nastavilo, tou cestou vrásčité tváře neprojdou, ti, u nichž život je na pokraji.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_03_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_03 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ve starých spisech ohledně vstupu do chrámu, našel jsem podivné záznamy. Možná mi nějak pomohou pochopit, jak to tedy je.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Třeti nápis zní: 'Mezi svitem a půlnocí je třetí cesta pečlivě ukrytá, projdi skrze ní a najdeš klíče noci.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Čtvrtý nápis zní: 'Kde se slunce na oblohu dere, není místo pro strašlivý stín, jdi odvážně, neboj se tam pokleknout.'...");
				LV_Story_03 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Mezi svitem a půlnocí je třetí cesta pečlivě ukrytá, projdi skrze ní a najdeš klíče noci.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Kde se slunce na oblohu dere, není místo pro strašlivý stín, jdi odvážně, neboj se tam pokleknout.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_04_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_04 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ve starých spisech ohledně vstupu do chrámu, našel jsem podivné záznamy. Možná mi nějak pomohou pochopit, jak to tedy je.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Pátý nápis zní: 'Kde sníh pokryl pole a hory, kde je všechno bílo-bílé u moře, kde chlad ukoval srdce lidí, zloduch po staletí bil na útes.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Šestý nápis zní: 'A v ten den šel odpočívat, ale on, ne ty - vpřed, hrdino, kde se slunce skrývá za noc, hledej, hledej, najdi klíč.'...");
				LV_Story_04 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Kde sníh pokryl pole a hory, kde je všechno bílo-bílé u moře, kde chlad ukoval srdce lidí, zloduch po staletí bil na útes.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"A v ten den šel odpočívat, ale on, ne ty - vpřed, hrdino, kde se slunce skrývá za noc, hledej, hledej, najdi klíč.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_05_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_05 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ve starých spisech ohledně vstupu do chrámu, našel jsem podivné záznamy. Možná mi nějak pomohou pochopit, jak to tedy je.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Sedmý nápis zní: 'Temnota má blízko k chladu, černý sníh poletuje po celém světě, povstanou mrtvé síly, ale tam se vydat musíš.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Osmý nápis zní: 'Tam, kde teplo spaluje, buď připraven, bojuj s planoucím nepřítelem, vodu si přinést nezapomeň a postav se vstříc žáru, hrdino.'...");
				LV_Story_05 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Temnota má blízko k chladu, černý sníh poletuje po celém světě, povstanou mrtvé síly, ale tam se vydat musíš.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Tam, kde teplo spaluje, buď připraven, bojuj s planoucím nepřítelem, vodu si přinést nezapomeň a postav se vstříc žáru, hrdino.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_06_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_06 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ve starých spisech ohledně vstupu do chrámu, našel jsem podivné záznamy. Možná mi nějak pomohou pochopit, jak to tedy je.");
					StartLvStoryFR = TRUE;
				};

				LV_Story_06 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"A jestli pořad hledáš, pak ti světlo cestu tvou ukáže. Světlo smrti, světlo záhuby a s ním prokletí nemrtých.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Pohlédni sem, poznej odpověď. Taková je, příteli má rada. A dveře ještě jednou se otevřou, jazyk, který byl kdysi náš.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};