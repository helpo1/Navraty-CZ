
instance DIA_BAALTYON_EXIT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 999;
	condition = dia_baaltyon_exit_condition;
	information = dia_baaltyon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baaltyon_exit_condition()
{
	return TRUE;
};

func void dia_baaltyon_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baaltyon_PICKPOCKET(C_Info)
{
	npc = gur_8003_tyon;
	nr = 900;
	condition = dia_baaltyon_PICKPOCKET_Condition;
	information = dia_baaltyon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baaltyon_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void dia_baaltyon_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
	Info_AddChoice(dia_baaltyon_PICKPOCKET,Dialog_Back,dia_baaltyon_PICKPOCKET_BACK);
	Info_AddChoice(dia_baaltyon_PICKPOCKET,DIALOG_PICKPOCKET,dia_baaltyon_PICKPOCKET_DoIt);
};

func void dia_baaltyon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
};

func void dia_baaltyon_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
};


instance DIA_BAALTYON_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_notalk_sleeper_condition;
	information = dia_baaltyon_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Spáč s tebou!";
};


func int dia_baaltyon_notalk_sleeper_condition()
{
	if((IDOLTYON_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_01_00");	//Spáč s tebou!
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};

instance DIA_BAALTYON_NOTALK_IMP(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_notalk_imp_condition;
	information = dia_baaltyon_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Je všechno v pořádku, příteli?";
};

func int dia_baaltyon_notalk_imp_condition()
{
	if((IDOLTYON_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Imp_01_00");	//Je všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALTYON_ABOUTRECEPT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_aboutrecept_condition;
	information = dia_baaltyon_aboutrecept_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_baaltyon_aboutrecept_condition()
{
	if((IDOLTYON_YES == FALSE) && (PSI_TALK == TRUE) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baaltyon_aboutrecept_info()
{
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_00");	//Ty jsi ten nový, který si přeje vstoupit do Bratrstva?
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_01");	//Ty jsi ke mně začal mluvit? Ale proč?...
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_02");	//Jsem ochoten dát ti souhlas. Ale první chci, abys mi dokázal, že za něco stojíš.
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_03");	//Co pro tebe můžu udělat, mistře?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_04");	//Jak sis mohl všimnout, mým úkolem je připravovat magické a léčivé lektvary.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_05");	//Existuje jeden vzácný lektvar. Který bych chtěl vyzkoušet.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_06");	//Zaslechl jsem, že jeden alchymista, žijící v těhle končinách má recept na tento velmi zajímavý lektvar.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_07");	//Tento lektvar může zvýšit vnímání člověka, který se ho napije. Jak? Netuším.
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_09");	//Chceš, abych ho někde splašil?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_10");	//Ano. Pochopil jsi přesně co po tobě chci. Pokud to dokážeš udělat dám ti svůj souhlas.
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_11");	//A nevíš, který alchymista má tento recept?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_12");	//Kdybych to věděl, tak bych se tě o pomoc neprosil.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_13");	//Časem se všechno vyjasní.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_14");	//Vrať se až získáš ten recept. Potom si promluvíme o tvém vstupu do Bratrstva.
	IDOLTYON_YES = TRUE;
	Log_CreateTopic(TOPIC_RECEPTFORTYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RECEPTFORTYON,LOG_Running);
	B_LogEntry(TOPIC_RECEPTFORTYON,"Baala Tyona zajímá jeden neobvyklý elixír. Tvrdí, že na tomto ostrově žije alchymista, který zná recept. Musím získat tento recept pro Baala Tyona. Pak souhlasí se vstupem do Bratrstva.");
	MIS_RECEPTFORTYON = LOG_Running;
};


instance DIA_BAALTYON_GOTRECEPT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_gotrecept_condition;
	information = dia_baaltyon_gotrecept_info;
	permanent = FALSE;
	important = FALSE;
	description = "Donesl jsem ti ten recept.";
};


func int dia_baaltyon_gotrecept_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (Npc_HasItems(other,itwr_tyonrecept) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_gotrecept_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalTyon_GotRecept_01_00");	//Donesl jsem ti ten recept, o který jsi mě žádal.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_01");	//Nech mě podívat!... (nedočkavě)
	if(B_GiveInvItems(other,self,itwr_tyonrecept,1))
	{
		Npc_RemoveInvItems(self,itwr_tyonrecept,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_02");	//Mmm... Ano! To musí být on! Podivné indgredience... (prozkoumává recept)
	AI_Output(other,self,"DIA_BaalTyon_GotRecept_01_03");	//Mistře, mohu dostat vaše svolení se vstupem do Bratrstva?
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_04");	//(neposlouchá) abych to namíchal, potřebuju velmi vzácné věci...
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_05");	//Obávám se, že toho tady nemám ani polovinu z toho, co bych potřeboval.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_06");	//Musím tě požádat ještě o jednu maličkost. Vyřeš ji a máš můj souhlas v kapse.
	AI_Output(other,self,"DIA_BaalTyon_GotRecept_01_07");	//Co mám pro tebe udělat tentokrát? (odevzdaně)
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_08");	//Vše je velmi jednoduché. Dám ti seznam s ingrediencemi, které mi momentálně chybí.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_09");	//Ty mi je všechny doneseš.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_10");	//Tady, vezmi si tento papír. Na něm najdeš vše potřebné.
	B_GiveInvItems(self,other,itwr_tyonlist,1);
	B_LogEntry(TOPIC_RECEPTFORTYON,"Baal Tyon mi dal další úkol. Mám mu sehnat nějaké přísady do toho podivného receptu. Doufám, že pak mi dá konečně svůj souhlas.");
};


instance DIA_BAALTYON_GIVEMEPOITION(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_givemepoition_condition;
	information = dia_baaltyon_givemepoition_info;
	permanent = FALSE;
	important = FALSE;
	description = "A na co přesně je tento elixír?";
};


func int dia_baaltyon_givemepoition_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && Npc_KnowsInfo(other,dia_baaltyon_gotrecept))
	{
		return TRUE;
	};
};

