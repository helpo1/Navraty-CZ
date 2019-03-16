
var int taliasanteachmagicagree;
var int taliasan_trade;

instance DIA_TALIASAN_EXIT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 999;
	condition = dia_taliasan_exit_condition;
	information = dia_taliasan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_taliasan_exit_condition()
{
	return TRUE;
};

func void dia_taliasan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_taliasan_PICKPOCKET(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 998;
	condition = DIA_taliasan_PICKPOCKET_Condition;
	information = DIA_taliasan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_taliasan_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_taliasan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
	Info_AddChoice(DIA_taliasan_PICKPOCKET,Dialog_Back,DIA_taliasan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_taliasan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_taliasan_PICKPOCKET_DoIt);
};

func void DIA_taliasan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
};

func void DIA_taliasan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
};

instance DIA_TALIASAN_HI(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_hi_condition;
	information = dia_taliasan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_taliasan_hi_info()
{
	AI_Output(self,other,"DIA_Taliasan_Hi_01_00");	//Co potřebuješ?!... (vztekle)... Co tu pohledáváš?
	AI_Output(other,self,"DIA_Taliasan_Hi_01_01");	//Nic.
	AI_Output(self,other,"DIA_Taliasan_Hi_01_02");	//Takže si to ujasníme. Nemáš tu co pohledávat! Jdi pryč.
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_WASIST(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_wasist_condition;
	information = dia_taliasan_wasist_info;
	permanent = FALSE;
	description = "Ty jsi Gallahad?";
};


func int dia_taliasan_wasist_condition()
{
	if((KNOWSABOUTTALIASAN == TRUE) && (MEETTALIASAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_wasist_info()
{
	AI_Output(other,self,"DIA_Taliasan_WasIst_01_00");	//Ty jsi Gallahad?
	AI_Output(self,other,"DIA_Taliasan_WasIst_01_01");	//Odkud mě znáš? Kdo ti o mně řekl? Kdo tě poslal? Co po mně chceš?
	AI_Output(other,self,"DIA_Taliasan_WasIst_01_02");	//Slyšel jsem, že máš problémy.
	AI_Output(self,other,"DIA_Taliasan_WasIst_01_03");	//Neposlouchej drby a starej se o sebe.
	MEETTALIASAN = TRUE;
};


instance DIA_TALIASAN_WASISTNO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_wasistno_condition;
	information = dia_taliasan_wasistno_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_taliasan_wasistno_condition()
{
	if((KNOWSABOUTTALIASAN == FALSE) && (MEETTALIASAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_wasistno_info()
{
	AI_Output(other,self,"DIA_Taliasan_WasIstNo_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Taliasan_WasIstNo_01_02");	//Jmenuji se Gallahad.
	AI_Output(other,self,"DIA_Taliasan_WasIstNo_01_03");	//A co tu děláš?
	AI_Output(self,other,"DIA_Taliasan_WasIstNo_01_06");	//(Vztekle) To tě nemusí zajímat!
	MEETTALIASAN = TRUE;
};


instance DIA_TALIASAN_PROBLEM(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_problem_condition;
	information = dia_taliasan_problem_info;
	permanent = FALSE;
	description = "V čem je tvůj problém?";
};


func int dia_taliasan_problem_condition()
{
	if(MEETTALIASAN == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_problem_info()
{
	AI_Output(other,self,"DIA_Taliasan_Problem_01_00");	//V čem je tvůj problém?
	AI_Output(self,other,"DIA_Taliasan_Problem_01_02");	//V takových lidech, kteří se míchají do mých záležitostí!... (vztekle)
	if((Kapitel <= 2) || ((TALIASANTELLWHOMAGE == FALSE) && (MIS_XARDASNDMTASKSTWO == LOG_Running)))
	{
		AI_Output(other,self,"DIA_Taliasan_Problem_01_06");	//To už je mnohem lepší! Řekneš mi to?
		AI_Output(self,other,"DIA_Taliasan_Problem_01_07");	//Eh... Mladý muži. Ano, řeknu ti svůj příběh...
		AI_Output(self,other,"DIA_Taliasan_Problem_01_08");	//... Kdysi jsem měl vše: Čest, peníze, respekt... Ne jako nyní. (smutně)
		AI_Output(self,other,"DIA_Taliasan_Problem_01_11");	//V nejlepších letech jsem byl hlavou městského cechu mágů a prvním rádcem místodržícího našeho města.
		AI_Output(other,self,"DIA_Taliasan_Problem_01_12");	//Ty jsi mág?!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_13");	//A co tě na tom překvapuje?! Ano. A mohu ti říci, mladý muži, že jsem byl nejlepším mágem v Khorinisu!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_17");	//A to vše kvůly tomu prokletému Risterovi! Kéž by ho sežrala horda krysokrtů! (vztekle)
		if(Npc_KnowsInfo(other,DIA_Richter_Hello))
		{
			AI_Output(other,self,"DIA_Taliasan_Problem_01_18");	//Rister? To je ten arogantní idiot, který si oblékl plášť soudce?
			AI_Output(self,other,"DIA_Taliasan_Problem_01_19");	//Ano, on! Vidím, že už jsi měl to potěšení setkat se s tím tlustým prasetem.
		}
		else
		{
			AI_Output(other,self,"DIA_Taliasan_Problem_01_20");	//Rister?! A kdo to je?
			AI_Output(self,other,"DIA_Taliasan_Problem_01_21");	//Ty neznáš toho idiota?! Dobře pro tebe!...
			AI_Output(self,other,"DIA_Taliasan_Problem_01_22");	//Ten idiot tu dělá soudce.
			AI_Output(self,other,"DIA_Taliasan_Problem_01_23");	//Ten kretén!... (vztekle)
		};
		AI_Output(other,self,"DIA_Taliasan_Problem_01_25");	//Vysvětli mi, co se to vlastně stalo.
		AI_Output(self,other,"DIA_Taliasan_Problem_01_26");	//Dostal jsem se do temné historie. Měl jsem pocit že bych to neměl dělat. 
		AI_Output(self,other,"DIA_Taliasan_Problem_01_27");	//Všichni jsme nepoučitelní... Vše bude skvělé... jak říkával.
		AI_Output(self,other,"DIA_Taliasan_Problem_01_28");	//A když zakopl - tak vše shodil na mě!(vztekle)
		AI_Output(self,other,"DIA_Taliasan_Problem_01_31");	//Larius, místodržící města, byl natolik rozzuřen touhle událostí, že mě ani nevyslechl!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_32");	//Pak šlo vše, jako po másle. Přišel jsem o postavení a tím i o vše ostatní.
		AI_Output(self,other,"DIA_Taliasan_Problem_01_35");	//Eh! Dal bych vše za to, abych se té svini mohl pomstít. Jak ho znám, tak se někde válí a žere čokoládu!
		AI_Output(self,other,"DIA_Taliasan_Problem_01_36");	//Je tu jediný problém, v horní čtvrti není nikdo, kdo by se za mě zaručil a tak se tam nemohu vrátit...
		TALIASANTELLWHOMAGE = TRUE;
		if(MIS_XARDASNDMTASKSTWO == LOG_Running)
		{
			B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Možná že Gallahad by mohl mít knihu, co chce Xardas.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_Problem_01_38");	//Tak, ukojil jsem tvou zvědavost?!
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_HELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_help_condition;
	information = dia_taliasan_help_info;
	permanent = FALSE;
	description = "Mohu ti pomoci?";
};


func int dia_taliasan_help_condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,dia_taliasan_problem))
	{
		return TRUE;
	};
};

func void dia_taliasan_help_info()
{
	AI_Output(other,self,"DIA_Taliasan_Help_01_00");	//Mohu ti pomoci?
	AI_Output(self,other,"DIA_Taliasan_Help_01_01");	//Ano, je tu něco co by mi mohlo pomoci, ale... (zpozorní)
	AI_Output(self,other,"DIA_Taliasan_Help_01_03");	//... víš, kdyby se za mě někdo přimluvil u Lariuse.
	AI_Output(other,self,"DIA_Taliasan_Help_01_04");	//Kdo by to mohl udělat?
	AI_Output(self,other,"DIA_Taliasan_Help_01_05");	//No, ve městě je pár lidí, jejichž názor má velkou cenu.
	AI_Output(self,other,"DIA_Taliasan_Help_01_07");	//Většina obchodníků z horní čtvrti. Možná by někdo z nich souhlasil...
	AI_Output(self,other,"DIA_Taliasan_Help_01_08");	//Samozřejmě, mě poslouchat nebudou, ale pokud je někdo jiný přesvědčí...
	AI_Output(self,other,"DIA_Taliasan_Help_01_09");	//A co vy?
	AI_Output(other,self,"DIA_Taliasan_Help_01_12");	//Hmmm... A jak si představuješ, že je mám přemluvit?
	AI_Output(self,other,"DIA_Taliasan_Help_01_13");	//No... Například jim můžeš nabídnout svou pomoc.
	AI_Output(self,other,"DIA_Taliasan_Help_01_21");	//Nicméně, pro mě jsou důležité abys od nich dostal doporučující dopisy.
	AI_Output(self,other,"DIA_Taliasan_Help_01_22");	//Tak co, pomůžeš mi?!
	Info_ClearChoices(dia_taliasan_help);
	Info_AddChoice(dia_taliasan_help,"Raději se podívej po někom jiném.",dia_taliasan_help_no);
	Info_AddChoice(dia_taliasan_help,"Je to riskantní, ale pomohu ti.",dia_taliasan_help_ok);
	Info_AddChoice(dia_taliasan_help,"Co za to?",dia_taliasan_help_howmuch);
};

func void dia_taliasan_help_no()
{
	AI_Output(other,self,"DIA_Taliasan_Help_No_01_00");	//Toto moc zavání kriminálem. Promiň, ne.
	AI_Output(self,other,"DIA_Taliasan_Help_No_01_03");	//Jak chceš, budu se stím muset porvat sám. Což bohužel bude trvat věky...
	Info_ClearChoices(dia_taliasan_help);
};

func void dia_taliasan_help_ok()
{
	AI_Output(other,self,"DIA_Taliasan_Help_Ok_01_00");	//No, je to riskantní, ale pomůžu ti.
	AI_Output(self,other,"DIA_Taliasan_Help_Ok_01_01");	//Věděl jsem, že mi pomůžeš!
	AI_Output(self,other,"DIA_Taliasan_Help_Ok_01_04");	//Slibuju ti, nebudeš toho litovat!
	Log_CreateTopic(TOPIC_TALIASANHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALIASANHELP,LOG_Running);
	B_LogEntry(TOPIC_TALIASANHELP,"V přístavu jsem potkal Gallahada. Kdysi byl významnou osobou ve městě, dokud se nezapletl do nějakých špinavých obchodů. Dle jeho slov, to na něj hodil soudce Rister. Po tomto incidentu Gallahad ztratil vše - slávu, respekt, práci.");
	B_LogEntry_Quiet(TOPIC_TALIASANHELP,"Souhlasil jsem, že mu pomohu získat jeho dřívější vliv ve městě. Musím sehnat doporučující dopisy od vlivných měšťanů. A pak je zanést Lariusovi. Možná pak Larius Gallahadovi odpustí.");
	MIS_TALIASANHELP = LOG_Running;
	Info_ClearChoices(dia_taliasan_help);
};

func void dia_taliasan_help_howmuch()
{
	AI_Output(other,self,"DIA_Taliasan_Help_HowMuch_01_00");	//A co dostanu za svou pomoc?
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_04");	//No! pokud mi pomůžeš tak já...
	AI_Output(other,self,"DIA_Taliasan_Help_HowMuch_01_06");	//Hmmm, zajímavé. A co když mě pěníze nezajímají?
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_07");	//No, ano... hm... Pořád mám elixíry, který můžou trvale vylepšit tvé vlastnosti!
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_08");	//Mohl bych ti dát pár takových.
	AI_Output(other,self,"DIA_Taliasan_Help_HowMuch_01_09");	//A nemáš něco speciálního? Snad mě můžete naučit kouzlit?
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_15");	//Aha, takže si rozumíme, to je to nejlepší, co sis mohl přát.
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_16");	//Vědomosti, to je bohatství, které narozdíl od stříbrných pohárů a zlatých mincí přetrvá.
	AI_Output(self,other,"DIA_Taliasan_Help_HowMuch_01_17");	//To je dobré! Pokud mi pomůžeš, naučím tě čarovat!
};

instance DIA_TALIASAN_FineFood(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_TALIASAN_FineFood_condition;
	information = DIA_TALIASAN_FineFood_info;
	permanent = FALSE;
	description = "Přál bych si vyzvednout odměnu.";
};

func int DIA_TALIASAN_FineFood_condition()
{
	if(MIS_TALIASANHELP != FALSE)
	{
		return TRUE;
	};
};

func void DIA_TALIASAN_FineFood_info()
{
	AI_Output(other,self,"DIA_Taliasan_FineFood_01_00");	//Můžu ještě něco udělat, abych vám pomohl?
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_01");	//(Nedbale) Ano, můžeš. Přines mi něco k jídlu.
	AI_Output(other,self,"DIA_Taliasan_FineFood_01_02");	//Jste hladoví?
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_03");	//Ne, ty blázne! Jen už jsem poněkud unavený z objemných krmiv.
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_04");	//Jsem zvyklý jíst delikatesy! Je velmi obtížné získat slušné jídlo v této díře.
	AI_Output(other,self,"DIA_Taliasan_FineFood_01_05");	//Dobře, co vám má váš služebník přinést?
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_06");	//No... myslím, že bude stačit, když mi přineseš tři láhve vína, šunka, kousek sýra, hrnec medu a hrozny.
	AI_Output(self,other,"DIA_Taliasan_FineFood_01_07");	//Ale neopovažuj se mě ptát na peníze. Sám něco vymysli!
	MIS_TaliasanFineFood = LOG_Running;
	Log_CreateTopic(TOPIC_TaliasanFineFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TaliasanFineFood,LOG_Running);
	B_LogEntry(TOPIC_TaliasanFineFood,"Gallahad, unaven z prostého jídelníčku přístavní čtvrti, mě požádal, abych mu přinesl tři láhve vína, šunku, kousek sýra, hrnec medu a hrozny.");
};

instance DIA_TALIASAN_FineFood_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_TALIASAN_FineFood_Done_condition;
	information = DIA_TALIASAN_FineFood_Done_info;
	permanent = FALSE;
	description = "Mám pro tebe to jídlo.";
};

func int DIA_TALIASAN_FineFood_Done_condition()
{
	if((MIS_TaliasanFineFood == LOG_Running) && (Npc_HasItems(other,ItFo_Honey) >= 1) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItFo_Bacon) >= 1) && (Npc_HasItems(other,ITFO_WINEBERRYS) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 3)) 
	{
		return TRUE;
	};
};

func void DIA_TALIASAN_FineFood_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Taliasan_FineFood_Done_01_00");	//Mám pro tebe to jídlo.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItFo_Honey,1);
	Npc_RemoveInvItems(hero,ItFo_Cheese,1);
	Npc_RemoveInvItems(hero,ItFo_Bacon,1);
	Npc_RemoveInvItems(hero,ITFO_WINEBERRYS,1);
	Npc_RemoveInvItems(hero,ItFo_Wine,3);
	AI_Output(self,other,"DIA_Taliasan_FineFood_Done_01_01");	//Vynikající! Dej to sem... (dychtivě) konečně, můj žaludek ochutnát něco jiného než shnilé rybí polévky.
	AI_Output(self,other,"DIA_Taliasan_FineFood_Done_01_02");	//Vedl sis dobře. Můžeš jít. 
	AI_Output(other,self,"DIA_Taliasan_FineFood_Done_01_03");	//A co nějaký vděk?
	AI_Output(self,other,"DIA_Taliasan_FineFood_Done_01_04");	//(Nedbale) Děkuji.
	CreateInvItems(hero,ItSc_HarmUndead,1);
	MIS_TaliasanFineFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_TaliasanFineFood,LOG_Success);
	B_LogEntry(TOPIC_TaliasanFineFood,"Přinesl jsem žranici Gallahadovi. To vykračující si to krůtí mi málem ani nepoděkovalo... Není tedy divu, že ho nemá nikdo rád.");
	AI_StopProcessInfos(self);
};

instance DIA_TALIASAN_GIVEMEGIFT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegift_condition;
	information = dia_taliasan_givemegift_info;
	permanent = FALSE;
	description = "Přál bych si vyzvednout odměnu.";
};


func int dia_taliasan_givemegift_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegift_info()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGift_01_00");	//Přál bych si vyzvednout odměnu.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGift_01_01");	//Za co? Vždyť si ještě nic neudělal...
};

instance DIA_TALIASAN_LETTERFROMFERNANDO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromfernando_condition;
	information = dia_taliasan_letterfromfernando_info;
	permanent = FALSE;
	description = "Mám tu odpis od obchodníka Fernanda.";
};

