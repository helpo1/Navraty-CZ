/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void dia_thorben_missgritta_help - opraveno AIV_IgnoresArmor

*/



var int ThorbenElzaDay;
var int ThorbenOnWork;

instance DIA_Thorben_EXIT(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 999;
	condition = DIA_Thorben_EXIT_Condition;
	information = DIA_Thorben_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thorben_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thorben_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_NO_TALK(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = dia_thorben_no_talk_condition;
	information = dia_thorben_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_thorben_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_PICKPOCKET(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 900;
	condition = DIA_Thorben_PICKPOCKET_Condition;
	information = DIA_Thorben_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Thorben_PICKPOCKET_Condition()
{
	return C_Beklauen(30,28);
};

func void DIA_Thorben_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,Dialog_Back,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

instance DIA_Thorben_angepisst(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_angepisst_Condition;
	information = DIA_Thorben_angepisst_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thorben_angepisst_Condition()
{
	if(Npc_IsDead(Gritta) && Npc_IsInState(self,ZS_Talk) && (GRITTAMUSTISDEAD == FALSE) && (GRITTAMEDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_angepisst_Info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Zavraždil jsi moji Grittu. To ti nikdy neodpustím. Běž mi z očí, vrahu!
	AI_StopProcessInfos(self);
};

instance DIA_Thorben_NoTalkAtAll(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_NoTalkAtAll_Condition;
	information = DIA_Thorben_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thorben_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_NoTalkAtAll_Info()
{
	AI_Output(self,other,"DIA_Thorben_NoTalkAtAll_12_00");	//Co tady děláš?! Vypadni odtud.
	AI_StopProcessInfos(self);
};

instance DIA_Thorben_Hallo(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hallo_Condition;
	information = DIA_Thorben_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thorben_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Hallo_Info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Á! Nová tvář. Ty nejsi z Khorinisu, co?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Tohle není ta správná doba pro poutníky. Všude samí banditi, žádná práce a teď si ještě začali vyskakovat rolníci.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Co tě sem přivádí?
};

instance DIA_Thorben_Arbeit(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Arbeit_Condition;
	information = DIA_Thorben_Arbeit_Info;
	permanent = FALSE;
	description = "Hledám práci.";
};


func int DIA_Thorben_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Thorben_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Hledám práci.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Víš něco o truhlařině?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Jediné, co dokážu ze dřeva udělat, je oheň.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//A co zámky?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Noooo...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Je mi líto, ale pokud o mém řemesle nic nevíš, nemůžu ti pomoct.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//A nemám peníze na to, abych si platil učedníka.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Mistr Thorben mě nepřijme do učení.");
};


instance DIA_Thorben_OtherMasters(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_OtherMasters_Condition;
	information = DIA_Thorben_OtherMasters_Info;
	permanent = FALSE;
	description = "Co kdybych chtěl začít jako učedník u jednoho z ostatních mistrů?";
};


func int DIA_Thorben_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//Co kdybych chtěl začít jako učedník u jednoho z ostatních mistrů?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Dobrá, dám ti své doporučení.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Ale nejdřív bys měl raději získat požehnání od bohů.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Řekni mi, jsi zbožný muž?
	Info_ClearChoices(DIA_Thorben_OtherMasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (other.guild != GIL_NDW) && (other.guild != GIL_KDM) && (other.guild != GIL_NDM))
	{
		Info_AddChoice(DIA_Thorben_OtherMasters,"No, pokud tím myslíš, zda se modlím pravidelně...",DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice(DIA_Thorben_OtherMasters,"Ano. Nejpokornější služebník, mistře Thorbene.",DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Tak to jdi za Vatrasem, Adanovým knězem, a požádej ho o požehnání.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//On už ti řekne, kde najít Innosova kněze. Od něj taky získej požehnání.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//Jakmile získáš požehnání, máš můj souhlas.
	MIS_Thorben_GetBlessings = LOG_Running;
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_Running);
	B_LogEntry(TOPIC_Thorben,"Thorben se za mě přimluví teprve tehdy, až si vyprosím požehnání od Adanova a Innosova kněze.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Ano. Nejpokornější služebník, mistře Thorbene.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//No, pokud tím myslíš, zda se modlím pravidelně... 
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Rozumím.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Člověk, co svou práci nejdřív nesvěří modlitbám, nikdy nezíská můj souhlas.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Pros bohy o shovívavost nad tvými hříchy.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};


instance DIA_Thorben_ZUSTIMMUNG(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_ZUSTIMMUNG_Condition;
	information = DIA_Thorben_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Tak jak s tím doporučením, mistře?";
};


func int DIA_Thorben_ZUSTIMMUNG_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (MIS_Thorben_GetBlessings == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thorben_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Tak jak s tím doporučením, mistře?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Požehnal ti Vatras?
	if(Vatras_Segen == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Ano.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//A získal jsi také požehnání Innose?

		if((Daron_Segen == TRUE) || (Isgaroth_Segen == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Ano, získal.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//V tom případě máš i mé požehnání. Nezáleží na tom, jakou cestu sis vybral - buď hrdý na svou práci, chlapče!
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP(XP_Zustimmung);
			Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
			B_LogEntry(TOPIC_Lehrling,"Budu-li k někomu chtít vstoupit do učení, Thorben se za mě přimluví.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Ne. Ještě ne.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Znáš mé podmínky. Svým záležitostem se můžeš věnovat jen s požehnáním bohů.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Ještě ne...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//V tom případě nevím, proč se mě znovu ptáš. Znáš mé podmínky.
	};
};


instance DIA_Thorben_Locksmith(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Locksmith_Condition;
	information = DIA_Thorben_Locksmith_Info;
	permanent = FALSE;
	description = "Tak ty se vyznáš v zámcích?";
};


func int DIA_Thorben_Locksmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Locksmith_Info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//Tak ty se vyznáš v zámcích?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Co by to bylo za pořádnou truhlu bez dobrého zámku?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Vyrábím si své vlastní zámky. Takhle si můžu být přinejmenším jistý, že jsem neudělal bytelnou truhlu jen tak pro nic za nic.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//Odbytý zámek se dá snadno zlomit. A tady v Khorinisu se všude kolem potuluje spousta zlodějů. Zvláště poslední dobou!
};


instance DIA_Thorben_Schuldenbuch(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Schuldenbuch_Condition;
	information = DIA_Thorben_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Mám tady Lehmarovu účetní knihu.";
};


func int DIA_Thorben_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Schuldenbuch_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//Mám tady Lehmarovu účetní knihu.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(podezíravě) Jak ses k tomu dostal?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Spíš by tě mělo zajímat, že je v ní tvé jméno.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Dej to sem!
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//A co mi za to dáš?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//Nemám peníze nazbyt a nemůžu ti dát nic jiného než mé srdečné poděkování.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	THORBENCANTEACH = TRUE;
};

instance DIA_Thorben_PleaseTeach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_PleaseTeach_Condition;
	information = DIA_Thorben_PleaseTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit, jak páčit zámky?";
};

func int DIA_Thorben_PleaseTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith) && (Thorben_TeachPlayer == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PleaseTeach_Info()
{
	var int karmainnos;
	karmainnos = INNOSPRAYCOUNT - INNOSCRIMECOUNT;
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Můžeš mě naučit, jak páčit zámky?

	if(THORBENCANTEACH == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Kdyby nebylo tebe, budu Lehmarovi platit po celý zbytek svého života.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Naučím tě, co budeš chtít.
		Thorben_TeachPlayer = TRUE;
	}
	else if((Player_IsApprentice > APP_NONE) && (karmainnos >= 10))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_20");	//Stal ses žákem některého z mistrů...
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_21");	//Cítím, že ctíš své bohy a Innos se z tebe raduje.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Tak tě tedy naučím vše, co si zamaneš.
		Thorben_TeachPlayer = TRUE;
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_21");	//Cítím, že ctíš své bohy a ti se radují.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Budu tě učit co si budeš přát.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		if(THORBENFIRSTREFUSETALK == FALSE)
		{
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Hmm... nevím, jestli se ti dá věřit.
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Podle toho, co vím, můžeš klidně být jedním z těch darmošlapů, co přišli do města jen proto, aby vyprázdnili truhly bohatých lidí.
			THORBENFIRSTREFUSETALK = TRUE;
		};
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Nebudu tě učit nic, dokud se nepřesvědčím, že jsi dobrý člověk.

		if((GRITTADEALOK == TRUE) && (THORBENFIRSTREFUSE == FALSE))
		{
			AI_Output(other,self,"DIA_Thorben_PleaseTeach_06_14");	//Ale už jsem se ti snažil pomoct, když jsem srovnal Grittin dluh. Nebo to se nepočítá?
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_15");	//Je mi líto, ale to nestačí! Musíš prokázat více důvěryhodnosti, než ti začnu věřit.
			AI_Output(other,self,"DIA_Thorben_PleaseTeach_06_16");	//Hmmm... No dobrá.
			THORBENFIRSTREFUSE = TRUE;
		};
	};
};

instance DIA_Thorben_Teach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Teach_Condition;
	information = DIA_Thorben_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě páčit zámky.";
};

func int DIA_Thorben_Teach_Condition()
{
	if((Thorben_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Teach_Info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Nauč mě páčit zámky!
	Info_ClearChoices(DIA_Thorben_Teach);
	Info_AddChoice(DIA_Thorben_Teach,Dialog_Back,DIA_Thorben_Teach_Back);
	Info_AddChoice(DIA_Thorben_Teach,b_buildlearnstringforthief("Páčení zámků",B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1)),DIA_Thorben_Teach_PICKLOCK);
};

func void DIA_Thorben_Teach_Back()
{
	Info_ClearChoices(DIA_Thorben_Teach);
};

func void DIA_Thorben_Teach_PICKLOCK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Potřebuješ akorát nějaký paklíč. Pokud jím budeš v zámku opatrně otáčet doprava a doleva, můžeš mechanismus otevřít.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Ale pokud otočíš příliš rychle nebo moc silně ve špatném směru - paklíč se zlomí.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Čím budeš obratnější, tím méně budeš potřebovat paklíčů. To je vše, co potřebuješ vědět.
	};

	Info_ClearChoices(DIA_Thorben_Teach);
};

instance DIA_Thorben_SellTree(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_SellTree_Condition;
	information = DIA_Thorben_SellTree_Info;
	permanent = FALSE;
	description = "Zpracováváš také dřevo?";
};

func int DIA_Thorben_SellTree_Condition()
{
	if(TorbenSellWood == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thorben_SellTree_Info()
{
	AI_Output(other,self,"DIA_Thorben_SellTree_01_00");	//Zpracováváš také dřevo?
	AI_Output(self,other,"DIA_Thorben_SellTree_01_01");	//Jistě! Proč si myslíš, že se mi přezdívá mistr nábytku?
	AI_Output(other,self,"DIA_Thorben_SellTree_01_02");	//A nemohl bys něco prodat i mě?
	AI_Output(self,other,"DIA_Thorben_SellTree_01_03");	//Proč ne. Více zlata mě zrovna bolet nebude.
	TorbenSellWoodDone = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"Thorben mi může prodat různé druhy dřeva.");	
};

var int ThorbenPicklockFT;
var int TorbenFirstTree;

instance DIA_Thorben_TRADE_TREE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_TREE_Condition;
	information = DIA_Thorben_TRADE_TREE_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};

func int DIA_Thorben_TRADE_TREE_Condition()
{
	if((TorbenSellWoodDone == TRUE) && Wld_IsTime(6,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_TREE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Ukaž mi své zboží.

	if(Dietrichgeben_Trd == FALSE)
	{
		if(Npc_HasItems(self,ItKE_lockpick) == 0) 
		{
			CreateInvItems(self,ItKE_lockpick,10);
		};

		CreateInvItems(self,ItMi_JustTree,15);
		CreateInvItems(self,ItMi_EveTree,10);
		CreateInvItems(self,ItMi_VyzTree,5);
		CreateInvItems(self,ItMi_YsuoTree,5);
		CreateInvItems(self,ItMi_BokTree,5);
		CreateInvItems(self,ItMi_Pliers,1);
		CreateInvItems(self,ItMi_Pitch,10);
		Dietrichgeben_Trd = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Thorben_TRADE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_Condition;
	information = DIA_Thorben_TRADE_Info;
	permanent = TRUE;
	description = "Můžeš mi prodat nějaké paklíče?";
	trade = TRUE;
};

func int DIA_Thorben_TRADE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Thorben_Locksmith) == TRUE) && (TorbenSellWoodDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_Info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Můžeš mi prodat nějaké paklíče?

	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Pokud mi ještě nějaké zbyly...

		if(ThorbenPicklockFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"Tesař Thorben prodává paklíče.");
			ThorbenPicklockFT = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//No tak dobrá. Ale dokud nevíš, jak s nimi zacházet, tak ti budou k ničemu.

		if(ThorbenPicklockFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"Tesař Thorben prodává paklíče.");
			ThorbenPicklockFT = TRUE;
		};
	};
	if((Npc_HasItems(self,ItKE_lockpick) == 0) && (Kapitel > Dietrichgeben))
	{
		CreateInvItems(self,ItKE_lockpick,25);
		Dietrichgeben = Dietrichgeben + 1;
	};
};

instance DIA_Addon_Thorben_MissingPeople(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Addon_Thorben_MissingPeople_Condition;
	information = DIA_Addon_Thorben_MissingPeople_Info;
	description = "A už jsi někdy měl učně?";
};


func int DIA_Addon_Thorben_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (SC_HearedAboutMissingPeople == TRUE) && (Elvrich_GoesBack2Thorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//A už jsi někdy měl učně?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Ano, není to dávno.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Jmenoval se Elvrich. Je to můj synovec.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Ale jednoho dne prostě nepřišel. A to jsem byl s jeho prací docela spokojený.
	MIS_Thorben_BringElvrichBack = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Elvrich, učeň tesaře Thorbena, zmizel.");
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,Dialog_Back,DIA_Addon_Thorben_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Oznámil jsi to domobraně?",DIA_Addon_Thorben_MissingPeople_Mil);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Jak je to dlouho, co jsi ho viděl naposledy?",DIA_Addon_Thorben_MissingPeople_wann);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Kde je Elvrich teď?",DIA_Addon_Thorben_MissingPeople_where);
};

func void DIA_Addon_Thorben_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Jak je to dlouho, co jsi ho viděl naposledy?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Musí to být tak 2 týdny.
};

func void DIA_Addon_Thorben_MissingPeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//Kde je Elvrich teď?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//Jak to mám vědět? Stále se poflakoval okolo špinavého bordelu v přístavní čtvrti.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//Vůbec by mě nepřekvapilo, kdyby tam trávil celé dny s nějakou děvkou.
};

func void DIA_Addon_Thorben_MissingPeople_Mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Oznámil jsi to domobraně?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Ano, jistě. Říkali, že ho chytí a postarají se, aby se jeho líná prdel vrátila do práce. Mrzelo mě to udělat.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//Nechám ho dělat si, co chce. Dříve nebo později pochopí, že nemůže být bez slušné práce v Khorinisu.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(cynicky) Opravdu?
};


