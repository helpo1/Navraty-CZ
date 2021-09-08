const int VALUE_ALFREDSHEEPFUR = 5;
const int VALUE_ALFREDKEILERFUR = 7;
const int VALUE_ALFREDWOLFFUR = 7;
const int VALUE_ALFREDLURKERSKIN = 10;
const int VALUE_ALFREDWARGFUR = 30;
const int VALUE_ALFREDSHARKSKIN = 40;
const int VALUE_ALFREDSHADOWFUR = 70;
const int VALUE_ALFREDPUMAFUR = 100;
const int VALUE_ALFREDICEPUMAFUR = 125;
const int VALUE_ALFREDTROLLFUR = 125;
const int VALUE_ALFREDTROLLBLACKFUR = 250;
const int VALUE_ALFREDTEETH = 10;
const int VALUE_ALFREDTROLLTOOTH = 150;
const int VALUE_ALFREDCLAW = 8;
const int VALUE_ALFREDLURKERCLAW = 10;
const int VALUE_ALFREDDRGHORN = 75;
const int VALUE_ALFREDSHADOWHORN = 120;
const int VALUE_ALFREDSHARKTEETH = 60;
const int VALUE_ALFREDDESERTSHARKTEETH = 100;


instance DIA_HUN_742_ALFRED_EXIT(C_Info)
{
	npc = hun_742_alfred;
	nr = 999;
	condition = dia_hun_742_alfred_exit_condition;
	information = dia_hun_742_alfred_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_742_alfred_exit_condition()
{
	return TRUE;
};

func void dia_hun_742_alfred_exit_info()
{
	AI_StopProcessInfos(self);
};


var int alfredhellofirsttime;

instance DIA_HUN_742_ALFRED_FIRSTHI(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_firsthi_condition;
	information = dia_hun_742_alfred_firsthi_info;
	permanent = TRUE;
	description = "Zdar, jak se máš?";
};


func int dia_hun_742_alfred_firsthi_condition()
{
	if(Kapitel <= 5)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_firsthi_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(other,self,"DIA_HUN_742_FirstHi_01_00");	//Jak se máš?
		if(ALFREDHELLOFIRSTTIME == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_01");	//Ano mám se dobře. I když v poslední době je lov v severních lesích dosti nebezpečný.
			AI_Output(other,self,"DIA_HUN_742_FirstHi_01_02");	//A co je tam nebezpečné?
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_03");	//Dragomir říkal, že tam byl napaden kostlivci - odkud se tam vzali, to se nikdy nedozvím.
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_04");	//Tam kromě mrchožroutů nic dalšího nebylo, a teď...
			if(HEROISHUNTER == FALSE)
			{
				AI_Output(other,self,"DIA_HUN_742_FirstHi_01_05");	//Jasné. A co je tohle za místo?
				AI_Output(self,other,"DIA_HUN_742_FirstHi_01_06");	//Tohle je tábor lovců!
				AI_Output(self,other,"DIA_HUN_742_FirstHi_01_07");	//Jestli se k nám chceš připojit, promluv si s Falkem. On tady velí.
				AI_Output(self,other,"DIA_HUN_742_FirstHi_01_08");	//Myslím, že by se nám hodil další lovec.
			};
			ALFREDHELLOFIRSTTIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_742_FirstHi_01_09");	//Ano, v pořádku, příteli.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_742_FirstHi_01_10");	//Zdar, jak se máš?
		AI_Output(self,other,"DIA_HUN_742_FirstHi_01_11");	//To tě nemusí zajímat.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_742_ALFRED_HELLO(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_hello_condition;
	information = dia_hun_742_alfred_hello_info;
	permanent = FALSE;
	description = "Co děláš?";
};


func int dia_hun_742_alfred_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_hello_info()
{
	AI_Output(other,self,"DIA_HUN_742_Hello_01_00");	//Co děláš?
	AI_Output(self,other,"DIA_HUN_742_Hello_01_01");	//Jsem lovec. Žiju z prodeje zubů a kůží.
	AI_Output(other,self,"DIA_HUN_742_Hello_01_02");	//Platí se za to dobře?
	AI_Output(self,other,"DIA_HUN_742_Hello_01_03");	//Pokud všechno uděláš správně, můžeš za to dostat dobrou sumu zlata. Hlavní věc je naučit se dobře zpracovat kořist. 
	AI_Output(self,other,"DIA_HUN_742_Hello_01_04");	//Můžu tě to naučit. Pokud chceš, samozřejmě. 
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Alfred mě může naučit, jak zpracovat lovecké trofeje.");
};


instance DIA_HUN_742_ALFRED_NEWS(C_Info)
{
	npc = hun_742_alfred;
	nr = 2;
	condition = dia_hun_742_alfred_news_condition;
	information = dia_hun_742_alfred_news_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_hun_742_alfred_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_news_info()
{
	AI_Output(other,self,"DIA_HUN_742_News_01_00");	//Co je nového?
	if((Kapitel >= 1) && (MIS_INSWOLFHIDE == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_01");	//V lese, nedaleko hostince 'U Mrtvé harpyje', byla spatřena velká smečka vlků.
		AI_Output(self,other,"DIA_HUN_742_News_01_02");	//Až donedávna se celkem nic nestalo. Nezpůsobila místním žádné velké potíže.
		AI_Output(self,other,"DIA_HUN_742_News_01_03");	//Před pár dny tito vlci pokousali člověka, ten pak zemřel.
		AI_Output(self,other,"DIA_HUN_742_News_01_04");	//Chudák, bez rozvahy šel příliš hluboko do lesa.
		AI_Output(other,self,"DIA_HUN_742_News_01_05");	//Říkal jsi o tom Falkovi?
		AI_Output(self,other,"DIA_HUN_742_News_01_06");	//Ano, ví to. Navíc já s Dragomirem jsem tam vyrazili a chtěli vlky ulovit.
		AI_Output(self,other,"DIA_HUN_742_News_01_07");	//Ale bohužel se nám nepodařilo je vystopovat.
		AI_Output(self,other,"DIA_HUN_742_News_01_08");	//Vypadá to, že tyhle šelmy jsou velmi chytré a nebude snadné je dostat!
		AI_Output(other,self,"DIA_HUN_742_News_01_09");	//A co teď?
		AI_Output(self,other,"DIA_HUN_742_News_01_10");	//V nejbližším čase vyrazíme a tu smečku ulovíme.
		AI_Output(self,other,"DIA_HUN_742_News_01_11");	//Mezitím doufejme, že nikoho dalšího neporaní.
		AI_Output(other,self,"DIA_HUN_742_News_01_12");	//Jasně.
		MIS_INSWOLFHIDE = LOG_Running;
		Log_CreateTopic(TOPIC_INSWOLFHIDE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSWOLFHIDE,LOG_Running);
		B_LogEntry(TOPIC_INSWOLFHIDE,"Alfred mi řekl, že v lese, nedaleko hostince 'U Mrtvé harpyje', byla spatřena velká smečka vlků. Už zvládli roztrhat jednoho člověka. Někteří lovci, mezi nimi Alfred, vyrazili do lesa a chtěli ulovit tyto vlky, ale nepodařilo se jim je najít. Alfred v nejbližší době plánuje vyrazit tam znovu a skoncovat to s těmi vlky.");
		Wld_InsertNpc(hunt_wolf_01,"FP_ROAM_NW_HUNTWOLF_01");
		Wld_InsertNpc(hunt_wolf_02,"FP_ROAM_NW_HUNTWOLF_02");
		Wld_InsertNpc(hunt_wolf_03,"FP_ROAM_NW_HUNTWOLF_03");
		Wld_InsertNpc(hunt_wolf_04,"FP_ROAM_NW_HUNTWOLF_04");
	}
	else if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_13");	//V poslední době je v těchto krajích až moc banditů.
		AI_Output(self,other,"DIA_HUN_742_News_01_14");	//Takže kdo chodí ven z tábora, ten riskuje že narazí na tyhle bastardy!
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_15");	//Zatím žádné zprávy.
		AI_Output(self,other,"DIA_HUN_742_News_01_16");	//I když, možná je to i dobrá věc!
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_17");	//V poslední době se tu dějí divné věci. Po kraji chodí divní lidé v černých hábitech.
		AI_Output(self,other,"DIA_HUN_742_News_01_18");	//Že by se měli okamžitě divit?!
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_19");	//Říká se, že malá skupina žoldáků šla do Hornického údolí. Představ si, že hoši chtějí lovit draky!
		AI_Output(self,other,"DIA_HUN_742_News_01_20");	//Zajímalo by mě, co z toho podniku bude.
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_21");	//Říká se, že někdo zabil všechny draky v Hornickém údolí. No představ si.
		AI_Output(self,other,"DIA_HUN_742_News_01_22");	//Nikdy jsem si nemyslel, že by to človek dokázal.
	}
	else if(Kapitel == 6)
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_23");	//Horší to být nemuže - všechny cesty blokují skřeti.
		AI_Output(self,other,"DIA_HUN_742_News_01_24");	//Jestli to tak půjde i dál, tak to je konec!
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_25");	//Nic.
	};
};


instance DIA_HUN_742_ALFRED_INSWOLFHIDE(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_inswolfhide_condition;
	information = dia_hun_742_alfred_inswolfhide_info;
	permanent = FALSE;
	description = "Je po vlcích.";
};


func int dia_hun_742_alfred_inswolfhide_condition()
{
	if((MIS_INSWOLFHIDE == LOG_Running) && Npc_IsDead(hunt_wolf_01) && Npc_IsDead(hunt_wolf_02) && Npc_IsDead(hunt_wolf_03) && Npc_IsDead(hunt_wolf_04))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_inswolfhide_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_742_InsWolfHide_01_00");	//Je po vlcích.
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_01");	//Opravdu? To je dobré!
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_02");	//Z tvé strany to byl velký risk, lovit celou smečku.
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_05");	//V tom případě ti musím poděkovat za to, co jsi udělal.
	AI_Output(self,other,"DIA_HUN_742_InsWolfHide_01_06");	//Tady, vem si tyto tři rohy stínové šelmy jako odměnu.
	B_GiveInvItems(self,other,ItAt_ShadowHorn,3);
	AI_Output(other,self,"DIA_HUN_742_InsWolfHide_01_07");	//Díky!
	MIS_INSWOLFHIDE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSWOLFHIDE,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSWOLFHIDE,"Alfred mi dal tři rohy stínové šelmy za ulovení vlků.");
};


