
instance DIA_Zuris_EXIT(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 999;
	condition = DIA_Zuris_EXIT_Condition;
	information = DIA_Zuris_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Zuris_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Zuris_Sperre(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Sperre_Condition;
	information = DIA_Zuris_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Zuris_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Sperre_Info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//Jsi trestanec, co utekl z Hornického údolí. Vypadni!
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_GREET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_GREET_Condition;
	information = DIA_Zuris_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Zuris_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_GREET_Info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//Jsem Zuris, mistr lektvarů.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//Potřebuješ esenci hojivé síly nebo nějaký magický elixír? Pak jsi na správném místě.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Zuris prodává na tržišti lektvary.");
};

var int Zuris_einmal;
var int VatrasBookIns;
var int TrollPlantUp;
var int GrokBringPotionUp;
var int ZurisAddPermMana;

instance DIA_Zuris_WAREZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_WAREZ_Condition;
	information = DIA_Zuris_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int DIA_Zuris_WAREZ_Condition()
{
	if(Wld_IsTime(5,30,20,0))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//Ukaž mi své zboží.

	if((Zuris_einmal == FALSE) && !Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//Právě jsem dostal nějaké nové lektvary. Můj host - mág Ohně, mistr Daron - mi je donesl přímo z kláštera.
		Zuris_einmal = TRUE;
	};
	if((Kapitel >= 1) && (VatrasBookIns == FALSE) && (MagicBookFindTrade == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		CreateInvItems(self,ItWr_VatrasDiary,1);
		VatrasBookIns = TRUE;
	};
	if((SeekCactus == TRUE) && (ZurisAddPermMana == FALSE))
	{
		CreateInvItems(self,ItPo_Perm_Mana,1);
		CreateInvItems(self,ItPl_Perm_Herb,1);	
		ZurisAddPermMana = TRUE;
	};
	if((XardasDoMagicRoot == TRUE) && (TrollPlantUp == FALSE))
	{
		CreateInvItems(self,ITPL_SUPER_HERB,1);
		TrollPlantUp = TRUE;
	};
	if((MIS_GrokBringPotion != FALSE) && (GrokBringPotionUp == FALSE))
	{
		CreateInvItems(self,ItPo_Perm_STR,1);
		GrokBringPotionUp = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Zuris_Potions(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_POTIONS_Condition;
	information = DIA_Zuris_POTIONS_Info;
	permanent = FALSE;
	description = "Mícháš si také nějaké vlastní elixíry?";
};


func int DIA_Zuris_POTIONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_GREET))
	{
		return TRUE;
	};
};

func void DIA_Zuris_POTIONS_Info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//Mícháš si také nějaké vlastní elixíry?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//Ne, buď je dostávám z kláštera, nebo si je kupuji u alchymisty Constantina.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//Pokud tě zajímá míchání lektvarů, pak neváhej a promluv si s ním. Nějakého pomocníka jistě potřebuje.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//Ale je moc umíněný, než aby si někoho najal sám. Je paličatý jak mezek.
	};

	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//Když jde trhat ty své rostliny, vždycky prochází přímo kolem mě.
};

instance DIA_Zuris_Kraut(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kraut_Condition;
	information = DIA_Zuris_Kraut_Info;
	permanent = FALSE;
	description = "Kde přesně Constantino ty své byliny sbírá?";
};

func int DIA_Zuris_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kraut_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//Kde přesně Constantino ty své byliny sbírá?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//Pokaždé projde tady východní branou a pak zmizí v divočině nalevo.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//Jednou mi vykládal, že tu roste skoro všechno kromě královského šťovíku.
	MikaHaveKey = TRUE;
	Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_08");
	Wld_InsertItem(ItPl_Strength_Herb_01,"FP_ROAM_CITY_TO_FOREST_10");
	Wld_InsertItem(ItPl_Mushroom_02,"FP_ITEM_HERB_10");
	Wld_InsertItem(ItPl_Mushroom_01,"FP_ITEM_HERB_09");
};


