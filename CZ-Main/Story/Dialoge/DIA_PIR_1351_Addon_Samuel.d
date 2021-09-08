
instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAMUEL_NO_TALK(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = dia_samuel_no_talk_condition;
	information = dia_samuel_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_samuel_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_samuel_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//Á, nová tvář!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Chceš rum - anebo něco silnějšího?
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = "Chci si s tebou promluvit o Francisovi.";
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Chci si s tebou promluvit o Francisovi.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Nezačínej o tom rádoby-kapitánovi!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Celý den vysedává na lavičce a cítí se důležitě!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//Všechny zajíma, kterému čertu jsem dlužni, že kapitán vybral zrovna jeho!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Co chceš od toho malého nafoukance?
};


instance DIA_Addon_Samuel_Versteck(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = "Potřebuji se dostat do Gregovy chatrče.";
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Francis) && (Francis_ausgeschissen == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Potřebuji se dostat do Gregovy chatrče.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//(šibalsky) Jo? Proč?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Potřebuji zbroj banditů.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(smích) Francis tě nikdy dobrovolně do chatrče nepustí, aby sis mohl šlohnout Gregovy věci.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Jedině, že by...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Ano?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//... jsi měl něco, co skutečně shaní.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//Vím, že Francis něco ukrývá v opuštěném dole v kaňonu.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//Měli jsme jednou spolu stráž. Usnul a mluvil o tom ze spaní.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Nemám ponětí, co tam zahrabal, ale pokud je to dostatečně důležité, pak tě dovnitř pustí...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//Až se kapitán vrátí a zjistí, že jeho věci chybí, dá Francisovi víc než pořádnej výprask.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Samuel mi řekl o tajné Francisově skrýši v jednom dolu v kaňonu. Možná najdu něco, co mi pomůže dostat se do chatrče.");
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = "Mám pro tebe recept!";
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if(((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0)) || ((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//Mám pro tebe recept!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Och, nech mě podívat, co za recept to je?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);

	if((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Louovo kladivo",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Dvojité Louovo kladivo",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Je to od Snafa.
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Lou_Rezept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Zní to úplně hrozně. Hned to jdu zkusit.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Je to skutečnej zabiják, dej si pozor!
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Lou_Rezept2,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Začínám se bát. Myslím, že to i tak vyzkouším.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = "Chci si vzít svůj podíl grogu. (10 zlata)";
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Chci si vzít svůj podíl grogu.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		if(Samuel_Grog_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Vy mladíci nepohnete ani prstem bez grogu co? A to je správně.
			Samuel_Grog_Varianz = 1;
		}
		else if(Samuel_Grog_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Doufám, že to je přijatelné. Nemám dostatek čisté vody. Ale trochu slané tomu neublíží, ne?
			Samuel_Grog_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//Můžeš mít tolik grogu, kolik chceš.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Prodávám to levně, ale ne zadarmo! Sežeň si nejdřív zlato, mladíku!
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = "Dej mi rum (30 zlata)";
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Dej mi rum!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		if(Samuel_Rum_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Á! Mateřské mléko námořníka. Tady máš!
			Samuel_Rum_Varianz = 1;
		}
		else if(Samuel_Rum_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//Rum může trošku smrdět rybinou. Máme jen staré sudy od sleďů. Ale rum zůstane rumem. Nechť ti chutná.
			Samuel_Rum_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Tady máš!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//Nemáš dost zlata, mladíku! Což takhle dát si grog?
	};
};


var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = "Potřebuji něco silnějšího!";
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Potřebuji něco silnějšího!

	if(Samuel_Stronger_Varianz == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//Áá, dobrodružná duše! Ja vždy hledám nové recepty!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Pořádná kořalka má být čistá a silná. Musí projít hrdlem jako tekutý oheň.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Je to dost těžké. Ale už moc řečním. Ty chceš pít!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Tady! Můj vlastní recept! Chutná ti to? Jmenuje se to 'Rychlý sleď'
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//Působivé!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(smích) Řekl bych, že jo.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//Neznáš náhodou nějakej dobrej recept na kořalku? Pokud jo, tak mi řekni.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Chceš další?
		Samuel_Stronger_Varianz = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Co můžu dostat?
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Dvojité Louovo kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (60 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Není zlato, není pití!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Dej mi trošku z toho rychlého sledě.
	if(B_GiveInvItems(other,self,ItMi_Gold,60))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Silná věcička, ale udělá svoje!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Dvojité Louovo kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (60 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Chci Louovo kladivo!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Dobrá věc! Na ochranu!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Dvojité Louovo kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (60 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(nenuceně) Dej mi dvojité. Dvojité Kladivo.
	if(B_GiveInvItems(other,self,ItMi_Gold,60))
	{
		if(Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Neudělej ze sebe ubožáka. Doufám, že to není pro tebe.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Ano! To bude duševní tanec!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Dvojité Louovo kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (60 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = "Co ještě máš?";
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Co ještě máš?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Dodávám všechno, co pirát potřebuje pro přežití.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFo_Addon_Grog,Npc_HasItems(self,ItFo_Addon_Grog));
	CreateInvItems(self,ItFo_Addon_Grog,15);
};


instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = "Něco nového v táboře?";
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//Něco nového v táboře?
	if(Npc_IsDead(Francis) || (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis dostal řádnej trest! Ani nevíš, jak jsem rád!
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//Ty jsi v pohodě. Pojď, vypijeme něco!
		if(GregIsBack == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//A Greg je konečně zpátky. Sice ztratil loď, ale aspoň udělal pořádek v táboře.
		};
	}
	else
	{
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Od Gregova odjezdu se nic moc neděje. Morgan a většina jeho chlapu jenom chlastají.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Jediný, kdo něco dělá je Henry. On a jeho chlapci stavějí palisádu.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//Už je načase, aby se kapitán Greg vrátil a nakopal Francisovi řiť.
	};
};

var int RezeptCost;
var int SamuelTradeTod;
var int SamuelTradeTodDone;

instance DIA_Addon_Samuel_RiordanRezept(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_RiordanRezept_Condition;
	information = DIA_Addon_Samuel_RiordanRezept_Info;
	description = "Můžeš mě naučit jak připravit lektvar rychlosti?";
};

func int DIA_Addon_Samuel_RiordanRezept_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (Samuel_Stronger_Varianz == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_RiordanRezept_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_01_00");	//Můžeš mě naučit jak připravit lektvar rychlosti?
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_01_01");	//Obvykle svůj recept držím v tajnosti.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_01_02");	//Ale zajímalo by mě, proč ta náhlá potřeba?
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
	Info_AddChoice(DIA_Addon_Samuel_RiordanRezept,"Jeden z mágů Vody má o něj zájem.",DIA_Addon_Samuel_RiordanRezept_Riordan);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Addon_Samuel_RiordanRezept,"Chci začít s jeho prodejem v Khorinisu.",DIA_Addon_Samuel_RiordanRezept_Trade);
	};

	Info_AddChoice(DIA_Addon_Samuel_RiordanRezept,"Jen ze zvědavosti.",DIA_Addon_Samuel_RiordanRezept_Just);
};

func void DIA_Addon_Samuel_RiordanRezept_Riordan()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_00");	//Jeden z mágů Vody má o něj zájem.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_01");	//Cože?! To je mi novinka.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_02");	//Jakto že najednou mágy zajímá recept na obyčejnou domácí kořalku.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_03");	//Tvoje kořalka má velmi zajímavý efekt. Takže na tom není nic překvapivého.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_04");	//Dostal jsi mě... Tak dobře! Ukážu ti, jak uvařit můj lektvar.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_05");	//Ale budeš muset zaplatit! Nemysli si, že ho prodám levně.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_06");	//Kolik?
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_07");	//Slyšel jsem, že u mágů se povaluje spousta zlata! Takže to nebude méně než tisíc zlatých.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_08");	//Ty ses zbláznil! Za tak moc to nestojí.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_09");	//Je to na tobě. Ber nebo nech být! Cenu jsem řekl - a tečka.
	RezeptCost = 1000;
	SamuelTradeTod = TRUE;
	B_LogEntry(TOPIC_SpeedPotion,"Samuel mi prodá svůj recept za tisíc zlatých.");
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

func void DIA_Addon_Samuel_RiordanRezept_Trade()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Trade_01_00");	//Chci začít s jeho prodejem v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_01");	//Chceš zbohatnout? Chápu.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_02");	//Dobře! Ukážu ti to, ale jen pod jednou podmínkou.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_03");	//Polovina peněz, které z toho vyděláš bude moje! Souhlasíš?
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Trade_01_04");	//No, vypadá to, že nemám na výběr. Platí!
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_05");	//Tady máš. Jen se nesnaž udělat ze mě blbce, jinak tě ztáhnu z kůže.
	B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Trade_01_06");	//Pochopil jsem. Teď jen potřebuji nějaký čas. Zisky nemusí jít tak rychle.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_07");	//Samozřejmě.
	B_LogEntry(TOPIC_SpeedPotion,"Recept mám. Je čas vrátit se k Riordianovi.");
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

func void DIA_Addon_Samuel_RiordanRezept_Just()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_00");	//Jen ze zvědavosti.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_01");	//Ze zvědavosti? (sarkasticky) Pak moje odpověď zní ne.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_02");	//Je to pro mě příliš výnosné, než abych to vykládal každému koho potkám.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_03");	//Takže zábavu si choď radší hledat jinde.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_04");	//Mohl bych ti zaplatit!
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_05");	//(zamyšleně) Dobře. Nicméně, bude tě to stát nejméně dva tisíce zlatých.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_06");	//A ve tvěm případě, vyjednávat se mnou nemá smysl.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_07");	//Achjo.
	RezeptCost = 2000;
	SamuelTradeTod = TRUE;
	B_LogEntry(TOPIC_SpeedPotion,"Samuel mi prodá svůj recept za dva tisíce zlatých.");
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

instance DIA_Addon_Samuel_RiordanRezept_Buy(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_RiordanRezept_Buy_Condition;
	information = DIA_Addon_Samuel_RiordanRezept_Buy_Info;
	permanent = TRUE;
	description = "Prodej mi ten recept.";
};

func int DIA_Addon_Samuel_RiordanRezept_Buy_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (SamuelTradeTod == TRUE) && (SamuelTradeTodDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_RiordanRezept_Buy_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Buy_01_00");	//Prodej mi ten recept.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Buy_01_01");	//A kde je zlato?

	if(Npc_HasItems(hero,ItMi_Gold) >= RezeptCost)
	{
		AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Buy_01_02");	//Tady máš.
		B_GiveInvItems(other,self,ItMi_Gold,RezeptCost);
		AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Buy_01_03");	//Dobrá. Recept je tvůj, jak jsme se dohodli.
		B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
		SamuelTradeTodDone = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Buy_01_04");	//Nemám takovou sumu.
		AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Buy_01_05");	//Pak se vrať, až budeš tolik mít.
	};
};

//--------------------------------kosti-------------------------------------

instance DIA_PIR_1351_Addon_Samuel_Game(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_PIR_1351_Addon_Samuel_Game_condition;
	information = DIA_PIR_1351_Addon_Samuel_Game_info;
	description = "Nehraje někdo z vás kostky?";
};

func int DIA_PIR_1351_Addon_Samuel_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_Game_info()
{
 	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_Game_01_00"); //Nehraje někdo z vás kostky?
 	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_Game_01_01"); //No, nech mě hrát. Tak co? Pudeš?
 	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_Game_01_02"); //Nenechej se odmítnout.
 	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_Game_01_03"); //Dobře! Potom teda chci peníze dopředu - a hra!
	SamuelPlayResult = 350;
	Menu_WriteInt("AST","SysTimer06",0);
};

instance DIA_PIR_1351_Addon_Samuel_GamePlay(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 900;
	condition = DIA_PIR_1351_Addon_Samuel_GamePlay_condition;
	information = DIA_PIR_1351_Addon_Samuel_GamePlay_info;
	permanent = TRUE;
	description = "Pojďme hrát kostky!";
};

func int DIA_PIR_1351_Addon_Samuel_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_PIR_1351_Addon_Samuel_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer06");

	if(CheckLastGame >= SamuelPlayResult)
	{
		CheckLastSum = CheckLastGame - SamuelPlayResult;
	};

	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_00");	//Pojďme hrát kostky!

	if(SamuelPlayResult >= CheckLastGame)
	{
		if((SamuelPlayResult > 0) && (SamuelDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_01");	//No uvidíme za co stojíš!
			PlayPocker(1,self);
		}
		else
		{
			if(SamuelDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_02");	//Ne! Už si vyhrál.
				SamuelDayPlay = Wld_GetDay();
				SamuelDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_03");	//Dnes ne, kámo.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_04");	//Nedal jsi mi peníze za poslední hru.
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_05");	//Takže prvně splať svůj dluh! Potom můžem hrát.
		Info_ClearChoices(DIA_PIR_1351_Addon_Samuel_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_PIR_1351_Addon_Samuel_GamePlay,"Tady jsou tvoje peníze.",DIA_PIR_1351_Addon_Samuel_GamePlay_Here);
		};

		Info_AddChoice(DIA_PIR_1351_Addon_Samuel_GamePlay,"Nemám dost peněz.",DIA_PIR_1351_Addon_Samuel_GamePlay_No);
	};
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SamuelPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_GamePlay_Here_01_01");	//Tady jsou tvoje peníze.
	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_Here_01_02");	//Další věc! Tak snad začneme.
	PlayPocker(1,self);
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_No()
{
	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_GamePlay_No_01_01");	//Nemám dost peněz.
	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_No_01_02");	//No, s čím to mám dočinění?
	Info_ClearChoices(DIA_PIR_1351_Addon_Samuel_GamePlay);
};

instance DIA_PIR_1351_Addon_Samuel_GameEnd(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_PIR_1351_Addon_Samuel_GameEnd_condition;
	information = DIA_PIR_1351_Addon_Samuel_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_PIR_1351_Addon_Samuel_GameEnd_condition()
{
	if((MustTellResult_Samuel == TRUE) && ((SamuelLost == TRUE) || (SamuelWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_GameEnd_info()
{
	if(SamuelLost == TRUE)
	{
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GameEnd_00");	//Uřízni mi nohu! Jaks mě zvládl porazit?!
		SamuelLost = FALSE;
	}
	else if(SamuelWon == TRUE)
	{
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GameEnd_01");	//Přijď znovu, když máš tolik zlatisek.
		SamuelWon = FALSE;
	};

	MustTellResult_Samuel = FALSE;
};