func void dia_baaltyon_givemepoition_info()
{
	AI_Output(other,self,"DIA_BaalTyon_GiveMeRecept_01_00");	//A na co přesně je tento elixír?
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_01");	//Dle tohoto receptu a podle přísad jsem schopen odhadnout, že zvyšuje magickou energii!
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_02");	//Nejsem si samozřejmě stoprocentně jistý, jak bude fungovat.
	AI_Output(other,self,"DIA_BaalTyon_GiveMeRecept_01_03");	//Mohl bys takovýto lektvar namíchat i pro mě?
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_04");	//No... budu potřebovat někoho, kdo vyzkouší tento elixír.
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_05");	//Jistě, jsou tu jistá rizika. Tento lektvar tě může poznamenat na celý život!
};


instance DIA_BAALTYON_GIVEINGRIDIENTS(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_giveingridients_condition;
	information = dia_baaltyon_giveingridients_info;
	permanent = FALSE;
	important = FALSE;
	description = "Donesl jsem ti přísady na tvůj elixír.";
};


func int dia_baaltyon_giveingridients_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && Npc_KnowsInfo(other,dia_baaltyon_gotrecept) && (Npc_HasItems(other,itat_crawlerqueen) >= 1) && (Npc_HasItems(other,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(other,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_giveingridients_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalTyon_GiveIngridients_01_00");	//Donesl jsem ti přísady na tvůj elixír.
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_01");	//Ukaž mi je.
	B_GiveInvItems(other,self,itat_crawlerqueen,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0A");	//Ano, ano... vejce důlního červa...
	B_GiveInvItems(other,self,ItAt_StoneGolemHeart,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0B");	//... srdce kamenného golema - tady je...
	B_GiveInvItems(other,self,ItAt_WaranFiretongue,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0C");	//... jazyk ohnivého ještěra...
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0D");	//... a královský šťovík...
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_02");	//Hmm... vypadá to, že jsi mi donesl všechno, co jsem chtěl.
	AI_Output(other,self,"DIA_BaalTyon_GiveIngridients_01_03");	//Doufám, že mi nyní dáte svůj souhlas, mistře?
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_04");	//Ano, pracoval jsi velmi dobře pro Bratrstvo! Myslím, že by ses měl stát jedním z nás!
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_05");	//Běž za Baal Orunem a řekni mu o tom.
	B_LogEntry(TOPIC_RECEPTFORTYON,"Baal Tyon prohlásil, že lidé jako já by byli velmi užiteční Bratrstvu. Tedy mi dal svůj souhlas.");
	MIS_RECEPTFORTYON = LOG_SUCCESS;
	TYONAGREED = TRUE;
};

instance DIA_BaalTyon_Mandibuls(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = DIA_BaalTyon_Mandibuls_condition;
	information = DIA_BaalTyon_Mandibuls_info;
	permanent = FALSE;
	description = "Jsou pro mě nějaké další úkoly?";
};


func int DIA_BaalTyon_Mandibuls_condition()
{
	if(MIS_RECEPTFORTYON == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_BaalTyon_Mandibuls_info()
{
	AI_Output(other,self,"DIA_BaalTyon_Mandibuls_01_00");	//Jsou pro mě nějaké další úkoly?
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_01");	//Ano. Dobře že se ptáš.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_02");	//Asi si vzpomínáš na to že jsme neustále měli nedostatek čelistí z důních červů.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_03");	//Sekret z jejich žláz byl nepostradatelný. Díky němu jsme mohli míchat lekvary které pomáhali novicům zvýšit sílu jejich ducha.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_04");	//Ale nyní jsme ztratili tento zdroj. Budeme muset najít alternativu.
	AI_Output(other,self,"DIA_BaalTyon_Mandibuls_01_05");	//Nemůžete najít doupě červů?
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_06");	//Tady, mimo údolí jich není dost abychom mohli obnovit naše rozsáhlé experimenty.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_07");	//Ale naštěstí zde lze nalézt jiné bestie, které bychom mohli využít.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_08");	//Místní farmáři jim říkají, polní škůdci. Pár jich zabij a přines mi jejich kusadla.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_09");	//Řekněme, pět kousků.
	MIS_TyonMandibuls = LOG_Running;
	Log_CreateTopic(TOPIC_TyonMandibuls,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TyonMandibuls,LOG_Running);
	B_LogEntry(TOPIC_TyonMandibuls,"Baal Tyon chce přinést pět kusadel polních škůdců. To bude snadné.");
};

instance DIA_BaalTyon_Mandibuls_Done(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = DIA_BaalTyon_Mandibuls_Done_condition;
	information = DIA_BaalTyon_Mandibuls_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem kusadla.";
};

func int DIA_BaalTyon_Mandibuls_Done_condition()
{
	if((MIS_TyonMandibuls == LOG_Running) && (Npc_HasItems(other,ItAt_BugMandibles) >= 5))
	{
		return TRUE;
	};
};

func void DIA_BaalTyon_Mandibuls_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_BaalTyon_Mandibuls_Done_01_00");	//Přinesl jsem kusadla.
	B_GiveInvItems(other,self,ItAt_BugMandibles,5);
	Npc_RemoveInvItems(self,ItAt_BugMandibles,5);
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_Done_01_01");	//Zdá se, že jsou v dokonalém pořádku a samotné žlázy jsou téměř nepoškozené.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_Done_01_02");	//Myslím že bude trvat než prozkoumám jejich vlastnosti. 
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_Done_01_03");	//Dobrá práce! Vezmi si pár stébel...
	B_GiveInvItems(self,other,ItPl_SwampHerb,5);
	MIS_TyonMandibuls = LOG_Success;
	Log_SetTopicStatus(TOPIC_TyonMandibuls,LOG_Success);
	B_LogEntry(TOPIC_TyonMandibuls,"Donesl jsem Baalu Tyonovi kusadla důlních červů.");
};

instance DIA_BAALTYON_TESTPOTIONME(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_testpotionme_condition;
	information = dia_baaltyon_testpotionme_info;
	permanent = TRUE;
	important = FALSE;
	description = "O tom tvém elixíru...";
};


func int dia_baaltyon_testpotionme_condition()
{
	if((MIS_RECEPTFORTYON == LOG_SUCCESS) && (TYONAGREED == TRUE) && Npc_KnowsInfo(other,dia_baaltyon_givemepoition) && (TYONGIVEPOTION == FALSE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_testpotionme_info()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(BAALTYON_STEW_DAY_ONCE == FALSE)
	{
		BAALTYON_STEW_DAY = Wld_GetDay();
		BAALTYON_STEW_DAY_ONCE = TRUE;
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_00");	//O tom tvém elixíru...
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_01");	//Ano? Na co se chceš zeptat?
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_02");	//Přemýšlel jsem o tom. Mohl bych ho vyzkoušet?
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_04");	//Ano, dám ti ochutnat toho lektvaru. Ale ještě jsem ani nezačal s přípravou.
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_05");	//A kdy bude hotový?
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_06");	//Přijď zítra po poledni. To už by měl být hotový.
	}
	else if(BAALTYON_STEW_DAY < daynow)
	{
		if((BAALTYON_STEW_DAY > 0) && (Wld_IsTime(12,0,23,59) || (BAALTYON_STEW_DAY < (daynow - 1))))
		{
			AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_07");	//O tom tvém elixíru... Je už hotový?
			AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_08");	//Ano, je připravený. Řeknu ti, takhle složitý elixír jsem ještě nemíchal!
			AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_09");	//Takže ho můžu ochutnat?
			AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_10");	//Zas tak moc se do toho nežeň. Je možné, že to bude mít všemožné vedlejší účinky.
			AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_11");	//Jsi si opravdu jistý, že to chceš risknout?!
			Info_ClearChoices(dia_baaltyon_testpotionme);
			Info_AddChoice(dia_baaltyon_testpotionme,"Ne, raději ne.",dia_baaltyon_testpotionme_no);
			Info_AddChoice(dia_baaltyon_testpotionme,"Ano, chci to ochutnat!",dia_baaltyon_testpotionme_yes);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_12");	//O tom tvém elixíru...
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_13");	//Řekl jsem ti to snad jasně! Zítra po poledni!
	};
};

func void dia_baaltyon_testpotionme_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_00");	//Ano, chci ho vyzkoušet.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_01");	//Dobře, tady je. Ještě je teplý!
	B_UseItem(other,itpo_tyonpotion);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_02");	//Wow!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_0A");	//Skvělý!
	AI_PlayAni(other,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_03");	//No, jak se cítíš?!
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_04");	//Cítím se tak trochu divně...
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_05");	//Hrozně se mi točí hlava...
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_06");	//Cítíš nějaké zvýšení tvé magické energie?!
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_07");	//Má magická energie se zvýšila!
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_08");	//To je úžasné! To je přesně to, vco jsem doufal!
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_09");	//Takže experiment se povedl! (s úsměvem)
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_10");	//Mohl bys mi prozradit tajemství tohoto lektvaru?
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_11");	//Něco takového je jen pro členy Bratrstva!
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_12");	//Myslím, že ti byla dost jedna porce... Mimo to, na to ani nemáš schopnosti.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_13");	//Tak na to zapomeň! A teď běž, musím se soustředit na své experimenty.
	TYONGIVEPOTION = TRUE;
	Info_ClearChoices(dia_baaltyon_testpotionme);
	AI_StopProcessInfos(self);
};

func void dia_baaltyon_testpotionme_no()
{
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_No_01_00");	//Rozmyslel jsem si to...
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_No_01_01");	//Dobře, tvé rozhodnutí. Otestuji to na někom jiném.
	TYONGIVEPOTION = TRUE;
	Info_ClearChoices(dia_baaltyon_testpotionme);
};


instance DIA_BAALTYON_ABOUTEXPERIMENTS(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_aboutexperiments_condition;
	information = dia_baaltyon_aboutexperiments_info;
	permanent = FALSE;
	description = "Pověz mi něco o tvých experimentech.";
};


func int dia_baaltyon_aboutexperiments_condition()
{
	if((IDOLTYON_YES == TRUE) && Npc_KnowsInfo(other,dia_baaltyon_aboutrecept) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_aboutexperiments_info()
{
	AI_Output(other,self,"DIA_BaalTyon_AboutExperiments_01_00");	//Pověz mi něco o tvých experimentech.
	AI_Output(self,other,"DIA_BaalTyon_AboutExperiments_01_01");	//Mé experimenty jsou na takové úrovni, že jsou mimo tvé chápání, chlapče. Neplýtvej mým časem.
};


instance DIA_BAALTYON_CANTEACH(C_Info)
{
	npc = gur_8003_tyon;
	nr = 10;
	condition = dia_baaltyon_canteach_condition;
	information = dia_baaltyon_canteach_info;
	permanent = FALSE;
	description = "Můžeš mě zasvětit do tajů alchymie?";
};

func int dia_baaltyon_canteach_condition()
{
	if((other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baaltyon_canteach_info()
{
	AI_Output(other,self,"DIA_BaalTyon_CanTeach_01_00");	//Můžeš mě zasvětit do tajů alchymie?

	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_01");	//Hmmm... (překvapeně) Ty si přeješ pochopit tajemnou podstatu přípravy lektvarů?
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_02");	//Pro jednomu z našich bratrů bez zaváhání prozradím naše tajemství.
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_03");	//Ale pro tohle, budeš potřebovat nějaké zkušenosti.

		if(other.guild == GIL_SEK)
		{
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_04");	//To, jestli tě naučím ty nejmocnější lektvary ale záleží i na tvém postavení v Bratrstvu.
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_05");	//Pouze ti nejdůvěryhodnější si zaslouží znát tato tajemství!
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_06");	//Pokud se staneš jedním z templářů, pak tě naučím lektvary síly a obratnosti, pokud jedním z Guru, pak tě naučím lektvary života a ducha. Ale čeká na tebe ještě dlouhá cesta, chlapče.
		}
		else
		{
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_07");	//Tvoje postavení v Bratrstvu je dostatečně vysoké - mohl bych tě naučit přípravu složitějších lektvarů.
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_08");	//Sílu, obratnost, nebo si zvolíš moudro jako Guru - moudrost a životní sílu.
		};
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_09");	//Ale tvá volba je samozřejmě na tobě.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_10");	//Ty nepatříš mezi nás. Raději na to zapomeň!
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_11");	//Nebudu tě učit.
	};
};


instance DIA_BAALTYON_TEACH(C_Info)
{
	npc = gur_8003_tyon;
	nr = 10;
	condition = dia_baaltyon_teach_condition;
	information = dia_baaltyon_teach_info;
	permanent = TRUE;
	description = "Nauč mě vařit lektvary.";
};


func int dia_baaltyon_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_baaltyon_canteach) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_teach_info()
{
	AI_Output(other,self,"DIA_BaalTyon_TEACH_15_00");	//Nauč mě vařit lektvary.
	AI_Output(self,other,"DIA_BaalTyon_TEACH_01_01");	//Co chceš vědět?
	Info_ClearChoices(dia_baaltyon_teach);
	Info_AddChoice(dia_baaltyon_teach,Dialog_Back,dia_baaltyon_teach_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_baaltyon_teach_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_baaltyon_teach_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_baaltyon_teach_health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (other.guild == GIL_GUR))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_baaltyon_teach_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_baaltyon_teach_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_baaltyon_teach_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_baaltyon_teach_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (other.guild == GIL_GUR))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_baaltyon_teach_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) && (other.guild == GIL_TPL))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Elixír síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),dia_baaltyon_teach_permstr);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE) && (other.guild == GIL_TPL))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Elixír obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),dia_baaltyon_teach_permdex);
	};
};