func int dia_taliasan_letterfromfernando_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_fernandoletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromfernando_info()
{
	AI_Output(other,self,"DIA_Taliasan_LetterFromFernando_01_00");	//Mám dopis s doporučením od Fernarda.
	if(Fernando_ImKnast == FALSE)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_01");	//Nech mě podívat se nato... (se zájmem.)
		B_GiveInvItems(other,self,itwr_fernandoletter,1);
		Npc_RemoveInvItems(self,itwr_fernandoletter,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_03");	//Výtečná práce, cizinče.
		B_LogEntry(TOPIC_TALIASANHELP,"Dal jsem Gallahadovi dopis od Fernanda.");
		RECOMENDLETTER = RECOMENDLETTER + 1;
		if(RECOMENDLETTER >= 4)
		{
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_04");	//Myslím, že tyhle dopisy co jsem ti donesl budou stačit.
			TALIASANHELP_STEP1 = TRUE;
		}
		else if(RECOMENDLETTER >= 3)
		{
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_06");	//Myslím, že tohle ještě můj problém zcela nevyřeší.
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_07");	//Možná ještě jeden dopis a vše by bylo jako dřív!
		}
		else if(RECOMENDLETTER >= 1)
		{
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_08");	//Potřebuji ještě další doporučující dopisy!
			AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_09");	//Nakonec, ještě pár bys jich sehnat mohl.
		};
	}
	else if((Fernando_ImKnast == TRUE) && (RECOMENDLETTER == 3))
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_10");	//A co já z toho?... (vztekle) Celé město už dávno ví, že Fernardo prodával zbraně banditům! Na co mi neseš dopis od něj?!
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_12");	//I když... Vzhledem k tomu, že při řešení trestné činnosti - měl ještě stále velký vliv tak budiž.
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_04");	//Myslím, že ty dopisy, které jsi mi přinesl by měli stačit na to aby zapůsobyli na Lariuse.
		TALIASANHELP_STEP1 = TRUE;
		B_LogEntry(TOPIC_TALIASANHELP,"Gallahad nechtěl dopis od Fernanda. Asi proto, že je momentálně zavřený.");
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_10");	//Na co mi to?... (vztekle) Celé město už dávno ví, že Fernardo prodával zbraně banditům! Na co mi neseš dopis od něj?!
		AI_Output(self,other,"DIA_Taliasan_LetterFromFernando_01_11");	//Je mi to úplně k ničemu.
		B_LogEntry(TOPIC_TALIASANHELP,"Gallahad nechtěl převzít dopis od Fernanda protože si myslí že je v nynější situaci bezhodnotný.");
	};
};


instance DIA_TALIASAN_LETTERFROMLUTERO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromlutero_condition;
	information = dia_taliasan_letterfromlutero_info;
	permanent = FALSE;
	description = "Tady máš odpis od Lutera.";
};


func int dia_taliasan_letterfromlutero_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_luteroletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromlutero_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Taliasan_LetterFromLutero_01_00");	//Tady ti nesu dopis od obchodníka Lutera!
	B_GiveInvItems(other,self,itwr_luteroletter,1);
	Npc_RemoveInvItems(self,itwr_luteroletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_03");	//To je úžasné! Znám Lutera - je velmi vlivný ve městě. Získat si ho na naši stranu byl výtečný tah!
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry(TOPIC_TALIASANHELP,"Dal jsem Gallahadovi dopis od Lutera.");
	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_04");	//Myslím, že tyhle dopisy co jsem ti donesl budou stačit.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_06");	//Myslím, že tohle ještě můj problém zcela nevyřeší.
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_07");	//Možná ještě jeden dopis a vše by bylo jako dřív!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_08");	//Potřebuji ještě další doporučující dopisy!
		AI_Output(self,other,"DIA_Taliasan_LetterFromLutero_01_09");	//Nakonec, ještě pár bys jich sehnat mohl.
	};
};


instance DIA_TALIASAN_LETTERFROMGERBRANT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromgerbrant_condition;
	information = dia_taliasan_letterfromgerbrant_info;
	permanent = FALSE;
	description = "Tady, donesl jsem ti dopis od Gerbrandta.";
};


func int dia_taliasan_letterfromgerbrant_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_gerbrantletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromgerbrant_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Taliasan_LetterFromGerbrant_01_00");	//Tady, donesl jsem ti dopis od Gerbrandta.
	B_GiveInvItems(other,self,itwr_gerbrantletter,1);
	Npc_RemoveInvItems(self,itwr_gerbrantletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_03");	//Hmmm... Zajímavé! Nikdy by mě nenapadlo, že by se za mě mohl přimluvit zrovna on...
	AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_04");	//Musel jsi na něj udělat opravdu velký dojem!
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry(TOPIC_TALIASANHELP,"Dal jsem Gallahadovi dopis od Gerbrandta. Byl velmi překvapený, že se mi ho od něj podařilo získat!");
	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_05");	//Myslím, že tyhle dopisy, co jsem ti donesl budou stačit na to aby zapůsobyli na Lariuse.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_07");	//Myslím, že tohle ještě můj problém zcela nevyřeší.
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_08");	//Možná ještě jeden dopis a vše bude jako dřív!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_09");	///Potřebuji ještě další doporučující dopisy!
		AI_Output(self,other,"DIA_Taliasan_LetterFromGerbrant_01_10");	//Nakonec, ještě pár bys jich sehnat mohl.
	};
};