instance DIA_Addon_Thorben_ElvrichIsBack(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information = DIA_Addon_Thorben_ElvrichIsBack_Info;
	description = "Nyní, když se Elvrich vrátil, může pro tebe znovu pracovat.";
};


func int DIA_Addon_Thorben_ElvrichIsBack_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && (Npc_IsDead(Elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Nyní, když se Elvrich vrátil, může pro tebe znovu pracovat.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Mohu jenom doufat, že neuteče znovu s další možnou ženou.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Tady, vem si tohle zlato jako odměnu za přivedení mého učně.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};


instance DIA_Thorben_Paladine(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Paladine_Condition;
	information = DIA_Thorben_Paladine_Info;
	permanent = FALSE;
	description = "Co víš o paladinech?";
};


func int DIA_Thorben_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Paladine_Info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Co víš o paladinech?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Nic moc. Před dvěma týdny sem na lodi připluli z pevniny.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//Od té doby jsou zavření v horní čtvrti.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Nikdo tady pořádně neví, proč vlastně přijeli.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Hodně lidí se obává útoku skřetů.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//Ale já si stejně myslím, že tu jsou kvůli rolnické vzpouře.
};


instance DIA_Thorben_Bauernaufstand(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Bauernaufstand_Condition;
	information = DIA_Thorben_Bauernaufstand_Info;
	permanent = FALSE;
	description = "Víš něco o té rolnické vzpouře?";
};


