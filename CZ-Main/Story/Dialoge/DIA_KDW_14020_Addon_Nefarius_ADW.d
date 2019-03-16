
instance DIA_Addon_Nefarius_ADW_EXIT(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 999;
	condition = DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_ADWHello(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_ADWHello_Condition;
	information = DIA_Addon_Nefarius_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_00");	//Uklidnilo mě, že jsi dorazil v pořádku.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_01");	//Jaktože jsi dorazil dřív než já?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_02");	//Cestovali jsme skrz zvláštní dimenzi. Kdo ví, kde ses točil.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_03");	//Zvláštní. Můžu použít portál i jindy?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_04");	//Dorazili jsme přesně sem. Funguje zřejmě velmi dobře.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_05");	//Dám ti vědět, kdybych měl podezření, že se něco změnilo.
};


instance DIA_Addon_Nefarius_Neues(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Neues_Condition;
	information = DIA_Addon_Nefarius_Neues_Info;
	description = "Co jsi do teď dělal?";
};

func int DIA_Addon_Nefarius_Neues_Condition()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Neues_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Co jsi do teď dělal?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_01");	//Studuji historii Stavitelů a snažím se přijít na to, proč portál uzavřeli.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_02");	//Vypadá to, jakoby chtěli skrýt toto ztracené město před zbytkem světa.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_03");	//Strašné věci se staly před mnoha lety. Něco strašného je posedlo.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_04");	//Pokud bychom věřili záznamům, tak předtím než bylo město prokleto tu zuřila děsivá občanská válka.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_05");	//Ulice byly v plamenech a hltající příliv nakonec zpečetil osudy Stavitelů.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_06");	//Těch pár, co přežili tohle peklo, uzavřelo tuto část ostrova s nadějí, že zde s ním uzamknou i zlo.
	Info_ClearChoices(DIA_Addon_Nefarius_Neues);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Co myslíš, že tady najdeme?",DIA_Addon_Nefarius_Neues_find);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"A my hlupáci znovu otevřeme portál...",DIA_Addon_Nefarius_Neues_auf);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Tak co rozrušilo Stavitele?",DIA_Addon_Nefarius_Neues_was);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Říkal jsi, že přišla potopa?",DIA_Addon_Nefarius_Neues_flut);
};

func void DIA_Addon_Nefarius_Neues_find()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_find_15_00");	//Co myslíš, že tady najdeme?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_01");	//To můžeme jenom hádat. Měl by sis promluvit spíš se Saturasem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_02");	//Máme jistý nápad.
	Log_CreateTopic(TOPIC_Addon_Flut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut,LOG_Running);
	B_LogEntry(TOPIC_Addon_Flut,"Nefarius si myslí, že bych si měl promluvit se Saturasem o tomhle městě v rujnách.");
	NefariusADW_Talk2Saturas = TRUE;
};

func void DIA_Addon_Nefarius_Neues_flut()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_flut_15_00");	//Říkal jsi, že přišla potopa?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_01");	//Adanos se jim sám zjevil aby ukončil tohle šílenství.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_02");	//A zatopil město.
};

func void DIA_Addon_Nefarius_Neues_was()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_was_15_00");	//Tak co rozrušilo Stavitele?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_01");	//Někdo z nich svěřil svou duši zlu. Byl to skvělý velitel Quarhodron.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_02");	//Když se vrátil z jedné úspěšné bitvy, přinesl s sebou i zlo.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_03");	//Všichni jeho přívrženci začali mít sklon k šílenství a začali bojovat proti svým vlastním lidem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_04");	//A nastávájíci občanská válka zničila všechno.
};

func void DIA_Addon_Nefarius_Neues_auf()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_auf_15_00");	//A my hlupáci jsme znovu otevřeli portál.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_01");	//Věř mi, taky mě to neteší.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_02");	//Ale neměli jsme na výběr?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_03");	//Pokud se nám nepodaří zastavit to, co se tady děje, Khorinis postihne stejný osud.
};