instance DIA_HUN_742_ALFRED_RESPECT(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_respect_condition;
	information = dia_hun_742_alfred_respect_info;
	permanent = FALSE;
	description = "Chci vyzvat Falka!";
};


func int dia_hun_742_alfred_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (ALFRED_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_respect_info()
{
	AI_Output(other,self,"DIA_HUN_742_Respect_01_00");	//Chci vyzvat Falka!
	AI_Output(self,other,"DIA_HUN_742_Respect_01_01");	//Opravdu? Zajímavé, z tvé strany. (smích)
	AI_Output(self,other,"DIA_HUN_742_Respect_01_02");	//Falk - to je nejlepší lovec, jakého jsem kdy potkal.
	AI_Output(self,other,"DIA_HUN_742_Respect_01_03");	//Nemyslím si, že máš moc šancí vyhrát.
	AI_Output(other,self,"DIA_HUN_742_Respect_01_04");	//Ale stejne to zkusím.
	AI_Output(other,self,"DIA_HUN_742_Respect_01_05");	//Pravda, pro začátek musím získat podporu většiny lovců v táboře, abych získal jejich respekt.
	AI_Output(self,other,"DIA_HUN_742_Respect_01_06");	//Takže i muj, že?!
	AI_Output(other,self,"DIA_HUN_742_Respect_01_07");	//Ano. Bylo by dobré vědět tvůj názor.
	if(MIS_INSWOLFHIDE == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_742_Respect_01_08");	//Hmm... (zamyšlene) Myslím, že si ho zasloužíš!
		AI_Output(self,other,"DIA_HUN_742_Respect_01_09");	//Sám jsi sejmul ty vlky zabijáky. To znamená hodně.
		AI_Output(other,self,"DIA_HUN_742_Respect_01_10");	//Takže mám tvůj hlas?
		AI_Output(self,other,"DIA_HUN_742_Respect_01_11");	//?áš...
		AI_Output(self,other,"DIA_HUN_742_Respect_01_12");	//Přeji ti hodně štěstí.
		B_LogEntry(TOPIC_HUNTERSWORK,"Alfred myslí, že jsem dobrý lovec a hoden úcty. Podpoří mě, pokud se rozhodnu vyzvat Falka.");
		ALFRED_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_Respect_01_15");	//Promiň chlape, ale ne. Nevidím žádný důvod, proč pro tebe hlasovat.
		AI_Output(self,other,"DIA_HUN_742_Respect_01_17");	//Stále ses v tomhle táboře neprojevil.
		AI_Output(self,other,"DIA_HUN_742_Respect_01_18");	//Podívej, pár lehkých pochůzek ještě nedělá dobrého lovce. A ještě nemáš respekt u ostatních.
	};
};


instance DIA_HUN_742_ALFRED_RESPECTDONE(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_respectdone_condition;
	information = dia_hun_742_alfred_respectdone_info;
	permanent = TRUE;
	description = "Co tvůj hlas?";
};


func int dia_hun_742_alfred_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_742_alfred_respect) && (CANHUNTERCHALLANGE == TRUE) && (ALFRED_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_742_RespectDone_01_00");	//Co tvůj hlas?
	if(MIS_INSWOLFHIDE == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_01");	//Hmm... (zamyšlene) Myslím, že si ho zasloužíš!
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_02");	//Sám jsi sejmul ty vlky zabijáky. To znamená hodně.
		AI_Output(other,self,"DIA_HUN_742_RespectDone_01_03");	//Takže mám tvůj hlas?
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_04");	//Máš...
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_05");	//Přeji ti hodně štěstí.
		B_LogEntry(TOPIC_HUNTERSWORK,"Alfred myslí, že jsem dobrý lovec a hoden úcty. Podpoří mě, pokud se rozhodnu vyzvat Falka.");
		ALFRED_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_RespectDone_01_08");	//Můj názor na tebe víš, nezměnil se.
	};
};