instance DIA_TALIASAN_LETTERFROMSALANDRIL(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromsalandril_condition;
	information = dia_taliasan_letterfromsalandril_info;
	permanent = FALSE;
	description = "Alchymista Salandril pro tebe napsal doporučení.";
};

func int dia_taliasan_letterfromsalandril_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_salandrilletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromsalandril_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_LetterFromSalandril_01_00");	//Alchymista Salandril pro tebe napsal doporučení.
	AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_01");	//Salandril?!... Hmmm, S jeho hlasem jsem nepočítal. Nech mě podívat se.
	B_GiveInvItems(other,self,itwr_salandrilletter,1);
	Npc_RemoveInvItems(self,itwr_salandrilletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_03");	//Hmmm, to je dobré! Na jeho názor pár lidí ve městě přece jenom dá.
	AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_04");	//Nicméně, může to být užitečné pro nás!
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry(TOPIC_TALIASANHELP,"Dal jsem Gallahadovi dopis od Salandrila. Nezdál se přesvědčený, že mu pomůže, ale přesto si ho nechal.");

	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_05");	//Myslím, že tyhle dopisy, co jsem ti donesl budou stačit na to aby zapůsobyli na Lariuse.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_07");	//Myslím, že tohle ještě můj problém zcela nevyřeší.
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_08");	//Možná ještě jeden dopis a vše by bylo jako dřív!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_09");	//Potřebuji ještě další doporučující dopisy!
		AI_Output(self,other,"DIA_Taliasan_LetterFromSalandril_01_10");	//Nakonec, ještě pár bys jich sehnat mohl.
	};
};


instance DIA_TALIASAN_LETTERFROMVALENTINO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromvalentino_condition;
	information = dia_taliasan_letterfromvalentino_info;
	permanent = FALSE;
	description = "Mám pro tebe doporučující dopis od Valentina.";
};


func int dia_taliasan_letterfromvalentino_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_valentinoletter) >= 1) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromvalentino_info()
{
	AI_Output(other,self,"DIA_Taliasan_LetterFromValentino_01_00");	//Mám pro tebe doporučení od Valentina.
	AI_Output(self,other,"DIA_Taliasan_LetterFromValentino_01_01");	//COŽE? Od toho tupého idiota?
	AI_Output(self,other,"DIA_Taliasan_LetterFromValentino_01_03");	//Jeho názor ve městě nemá cenu ani červivého jablka! Toto není dar...
	AI_Output(self,other,"DIA_Taliasan_LetterFromValentino_01_04");	//Nech si to, pro mě je tento kus papíru bezcený!
	B_LogEntry(TOPIC_TALIASANHELP,"Gallahad nechtěl dopis od Valentina. Zdá se, že jeho názor nikoho ve městě ani trochu nezajímá.");
};


instance DIA_TALIASAN_GIVEMEGIFTOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftok_condition;
	information = dia_taliasan_givemegiftok_info;
	permanent = FALSE;
	description = "A co moje odměna?";
};


func int dia_taliasan_givemegiftok_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftok_info()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftOK_01_00");	//A co moje odměna?
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftOK_01_03");	//Ano, donesl jsi mi je, ale to je jen polovina práce.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftOK_01_04");	//Proto si o odměně promluvíme později.
};


instance DIA_TALIASAN_SENDTOLARIUS(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_sendtolarius_condition;
	information = dia_taliasan_sendtolarius_info;
	permanent = FALSE;
	description = "A co teď?";
};


func int dia_taliasan_sendtolarius_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_sendtolarius_info()
{
	AI_Output(other,self,"DIA_Taliasan_SendToLarius_01_00");	//A co teď?
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_01");	//To ti hned řeknu. Musíš zanést tyto dopisy Lariusovi.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_03");	//Jak jsem ti už říkal, stráže mě nepustí do radnice, ale ty určitě budeš mít šanci.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_05");	//Ukaž mu všechny tyto dopisy ale předtím se ujisti, že je v dobré náladě!
	B_GiveInvItems(self,other,itwr_taliasanrecomendedletters,1);
	AI_Output(other,self,"DIA_Taliasan_SendToLarius_01_06");	//A co mu mám říct?
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_07");	//Řekni mu, že velice lituji toho co se tehdy stalo a prosím ho, aby zapomněl na to nepřijemné nedorozumění.
	AI_Output(other,self,"DIA_Taliasan_SendToLarius_01_10");	//Pokusím se to s Lariusem ujednat.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_11");	//Ještě jedna věc! Larius je jedinečná osoba a tak s ním musíš taky mluvit!
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_12");	//Většina jeho rozhodnutí závisí na jeho momentální náladě.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_14");	//Jestli si to dobře pamatuju, tak by bylo nejlepší mu ji donést o jeho odpolední přestávce.
	AI_Output(self,other,"DIA_Taliasan_SendToLarius_01_15");	//Dobře si to pamatuj. Teď běž!
	B_LogEntry(TOPIC_TALIASANHELP,"Teď mě Gallahad požádal, abych zanesl dopisy Lariusovi. Musím ho přesvědčit, aby Gallahadovi odpustil. Mám si stím promluvit o jeho polední pauze. Je prý velmi náladový.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_400_Larius,"Dinner");
};


instance DIA_TALIASAN_STOLENBOOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 9;
	condition = dia_taliasan_stolenbook_condition;
	information = dia_taliasan_stolenbook_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_stolenbook_condition()
{
	if((Npc_HasItems(hero,itwr_rhetorikbook) >= 1) && (TALIASANAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_stolenbook_info()
{
	AI_Output(self,other,"DIA_Taliasan_StolenBook_00");	//Nešahej na to!
	AI_Output(self,other,"DIA_Taliasan_StolenBook_01");	//Na této polici jsou mé osobní knihy, tak si ani nemysli, že bys mi některou vzal!
	AI_Output(self,other,"DIA_Taliasan_StolenBook_02");	///Pokud bude chybět jedna jediná kniha, budu vědět, za kým mám jít!
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,1);
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_STOLENBOOKTWO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 9;
	condition = dia_taliasan_stolenbooktwo_condition;
	information = dia_taliasan_stolenbooktwo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_taliasan_stolenbooktwo_condition()
{
	if((Npc_HasItems(hero,itwr_rhetorikbook) >= 1) && (TALIASANAWAY == FALSE) && Npc_KnowsInfo(hero,dia_taliasan_stolenbook))
	{
		return TRUE;
	};
};

func void dia_taliasan_stolenbooktwo_info()
{
	AI_Output(self,other,"DIA_Taliasan_StolenBookTwo_00");	//Hej, to je moje kniha. Dej ty špinavé ruce pryč!
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,1);
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_NEEDBOOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_needbook_condition;
	information = dia_taliasan_needbook_info;
	permanent = FALSE;
	description = "Gallahade, potřebuju tuhle knihu pro Fernanda...";
};


func int dia_taliasan_needbook_condition()
{
	if(MIS_FERNANDOHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_taliasan_needbook_info()
{
	AI_Output(other,self,"DIA_Taliasan_NeedBook_01_00");	//Gallahade, je tu jedna kniha, potřebuji ji pro Fernarda. Napíše dopis jen když mu dám tu knihu.
	AI_Output(self,other,"DIA_Taliasan_NeedBook_01_01");	//Ha! Takže ji pořád potřebuje.
	AI_Output(self,other,"DIA_Taliasan_NeedBook_01_06");	//Najdi jiný způsob jak od něj dostat dopis!
	B_LogEntry(TOPIC_FERNANDOHELP,"Gallahad mě nenechá vzít si tu knihu a je natolik podezřívavý, že mě ani nenechá přiblížit se k jeho poličce s knihami.");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_IGNAZHELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_ignazhelp_condition;
	information = dia_taliasan_ignazhelp_info;
	permanent = FALSE;
	description = "Ignaz mě požádal abych ti něco připomněl...";
};


func int dia_taliasan_ignazhelp_condition()
{
	if(MIS_IGNAZHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_taliasan_ignazhelp_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_IgnazHelp_01_00");	//Ignaz mě požádal abych ti něco připomněl.
	AI_Output(other,self,"DIA_Taliasan_IgnazHelp_01_02");	//Mám ti připomenout, že jsi mu slíbil nové rostliny na jeho experimenty.
	AI_Output(self,other,"DIA_Taliasan_IgnazHelp_01_03");	//Ach ano! poslední dobou mám tak moc práce, že jsem na něj úplně zapomněl.
	TALIASANAWAY = TRUE;
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	Npc_ExchangeRoutine(self,"GoIgnaz");
	Log_SetTopicStatus(TOPIC_IGNAZHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERNANDOHELP,"Gallahad odešel na setkáním s Ignazem. Tento okamžik musím využít!");
	MIS_IGNAZHELP = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_CANCELHELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_cancelhelp_condition;
	information = dia_taliasan_cancelhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_cancelhelp_condition()
{
	var int counthelpmiss;
	counthelpmiss = 0;
	if(MIS_GERBRANDTHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if(MIS_FERNANDOHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if(MIS_SALANDRILHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if((counthelpmiss >= 2) && (MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_cancelhelp_info()
{
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_00");	//Počkej minutku...
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_02");	//Ve městě se o tobě začínají šířit pověsti. A ne zrovna nejlepší!
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_03");	//Slyšel jsem, že ses nějak pohádal s vlivnými lidmi s horní čtvrti, jejichž pomoc potřebujeme.
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_06");	//Počítal jsem s jejich pomocí, ale teď na ni můžu rovnou zapomenout.
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_07");	//Můžeš zapomenout na to o co jsem tě žádal.
	AI_Output(self,other,"DIA_Taliasan_CancelHelp_01_14");	//Kliď se mi z očí, idiote!
	TALIASANPISSOFF = TRUE;
	MIS_TALIASANHELP = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_TALIASANHELP);
	AI_StopProcessInfos(self);

	if(MIS_GERBRANDTHELP == LOG_Running)
	{
		MIS_GERBRANDTHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_OBSOLETE);
	};
	if(MIS_FERNANDOHELP == LOG_Running)
	{
		MIS_FERNANDOHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_OBSOLETE);
	};
	if(MIS_SALANDRILHELP == LOG_Running)
	{
		MIS_SALANDRILHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_OBSOLETE);
	};
	if(MIS_LUTEROHELP == LOG_Running)
	{
		MIS_LUTEROHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_OBSOLETE);
	};
	if(MIS_VALENTINOHELP == LOG_Running)
	{
		MIS_VALENTINOHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_OBSOLETE);
	};
};


instance DIA_TALIASAN_FUCKOFF(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 10;
	condition = dia_taliasan_fuckoff_condition;
	information = dia_taliasan_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_taliasan_fuckoff_condition()
{
	if((TALIASANPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_taliasan_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_TALIASAN_SENDTOLARIUSOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_sendtolariusok_condition;
	information = dia_taliasan_sendtolariusok_info;
	permanent = FALSE;
	description = "Mluvil jsem s Lariusem.";
};

func int dia_taliasan_sendtolariusok_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALKLARIUSABOUTTALIASAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_sendtolariusok_info()
{
	AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_00");	//Mluvil jsem s Lariusem.
	AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_01");	//A co ti řekl?!... (nedočkavě)

	if(LARIUSPISSOFF == TRUE)
	{
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_02");	//Neposlouchal mě, rovnou mě vyhodil ze dveří!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_06");	//Určitě jsi něco zmršil. Co jsi to provedl?
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_08");	//U Innose! To byla má poslední šance!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_09");	//Opravdu jsem už začínal věřit, tomu, že se vše k dobrému obrátí. Teď na to můžu zapomenout.
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_17");	//Kliď se mi z očí, idiote!
		TALIASANPISSOFF = TRUE;
		MIS_TALIASANHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_TALIASANHELP);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_18");	//Mám ti vzkázat. Odpouští ti!
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_19");	//Dopisy na Lariuse udělaly opravdu velký dojem!
		AI_Output(other,self,"DIA_Taliasan_SendToLariusOk_01_20");	//Abych to zkrátil, jsi zase znovu hlavním městským mágem a máš se okamžitě ukázat na radnici.
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_21");	//To jsou úžasné zprávy! (bez sebe nadšením)... Konečně!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_22");	//Neměl bych setrvávat na tomto smradlavém místě, déle, než je nezbytné. Jen tomu nemůžu uvěřit!
		AI_Output(self,other,"DIA_Taliasan_SendToLariusOk_01_29");	//Nebudu ztrácet ani minutu. Běžím za Lariusem.
		self.guild = GIL_NONE;
		MIS_TALIASANHELP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TALIASANHELP,LOG_SUCCESS);
		B_LogEntry(TOPIC_TALIASANHELP,"Řekl jsem Gallahadovi o naší schůzce. Byl naprosto nadšený, že se mi povedlo přesvědčit Lariuse, aby mu odpustil. A jako obvykle jsem musel vyslechnout dlouhé děkování.");
		AI_StopProcessInfos(self);
		Npc_SetTrueGuild(self,GIL_NONE);
		Npc_ExchangeRoutine(self,"GoInTownHall");
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
		TaliasanNextQuest = Wld_GetDay();
	};
};


instance DIA_TALIASAN_GIVEMEGIFTNEXT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftnext_condition;
	information = dia_taliasan_givemegiftnext_info;
	permanent = FALSE;
	description = "Chci se dostat svou odměnu.";
};


func int dia_taliasan_givemegiftnext_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftnext_info()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNext_01_00");	//Chci se dostat svou odměnu.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNext_01_03");	//Je mi líto, ale jsem moc ve spěchu.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNext_01_04");	//Proto si o odměně promluvíme zítra, až na to bude více času.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNext_01_05");	//Přijdi zítra po poledni na radnici.
	MIS_TALIASAN_GIFT_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_HOUSE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_house_condition;
	information = dia_taliasan_house_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_house_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_taliasan_house_info()
{
	AI_Output(self,other,"DIA_Taliasan_House_01_00");	//Ještě něco...
	AI_Output(self,other,"DIA_Taliasan_House_01_02");	//Nyní nepotřebuju tuto chatrč.
	AI_Output(self,other,"DIA_Taliasan_House_01_04");	//Víš co, klidně tu můžeš bydlet, pokud budeš chtít!
	TaliasanHomeIsMine = TRUE;
	TALIASANAWAY = TRUE;
	AI_StopProcessInfos(self);

	if(Npc_HasItems(self,itar_mage) == 0)
	{
		CreateInvItem(self,itar_mage);
	};

	AI_EquipBestArmor(self);
	Wld_AssignRoomToGuild("hafen06",GIL_NONE);
};

instance DIA_TALIASAN_GIVEMEGIFTNOW(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftnow_condition;
	information = dia_taliasan_givemegiftnow_info;
	permanent = FALSE;
	description = "Promluvme si o mé odměně.";
};


func int dia_taliasan_givemegiftnow_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_taliasan_givemegiftnext) && ((MIS_TALIASAN_GIFT_DAY < (Wld_GetDay() - 1)) || ((MIS_TALIASAN_GIFT_DAY < Wld_GetDay()) && Wld_IsTime(12,0,23,59))))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftnow_info()
{
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_01_00");	//Pojďme si popovídat o mé odměně.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_01_01");	//Samozřejmě. Co sis vybral?
	Info_AddChoice(dia_taliasan_givemegiftnow,"Peníze.",dia_taliasan_givemegiftnow_money);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Dej mi pár tvých lektvarů.",dia_taliasan_givemegiftnow_zelia);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Nauč mě čarovat!",dia_taliasan_givemegiftnow_magic);
};

