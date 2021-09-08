
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int DIA_Fernando_Hello_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nic moc. Když ještě stála bariéra, bylo to lepší časy.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Trestanci dodávali tuny a tuny rudy z dolů a mé lodě ji pak odvážely na pevninu.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//A zpátky zase přivážely potraviny a jiné zboží.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Ale teď jsme odříznuti od pevniny a jsme se zásobami závislí na farmářích.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "Z čeho teď žiješ?";
};

func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z čeho teď žiješ?
	AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Zrovna teď žiju ze svých zásob. Ale jestli se zase nezačne obchodovat, dožiju se strašných časů.
};

instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	description = "Prodávals zbraně banditům.";
};

func int DIA_Addon_Fernando_BanditTrader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Prodávals zbraně banditům.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(překvapeně) Huh. Jak jsi přišel na ten nápad?
	B_LogEntry(TOPIC_Addon_Bandittrader,"Fernando připustil že prodává zbraně banditům.");
	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//To je soupis zboží. Dostal jsem ho od banditů. Je na něm tvůj podpis.
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Našel jsem také tento prsten u zámořského průvodce Araxosose. A ty jsi zámořský obchodník.
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//A meče banditů jsou podepsány tvým iniciálem 'F'.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//A meče banditů jsou podepsány tvým iniciálem 'F'.
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nemusíš zapírat. Odkryl jsem tvou nekalou činnost.

	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Tak tos byl ty? Tys mě zradil. Za to zaplatíš.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Myslím, že odtud poputuješ někam jinam. Nicméně, jsem si jistý, že tě nenechají jít zase tak brzy na světlo.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(nazlobeně) Můj čas nadešel.
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(žebravě) Musíš mi věřit, že jsem to nechtěl udělat!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(žebravě) Prvně to bylo pouze jídlo, co chtěli. Můj obchod nešlapal zrovna tak, jak by měl, tak jsem souhlasil.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(žebravě) A časem mi začali vyhrožovat, že mě zabijí, pokud jim nebudu dodávat víc a víc mečů.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(žebravě) Nemůžeš mě vinit z toho, co jsem udělal. Jsem pouze oběť!

		if(Fernando_ImKnast == FALSE)
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Kolik mi zaplatíš, pokud tě nechám uprchnout?",DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Začne se o tebe zajímat domobrana.",DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Och, to mě opravdu rozesmutnělo.",DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Och, to mě fakt rozesmutnělo. Víš, jsi docela hnusný na někoho, kdo žije v horní čtvrti.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Prodat svou duši za pár kusů zlata.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Musím si vydělat na živobytí. Když nepokryju náklady, vyhodí mě z přístavu. Stane se ze mě chátra.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Domobrana se o tebe začne zajímat.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Nemůžeš to udělat!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Jistě, že můžu.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Ve jménu Innosově, jsem na mizině!
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Kolik mi zaplatíš, pokud tě nechám uprchnout?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Znáš mou situaci. Nemohu ti moc zaplatit.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Co tak 200 hezkých kousků zlata a cenný prsten?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//To je vše, co ti mohu dát. Dáš mi teď ten seznam?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Ne, nechystám se ti to dát.",DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Dohodnuto.",DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Dohodnuto.
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero,ItWr_Addon_BanditTrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Dobrá, tady je zlato.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//A prsten. Nyní jsme dohodnuti.
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Ne, nechystám se ti to dát.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobrá. Vem si to, ale nezkoušej mě podvést...
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "Jsi v pořádku?";
};

func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "Ty jsi posedlý!";
};

func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ty jsi posedlý!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Jdi pryč. Tak jdi už.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_FERNANDO_TALIASANLETTER(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = dia_fernando_taliasanletter_condition;
	information = dia_fernando_taliasanletter_info;
	permanent = FALSE;
	description = "Můžu pro tebe něco udělat?";
};


