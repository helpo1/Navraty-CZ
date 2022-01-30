
instance NONE_116_MUD_EXIT(C_Info)
{
	npc = none_116_mud;
	nr = 999;
	condition = none_116_mud_exit_condition;
	information = none_116_mud_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int none_116_mud_exit_condition()
{
	return TRUE;
};

func void none_116_mud_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NONE_116_MUD_HALLO(C_Info)
{
	npc = none_116_mud;
	condition = none_116_mud_hallo_condition;
	information = none_116_mud_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int none_116_mud_hallo_condition()
{
	return TRUE;
};

func void none_116_mud_hallo_info()
{
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_00");	//Hej, a ty jsi kdo? A odkud přicházíš?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_01");	//I když, počkej chvilku... (zamyšleně) Já tě znám! No jistě...
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_02");	//Ty jsi ten nováček, co vyřídil samotnýho Gomeze!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_03");	//Ach, chlape, ani nevíš, jak rád tě vidím!
	Info_ClearChoices(none_116_mud_hallo);
	Info_AddChoice(none_116_mud_hallo,"Jak vidím, moc ses nezměnil, Mude.",none_116_mud_hallo_mud);
	Info_AddChoice(none_116_mud_hallo,"Promiň, ale něco se mi stalo s pamětí.",none_116_mud_hallo_who);
};

func void none_116_mud_hallo_mud()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"NONE_116_Mud_Hallo_Mud_01_01");	//Jak vidím, moc ses nezměnil, Mude. Pořád jsi stejně ukecaný!
	AI_Output(other,self,"NONE_116_Mud_Hallo_Mud_01_02");	//I když vypadáš trochu... jinak než předtím.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_03");	//Ty si mě pamatuješ! Jaké štěstí! Starý kamaráde!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_04");	//Pamatuješ na naše střetnutí ve Starým táboře?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_06");	//To byly tedy časy! Co ty tady děláš?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_07");	//Ale na tom vlastně ani nezáleží, teď jsi zase se mnou a už se ani tak moc nebojím...
	AI_Output(other,self,"NONE_116_Mud_Hallo_Mud_01_08");	//Sklapni, Mude! Jinak tě zmlátím jako za starých dobrých časů.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_09");	//Tak jo, tak jo... (polekaně) Jak řekneš, už jsem zticha. Vidíš, už jsem zticha.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_10");	//Ale pokud mám být zticha, jak s tebou můžu mluvit?
	Info_ClearChoices(none_116_mud_hallo);
};

func void none_116_mud_hallo_who()
{
	AI_Output(other,self,"NONE_116_Mud_Hallo_Who_01_01");	//Promiň, ale já si tě nevybavuju.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_02");	//Cože?! Ty si nepamatuješ svýho starýho kamaráda? Ty si nepamatuješ Muda?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_04");	//Byli jsme přeci přátelé!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_05");	//Byls můj jediný přítel ve Starým táboře, i když všichni ostatní mě měli za kreténa.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_06");	//Ale oni se mýlili. Zvláště když se dozvěděli, že mám kamaráda jako jsi ty!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_07");	//Je supr mít kamarády! Máš ty nějaké kamarády?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_08");	//No, jednoho máš určitě, mě!
	AI_Output(other,self,"NONE_116_Mud_Hallo_Who_01_09");	//Zdá se mi, že moc kecáš.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_10");	//A co je na tom divného? Vždycky je prěci skvělé pokecat si se starým kamarádem.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_11");	//Nebo snad myslíš, že ne?
	AI_Output(other,self,"NONE_116_Mud_Hallo_Who_01_12");	//Myslím, že pro začátek by ses měl naučit aspoň někdy držet jazyk za zubama.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_14");	//Tak jo, jak řekneš. Já mohu i mlčet.
	Info_ClearChoices(none_116_mud_hallo);
};


instance NONE_116_MUD_FACE(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_face_condition;
	information = none_116_mud_face_info;
	permanent = FALSE;
	description = "Co se ti stalo?";
};


func int none_116_mud_face_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_hallo))
	{
		return TRUE;
	};
};

func void none_116_mud_face_info()
{
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_01");	//Co se ti stalo?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_02");	//(sarkasticky) Máš na mysli můj obličej?
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_03");	//Jo. Mám přesně tohle na myslím. Kdo tě tak zmrzačil?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_04");	//Ech... Jedna mrcha se o to pokusila!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_05");	//I když měl bych poděkovat svému osudu, že jsem přežil!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_09");	//Nic takového jsem ještě neviděl!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_10");	//Kapánek připomíná chňapavce, ale je ještě strašnější a divočejší.
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_12");	//A jak ses tady objevil ty?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_14");	//Po pádě bariéry jsem se chtěl vrátit do Khorinisu.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_15");	//Ale na cestě k průsmyku jsem narazil na skupinu skřetů.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_18");	//Ti zelenokožci si asi mysleli, že bych lépe vypadal v kotli nad ohněm. Tak mě začali pronásledovat!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_19");	//Pamatuji si, jak jsem běžel, co mi sily stačily, ani jsem nekoukal kam.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_21");	//A když jsem setřásl ty skřety, konečně jsem se rozhlédnul - a viděl jsem, že jsem se ztratil.
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_25");	//Nepokoušel ses opět projít průsmykem?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_26");	//Ne, z tohohle údolí už ani nevystrčím paty!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_27");	//Jakmile tě skřeti uvidí, sežerou tě zaživa! Raději zůstanu.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_28");	//A mimochodem, kamaráde, tohle místečko je docela slušné.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_30");	//Skřeti sem nechodí, jejich tábor je dál v horách.
};