func void dia_baaltyon_teach_back()
{
	Info_ClearChoices(dia_baaltyon_teach);
};

func void dia_baaltyon_teach_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_baaltyon_teach_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_baaltyon_teach_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_baaltyon_teach_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_baaltyon_teach_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_baaltyon_teach_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_baaltyon_teach_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_baaltyon_teach_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void dia_baaltyon_teach_permstr()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void dia_baaltyon_teach_permdex()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};


instance DIA_BAALTYON_CANTRADE(C_Info)
{
	npc = gur_8003_tyon;
	nr = 99;
	condition = dia_baaltyon_cantrade_condition;
	information = dia_baaltyon_cantrade_info;
	permanent = FALSE;
	description = "Baal Orun mi řekl, že prodáváš magické svitky.";
};


func int dia_baaltyon_cantrade_condition()
{
	if((BAALTYON_CANTRADE == TRUE) && (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baaltyon_cantrade_info()
{
	AI_Output(other,self,"DIA_BaalTyon_CanTrade_01_01");	//Baal Orun mi řekl, že prodáváš magické svitky.
	AI_Output(self,other,"DIA_BaalTyon_CanTrade_01_02");	//Ano, prodávám svitky se Spáčovou magií, ale jen Guru.
	AI_Output(other,self,"DIA_BaalTyon_CanTrade_01_03");	//Jak vidíš, tak já též patřím mezi Guru. Můžeš mi nějaké prodat?
	AI_Output(self,other,"DIA_BaalTyon_CanTrade_01_04");	//Co je to za otázku? Jistěže můžu. Ale moc jich nemám.
	AI_Output(self,other,"DIA_BaalTyon_CanTrade_01_05");	//Tedy je používej moudře.
};

var int SixCircle;

instance DIA_BAALTYON_TRADE(C_Info)
{
	npc = gur_8003_tyon;
	nr = 99;
	condition = dia_baaltyon_trade_condition;
	information = dia_baaltyon_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své magické svitky.";
};


func int dia_baaltyon_trade_condition()
{
	if((BAALTYON_CANTRADE == TRUE) && (other.guild == GIL_GUR) && Npc_KnowsInfo(other,dia_baaltyon_cantrade) && Wld_IsTime(9,0,20,0))
	{
		return TRUE;
	};
};

func void dia_baaltyon_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_BaalTyon_Trade_01_01");	//Ukaž mi své magické svitky.

	if((GurBelt_01 == FALSE) && (hero.guild == GIL_GUR))
	{
		CreateInvItems(self,ItBE_Addon_GUR_01,1);
		GurBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);

	if((PLAYER_TALENT_RUNES[SPL_GuruWrath] == TRUE) && (SixCircle == FALSE))
	{	
		CreateInvItems(self,itwr_GuruWrath,1);
		SixCircle = TRUE;
	};
};


instance DIA_BAALTYON_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_runemagicnotwork_condition;
	information = dia_baaltyon_runemagicnotwork_info;
	permanent = FALSE;
	description = "Fungují tvé runy?";
};


func int dia_baaltyon_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalTyon_RuneMagicNotWork_01_00");	//Fungují tvé runy?
	AI_Output(self,other,"DIA_BaalTyon_RuneMagicNotWork_01_01");	//Bohužel, naše runy zeslábli. A už je nelze používat! (smutně)
	AI_Output(self,other,"DIA_BaalTyon_RuneMagicNotWork_01_02");	//Všechny nás to hrozně moc překvapilo, ale nemůžeme s tím nic udělat.
	AI_Output(self,other,"DIA_BaalTyon_RuneMagicNotWork_01_03");	//Nemohu nic jiného, než souhlasit.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Ani Guru Bratrstva už svou runovou magií nevládnou.");
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BAALTYON_LOKIPOTION(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LOKIPOTION_condition;
	information = dia_baaltyon_LOKIPOTION_info;
	important = FALSE;
	description = "Potřebuji speciální lektvar.";
};

func int dia_baaltyon_LOKIPOTION_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (LokiNeedMemory == TRUE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LOKIPOTION_info()
{
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_00");	//Potřebuji speciální lektvar!
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_01");	//Co přesně potřebuješ?
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_02");	//Lektvar, který je schopen oživit vzpomínky... Máš takový?
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_03");	//Hmmm... (zamyšleně) Bohužel ne.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_04");	//Ale když mi přineseš všechny potřebné ingredience, mohl bych ho pro tebe namíchat...
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_05");	//Proč ho potřebuješ?
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_06");	//Není pro mě, ale pro jednoho novice.
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_07");	//Je třeba obnovit jeho paměť, je to velmi důležité.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_08");	//Chápu. (vážně) No, tak poslouchej a zapamatuj si co potřebujem...
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_09");	//Poslouchám...
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_10");	//Takže, nejprve je potřeba svazek bažinné trávy. Tři stonky by měli stačit.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_11");	//Pak budu potřebovat jeden elixír ducha, královský šťovík, dvě léčivé rostliny, pět čelistí důlního červa, vodu...
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_12");	//... a nakonec, poslední složkou na mém seznamu - kaktusový květ!
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_13");	//Jsem si jistý, že nebudeš mít problém to všechno sehnat. No, možná s výjimkou posledního komponentu.
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_14");	//Na to jsem se chtěl zeptat - kde ho najít?
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_15");	//Dobrá otázka. (zamyšleně) Problémem je, že tato rostlina roste pouze při vysokých teplotách a v suchém podnebí.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_16");	//Slyšel jsem, že v poušti Varant tato rostlina není taková rarita.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_17");	//Ale samozřejmě, dostat se tam teď není možné.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_18");	//Takže zkus ho hledat na ostrově... Nevím.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_19");	//Zkus se zeptat jiných alchymistů. Možná, že někdo ti pomůže s jeho hledáním.
	SeekCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Baal Tyon ví jak připravit lektvar, který je schopen obnovit paměť člověka. Potřebuje 3 stonky trávy, jeden elixír ducha, královský šťovík, dvě léčivé rostliny, pět čelistí důlního červa, vodu a... Kaktusový květ - poradil mi, abych se obrátil na jiný alchymisty.");
};