func int dia_fernando_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_00");	//Můžu pro tebe něco udělat?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_03");	//No, mě teď nenapadá žádná práce, kterou bych ti mohl nabídnout...
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_04");	//Musíš mít něco čím se nechceš zabývat.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_06");	//Ha! Pak asi velmi potřebuješ peníze, ale já nemám!
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_07");	//No, ty zrovna ne...
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_08");	//Ano? A co tedy?
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_09");	//Za své služby chci doporučení pro Gallahada k Lariusovi.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_10");	//Nejlepší bude napsat dopis.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_11");	//CO?! Gallahada?!... Toho šarlatána?
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_17");	//A co s tím máš za problém?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_22");	//Eh... (smutný) No neměli jsme žádný spor, ale...
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_23");	//... Chtěl jsem si od něj koupit jednu knihu. Už tomu bude déle.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_24");	//Velmi jsem ji potřeboval, ale on mi ji nechtěl prodat a já nevím proč!
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_25");	//Stále dokola jsem ho prosil a on stále dokola odmítal.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_26");	//Maličkost! A co to bylo za knihu?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_27");	//Učebnice rétoriky. V mém oboru je důležité vyjádřit se správně a jasně zároveň.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_30");	//Když ti ji přinesu - změníš rozhodnutí ohledně dopisu pro Gallahada?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_36");	//Fajn! Přines ji a dostaneš svůj dopis!
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_39");	//Tak nebudu ztrácet čas a jdu pro ni.
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	MIS_FERNANDOHELP = LOG_Running;
	Log_CreateTopic(TOPIC_FERNANDOHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_Running);
	B_LogEntry(TOPIC_FERNANDOHELP,"Když přinesu Fernandovi knihu rétoriky, dá mi dopis s doporučením pro Gallahada. Ale Fernandova chtíče po knize mi něco říká, že než ji dám Fernandovi, měl bych si ji přečíst i já.");
};

instance DIA_FERNANDO_GOTBOOK(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = dia_fernando_gotbook_condition;
	information = dia_fernando_gotbook_info;
	permanent = FALSE;
	description = "Mám tu knihu.";
};

func int dia_fernando_gotbook_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (NpcObsessedByDMT_Fernando == FALSE) && (MIS_FERNANDOHELP == LOG_Running) && (Npc_HasItems(other,itwr_rhetorikbook) >= 1) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_gotbook_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Fernando_GotBook_01_00");	//Mám tu knihu.
	AI_Output(self,other,"DIA_Fernando_GotBook_01_01");	//Ano?!... (nedůvěřivý) Ukaž mi ji...
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	B_UseItem(self,itwr_rhetorikbook);
	AI_Output(self,other,"DIA_Fernando_GotBook_01_02");	//Hmmm... Opravdu ona! Jak jsi to dokázal.
	AI_Output(self,other,"DIA_Fernando_GotBook_01_04");	//Hodně mě to překvapilo!
	AI_Output(other,self,"DIA_Fernando_GotBook_01_06");	//A co ten dopis pro Gallahada?
	AI_Output(self,other,"DIA_Fernando_GotBook_01_07");	//Ach ano, tady ho máš!
	B_GiveInvItems(self,other,itwr_fernandoletter,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,Npc_HasItems(self,itwr_rhetorikbook));
	AI_Output(other,self,"DIA_Fernando_GotBook_01_09");	//Bylo mi potěšením obchodovat s tebou.
	AI_Output(self,other,"DIA_Fernando_GotBook_01_14");	//Dobrá musím jít. Měj se!
	Npc_ExchangeRoutine(vlk_6027_taliasan,"Start");
	vlk_6027_taliasan.guild = GIL_VLK;
	Npc_SetTrueGuild(vlk_6027_taliasan,GIL_VLK);
	MIS_FERNANDOHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERNANDOHELP,"Fernando mi dal dopis hned, jak jsem donesl knihu.");
};