instance DIA_Zuris_Kronstoeckel(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kronstoeckel_Condition;
	information = DIA_Zuris_Kronstoeckel_Info;
	permanent = FALSE;
	description = "Zmínil se Constantino někdy, kde hledat královský šťovík?";
};


func int DIA_Zuris_Kronstoeckel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kronstoeckel_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//Zmínil se Constantino někdy, kde hledat královský šťovík?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//Jednou jsem slyšel, jak říká, že ten nejlepší roste poblíž kamenných kruhů.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//U Lobartova statku - to je kousek od druhé brány - se jeden takový kamenný kruh nachází.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//Myslím, že leží na kopci. Dřív to bývalo nějaké pohřebiště nebo tak něco.
	Wld_InsertItem(ItPl_Perm_Herb,"FP_ITEM_HERB_11");
};


instance DIA_Zuris_WHERE(C_Info)
{
	npc = VLK_409_Zuris;
	condition = DIA_Zuris_WHERE_Condition;
	information = DIA_Zuris_WHERE_Info;
	permanent = FALSE;
	description = "Kde bych Constantina našel?";
};


func int DIA_Zuris_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_Potions) && (Constantino.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WHERE_Info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//Kde bych Constantina našel?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//Jeho obydlí najdeš v průchodu poblíž Haradovy kovárny. Určitě ho nemineš.
};


instance DIA_Zuris_Kloster(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kloster_Condition;
	information = DIA_Zuris_Kloster_Info;
	description = "Pověz mi něco o klášteře.";
};


func int DIA_Zuris_Kloster_Condition()
{
	if(Zuris_einmal == TRUE)
	{
		return FALSE;
	};
	return TRUE;
};

func void DIA_Zuris_Kloster_Info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//Pověz mi něco o klášteře.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//O tom by sis měl radši pohovořit přímo s Daronem. Ten ví daleko víc než já.
};


instance DIA_Zuris_Minenanteil(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = DIA_Zuris_Minenanteil_Condition;
	information = DIA_Zuris_Minenanteil_Info;
	description = "Ty prodáváš důlní akcie?";
};


func int DIA_Zuris_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Zuris_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//Ty prodáváš důlní akcie?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//Ano, některé šly ale rapidně dolů. To je naposled, co jsem se pustil do něčeho takhle podezřelého!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_ZURIS_TRADEPLACE(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = dia_zuris_tradeplace_condition;
	information = dia_zuris_tradeplace_info;
	description = "Mluv, prý jsi měl nějaké problémy s Jorou.";
};


func int dia_zuris_tradeplace_condition()
{
	if(MIS_JORAHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_zuris_tradeplace_info()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_01_00");	//Mluv, prý jsi měl nějaké problémy s Jorou.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_04");	//Ale je to pravda... Měl jsem nějaké nedorozumění s Jorou. trochu jsme se nepohodli.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_06");	//(Hmm! nemyslím si, že je to tvoje věc, ale čas už změnil můj přístup k věci... (naštvaný)
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_07");	//... Prostě a jednoduše jsem zvedl nájemné mého stánku, který má pronajmutý Jora a kde teď prodává své zboží.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_08");	//Nebylo to nic příjemného to udělat jemu a ani kupeckému cechu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_09");	//Určitě jsi už o něm něco slyšel, ne?
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Nemyslím, že tohle je důležité.",dia_zuris_tradeplace_hearguildno);
	Info_AddChoice(dia_zuris_tradeplace,"Ano, slyšel jsem o nich.",dia_zuris_tradeplace_hearguildyes);
};

func void dia_zuris_tradeplace_hearguildno()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildNo_01_00");	//Nemyslím, že tohle je důležité.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildNo_01_01");	//Opravdu? Zajímavé... (zamyšleně) No, toto není důležité!
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildNo_01_02");	//Takže povíš mi, proč jsi zvedl Jorův nájem, nebo ne?
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildNo_01_05");	//No... Přirozeně zaplatil dost. Ale jedna osoba mi nabídla velice dobrou cenu za Jorův stánek.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildNo_01_06");	//Já jsem si nemohl dovolit odmítnout!
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Takže to vše kvůli penězům?!",dia_zuris_tradeplace_ask);
};