instance DIA_BAALTYON_LokiPotion_Ready(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LokiPotion_Ready_condition;
	information = dia_baaltyon_LokiPotion_Ready_info;
	important = FALSE;
	description = "Mám všechny ingredience.";
};

func int dia_baaltyon_LokiPotion_Ready_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (Npc_HasItems(other,ItPl_CactusFlower) >= 1) && (Npc_HasItems(other,ItPl_SwampHerb) >= 3) && (Npc_HasItems(other,ItPo_Perm_Mana) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1) && (Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItAt_CrawlerMandibles) >= 5) && (Npc_HasItems(other,ItMi_Aquamarine) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LokiPotion_Ready_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Ready_01_00");	//Mám všechny ingredience.
	AI_Output(self,other,"DIA_BaalTyon_LokiPotion_Ready_01_01");	//Dobře. Dej mi je, a já začnu připravovat lektvar.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_CactusFlower,1);
	Npc_RemoveInvItems(other,ItPl_SwampHerb,3);
	Npc_RemoveInvItems(other,ItPo_Perm_Mana,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,5);
	Npc_RemoveInvItems(other,ItMi_Aquamarine,1);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Ready_01_02");	//Kolik dnů ti to potrvá?
	AI_Output(self,other,"DIA_BaalTyon_LokiPotion_Ready_01_03");	//Alespoň pár dní, protože recept je neuvěřitelně složitý.
	TyonPotionResearchDayEnd = Wld_GetDay();
	B_LogEntry(TOPIC_PrioratStart,"Přinesl jsem všechny potřebné ingredience. Nyní Guru může začít vytvářet lektvar vzpomínek. Podle něj bude celý proces vaření trvat minimálně jeden den.");
};

instance DIA_BAALTYON_LokiPotion_Done(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LokiPotion_Done_condition;
	information = dia_baaltyon_LokiPotion_Done_info;
	important = FALSE;
	description = "Jak se má můj lektvar?";
};

func int dia_baaltyon_LokiPotion_Done_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (TyonPotionResearchDayEnd > 0) && (TyonPotionResearchDayEnd <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LokiPotion_Done_info()
{
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Done_01_00");	//Jak se má můj lektvar?
	AI_Output(self,other,"DIA_BaalTyon_LokiPotion_Done_01_01");	//Je připraven. Můžeš si ho vzít.
	B_GiveInvItems(self,other,ItPo_Memories,1);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Done_01_02");	//Děkuji.
	B_LogEntry(TOPIC_PrioratStart,"Lektvar vzpomínek je připraven. Nyní ho můzem použít na novice, který zapomněl na informace, které já potřebuji.");
};