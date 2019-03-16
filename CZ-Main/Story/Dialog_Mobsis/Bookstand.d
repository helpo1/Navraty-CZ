func void Use_Bookstand_Pyrokar_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(BookBonus_155 == FALSE)
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			};
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			BookBonus_155 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Svatá povinnost");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Mág není jako obyčejný smrtelník. Má schopnost čerpat božskou moc, a proto se také na něj nevztahují přírodní zákony, které ovlivňují každého človeka.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Jakmile mág dosáhne určité úrovně, která mu umožňuje povznést se nad rámec běžné existence, může vstoupit do jiného světa, nedosažitelného běžným smrtelníkům. Mág může prolomit hranice času a prostoru, a dokonce ani smrt ho nebude schopna zastavit.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if((hero.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest,LOG_Running);
			B_LogEntry(TOPIC_FireContest,"Jako novic, mám právo na Zkoušku Ohně. V tomto případě mi každý z Nejvyšší rady mágů Ohně přidělí úkol. Pokud ve všech úkolech uspěji, budu přijat do Kruhu Ohně.");
			RankPoints = RankPoints + 1;
		};
		if(BookBonus_83 == FALSE)
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			};
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			BookBonus_83 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Zkouška Ohně");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"I když novic může mít pocit, že je připraven podstoupit Zkoušku Ohně, neznamená to, že bude vybrán. Pokud ale na svém rozhodnutí stále trvá, má právo zkoušku požadovat a žádný mág mu v tom nesmí bránit. Ale nejenže musí projít zkouškou magie, musí také najít osvícení skrze Oheň. Přednese-li své rozhodnutí Nejvyšší radě, čeká ho ZKOUŠKA OHNĚ.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Zkouška prověří jak novicovu moudrost, tak i sílu a obratnost. Proto se skládá celkem ze tří částí, z nichž každou mu zadá jeden mág Nejvyšší rady ještě předtím, než složí přísahu Ohně a bude spjat s tímto elementem.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Taková je Innosova vůle a tak se i stane.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Nejvyšší rada");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Andre_S1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Přísaha -");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"... konat svou povinnost bez obav z vyčerpání! Konat svou povinnost, pokud ti to přinese štěstí nebo neštěstí...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");

		if(Rengaru_Ausgeliefert == TRUE)
		{
			Doc_PrintLines(nDocID,1,"... Vězeň Rengar je obviněn z krádeže.");
		};
		if(Halvor_Ausgeliefert == TRUE)
		{
			Doc_PrintLines(nDocID,1,"... Vězeň Halvor je obviněn z toho, že je zloděj.");
		};
		if(Nagur_Ausgeliefert == TRUE)
		{
			Doc_PrintLines(nDocID,1,"... Vězeň Nagur je obviněn z vraždy.");
		};
		if((CANTHAR_AUSGELIEFERT2 == TRUE) || ((KnowCantarFree == FALSE) && (Canthar_Ausgeliefert == TRUE))) 
		{
			Doc_PrintLines(nDocID,1,"... Vězeň Canthar je obviněn z padělání.");
		};
		if((Sarah_Ausgeliefert == TRUE) && (SARAISFREE == FALSE))
		{
			Doc_PrintLines(nDocID,1,"... Vězenkyně Sarah je obviněna ze zrady.");
		};
		if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
		{
			Doc_PrintLines(nDocID,1,"... Vězeň Bennet je obviněn z vraždy.");
		};
		if((HANNAISKNAST == TRUE) && (HANNAISFREE == FALSE))
		{
			Doc_PrintLines(nDocID,1,"... Vězenkyně Hanna je obviněna z krádeže.");
		};
		if((GASPARPISSOFF == TRUE) && (HANNAISFREE == TRUE))
		{
			Doc_PrintLines(nDocID,1,"... Vězeň Gaspar je obviněn z krádeže.");
		};

		Doc_Show(nDocID);
	};
};

var int FinalDragonEquipment_Once;
var int GiveInnosTearPal;

