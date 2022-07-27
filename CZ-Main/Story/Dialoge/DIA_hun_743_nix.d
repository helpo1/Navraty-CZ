/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void dia_hun_743_nix_whosdogs_info - úpravy výpisů a dialogů
DIA_HUN_743_Nix_ShadowFurDone_01_02 - opraveno other/self

*/




instance DIA_HUN_743_NIX_EXIT(C_Info)
{
	npc = hun_743_nix;
	nr = 999;
	condition = dia_hun_743_nix_exit_condition;
	information = dia_hun_743_nix_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_743_nix_exit_condition()
{
	return TRUE;
};

func void dia_hun_743_nix_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_743_NIX_WHOSDOGS(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_whosdogs_condition;
	information = dia_hun_743_nix_whosdogs_info;
	permanent = FALSE;
	description = "To je tvůj pes?";
};


func int dia_hun_743_nix_whosdogs_condition()
{
	if((HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_whosdogs_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_WhosDogs_01_00");	//To je tvůj pes?
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_01");	//Jestli máš na mysli Tlamu, ano, je moje... (úsměv) Ale není to tak úplně pes.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_02");	//Možná tomu nebudeš věřit, ale Tlama je čistokrevná vlčice!
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_06");	//Asi tak před pěti lety jsem během lovu narazil na vlčí mládě.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_09");	//Asi se ztratilo, protože kolem žádní vlci nebyli.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_10");	//Mělo zlomenou nohu a bylo by snadnou kořistí pro ostatní zvířata.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_11");	//Tak jsem ho vzal a donesl do tábora.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_12");	//Byla to tvrdá práce. Nemohl jsem ho nechat jen tak - bylo bez síly, hubené.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_13");	//Ale vše se na dobré obrátilo, noha se zahojila a mé mládě zase získalo sílu!
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_13_CZ_01");	//Původně jsem ho chtěl pojmenovat Tesák, ale pak jsem si všiml, že je to holka!
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_13_CZ_02");	//Takže nakonec je z ní Tlama.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_14");	//Od té doby strávila většinu času v táboře. Už jsme si na ni s kluky zvykli.
	AI_Output(self,other,"DIA_HUN_743_Nix_WhosDogs_01_15");	//Žije tu s námi a postupem času se z ní stává skutečný lovec jako my!
};


instance DIA_HUN_743_NIX_NEXDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_nexdog_condition;
	information = dia_hun_743_nix_nexdog_info;
	permanent = FALSE;
	description = "Ale jak vlk může být lovec?";
};


func int dia_hun_743_nix_nexdog_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_whosdogs) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_nexdog_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_NexDog_01_00");	//Je to vlk, jak může být lovec?
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_03");	//Samozřejmě, že je. Já nebo ostatní kluci ji občas vezmeme do lesa na lov.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_05");	//Jednou mi dokonce zachránila život.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_06");	//Takže tahle vlčice pro mě znamená mnohem více než jen běžné zvíře.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexDog_01_07");	//Tlama je moje kamarádka!
	AI_Output(other,self,"DIA_HUN_743_Nix_NexDog_01_08");	//Jasně.
};


instance DIA_HUN_743_NIX_NEXILLDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_nexilldog_condition;
	information = dia_hun_743_nix_nexilldog_info;
	permanent = FALSE;
	description = "Tvoje vlčice vypadá slabá.";
};


func int dia_hun_743_nix_nexilldog_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_nexdog) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_nexilldog_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_NexIllDog_01_00");	//Tvoje vlčice vypadá slabá.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_01");	//Vypadá tak na první pohled...
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_02");	//Kdepak, Tlama je silnější než ostatní zvířata.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_06");	//Nicméně během posledního lovu ji vážně zranil jeden warg.
	AI_Output(self,other,"DIA_HUN_743_Nix_NexIllDog_01_07");	//Udělal jsem všechno, co jsem mohl. Ale zdá se, že to není dost, aby se konečně uzdravila.
};


instance DIA_HUN_743_NIX_RECOVERDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdog_condition;
	information = dia_hun_743_nix_recoverdog_info;
	permanent = FALSE;
	description = "Mohu ti nějak pomoci?";
};