func int DIA_Thorben_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Víš něco o té rolnické vzpouře?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Povídá se, že si velkostatkář Onar najal žoldáky, aby ho chránili před královskými vojsky.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Asi už měl dost toho, že mu paladinové a domobrana pořád berou úrodu a dobytek.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Jediné, co jsme tady ve městě zaznamenali, je neustálé zvyšování cen potravin.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Onarova farma odsud leží daleko na východě. Nevíme, jestli se tam k něčemu chystá.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Pokud se chceš dozvědět víc, zeptej se kupců na tržišti. Mají o ostrově větší přehled než já.
};


instance DIA_Thorben_Gritta(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_Gritta_Condition;
	information = DIA_Thorben_Gritta_Info;
	permanent = FALSE;
	description = "Přišel jsem kvůli Grittě...";
};


func int DIA_Thorben_Gritta_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Gritta_Info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Přišel jsem kvůli Grittě.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Mé neteři? O co jde? Není to nic s penězi, že ne?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Dluží 100 zlatých kupci Matteovi.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Řekni mi, že to není pravda. Od té doby, co se ke mně ta malá lenoška nastěhovala, mám jen samé potíže!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Má dluh snad u každého kupce ve městě.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Musel jsem si půjčit 200 zlatých u lichváře jen proto, abych vyrovnal její dluhy. A teď tohle!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Gritta by měla být v domě.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Jdi dál, jen se jí zeptej. Ale můžu ti říct jedno: nemá ani zlatku.
	if(Npc_HasItems(Gritta,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Uvidíme...
	};
};


