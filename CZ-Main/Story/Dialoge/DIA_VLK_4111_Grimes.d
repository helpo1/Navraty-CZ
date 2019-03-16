
instance DIA_Grimes_EXIT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 999;
	condition = DIA_Grimes_EXIT_Condition;
	information = DIA_Grimes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int Grimes_First;

func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimes_Hallo(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Hallo_Condition;
	information = DIA_Grimes_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Grimes_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//Ty? Kdo by to byl řekl, že se znovu setkáme.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Tak to vypadá, že oba víme, jak zustat na živu ale jak vidíš já zustal v téhle díře.
	if(Grimes_First == FALSE)
	{
		Wld_InsertNpc(DragonSnapper,"OW_PATH_148_A");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_146");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_147");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_148");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_264");
		Grimes_First = TRUE;
	};
};


instance DIA_Grimes_Erz(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Erz_Condition;
	information = DIA_Grimes_Erz_Info;
	permanent = FALSE;
	description = "Kolik rudy už jsi vytěžil?";
};


func int DIA_Grimes_Erz_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Erz_Info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Kolik rudy už jsi vytěžil?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Několik beden. Ale nic z toho tady nezustalo.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladin Marcos se rozhodl vzít rudu do hradu, protože nás pořád ohrožovali skřeti.
};


instance DIA_Grimes_Weg(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 3;
	condition = DIA_Grimes_Weg_Condition;
	information = DIA_Grimes_Weg_Info;
	permanent = FALSE;
	description = "Víš, kudy se Marcos vydal?";
};


func int DIA_Grimes_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Erz) && (Npc_KnowsInfo(other,DIA_Marcos_Garond) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Víš, kudy se Marcos vydal?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Nešel přímou cestou - místo toho chtěl přejít řeku tam, kde byla zamrzlá.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Chtěl to obejít a dostat se k hradu ze západu.
};

instance DIA_Grimes_PERM(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_PERM_Condition;
	information = DIA_Grimes_PERM_Info;
	permanent = TRUE;
	description = "Jak to jinak jde?";
};


func int DIA_Grimes_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Jak to jinak jde?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Tahle skála je zatracené nepoddajná - úplně jako by se snažila nám zabránit v získávání rudy.
};


instance DIA_Grimes_PICKPOCKET(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 900;
	condition = DIA_Grimes_PICKPOCKET_Condition;
	information = DIA_Grimes_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grimes_PICKPOCKET_Condition()
{
	return C_Beklauen(43,21);
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,Dialog_Back,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};


instance DIA_GRIMES_KNOWABOUTERZHUNT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_knowabouterzhunt_condition;
	information = dia_grimes_knowabouterzhunt_info;
	permanent = FALSE;
	description = "Víš něco o těžbě rudy?";
};


func int dia_grimes_knowabouterzhunt_condition()
{
	return TRUE;
};

func void dia_grimes_knowabouterzhunt_info()
{
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_00");	//Víš něco o těžbě rudy?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_01");	//Samozřejmě!... Půlku svého života se tím zabývám!
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_03");	//Chci se to naučit. Můžeš mi s tím pomoci?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_04");	//Samozřejmě, naučím tě vše co vím.
	if(ORE_TOPIC_EXIST == TRUE)
	{
		B_LogEntry(TOPIC_MAGICORE,"Grimes mě může naučit, jak těžit rudu.");
	}
	else
	{
		Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
		B_LogEntry(TOPIC_MAGICORE,"Grimes mě může naučit, jak těžit rudu.");
		ORE_TOPIC_EXIST = TRUE;
	};
};

instance DIA_GRIMES_LEARNABOUTERZHUNT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_learnabouterzhunt_condition;
	information = dia_grimes_learnabouterzhunt_info;
	permanent = TRUE;
	description = "Nauč mě těžit rudu.";
};

func int dia_grimes_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_knowabouterzhunt) && (HERO_HACKCHANCEORE < 100))
	{
		return TRUE;
	};
};