func void dia_zuris_tradeplace_hearguildyes()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildYes_01_00");	//Ano, slyšel jsem o nich.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_01");	//Ano?! Hmm... To je zajímavé, odkud?... (udiveně) Asi nemůžeš mluvit...
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_04");	//Jen členové cechu ví, že kupecký cech existuje!... (zlomyslně)
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_05");	//A také několik obchodníků jako jsem já, ale to ty pravděpodovně nebudeš, že ano?!
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildYes_01_06");	//A co tím myslíš?
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_07");	//To, že asi jsi jeden z lidí toho zabedněnce Lutera!
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_08");	//A pravděpodobně ti pověděl o mých problémech s Jorou.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_10");	//Co sis o mě myslel, když jsi za mnou přišel? Máš mě snad za idiota?!... (škodolibě)
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildYes_01_11");	//Poslouchej...!
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_12");	//... (přerušení) Nechci tě poslouchat a nechci se s tebou bavit! Už ti nic neřeknu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_13");	//A své rozhodnutí ohledně Jory nezměním! Takže můžeš jít za Luterem a říci mu to!... (škodolibě)
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Lutero bude touto informací velice podrážděn.",dia_zuris_tradeplace_lutero);
	Info_AddChoice(dia_zuris_tradeplace,"Tvá pomsta Luterovi nevyřeší tvé problémy.",dia_zuris_tradeplace_problem);
	Info_AddChoice(dia_zuris_tradeplace,"Můžeme se dohodnout!",dia_zuris_tradeplace_deal);
	Info_AddChoice(dia_zuris_tradeplace,"Jestli nezměníš své mínění v této záležitosti, nezbývá mi než tě zabít!",dia_zuris_tradeplace_dead);
};

func void dia_zuris_tradeplace_ask()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Ask_01_00");	//Takže to vše kvůli penězům?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_01");	//No, ne jen kvůli nim... (zlomyslně)
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_02");	//V poslední době nemám s cechem obchodníků zrovna ty nejlepší vztahy.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Ask_01_04");	//Ale proč? Co se stalo?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_05");	//Vidím, že toto téma tě velmi zaujalo...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_06");	//Pověz, proč jsi tak zaujatý tímto nezáživným tématem?
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Mám starost o Joru.",dia_zuris_tradeplace_jora);
	Info_AddChoice(dia_zuris_tradeplace,"Zajímá mě Jorovo místo.",dia_zuris_tradeplace_place);
	Info_AddChoice(dia_zuris_tradeplace,"Prostě to začíná být zajímavé.",dia_zuris_tradeplace_interes);
	Info_AddChoice(dia_zuris_tradeplace,"Lyutero has sent me to discuss with you this problem.",dia_zuris_tradeplace_luterozuris);
};

func void dia_zuris_tradeplace_interes()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Interes_01_00");	//Prostě to začíná být zajímavé.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Interes_01_01");	//Ha! jestli tě to zajímá, tak nechápu proč jednoduše nejdeš do horní čtvrti a jednoduše neposloucháš.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Interes_01_04");	//Lidé obyčejně nemají ve zvyku mrhat časem.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Interes_01_05");	//Takže s tebou dál nehodlám mluvit na toto téma, zmiz!... (naštvaný)
	B_LogEntry(TOPIC_JORAHELP,"Nedokázal jsem se se Zurisem dohodnout ohledně Jory. zuris už se mnou nechce mluvit a myslím, že tohle Lutera moc nepotěší...");
	ZURISPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_luterozuris()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_LuteroZuris_01_00");	//Lutero mě poslal vyřešit tento problém.
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_01");	//Cože? Takže tebe za mnou poslal Lutero?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_04");	//Lutero si myslel, že bys ovlivnil mé rozhodnutí s Jorou?!...
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_06");	//Jestli něco potřebuje, má přijít sám a ne posílat tebe!
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_10");	//Své rozhodnutí nezměním, jdi a řekni to Luterovi...
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Lutero nebude zrovna potěšen.",dia_zuris_tradeplace_lutero);
	Info_AddChoice(dia_zuris_tradeplace,"Můžeme se domluvit!",dia_zuris_tradeplace_deal);
};