func int dia_hun_743_nix_recoverdog_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_nexilldog) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdog_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDog_01_00");	//Mohu ti nějak pomoci?
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_01");	//Jedině mě napadá obrátit se na Sagittu, je to lesní léčitelka.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_02");	//Žije hluboko v lese za farmou Sekoba.
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDog_01_03");	//Vím, kde bydlí.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_04");	//To je dobře...
	};
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_05");	//I když nejsem si jistý, jestli bude moci Tlama pomoci.
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDog_01_07");	//Ale v každém případě to stojí za to zkusit.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_08");	//Dobrá. Jen si prosím pospěš.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDog_01_09");	//Tlama slábne každým dnem víc a víc. A já ani nechci pomyslet na to, co by se mohlo stát.
	CLAWTIMER = Wld_GetDay();
	MIS_RECOVERDOG = LOG_Running;
	Log_CreateTopic(TOPIC_RECOVERDOG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RECOVERDOG,LOG_Running);
	B_LogEntry(TOPIC_RECOVERDOG,"Nixe velmi rozrušil stav Tlamy, vlčice, kterou jako mládě zachránil. Při posledním lovu ji zranil warg a vypadá to s ní každý den huř a huř. Řekl jsem Nixovi, že se pokusím něco vymyslet se Sagittou. Musím si ale pospíšit, Tlama je každým dnem slabší a slabší.");
};


instance DIA_HUN_743_NIX_RECOVERDOGBRING(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogbring_condition;
	information = dia_hun_743_nix_recoverdogbring_info;
	permanent = FALSE;
	description = "Přinesl jsem medicínu pro tvou vlčici.";
};


func int dia_hun_743_nix_recoverdogbring_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (SAGITTAHELPSCLAW == TRUE) && (Npc_HasItems(other,itpo_sagittaclawpotion) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogbring_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogBring_01_00");	//Přinesl jsem medicínu pro tvou vlčici.
	if(CLAWTIMER < (daynow - 3))
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_01");	//Ach člověče... (smutně) Děkuji.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_02");	//Ale bohužel, přišel jsi pozdě. Tlama už není mezi námi.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_03");	//Zemřela a nebyl jsem vůbec schopný ji pomoci.
		AI_StopProcessInfos(self);
		MIS_RECOVERDOG = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RECOVERDOG);
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_04");	//Opravdu?... (nadejně) Myslíš, že jí opravdu pomůže?
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_06");	//A co bych měl udělat?
		AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogBring_01_07");	//Musíš jí ošetřit ránu tímto výtažkem bylin, který mi dala.
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_08");	//Dobře, pojďme jí tu medicínu dát...
		AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogBring_01_09");	//Tady to máš.
		B_GiveInvItems(other,self,itpo_sagittaclawpotion,1);
		Npc_RemoveInvItems(self,itpo_sagittaclawpotion,1);
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_10");	//Dobře. Teď ošetřím ránu...
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_HUNTERCAMP_CLAW");
		AI_AlignToWP(self);
		AI_PlayAni(self,"T_PLUNDER");
		AI_GotoNpc(self,hero);
		AI_TurnToNPC(self,other);
		AI_LookAtNpc(self,other);
		AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogBring_01_11");	//Hotovo... Doufám, že to pomůže.
		B_LogEntry(TOPIC_RECOVERDOG,"Přinesl jsem lék pro Tlamu. Nix jí okamžitě ošetřil ránu. Nyní zbývá čekat a doufat, že se Tlama zotaví.");
		CLAWTIMERRECOVER = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Recover");
		CLAWBEGINRECOVER = TRUE;
	};
};


instance DIA_HUN_743_NIX_RECOVERDOGABOUT(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogabout_condition;
	information = dia_hun_743_nix_recoverdogabout_info;
	permanent = TRUE;
	description = "Jak se Tlama má?";
};


func int dia_hun_743_nix_recoverdogabout_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (CLAWBEGINRECOVER == TRUE) && (CLAWHEALTHOK == FALSE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogabout_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogAbout_01_01");	//Jak se Tlama má?
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogAbout_01_02");	//Ach... (smutný povzdech) Stále se má špatně.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogAbout_01_03");	//Možná, že to nebude trvat už moc dlouho a konečně se zotaví.
};