func void dia_grimes_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_0A");	//Řekni mi více o těžbě rudy.
	}
	else
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_00");	//Nauč mě těžit rudu.
	};

	Info_ClearChoices(dia_grimes_learnabouterzhunt);
	Info_AddChoice(dia_grimes_learnabouterzhunt,Dialog_Back,dia_grimes_learnabouterzhunt_Back);
	Info_AddChoice(dia_grimes_learnabouterzhunt,b_buildlearnstringforerzhunt("Těžba rudy",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_grimes_learnabouterzhunt_ERZWORK);
};

func void dia_grimes_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_grimes_learnabouterzhunt);
};

func void dia_grimes_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 100)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_01");	//Dobrá, poslouchej pozorně...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_02");	//Pro začátek je důležitý dobrý krumpáč. S ním je z poloviny máš vyhráno!
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_03");	//Pak jen vykopávej nugety ze žíly, ale kopej jen kolem nich, jinak je poškodíš.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_04");	//Začínej z kraje žíly, slabými údermi a pak pár silnejch. Střídej více slabých úderu a jeden silnej.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_05");	//Silným úderem poškodíš strukturu, kterou nuget vězí v žíle a slabým nuget konečne vypadne, aniž by se poškodil.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_06");	//A pak to opakuj jak dlouho chceš...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_07");	//Tohle jsou úplné základy.
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_09");	//Dobře! Poslouchej pozorně...(vypráví)
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_10");	//Já tě už naučil vše, co umím. Více zkušeností získáš, až se začneš ohánět krumpáčem.
	};

	Info_ClearChoices(dia_grimes_learnabouterzhunt);
};

var int grimes_einmal;
var int grimes_gratulation;

instance DIA_GRIMES_ELIGORPOTION(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_eligorpotion_condition;
	information = dia_grimes_eligorpotion_info;
	permanent = FALSE;
	description = "Co víš o loupeži u Lutera?";
};

func int dia_grimes_eligorpotion_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Hallo) && (MIS_JORAHELP == LOG_Running) && (ZURISGIVEMETASKINFO == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_eligorpotion_info()
{
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_00");	//Co víš o loupeži u Lutera?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_01");	//U koho? O čem to mluvíš?... (prekvapeně)
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_03");	//Stalo se to dávno, mnoho let zpátky.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_04");	//Byla to vcelku událost - měl by sis to pamatovat...
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_05");	//Hmm... (zamyšleně) No, já... Hmm... (vzpomíná)
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_07");	//... No, připadá mi, že si na něco vzpomínám, ale záleží jen na tobě, naco!... (mrká okem)
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_08");	//Slyšel jsem, že jsi do toho byl zapleten.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_09");	//(Překvapeně) Já?!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_13");	//Dokonce ani neznám toho obchodníka!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_14");	//Takže ty o tom nic nevíš?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_15");	//(Sarkasticky) Vubec nic!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_16");	//A i kdybych něco věděl, proč bych ti to říkal?
	Info_ClearChoices(dia_grimes_eligorpotion);
	Info_AddChoice(dia_grimes_eligorpotion,"Protože tě zabiju, jestli mi to neřekneš!",dia_grimes_eligorpotion_kill);

	if(RhetorikSkillValue[1] >= 30)
	{
		Info_AddChoice(dia_grimes_eligorpotion,"Pro staré dobré časy!",dia_grimes_eligorpotion_memory);
	};

	Info_AddChoice(dia_grimes_eligorpotion,"Jsem ochoten za tuto informaci zaplatit.",dia_grimes_eligorpotion_money);
};

func void dia_grimes_eligorpotion_kill()
{
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Kill_01_00");	//Protože tě zabiju, jestli mi to neřekneš!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Kill_01_01");	//Chlapče, výhružky ti nepomužou!...
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Kill_01_02");	//Jsem už starý a stejně zemřu.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Kill_01_03");	//A když se pozorně rozhlédneš- je celkem jasný, že se odsud stěží vrátim živ.
	B_LogEntry(TOPIC_JORAHELP,"Zeptal jsem se Grimese na tu loupež u Lutera. Říká, že o tom nic neví. Neřekl mi nic víc, ani, když jsem mu hrozil smrtí. Vypadal až smutně. Musím zkusit něco jiného.");
	AI_StopProcessInfos(self);
};