instance DIA_Addon_Nefarius_AncientRune(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Info;
	description = "Hledáš něco speciálního?";
};

func int DIA_Addon_Nefarius_AncientRune_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_AncientRune_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_01_00");	//Hledáš něco speciálního?
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_01");	//Snažím se přijít na to, jak používali Stavitelé magické runy!
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_02");	//O skutečnosti, že byli obeznámeni s pojmem magie, nepochybuji.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_03");	//V údolí existuje mnoho chrámů, v nichž by mělo být možné najít odpověď na tuto otázku.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_04");	//Ale, bohužel, moje další studie mě neumožňují se na to podívat.
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_01_05");	//Pokud něco najdu, určitě vám dám vědět.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_06");	//Spoléhám na to. Taková znalost nám pomůže hlouběji prozkoumat jejich kulturu.
	MIS_AncientRune = LOG_Running;
	Log_CreateTopic(TOPIC_AncientRune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AncientRune,LOG_Running);
	B_LogEntry(TOPIC_AncientRune,"Nefarius hledá důkazy, že Stavitelé uměli používat magické runy. Poradil mi hledat odpověď v chrámech, které se nacházejí v tomto údolí.");
};

instance DIA_Addon_Nefarius_AncientRune_Done(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Done_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Done_Info;
	description = "Něco pro tebe mám.";
};

func int DIA_Addon_Nefarius_AncientRune_Done_Condition()
{
	if((MIS_AncientRune == LOG_Running) && ((Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1) || (Npc_HasItems(hero,ItRu_SummonGuardian) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_AncientRune_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_00");	//Něco pro tebe mám.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_01");	//Hmmm... Opravdu?
	
	if(Npc_HasItems(hero,ItRu_SummonGuardian) >= 1)
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_02");	//Zdá se, že hledáš důkaz toho, že Stavitelé používali magické runy.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_03");	//Našel jsem jednu z těchto run!
		B_GiveInvItems(other,self,ItRu_SummonGuardian,1);
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_04");	//(Překvapeně) Neuvěřitelné! Kde jsi ji našel?
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_05");	//V Adanově chrámu. Zdá se, že byla používána k vyvolání kamenných strážců.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_06");	//Hmmm. (podívá se) S největší pravděpodobností.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_07");	//A zdá se, že princip jejího použití je stejný jako run, které používáme my.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_08");	//Můžeš si ji nechat, abys ji studoval.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_09");	//Nechal bych si ji, ale věřím, že se ti může ještě hodit.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_10");	//Takže si ji vem. A někdy, mě ji můžeš vrátit.
		B_GiveInvItems(self,other,ItRu_SummonGuardian,1);
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_11");	//Jak chceš.
		MIS_AncientRune = LOG_Success;
		Log_SetTopicStatus(TOPIC_AncientRune,LOG_Success);
		B_LogEntry(TOPIC_AncientRune,"Ukázal jsem Nefariusovi runu Stavitelů. Byl velmi spokojen s mým objevem!");
	}
	else if(Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_12");	//Zdá se, že hledáš důkaz toho, že Stavitelé používali magické runy.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_13");	//Našel jsem jednu z těchto run!
		B_GiveInvItems(other,self,ItMi_AncientRuneStone,1);
		Npc_RemoveInvItems(self,ItMi_AncientRuneStone,1);
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_14");	//(Překvapeně) Neuvěřitelné! Kde jsi ji našel?
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_15");	//V Adanově chrámu. Zdá se, že byla používána k vyvolání kamenných strážců.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_16");	//Hmmm. (podívá se) S největší pravděpodobností. Nicméně, já v ní necítím teď žádnou magii.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_17");	//Musel jsem použít magii runy pro své vlastní účely.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_18");	//Ale věř mi, byla tam!
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_19");	//V pořádku. Přinejmenším je to lepší než nic.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_20");	//Děkuji.
		NoRuneMagic = TRUE;
		MIS_AncientRune = LOG_Success;
		Log_SetTopicStatus(TOPIC_AncientRune,LOG_Success);
		B_LogEntry(TOPIC_AncientRune,"Dal jsem Nefariusovi runový kámen, bez magie.");
	};
};