func void dia_taliasan_givemegiftnow_money()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Money_01_00");	//Potřebuju peníze.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_01");	//Mohu ti dát pět set zlatých.
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Money_01_03");	//Nestačí!
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_04");	//Hmmm... (přemýšlí)... Máš pravdu.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_05");	//Co takhle tisíc?
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Money_01_06");	//Víc nemám, to jsou mé veškeré úspory.
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Souhlasím.",dia_taliasan_givemegiftnow_thousand);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Ne, to není dost.",dia_taliasan_givemegiftnow_nomoney);
};

func void dia_taliasan_givemegiftnow_thousand()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Thousand_01_00");	//Souhlasím, dej mi peníze.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Thousand_01_01");	//Tady, vezmi si měšec - je zde přesně 1000 mincí.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Thousand_01_02");	//Nyní mě omluv, mám hromadu práce.
	B_GiveInvItems(self,other,itse_taliasanpocket,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_nomoney()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_NoMoney_01_00");	//Ne, to pořád nestačí.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_NoMoney_01_02");	//Pokud ti toto nestačí, nemohu ti nabídnout nic jiného.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_NoMoney_01_03");	//Nyní mě omluv, mám hromadu práce.
	TALIASANDOLG = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_zelia()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Zelia_01_00");	//Dej mi pár tvých lektvarů.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Zelia_01_01");	//Jaký bys chtěl?
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Vezmu si lektvar síly.",dia_taliasan_givemegiftnow_str);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Přál bych si lektvar obratnosti.",dia_taliasan_givemegiftnow_dex);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Vezmu si lektvar many.",dia_taliasan_givemegiftnow_mana);
};

func void dia_taliasan_givemegiftnow_str()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Str_01_00");	//Chtěl bych si vzít lektvar síly.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Str_01_01");	//Tady, vezmi si.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Str_01_02");	//Nyní mě omluv, mám hromadu práce.
	B_GiveInvItems(self,other,ItPo_Perm_STR_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_dex()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Dex_01_00");	//Přál bych si vzít lektvar obratnosti.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Dex_01_01");	//Tady, vezmi si.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Dex_01_02");	//Nyní mě omluv, mám hromadu práce.
	B_GiveInvItems(self,other,ItPo_Perm_Dex_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_mana()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Mana_01_00");	//Vezmu si lektvar many.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Mana_01_01");	//Tady, vezmi si.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Mana_01_02");	//Nyní mě omluv, mám hromadu práce.
	B_GiveInvItems(self,other,ItPo_Perm_Mana_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_magic()
{
	AI_Output(other,self,"DIA_Taliasan_GiveMeGiftNow_Magic_01_00");	//Nauč mě používat magii.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_01");	//Vybral sis nejcenější odměnu!
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_03");	//Nicméně, nemohu tě naučit magii Ohně či Vody. A na umění nekromancie rovnou zapomeň!
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_04");	//Tyto schopnosti jsou přístupné pouze následovníkům svých bohů, kteří jim propůjčili znalosti.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_05");	//To, co tě naučím já je pravá magie!
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_06");	//Naučím tě, jak vytvořit runy a jak je používat...
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_08");	//Můžeš si je u mě koupit.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_09");	//Mimo jiné, prozradím ti tajemství kruhů magie. Bez nichž neovládneš své runy.
	AI_Output(self,other,"DIA_Taliasan_GiveMeGiftNow_Magic_01_10");	//A málem bych zapomněl. Pokud budeš chtít zvýšit svou manu, řekni mi.
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	TALIASANTEACHMAGIC = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TRMAGICTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_TRMAGICTEACHER,"Gallahad mě naučí jak vyrobit runy pravé magie. K tomu mi pomůže s pochopením kruhů magie a ukáže mi, jak zvýším svou duchovní sílu.");
	B_LogEntry_Quiet(TOPIC_ADDON_TRMAGICTEACHER,"Mimo to, můžu u něj koupit svitky a pár knih.");
};


instance DIA_TALIASAN_EXPLAINCIRCLES(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_explaincircles_condition;
	information = dia_taliasan_explaincircles_info;
	important = FALSE;
	permanent = FALSE;
	description = "Prosím, vysvětli mi, jaký je smysl kruhů magie?";
};


func int dia_taliasan_explaincircles_condition()
{
	if(TALIASANTEACHMAGIC == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_explaincircles_info()
{
	AI_Output(other,self,"DIA_Taliasan_EXPLAINCIRCLES_Info_15_01");	//Prosím, vysvětli mi, co je to kruh magie?
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_02");	//S potěšením, kruh symbolizuje tvé chápání magie.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_03");	//Představují úroveň tvých schopností a kouzel.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_04");	//Musíš projít každým kruhem, aby ses dostal do dalšího.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_05");	//Pokud chceš dosáhnout maximálního, šestého, musíš hodně trénovat a studovat.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_06");	//Čím větší kruh, tím silnější budou tvá kouzla. Ale kruhy jsou samozřejmě mnohem víc.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_07");	//Jsou součástí tvého života. Vždy tu budou s tebou.
	AI_Output(self,other,"DIA_Taliasan_EXPLAINCIRCLES_Info_14_08");	//Abys rozuměl jejich síle, musíš rozumět sám sobě.
	EXPLAINCIRCLEMEAN = TRUE;
};

instance DIA_TALIASAN_RUNEN(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_runen_condition;
	information = dia_taliasan_runen_info;
	permanent = TRUE;
	description = "Nauč mě vyrobit runy.";
};

func int dia_taliasan_runen_condition()
{
	if((TALIASANTEACHMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_taliasan_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Uč mě!
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_taliasan_runen,"3. kruh magie",dia_taliasan_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_taliasan_runen,"2. kruh magie",dia_taliasan_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_taliasan_runen,"1. kruh magie",dia_taliasan_runen_1);
	};
};

func void dia_taliasan_runen_back()
{
	Info_ClearChoices(dia_taliasan_runen);
};

func void dia_taliasan_runen_1()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),dia_taliasan_runen_circle_1_spl_light);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),dia_taliasan_runen_circle_1_spl_lightheal);
	};
	if((PLAYER_TALENT_RUNES[SPL_UnlockChest] == FALSE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_UnlockChest,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_UnlockChest)),dia_taliasan_runen_circle_1_spl_unlock);
	};
};