func void dia_grimes_eligorpotion_money()
{
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Money_01_00");	//Jsem ochoten za tuto informaci zaplatit.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_01");	//Ha! Ha! A na co by mi byly peníze?!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_02");	//Na nový krumpáč?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_04");	//Ne, chlape - peníze zde nemají cenu (smích).
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_05");	//A navíc, jsem už stár a vím, že muj život skončí pravděpodobně v tomhle prokletém údolí.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_06");	//Odsud se už nedostanu a mužu jen čekat, než mě něco sežere!
	B_LogEntry(TOPIC_JORAHELP,"Zeptal jsem se Grimese na tu loupež u Lutera. Říká, že o tom nic neví. Nechce mi nic říci ani když jsem mu nabízel peníze - v údolí pro něj nemají cenu! Vypadal sklamaně. Teď musím vymyslet co dál.");
	AI_StopProcessInfos(self);
};

func void dia_grimes_eligorpotion_memory()
{
	B_GivePlayerXP(500);
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_00");	//Pro staré dobré časy!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_01");	//Byli jsme na jedné lodi, Grimesi, nepamatuješ Starý důl?!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_02");   //A život ve Starém táboře?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_04");	//Eh!... (smutně) To bylo něco - až doteď!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_08");	//Jen pověz - co o té loupeži víš?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_14");	//Hm... Když jsem jednou sedel v Kardifově krčmě, pár let zpátky...
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_18");	//Bylo to něco o velkém obchodníkovi z horní čtvrti, vraj má něco na čem se dá dobře nabalit.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_27");	//A příští ráno jsem se dozvěděl, že někdo okradl bohatého obchodníka!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_2F");	//Mm... Takže neznáš jména těch lupičů?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_43");	//Počkej. Rok na to jsem potkal jednoho z nich ve vězení. Byl to kopáč jako já, jmenoval se Rufus.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_44");	//Říkal, že okradli bohatého obchoníka a z jeho domu sebrali všechno, co unesli.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_47");	//Také říkal, že věci, které tam vzali byly velmi cenné!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_51");	//Myslím, že to byl nějakej elixír.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_57");	//A pak zde byla ta příhoda...
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_59");	//Co se stalo?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_60");	//Jednou v opušteném dole jeden z tunelu začal kolabovat. Stráže se snažili rychle nás odsaď dostat. Ale Rufus se vrátil zpátky!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_67");	//Videli jsem ho jak utíka pomezi padajíci balvany.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_69");	//Skoro se dostal zpátky, když ho jeden z balvanu zasáhl přímo do hlavy. Byl na míste mrtev!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_76");	//A co se stalo s Rufusovým elixírem?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_77");	//Byl sebrán jedným strážcem a uložen v jeho truhle, mimo slídivých očí.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_81");	//Ale co já vím, už dlouho se v opušteném dole nepracuje.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_82");	//Stráže ho jistě odnesli předtím, než důl opustili.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_83");	//To mohli, ale nemyslím, že na to měli čas.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_84");	//(Překvapeně) Ty nevíš co se tam stalo?
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_85");	//Co myslíš?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_89");	//Jeden kopáč narazil na divnou jeskyni, ukrytou v skale.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_92");	//Několik kopáču a tři strážci se ji vydali proskoumat.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_93");	//V několika minutách k nám dolehlo jen děsivé sténání.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_99");	//Ta jeskyně byla zaplavena nemrtvými!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_106");	//Byl to krvavý masakr... Mnoho lidí zemřelo...
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_108");	//Popravdě, já jsem měl dost času na hledání cenností... Našel jsem malý klíček u jedného strážce.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_113");	//A nemohl bys mi ho dát?!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_123");	//A nač? I když, to je tvoje starost. Ale je lepší držet se od toho místa.
	B_GiveInvItems(self,other,itke_grimkey,1);
	B_LogEntry(TOPIC_JORAHELP,"Dostal jsem z Grimese podrobnosti o té loupeži! Grimes mi řekl historii o jistém Rufusovi a jednom lektvaru, který měl u sebe. Velmi si ho cenil, nakonec zaň položil i život. Z jeho příbehu to vyznělo, že to je Eligorův plamen.");
	Log_AddEntry(TOPIC_JORAHELP,"Grimes kdysi kutal v Zasypaném dole. Jednou byl zával a Rufus zemřel. Stráže sebrali elixír a uzamkli ho v truhle! Když jednou prorazili kopáči do jeskyne, kde narazili na jakésy stvury, Grimes využil situace a ukradl jednomu strážci klíč. Neví od čeho je, ale dal mi ho - co já vím, možná bude od truhly s elixírem. To by bylo vážně štěstí.");
	GrimesCanEscape = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_GRIMES_POSSECCELIGORPOTION(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_possecceligorpotion_condition;
	information = dia_grimes_possecceligorpotion_info;
	permanent = FALSE;
	description = "Byl jsem v Opušteném dole.";
};