func void dia_zuris_tradeplace_lutero()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Lutero_01_00");	//Lutero nebude zrovna potěšen.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Lutero_01_01");	//Tvá rozhodnutí mohou také ovlivnit názory cechu...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Lutero_01_02");	//... To je něco jiného!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Lutero_01_03");	//A cechu by to bylo k ničemu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Lutero_01_04");	//Už s tebou nebudu více rozebírat toto téma, zmiz!
	B_LogEntry(TOPIC_JORAHELP,"Jakmile Zuris zjistil, že jdu od Lutera, okamžitě se se mnou přestal bavit a poslal mě zpět za ním.");
	ZURISFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_deal()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_00");	//Můžeme se dohodnout!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_01");	//Ano? A jak?!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_02");	//No, mohl bych to místo koupit.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_03");	//Cože? A ty si myslíš, že bych ti ho prodal?!... (udiveně)
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_04");	//Ano, myslím! Vše má svoji cenu!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_08");	//Ohledně ceny... No, obávám se, že ti nebude po chuti!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_09");	//Kolik ti nabízel ten kupec?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_10");	//To není tvoje věc!... (škodolibě)
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_13");	//Hmm... Musím se rozmyslit...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_14");	//... Myslím, že 10 000 zlatých je slušná nabídka.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_15");	//Deset tisíc? Ale to je hodně!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_16");	//To je má cena. Můžeš ji přijmout nebo odmítnout.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_20");	//Samozřejmě chápu, že takové peníze jen tak neseženeš...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_21");	//Ale cech ti možná vypomůže
	B_LogEntry(TOPIC_JORAHELP,"Řekl jsem Zurisovi proč mě Lutero poslal. Souhlasil, že mi stánek prodá, ale za 10 000 zlatých. Možná mi nějaké peníze poskytne cech!");
	ZURISTRADEPLACEYES = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_jora()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_00");	//Mám starost o Joru!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_01");	//Ano? A proč se zajímáš o jeho problémy?
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_02");	//Jora je poctivý člověk a dobrý obchodník!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_03");	//Když mu vezmeš jeho místo, přijde na mizinu nejen on, ale i hodně lidí, kteří využívají jeho levného zboží.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_11");	//Proti Jorovi nic nemám, ale je to obchodník, který se nechá ovládat druhými.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_12");	//A proto je to stejný zabedněnec jako zbytek cechu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_13");	//A proto je pro mě příjemné jakkoli potrápit Lutera!... (škodolibě)
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_15");	//Takže to vše kvůli Luterovi?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_16");	//Přesně tak!
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Tvá pomsta Luterovi nevyřeší tvé problémy s ním.",dia_zuris_tradeplace_problem);
	Info_AddChoice(dia_zuris_tradeplace,"Jestli své rozhodnutí nezměníš, zabiju tě!",dia_zuris_tradeplace_dead);
};