instance DIA_Thorben_GrittaHatteGold(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_GrittaHatteGold_Condition;
	information = DIA_Thorben_GrittaHatteGold_Info;
	permanent = FALSE;
	description = "Tvá neteř mi dala 100 zlatých.";
};


func int DIA_Thorben_GrittaHatteGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Gritta) && (Npc_HasItems(Gritta,ItMi_Gold) < 100) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_GrittaHatteGold_Info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//Tvá neteř mi dala 100 zlatých.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//CO? Ta malá nestydatá zmije - to bylo MOJE zlato! Vzala ho z mé truhly.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Vrať mi to! Musím nejdřív zaplatit Lehmarovi. Matteo dostane své peníze později!
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Už jsem dal Matteovi jeho zlato!",DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Ne. Ty peníze dostane Matteo.",DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Tady je zlato.",DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if(Gritta_GoldGiven == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//A co vím o té malé zmiji, jsem si jistý, že běžela přímo za městskou stráží, aby tě taky obvinila!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Dohlédnu na to, aby se to nějak vyřešilo.
		B_DeletePetzCrime(Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Už jsem dal Matteovi jeho zlato!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Sakra! Dobrá - dluh je dluh. Alespoň, že sis ty peníze nenechal. Asi bych ti za to měl poděkovat.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Ne. Ty peníze jsou Matteovy.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Takhle mě dostaneš do pořádných trablů. Lehmar není zrovna přehnaně shovívavý, když přijde řeč na dluhy.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Ale přinejmenším se chystáš splatit dluh mé neteře. Asi bych ti za to měl poděkovat.
	B_Thorben_DeletePetzCrimeGritta();
	GRITTADEALOK = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Díky! Konečně mám alespoň část peněz, co dlužím Lehmarovi.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Nemůžu uvěřit tomu, že měla tu drzost vzít mé zlato!
	B_Thorben_DeletePetzCrimeGritta();
	Thorben_GotGold = TRUE;
	GRITTADEALOK = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};


instance DIA_THORBEN_HOWLIFE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_howlife_condition;
	information = dia_thorben_howlife_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_thorben_howlife_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_howlife_info()
{
	AI_Output(other,self,"DIA_Thorben_HowLife_01_00");	//Jak to jde?
	if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_01");	//Nooo!... (usmívá se)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_02");	//Od té doby, co se Elvrich vrátil - se to s obchodem zlepšilo!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_04");	//A Gritta se konečně zklidnila!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_05");	//Po tom incidentu s bandity začala brát svůj život víc vážně.
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_08");	//Není to špatné!... (smutně)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_09");	//Jasně, co se Elvrich vrátil - můj obchod celkem prosperuje.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_10");	//Nicméně se velmi bojím o Grittu !... (nervózně) Ach má malá holčička!
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == TRUE))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_13");	//Hrozně!... (smutně)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_14");	//Jasně, co se Elvrich vrátil - můj obchod celkem prosperuje.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_15");	//Ale to vše zbledne ve srovnání s Grittinou smrtí!... (zlomeně) Moje malá holčička!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_16");	//Nikdy si to neodpustím. Všechno se to stalo jen kvůli mně...
		AI_StopProcessInfos(self);
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_17");	//Mohlo by být líp... (smutně)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_18");	//Mému obchodu se moc nedaří - moc mi chybí pomoc mého žáka, Elvricha!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_19");	//Jediné, co mě těší je Gritta.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_20");	//Po té události s bandity - opravdu se hodně změnila a začala brát svůj život vážněji.
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_24");	//Špatně!... (zoufale)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_25");	//Mému obchodu se moc nedaří - moc mi chybí pomoc mého žáka, Elvricha!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_26");	//Ale nejvíc se bojím o Grittu!... (nervózně) Moje malá holčička!
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == TRUE))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_29");	//Hrozně!... (smutně)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_30");	//Mému obchodu se moc nedaří - moc mi chybí pomoc mého žáka, Elvricha!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_31");	//Ale to vše zbledne ve srovnání s Grittinou smrtí!... (zlomeně) Moje malá holčička!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_32");	//Nikdy si to neodpustím. Všechno se to stalo jen kvůli mně...
		AI_StopProcessInfos(self);
	}
	else if((GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_33");	//Mohlo by být líp... (smutně)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_34");	//Mému obchodu se nedaří vůbec jako ještě nikdy jindy - ani se mi o tom nechce mluvit.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_35");	//Jediné, co mě těší je Gritta.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_36");	//Po té události s bandity - opravdu se hodně změnila a začala brát svůj život vážněji.
	}
	else if((GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_40");	//Hůř už být nemůže... (zoufale)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_41");	//Mému obchodu se nedaří vůbec jako ještě nikdy jindy - ani se mi o tom nechce mluvit.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_42");	//Ale nejvíc se bojím o Grittu!... (nervózně) Moje malá holčička!
	}
	else if(GRITTAISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_45");	//Hrozně!... (smutně)
		AI_Output(self,other,"DIA_Thorben_HowLife_01_46");	//Mému obchodu se nedaří vůbec jako ještě nikdy jindy - ani se mi o tom nechce mluvit.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_47");	//Ale to vše zbledne ve srovnání s Grittinou smrtí!... (zlomeně) Moje malá holčička!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_48");	//Nikdy si to neodpustím. Všechno se to stalo jen kvůli mně...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_49");	//Ach!... (smutně) Neptej se - něco je špatně.
	};
};