func int dia_grimes_possecceligorpotion_condition()
{
	if((MIS_JORAHELP == LOG_Running) && (Npc_HasItems(other,itpo_eligorfire) >= 1))
	{
		return TRUE;
	};
};

func void dia_grimes_possecceligorpotion_info()
{
	AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_00");	//Byl jsem v Opušteném dole.
	AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_01");	//To snad ani není možné?!... (neduvěřivě)
	AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_02");	//A našel jsem tento lektvar, poznáváš ho?!
	AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_03");	//Nemožné! To je Rufusův lektvar!... (v šoku)
	AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_05");	//Tedy, chlape... Ty máš ale odvahu.

	if(Npc_IsDead(demonlord_am))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_07");	//A cos tam viděl?
		AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_08");	//Byl tam démon, ale zabil jsem ho.
		AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_09");	//V dole bylo i další svinstvo.
		AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_15");	//Chlape, ty si hrdina!
	}
	else
	{
		B_GivePlayerXP(50);
	};
};

instance DIA_GRIMES_LETSGETOUTSUGG(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_letsgetoutsugg_condition;
	information = dia_grimes_letsgetoutsugg_info;
	permanent = FALSE;
	description = "Nechtěl by ses dostat z Hornického údolí?";
};

func int dia_grimes_letsgetoutsugg_condition()
{
	if((GrimesCanEscape == TRUE) && Npc_KnowsInfo(other,dia_viper_getminedata) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_letsgetoutsugg_info()
{
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_00");	//Nepřemýšlel jsi o tom, vypadnout z tohodle dolu, i z celého Hornického údolí?
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_01");	//To víš, že přemýšlel. Ale jak bych si tím pomohl?
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_02");	//Paladinové mě nikam nepustí. A i kdyby se mě podařilo kolem nich proklouznout, všude okolo jsou skřeti.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_03");	//Nepřežil bych tam ani 20 minut. Tak co, není lepší zůstat tady.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_04");	//Jasně. A co kdyby ti někdo koho znáš, pomohl se odsud dostat?
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_05");	//Ty? A jak se chceš probít přes celou hordu skřetů, když pomineme paladiny?
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_06");	//Stejně jako už před tím několikrát.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_07");	//Hmm... dobře, a k čemu ti budu? Přece to neděláš bez důvodu?
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_08");	//Potřebuju lidi, co umějí dobře zacházet s krumpáčem. V Khorinisu, jak se ukázalo, se nachází také nějaká magická ruda.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_09");	//V současné době se snažím naučit tomuto řemeslu, ale zatím to neumím.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_10");	//Stručně řečeno, potřebuju abys pro mě pracoval.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_11");	//(Rozčarovaně) Zase do dolu? A v čem je tvůj důl lepší než tento?
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_12");	//Dej mě chvilku...
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_13");	//Okolo se nepotulují hordy skřetů, nemusíš pracovat ve dne v noci a budeš mít ubytování i stravu.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_14");	//Důlní červy tam také nejsou.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_15");	//Ach ano, vytěžená ruda bude k užitku a nebude se válet vedle dolu a čekat na skřety až si ji odnesou.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_16");	//Jestli je to všechno pravda, tak to bude rozhodně lepší než tady.

	if(HuntyIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_17");	//Dobře, souhlasím. Ale sám nepůjdu, musíš vzít i mého přítele.
		AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_18");	//To není problém. Čtyři ruce jsou lepší než dvě.
	};

	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_19");	//Výborně. Nyní se nejprve musíme dostat z dolu.	
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_20");	//Bohužel tito paladinové jsou pořád ve střehu, kolem nich jentak neproklouznem...
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_21");	//Chvíli počkej. Mám nápad! Slyšel jsem o kouzle, které snadno uspí člověka.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_22");	//Kdybys dokázal pár takových svitků získat...
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_23");	//Kromě toho se ještě musím připravit. Dej mě den a pak se vrať se svitkama.
	GRIMESDAYDT = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_GRIMES_LETSGETOUTOFHERE(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_letsgetoutofhere_condition;
	information = dia_grimes_letsgetoutofhere_info;
	permanent = FALSE;
	description = "Mám ty svitky, připravte se.";
};