instance DIA_Addon_Nefarius_AncientRune_Ext(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Ext_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Ext_Info;
	description = "Zůstal mě runový kámen Stavitelů.";
};

func int DIA_Addon_Nefarius_AncientRune_Ext_Condition()
{
	if((MIS_AncientRune == LOG_Success) && (NoRuneMagic == FALSE) && (Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_AncientRune_Ext_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Ext_01_00");	//Zůstal mě runový kámen Stavitelů.
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Ext_01_01");	//Avšak je zbaven kouzla. Potřebuješ ho?
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Ext_01_02");	//Můžeš ho dát mně. (Zamyšleně) Možná se může k něčemu hodit.
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Ext_01_03");	//Dobrá. Tady je.
	B_GiveInvItems(other,self,ItMi_AncientRuneStone,1);
	Npc_RemoveInvItems(self,ItMi_AncientRuneStone,1);
};

instance DIA_Addon_Nefarius_PermADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = DIA_Addon_Nefarius_PermADW_Condition;
	information = DIA_Addon_Nefarius_PermADW_Info;
	important = TRUE;
};

func int DIA_Addon_Nefarius_PermADW_Condition()
{
	if(NoEligorBuy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PermADW_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_02");	//Slyšel jsem že se chystáš na návštěvu do Hornického údolí.
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_03");	//Ano, je to tak.
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_04");	//Udělej nám laskavost - zajdi za vstup do Svobodného dolu. Někde by tam měl být jeden recept, který se může hodit.
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_05");	//Tady, vem si ten klíč.
	CreateInvItems(self,itke_freminekdw,1);
	B_GiveInvItems(self,other,itke_freminekdw,1);
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_06");	//Dobře, najdu ho pro tebe.
	MIS_NEFARIUS_POTIONADW = LOG_Running;
	Log_CreateTopic(TOPIC_NEFARIUS_POTIONADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEFARIUS_POTIONADW,LOG_Running);
	B_LogEntry(TOPIC_NEFARIUS_POTIONADW,"Nefarius potřebovat recept, který se nachází za vstupem do Svobodného dolu.");
};

instance DIA_ADDON_NEFARIUS1_PERMADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius1_permadw_condition;
	information = dia_addon_nefarius1_permadw_info;
	description = "Našel jsem tvůj recept.";
};

func int dia_addon_nefarius1_permadw_condition()
{
	if((MIS_NEFARIUS_POTIONADW == LOG_Running) && (Npc_HasItems(other,itwr_rezepturen) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius1_permadw_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_15_00");	//Našel jsem tvůj recept, ale nebyl ve Svobodném dole.
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_01");	//To není tak důležité... (ležérně) Dej to sem.
	B_GiveInvItems(other,self,itwr_rezepturen,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_02");	//Ano, výborně! To je on.
	Npc_RemoveInvItems(self,itwr_rezepturen,1);
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_15_03");	//A co je to za recept?
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_99");	//Zde je popsán způsob přípravy velmi silného lektvaru! Který se nazývá 'Ledový plášť'.
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_05_98");	//A co to dělá?
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_97");	//Může tě to ochránit před účinky temné magie.
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_15_05");	//To zní dobře. A můžu ho využít?
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_06");	//Sám ho uvařit nedokážeš, ale jako poděkování za jeho nalezení ti pomůžu.
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_10");	//Přines mi dvě srdcem ohnivého golema, tři perly a pět láhví grogu. A já ti pak uvařím tenhle skvělý lektvar.
	NEFARIUS_PERMADW = TRUE;
	B_LogEntry(TOPIC_NEFARIUS_POTIONADW,"Nefarius může uvařit lektvar - 'Ledový plášť'. Za tímto účelem je třeba: dvě srdce ohnivého golema, tři perly a pěti láhví grogu.");
};

instance DIA_ADDON_NEFARIUS2_PERMADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius2_permadw_condition;
	information = dia_addon_nefarius2_permadw_info;
	permanent = FALSE;
	description = "Uvař mi ten lektvar.";
};

func int dia_addon_nefarius2_permadw_condition()
{
	if((MIS_NEFARIUS_POTIONADW == LOG_Running) && (NEFARIUS_PERMADW == TRUE) && (Npc_HasItems(other,ItAt_FireGolemHeart) >= 2) && (Npc_HasItems(other,ItMi_Addon_WhitePearl) >= 3) && (Npc_HasItems(other,ItFo_Addon_Grog) >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius2_permadw_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Nefarius2_PermADW_15_00");	//Uvař mi ten lektvar.
	Npc_RemoveInvItems(other,ItAt_FireGolemHeart,2);
	Npc_RemoveInvItems(other,ItMi_Addon_WhitePearl,3);
	Npc_RemoveInvItems(other,ItFo_Addon_Grog,5);
	AI_Output(self,other,"DIA_Addon_Nefarius2_PermADW_15_01");	//Dobře! Počkej chvilku...
	AI_Output(self,other,"DIA_Addon_Nefarius2_PermADW_15_02");	//Tady máš. Užívej ho moudře, máš v rukách učiněný poklad.
	B_GiveInvItems(self,other,itpo_waterfire,1);
	MIS_NEFARIUS_POTIONADW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NEFARIUS_POTIONADW,LOG_SUCCESS);
	B_LogEntry(TOPIC_NEFARIUS_POTIONADW,"Nefarius mi připravil Ledový plášť.");
};

instance DIA_Addon_Nefarius_PreTeach(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_PreTeach_Condition;
	information = DIA_Addon_Nefarius_PreTeach_Info;
	description = "Mohl bys mě zasvětit do tajů magie?";
};

func int DIA_Addon_Nefarius_PreTeach_Condition()
{
	if((hero.guild == GIL_KDW) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PreTeach_15_00");	//Mohl bys mě zasvětit do tajů magie?
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_01");	//Můžu tě naučit vyrábět nějaké runy a Cronos ti na ně může prodat suroviny.
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_02");	//Vždycky u sebe má knihy o runách.
	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_NefariusTeach);
};

instance DIA_Addon_Nefarius_ADW_Runen(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_ADW_Runen_Condition;
	information = DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent = TRUE;
	description = "Uč mě (tvorba run).";
};

func int DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if(Nefarius_Addon_TeachRunes == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Uč mě!
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"6. kruh magie",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"5. kruh magie",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"4. kruh magie",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"3. kruh magie",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"2. kruh magie",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"1. kruh magie",DIA_Addon_Nefarius_ADW_Runen_1);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
};

func void DIA_Addon_Nefarius_ADW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),dia_addon_nefarius_adw_runen_circle_1_spl_icebolt);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};
	if(PLAYER_TALENT_RUNES[98] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSHOAL,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSHOAL)),dia_addon_nefarius_adw_runen_circle_2_spl_summonshoal);
	};
	if((PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_RapidIcebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidIcebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_spl_RapidIcebolt);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[89] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONICEGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONICEGOLEM)),dia_addon_nefarius_adw_runen_circle_4_spl_summonicegolem);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),dia_addon_nefarius_adw_runen_circle_5_spl_waterfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),dia_addon_nefarius_adw_runen_circle_6_spl_geyser);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),dia_addon_nefarius_adw_runen_circle_6_spl_thunderstorm);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_spl_RapidIcebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidIcebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_summonshoal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSHOAL);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_summonicegolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONICEGOLEM);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};


instance DIA_ADDON_NEFARIUS_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius_adw_prayforgomez_condition;
	information = dia_addon_nefarius_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_nefarius_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_ADW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADW_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADW_PrayForGomez_01_03");	//Myslím, že ti pomůže.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_NEFARIUS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius_adw_duringritual_condition;
	information = dia_addon_nefarius_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_nefarius_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