instance DIA_THORBEN_MISSGRITTANEWS(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_missgrittanews_condition;
	information = dia_thorben_missgrittanews_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_missgrittanews_condition()
{
	if(!Npc_IsDead(Gritta) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void dia_thorben_missgrittanews_info()
{
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_00");	//Hej, počkej! Počkej chvíli...
	AI_Output(other,self,"DIA_Thorben_MissGrittaNews_01_01");	//Co se děje?!
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_02");	//Odpusť, že tě vyrušuju... (zmateně)
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_03");	//Prosím tě, řekni mi, neviděl jsi mou neteř Grittu někde tady ve městě?
	AI_Output(other,self,"DIA_Thorben_MissGrittaNews_01_04");	//Ne, nepotkal jsem ji.
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_05");	//Dobře... (smutně)
};


instance DIA_THORBEN_MISSGRITTA(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_missgritta_condition;
	information = dia_thorben_missgritta_info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};


func int dia_thorben_missgritta_condition()
{
	if(!Npc_IsDead(Gritta) && (Kapitel >= 2) && Npc_KnowsInfo(hero,dia_thorben_missgrittanews))
	{
		return TRUE;
	};
};

func void dia_thorben_missgritta_info()
{
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_00");	//Jsi v pořádku?
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_01");	//Vypadáš trochu ustaraně.
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_02");	//Ano... (smutně) moje neteř, Gritta - někde zmizela!
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_04");	//Domobránci říkali, že ji viděli včera, jak odcházela bránou s nějakým obchodníkem...
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_05");	//No a pak odešla někam do lesa a už se nevrátila.
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_09");	//Hmm, to se mi nezdá! Možná to ani nebyl obchodník!
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_12");	//Opravdu, celá oblast je zamořená bandity. A to nemluvím o vlcích a jiných tvorech!
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_13");	//Ach, Innosi!... (panicky) Opravdu si myslíš, že to jsou banditi?! Že ji okradli?!
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_14");	//Je to možné. Hlavně proto, že v poslední době lidé z Khorinisu mizí.
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_19");	//Co teď budeme dělat? Stráže ani prstem nepohnou, pokud se nezaplatí!
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_21");	//A já jsem jen chudý tesař... (smutně) Kde na to mám vzít!
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_22");	//Pak ti můžu pomoct?
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_23");	//Ty?... (udiveně) Opravdu jsi tak bohatý, že si můžeš takhle rozhazovat?!
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_25");	//Hmmm... (zamyšleně) No, myslím, že domobrana bude chtít za pomoc při hledání Gritty asi 500 zlatých.
	Info_ClearChoices(dia_thorben_missgritta);
	Info_AddChoice(dia_thorben_missgritta,"Raději budu hledat Grittu sám.",dia_thorben_missgritta_help);
	Info_AddChoice(dia_thorben_missgritta,"To je příliš mnoho!",dia_thorben_missgritta_no);
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_thorben_missgritta,"No! Dám ti těch 500 zlatých.",dia_thorben_missgritta_ok);
	};
};

func void dia_thorben_missgritta_help()
{
	AI_Output(other,self,"DIA_Thorben_MissGritta_Help_01_00");	//Raději ji budu hledat sám.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_01");	//Hmmm... (nechápavě) Ale proč?!
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_03");	//Máš pravdu!... (vystrašeně) Jestli opravdu padla do rukou banditů - ani si neumím představit, co se ji mohlo stát!
	AI_Output(other,self,"DIA_Thorben_MissGritta_Help_01_05");	//Mluv, kde jsi Grittu naposledy viděl?!
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_06");	//U Jižní brány, na cestě k Lobartovi.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_08");	//Řekni mi všechno, co víš.
	B_KillNpc(gobbo_mage_gr1);
	B_KillNpc(gobbo_mage_gr2);
	B_KillNpc(gobbo_mage_gr3);
	B_KillNpc(gobbo_mage_gr4);
	B_KillNpc(gobbo_mage_gr5);
	VLK_418_Gritta.aivar[AIV_IgnoresArmor] = TRUE;
	Npc_ExchangeRoutine(VLK_418_Gritta,"MissGr");
	AI_Teleport(Gritta,"NW_CITY_GRITTA_MISS_01");
	Wld_InsertNpc(bdt_6140_grittashunt0,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(bdt_6141_grittashunt1,"NW_CITY_GRITTA_MISS_HUNT_02");
	Wld_InsertNpc(bdt_6142_grittashunt2,"NW_CITY_GRITTA_MISS_HUNT_03");
	Wld_InsertNpc(bdt_6143_grittashunt3,"NW_CITY_GRITTA_MISS_HUNT_04");
	Wld_InsertNpc(bdt_6144_grittashunt4,"NW_CITY_GRITTA_MISS_HUNT_05");
	MIS_MISSGRITTA = LOG_Running;
	GRITTACANFOUND = TRUE;
	Log_CreateTopic(TOPIC_MISSGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_Running);
	B_LogEntry(TOPIC_MISSGRITTA,"Neteř tesaře Thorbena zmizela. Setkala se s obchodníkem, který ji chtěl prodat nějaké hadry a pak s ním odešla do lesa. Od té doby uběhlo už několik dní a stále se nevrátila. Nabídl jsem Thorbenovi pomoc. Naposledy ji viděl u Jižní brány. Myslím, že bych měl započít pátrání odtamtud.");
	Info_ClearChoices(dia_thorben_missgritta);
};

func void dia_thorben_missgritta_ok()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Thorben_MissGritta_Ok_01_00");	//No! Dám ti těch 500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_03");	//Ó!... (obdivně) Žehnej ti Innos! Srdečně ti děkuji!
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_04");	//Teď mohu zaplatit domobráncům a ti najdou Grittu!
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_06");	//Počkej! Nespěchej. Chci ti poděkovat za pomoc.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_08");	//Odpusť, tak mě vychovali. Tady, vem si tyhle paklíče.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_09");	//Myslím, že ti budou k užitku.
	B_GiveInvItems(self,other,ItKE_lockpick,20);
	AI_Output(other,self,"DIA_Thorben_MissGritta_Ok_01_10");	//Díky!
	GRITTAMUSTNOTDEAD = TRUE;
	MIS_MISSGRITTA = LOG_Running;
	Log_CreateTopic(TOPIC_MISSGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_Running);
	B_LogEntry(TOPIC_MISSGRITTA,"Neteř tesaře Thorbena zmizela. Setkala se s obchodníkem, který ji chtěl prodat nějaké hadry a pak s ním odešla do lesa. Od té doby uběhlo už několik dní a stále se nevrátila. Dal jsem Thorbenovi 500 zlatých, aby zaplatil domobráncům. Ti pak najdou Grittu. Doufejme, že všechno bude v pořádku.");
	Info_ClearChoices(dia_thorben_missgritta);
	Npc_ExchangeRoutine(VLK_462_Thorben,"GoAndre");
};