instance DIA_HUN_743_NIX_RECOVERDOGDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogdone_condition;
	information = dia_hun_743_nix_recoverdogdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_recoverdogdone_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (CLAWHEALTHOK == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_00");	//Hej, kamaráde!
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogDone_01_01");	//Co?
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_02");	//Díky tvojí pomoci a léku od Sagitty se Tlama už uzdravuje!
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_03");	//Takže ti moc děkuji za tvou pomoc s léčením.
	AI_Output(self,other,"DIA_HUN_743_Nix_RecoverDogDone_01_04");	//Tady, vezmi si to jako drobnost, jsem ti vděčný.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	MIS_RECOVERDOG = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RECOVERDOG,LOG_SUCCESS);
	B_LogEntry(TOPIC_RECOVERDOG,"Nix mi řekl, že ta medicína od Sagitty Tlamě opravdu pomohla.");
};


instance DIA_HUN_743_NIX_CLAWGOHUNT(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_clawgohunt_condition;
	information = dia_hun_743_nix_clawgohunt_info;
	permanent = FALSE;
	description = "Kdy teď půjdete lovit?";
};


func int dia_hun_743_nix_clawgohunt_condition()
{
	if((MIS_RECOVERDOG == LOG_SUCCESS) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_clawgohunt_info()
{
	var C_Npc dog;
	dog = Hlp_GetNpc(nixdog);
	AI_Output(other,self,"DIA_HUN_743_Nix_ClawGoHunt_01_00");	//Kdy teď půjdete lovit?
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_01");	//Já nevím, kámo. Mám dost práce v táboře.
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_02");	//Mimochodem, pokud se chystáš na lov, můžeš s sebou vzít Tlamu.
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_05");	//Myslím, že bude schopná lovu.
	AI_Output(self,other,"DIA_HUN_743_Nix_ClawGoHunt_01_06");	//Nicméně teď je lepší ji s sebou nebrat, ať se ještě vzpamatuje. Pár dní.
	AI_Output(other,self,"DIA_HUN_743_Nix_ClawGoHunt_01_07");	//No, budu o tom přemýšlet.
	CLAWTIMERCLAWGOHUNT = Wld_GetDay();
	dog.start_aistate = zs_mm_rtn_huntgone;
};


instance DIA_HUN_743_NIX_CLAWREVENGE(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_clawrevenge_condition;
	information = dia_hun_743_nix_clawrevenge_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_743_nix_clawrevenge_condition()
{
	if(KILLCLAWREVENGE == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_clawrevenge_info()
{
	if(NIXFIRSTWARN == FALSE)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_01");	//Proč jsi zabil Tlamu, ty hajzle! Co ti udělala?
		if(MIS_RECOVERDOG == LOG_Running)
		{
			MIS_RECOVERDOG = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_RECOVERDOG);
		}
		else
		{
		};
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_04");	//Idiote! (vyskočí a křičí) Byla to moje přítelkyně, smrt si nezasloužila!
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_05");	//Za to tě zabiju, ty hajzle!
		AI_StopProcessInfos(self);
		NIXFIRSTWARN = TRUE;
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_06");	//Vzpomínám si, co jsi udělal, ty hajzle!
		AI_Output(self,other,"DIA_HUN_743_Nix_ClawRevenge_01_08");	//To ti nikdy neodpustím. Zemři ty hajzle!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};


instance DIA_HUN_743_NIX_WELCOME(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_welcome_condition;
	information = dia_hun_743_nix_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_welcome_condition()
{
	if((HEROISHUNTER == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_welcome_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_01");	//Hele, koho tu máme, další lovec.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_03");	//V našem kempu je vždycky místo pro lidi jako ty.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_04");	//Jestli chceš zůstat s námi, jen si promluv s Falkem.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_05");	//On tady velí.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_06");	//Hej ty! Co tu chceš, co?
		AI_Output(other,self,"DIA_HUN_743_Nix_Welcome_01_07");	//No, já... jen se tady trochu procházím.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_09");	//Chlape, tady žijí lovci, tady nemáš co pohledávat.
		AI_Output(self,other,"DIA_HUN_743_Nix_Welcome_01_11");	//A jestli budeš dělat v táboře problémy, tak tě naučím slušnému chování. Kapišto?
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_743_NIX_WELCOMEHUNT(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_welcomehunt_condition;
	information = dia_hun_743_nix_welcomehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_welcomehunt_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_welcomehunt_info()
{
	AI_Output(self,other,"DIA_HUN_743_Nix_WelcomeHunt_01_00");	//Takže teď jsi jeden z nás, kámo?
	AI_Output(other,self,"DIA_HUN_743_Nix_WelcomeHunt_01_01");	//Jo! Falk mě přijal do tábora.
	AI_Output(self,other,"DIA_HUN_743_Nix_WelcomeHunt_01_02");	//No, pak ti gratuluji! A věřím že nebudeš litovat tvého rozhodnutí přidat se k nám.
};


instance DIA_HUN_743_NIX_NEWS(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_news_condition;
	information = dia_hun_743_nix_news_info;
	permanent = TRUE;
	description = "Vše je v pořádku?";
};


func int dia_hun_743_nix_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_news_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_News_01_00");	//Vše je v pořádku?
	if((Kapitel >= 3) && (MIS_INSBLACKSANPPER == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_01");	//No, je tu něco...
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_02");	//Říká se, že u těch prastarých pyramid byl viděn velmi zvláštní chňapavec.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_03");	//Narozdíl od svých příbuzných je prý černý jako noc. A kromě toho se chová podivně.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_04");	//A podle pověstí tam loví sám, ačkoliv obvykle tato zvířata loví ve smečce.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_06");	//Někteří říkají že ulovit takové zvíře je pro lovce velký úspěch!
		AI_Output(other,self,"DIA_HUN_743_Nix_News_01_07");	//Proč?
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_08");	//Protože vystopovat ho je nadlidský úkol a zabít ho to je ještě těžší.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_09");	//I když já bych řekl, že je to pouze pověra.
		MIS_INSBLACKSANPPER = LOG_Running;
		Log_CreateTopic(TOPIC_INSBLACKSANPPER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSBLACKSANPPER,LOG_Running);
		B_LogEntry(TOPIC_INSBLACKSANPPER,"Podle povídaček by u velkých pyramid měl být podivný černý chňapavec! Lidé prý říkali, že ho dokáže zabít jen schopný lovec! Nix tomu ale nevěří a myslí si, že nějaký hlupák se jen lekl ve tmě chňapavce.");
		Wld_InsertNpc(blacksnapper,"NW_TROLLAREA_RUINS_22");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_11");	//Mně i kamarády dost zneklidňují ti chlápci v černých hábitech.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_12");	//Myslím, že tu nejsou jen tak.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_13");	//Vypadá to, že něco nebo někoho hledají... (zadumaně)
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_16");	//Trochu mě znervózňují všichni ti skřeti, kteří se mužou vyrojit z údolí.
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_17");	//Nelíbí se mi to.
	}
	else if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_18");	//Všichni jsme tady na nervy!
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_19");	//Všude kolem jsou skřeti a nemůžeme s tím nic dělat.
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_20");	//No ano. Proč by něco nemělo být v pořádku?
		AI_Output(self,other,"DIA_HUN_743_Nix_News_01_21");	//Řeknu ti jedno, klidnější místo na ostrově než tady teď nikde jinde nenajdeš.
	};
};


instance DIA_HUN_743_NIX_INSBLACKSANPPER(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_insblacksanpper_condition;
	information = dia_hun_743_nix_insblacksanpper_info;
	permanent = FALSE;
	description = "Zabil jsem černého chňapavce.";
};


func int dia_hun_743_nix_insblacksanpper_condition()
{
	if((MIS_INSBLACKSANPPER == LOG_Running) && Npc_IsDead(blacksnapper) && (Npc_HasItems(other,itat_clawblacksnapper) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_insblacksanpper_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_743_Nix_InsBlackSanpper_01_00");	//Zabil jsem černého chňapavce.
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_01");	//Opravdu?! (pochybně) A kde je důkaz?!
	AI_Output(other,self,"DIA_HUN_743_Nix_InsBlackSanpper_01_02");	//Tu máš jeho zuby.
	B_GiveInvItems(other,self,itat_clawblacksnapper,1);
	Npc_RemoveInvItems(self,itat_clawblacksnapper,1);
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_03");	//To je teda vrchol... (udiveně) To je jednoduše nemožné!
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_04");	//Člověče, ty máš prostě štěstí!
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_05");	//Blahopřeji.
	AI_Output(self,other,"DIA_HUN_743_Nix_InsBlackSanpper_01_06");	//Jsi prostě skvělý lovec!
	MIS_INSBLACKSANPPER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSBLACKSANPPER,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSBLACKSANPPER,"Nix byl velmi překvapen, když jsem mu řekl o tom, že jsem ulovil černého chňapavce! Říká, že teď není pochyb, že jsem vynikající lovec!");
};


instance DIA_HUN_743_NIX_RESPECT(C_Info)
{
	npc = hun_743_nix;
	nr = 4;
	condition = dia_hun_743_nix_respect_condition;
	information = dia_hun_743_nix_respect_info;
	permanent = FALSE;
	description = "Potřebuji tvoji pomoc.";
};


func int dia_hun_743_nix_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (NIX_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_respect_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_Respect_01_00");	//Potřebuji tvoji pomoc.
	AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_01");	//A v čem?
	AI_Output(other,self,"DIA_HUN_743_Nix_Respect_01_02");	//Chci Falka vyzvat v soutěži o nejlepšího lovce, ale potřebuji hlasy lovců.
	AI_Output(other,self,"DIA_HUN_743_Nix_Respect_01_03");	//Můžu získat tvůj hlas?
	if((MIS_RECOVERDOG == LOG_SUCCESS) || (MIS_INSBLACKSANPPER == LOG_SUCCESS))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_04");	//Samozřejmě, kamaráde!
		if(MIS_RECOVERDOG == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_05");	//No, díky tobě se uzdravila Tlama a to ti nikdy nezapomenu!
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_06");	//Takže můžeš jít za Falkem a říci, že máš moji podporu.
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_07");	//Když jsi dokázal sejmout černého chňapavce, tak si ho zasloužíš!
			AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_08");	//Takže můžeš jít za Falkem a říci, že máš moji podporu.
		};
		B_LogEntry(TOPIC_HUNTERSWORK,"Nix mi dal hlas v soutěži proti Falkovi.");
		NIX_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_10");	//Neukázal jsi, že by sis to zasloužil.
		AI_Output(self,other,"DIA_HUN_743_Nix_Respect_01_11");	//Takže nejdřív něco dokaž, pak si můžeme o tom promluvit.
	};
};


instance DIA_HUN_743_NIX_RESPECTDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 4;
	condition = dia_hun_743_nix_respectdone_condition;
	information = dia_hun_743_nix_respectdone_info;
	permanent = TRUE;
	description = "Dáš mi teď svůj hlas?";
};


func int dia_hun_743_nix_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_respect) && (CANHUNTERCHALLANGE == TRUE) && (NIX_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_RespectDone_01_00");	//Dáš mi teď svůj hlas?
	if((MIS_RECOVERDOG == LOG_SUCCESS) || (MIS_INSBLACKSANPPER == LOG_SUCCESS))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_01");	//No, proč ne.
		if(MIS_RECOVERDOG == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_02");	//No, díky tobě se uzdravila Tlama a to ti nikdy nezapomenu!
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_03");	//Takže můžeš jít za Falkem a říci, že máš moji podporu.
		}
		else
		{
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_04");	//Když jsi dokázal sejmout černého chňapavce, tak si ho zasloužíš!
			AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_05");	//Takže můžeš jít za Falkem a říci, že máš moji podporu.
		};
		B_LogEntry(TOPIC_HUNTERSWORK,"Nix mi dal hlas v soutěži proti Falkovi.");
		NIX_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_06");	//Chlape, řekl jsem, že musíš udělat něco za co si ho zasloužíš!
		AI_Output(self,other,"DIA_HUN_743_Nix_RespectDone_01_07");	//Co na tom nechápeš?
	};
};


instance DIA_HUN_743_NIX_HELLO(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_hello_condition;
	information = dia_hun_743_nix_hello_info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int dia_hun_743_nix_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_hello_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_Hello_01_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_HUN_743_Nix_Hello_01_01");	//Můžu ti ukázat, jak být obratnější.
	AI_Output(self,other,"DIA_HUN_743_Nix_Hello_01_02");	//Samozřejmě pokud budeš chtít.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Nix mi může ukázat jak být obratnější.");
};


instance DIA_HUN_743_NIX_DEX(C_Info)
{
	npc = hun_743_nix;
	nr = 3;
	condition = dia_hun_743_nix_dex_condition;
	information = dia_hun_743_nix_dex_info;
	permanent = TRUE;
	description = "Ukaž mi, jak být obratnější.";
};


func int dia_hun_743_nix_dex_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_hello))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_dex_info()
{
	AI_Output(other,self,"DIA_HUN_743_Nix_Dex_01_00");	//Ukaž mi, jak být obratnější.
	AI_Output(self,other,"DIA_HUN_743_Nix_Dex_01_01");	//Úspěch lovu dost závisí na obratnosti!
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};