func int dia_grimes_letsgetoutofhere_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_letsgetoutsugg) && (GRIMESDAYDT < Wld_GetDay()) && (HURRAYICANHIRE == TRUE) && (Npc_HasItems(other,ItSc_Sleep) >= 2))
	{
		return TRUE;
	};
};

func void dia_grimes_letsgetoutofhere_info()
{
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutOfHere_15_00");	//Mám ty svitky, připravte se.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutOfHere_15_01");	//Jak se dostanem z tábora, dovedu vás bezpečnou cestou k průchodu.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_02");	//Zapomeň na svitky! Nedávno jsem stál poblíž paladinů a slyšel jsem, že se každou chvíli půjdou modlit k Innosovi.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_03");	//A z toho místa není vidět na vchod do dolu!
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_04");	//Stůj, myslím že slyším zvonit zbroje.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_05");	//A teď je ticho...
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_06");	//Myslím, že odešli.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_07");	//Jdeme, teď nebo nikdy.
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	if(HuntyIsDead == FALSE)
	{
		STRF_1117_Straefling.aivar[AIV_PARTYMEMBER] = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");

	if(HuntyIsDead == FALSE)
	{
		B_StartOtherRoutine(STRF_1117_Straefling,"FollowMe");
	};

	b_changeguild(Pal_219_Ritter,GIL_BDT);
	B_StartOtherRoutine(Pal_219_Ritter,"GrimesEsc");
	AI_Teleport(Pal_219_Ritter,"OW_PAL_WESTMINE_03");
	b_changeguild(Pal_218_Ritter,GIL_BDT);
	B_StartOtherRoutine(Pal_218_Ritter,"GrimesEsc");
	AI_Teleport(Pal_218_Ritter,"OW_PAL_WESTMINE_02");
	B_StartOtherRoutine(vlk_7527_waffenknecht,"GrimesEsc");
	AI_Teleport(vlk_7527_waffenknecht,"OW_PAL_WESTMINE_06");
};

instance DIA_GRIMES_WEGOTOUTOFHERE(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_wegotoutofhere_condition;
	information = dia_grimes_wegotoutofhere_info;
	permanent = FALSE;
	description = "Jsme na místě.";
};

func int dia_grimes_wegotoutofhere_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_letsgetoutofhere) && (Npc_GetDistToWP(self,"START") < 2000) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_wegotoutofhere_info()
{
	AI_Output(other,self,"DIA_GRIMES_WeGotOutOfHere_15_00");	//Jsme na místě! Přes tule jeskyni se můžem dostat do Khorinisu. Prostě pojďte za mnou.
	AI_Output(self,other,"DIA_GRIMES_WeGotOutOfHere_01_01");	//Dobře.
	HUNTYGRIMESESCAPEOW = TRUE;
	Pal_219_Ritter.flags = 0;
	Pal_218_Ritter.flags = 0;
	vlk_7527_waffenknecht.flags = 0;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(HuntyIsDead == FALSE)
	{
		STRF_1117_Straefling.aivar[AIV_PARTYMEMBER] = FALSE;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"NearPassOW");

	if(HuntyIsDead == FALSE)
	{
		B_StartOtherRoutine(STRF_1117_Straefling,"NearPassOW");
	};

	B_KillNpc(Pal_218_Ritter);
	B_KillNpc(Pal_219_Ritter);
	B_KillNpc(vlk_7527_waffenknecht);

	Wld_InsertNpc(orkelite_addon2,"OW_PAL_WESTMINE_02");
	Wld_InsertNpc(orkelite_addon2,"OW_PAL_WESTMINE_01");
	Wld_InsertNpc(orkelite_addon3,"OW_PATH_266");
	Wld_InsertNpc(orkelite_addon2,"OW_PATH_2_04");
	Wld_InsertNpc(orkelite_addon3,"OW_PAL_WESTMINE_SIT");
};