func void dia_taliasan_runen_2()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),dia_taliasan_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),dia_taliasan_runen_circle_2_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),dia_taliasan_runen_circle_2_spl_destroyundead);
	};
};

func void dia_taliasan_runen_3()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen,Dialog_Back,dia_taliasan_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),dia_taliasan_runen_circle_3_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),dia_taliasan_runen_circle_3_spl_fullheal);
	};
};

func void dia_taliasan_runen_circle_1_spl_light()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void dia_taliasan_runen_circle_1_spl_lightheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void dia_taliasan_runen_circle_1_spl_unlock()
{
	B_TeachPlayerTalentRunes(self,other,SPL_UnlockChest);
};

func void dia_taliasan_runen_circle_2_spl_summonwolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void dia_taliasan_runen_circle_2_spl_mediumheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void dia_taliasan_runen_circle_2_spl_destroyundead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void dia_taliasan_runen_circle_3_spl_fullheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void dia_taliasan_runen_circle_3_spl_summongolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};


instance DIA_TALIASAN_TRADE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_trade_condition;
	information = dia_taliasan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své magické svitky.";
};


func int dia_taliasan_trade_condition()
{
	if(TALIASANTEACHMAGIC == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Taliasan_Trade_01_01");	//Ukaž mi své magické svitky.

	if(TALIASAN_TRADE == 0)
	{
		CreateInvItems(self,ItSc_Zap,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		TALIASAN_TRADE += 1;
	};

	B_GiveTradeInv(self);
};


instance DIA_TALIASAN_TEACH_MANA(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 10;
	condition = dia_taliasan_teach_mana_condition;
	information = dia_taliasan_teach_mana_info;
	permanent = TRUE;
	description = "Přál bych si zvýšit svou magickou sílu.";
};

func int dia_taliasan_teach_mana_condition()
{
	if((TALIASANTEACHMAGIC == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MED) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_taliasan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Taliasan_TEACH_MANA_15_00");	//Přál bych si zvýšit svou magickou energii.
	AI_Output(self,other,"DIA_Taliasan_TEACH_MANA_15_01");	//S tím ti mohu pomoci. Jak ji využiješ, záleží jen na tobě.
	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA,"Regenerace many VB: 20, cena: 15000 zlatých)",DIA_Taliasan_TEACH_MANA_Regen);
	};
};

func void dia_taliasan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Taliasan_TEACH_MANA_05_00");	//Už ti nemohu pomoci, jsi příliš dobrý.
		AI_Output(self,other,"DIA_Taliasan_TEACH_MANA_05_01");	//Jsi na hranici svých možností!
	};

	Info_ClearChoices(dia_taliasan_teach_mana);
};

func void DIA_Taliasan_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Nauč mě regenerovat svou manu.

	kosten = 20;
	money = 15000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Regenerace many");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);
};

func void dia_taliasan_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA,"Regenerace many (VB: 30, cena: 15000 zlatých)",DIA_Taliasan_TEACH_MANA_Regen);
	};
};

func void dia_taliasan_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA,"Regenerace many (VB: 30, cena: 15000 zlatých)",DIA_Taliasan_TEACH_MANA_Regen);
	};
};

instance DIA_TALIASAN_CIRCLE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_circle_condition;
	information = dia_taliasan_circle_info;
	permanent = TRUE;
	description = "Přál bych si vstoupit do dalšího kruhu.";
};

func int dia_taliasan_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3) && (TALIASANTEACHMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_circle_info()
{
	AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_00");	//Přál bych si vstoupit do dalšího kruhu.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == FALSE) && (Kapitel >= 1))
	{
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE,"1. kruh magie (VB: 10, cena: 500 zlatých)",DIA_Taliasan_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE,"2. kruh magie (VB: 20, cena: 1000 zlatých)",DIA_Taliasan_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{	
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE,"3. kruh magie (VB: 30, cena: 2000 zlatých)",DIA_Taliasan_CIRCLE_3);
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_31");	//Ještě ne! Vrať se později.
	};
};

func void DIA_Taliasan_CIRCLE_back()
{
	Info_ClearChoices(DIA_Taliasan_CIRCLE);
};

func void DIA_Taliasan_CIRCLE_1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		if(B_TeachMagicCircle(self,other,1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_0A");	//Jsi připraven vstoupit do dalšího kruhu?
			AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_01");	//Jsem připraven vstoupit do prvního kruhu.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_01");	//Vstupem do Prvního kruhu se naučíš používat magické runy.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_02");	//Každá runa obsahuje strukturu speciálního magického svitku.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_03");	//Použitím vlastní magické síly, můžeš vytvořit magické runy.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_04");	//Ale na rozdíl od magických svitků, které jsou vlastně magickými formulemi, struktura runy udrží kouzlo navždy.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_05");	//Každá runa obsahuje magickou sílu, kterou můžeš použít kdykoliv.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_06");	//Stejné je to i se svitkem, jen s tím rozdílem, že svitek můžeš použít jen jednou.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_07");	//Každým nový kruhem budeš moci ovládat nové runy.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_08");	//Používej jejich sílu a poznej sám sebe.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dostatek zlata! Vrať se později.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};

func void DIA_Taliasan_CIRCLE_2()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_0B");	//Jsi připraven vstoupit do dalšího kruhu?
			AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_02");	//Jsem připraven vstoupit do druhého kruhu.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_09");	//Již ses naučil používat runy. Přišel čas prohloubit tvé znalosti.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_10");	//Vstupem do Druhého kruhu pochopíš základy silných bojových zaklínadel.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_11");	//Ale k poznání pravých tajemství magie budeš muset zvládnout mnohem víc.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_12");	//Už víš, že runy můžeš použít kolikrát chceš, ale jen do té doby, dokud máš manu.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_13");	//Ale předtím, než cokoliv uděláš si pamatuj, že čím větší máš moc, tím je i větší tvá zodpovědnost!
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_14");	//Pravý mág používá magii, jen když nemá na vybranou!
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_15");	//Nauč se vyhodnocovat situaci a pochopíš pravý význam run.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dostatek zlata! Vrať se později.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};


func void DIA_Taliasan_CIRCLE_3()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,2000);
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_0C");	//Jsi připraven vstoupit do dalšího kruhu?
			AI_Output(other,self,"DIA_Taliasan_CIRCLE_15_03");	//Co potřebuji znát pro třetí kruh?
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_16");	//Třetí kruh je jedním z nejdůležitějších bodů v životě mága. Když ho dosáhneš, najdeš to co hledáš.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_17");	//Už jsi udělal podstatný krok v pochopení magie. Umíš použít runy.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_18");	//Musíš jen chápat, jejich podstatu.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_19");	//Můžeš je použít, ale nemusíš. Sám se musíš rozhodnout.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_20");	//Když se rozhodneš, uděláš velký krok.
			AI_Output(self,other,"DIA_Taliasan_CIRCLE_14_21");	//Najdi svou cestu a pochop tak sílu svého rozhodnutí.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dostatek zlata! Vrať se později.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};

instance DIA_TALIASAN_BOOKSEEKXARDAS(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardas_condition;
	information = dia_taliasan_bookseekxardas_info;
	permanent = FALSE;
	description = "Hledám jednu vzácnou knihu.";
};


func int dia_taliasan_bookseekxardas_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (TALIASANTELLWHOMAGE == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardas_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_01_01");	//Hledám jednu vzácnou knihu.
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_01_03");	//Vypadá to,že se jmenuje 'Marná cesta'. Slyšel jsi o ní?
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_01_05");	//Řekni mi, proč se o ni zajímáš?
	Info_ClearChoices(dia_taliasan_bookseekxardas);
	Info_AddChoice(dia_taliasan_bookseekxardas,"Xardas ji potřebuje.",dia_taliasan_bookseekxardas_xardas);
	Info_AddChoice(dia_taliasan_bookseekxardas,"Jednoduše se zajímám o vzácné věci.",dia_taliasan_bookseekxardas_nothng);
};

func void dia_taliasan_bookseekxardas_xardas()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Xardas_01_01");	//Xardas ji potřebuje.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_02");	//Hmmm, dobře, myslel jsem si, že tě za mnou poslal... (s úšklebkem)
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_03");	//Nejspíš se nikdy neuklidní, dokud ji nebude mít v ruce.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_05");	//Je mi líto, ale musím tě zklamat, ale nyní ji už nemám.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_07");	//Prodal jsem ji jednomu pocestnému.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_09");	//Už si nevzpomínám. Bylo to tak dávno...(zamyšleně)
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Xardas_01_10");	//Určitě!...(rychle) Neztrácej zde svůj čas. Tady ji určitě nenajdeš.
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad mi řekl, že kdysi dávno prodal tuto knihu jednomu potulnému obchodníkovi. A přirozeně si nepamatuje jeho jméno. Nicméně se mi zdá, že Gallahad mi něco zamlčuje. Myslím, že bych si o tom měl promluvit s Xardasem.");
	XARDASMISSBOOKFOREVER = TRUE;
};

func void dia_taliasan_bookseekxardas_nothng()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_01");	//Jednoduše mě zajímají vzácné věci.
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_02");	//Ano? Kdo by to byl řekl... (udiveně)
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_03");	//Dal bys mi tu knihu?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_05");	//Kdysi jsem měl jednu kopii...
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_09");	//Jenže ty (zhrozen) žádáš příliš!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_12");	//Možná bych mohl udělat něco, co by vám vykouzlilo úsměv.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_15");	//(Přemýšlí) Pomohl jsi mi s Lariusem... A souhlasím, ale pouze výměnou za stejně cennou věc.
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_16");	//Zajímá tě něco speciálního?
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_18");	//Dones mi co chceš-elixír, rostlinu, svitek... Ale musí být cenný!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_19");	//Budu o tom přemýšlet.
		B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasí s tím, že mi dá tuto knihu, ale jen pokud mu za to dám nějakou jinou cennou věc. Řekl, že to může být cokoliv - elixír, rostlina, či svitek. Hlavně to musí být dostatečně vzácné.");
		XARDASBRIGBOOKSPECIAL = TRUE;
		Info_ClearChoices(dia_taliasan_bookseekxardas);
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_20");	//Ano?! Hmmm... (udiveně) Ale ty nevypadáš jako někdo, koho by toto zajímalo.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_26");	//Hmmm... No ano, mám jednu kopii.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_27");	//Ale tobě ji nedám. Ani v to nedoufej.
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardas_Nothng_01_28");	//Mohli bychom se dohodnout.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardas_Nothng_01_29");	//Zapomeň! Nevidím jediný důvod, proč bych ji měl dávat někomu jako ty!...(vztekle)
		B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad nevidí důvod, proč by mi měl tuto knihu dát. Zajímalo by mě, jestli jde nějak změnit jeho názor...");
		XARDASMISSBOOK = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_BOOKSEEKXARDASAFTER(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardasafter_condition;
	information = dia_taliasan_bookseekxardasafter_info;
	permanent = TRUE;
	description = "O té knize...";
};