instance DIA_HUN_742_ALFRED_TEACHHUNTING(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_teachhunting_condition;
	information = dia_hun_742_alfred_teachhunting_info;
	permanent = TRUE;
	description = "Chci se naučit zpracovat trofeje.";
};


func int dia_hun_742_alfred_teachhunting_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_742_alfred_hello) && (ALFREDTEACHALL == FALSE))
	{
		return TRUE;
	};
};


var int dia_hun_742_alfred_teachhunting_onetime;

func void dia_hun_742_alfred_teachhunting_info()
{
	AI_Output(other,self,"DIA_HUN_742_TeachHunting_01_00");	//Chci se naučit zpracovat trofeje.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		if(DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_01");	//Jestli to bude možné, vezmi ze zvířat tesáky a drápy. Není to lehké, ale vyplatí se to.
			AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_02");	//Obchodníci za ně rádi zaplatí.
			DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_03");	//Na tvém míste bych se to naueil hned, jak budeš moci.
		};
		Info_ClearChoices(dia_hun_742_alfred_teachhunting);
		Info_AddChoice(dia_hun_742_alfred_teachhunting,Dialog_Back,dia_hun_742_alfred_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),dia_hun_742_alfred_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),dia_hun_742_alfred_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),dia_hun_742_alfred_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Stahování kůží plazů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),dia_hun_742_alfred_teachhunting_reptileskin);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_01_04");	//Výborně. Teď znáš vše, co já.
		ALFREDTEACHALL = TRUE;
	};
};