instance NONE_116_MUD_CRATES(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_crates_condition;
	information = none_116_mud_crates_info;
	permanent = FALSE;
	description = "Co je v těch bednách?";
};


func int none_116_mud_crates_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_hallo) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void none_116_mud_crates_info()
{
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_00");	//Co je v těch bednách?
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_01");	//Magická ruda.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_02");	//Ruda?! Odkud je?!
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_03");	//Nevím. Byla tady, už když jsem sem přišel.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_06");	//Těch beden je alespoň dvacet!
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_07");	//Hmm... Myslím, že bych to měl nahlásit paladinům. Garond bude překvapen.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_08");	//Paladinům? (překvapeně) Jakým paladinům?
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_09");	//Asi nejsi zrovna v obraze.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_10");	//Ha! A to tě jako překvapuje? Jsi první osoba, kterou vidím za posledních pár týdnů.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_11");	//(se zájmem) Ale cos to říkal o paladinech?
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_12");	//Před pár dny do údolí přišel malý oddíl královských paladinů a usídlil se na starém hradě rudobaronů.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_16");	//Momentálně je hrad ve skřetím obležení a není zrovna lehké se tam dostat.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_17");	//A všechny cesty z údolí jsou taky zablokovány těmi zelenokožci. Jen pár lidem se zatím povedlo dostat se ven.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_18");	//Zatraceně! Ti skřeti!
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_20");	//Co teď?
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_21");	//Teď je potřeba jít informovat paladiny o té magické rudě.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_24");	//Poslouchej, a... Nemohl bys mě sebrat sebou, když půjdeš na hrad?
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_26");	//Sám bych tam nedošel a s tebou mám alespoň nějakou šanci.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_29");	//Promiň, ale je to příliš nebezpečné.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_31");	//Pokud si vzpomínám, nikdy jsi nebyl bůhvíjaký bojovník.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_32");	//No jo, chápu. Fajn, budu tady sedět.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_34");	//Neboj, pokusím se přivést sebou nějaké posily.
	MIS_MADERZ = LOG_Running;
	Log_CreateTopic(TOPIC_MADERZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MADERZ,LOG_Running);
	B_LogEntry(TOPIC_MADERZ,"Na místě, kde se schovává Mud, jsem našel ohromné zásoby magické rudy. Mud sám neví, odkud jsou. Musím se rychle dostat do hradu a říct to Garondovi. Mělo by mu to zvednout náladu.");
	Log_AddEntry(TOPIC_MADERZ,"Rozhodl jsem se, že nevezmu Muda na hrad. Slíbil jsem mu však, že se pokusím přesvědčit Garonda, ať mu někoho pošle.");
};


instance NONE_116_MUD_PERM(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_perm_condition;
	information = none_116_mud_perm_info;
	permanent = TRUE;
	description = "Jak se vede, Mude?";
};


func int none_116_mud_perm_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_face))
	{
		return TRUE;
	};
};

func void none_116_mud_perm_info()
{
	AI_Output(other,self,"NONE_116_Mud_Perm_01_00");	//Jak se vede, Mude?
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		AI_Output(self,other,"NONE_116_Mud_Perm_01_01");	//Mohlo být i líp. Nelíbí se mi to.
		AI_Output(self,other,"NONE_116_Mud_Perm_01_02");	//Jediná věc, která mě uklidňuje, jsou tihle kluci v zbroji.
	}
	else
	{
		AI_Output(self,other,"NONE_116_Mud_Perm_01_06");	//Jak, jak... (smutně) Nijak!
		AI_Output(self,other,"NONE_116_Mud_Perm_01_07");	//Jenom se porozhlédni, všude jen samá beznaděj!
		AI_Output(self,other,"NONE_116_Mud_Perm_01_08");	//Ech... Kdy to jenom skončí?
	};
};


instance NONE_116_MUD_NOTINCASTLE(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_notincastle_condition;
	information = none_116_mud_notincastle_info;
	permanent = FALSE;
	description = "Teď se už tolik nebojíš?";
};


func int none_116_mud_notincastle_condition()
{
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void none_116_mud_notincastle_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"NONE_116_Mud_NotInCastle_01_00");	//Teď se už tolik nebojíš?
	AI_Output(self,other,"NONE_116_Mud_NotInCastle_01_02");	//S těmi kluky se už cítím bezpečněji.
	AI_Output(self,other,"NONE_116_Mud_NotInCastle_01_04");	//Díky, kamaráde!
};