func int dia_taliasan_bookseekxardasafter_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (XARDASMISSBOOK == TRUE) && (XARDASBRIGBOOKSPECIAL == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardasafter_info()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasAfter_01_00");	//O té knize...
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_01");	//Hmmm... (Zamyšleně) dobrá!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardasAfter_01_04");	//Ty chceš něco zvláštního?!
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_06");	//Vše co budeš mít - elixíry, rostliny, magická kouzla. Hlavně, že to bude vzácné!
		AI_Output(other,self,"DIA_Taliasan_BookSeekXardasAfter_01_07");	//Budu o tom přemýšlet.
		B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi knihu, ale pouze výměnou za něco cenného. Jak řekl, může to být cokoliv - elixíry, rostliny, magická kouzla. Moji cennou věc za jeho velmi cennou knihu!");
		XARDASBRIGBOOKSPECIAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_08");	//Už jsem ti řekl, že nevidím žádný důvod, proč bych ti ji měl dávat.
		AI_Output(self,other,"DIA_Taliasan_BookSeekXardasAfter_01_09");	//A nic se zatím nezměnilo. Nech mě na pokoji.
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_BOOKSEEKXARDASGIFT(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardasgift_condition;
	information = dia_taliasan_bookseekxardasgift_info;
	permanent = TRUE;
	description = "O cenných věcech pro tebe...";
};


func int dia_taliasan_bookseekxardasgift_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (XARDASBRIGBOOKSPECIAL == TRUE) && (GIVEXARDASSEEKBOOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardasgift_info()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_01_00");	//O zajímavých věcích pro tebe...
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_01_01");	//Ano?!... (se zájmem) Ty máš něco co by mě mohlo zajímat?
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
	if(Npc_HasItems(other,ItPo_Perm_STR) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Elixír síly.",dia_taliasan_bookseekxardasgift_potionstr);
	};
	if(Npc_HasItems(other,ItPo_Perm_DEX) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Elixír obratnosti.",dia_taliasan_bookseekxardasgift_potiondex);
	};
	if(Npc_HasItems(other,ItPo_Perm_Mana) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Elixír many.",dia_taliasan_bookseekxardasgift_potionmana);
	};
	if(Npc_HasItems(other,ItPo_Perm_Health) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Elixír života.",dia_taliasan_bookseekxardasgift_potionlife);
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Královský šťovík.",dia_taliasan_bookseekxardasgift_plantperm);
	};
	if(Npc_HasItems(other,itwr_xardasgoblinscroll) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift,"Svitek zapuzení.",dia_taliasan_bookseekxardasgift_scroll);
	};
	Info_AddChoice(dia_taliasan_bookseekxardasgift,"Možná později.",dia_taliasan_bookseekxardasgift_not);
};

func void dia_taliasan_bookseekxardasgift_not()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Not_01_00");	//Nic nemám.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Not_01_01");	//V takovém případě nemáme o čem mluvit.
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionstr()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_00");	//Toto je elixír síly.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_01");	//Hmmm... (Zamyšleně) To je velmi zvláštní předmět!
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_04");	//Tady, ber. A moje kniha?!
	B_GiveInvItems(other,self,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_05");	//Přirozeně! Jak jsem řekl - Tady je.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionStr_01_06");	//Buď opatrný, takovou nikde nenajdeš!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi tu knihu jako výměnu za elixír síly. Nyní bych ji měl přinést Xardasovi!");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potiondex()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_00");	//Toto je elixír obratnosti.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_01");	//Hmmm... (Zamyšleně) To je velmi zvláštní předmět!
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_04");	//Tady, ber. A moje kniha?!
	B_GiveInvItems(other,self,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_05");	//Přirozeně! Jak jsem řekl - Tady je.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionDex_01_06");	//Buď opatrný, takovou nikde nenajdeš!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi tu knihu jako výměnu za elixír obratnosti. Nyní bych ji měl přinést Xardasovi!");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionmana()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_00");	//Toto je elixír many.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_01");	//Hmmm... (Zamyšleně) To je velmi zvláštní předmět!
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_04");	//Tady, ber. A moje kniha?!
	B_GiveInvItems(other,self,ItPo_Perm_Mana,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_05");	//Přirozeně! Jak jsem řekl - Tady je.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionMana_01_06");	//Buď opatrný, takovou nikde nenajdeš!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi tu knihu jako výměnu za elixír many. Nyní bych ji měl přinést Xardasovi!");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionlife()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_00");	//Toto je elixír života.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_01");	//Hmmm... (Zamyšleně) To je velmi zvláštní předmět!
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_04");	//Tady, ber. A moje kniha?!
	B_GiveInvItems(other,self,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_05");	//Přirozeně! Jak jsem řekl - Tady je.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PotionLife_01_06");	//Buď opatrný, takovou nikde nenajdeš!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi tu knihu jako výměnu za elixír života. Nyní bych ji měl přinést Xardasovi!");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_plantperm()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_00");	//Toto je královský šťovík!
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_01");	//Hmmm... (Zamyšleně) To je velmi zvláštní předmět!
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_04");	//Tady, ber. A moje kniha?!
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_05");	//Přirozeně! Jak jsem řekl - Tady je.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_06");	//Buď opatrný, takovou nikde nenajdeš!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi tu knihu jako výměnu za královský šťovík. Nyní bych ji měl přinést Xardasovi!");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_scroll()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_00");	//Tady je svitek zapuzení!
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_01");	//Nemožné!... (Velmi udiveně) Toto je velmi zvláštní předmět! 
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_04");	//Tady, ber. A moje kniha?!
	B_GiveInvItems(other,self,itwr_xardasgoblinscroll,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_05");	//Přirozeně! Jak jsem řekl - Tady je.
	B_GiveInvItems(self,other,itwr_umsonst_01,1);
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_01_06");	//Buď opatrný, takovou nikde nenajdeš!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad souhlasil dát mi tu knihu jako výměnu za svitek zapuzení. Nyní bych ji měl přinést Xardasovi!");
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};


instance DIA_TALIASAN_TEACHDOITSC1(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_teachdoitsc1_condition;
	information = dia_taliasan_teachdoitsc1_info;
	permanent = TRUE;
	description = "Můžeš mě naučit i něco jiného?";
};

func int dia_taliasan_teachdoitsc1_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && (TALIASANTEACHMAGIC == TRUE) && (HOWCANMAKERUNE_ITSC == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_teachdoitsc1_info()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Scroll_55_01");	//Můžeš mě naučit i něco jiného?
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_55_02");	//Můžu tě naučit vytvářet magické svitky.
	AI_Output(self,other,"DIA_Taliasan_BookSeekXardasGift_Scroll_55_16");	//Ale nebude to zadarmo samozřejmě.
	HOWCANMAKERUNE_ITSC = TRUE;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Gallahad souhlasil, že mě naučí vytvářet magické svitky. Bude mě nicméně učit pouze takové magické formule, díky nímž mohu transformovat magickou energii do svitku. Budu také potřebovat stůl na výrobu svitků, pírko a runový papír.");
};

var int taliasan_counter;

instance DIA_TALIASAN_TEACHDOITSC2(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_teachdoitsc2_condition;
	information = dia_taliasan_teachdoitsc2_info;
	permanent = TRUE;
	description = "Nauč mě vytvářet svitky.";
};

func int dia_taliasan_teachdoitsc2_condition()
{
	if((HOWCANMAKERUNE_ITSC == 1) && (TALIASAN_COUNTER < 7))
	{
		return TRUE;
	};
};

func void dia_taliasan_teachdoitsc2_info()
{
	Info_ClearChoices(dia_taliasan_teachdoitsc2);
	Info_AddChoice(dia_taliasan_teachdoitsc2,"ZPĚT",dia_taliasan_teachdoitsc2_Back);

	if(HOWCANMAKERUNE_ITSC4 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Svitek 'Ledový blok' (VB: 2, cena: 500 zlatých)",dia_taliasan_teachdoitsc2_icecube);
	};
	if(HOWCANMAKERUNE_ITSC2 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Svitek 'Zničení nemrtvého' (VB: 4, cena: 750 zlatých)",dia_taliasan_teachdoitsc2_hurmundead);
	};
	if(HOWCANMAKERUNE_ITSC5 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Svitek 'Ledová vlna' (VB: 6, cena: 1000 zlatých)",dia_taliasan_teachdoitsc2_icewave);
	};
	if(HOWCANMAKERUNE_ITSC6 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Svitek 'Tornádo' (VB: 8, cena: 1250 zlatých)",dia_taliasan_teachdoitsc2_tornado);
	};
	if(HOWCANMAKERUNE_ITSC7 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Svitek 'Požírač zámků' (VB: 10, cena: 1500 zlatých)",dia_taliasan_teachdoitsc2_unlock);
	};
	if(HOWCANMAKERUNE_ITSC1 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2,"Svitek 'Ohnivý déšť' (VB: 10, cena: 2000 zlatých)",dia_taliasan_teachdoitsc2_firerain);
	};
};

func void dia_taliasan_teachdoitsc2_Back()
{
	Info_ClearChoices(dia_taliasan_teachdoitsc2);
};