func void dia_hun_742_alfred_teachhunting_back()
{
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_Claws_01_00");	//Jak vytáhnu drápy?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Claws_01_01");	//Ve skutečnosti je to velmi jednoduché - pokud víš, co dělat. Jednoduše dráp vykroutíš smerem dozadu. Ale nezkoušej ho vylomit!
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Claws_01_02");	//Hodne zvířat má drápy. U eíhavcu jsou ale nejlepší.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_Fur_01_00");	//Jak stáhnu kuži?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Fur_01_01");	//Nařízneš u každé koneetiny a hlavy. Pak taháš. Kůže jsou velmi cenné
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Fur_01_02");	//Z kůži vlků nebo stínové šelmy se vyrábí oděvy a kožichy. Když se na kůži zvířete podíváš pozorně, zjistíš jestli je dobrá nebo ne.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_Teeth_01_00");	//Jak na zuby?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Teeth_01_01");	//Hlavně je nevylamuj. Dej nůž kolem středu zubu, na základnu a zkus ho vypáčit.
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_Teeth_01_02");	//Najdeš je u vlku, chaapavcu a stínových šelem.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_reptileskin()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
	{
		AI_Output(other,self,"DIA_HUN_742_TeachHunting_ReptileSkin_01_00");	//A když chci kůži plazů?
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_ReptileSkin_01_01");	//Na to jsou vhodní chňapavci.
		AI_Output(self,other,"DIA_HUN_742_TeachHunting_ReptileSkin_01_02");	//Musíš ho naříznout po celém obvodu tela, aby se nepotrhala kuže a pak opatrne taháš.	
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};