func void dia_thorben_missgritta_no()
{
	AI_Output(other,self,"DIA_Thorben_MissGritta_No_01_00");	//Je to příliš mnoho!
	AI_Output(self,other,"DIA_Thorben_MissGritta_No_01_02");	//Rozumím... (smutně) Dobrá, pokusím se peníze sehnat nějak jinak.
	AI_Output(self,other,"DIA_Thorben_MissGritta_No_01_03");	//Doufám, že se mé malé holčičce nic nestalo.
	AI_Output(self,other,"DIA_Thorben_MissGritta_No_01_04");	//Ach... (smutný povzdech)
	B_KillNpc(gobbo_mage_gr1);
	B_KillNpc(gobbo_mage_gr2);
	B_KillNpc(gobbo_mage_gr3);
	B_KillNpc(gobbo_mage_gr4);
	B_KillNpc(gobbo_mage_gr5);
	CreateInvItems(Gritta,itri_grittasring,1);
	Npc_ExchangeRoutine(VLK_418_Gritta,"MissGr");
	AI_Teleport(Gritta,"NW_CITY_GRITTA_MISS_01");
	B_KillNpc(Gritta);
	Wld_InsertNpc(bdt_6140_grittashunt0,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(bdt_6141_grittashunt1,"NW_CITY_GRITTA_MISS_HUNT_02");
	Wld_InsertNpc(bdt_6142_grittashunt2,"NW_CITY_GRITTA_MISS_HUNT_03");
	Wld_InsertNpc(bdt_6143_grittashunt3,"NW_CITY_GRITTA_MISS_HUNT_04");
	Wld_InsertNpc(bdt_6144_grittashunt4,"NW_CITY_GRITTA_MISS_HUNT_05");
	GRITTAMUSTISDEAD = TRUE;
	Info_ClearChoices(dia_thorben_missgritta);
};


instance DIA_THORBEN_GRITTAISBACK(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_grittaisback_condition;
	information = dia_thorben_grittaisback_info;
	permanent = FALSE;
	description = "Je Gritta v pořádku?";
};


func int dia_thorben_grittaisback_condition()
{
	if(!Npc_IsDead(Gritta) && (GRITTAISBACK == TRUE) && (MIS_MISSGRITTA == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_thorben_grittaisback_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaIsBack_01_00");	//Je Gritta v pořádku?
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_01");	//Ano, sláva Innosovi - vrátila se!
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == FALSE))
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_02");	//Z celého srdce ti děkuji!
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_07");	//Naneštěstí, nejsem bohatý a nemohu ti poděkovat zlatem.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_08");	//Proto bude lepší, když ti raději řeknu, jak si poradit s těžkými typy zámků.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_09");	//Podívej, není to tak těžké... Jsi připravený?
		Info_ClearChoices(dia_thorben_grittaisback);
		Info_AddChoice(dia_thorben_grittaisback,"Jsem připraven.",dia_thorben_grittaisback_teach);
		MIS_MISSGRITTA = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_SUCCESS);
		B_LogEntry(TOPIC_MISSGRITTA,"Gritta se vrátila domů. Thorben je celým štěstím bez sebe!");
	}
	else if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == TRUE))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_10");	//Zaplatil jsem domobráncům a oni začali hledat.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_11");	//A za pár dní se vrátili s Grittou... (usmívá se)
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_15");	//Takže přijmi mé upřímné díky! Děkuji ti!
		MIS_MISSGRITTA = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_SUCCESS);
		B_LogEntry(TOPIC_MISSGRITTA,"Gritta se vrátila domů.");
	};
};