func void dia_taliasan_teachdoitsc2_unlock()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1500) && (hero.lp >= 10))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1500);
		Npc_RemoveInvItems(self,ItMi_Gold,1500);
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		HOWCANMAKERUNE_ITSC7 = TRUE;
		AI_Print("Naučeno: Tvorba svitků - 'Požírač zámků'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1500)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dost zlata!
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 10)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_firerain()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 2000) && (hero.lp >= 10))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,2000);
		Npc_RemoveInvItems(self,ItMi_Gold,2000);
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		HOWCANMAKERUNE_ITSC1 = TRUE;
		AI_Print("Naučeno: Tvorba svitků - 'Ohnivý déšť'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 2000)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dost zlata.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 10)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_hurmundead()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 750) && (hero.lp >= 4))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,750);
		Npc_RemoveInvItems(self,ItMi_Gold,750);
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		HOWCANMAKERUNE_ITSC2 = TRUE;
		AI_Print("Naučeno: Tvorba svitků - 'Zničení nemrtvého'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 750)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dost zlata.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 4)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_icecube()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 500) && (hero.lp >= 2))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,500);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		HOWCANMAKERUNE_ITSC4 = TRUE;
		AI_Print("Naučeno: Tvorba svitků - 'Ledový blok'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 500)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dost zlata.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 2)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_icewave()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1000) && (hero.lp >= 6))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1000);
		Npc_RemoveInvItems(self,ItMi_Gold,1000);
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		HOWCANMAKERUNE_ITSC5 = TRUE;
		AI_Print("Naučeno: Tvorba svitků - 'Ledová vlna'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1000)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dost zlata.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 6)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_tornado()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1250) && (hero.lp >= 8))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1250);
		Npc_RemoveInvItems(self,ItMi_Gold,1250);
		hero.lp = hero.lp - 8;
		RankPoints = RankPoints + 8;
		HOWCANMAKERUNE_ITSC6 = TRUE;
		AI_Print("Naučeno: Tvorba svitků - 'Tornádo'");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1250)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other,"DIA_Taliasan_CIRCLE_03_90");	//Nemáš dost zlata.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 8)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

instance DIA_Taliasan_BuyBooks(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_BuyBooks_condition;
	information = DIA_Taliasan_BuyBooks_info;
	permanent = FALSE;
	description = "Zajímáš se o vzácné knihy?";
};

func int DIA_Taliasan_BuyBooks_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Taliasan_BuyBooks_info()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_01");	//Zajímáš se o vzácné knihy?
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_02");	//Jistě. (Důležitě) To je jedna z mála věcí o nichž mám opravdu velký zájem.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_03");	//Nějaká moudra se nedají koupit a to i za všechno zlato na světě. 
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_04");	//Co bych dostal kdybych vám nějaké přinesl?
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_05");	//Hmmm... Pěněz teď trochu mám ale stejně se mi platit nechce.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_06");	//Jako odměnu ti poskytnu svoje magické znalosti a zkušenosti.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Gallahad také shromažďuje vzácné knihy, takže pokud mu nějaké přinesu, na oplátku zvýší mé magické schopnosti a zkušenosti.");
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_07");	//Jako odměnu ti poskytnu tajemství větší životní energie a zkušenosti.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Gallahad také shromažďuje vzácné knihy, takže pokud mu nějaké přinesu, na oplátku zvýší mé zdraví a zkušenosti.");
	};

	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_08");	//Pokud ano, mám samozřejmě zájem.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_09");	//Nebo je můžeš prodat jinému obchodníkovi na náměstí.
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_10");	//Budu o tom přemýšlet.
	TalBuyBooks = TRUE;
};

var int BookTalCount;

instance DIA_Taliasan_BuyBooks_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_BuyBooks_Done_condition;
	information = DIA_Taliasan_BuyBooks_Done_info;
	permanent = TRUE;
	description = "Pokud jde o vzácné knihy...";
};

func int DIA_Taliasan_BuyBooks_Done_condition()
{
	if(TalBuyBooks == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Taliasan_BuyBooks_Done_info()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_01_01");	//Pokud jde o vzácné knihy...
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_02");	//(zájem) Ano? Co mi můžeš nabídnout?
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_01_03");	//Zde se podívej sám.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_04");	//Dobře. Počkej chvilku.
	B_UseFakeScroll();
	
	BookTalCount = FALSE;

	if((Npc_HasItems(hero,ITWR_CBOW_T1) >= 1) && (BookTalBonus_01 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_CBOW_T2) >= 1) && (BookTalBonus_02 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_EinhandBuch) >= 1) && (BookTalBonus_03 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_ZweihandBuch) >= 1) && (BookTalBonus_04 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ASTRONOMIE) >= 1) && (BookTalBonus_05 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEMONLANG) >= 1) && (BookTalBonus_06 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER1) >= 1) && (BookTalBonus_07 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER2) >= 1) && (BookTalBonus_08 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER3) >= 1) && (BookTalBonus_09 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,DAS_MAGISCHE_ERZ) >= 1) && (BookTalBonus_10 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT1) >= 1) && (BookTalBonus_11 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT2) >= 1) && (BookTalBonus_12 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_SOULRIVER) >= 1) && (BookTalBonus_13 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,ITWR_AZGOLOR) >= 1) && (BookTalBonus_14 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,ITWR_INNOSPRAY) >= 1) && (BookTalBonus_15 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_MANIAC) >= 1) && (BookTalBonus_16 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_KAMPFKUNST) >= 1) && (BookTalBonus_17 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_ELEMENTAREARCANEI) >= 1) && (BookTalBonus_18 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_JAGD_UND_BEUTE) >= 1) && (BookTalBonus_19 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,MYRTANAS_LYRIK) >= 1) && (BookTalBonus_20 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,WAHRE_MACHT) >= 1) && (BookTalBonus_21 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,MACHTVOLLE_KUNST) >= 1) && (BookTalBonus_22 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,GOETTERGABE) >= 1) && (BookTalBonus_23 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,GEHEIMNISSE_DER_ZAUBEREI) >= 1) && (BookTalBonus_24 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_UMSONST_01) >= 1) && (BookTalBonus_25 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_ANCIENT) >= 1) && (BookTalBonus_26 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE) >= 1) && (BookTalBonus_27 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE_2) >= 1) && (BookTalBonus_28 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEMONTALE) >= 1) && (BookTalBonus_29 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_SKELETONTALE) >= 1) && (BookTalBonus_30 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK1) >= 1) && (BookTalBonus_31 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK2) >= 1) && (BookTalBonus_32 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ELEMENTARE_ARCANEI) >= 1) && (BookTalBonus_33 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_MonasterySecret) >= 1) && (BookTalBonus_34 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK1) >= 1) && (BookTalBonus_35 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK2) >= 1) && (BookTalBonus_36 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK3) >= 1) && (BookTalBonus_37 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK4) >= 1) && (BookTalBonus_38 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK5) >= 1) && (BookTalBonus_39 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Astronomy_Mis) >= 1) && (BookTalBonus_40 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_VinosKellergeister_Mis) >= 1) && (BookTalBonus_41 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEATH1) >= 1) && (BookTalBonus_42 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEATH2) >= 1) && (BookTalBonus_43 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_HallsofIrdorath_Open_Mis) >= 1) && (BookTalBonus_44 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_XardasSeamapBook_Mis) >= 1) && (BookTalBonus_45 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Alchemy_01) >= 1) && (BookTalBonus_46 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Druid_01) >= 1) && (BookTalBonus_47 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};

	if(BookTalCount >= 1)
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_05");	//Zdá se, že jsou tam opravdu některé velmi zajímavé věci!
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_06");	//Myslím že si je vezmu všechny, nebudeš je potřebovat?
		Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
		Info_AddChoice(DIA_Taliasan_BuyBooks_Done,"Jen si je vem.",DIA_Taliasan_BuyBooks_Done_Yes);
		Info_AddChoice(DIA_Taliasan_BuyBooks_Done,"Budu o tom přemýšlet.",DIA_Taliasan_BuyBooks_Done_No);
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_07");	//Bohužel, nemáš ty knihy, o které bych měl opravdu zájem.
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_01_08");	//Radši to jdi prodat obchodníkům na náměstí! Ti na to maj místo.
	};
};


