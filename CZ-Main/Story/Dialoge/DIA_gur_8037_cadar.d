
instance DIA_BAALCADAR_EXIT(C_Info)
{
	npc = gur_8037_cadar;
	nr = 999;
	condition = dia_baalcadar_exit_condition;
	information = dia_baalcadar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_baalcadar_exit_condition()
{
	return TRUE;
};

func void dia_baalcadar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baalcadar_PICKPOCKET(C_Info)
{
	npc = gur_8037_cadar;
	nr = 900;
	condition = dia_baalcadar_PICKPOCKET_Condition;
	information = dia_baalcadar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baalcadar_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_baalcadar_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
	Info_AddChoice(dia_baalcadar_PICKPOCKET,Dialog_Back,dia_baalcadar_PICKPOCKET_BACK);
	Info_AddChoice(dia_baalcadar_PICKPOCKET,DIALOG_PICKPOCKET,dia_baalcadar_PICKPOCKET_DoIt);
};

func void dia_baalcadar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
};

func void dia_baalcadar_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
};

instance DIA_BAALCADAR_NO_TALK(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_no_talk_condition;
	information = dia_baalcadar_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalcadar_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_baalcadar_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	B_Attack(self,other,AR_GuardCalledToKill,1);
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_notalk_sleeper_condition;
	information = dia_baalcadar_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Spáč s tebou.";
};