func void dia_zuris_tradeplace_dead()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Dead_01_00");	//Jestli své rozhodnutí nezměníš, zabiju tě!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Dead_01_01");	//Cože?! Jak se mi opovažuješ vyhrožovat?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Dead_01_07");	//Stráže! Stráže! (začíná řvát)
	CreateInvItems(self,itwr_zurisdocs,1);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_zuris_tradeplace_place()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_00");	//Zajímá mě Jorovo místo.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_02");	//Důvod je ten, že bys mi ho mohl prodat.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_03");	//Ale já už kupce mám... A také neměním své rozhodnutí jen tak!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_05");	//Mohl bych ti nabídnout lepší cenu než máš.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_10");	//Přemýšlím...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_11");	//... 5 000 zlatých je lepší než nabídl starý kupec.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_12");	//Pět tisíc? To jsou slušné peníze!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_13");	//Slušné peníze za slušné místo.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_14");	//Dobrá, seženu ti tu sumu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_15");	//Času máš dost. Zhruba celé tři týdny!
	B_LogEntry(TOPIC_JORAHELP,"Zuris mi nabídl stánek odkoupit za 5 000 zlatých! mám na to tři týdny, takže bych měl zajít za Luterem a zeptat se, jestli cech nemá nějaké zdroje pro tento účel!");
	ZURISTRADEPLACEYESCHIP = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_problem()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_00");	//Tvá pomsta Luterovi nevyřeší tvé problémy s ním.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_02");	//Tvá pomsta ho nesesadí z jeho pozice.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_05");	//Nemůžeš zpochybnit moje důvody!...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_09");	//Hmmm... Měl jsem s Luterem jednu dohodu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_11");	//Zaručil se mi, že cech mi dopraví jeden velice zvláštní a cenný lektvar. Je náročný na přípravu a má velkou moc - Eligorův plamen.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_12");	//Měl by tvému tělu umožnit pochopit sílu ohně a dát mu tak obrovskou imunitu vůči němu.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_13");	//Zde v Khorinisu ho vytvořit nemůžu, protože suroviny na výrobu se ke mě jen tak nedostanou...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_23");	//Když Lutero byl na pevnině, mluvil s ostatními velkými kupci a slyšel, že jeden by něco takového mohl mít.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_24");	//Samozřejmě za ten lektvar chtěl dost peněz, ale tu cenu to má!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_28");	//Ale jakmile se mu dostal do rukou, zlomil cenu a nasadil ji nehorázně vysoko!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_29");	//Třikrát více, než bylo dohodnuto!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_30");	//Přirozeně jsem tolik penět neměl!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_31");	//Znamená to, že lutero porušil dohodu?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_32");	//Ano, porušil dohodu, nechal se zaslepit zlatým leskem...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_33");	//A ještě promrhal tento poklad...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_34");	//Někdo mu pár dní po té vybílil dům včetně elixíru.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_38");	//A proto chci Luterovi oplatit stejnou mincí.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_39");	//To chápu, ale není fér, aby na to dopláceli obyčejní lidé.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_40");	//Také je možné, že Lutero toho lutuje a chce svou chybu napravit...
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_43");	//Je něco, co by tě donutilo změnit úhel pohledu?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_48");	//Hmmm... Ale proč bys něco takového dělal?
	B_LogEntry(TOPIC_JORAHELP,"Promluvil jsem si se Zurisem ohledně Jorova stánku. Po dlouhé rozmluvě jsem se dozvěděl, že měl kdysi s Luterem dohodu ohledně jistého lektvaru jménem Plamen Eligiora. Lutero ho podvedl a od té doby ho Zuris snaží shodit. Zeptal jsem se ho, jestli bych mohl jejich spor nějak urovnat...");
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Jednoduše chci pomoct.",dia_zuris_tradeplace_help);
};