func void dia_thorben_grittaisback_teach()
{
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,1);
	AI_Output(other,self,"DIA_Thorben_GrittaIsBack_Teach_01_00");	//Jsem připraven.
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_Teach_01_01");	//Nejdřív musíš sledovat, zda se neláme paklíč.
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_Teach_01_02");	//Až budeš zkušenější, vycítíš okamžik, kdy se paklíč bude lámat. On pak změní zvuk!
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_Teach_01_03");	//Myslím, že se to naučíš. Zvykneš si pozorně naslouchat v tichosti zámku a do budoucna ušetříš spoustu paklíčů.
};


instance DIA_THORBEN_GRITTAISDEAD(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_grittaisdead_condition;
	information = dia_thorben_grittaisdead_info;
	permanent = TRUE;
	description = "Gritta se nevrátí.";
};


func int dia_thorben_grittaisdead_condition()
{
	if((GRITTAFOUNDISDEAD == TRUE) && (GRITTAISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorben_grittaisdead_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_00");	//Gritta se nevrátí.
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_01");	//Cože?!... (ustrašeně) Proč?!
	AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_02");	//Našel jsem její tělo v lese. Je mrtvá!
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_03");	//Ale... Ale kdo to mohl udělat?!... (zmateně) Kdo zabil moji holčičku?!
	AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_04");	//Byli tam banditi.
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_05");	//Ne! To není možné!... (zmateně) Nevěřím ti!
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_06");	//To nemůže být pravda! Lžeš mi!
	if(Npc_HasItems(other,itri_grittasring) >= 1)
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_07");	//Tady, Našel jsem u ní tenhle prsten.
		B_GiveInvItems(other,self,itri_grittasring,1);
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_08");	//Můj bože, ne! To je její snubní prsten... (chvějícím se hlasem) Nikdy by ho nesundala!
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_10");	//To je... (zmateně) Ach, ne! Nemůžu tomu uvěřit!
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_12");	//Innosi, proč se to stalo?!
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_15");	//Přiznávám to! Nemám pro to omluvu...
		GRITTAISDEAD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_THORBEN_ELVRICHGRITTA(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichgritta_condition;
	information = dia_addon_thorben_elvrichgritta_info;
	permanent = FALSE;
	description = "Jak je Elvrichovi?";
};


func int dia_addon_thorben_elvrichgritta_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((Npc_IsDead(Elvrich) == FALSE) && (Npc_IsDead(Gritta) == FALSE) && (MIS_FINDLOSTHUSB == LOG_SUCCESS) && (MIS_LuciasLetter == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == TRUE) && (ELVRIHMARRYGRITTATIMER < (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichgritta_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_01_00");	//Jak je Elvrichovi?
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_01");	//Myslím, že se má dobře.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Mohu jenom doufat, že neuteče znovu s další možnou ženou.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_03");	//Ach... (smutně) Ať se ožení!
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_01_04");	//Zdá se, že Grittě by také nebylo na škodu najít si nového manžela.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_07");	//Hmmm... (zamyšleně) Vlastně máš pravdu - to není špatný nápad! Z nich by byl opravdu dobrý pár.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_11");	//Bylo by to skvělé, ale... (zamyšleně) Jak je mám dát dohromady?!
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_01_12");	//Jednoduše si s nima promluv!
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_13");	//Hmmm... (zamyšleně) Ano, to mohu - jen se bojím, že mě ani nebudou poslouchat!
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_15");	//Tady bude potřeba používat správná slova tak, abych ani jednoho neurazil.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_17");	//Můžeš s nimi promluvit ty?
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
	Info_AddChoice(dia_addon_thorben_elvrichgritta,"No, proč ne!",dia_addon_thorben_elvrichgritta_help);
	Info_AddChoice(dia_addon_thorben_elvrichgritta,"Ne, tohle není pro mě.",dia_addon_thorben_elvrichgritta_no);
};

func void dia_addon_thorben_elvrichgritta_no()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_No_01_00");	//Ne, tohle není pro mě.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_No_01_01");	//Ach... (s porozuměním) To je škoda!
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_No_01_02");	//Dobrá, Zkusím to nějak sám. Snad to dobře dopadne.
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
};

func void dia_addon_thorben_elvrichgritta_help()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_Help_01_00");	//No, proč ne! Promluvím s nimi.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_Help_01_01");	//To je skvělé!... (usmívá se) Doufám, že to dobře dopadne.
	MIS_ELVRIHMARRYGRITTA = LOG_Running;
	Log_CreateTopic(TOPIC_ELVRIHMARRYGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ELVRIHMARRYGRITTA,LOG_Running);
	B_LogEntry(TOPIC_ELVRIHMARRYGRITTA,"Tesař Thorben dostal nápad. Dát dohromady jeho neteř Grittu a jeho žáka Elvricha. Nabídl jsem se, že mu pomohu. Jsem zvědavý, jak to udělám.");
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
};


instance DIA_ADDON_THORBEN_ELVRICHGRITTADONE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichgrittadone_condition;
	information = dia_addon_thorben_elvrichgrittadone_info;
	permanent = FALSE;
	description = "Mluvil jsem s Elvrichem a Grittou.";
};