func void Use_FINALDRAGONEQUIPMENT_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) && (ItWr_HallsofIrdorathIsOpen == TRUE))
	{
		if(FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
			{
				Wld_InsertItem(ITPO_PERM_MANA,"FP_ITEM_PALFINALARMOR");
				Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_PALFINALSTUFF");
			}
			else
			{
				if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
				{
					Wld_InsertItem(ItPo_Perm_STR,"FP_ITEM_PALFINALARMOR");
				}
				else
				{
					Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_PALFINALARMOR");
				};

				Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_PALFINALSTUFF");
			};

			FinalDragonEquipment_Once = TRUE;
			Wld_SendTrigger("EVT_DOOR_PALSECRETCHAMBER");
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
		if((BookBonus_84 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_84 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"... Doufám, že magická bariéra spolehlivě ochrání rudu před skřety. Král skoro uveřil, že jsme bariéru vytvořili, abychom zabránili trestancům v útěku. Ale sledovali jsme mnohem důležitější cíle. Doufám, že budeme mít dostatek času na přípravu pro hlavní bitvu.");
		Doc_PrintLines(nDocID,0,"");

		if((hero.guild == GIL_KDF) && (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == FALSE))
		{
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			PLAYER_TALENT_RUNES_MOF = TRUE;
			B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy INNOSŮV POHLED: 'Innosovy slzy', svěcená voda a vyšší runový kámen.");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... postupoval jsem v souladu s návodem, polil jsem runový kámen slzami Innose a svěcenou vodou, ale runový kámen se rozpadl. Myslím, že vytvořit tuto runu může pouze vyvolený Innose.");
			Doc_PrintLines(nDocID,1,"Innosovy slzy mohou sehrát důležitou roli v nadcházející bitvě, ale jsou dost nebezpečné, než abych je nosil u sebe. Raději je nechám zde v knihovně.");
			Doc_PrintLines(nDocID,1,"Taky nesmím zapomenout ani na Innosovu auru!");
			Doc_Show(nDocID);
			Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_ITEM_PALFINALWEAPON");
		}
		else if((hero.guild == GIL_PAL) && (GiveInnosTearPal == FALSE))
		{
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... Myslím, že Innosovy slzy mohou použít kromě mágů Ohně i paladinové!");
			Doc_PrintLines(nDocID,1,"Třeba tak, že jimi pokropí svou posvátnou zbraň a několikanásobně zvýší její účinnost.");
			Doc_Show(nDocID);
			Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_ITEM_PALFINALWEAPON");	
			GiveInnosTearPal = TRUE;
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
		}
		else if((hero.guild == GIL_DJG) && (PlayergetsFinalDJGArmor == FALSE))
		{
			PlayergetsFinalDJGArmor = TRUE;
		}
		else
		{
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void use_bookazgolor_01_s1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWS_AZGOGLOR_SUMMON == FALSE)
		{
			KNOWS_AZGOGLOR_SUMMON = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(READ_AZGOLOR == FALSE)
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"V opuštěné kryptě, o které mi řekl Ruen, jsem narazil na jednu velmi zvláštní knihu. V ní je popsán jeden starobylý magický rituál. Zdá se, že rituál slouží k vyvolání jednoho mocného stvoření - Velkého Stínu. V nejvzdálenější části Údolí stínů je runový kruh, který k tomuto rituálu patrně slouží.");
				B_LogEntry(TOPIC_URNAZULRAGE,"V knize byly také nějaká slova, která patrně znamenají ono kouzlo - ... BEKAN IN SHOKAN ETAR MARDOK - FAKHAT UR KRATAR TEKAN MOR... Co to znamená?");
			}
			else
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"V opuštěné kryptě, o které mi řekl Ruen, jsem narazil na jednu velmi zvláštní knihu. V ní je popsán jeden starobylý magický rituál. Zdá se, že rituál slouží k vyvolání jednoho mocného stvoření - Velkého Stínu. Teď už vím, jak donutit Azgalora, aby vylezl ze svého hnízda a bojoval se mnou. V nejvzdálenější části Údolí stínů je runový kruh, který k tomuto rituálu patrně slouží.");
				B_LogEntry(TOPIC_URNAZULRAGE,"V knize byly také nějaká slova, která patrně znamenají ono kouzlo - ... BEKAN IN SHOKAN ETAR MARDOK - FAKHAT UR KRATAR TEKAN MOR... Podle všeho jsou to slova moci uvedená v knize démonů.");
			};
		};
		if((BookBonus_85 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_85 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Rituál Stínu");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Tento rituál umožňuje přivolat do tohoto světa jedno z nejstrašlivejších stvoření temnoty - Velký Stín, mocného černého draka Azgalora. Kdo ho chce přivést do tohoto sveta, musí napřed mít starobylý artefakt - Oko hněvu, jehož výzvu všechny temné bytosti musí uposlechnout. Společně s vyřčenými slovy moci se rituál podaří, Oko přivolá Velký Stín do tohoto světa.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... BEKAN IN SHOKAN ETAR MARDOK - FAHAT UR KRATAR TEKAN MOR...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

instance ItWr_HolyArrows(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_bookstandholyarrows;
	scemeName = "MAP";
	description = "Svatý šíp";
	text[4] = "Popisuje způsob výroby posvěcených šípů a šipek...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_bookstandholyarrows()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Posvěcení");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ví se, že svěcená voda má pro všechny živé bytosti unikátní léčivé vlastnosti. Nicméně, při použití proti nemrtvým bytostem jsou účinky přímo opačné - zničující! Pro tento účel je lepší použít takto posvěcené šípy.");
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
	Doc_PrintLines(nDocID,1,"Chcete-li vytvořit posvěcené šípy, bude třeba jedna láhev svěcené vody na pět šípů. Při vytváření pokropíme špičku šípu svěcenou vodou, a poté vyslovíme modlitbu... (text modlitby)");
	Doc_Show(nDocID);

	if(MAKEHOLYARROWS == FALSE)
	{
		Log_CreateTopic(TOPIC_HOLYARROWS,LOG_NOTE);
		AI_Print("Naučeno: Výroba posvěcených šípů a šipek");
		B_LogEntry(TOPIC_HOLYARROWS,"Také můžu vytvářet posvěcené šípy a šipky. Jsou velmi užitečné proti všem druhům temných bytostí. Pro jejich výrobu potřebuji na každých padesát šípů nebo šipek navíc ještě deset láhví svěcené vody.");
		MAKEHOLYARROWS = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

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
	if((BookBonus_86 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_86 = TRUE;
	};
};

func void use_bookstandxranfreg_s1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Deník");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"-----------");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Během jedné výzkumné expedice v horách Khorinisu jsme objevili starodávný chrám. Ještě než jsme vstoupili dovnitř, ucítili jsme podivný tok velmi silné magické energie!");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Chtěli jsme vstoupit dovnitř, ale ozval se hlasitý třesk, a zjevil se kamenný golem epických rozměrů! Jednou ranou zabil tři paladiny. Dali jsem se na ústup, protože naše magie byla proti němu bezmocná...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Pyrokar");
		Doc_Show(nDocID);

		if(MIS_XRANFREG == FALSE)
		{
			MIS_XRANFREG = LOG_Running;
			Log_CreateTopic(TOPIC_XRANFREG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_XRANFREG,LOG_Running);
			B_LogEntry(TOPIC_XRANFREG,"Z knihy v suterénu kláštera, jsem se dozvěděl o nějaké expedici mágů Ohně. Zmiňuje se tam jméno - Pyrokar! Měl bych se o tom dozvědět víc...");
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
		if((BookBonus_144 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_144 = TRUE;
		};
	};
};

func void Use_Bookstand_Druid_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(Druid_01 == FALSE)
		{
			B_GivePlayerXP(250);
			Druid_01 = TRUE;
			Snd_Play("Levelup");
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
		if((BookBonus_154 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_154 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Když rostliny a zvířata změnily svoji podstatu, staly se hrozbou. Tak Adanos promlouval k moudrým a říkal, že zlo se dá změnit v dobro a jed v lék. Varoval je, aby se báli hněvu bohů a moudrost nevyužili pro zlo a z léku nestvořili jed. Ale ne všichni odolali pokušení.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Druidové pronikli do tajemství rostlin. Jejich znalost pomáhá alchymistům obrátit jed v lektvar. Vůlí druidů vyroste les za několik dnů - tam, kde byly jen keře a poušť. Ale takové kouzlo je druidům k dispozici jednou nebo dvakrát za život. Druidům v jejich lesích pomáhají ohromné stromy, které stejně jako golemové se mohou pohybovat.");
		Doc_Show(nDocID);
	};
};