instance DIA_HUN_742_ALFRED_TEACHHUNTING_PRETTYMUCH(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_teachhunting_prettymuch_condition;
	information = dia_hun_742_alfred_teachhunting_prettymuch_info;
	permanent = FALSE;
	description = "Tvé rady jsou drahé.";
};


func int dia_hun_742_alfred_teachhunting_prettymuch_condition()
{
	if(DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_teachhunting_prettymuch_info()
{
	AI_Output(other,self,"DIA_HUN_742_TeachHunting_PrettyMuch_01_00");	//Tvé rady jsou drahé.
	AI_Output(self,other,"DIA_HUN_742_TeachHunting_PrettyMuch_01_01");	//Vše zde má svou cenu.
	AI_Output(self,other,"DIA_HUN_742_TeachHunting_PrettyMuch_01_02");	//Pokud ze zvěře nezískáš trofeje, tak to všechno zbytečně shnije.
	AI_Output(self,other,"DIA_HUN_742_TeachHunting_PrettyMuch_01_03");	//A ztratíš možnost prodávat je za vysoké ceny, hlavně kůži. Takže se to vyplatí.
};


instance DIA_HUN_742_ALFRED_DRGSNPHORN(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_drgsnphorn_condition;
	information = dia_hun_742_alfred_drgsnphorn_info;
	permanent = FALSE;
	description = "Máš problém?";
};


func int dia_hun_742_alfred_drgsnphorn_condition()
{
	if((Kapitel >= 2) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_drgsnphorn_info()
{
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHorn_01_00");	//Máš problém? Vypadáš sešle...
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_01");	//Ano mám takový problém. Falk mi dal úkol získat roh dračího chňapavce.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_02");	//Už ses s nimi někdy setkal?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_03");	//Velmi milá příšerka, která ti ukousne hlavu.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_04");	//Jeden osamělý lovec má s ní těžké pořízení.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_05");	//Nemluvě o tom, že tito tvorové nikdy neloví sami.
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHorn_01_06");	//Takže se bojíš?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_07");	//Kdybych se bál, tak bych nebyl lovec. To vůbec není to hlavní.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_09");	//Jen tato zvířata je téměř nemožné najít v této části ostrova.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_10");	//Žije v Hornickém údolí, ale tam se to hemží skřety!
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_11");	//Nejsem sebevrah a nechci se dostat do kotle těch zelenokožců.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_12");	//Jak mám ten úkol udělat?
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHorn_01_13");	//Možná ti můžu pomoci v tomto nebezpečném lovu?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_15");	//Opravdu? To od tebe bude hezké.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_16");	//Pokud mi roh přineseš, podělím se s tebou o odměnu fifty fifty, platí?
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHorn_01_18");	//Výborně. Přijď, jestli ho získáš.
	MIS_DRGSNPHORN = LOG_Running;
	Log_CreateTopic(TOPIC_DRGSNPHORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRGSNPHORN,LOG_Running);
	B_LogEntry(TOPIC_DRGSNPHORN,"Alfred chce roh dračího chňapavce. Falk na něj má kupce, ale Alfred tvrdí, že nejbližší hnízda dračích chňapavců jsou v Hornickém údolí. Pochopitelně jsem mu nabídl pomoc, že mu roh přinesu.");
};


instance DIA_HUN_742_ALFRED_DRGSNPHORNDONE(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_drgsnphorndone_condition;
	information = dia_hun_742_alfred_drgsnphorndone_info;
	permanent = FALSE;
	description = "Mám ten roh.";
};


func int dia_hun_742_alfred_drgsnphorndone_condition()
{
	if((MIS_DRGSNPHORN == LOG_Running) && (Npc_HasItems(other,ItAt_DrgSnapperHorn) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_drgsnphorndone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_00");	//Mám ten roh, jak jsi chtěl.
	B_GiveInvItems(other,self,ItAt_DrgSnapperHorn,1);
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHornDone_01_01");	//Páni, kde jsi to vzal? Vypadá to že jsi silný lovec, když jsi mohl dostat takové velké monstrum.
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_02");	//Trochu jsem se u toho zapotil. Byl opravdu silný.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHornDone_01_03");	//Dobře! Teď si můžeš odpočinout a dostaneš odměnu.
	AI_Output(self,other,"DIA_HUN_742_DrgSnpHornDone_01_04");	//Tady, jak jsem slíbil - tvůj podíl!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_05");	//Díky!
	MIS_DRGSNPHORN = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DRGSNPHORN,LOG_SUCCESS);
	B_LogEntry(TOPIC_DRGSNPHORN,"Dal jsem Alfredovi roh dračího chňapavce.");
};