func int dia_baalcadar_notalk_sleeper_condition()
{
	if((IDOLTYON_YES == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_01_00");	//Spáč s tebou.
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_NOTALK_IMP(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_notalk_imp_condition;
	information = dia_baalcadar_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Je vše v pořádku?";
};


func int dia_baalcadar_notalk_imp_condition()
{
	if((IDOLCADAR_YES == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_01_00");	//Je vše v pořádku?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_AUFGABE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_aufgabe_condition;
	information = dia_baalcadar_aufgabe_info;
	permanent = FALSE;
	description = "(dát trávu z bažin)";
};


func int dia_baalcadar_aufgabe_condition()
{
	if((MIS_CAINSENTTOCADAR == LOG_Running) && (IDOLCADAR_YES == FALSE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (Npc_HasItems(other,ItPl_SwampHerb) >= 50) && Wld_IsTime(8,0,21,0))
	{
		return TRUE;
	};
};

func void dia_baalcadar_aufgabe_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_BaalCadar_Aufgabe_01_00");	//Donesl jsem ti denní dávku trávy z bažin.
	B_GiveInvItems(other,self,ItPl_SwampHerb,50);
	Npc_RemoveInvItems(self,ItPl_SwampHerb,50);
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(povzdech)
	IDOLCADAR_YES = TRUE;
	Log_SetTopicStatus(TOPIC_CAINSENTTOCADAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_CAINSENTTOCADAR,"Dal jsem drogu Baalovi Cadarovi.");
	MIS_CAINSENTTOCADAR = LOG_SUCCESS;
};


instance DIA_BAALCADAR_HELPME(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_helpme_condition;
	information = dia_baalcadar_helpme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalcadar_helpme_condition()
{
	if((MIS_CAINSENTTOCADAR == LOG_SUCCESS) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (IDOLCADAR_YES == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_helpme_info()
{
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_00");	//Počkat, novici!
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_01");	//Udělal jsi malou službu našim sběračům.
	AI_Output(other,self,"DIA_BaalCadar_HelpMe_01_02");	//Co pro vás mohu udělat pane?
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_03");	//Jak jsi již jistě zjistil, tak jedním z našich úkolů je sbírat trávu z bažin.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_04");	//Bohužel, tato rostlina neroste všude.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_05");	//A to co sesbírá Caine s novici, zde blízko tábora, nám bohužel nestačí.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_06");	//Proto mimo ně jsou zde i jiné skupiny sběračů. Je pro mě důležité, abys donesl další dodávku.
	AI_Output(other,self,"DIA_BaalCadar_HelpMe_01_07");	//Kde najdu tyto sběrače?
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_08");	//To ti nemohu říct. Budeš je muset první najít. Dlouho o nich nemáme žádné zprávy.
	AI_Output(other,self,"DIA_BaalCadar_HelpMe_01_09");	//A jak sběrači poznají, že mají dát trávu právě mně?
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_10");	//Velmi jednoduše. Baal Orun mi prozradil, že máš roušku Bratrstva.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_11");	//Myslím, že pokud budeš vypadat stejně, jako naši novici, pak nebudou pochybovat!
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_12");	//Vrať se, až budeš mít vše hotovo.
	Log_CreateTopic(TOPIC_PLANTSFORBAALCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PLANTSFORBAALCADAR,LOG_Running);
	B_LogEntry(TOPIC_PLANTSFORBAALCADAR,"Baal Cadar mě požádal, abych mu donesl trávu od ostatních skupin sběračů. Na můj dotaz, kde je najdu mi odpověděl, že mi to nemůže prozradit. Asi je budu muset prostě najít.");
	MIS_PLANTSFORBAALCADAR = LOG_Running;
};


instance DIA_BAALCADAR_ZUSTIMMUNG(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_zustimmung_condition;
	information = dia_baalcadar_zustimmung_info;
	permanent = TRUE;
	description = "Donesl jsem trávu od sběračů.";
};


func int dia_baalcadar_zustimmung_condition()
{
	if((other.guild == GIL_SEK) && (MIS_PLANTSFORBAALCADAR == LOG_Running) && ((FIRSTGROUPSEK == TRUE) || (SEKONGROUPSEK == TRUE) || (THIRDGROUPSEK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_zustimmung_info()
{
	AI_Output(other,self,"DIA_BaalCadar_Zustimmung_01_00");	//Donesl jsem trávu od sběračů.

	if((FIRSTGROUPSEK == TRUE) && (SEKONGROUPSEK == TRUE) && (THIRDGROUPSEK == TRUE) && (Npc_HasItems(other,ItPl_SwampHerb) >= 200))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_01");	//Úžasné. Dej ji sem, ať se můžu podívat!
		B_GiveInvItems(other,self,ItPl_SwampHerb,200);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,200);
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_02");	//Ano, naši sběrači pracují tvrdě!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_04");	//Už dlouho jsem neviděl tak velkou úrodu!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_07");	//Dobře! Tvá víra v Bratrstvo je nezpochybnitelná!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_08");	//Běž za Baalem Orunem a řekni mu, že jsem tě shledal opravdu věřícím!
		Log_SetTopicStatus(TOPIC_PLANTSFORBAALCADAR,LOG_SUCCESS);
		B_LogEntry(TOPIC_PLANTSFORBAALCADAR,"Donesl jsem Baalovi Cadarovi celou hromadu trávy od sběračů. Byl velmi šťastný a ke všemu ještě překvapený tím, kolik jí bylo!");
		B_LogEntry_Quiet(TOPIC_PSICAMPJOIN,"Baal Cadar je přesvědčen, že má víra v Bratrstvo je dostatečná. Mám jeho hlas.");
		MIS_PLANTSFORBAALCADAR = LOG_SUCCESS;
		CADARAGREED = TRUE;
	}
	else if((FIRSTGROUPSEK == TRUE) && (SEKONGROUPSEK == TRUE) && (THIRDGROUPSEK == TRUE))
	{
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_09");	//To není zrovna moc, myslím, že se mě snažíš obelstít...
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_10");	//Zdá se mi, že jsi navštívil všechny sběrače, vzal sis naši drogu a pak si ji nechal!... (vztekle)
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_13");	//A ty si myslíš, že ti to uvěřím?!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_14");	//Jsi hlubokým zklamáním!... (vztekle)
		AI_StopProcessInfos(self);
		B_LogEntry_Failed(TOPIC_PLANTSFORBAALCADAR);
		MIS_PLANTSFORBAALCADAR = LOG_FAILED;
		IDOLCADAR_YES = FALSE;
		IDOLCADAR_NOFOREVER = TRUE;
		B_Attack(self,other,AR_GuardCalledToKill,1);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_15");	//Nemyslím si, že to je všechna tráva z bažin. Ještě jsi nenavštívil všechny sběrače.
	};
};


instance DIA_BAALCADAR_NOFOREVER(C_Info)
{
	npc = gur_8037_cadar;
	nr = 5;
	condition = dia_baalcadar_noforever_condition;
	information = dia_baalcadar_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalcadar_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IDOLCADAR_NOFOREVER == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_noforever_info()
{
	AI_Output(self,other,"DIA_BaalCadar_NoForever_01_00");	//Kliď se mi z očí!...
	IDOLCADAR_NOFOREVER = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_PERM(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_perm_condition;
	information = dia_baalcadar_perm_info;
	permanent = TRUE;
	description = "Jak pokračuje zpracovávání bažinné trávy?";
};


func int dia_baalcadar_perm_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_SUCCESS) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_perm_info()
{
	AI_Output(other,self,"DIA_BaalCadar_Perm_01_00");	//Jak pokračuje zpracovávání bažinné trávy?
	AI_Output(self,other,"DIA_BaalCadar_Perm_01_01");	//Každý z našich pracovníků pracuje na hranicích svých možností. Díky tomu máme již dostatek pro naše vlastní potřeby. Dokonce už začínáme prodávat.
};


instance DIA_BAALCADAR_PRETEACH(C_Info)
{
	npc = gur_8037_cadar;
	nr = 23;
	condition = dia_baalcadar_preteach_condition;
	information = dia_baalcadar_preteach_info;
	permanent = FALSE;
	description = "Poslal mě za tebou Baal Orun...";
};


func int dia_baalcadar_preteach_condition()
{
	if((BAALCADAR_TEACHMANA == TRUE) && (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baalcadar_preteach_info()
{
	AI_Output(other,self,"DIA_BaalCadar_PreTeach_15_00");	//Poslal mě za tebou Baal Orun...
	AI_Output(other,self,"DIA_BaalCadar_PreTeach_05_01");	//Řekl mi, že mi pomůžeš zvýšit mou magickou sílu.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_02");	//Jsi jeden z nás, proto bude mým potěšením, učit tě...
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_03");	//Magická energie, nebo jednoduše řečeno - mana, je důležitá pro každého mága.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_04");	//Používámě ji k vytváření kouzel, či používání run. Ale není bez hranic!
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_05");	//Tedy abys to dobře pochopil, ke zvýšení tvých schopností mága, musíš zvýšit i svou magickou energii. A i tehdy ji nesmíš používat unáhleně.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_06");	//Pouze pak se staneš opravdovým mágem!
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_07");	//Jak sis všiml, mnoho z noviců sedí u vodní dýmky.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_08");	//Pro Guru - to je hlavní způsob jak poznávat svět ale aj doplňovat magickou energii!
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_09");	//Dobrá tráva ve vodní dýmce, měřne utlačeno - co by mohlo být lepší jak tenhle způsob poznávaní světa?
};


instance DIA_BAALCADAR_TEACH_MANA(C_Info)
{
	npc = gur_8037_cadar;
	nr = 10;
	condition = dia_baalcadar_teach_mana_condition;
	information = dia_baalcadar_teach_mana_info;
	permanent = TRUE;
	description = "Přál bych si zvýšit svou magickou energii.";
};


func int dia_baalcadar_teach_mana_condition()
{
	if((other.guild == GIL_GUR) && (BAALORUN_TEACHMANA == FALSE) && (BAALCADAR_TEACHMANA == TRUE) && Npc_KnowsInfo(other,dia_baalcadar_preteach))
	{
		return TRUE;
	};
};

func void dia_baalcadar_teach_mana_info()
{
	AI_Output(other,self,"DIA_BaalCadar_TEACH_MANA_15_00");	//Přál bych si zvýšit svou magickou energii.
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};

func void dia_baalcadar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_EVER)
	{
		AI_Output(self,other,"DIA_BaalCadar_TEACH_MANA_05_00");	//Tvá magická síla se zvětšila. Už ti nemohu pomoci.
		AI_Output(self,other,"DIA_BaalCadar_TEACH_MANA_05_01");	//Pokud se chceš naučit víc, běž za Baalem Orunem. Ten ti pomůže!
		BAALORUN_TEACHMANA = TRUE;
	};
	Info_ClearChoices(dia_baalcadar_teach_mana);
};

func void dia_baalcadar_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_EVER);
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};

func void dia_baalcadar_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_EVER);
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};


instance DIA_BAALCADAR_BRINGCALOMRECEIPTE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_bringcalomreceipte_condition;
	information = dia_baalcadar_bringcalomreceipte_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalcadar_bringcalomreceipte_condition()
{
	if((Kapitel >= 2) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_bringcalomreceipte_info()
{
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_00");	//Počkej bratře, mám pro tebe jeden úkol.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_01");	//Dostaly se ke mně zvěsti, že míříš do Hornického údolí. Je to tak?
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipte_01_02");	//Ano, je to tak, mistře.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_03");	//Tedy chtěl bych tě požádat o jednu malou službu. Je velmi důležitá pro celé Bratrstvo!
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_04");	//Je nezbytné, aby ses zašel podívat do našeho starého tábora a podíval se tam po jedné věci.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_05");	//Receptu na výrobu specíální směsi z trávy z bažin. Byla objevena jedním z našich bývalých Guru - Cor Kalomem.
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipte_01_06");	//Cor Kalomem?
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_08");	//Ano, dle toho co vím, tak po té co opustil náš tábor a vydal se hledat Spáče sám, nechal tento recept ve své truhle.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_09");	//A od té doby tam pořád leží.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_10");	//Chci abys získal ten recept a pak mi ho samozřejmě donesl.
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipte_01_11");	//Zkusím to.
	MIS_REZEPTFORBAALCADAR = LOG_Running;
	Log_CreateTopic(TOPIC_REZEPTFORBAALCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REZEPTFORBAALCADAR,LOG_Running);
	B_LogEntry(TOPIC_REZEPTFORBAALCADAR,"Baal Cadar mě požádal, abych mu donesl recept od Cor Kaloma, který mu umožní vytvářet novou speciální směs z bažinné trávy. Dle toho co říkal, to vypadá, že bych se měl podívat do bývalého tábora v bažinách, do Cor Kalomovi laboratoře.");
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_BRINGCALOMRECEIPTEDONE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_bringcalomreceiptedone_condition;
	information = dia_baalcadar_bringcalomreceiptedone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti recept od Car Kaloma.";
};