func void DIA_Taliasan_BuyBooks_Done_Yes()
{
	var int tempxpbook;

	BookTalCount = FALSE;

	if((Npc_HasItems(hero,ITWR_CBOW_T1) >= 1) && (BookTalBonus_01 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_CBOW_T1,1);
		CreateInvItems(self,ITWR_CBOW_T1,1);
		BookTalBonus_01 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_CBOW_T2) >= 1) && (BookTalBonus_02 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_CBOW_T2,1);
		CreateInvItems(self,ITWR_CBOW_T2,1);
		BookTalBonus_02 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_EinhandBuch) >= 1) && (BookTalBonus_03 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_EinhandBuch,1);
		CreateInvItems(self,ItWr_EinhandBuch,1);
		BookTalBonus_03 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_ZweihandBuch) >= 1) && (BookTalBonus_04 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_ZweihandBuch,1);
		CreateInvItems(self,ItWr_ZweihandBuch,1);
		BookTalBonus_04 = TRUE;
	};
	if((Npc_HasItems(hero,ASTRONOMIE) >= 1) && (BookTalBonus_05 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ASTRONOMIE,1);
		CreateInvItems(self,ASTRONOMIE,1);
		BookTalBonus_05 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEMONLANG) >= 1) && (BookTalBonus_06 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_DEMONLANG,1);
		CreateInvItems(self,ITWR_DEMONLANG,1);
		BookTalBonus_06 = TRUE;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER1) >= 1) && (BookTalBonus_07 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,LEHREN_DER_GOETTER1,1);
		CreateInvItems(self,LEHREN_DER_GOETTER1,1);
		BookTalBonus_07 = TRUE;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER2) >= 1) && (BookTalBonus_08 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,LEHREN_DER_GOETTER2,1);
		CreateInvItems(self,LEHREN_DER_GOETTER2,1);
		BookTalBonus_08 = TRUE;
	};
	if((Npc_HasItems(hero,LEHREN_DER_GOETTER3) >= 1) && (BookTalBonus_09 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,LEHREN_DER_GOETTER3,1);
		CreateInvItems(self,LEHREN_DER_GOETTER3,1);
		BookTalBonus_09 = TRUE;
	};
	if((Npc_HasItems(hero,DAS_MAGISCHE_ERZ) >= 1) && (BookTalBonus_10 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,DAS_MAGISCHE_ERZ,1);
		CreateInvItems(self,DAS_MAGISCHE_ERZ,1);
		BookTalBonus_10 = TRUE;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT1) >= 1) && (BookTalBonus_11 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,SCHLACHT_UM_VARANT1,1);
		CreateInvItems(self,SCHLACHT_UM_VARANT1,1);
		BookTalBonus_11 = TRUE;
	};
	if((Npc_HasItems(hero,SCHLACHT_UM_VARANT2) >= 1) && (BookTalBonus_12 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,SCHLACHT_UM_VARANT2,1);
		CreateInvItems(self,SCHLACHT_UM_VARANT2,1);
		BookTalBonus_12 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_SOULRIVER) >= 1) && (BookTalBonus_13 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_SOULRIVER,1);
		CreateInvItems(self,ITWR_SOULRIVER,1);
		BookTalBonus_13 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_AZGOLOR) >= 1) && (BookTalBonus_14 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_AZGOLOR,1);
		CreateInvItems(self,ITWR_AZGOLOR,1);
		BookTalBonus_14 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_INNOSPRAY) >= 1) && (BookTalBonus_15 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_INNOSPRAY,1);
		CreateInvItems(self,ITWR_INNOSPRAY,1);
		BookTalBonus_15 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_MANIAC) >= 1) && (BookTalBonus_16 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_MANIAC,1);
		CreateInvItems(self,ITWR_MANIAC,1);
		BookTalBonus_16 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_KAMPFKUNST) >= 1) && (BookTalBonus_17 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_KAMPFKUNST,1);
		CreateInvItems(self,ITWR_KAMPFKUNST,1);
		BookTalBonus_17 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_ELEMENTAREARCANEI) >= 1) && (BookTalBonus_18 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_ELEMENTAREARCANEI,1);
		CreateInvItems(self,ITWR_ELEMENTAREARCANEI,1);
		BookTalBonus_18 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_JAGD_UND_BEUTE) >= 1) && (BookTalBonus_19 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_JAGD_UND_BEUTE,1);
		CreateInvItems(self,ITWR_JAGD_UND_BEUTE,1);
		BookTalBonus_19 = TRUE;
	};
	if((Npc_HasItems(hero,MYRTANAS_LYRIK) >= 1) && (BookTalBonus_20 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,MYRTANAS_LYRIK,1);
		CreateInvItems(self,MYRTANAS_LYRIK,1);
		BookTalBonus_20 = TRUE;
	};
	if((Npc_HasItems(hero,WAHRE_MACHT) >= 1) && (BookTalBonus_21 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,WAHRE_MACHT,1);
		CreateInvItems(self,WAHRE_MACHT,1);
		BookTalBonus_21 = TRUE;
	};
	if((Npc_HasItems(hero,MACHTVOLLE_KUNST) >= 1) && (BookTalBonus_22 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,MACHTVOLLE_KUNST,1);
		CreateInvItems(self,MACHTVOLLE_KUNST,1);
		BookTalBonus_22 = TRUE;
	};
	if((Npc_HasItems(hero,GOETTERGABE) >= 1) && (BookTalBonus_23 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,GOETTERGABE,1);
		CreateInvItems(self,GOETTERGABE,1);
		BookTalBonus_23 = TRUE;
	};
	if((Npc_HasItems(hero,GEHEIMNISSE_DER_ZAUBEREI) >= 1) && (BookTalBonus_24 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,GEHEIMNISSE_DER_ZAUBEREI,1);
		CreateInvItems(self,GEHEIMNISSE_DER_ZAUBEREI,1);
		BookTalBonus_24 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_UMSONST_01) >= 1) && (BookTalBonus_25 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_UMSONST_01,1);
		CreateInvItems(self,ITWR_UMSONST_01,1);
		BookTalBonus_25 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_ANCIENT) >= 1) && (BookTalBonus_26 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_ANCIENT,1);
		CreateInvItems(self,ITWR_ANCIENT,1);
		BookTalBonus_26 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE) >= 1) && (BookTalBonus_27 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DRAGONTALE,1);
		CreateInvItems(self,ITWR_DRAGONTALE,1);
		BookTalBonus_27 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE_2) >= 1) && (BookTalBonus_28 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DRAGONTALE_2,1);
		CreateInvItems(self,ITWR_DRAGONTALE_2,1);
		BookTalBonus_28 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEMONTALE) >= 1) && (BookTalBonus_29 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEMONTALE,1);
		CreateInvItems(self,ITWR_DEMONTALE,1);
		BookTalBonus_29 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_SKELETONTALE) >= 1) && (BookTalBonus_30 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_SKELETONTALE,1);
		CreateInvItems(self,ITWR_SKELETONTALE,1);
		BookTalBonus_30 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK1) >= 1) && (BookTalBonus_31 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_GOLEMBOOK1,1);
		CreateInvItems(self,ITWR_GOLEMBOOK1,1);
		BookTalBonus_31 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_GOLEMBOOK2) >= 1) && (BookTalBonus_32 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_GOLEMBOOK2,1);
		CreateInvItems(self,ITWR_GOLEMBOOK2,1);
		BookTalBonus_32 = TRUE;
	};
	if((Npc_HasItems(hero,ELEMENTARE_ARCANEI) >= 1) && (BookTalBonus_33 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ELEMENTARE_ARCANEI,1);
		CreateInvItems(self,ELEMENTARE_ARCANEI,1);
		BookTalBonus_33 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_MonasterySecret) >= 1) && (BookTalBonus_34 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ItWr_MonasterySecret,1);
		CreateInvItems(self,ItWr_MonasterySecret,1);
		BookTalBonus_34 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK1) >= 1) && (BookTalBonus_35 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK1,1);
		CreateInvItems(self,ITWR_OLDBOOK1,1);
		BookTalBonus_35 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK2) >= 1) && (BookTalBonus_36 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK2,1);
		CreateInvItems(self,ITWR_OLDBOOK2,1);
		BookTalBonus_36 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK3) >= 1) && (BookTalBonus_37 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK3,1);
		CreateInvItems(self,ITWR_OLDBOOK3,1);
		BookTalBonus_37 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK4) >= 1) && (BookTalBonus_38 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK4,1);
		CreateInvItems(self,ITWR_OLDBOOK4,1);
		BookTalBonus_38 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK5) >= 1) && (BookTalBonus_39 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK5,1);
		CreateInvItems(self,ITWR_OLDBOOK5,1);
		BookTalBonus_39 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Astronomy_Mis) >= 1) && (BookTalBonus_40 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Astronomy_Mis,1);
		CreateInvItems(self,ItWr_Astronomy_Mis,1);
		BookTalBonus_40 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_VinosKellergeister_Mis) >= 1) && (BookTalBonus_41 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_VinosKellergeister_Mis,1);
		CreateInvItems(self,ItWr_VinosKellergeister_Mis,1);
		BookTalBonus_41 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEATH1) >= 1) && (BookTalBonus_42 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEATH1,1);
		CreateInvItems(self,ITWR_DEATH1,1);
		BookTalBonus_42 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEATH2) >= 1) && (BookTalBonus_43 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEATH2,1);
		CreateInvItems(self,ITWR_DEATH2,1);
		BookTalBonus_43 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_HallsofIrdorath_Open_Mis) >= 1) && (BookTalBonus_44 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(self,ItWr_HallsofIrdorath_Open_Mis,1);
		BookTalBonus_44 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_XardasSeamapBook_Mis) >= 1) && (BookTalBonus_45 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_XardasSeamapBook_Mis,1);
		CreateInvItems(self,ItWr_XardasSeamapBook_Mis,1);
		BookTalBonus_45 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Alchemy_01) >= 1) && (BookTalBonus_46 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Alchemy_01,1);
		CreateInvItems(self,ItWr_Alchemy_01,1);
		BookTalBonus_46 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Druid_01) >= 1) && (BookTalBonus_47 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Druid_01,1);
		CreateInvItems(self,ItWr_Druid_01,1);
		BookTalBonus_47 = TRUE;
	};

	tempxpbook= BookTalCount * 150;

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
	{
		B_GivePlayerXP(tempxpbook);
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,BookTalCount);
		Npc_ChangeAttribute(hero,ATR_MANA,BookTalCount);
		B_GiveInvItemsManyThings(other,self);
		AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_Yes_01_01");	//Ano, vezmu si je.
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_Yes_01_02");	//Nu, dobře. Já bych teď chtěl jak mi bylo slíbeno, zvýšit své magické schopnosti.
	}
	else
	{
		B_GivePlayerXP(tempxpbook);
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,BookTalCount);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,BookTalCount);
		B_GiveInvItemsManyThings(other,self);
		AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_Yes_01_05");	//Ano, vezmu si je.
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_Yes_01_06");	//Nu, dobře. Já bych teď chtěl jak mi bylo slíbeno, zvýšit svoje zdraví.
	};

	Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
};

func void DIA_Taliasan_BuyBooks_Done_No()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_Done_No_01_01");	//Musím se zamyslet.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_Done_No_01_02");	//Samozřejmě. Ale aby vás s toho nebolela hlava.
	Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
};

instance DIA_Taliasan_TestCanone(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_TestCanone_condition;
	information = DIA_Taliasan_TestCanone_info;
	permanent = FALSE;
	description = "Nemáte pro mě ještě nějakou práci?";
};

func int DIA_Taliasan_TestCanone_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_TALIASANHELP == LOG_SUCCESS) && (TaliasanNextQuest < daynow))
	{
		return TRUE;
	};
};

func void DIA_Taliasan_TestCanone_info()
{
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_00");	//Nemáte pro mě ještě nějakou práci?
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_01");	//Ano. Dobře, jsem rád, že ses zeptal.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_02");	//Mám teď jeden velmi důležitý obchod, ve které by se mě hodila tvoje pomoc.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_04");	//Před pár dny lord Hagen zadal úkol místním alchimistům, na výrobu magického prášku potřebného ke střelbě z děl.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_05");	//Zásoby paladinů se pomalu tenčí a situace se skřety je čím dál tím horší.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_06");	//Ale problém je v tom, že nikdo z místních mistrů nikdy s ničím takovým nepracoval.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_07");	//Jednoduše, nikdo z nich neví jak na to.
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_08");	//A co navrhuješ?
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_09");	//Ani si to nevyslechneš do konce, a už kladeš otázky. (podrážděně) Já jen, že mám recept na ten prášek!
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_10");	//A proč to neřekneš přímo lordu Hagenovi?
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_11");	//Protože nevím jestli to bude fungovat.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_12");	//A prostě nechci vypadat před lordem Hagenem jako blázen, když se to nepovede.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_13");	//Proto jsem udělal několik vzorků, a potřebuju někoho, kdo by otestoval jejich účinky.
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_14");	//Aha, takže to testování mám zajistit já.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_15");	//Přesně tak! No nakonec jsi prokázal trošku důvtipu.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_16");	//Tak, myslím že to pro tebe bude hračka.
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_17");	//Dobrá, povídej co mám dělat.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_18");	//Tady, vem si ten váček s magickým práškem a zkus ho vystřelit z nějaké zbraně.
	B_GiveInvItems(self,other,ItMi_MagicPowder,1);
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_19");	//Jen to prosím tě nedělej ve městě, nepotřebujem zbytečný rozruch.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_20");	//Najdi si nějaké klidné místo a tam střílej jak se ti zlíbí. Všechno jasné?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_21");	//Zcela.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_01_22");	//Dobře, budu očekávat tvoje hlášení.
	MIS_MagicPowder = LOG_Running;
	Log_CreateTopic(TOPIC_MagicPowder,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MagicPowder,LOG_Running);
	B_LogEntry(TOPIC_MagicPowder,"Gallahad chce, abych vyzkoušel jeho magický prášek pro střelbu z děla, než ho nabídne lordu Hagenovi. Musím najít nějaké odlehlé místo a vyzkoušet ho.");
	AI_StopProcessInfos(self);
};

instance DIA_Taliasan_TestCanone_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_TestCanone_Done_condition;
	information = DIA_Taliasan_TestCanone_Done_info;
	permanent = FALSE;
	description = "Co se týče tvého prášku...";
};

func int DIA_Taliasan_TestCanone_Done_condition()
{
	if((MIS_MagicPowder == LOG_Running) && (CanonIsFire == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Taliasan_TestCanone_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Taliasan_TestCanone_Done_01_00");	//Co se týče tvého prášku...
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_01");	//(se zájmem) Ano?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_Done_01_02");	//Je zřejmé, že funguje.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_03");	//Dalo by se s jeho pomocí střílet z děla?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_Done_01_04");	//Samozřejmě. vybuchnul tak, že mě uši zalehli.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_05");	//To je dobrá zpráva, nyní ho můžu nabídnout i lordu Hagenovi.
	AI_Output(self,other,"DIA_Taliasan_TestCanone_Done_01_06");	//Tady je tvoje odměna.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_MagicPowder = LOG_Success;
	Log_SetTopicStatus(TOPIC_MagicPowder,LOG_Success);
	B_LogEntry(TOPIC_MagicPowder,"Gallahada potěšilo, když se dozvěděl o úspěšné zkoušce prášku.");
};