instance DIA_HUN_742_ALFRED_PICKPOCKET(C_Info)
{
	npc = hun_742_alfred;
	nr = 900;
	condition = dia_hun_742_alfred_pickpocket_condition;
	information = dia_hun_742_alfred_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_742_alfred_pickpocket_condition()
{
	return C_Beklauen(75,150);
};

func void dia_hun_742_alfred_pickpocket_info()
{
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
	Info_AddChoice(dia_hun_742_alfred_pickpocket,Dialog_Back,dia_hun_742_alfred_pickpocket_back);
	Info_AddChoice(dia_hun_742_alfred_pickpocket,DIALOG_PICKPOCKET,dia_hun_742_alfred_pickpocket_doit);
};

func void dia_hun_742_alfred_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
};

func void dia_hun_742_alfred_pickpocket_back()
{
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
};


instance DIA_HUN_742_ALFRED_TROPHYEXPLAIN(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_trophyexplain_condition;
	information = dia_hun_742_alfred_trophyexplain_info;
	permanent = FALSE;
	description = "Proe jsou lovecké trofeje tak cenené?";
};


func int dia_hun_742_alfred_trophyexplain_condition()
{
	if((DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == TRUE) || (MIS_DRGSNPHORN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_trophyexplain_info()
{
	AI_Output(other,self,"DIA_HUN_742_TrophyExplain_01_00");	//Proe jsou lovecké trofeje tak cenené?
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_01");	//Z mnoha důvodů
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_02");	//Hlavně proto, že se dál zpracovávají v jiné výrobky.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_03");	//Oblečení, šperky, zbroje a podobné.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_04");	//Nekteří lidé také sbírají zvláštní a cenné trofeje!
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_05");	//Jestli nejaké máš, rád je od tebe koupím.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_06");	//Samozřejmě, že neberu všechno. Mám zájem jen o kůže, drápy, rohy a zuby.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_07");	//Jestli budeš nějaké mít, přines mi je.
	AI_Output(self,other,"DIA_HUN_742_TrophyExplain_01_08");	//O cenu neměj starosti. Dám ti tolik, co ti nedá žádný obchodník.
	Log_CreateTopic(TOPIC_HUNTERTRADES,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTRADES,"Alfred vykupuje kuže, zuby, rohy a drápy.");
	ALFREDCANBUY = TRUE;
};


instance DIA_HUN_742_ALFRED_TROPHYSELL(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_trophysell_condition;
	information = dia_hun_742_alfred_trophysell_info;
	permanent = TRUE;
	description = "Mám pro tebe nejaké trofeje.";
};


func int dia_hun_742_alfred_trophysell_condition()
{
	if(ALFREDCANBUY == TRUE)
	{
		if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_hun_742_alfred_trophysell_info()
{
	AI_Output(other,self,"DIA_HUN_742_TrophySell_01_00");	//Mám pro tebe nejaké trofeje.
	AI_Output(self,other,"DIA_HUN_742_TrophySell_01_01");	//Výborne, tak se na ne podíváme.
	Info_ClearChoices(dia_hun_742_alfred_trophysell);
	Info_AddChoice(dia_hun_742_alfred_trophysell,Dialog_Back,dia_hun_742_alfred_trophysell_back);
	if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"(dát všechny kůže)",dia_hun_742_alfred_trophysell_fur);
	};
	if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"(dát všechny plazí kůže)",dia_hun_742_alfred_trophysell_skin);
	};
	if((Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"(dát všechny rohy)",dia_hun_742_alfred_trophysell_horn);
	};
	if((Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0) || (Npc_HasItems(other,ItAt_DesertSharkTeeth) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"(dát všechny zuby)",dia_hun_742_alfred_trophysell_teeth);
	};
	if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell,"(dát všechny drápy)",dia_hun_742_alfred_trophysell_claw);
	};
};

func void dia_hun_742_alfred_trophysell_back()
{
	Info_ClearChoices(dia_hun_742_alfred_trophysell);
};