func int dia_baalcadar_bringcalomreceiptedone_condition()
{
	if((MIS_REZEPTFORBAALCADAR == LOG_Running) && (Npc_HasItems(other,itwr_kalomsrecipe) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalcadar_bringcalomreceiptedone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipteDone_01_00");	//Přinesl jsem ti recept od Car Kaloma.
	B_GiveInvItems(other,self,itwr_kalomsrecipe,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_04");	//Ano... (šťastně) to je ono. To je ten recept, který jsem hledal!
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_05");	//Děkuji ti bratře, pracoval jsi dobře. A máš požehnání celého Bratrstva.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_09");	//A teď mě nech osamotě, musím prostudovat Cor Kalomův recept.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_10");	//Myslím, že to chvíli potrvá...
	MIS_REZEPTFORBAALCADAR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REZEPTFORBAALCADAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_REZEPTFORBAALCADAR,"Donesl jsem Baalu Cadarovi recept od Car Kaloma. Velice ho potěšilo, že se mi to povedlo.");
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_runemagicnotwork_condition;
	information = dia_baalcadar_runemagicnotwork_info;
	permanent = FALSE;
	description = "Fungují tvé runy?";
};


func int dia_baalcadar_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalCadar_RuneMagicNotWork_01_00");	//Fungují tvé runy?
	AI_Output(self,other,"DIA_BaalCadar_RuneMagicNotWork_01_01");	//Bohužel, naše runy zeslábli. A už je nelze používat! (smutně)
	AI_Output(self,other,"DIA_BaalCadar_RuneMagicNotWork_01_02");	//Všechny nás to hrozně moc překvapilo, ale nemůžeme s tím nic udělat.
	AI_Output(self,other,"DIA_BaalCadar_RuneMagicNotWork_01_03");	//Nevíš ty o tom něco?
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Ani Guru Bratrstva už svou runovou magií nevládnou.");
	GURUMAGERUNESNOT = TRUE;
};