//-----------------------novyy-----------------------------------------------------------

instance DIA_GRIMESNW_EXIT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 999;
	condition = dia_grimesnw_exit_condition;
	information = dia_grimesnw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_grimesnw_exit_condition()
{
	return TRUE;
};

func void dia_grimesnw_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRIMESNW_FREEDOM(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 1;
	condition = dia_grimesnw_freedom_condition;
	information = dia_grimesnw_freedom_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimesnw_freedom_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_grimesnw_freedom_info()
{
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_00");	//(Hluboce dýchá) Svoboda...
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_01");	//Během posledních několita let jsem byl přesvědčen, že umřu v tom prokletém údolí.
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_02");	//Nemůžu uvěřit, že jsem ho nakonec opustil...
	AI_Output(other,self,"DIA_GRIMESNW_Freedom_15_03");	//Brzo na oslavy. Ještě jsme se nedostali do mého tábora.
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_04");	//Máš pravdu! Nebudem se zdržovat.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	vlk_41111_huntynw.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
	B_StartOtherRoutine(vlk_41111_huntynw,"FollowMe");
};

instance DIA_GRIMESNW_FINALLYINTOWER(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 1;
	condition = dia_grimesnw_finallyintower_condition;
	information = dia_grimesnw_finallyintower_info;
	permanent = FALSE;
	description = "Jsme na místě to je můj tábor.";
};

func int dia_grimesnw_finallyintower_condition()
{
	if((HURRAYICANHIRE == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 3000))
	{
		return TRUE;
	};
};

func void dia_grimesnw_finallyintower_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_00");	//Jsme na místě to je můj tábor. Je tam vchod do dolu.
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_01");	//Krásné místo. Děkuji, že jsi mě dostal z údolí.
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_02");	//Není za co. Teď si odpočiňte ať se vám vrátí síly k práci.
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_03");	//Doufám, že jsi nezapomněl na naši dohodu?
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_04");	//To se ví, své slovo držím.
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_05");	//Rozhlédněte se! A ještě, Za svou práci dostanete zaplaceno 35 zlatých na den?
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_06");	//Zlaťáky! Už jsem skoro zapomněl co toje.
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_07");	//Ještě jednou ti děkuju.
	B_LogEntry_Quiet(TOPIC_PPL_FOR_TOWER,"Podařilo se mě dostat kopáče Grimese a Huntyho z Hornického údolí. Nyní budou pracovat pro mě.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	HUNTYGRIMESRECRUITEDDT = TRUE;

	if(DT_OREGATHER_START == FALSE)
	{
		DT_OREGATHER_START = TRUE;
		EVERYDAYDTORE = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_GRIMESNW_INTOWER(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 22;
	condition = dia_grimesnw_intower_condition;
	information = dia_grimesnw_intower_info;
	permanent = TRUE;
	description = "Jak se ti líbí nové pracovní místo?";
};

func int dia_grimesnw_intower_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_grimesnw_intower_info()
{
	AI_Output(other,self,"DIA_GrimesNW_InTower_15_00");	//Jak se ti líbí nové pracovní místo?
	AI_Output(self,other,"DIA_GrimesNW_InTower_01_01");	//Výborný! Přísahám, že zde nezůstane ani kousek rudy.
};

instance DIA_GRIMES_NW_KNOWABOUTERZHUNT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 2;
	condition = dia_grimes_NW_knowabouterzhunt_condition;
	information = dia_grimes_NW_knowabouterzhunt_info;
	permanent = FALSE;
	description = "Znáš něco o těžbě rudy?";
};

func int dia_grimes_NW_knowabouterzhunt_condition()
{
	return TRUE;
};

func void dia_grimes_NW_knowabouterzhunt_info()
{
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_00");	//Znáš něco o těžbě rudy?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_01");	//Polovinu svého života se zabývám těžbou rudy.
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_03");	//Chci se naučit těžit rudu. Můžeš mě pomoci?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_04");	//Není problém. Naučím tě vše, co sám umím.

	if(ORE_TOPIC_EXIST == TRUE)
	{
		B_LogEntry(TOPIC_MAGICORE,"Grimes mě může naučit, jak těžit rudu.");
	}
	else
	{
		Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
		B_LogEntry(TOPIC_MAGICORE,"Grimes mě může naučit, jak těžit rudu.");
		ORE_TOPIC_EXIST = TRUE;
	};
};