func int dia_addon_thorben_elvrichgrittadone_condition()
{
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichgrittadone_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGrittaDone_01_00");	//Mluvil jsem s Elvrichem a Grittou.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_01");	//A jak to dopadlo?
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGrittaDone_01_02");	//Vypadá to, že Gritta bude mít brzy nového manžela.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_03");	//Opravdu?!... (udiveně)
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_08");	//Díky za pomoc!
	MIS_ELVRIHMARRYGRITTA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ELVRIHMARRYGRITTA,LOG_SUCCESS);
	Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"BackInTheCity");
	Npc_ExchangeRoutine(VLK_418_Gritta,"Start");
};

var int ThorbenDoCrossBow;

instance DIA_Thorben_DoCrossBow(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_DoCrossBow_condition;
	information = DIA_Thorben_DoCrossBow_info;
	permanent = FALSE;
	description = "Víš, jak vyrobit kuši?";
};

func int DIA_Thorben_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (CrossBowNeedPlotnik == TRUE) && (ThorbenDoCrossBow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_DoCrossBow_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Thorben_DoCrossBow_01_01");	//Víš, jak vyrobit kuši?
	AI_Output(self,other,"DIA_Thorben_DoCrossBow_01_02");	//Jak se to vezme. Celou kuši vyrobit neumím, ale tu dřevěnou část, sochu, ano.
	AI_Output(other,self,"DIA_Thorben_DoCrossBow_01_03");	//A mohl bys mě to naučit?
	AI_Output(self,other,"DIA_Thorben_DoCrossBow_01_04");	//Jistě! Když si tedy zaplatíš školné.
	AI_Output(other,self,"DIA_Thorben_DoCrossBow_01_05");	//No, samozřejmě.
	ThorbenDoCrossBow = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Truhlář Thorben mi může ukázat, jak vytvořit dřevěnou sochu pro kuši.");
};

instance DIA_Thorben_MakeUpor(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_MakeUpor_condition;
	information = DIA_Thorben_MakeUpor_info;
	permanent = TRUE;
	description = "Nauč mě vyrábět sochy pro kuše. (cena: 1500 zlatých)";
};

func int DIA_Thorben_MakeUpor_condition()
{
	if((ThorbenDoCrossBow == TRUE) && (PlayerTeachCrBowMade == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_MakeUpor_info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Thorben_MakeUpor_01_00");	//Nauč mě vyrábět sochy pro kuše.
	money = 1500;

	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Thorben_MakeUpor_03_90");	//Nemáš dost zlata, vrať se později.
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= money)
	{
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_01");	//Je to snadné! Vezmeš si dostatečně velký kus dřeva.
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_02");	//Na truhlářském ponku z něj vyřežeš sochu kuše, vydlabeš místo pro hák a zhotovíš žlábky.
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_03");	//Potom všechny ostatní kovové části kuše připojíš ke konstrukci v kovárně na kovadlině.
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_04");	//Pamatuješ si to?
		AI_Output(other,self,"DIA_Thorben_MakeUpor_01_05");	//Jistě.
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		PlayerTeachCrBowMade = TRUE;
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Teď už vím, jak udělat dřevěnou sochu pro kuši.");
	};
};

//----------------vetka Drakii------------------------------------------

instance DIA_Addon_Thorben_TalkAboutElza(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Info;
	permanent = FALSE;
	description = "Ty jsi tesař, viď?";
};

func int DIA_Addon_Thorben_TalkAboutElza_Condition()
{
	if((MIS_OldElza == LOG_Running) && (Npc_HasItems(other,ItMi_ShipShceme) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_01");	//Ty jsi tesař, viď?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_02");	//Už tomu tak bude. Dá se říct, že rozumím své práci. Když někdo potřebuje něco se dřevem, já přicházím.
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_03");	//Skvělé. Mám pro tebe práci.
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_04");	//O jakou práci jde?
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_05");	//Tady, koukni.
	B_GiveInvItems(other,self,ItMi_ShipShceme,1);
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_06");	//Hm, ukaž.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_07");	//Vypadá to jako část lodi. Stavíš snad loď?
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_08");	//Zatím ne. Ale uvažuji o tom. Tak co, bereš?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_09");	//Ano, beru. Ale budu potřebovat speciální dřevo. Také několik specifických nástrojů. To půjde do peněz...
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_10");	//Kolik? 
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_11");	//Ehhhhh... No, 2000 zlatých.
	B_LogEntry(TOPIC_OldElza,"Thorben nezklamal. Je schopen se zhostit práce. Požaduje však 2000 zlatých.");
};

instance DIA_Addon_Thorben_TalkAboutElza_Money(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Money_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Money_Info;
	permanent = FALSE;
	description = "Tady jsou peníze.";
};

func int DIA_Addon_Thorben_TalkAboutElza_Money_Condition()
{
	if((MIS_OldElza == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Thorben_TalkAboutElza) == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Money_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_01");	//Tady jsou peníze.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_Money_01_02");	//Skvělé!
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_03");	//Kdy začneš?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_Money_01_04");	//Začnu ihned. Zítra by mělo být hotovo.
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_05");	//Výborně.
	B_LogEntry(TOPIC_OldElza,"Zaplatil jsem Thorbenovi. Měl by být hotov druhý den.");
	ThorbenElzaDay = Wld_GetDay();
	ThorbenOnWork = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Thorben_TalkAboutElza_Done(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Done_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Done_Info;
	permanent = FALSE;
	description = "Jak jsi na tom?";
};

func int DIA_Addon_Thorben_TalkAboutElza_Done_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_OldElza == LOG_Running) && (ThorbenOnWork == TRUE) && (ThorbenElzaDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Done_01_01");	//Jak jsi na tom?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_Done_01_02");	//Hotovo. Můžeš si to vzít.
	B_GiveInvItems(self,other,ItMi_SkipShipPack,1);
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Done_01_03");	//Fantastické.
	B_LogEntry(TOPIC_OldElza,"Thorben dokončil svoji práci.");
};