func void dia_hun_742_alfred_trophysell_fur()
{
	var int counttradefur;
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_SheepFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_00");	//(udiveně) Ovčí kůže?
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_01");	//Myslel jsem, že máš pro mě něco lepšího.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_03");	//No budiž, vezmu si je.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_04");	//Možná, že se budou hodit.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SheepFur) * VALUE_ALFREDSHEEPFUR);
		Npc_RemoveInvItems(other,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
	};
	if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_05");	//Áá, kuže dívočáku - to není špatné!

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Addon_KeilerFur) * VALUE_ALFREDKEILERFUR);
		Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_07");	//Chm. Další vlčí kůže.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WolfFur) * VALUE_ALFREDWOLFFUR) + (Npc_HasItems(other,ItAt_IceWolfFur) * VALUE_ALFREDWOLFFUR);
		Npc_RemoveInvItems(other,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
		Npc_RemoveInvItems(other,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_11");	//Kůže wargů! To jsou hodně nebezpečné šelmy!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_13");	//Kvůli nim bych neriskoval život.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WargFur) * VALUE_ALFREDWARGFUR) + (Npc_HasItems(other,ItAt_OrcDogFur) * VALUE_ALFREDWARGFUR);
		Npc_RemoveInvItems(other,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
		Npc_RemoveInvItems(other,ItAt_OrcDogFur,Npc_HasItems(other,ItAt_OrcDogFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,ItAt_WhitePuma) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_15");	//Ohó, kůže pumy! Moc vzácné.
		AllCountGold = AllCountGold + (Npc_HasItems(other,itat_pumafur) * VALUE_ALFREDPUMAFUR);
		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WhitePuma) * VALUE_ALFREDICEPUMAFUR);
		Npc_RemoveInvItems(other,itat_pumafur,Npc_HasItems(other,itat_pumafur));
		Npc_RemoveInvItems(other,ItAt_WhitePuma,Npc_HasItems(other,ItAt_WhitePuma));
		counttradefur = counttradefur + 1;
	};
	if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_17");	//Ha! To je kůže stínové šelmy. Kdo by si to byl pomyslel.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_20");	//Tyhle kožešiny stojí hodně zlata. Tak si vezmu všechny.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_ShadowFur) * VALUE_ALFREDSHADOWFUR);
		Npc_RemoveInvItems(other,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		counttradefur = counttradefur + 1;
	};
	if(Npc_HasItems(other,ItAt_TrollFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_21");	//To je neuvěřitelné! Nevěřím!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_22");	//To je skutečná trolí kůže!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_24");	//Lovit je, to je velmi nebezpečné.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_25");	//Tahle trofej vynese spoustu zlata.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollFur) * VALUE_ALFREDTROLLFUR);
		Npc_RemoveInvItems(other,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
		counttradefur = counttradefur + 2;
	};
	if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_26");	//Nemožné! Máš kůži černého trola.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_28");	//Je to nejcennější trofej, kterou můžeš získat.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_29");	//Chlape, ty mě nepřestáváš udivovat.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_31");	//Jakýkoliv obchodník ti s touhle kůží utrhne i ruce.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollBlackFur) * VALUE_ALFREDTROLLBLACKFUR);
		Npc_RemoveInvItems(other,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
		counttradefur = counttradefur + 3;
	};

	AI_Output(other,self,"DIA_HUN_742_TrophySell_Fur_01_33");	//To je vše, co mám.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};

	if(counttradefur > 5)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_34");	//No takže to je docela dost kůži. Dlouho jsem neviděl takovou sadu.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_35");	//Ale to samozřejmě neznamená, že další už nepotřebuji.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_36");	//Tak pokud budeš mít nějaké nové, můžeš mi je nabídnout.
	}
	else if(counttradefur > 3)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_38");	//No, to není vůbec špatné.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_39");	//I když čekal jsem trochu více.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_40");	//Až budeš mít další kůže, můžeš mi je přinést.
	}
	else if(counttradefur >= 1)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_42");	//Hmm, tentokrát nic moc.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Fur_01_43");	//Ale možná příště mi doneseš něco speciálního, že jo?
	};
};