instance DIA_GRIMES_NW_LEARNABOUTERZHUNT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 2;
	condition = dia_grimes_NW_learnabouterzhunt_condition;
	information = dia_grimes_NW_learnabouterzhunt_info;
	permanent = TRUE;
	description = "Nauč mě těžit rudu.";
};

func int dia_grimes_NW_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_knowabouterzhunt) && (HERO_HACKCHANCEORE < 100))
	{
		return TRUE;
	};
};

func void dia_grimes_NW_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_0A");	//Řekni mě víc o těžbě rudy.
	}
	else
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_00");	//Nauč mě těžit rudu.
	};

	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
	Info_AddChoice(dia_grimes_NW_learnabouterzhunt,Dialog_Back,dia_grimes_NW_learnabouterzhunt_Back);
	Info_AddChoice(dia_grimes_NW_learnabouterzhunt,b_buildlearnstringforerzhunt("Těžba rudy",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_grimes_NW_learnabouterzhunt_ERZWORK);
};

func void dia_grimes_NW_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
};

func void dia_grimes_NW_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 100)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_01");	//Dobře! Poslouchej pozorně...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_02");	//Než začneš potřebuješ dobrej krumpáč, to je půlka úspěchu.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_03");	//Potom když nalezneš rudnou žílu, začni jí zpracovávat.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_04");	//Udery soustřeď do středu, ne na okraje. Začni jedním silným úderem, a pak několika slabšími.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_05");	//Tím trochu narušíš strukturu horniny. A při dalším silném úderu určitě nějaký ten kousek odpadne.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_06");	//A pak nanovo...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_07");	//To je to hlavní co potřebuješ vědět.
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_09");	//Dobře, poslouchej pozorně...(vypráví)
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_10");	//Naučil jsem tě, vše co znám. Dále musíš sám získávat zkušenosti, při máchání krumpáčem.
	};

	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
};

//------------------------------Khanti------------------------------------------

instance DIA_HUNTYNW_EXIT(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 999;
	condition = dia_huntynw_exit_condition;
	information = dia_huntynw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_huntynw_exit_condition()
{
	return TRUE;
};

func void dia_huntynw_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_HUNTYNW_INTOWER_IRON(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 22;
	condition = dia_huntynw_intower_IRON_condition;
	information = dia_huntynw_intower_IRON_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_huntynw_intower_IRON_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_huntynw_intower_IRON_info()
{
	AI_Output(self,other,"DIA_HuntyNW_InTower_01_01");	//Děkuji, že jsi mě pomohl dostat se z údolí!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;

	if(DT_IRONGATHER_START == FALSE)
	{
		DT_IRONGATHER_START = TRUE;
		EVERYDAYDTIRON = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_HUNTYNW_INTOWER(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 22;
	condition = dia_huntynw_intower_condition;
	information = dia_huntynw_intower_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int dia_huntynw_intower_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_huntynw_intower_info()
{
	AI_Output(other,self,"DIA_HuntyNW_InTower_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_HuntyNW_InTower_01_01");	//Všechno v pořádku.
};