func void dia_zuris_tradeplace_help()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Help_01_00");	//Jednoduše chci pomoct.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_07");	//Ano, on. Jestli ho získáš, změním své rozhodnutí ohledně Jory.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_08");	//Samozřejmě ti také v rozumných mezích uhradím náklady na cestu!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Help_01_15");	//Myslíš, že ho ještě neužil?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_16");	//Myslím, že ne. Lidé většinou nemají tušení co se jim dostalo do rukou a poklady prodávají.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_19");	//Nemám ponětí kde začít hledat.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_20");	//To ti nepomůžu, ale můžeš zkusit Lutera.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_21");	//Pravděpodobně by něco věděl.
	B_LogEntry(TOPIC_JORAHELP,"Zuris souhlasil, že když najdu Eligorův plamen, tak nechá Jorův stánek stánkem. S pátráním bych měl začít u Lutera...");
	ZURISGIVEMETASK = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ZURIS_FUCKOFF(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_fuckoff_condition;
	information = dia_zuris_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_zuris_fuckoff_condition()
{
	if((ZURISFUCKOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_zuris_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ZURIS_GIVEMETASKOK(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_givemetaskok_condition;
	information = dia_zuris_givemetaskok_info;
	permanent = FALSE;
	description = "Našel jsem ten ztracený lektvar.";
};


func int dia_zuris_givemetaskok_condition()
{
	if((ZURISGIVEMETASK == TRUE) && (Npc_HasItems(other,itpo_eligorfire) >= 1))
	{
		return TRUE;
	};
};

func void dia_zuris_givemetaskok_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_01_00");	//Našel jsem ten ztracený lektvar.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_03");	//Nemožné, tomu nemůžu uvěřit!
	B_GiveInvItems(other,self,itpo_eligorfire,1);
	Npc_RemoveInvItems(self,itpo_eligorfire,1);
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_07");	//U Innose, konečně jsem ten poklad našel!
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_08");	//Tvůj dar mě opravdu potěšil, hrdino!
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_01_09");	//Jsem rád, ale ještě něco víc.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_10");	//Ohledně Jory si nedělej starosti, dodržím svou dohodu.

	if(LUTEROAGREEMEETZURIS == TRUE)
	{
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_13");	//No, během tvé nepřítomnosti jsem trochu přemýšlel a došel k závěru, že to nebude jen tak, ale máš i jiné důvody...
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_14");	//... Jiné než ty, o kterých jsi mi říkal.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_15");	//Kromě toho jsem v poslední době navštívil jednu osobu a schůzka s ní trochu změnila můj pohled na věc...
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_21");	//Měl jsem s ním dlouhý rozhovor, ale nakonec jsme dospěli k závěru, že naše spory jsou pro nás nepříznivé!
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_22");	//Mimo jiné mi řekl pravou příčinu proč mi neprodal ten lektvar a byla tak přesvědčivá, že jsem mu musel uvěřit!
		Info_ClearChoices(dia_zuris_givemetaskok);
		Info_AddChoice(dia_zuris_givemetaskok,"Ano, to je pravda... (přiznat)",dia_zuris_givemetaskok_iknow);
		Info_AddChoice(dia_zuris_givemetaskok,"To nevím!",dia_zuris_givemetaskok_tellme);
	}
	else
	{
		AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_01_25");	//Znamená to, že Jora zase obchoduje?
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_26");	//Ano, a dokonce jsem se rozhodl cenu snížit za tvoje služby.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_27");	//A samozřejmě ti chci dát toto zlato jako dík.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_28");	//Jak jsem slíbil!
		B_GiveInvItems(self,other,ItMi_Gold,200);
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_30");	//Taky si myslím, a teď mě omluv, musím jít pracovat.
		ZURISGIVEMETASKOK = TRUE;
		NoEligorBuy = TRUE;
		AI_StopProcessInfos(self);
	};
};

func void dia_zuris_givemetaskok_iknow()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Iknow_01_00");	//Ano, to je pravda.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_01");	//Myslel jsem si to - kromě toho Lutero mi vše řekl a to i o průběhu tvé práce pro Joru.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_14");	//Chtěl bych ti poděkovat za tvou práci.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_15");	//Místo toho elixíru, co jsi mi přinesl ti dám jiný - není sice tak cenný jako Plamen, ale...
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_16");	//... Jeho vlastnosti jsou také dobré.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_17");	//Užij ho rozumně.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_19");	//A teď mě nech pracovat.
	ZURISGIVEMETASKOK = TRUE;
	ZURISGIVEMETASKOKBONUS = TRUE;
	NoEligorBuy = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_givemetaskok_tellme()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Tellme_01_00");	//To nevím!
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_01");	//Opravdu?!... No, očekával jsem od tebe trochu jinou odpověď.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_05");	//Lutero mi řekl o té věci s Jorou.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_21");	//Chtěl bych ti poděkovat za tvou práci.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_22");	//Dám ti také jeden lektvar, není tak sílný jako Plamen, ale potěší...
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_23");	//... jeho vlastnosti jsou také dobré.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_25");	//Toť vše...
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_26");	//Jen když mám Plamen u sebe, už pro mě nepředstavuje takovou cenu.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_29");	//Teď má pro mě stejnou hodnotu jako ostatní lektvary a rozhodl jsem se ho prodat. Rozdíl bude jen v ceně.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_30");	//Můj sen se naplnil a je načase, aby si ho splnil i někdo jiný.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_31");	//Možná by tě to mohlo zajímat.
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Tellme_01_32");	//To jako že bych ho od tebe mohl odkoupit?
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_35");	//Pouhých 7 000 a je tvůj!
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Tellme_01_36");	//Bezva, jseš si jistý?
	ZURISGIVEMETASKOK = TRUE;
	ZURISGIVEMETASKOKBONUS = TRUE;
	TRADEELIGORFIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ZURIS_TRADEELIGORFIRE(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_tradeeligorfire_condition;
	information = dia_zuris_tradeeligorfire_info;
	permanent = TRUE;
	description = "Prodej mi Eligorův plamen.";
};