func void dia_hun_742_alfred_trophysell_skin()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,itat_LurkerSkin) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_01");	//Plazí kůže. To jsi v bažině lovil žáby?
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_02");	//Tak jo, vezmu všechny.

		AllCountGold = AllCountGold + (Npc_HasItems(other,itat_LurkerSkin) * VALUE_ALFREDLURKERSKIN);
		Npc_RemoveInvItems(other,itat_LurkerSkin,Npc_HasItems(other,itat_LurkerSkin));

	};
	if(Npc_HasItems(other,ItAt_SharkSkin) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_03");	//Kůže močálového žraloka. Docela vzácná trofej v těchto krajích.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_skin_01_04");	//Beru všechny.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SharkSkin) * VALUE_ALFREDSHARKSKIN);
		Npc_RemoveInvItems(other,ItAt_SharkSkin,Npc_HasItems(other,ItAt_SharkSkin));
	};

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_horn()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_ShadowHorn) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_01");	//Roh stínové šelmy! Velmi cenná trofej.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_02");	//Beru od tebe všechny.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_ShadowHorn) * VALUE_ALFREDSHADOWHORN);
		Npc_RemoveInvItems(other,ItAt_ShadowHorn,Npc_HasItems(other,ItAt_ShadowHorn));
	};
	if(Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_03");	//Aha! Máš roh dračího chňapavce. To je hodně dobré.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_horn_01_04");	//Pravděpodobně jsi utíkal dokud chňapavce nesklátila únava, nebo nezemřel stářím.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_DrgSnapperHorn) * VALUE_ALFREDDRGHORN);
		Npc_RemoveInvItems(other,ItAt_DrgSnapperHorn,Npc_HasItems(other,ItAt_DrgSnapperHorn));
	};

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_teeth()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_Teeth) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_01");	//Bezva, zuby ty se hodí.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_02");	//Vždycky se pro ně najde kupec.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Teeth) * VALUE_ALFREDTEETH);
		Npc_RemoveInvItems(other,ItAt_Teeth,Npc_HasItems(other,ItAt_Teeth));
	};
	if(Npc_HasItems(other,ItAt_TrollTooth) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_03");	//Co to je, trolí tesák? No páni!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_04");	//Ty jsou velmi cenné.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollTooth) * VALUE_ALFREDTROLLTOOTH);
		Npc_RemoveInvItems(other,ItAt_TrollTooth,Npc_HasItems(other,ItAt_TrollTooth));

	};
	if((Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_DesertSharkTeeth) > 0))
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_10");	//Zuby močálového žraloka! Ty jsou zatraceně ostré.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_11");	//Někdy za ně alchymisté dost zaplatí.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SharkTeeth) * VALUE_ALFREDSHARKTEETH) + (Npc_HasItems(other,ItAt_DesertSharkTeeth) * VALUE_ALFREDDESERTSHARKTEETH);
		Npc_RemoveInvItems(other,ItAt_SharkTeeth,Npc_HasItems(other,ItAt_SharkTeeth));
		Npc_RemoveInvItems(other,ItAt_DesertSharkTeeth,Npc_HasItems(other,ItAt_DesertSharkTeeth));
	};
	AI_Output(other,self,"DIA_HUN_742_TrophySell_Teeth_01_05");	//To je vše, co mám.
	AI_Output(self,other,"DIA_HUN_742_TrophySell_Teeth_01_06");	//Dobře. Pokud něco budeš mít, víš kde mě najít.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_claw()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_Claw) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_01");	//Několik párů drápů. To je dobré. Velmi užitečná trofej.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_02");	//Vezmu od tebe všechny.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Claw) * VALUE_ALFREDCLAW);
		Npc_RemoveInvItems(other,ItAt_Claw,Npc_HasItems(other,ItAt_Claw));
	};
	if(Npc_HasItems(other,ItAt_LurkerClaw) > 0)
	{
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_03");	//Aha! Máš drápy chňapavce. To je velmi dobrá trofej.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_04");	//Moc lidí mezi obyčejnými drápy a drápy číhavce rozdíl nevidí, ale ten rozdíl tam je!
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_06");	//Tyto drápy jsou ostřejší a tvrdší než jiné drápy.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_07");	//A to znamená, že mají všestranější využití.
		AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_08");	//Nechej mi je tady. Zaplatím ti za ně více než obvykle.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_LurkerClaw) * VALUE_ALFREDLURKERCLAW);
		Npc_RemoveInvItems(other,ItAt_LurkerClaw,Npc_HasItems(other,ItAt_LurkerClaw));
	};
	AI_Output(other,self,"DIA_HUN_742_TrophySell_Claw_01_09");	//To je vše, co mám.
	AI_Output(self,other,"DIA_HUN_742_TrophySell_Claw_01_10");	//Dobře! Přines mi další drápy, až budeš mít.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};