func void dia_hun_743_nix_dex_back()
{
	Info_ClearChoices(dia_hun_743_nix_dex);
};

func void dia_hun_743_nix_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};

func void dia_hun_743_nix_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};


instance DIA_HUN_743_NIX_SHADOWFUR(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_shadowfur_condition;
	information = dia_hun_743_nix_shadowfur_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_shadowfur_condition()
{
	if((Kapitel >= 2) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_shadowfur_info()
{
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_00");	//Hej, počkej. Mám pro tebe takovou nabídku.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_02");	//Zoufale potřebuji kůži stínové šelmy. Ale nemůžu jít na lov, musím hlídat tábor.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_03");	//A máme tu tebe, to je výhoda. Sežeň mi tu kůži a slibuji, že nebudeš litovat.
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFur_01_04");	//Kde najdu stínovou šelmu?
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_05");	//Obvykle žije v jeskyních nebo hluboko v lesích.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_06");	//Tato zvířata nemají moc rády denní světlo, a tak se snaží co nejvíce skrýt.
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFur_01_07");	//Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFur_01_08");	//Díky, kámo. Věř mi, nezůstanu ti dlužen.
	MIS_SHADOWFURNIX = LOG_Running;
	Log_CreateTopic(TOPIC_SHADOWFURNIX,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHADOWFURNIX,LOG_Running);
	B_LogEntry(TOPIC_SHADOWFURNIX,"Nix potřebuje kuži stínové šelmy. Říká, že když ji seženu, nebudu litovat. Tahle zvířata nemají ráda denní záři, takže se skrývají v šeru jeskyní a stromů.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_743_NIX_SHADOWFURDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_shadowfurdone_condition;
	information = dia_hun_743_nix_shadowfurdone_info;
	permanent = FALSE;
	description = "Tady je ta kůže stínové šelmy, kterou jsi chtěl.";
};


func int dia_hun_743_nix_shadowfurdone_condition()
{
	if((MIS_SHADOWFURNIX == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowFur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_shadowfurdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFurDone_01_00");	//Tady je ta kůže stínové šelmy, kterou jsi chtěl.
	B_GiveInvItems(other,self,ItAt_ShadowFur,1);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,1);
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFurDone_01_01");	//Výborně. (obdiv) Myslím, že to s touto šelmou byla celkem fuška, že?
	AI_Output(other,self,"DIA_HUN_743_Nix_ShadowFurDone_01_02");	//Docela dost.
	AI_Output(self,other,"DIA_HUN_743_Nix_ShadowFurDone_01_03");	//Dobře! Vezmi si tohle zlato, zasloužíš si ho.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_SHADOWFURNIX = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SHADOWFURNIX,LOG_SUCCESS);
	B_LogEntry(TOPIC_SHADOWFURNIX,"Donesl jsem Nixovi kůži stínové šelmy.");
};


instance DIA_HUN_743_NIXNW_PICKPOCKET(C_Info)
{
	npc = hun_743_nix;
	nr = 900;
	condition = dia_hun_743_nixnw_pickpocket_condition;
	information = dia_hun_743_nixnw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_743_nixnw_pickpocket_condition()
{
	return C_Beklauen(65,90);
};

func void dia_hun_743_nixnw_pickpocket_info()
{
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
	Info_AddChoice(dia_hun_743_nixnw_pickpocket,Dialog_Back,dia_hun_743_nixnw_pickpocket_back);
	Info_AddChoice(dia_hun_743_nixnw_pickpocket,DIALOG_PICKPOCKET,dia_hun_743_nixnw_pickpocket_doit);
};

func void dia_hun_743_nixnw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
};

func void dia_hun_743_nixnw_pickpocket_back()
{
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
};