func int dia_zuris_tradeeligorfire_condition()
{
	if((TRADEELIGORFIRE == TRUE) && (TRADEELIGORFIREOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_tradeeligorfire_info()
{
	AI_Output(other,self,"DIA_Zuris_TradeEligorFire_01_00");	//Prodej mi Eligorův plamen.

	if(Npc_HasItems(other,ItMi_Gold) >= 7000)
	{
		AI_Output(self,other,"DIA_Zuris_TradeEligorFire_01_02");	//Tak - tady je!
		Npc_RemoveInvItems(other,ItMi_Gold,7000);
		B_GiveInvItems(self,other,itpo_eligorfire,1);
		AI_Output(other,self,"DIA_Zuris_TradeEligorFire_01_03");	//Díky!
		TRADEELIGORFIREOK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Zuris_TradeEligorFire_01_05");	//Počkej, nemáš dost zlata!
		AI_Output(self,other,"DIA_Zuris_TradeEligorFire_01_08");	//Přijď až budeš mít sedm tisíc.
	};
};


instance DIA_ZURIS_ZURISTRADEPLACEME(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_zuristradeplaceme_condition;
	information = dia_zuris_zuristradeplaceme_info;
	permanent = TRUE;
	description = "Prodej mi Jorovo místo.";
};


func int dia_zuris_zuristradeplaceme_condition()
{
	if((ZURISTRADEPLACEMEOK == FALSE) && ((ZURISTRADEPLACEYES == TRUE) || (ZURISTRADEPLACEYESCHIP == TRUE)))
	{
		return TRUE;
	};
};

func void dia_zuris_zuristradeplaceme_info()
{
	AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_00");	//Prodej mi Jorovo místo.

	if((ZURISTRADEPLACEYES == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		B_GiveInvItems(other,self,ItMi_Gold,10000);
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_06");	//Nejlepší obchod mého života!...
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_08");	//Nic moc, jednoduše ti dám tento papír.
		B_GiveInvItems(self,other,itwr_zurisdocs,1);
		AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_09");	//Co je to za dokument?!
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_10");	//Vlastnická listina Jorova místa.
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_11");	//Jednoduše na něj napiš jméno a nabyde platnosti.
		B_LogEntry(TOPIC_JORAHELP,"Dal jsem Zurisovi zlato. Dal mi potvrzující dokument, měl bych ho zanést Luterovi!");
		ZURISTRADEPLACEMEOK = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((ZURISTRADEPLACEYESCHIP == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_24");	//Má nejlepší transakce!
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_26");	//Nic speciálního, jen si vezmi tento dokument.
		B_GiveInvItems(self,other,itwr_zurisdocs,1);
		AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_27");	//Co je to?!
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_28");	//Kupní smlouva.
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_29");	//Napiš jméno vlastníka a nabyde platnosti.
		B_LogEntry(TOPIC_JORAHELP,"Dal jsem Zurisovi zlato. Dal mi potvrzující dokument, měl bych ho zanést Luterovi!");
		ZURISTRADEPLACEMEOK = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_38");	//No... Ne.
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_39");	//Tak se vrať až ho budeš mít.
		if(ZURISTRADEPLACEYES == TRUE)
		{
			AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_42");	//... A ne méně než 10 000 zlatých!
		}
		else if(ZURISTRADEPLACEYESCHIP == TRUE)
		{
			AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_43");	//... A ne méně než 5 000 zlatých!
		};
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_44");	//Jestli je nemáš, nemáme o čem mluvit.
		AI_StopProcessInfos(self);
	};
};

instance DIA_ZURIS_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = dia_zuris_aboutkillignaz_condition;
	information = dia_zuris_aboutkillignaz_info;
	permanent = FALSE;
	description = "Jsem to ohledně vraždy Ignaze.";
};

func int dia_zuris_aboutkillignaz_condition()
{
	if((ASKKILLFIRST == TRUE) && (ASKKILLSECOND == TRUE) && (ASKKILLTHIRD == TRUE))
	{
		return TRUE;
	};
};

func void dia_zuris_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Zuris_AboutKillIgnaz_01_01");	//Jsem to ohledně vraždy Ignaze.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_06");	//Jsem jen obyčejný obchodník.
	AI_Output(other,self,"DIA_Zuris_AboutKillIgnaz_01_07");	//Ano, ale tato část města je plná lidí...
	AI_Output(other,self,"DIA_Zuris_AboutKillIgnaz_01_08");	//... Takže jsi mohl něco zaslechnout?
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_09");	//Nic nevím.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_10");	//Možná něco ví domobrana, ale ti chlapi ti jen tak něco nepoví.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_12");	//Jasně... Ti tupci jsou líní tu vraždu vyšetřovat!
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_13");	//Dokonce se ani neobtěžovali prohledat Ignazovu chatrč.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_14");	//Možná tam bude něco, co pomůže najít vraha.
	B_LogEntry(TOPIC_KILLIGNAZ,"Zuris o Ignazově vraždě nic neví, ale poradil mi, abych prozkoumal místo činu, než to udělá domobrana.");
	Wld_InsertItem(itmi_poisonbottle,"FP_ITEM_POISONIGNAZ");
};


instance DIA_Zuris_LOKIPOTION(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_LOKIPOTION_Condition;
	information = DIA_Zuris_LOKIPOTION_Info;
	permanent = FALSE;
	description = "Obchoduješ také z bylinkami?";
};


func int DIA_Zuris_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (TradeCactus == TRUE) && (FindCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_LOKIPOTION_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Zuris_LOKIPOTION_01_00");	//Obchoduješ také z bylinkami?
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_01");	//Samozrejme. O co přesně máš zájem?
	AI_Output(other,self,"DIA_Zuris_LOKIPOTION_01_02");	//Sháním velmi vzácnú... kaktusový květ. Máš ho?
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_03");	//Ano měl sem jeden...
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_04");	//Ale před pár dny ho koupil mág z kláštera.
	AI_Output(other,self,"DIA_Zuris_LOKIPOTION_01_05");	//Sakra, an neřekl, proč ho najednou potřeboval?
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_06");	//Říkal, že ho chce využít pro jeho alchymistické experimenty.
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_07");	//A tato květina je hodne drahá.
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_08");	//Je mi to líto. Teď ti nemohu pomoct.
	FindCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Zuris prodával kaktusový květ, ale před pár dny ho prodal mágovi Ohně z kláštera. Musím se pokusit nějak ho získat.");
};


instance DIA_Zuris_FromWhomCactus(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_FromWhomCactus_Condition;
	information = DIA_Zuris_FromWhomCactus_Info;
	permanent = FALSE;
	description = "Kde si vzal ten kaktusový kvet?";
};


func int DIA_Zuris_FromWhomCactus_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (FindCactus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_FromWhomCactus_Info()
{
	AI_Output(other,self,"DIA_Zuris_FromWhomCactus_01_00");	//Kde si vzal ten kaktusový kvet?
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_01");	//Přinesl mi ho jeden obchodník, kamarád z Varantu. Bylo to již dávno.
	AI_Output(other,self,"DIA_Zuris_FromWhomCactus_01_02");	//A získat další asi nebude tak snadné?
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_03");	//Kdysi to nebyl takový problém... ale teď...
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_04");	//Jediná loď, která se zde za šest měsíců ukázala je loď paladinů.
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_05");	//(Smích) A je nepravděpodobné, aby se zapojily do transportu rostlin.
};