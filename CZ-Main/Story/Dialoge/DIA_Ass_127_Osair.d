
instance DIA_Ass_127_Osair_EXIT(C_Info)
{
	npc = Ass_127_Osair;
	nr = 999;
	condition = dia_Ass_127_Osair_exit_condition;
	information = dia_Ass_127_Osair_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_127_Osair_exit_condition()
{
	return TRUE;
};

func void dia_Ass_127_Osair_exit_info()
{
	if((OsairGetsNrozasPoisonLaw == TRUE) && (MIS_NrozasPoisonGift == FALSE) && (NrozasIsDead == FALSE))
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_01");	//Stůj! Předtím, než odejdeš - tady, vem si tohle.
		B_GiveInvItems(self,other,ItFo_BeliarTear,1);
		AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_02");	//Vem tuto láhev úchvatného vína a odnes ho mistru Nrozasovi, jako důkaz mé vděčnosti.
		AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_03");	//Samozřejmě, mistře. Předám mu to víno.
		AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_04");	//Dobrá, teď jdi.
		MIS_NrozasPoisonGift = LOG_Running;
		Log_CreateTopic(TOPIC_NrozasPoisonGift,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_NrozasPoisonGift,LOG_Running);
		B_LogEntry(TOPIC_NrozasPoisonGift,"Mistr Osair chce, abych předal láhev vína mistru Nrozasovi jako důkaz jeho vděčnosti.");
	};

	AI_StopProcessInfos(self);
};


instance DIA_Ass_127_Osair_PreHALLO(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_PreHALLO_condition;
	information = dia_Ass_127_Osair_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairMurid == FALSE) && (OsairMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_PreHALLO_01_00");	//(suše) Co potřebuješ, novici? Mluv!
};

instance DIA_Ass_127_Osair_PreHALLO_Kill(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_PreHALLO_Kill_condition;
	information = dia_Ass_127_Osair_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairMurid == FALSE) && (MIS_NrozasToOsair == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_127_Osair_NrozasToOsair(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_NrozasToOsair_condition;
	information = dia_Ass_127_Osair_NrozasToOsair_info;
	permanent = FALSE;
	description = "Poslal mě mistr Nrozas.";
};

func int dia_Ass_127_Osair_NrozasToOsair_condition()
{
	if(MIS_NrozasToOsair == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_NrozasToOsair_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_01");	//Poslal mě mistr Nrozas.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_02");	//Co chce?
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_03");	//Mám ti vzkázat, abys mu příště poslal silnější otroky.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_04");	//(arogantně) A co se mu nelíbí na nynějších otrocích?
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_05");	//Velmi rychle mu umírají.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_06");	//Ještě aby ne. Ať se podívá, co s nimi vyvádí.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_07");	//I když bez jeho experimentů s jedy by nám bylo o hodně hůř.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_08");	//No dobře, tady.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_09");	//Předej mu tenhle dopis, novici. Tady je moje odpověď na jeho prosbu.
	B_GiveInvItems(self,other,ItWr_Osair,1);
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_10");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_11");	//Mimochodem, když už tu jsi, mám pro tebe ještě jeden úkol.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_12");	//Nedávno se nedaleko od mé jeskyně ukázala tlupa černých chňapavců.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_13");	//Mě i moje lidi to znepokojuje, a hlavně nedávno mi sežrali jednoho posla.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_14");	//Určitě chápeš, že se mi to nelíbilo.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_15");	//Chci, abys tento problém vyřešil.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_16");	//Takhle mi ukážeš, čeho jsi hoden. Vše jasné?
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_17");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_18");	//Dobře. Teď jdi.
	MIS_OsairSnappers = LOG_Running;
	OsairMeet = TRUE;
	Log_CreateTopic(TOPIC_OsairSnappers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairSnappers,LOG_Running);
 	B_LogEntry(TOPIC_OsairSnappers,"Jednoho z poslů mistra Osaira sežrala tlupa černých chňapavců, která se nachází nedaleko od jeho jeskyně. Chce, abych tento problém vyřešil. Tímto dokážu, že jsem něčeho schopný.");
	B_LogEntry_Quiet(TOPIC_NrozasToOsair,"Informoval jsem mistra Osaira o prosbě mistra Nrozase. Jako odpověď mu mám předat jeho dopis. Zdá se, že mistr Osair má v této věci své vlastní názory.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Snapper_Black_Osair_01,"PW_OSAIRSNAPPER_01");
	Wld_InsertNpc(Snapper_Black_Osair_02,"PW_OSAIRSNAPPER_02");
	Wld_InsertNpc(Snapper_Black_Osair_03,"PW_OSAIRSNAPPER_03");
	Wld_InsertNpc(Snapper_Black_Osair_04,"PW_OSAIRSNAPPER_04");
	Wld_InsertNpc(Snapper_Black_Osair_05,"PW_OSAIRSNAPPER_05");
};	


instance DIA_Ass_127_Osair_Snapper(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Snapper_condition;
	information = dia_Ass_127_Osair_Snapper_info;
	permanent = FALSE;
	description = "Zabil jsem ty černé chňapavce.";
};

func int dia_Ass_127_Osair_Snapper_condition()
{
	if((MIS_OsairSnappers == LOG_Running) && (Npc_IsDead(Snapper_Black_Osair_01)) && (Npc_IsDead(Snapper_Black_Osair_02)) && (Npc_IsDead(Snapper_Black_Osair_03)) && (Npc_IsDead(Snapper_Black_Osair_04)) && (Npc_IsDead(Snapper_Black_Osair_05)))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Snapper_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_01");	//Zabil jsem ty černé chňapavce.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_02");	//Hmm. No, tak už nemusím mít žádné starosti, že?
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_03");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_04");	//To je skvělé! Skvělá práce, novici.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_05");	//A když jsi takhle dobře vyřešil můj úkol, tak mě napadlo, že bych ti dal ještě jeden. O dost těžší, než ten první.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_06");	//Doufám, že nejsi proti.
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_07");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_08");	//Tak poslouchej. Určitě jsi viděl otroky, kteří se nachází v dole.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_09");	//Takže... zdá se mi, že mezi nimi panuje nějaké větší spiknutí.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_10");	//Je nepravděpodobné, že by se odhodlali postavit mým strážím nebo utéci odsud.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_11");	//Ale na tom nesejde. Je potřeba vybít tuhle šílenost z jejich hlav, aby se báli jen pomyslet na nějaký útěk.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_12");	//Proto bych chtěl najít jejich vůdce a dát mu jakousi, nemalou lekci!
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_13");	//Doufám, že tě tato věc zaujme.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_14");	//Najdi toho, kdo vnucuje otrokům vzpoury a informuj mě o tom. Všechno jasné?
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_15");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_16");	//Učiň tak. Spoléhám na tebe.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_17");	//Jestli si budeš muset promluvit s otroky - řekni jim, co jsem ti řekl.
	MIS_OsairSnappers = LOG_SUCCESS;
	MIS_RebelSlave = LOG_Running;
	OsairLetsPrision = TRUE;
	Log_CreateTopic(TOPIC_RebelSlave,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairSnappers,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_RebelSlave,LOG_Running);
	B_LogEntry(TOPIC_OsairSnappers,"Mistr Osair byl rád, že jsem si poradil s černými chňapavci.");
	B_LogEntry_Quiet(TOPIC_RebelSlave,"Mistr Osair mi dal ještě další úkol. Mám najít otroka, který si podmaňuje ostatní zajatce a chce zrealizovat jejich útěk z vězení. Hmm, kde bych měl asi tak začít?");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_OsairDemand(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_OsairDemand_condition;
	information = dia_Ass_127_Osair_OsairDemand_info;
	permanent = FALSE;
	description = "(dát kůži jeskynního trola)";
};

func int dia_Ass_127_Osair_OsairDemand_condition()
{
	if((MIS_OsairDemand == LOG_Running) && (Npc_HasItems(other,ItAt_CaveBlackFurTroll) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_OsairDemand_info()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_CaveBlackFurTroll,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_02");	//Co se děje, novici? Počkej. Není to náhodou to, na co jsem teď pomyslel?
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_03");	//Ano, to je přece kůže jeskynního trola! Nevěřím svým očím! Mistr Nrozas souhlasil, že by se o ní podělil?
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_04");	//Dobrá, na tom nesejde. Hlavní je, že teď je nakonec moje.
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_05");	//Příště mu pošlu ty nejrobustnější a nejtužší otroky, které budu mít. Tak, jak to chtěl.
	MIS_OsairDemand = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OsairDemand,LOG_SUCCESS);
	B_LogEntry(TOPIC_OsairDemand,"Mistr Osair byl radostí bez sebe, dostal totiž kůži jeskynního trola. Teď bude posílat mistru Nrozasovi ty nejsilnější otroky.");

	if(MIS_RebelSlave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_06");	//Co se týče tebe, novici. Dokázal jsi mi, že dokážeš mnohé.
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_07");	//Věř mi, mnohým se takové nepovedlo.
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_08");	//A jako odměnu za tvou snahu tě pasuji na mého vyvoleného murida!
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_09");	//Doufám, že víš, co to pro tebe znamená a v budoucnu mě nepodvedeš.
		AI_Output(other,self,"DIA_Ass_128_Osair_OsairDemand_01_10");	//Děkuji ti, mistře.
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_11");	//Není zač. Zasloužil sis to.
		OsairMurid = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry_Quiet(TOPIC_MasiafStory,"Mistr Osair byl rád, že jsem mu splnil jeho úkoly. Za moji snahu mě nazval svým vyvoleným muridem. Musím o tom informovat Gonzalese.");

		if((NrozasMurid == TRUE) && (PlayerSendToTiamant == FALSE))
		{
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_12");	//A ještě něco.
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_13");	//Když už se ti povedlo překonat jeskynního trola, tak předpokládám, že jsi šikovný bojovník.
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_14");	//Mistr Tiamant se zabývá bojovým tréninkem stínů, určitě ho to bude zajímat.
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_15");	//Promluv si s ním. A jestli se bude ptát, řekni mu, že jsem tě poslal já.
			AI_Output(other,self,"DIA_Ass_127_Osair_OsairDemand_01_16");	//Dobře, mistře.
			PlayerSendToTiamant = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_17");	//Na co čekáš? Už jdi, myslím si, že máš stále co na práci.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_127_Osair_Murid(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Murid_condition;
	information = dia_Ass_127_Osair_Murid_info;
	permanent = FALSE;
	description = "Co to znamená být vyvoleným, mistře?";
};

func int dia_Ass_127_Osair_Murid_condition()
{
	if((OsairMurid == TRUE) && (MuridTells == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Murid_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Murid_01_01");	//Co to znamená být vyvoleným, mistře?
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_02");	//Něco ti objasním. Poslouchej bedlivě.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_03");	//Jednou za čtyři roky se jednomu z našich noviců dostává cti stát se stínem Masyafu.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_04");	//Stínové jsou naši bojovníci, kteří nesou smrt všem, kteří pochybují o naší moci, a hlavně o moci samotného Beliara!
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_05");	//Každý převor Masyafu, včetně mě, vybírá z noviců toho, kdo je podle něj toho hoden.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_06");	//Nazývá ho svým muridem, a tím ukazuje jeho kvalitu pro rituál Obrácení.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_07");	//Až nastane čas, všichni muridové podstupují řadu obtížných i života nebezpečných zkoušek.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_08");	//A ten jediný, který zůstane živý projde rituálem zasvěcení a stane se bojovníkem Beliara. 
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_09");	//Já jsem si vybral tebe, jako svého murida. Ale ostatní, co vím, svůj výběr ještě neudělali. 
	AI_Output(other,self,"DIA_Ass_127_Osair_Murid_01_10");	//A co když si všichni převorové vyberou toho samého novice?
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_11");	//(zamyšleně) Hmmm. Co vím, to se zatím ještě nikdy nestalo.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_12");	//No, s největší pravděpodobností, jeho osud už bude řešit samotný mistr Haniar Slepý - nejmocnější a nejmoudřejší z nás.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_13");	//A to jak se rozhodne, ví jen samotný Beliar.
	MuridTells = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Mistr Osair mi pověděl o rituálu Obrácení vyvolených noviců v řádu stínů, bojovníků bratrstva Masyaf. Každý převor si musí vybrat svého murida, a ti si budou dělat konkurenci mezi sebou. Jestli si všichni převorové vyberou jednoho a toho samého člověka, osud toho murida bude řešit nejmoudřejší z nich - mistr Haniar Slepý.");
};

instance DIA_Ass_127_RebelSlave(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_RebelSlave_condition;
	information = dia_Ass_127_Osair_RebelSlave_info;
	permanent = FALSE;
	description = "(ukázat na novice)";
};

func int dia_Ass_127_Osair_RebelSlave_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (Npc_IsDead(SEK_156_SLAVEOBSSEK) == FALSE) && (PW_Betray.aivar[AIV_PARTYMEMBER] == TRUE) && (PW_BetrayFollowMe == TRUE) && (Npc_GetDistToWP(PW_Betray,"PW_OSAIR_BETRAY") <= 750))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_RebelSlave_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_RebelSlave_01_01");	//(ukazuje na novice)
	AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_02");	//(ohlíží se) Takže, tohle je ten náš hrdina?
	AI_Output(other,self,"DIA_Ass_127_Osair_RebelSlave_01_03");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	PW_Betray.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_04");	//No dobře, věřím, že nemusím mít obavy z povstání.
	AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_05");	//(zlověstně) S ním si promluvím později. A co se týče tebe, dobře jsi pracoval.
	MIS_RebelSlave = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RebelSlave,LOG_SUCCESS);
	B_LogEntry(TOPIC_RebelSlave,"Mistr Osair byl rád, že jsem mu přivedl vůdce nepokojů, i když toho nepravého.");

	if(MIS_OsairDemand == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_06");	//Dokázal jsi, že toho zvládneš hodně. A věř mi, že se to moc lidem nepodařilo.
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_07");	//A proto tě od nynějška pasuji na svého vyvoleného murida.
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_08");	//Doufám, že víš, co to znamená a v budoucnu mě nepodvedeš.
		AI_Output(other,self,"DIA_Ass_128_Osair_RebelSlave_01_09");	//Děkuji ti, mistře.
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_10");	//Není zač. Zasloužil sis to.
		OsairMurid = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry_Quiet(TOPIC_MasiafStory,"Splnil jsem všechny úkoly mistra Osaira. Za to mě pasoval na svého murida. Musím to říct Gonzalesovi.");

		if((NrozasMurid == TRUE) && (PlayerSendToTiamant == FALSE))
		{
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_11");	//A ještě něco.
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_12");	//Když už jsi mohl ustát jeskynního trola, tak předpokládám, že jsi velmi zkušený bojovník.
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_13");	//Mistr Tiamant se zabývá bojovým tréninkem stínů, určitě ho to bude zajímat.
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_14");	//Promluv si s ním. A jestli bude mít nějaké otázky, prostě řekni, že to já jsem tě k němu poslal.
			AI_Output(other,self,"DIA_Ass_127_Osair_RebelSlave_01_15");	//Dobře, mistře.
			PlayerSendToTiamant = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_16");	//Pokračuj ve stejném duchu a brzy budeš mít šanci opravdu ukázat, kdo vlastně jsi. 
		AI_StopProcessInfos(self);
	};

	Npc_ExchangeRoutine(PW_Betray,"OsairReady");
	B_Attack(self,PW_Betray,AR_KILL,1);
};

instance DIA_Ass_127_Osair_AssasinGold(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_AssasinGold_condition;
	information = dia_Ass_127_Osair_AssasinGold_info;
	permanent = FALSE;
	description = "Máš pro mě nějaké další úkoly?";
};

func int dia_Ass_127_Osair_AssasinGold_condition()
{
	if(OsairMurid == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_AssasinGold_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_01_01");	//Máš pro mě nějaké další úkoly?
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_01_02");	//Ne. Ale když budeš v chrámu, předej toto zlato dvěma stínům - jmenují se Hasim a Narug.
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,2);
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_01_03");	//Tohle jsou jejich peníze za poslední partu otroků. To je prozatím vše.
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_01_04");	//Rozumím, mistře.
	MIS_AssasinGold = LOG_Running;
	Log_CreateTopic(TOPIC_AssasinGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AssasinGold,LOG_Running);
	B_LogEntry(TOPIC_AssasinGold,"Musím odnést zlato od mistra Osaira dvoum stínům do chrámu. Jejich jména jsou Hasim a Narug.");
	AI_StopProcessInfos(self);

	if(HasimInserted == FALSE)
	{
		HasimInserted = TRUE;
		Wld_InsertNpc(Ass_170_Adept,"PW_TEMPLE_HASIM");
	};
};

instance DIA_Ass_127_Osair_AssasinGold_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_AssasinGold_Done_condition;
	information = dia_Ass_127_Osair_AssasinGold_Done_info;
	permanent = FALSE;
	description = "Dal jsem zlato stínům, mistře.";
};

func int dia_Ass_127_Osair_AssasinGold_Done_condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimNeedRareWineDone == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_AssasinGold_Done_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_Done_01_01");	//Dal jsem zlato stínům, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_Done_01_02");	//Dobře. I když o tom si mě ani nemusel informovat, muride.
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_Done_01_03");	//A teď jdi, jsem zaneprázdněn.
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_Done_01_04");	//Dobře, mistře.
	PW_RecoverDeadBodyDay = Wld_GetDay();
	MIS_AssasinGold = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AssasinGold,LOG_SUCCESS);
	B_LogEntry(TOPIC_AssasinGold,"Řekl jsem mistru Osairovi, že jsem dal veškeré zlato jeho stínům.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_HelpWithAssair(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_HelpWithAssair_condition;
	information = dia_Ass_127_Osair_HelpWithAssair_info;
	permanent = FALSE;
	description = "Poslal mě mistr Tiamant, mistře.";
};

func int dia_Ass_127_Osair_HelpWithAssair_condition()
{
	if(TiamantSendsToOsair == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_HelpWithAssair_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_01");	//Poslal mě mistr Tiamant, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_02");	//Co potřebuje?
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_03");	//Chtěl ti připomenout, že bys měl poslat do rudné šachty nové otroky, co nejrychleji to půjde.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_04");	//(nahněvaně) Co?! On mi hodlá přikazovat, co bych měl dělat?
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_05");	//Na jeho místě bych raději ochraňoval staré otroky!
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_06");	//No, ale jak lze vidět, jeho lidé nedokážou ani tohle.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_07");	//Tak dobrá tedy... Dokud nebudu ujištěn o tom, že je šachta normálně střežena...
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_08");	//... tak tam nepošlu ani jednoho otroka. Vážně mě zajímá, jak to udělá.
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_09");	//Předám mu tvou odpověď, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_10");	//Nemusíš. Sám pošlu svého posla s dopisem pro mistra Tiamanta.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_11");	//Od tebe stačí jen to, že tě poslal ke mně.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_12");	//Ale mám pro tebe jiný úkol.
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_13");	//Poslouchám, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_14");	//Nedávno se ke mně dostalo, že ve starém podhorském průchodu, někde hluboko v hoře, je velký zlatý důl.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_15");	//A to znamená, že by se tam měl jít někdo podívat a zjistit, zda-li je to pravda.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_16");	//Nebude to jednoduché, ale věřím, že ty si s tím poradíš.

	MIS_PW_GOLDSHAHT = LOG_Running;
	Log_CreateTopic(TOPIC_PW_GOLDSHAHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_GOLDSHAHT,LOG_Running);

	if(PW_GOLDSHAHT == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_17");	//Důl se tam opravdu nachází, mistře.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_18");	//Jsi si jistý?
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_19");	//Nemýlím se.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_20");	//(zamyšleně) Ne, že bych ti nevěřil. Ale jsem zvyklý věřit svým očím a ne slovům.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_21");	//Zkus pro mě získat nějaký exemplář zlaté rudy. To bude lepším důkazem tvých slov.
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_22");	//Samozřejmě, mistře. Udělám to.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_23");	//Dobrá, tak tedy jdi.
		B_LogEntry(TOPIC_PW_GOLDSHAHT,"Mistr Osair chce, abych přinesl exemplář zlaté rudy z dolu, který jsem objevil v podhorském průchodu na důkaz mých slov.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_24");	//A jestli objevíš ten důl, tak mi přines aspoň jeden exemplář zlaté rudy. 
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_25");	//Samozřejmě mistře. Udělám to.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_26");	//Dobrá, tak tedy jdi.
		B_LogEntry(TOPIC_PW_GOLDSHAHT,"Mistr Osair chce, abych prověřil, jestli se opravdu nachází zlatá ruda v podhorském průchodu. Jestli ho najdu, musím mu přinést exemplář zlaté rudy z toho dolu.");
	};
	
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_185_Adept,"PW_CAVEGOLDORE_01");
};

instance DIA_Ass_127_Osair_HelpWithAssair_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_HelpWithAssair_Done_condition;
	information = dia_Ass_127_Osair_HelpWithAssair_Done_info;
	permanent = FALSE;
	description = "Ohledně zlaté rudy, mistře...";
};

func int dia_Ass_127_Osair_HelpWithAssair_Done_condition()
{
	if((MIS_PW_GOLDSHAHT == LOG_Running) && (Npc_HasItems(other,ItMi_Osair_GoldNugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_HelpWithAssair_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_01");	//Ohledně zlaté rudy, mistře...
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_02");	//Ano? Čím mě můžeš potěšít?
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_03");	//Mám u sebe exemplář rudy, který jste chtěl.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_04");	//No, dej, ať se na něj podívám.
	B_GiveInvItems(other,self,ItMi_Osair_GoldNugget,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_05");	//Podle toho jak vypadá, je ta ruda opravdu bohatá na zlato.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_06");	//Myslím, že by stálo za to poslat tam pár otroků, aby to tam pročistili krumpáčem.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_07");	//Zlato navíc nikdy neuškodí.
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_08");	//Samozřejmě, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_09");	//Tak. Kde je ten lenoch Hoakin?
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_10");	//Ach, no jo, já ho vlastně poslal s dopisem k mistru Tiamantovi.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_11");	//Nevadí! Až se vrátí z chrámu, odveď jeho a pár otroků k té zlaté žíle.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_12");	//A dohlédni na to, aby je přinutil k práci.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_13");	//To je vše, nyní jdi.
	MIS_PW_GOLDSHAHT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PW_GOLDSHAHT,LOG_SUCCESS);
	B_LogEntry(TOPIC_PW_GOLDSHAHT,"Dal jsem kousek rudy mistru Osairovi. Vypadá to, že důl zanedlouho zůstane prázdný.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_127_Osair_DamnHoakin(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_DamnHoakin_condition;
	information = dia_Ass_127_Osair_DamnHoakin_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_DamnHoakin_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarBlameTiamant == TRUE) && (HoakinIsDead == TRUE) && (MIS_PW_FollowGoldOre == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_DamnHoakin_info()
{
	var C_Npc Slave_01;
	var C_Npc Slave_02;

	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);
	Slave_01.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_02.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_01");	//Á! Dobře, že jsi přišel.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_02");	//Můj posel, ten tupec Hoakin někam zmizel. Neviděl jsi ho náhodou?
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_01_03");	//Ne.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_04");	//Sakra! Nevadí, Beliar ho vem. No jestli bys ho náhodou potkal, řekni mu, ať se sem nevrací.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_05");	//Jinak z něj sedřu kůži zaživa a jeho hlavu nasadím na kůl!
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_06");	//Ohledně tebe, budeš muset sám odvést otroky do toho dolu.
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_01_07");	//To už jsem pochopil, mistře. Jednak tví otroci... ti tam budou úplně bez ochrany.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_08");	//Neboj se. Nikam neutečou. Z tohoto údolí se jen tak nedostanou.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_09");	//Takže je buď sežere divoká zvěř, nebo je najdou mí lidé a dopadnou ještě hůř, než kdyby je sežrala zvířata.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_10");	//Nemyslím si, že si troufnou na nějakou takovou pitomost.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_11");	//Vem tedy otroky a dostaň je do dolu. Zůstaň tam a já za pár dní pošlu své lidi.
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_01_12");	//Samozřejmě, mistře! Na mě se můžeš spolehnout.
	OsairWarriorWait = TRUE;
	MIS_PW_FollowGoldOre = LOG_Running;
	Log_CreateTopic(TOPIC_PW_FollowGoldOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Running);
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Když je Hoakin mrtvý, tak budu muset sám vzít otroky do zlatého dolu. A kromě toho budu muset čekat na lidi mistra Osaira, kteří přijdou do dolu za pár dní. No jo... smrt Hoakina mi nenahrála do karet.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SEK_186_SLAVEOBSSEK,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_387_SLAVEOBSSEK,"FollowGoldOre");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_01");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_02");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_03");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_04");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_05");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_07");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_08");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_09");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_11");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_12");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_13");
};

instance DIA_Ass_127_Osair_DamnHoakin_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_DamnHoakin_Done_condition;
	information = dia_Ass_127_Osair_DamnHoakin_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_DamnHoakin_Done_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((OsairInRage == TRUE) || (ConvoyGoldShahtDone == TRUE)))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_DamnHoakin_Done_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_01");	//No co? Jak to vypadá se zlatou šachtou?

	if(OsairInRage == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_02");	//Hmmm... problém je v tom, že potřebuji další otroky.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_03");	//A co se stalo s těmi, kteří šli s tebou?
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_04");	//No, nedostali se do dolu živí.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_05");	//Takže chceš říct, že jsou mrtví?
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_06");	//Ano přesně tak, mistře.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_07");	//No to je skvělé! A jak se ti to sakra mohlo stát?
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_08");	//Víš, nejsi o nic lepší než ten trouba Hoakin, jestli jsi je nechal jen tak zemřít.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_09");	//Tak mi dovol ti něco objasnit... Problém je v tom, že to byli MÍ OTROCI!
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_10");	//A jestli jsi je nemohl ochránit, budeš za to muset zaplatit!
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_11");	//Řekněmě, dva tisíce zlatých za každého otroka.
		Info_ClearChoices(DIA_Ass_127_Osair_DamnHoakin_Done);
		Info_AddChoice(DIA_Ass_127_Osair_DamnHoakin_Done,"Nemám dostatek zlata.",DIA_Ass_127_Osair_DamnHoakin_Done_None);

		if(Npc_HasItems(other,ItMi_Gold) >= 4000)
		{
			Info_AddChoice(DIA_Ass_127_Osair_DamnHoakin_Done,"Zde je vaše zlato, mistře.",DIA_Ass_127_Osair_DamnHoakin_Done_Yes);
		};
	}
	else if(ConvoyGoldShahtDone == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_12");	//Tví otroci už těží zlato, mistře.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_13");	//Skvělá zpráva! Jestli nám nikdo nepřekazí náš plán, tak budeme bohatší než samotný Zuben.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_14");	//Dobrá práce. Jsem velmi rád za tvé úspěchy.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_15");	//Tady, vem si tohle zlato za tvou práci.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_16");	//Děkuji ti, mistře.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_17");	//Nemusíš děkovat, zasloužíš si to.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_18");	//Stačí ale žvanění. Vypadá to, že mě čekají v chrámu. Myslím, že se dnes prolije krev.
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_19");	//Promiň mi, mistře. Co se stalo?
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_20");	//Mistr Haniar vyzval mistra Tiamanta na smrtelný duel, obvinil ho ze zrady bratrstva.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_21");	//Je to velmi vážné obvinění. No mistr Haniar není ten člověk, který se rozebírá falešnými obviněními.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_22");	//Pravděpodobně něco na mistra Tiamanta má. Něco velmi vážného!
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_23");	//A já, jako jeden z převorů, budu dělat soudce mezi nimi a potvrdím smrt jednoho z nich.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_24");	//Jestli tě to tak zajímá, bude nejlepší jít ke chrámu a vše uvidíš na vlastní oči.
		B_GiveInvItems(self,other,ItMi_PurseOsair,1);
		MIS_PW_FollowGoldOre = LOG_Success;
		Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Success);
		B_LogEntry(TOPIC_PW_FollowGoldOre,"Mistr Osair je rád, že zlatý důl začal produkovat zlato.");
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_125_Tiamant,"DeathMatch");
		Npc_ExchangeRoutine(Ass_126_Haniar,"DeathMatch");
		Npc_ExchangeRoutine(Ass_127_Osair,"DeathMatch");
		Npc_ExchangeRoutine(Ass_128_Nrozas,"DeathMatch");
		Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
	};
};

func void DIA_Ass_127_Osair_DamnHoakin_Done_None()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_None_01_01");	//Nemám tolik zlata. 
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_None_01_02");	//To nevadí. V tom případě zaplatíš vlastním životem!
	MIS_PW_FollowGoldOre = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_PW_FollowGoldOre);
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_127_Osair_DamnHoakin_Done_Yes()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_01");	//Tady je mé zlato, mistře.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_02");	//Už není tvoje - je TOTIŽ MOJE! A doufám, že si zapamatuješ tuto lekci.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_03");	//Příště totiž samotné zlato nebude stačit. Už se nevykoupíš.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_04");	//A teď se ztrať z mého dohledu!
	MIS_PW_FollowGoldOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Success);
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Mistr Osair zjistil, že jsou všichni otroci mrtví. Musel jsem zaplatit za jejich životy, abych ho nenaštval. Myslím, že příště nebudu pokoušet osud.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_125_Tiamant,"DeathMatch");
	Npc_ExchangeRoutine(Ass_126_Haniar,"DeathMatch");
	Npc_ExchangeRoutine(Ass_127_Osair,"DeathMatch");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"DeathMatch");
	Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
};

instance DIA_Ass_127_Osair_Poison(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Poison_condition;
	information = dia_Ass_127_Osair_Poison_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_Poison_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairSeekYou == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Poison_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_01");	//Hledal jsi mě, mistře?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_02");	//Tebe? Ach, ano. Stalo se tu něco zajimavého.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_03");	//Poslouchám.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_04");	//Hmm... Nedávno jsem se bavil s mistrem Nrozasem a ten náhodou řekl, že se mu povedlo udělat extrémně silný a rychle účinkující jed.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_05");	//Podle něj je ten jed tak silný, že by mohl zabít dokonce ohromného horního trola.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_06");	//Já osobně mu věřím, ale mistr Nrozas občas rád přechvaluje svoje činy.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_07");	//No, jestli je to, co říká pravda, tak bezpochyby bych u sebe chtěl mít nemalou část toho jedu.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_08");	//A proto potřebuji, aby někdo jako ty šel k mistru Nrozasovi a vyjasnil celou situaci.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_09");	//No a jestli se to povede, tak mi přines nemalou baňku toho jedu.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_10");	//A proč se mistra Nrozase nezeptáš sám, mistře?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_11");	//Poslední dobou začínáš zadávat příliš mnoho otázek. A většina z nich jsou absolutní hlouposti!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_12");	//Jestli bych se ho mohl zeptat sám, tak bych tě o to neprosil. Nebo ti to snad není jasné?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_13");	//Je mi to jasné. Půjdu tedy k němu a pokusím se pro tebe dostat ten jed.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_14");	//Tak to tak udělej. Dobře tedy, teď jdi. Promluvíme si o tom později.
	MIS_PW_PoisonNrozas = LOG_Running;
	Log_CreateTopic(TOPIC_PW_PoisonNrozas,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Running);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Mistr Osair chce, abych pro něj přinesl nový rychle účinkující jed, který připravil mistr Nrozas.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_Poison_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Poison_Done_condition;
	information = dia_Ass_127_Osair_Poison_Done_info;
	permanent = TRUE;
	description = "Ohledně mistra Nrozase, mistře...";
};

func int dia_Ass_127_Osair_Poison_Done_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Poison_Done_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_01_01");	//Ohledně mistra Nrozase, mistře...
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_01_02");	//Doufám, že máš nějaké novinky, ze kterých budu mít radost.
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);

	if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
	{	
		Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"Mám tu pro tebe baňku s jedem.",DIA_Ass_127_Osair_Poison_Done_Give);
	}
	else if(Npc_HasItems(other,ItMi_NrozasPoisonOsair) >= 1)
	{	
		Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"Mám tu pro tebe baňku s jedem.",DIA_Ass_127_Osair_Poison_Done_GiveLaw);
	};
	
	if(PlayerSafeFromNrozasNo == TRUE)
	{
		if(PlayerSafeFromNrozas == TRUE)
		{
			Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"Jeho jed už není tak dobrý.",DIA_Ass_127_Osair_Poison_Done_TellPoison);
		}
		else
		{
			Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"Nic zásadního.",DIA_Ass_127_Osair_Poison_Done_NoTellPoison);
		};
	};

};

func void DIA_Ass_127_Osair_Poison_Done_Give()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_01");	//Mám tu pro tebe baňku s jedem.
	B_GiveInvItems(other,self,ItMi_NrozasPoison,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_02");	//(šťastně) Aha. To znamená, že jsi odvedl tu nejlepší práci.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_03");	//Máš úplnou pravdu, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_04");	//No co už, tak když už mám tu šanci, vyzkouším jeho účinky.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_05");	//A kdyby něco, tak si pro mé lidi toho jedu objednám u mistra Nrozase mnohem více.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_06");	//Proč je pro tebe tak důležitý?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_07");	//Problém je v tom, že poslední expedice na ostrov se nám příliš nepovedla.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_08");	//Zdá se, že někdo ví o našich aktivitách na ostrově.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_09");	//Ten někdo zabil velký počet našich bratrů.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_10");	//A vypadá to, že to byl velmi důstojný protivník, když si tak lehko poradil s mými stíny.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_11");	//Nicméně s takovým jedem nás nebude moci překonat.
	OsairGetsNrozasPoison = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Dal jsem baňku s jedem mistru Osairovi. Ten byl šťastný kvůli práci, kterou jsem vykonal. I když on ani neví, že tu baňku jsem mu neměl v úmyslu dávat.");
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

func void DIA_Ass_127_Osair_Poison_Done_GiveLaw()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_01");	//Mám tu pro tebe baňku s jedem.
	B_GiveInvItems(other,self,ItMi_NrozasPoisonOsair,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_02");	//(šťastně) Aha. To znamená, že jsi odvedl tu nejlepší práci.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_03");	//Máš úplnou pravdu, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_04");	//No co už, tak když už mám tu šanci, vyzkouším jeho účinky.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_05");	//A kdyby něco, tak si pro mé lidi toho jedu objednám u mistra Nrozase mnohem více.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_06");	//Proč je pro tebe tak důležitý?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_07");	//Problém je v tom, že poslední expedice na ostrov se nám příliš nepovedla.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_08");	//Zdá se, že někdo ví o našich aktivitách na ostrově.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_09");	//Ten někdo zabil velký počet našich bratrů.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_10");	//A vypadá to, že to byl velmi důstojný protivník, když si tak lehko poradil s mými stíny.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_11");	//Nicméně s takovým jedem nás nebude moci překonat.
	OsairGetsNrozasPoisonLaw = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Dal jsem baňku s jedem mistru Osairovi. Ten byl šťastný kvůli práci, kterou jsem vykonal.");
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

func void DIA_Ass_127_Osair_Poison_Done_NoTellPoison()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_01");	//Nic zásadního.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_02");	//Vysvětli mi, co to znamená?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_03");	//Sám mistr Nrozas neví, jak moc dobrý je jeho jed.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_04");	//Ani jednou ještě nevyzkoušel jeho účinky.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_05");	//To mu není vůbec podobné. Mistr Nrozas se většinou neohání s prázdnými slovy.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_06");	//Každý jeho jed - je prostě umělecké dílo.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_07");	//(zamyšleně hledí) Zdá se mi, že jsi neřekl úplnou pravdu.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_08");	//Mimochodem, nepodařilo se ti aspoň sehnat vzorek toho elixíru?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_09");	//Ne, mistře. Mistr Nrozas mi při této prosbě nevyhověl.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_10");	//Řekl, že ti ten jed dá on sám, jen ho máš o to požádat osobně.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_11");	//Až tak?! Beliar vem mistra Nrozase!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_12");	//Měl jsem s tím elixírem velké plány, ale teď to vypadá, že je budu muset dát stranou.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_13");	//A v čem je vlastně problém?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_14");	//Problém je v tom, že poslední expedice na ostrov se nám příliš nepovedla.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_15");	//Zdá se, že někdo ví o našich aktivitách na ostrově.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_16");	//Ten někdo zabil velký počet našich bratrů.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_17");	//A vypadá to, že to byl velmi důstojný protivník, když si tak lehko poradil s mými stíny.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_18");	//Nicméně s takovým jedem nás nebude moci překonat.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_19");	//Chápu.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_20");	//No dobře. Budu si o tom muset promluvit s mistrem Nrozasem sám.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_21");	//Ale ber v potaz - jestli zjistím, že jsi mi lhal bude to na tebe.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_22");	//Dobrá, můžeš jít.
	OsairLiarNrozasPoison = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Lhal jsem mistru Osairovi. Řekl jsem, že mistr Nrozas mu dá jed osobně. A jestli se nepostarám o samotného mistra Nrozase, nastane můj konec, jakmile mistr Nrozas zjistí pravdu. Budu muset něco naléhavě vymyslet.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_Poison_Done_TellPoison()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_01");	//Jeho jed není tak dobrý, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_02");	//Vysvětli mi, co to znamená?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_03");	//Mohl jsem otestovat jeho účinky.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_04");	//Ten lektvar nezabil ani mladého trola.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_05");	//(zamyšleně) Říkáš pravdu?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_06");	//O tom nepochybuj, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_07");	//Takže mistr Nrozas přecenil hodnotu jeho nového vynálezu. 
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_08");	//No co už, tím hůře pro něj. Tohle pro něj bude lekce.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_09");	//I když jsem s ním měl jiné plány, ale vypadá to, že se s tím budu muset vypořádat.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_10");	//A v čem je problém?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_11");	//Problém je v tom, že poslední expedice na ostrov se nám příliš nepovedla.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_12");	//Zdá se, že někdo ví o našich aktivitách na ostrově.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_13");	//Ten někdo zabil velký počet našich bratrů.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_14");	//A vypadá to, že to byl velmi důstojný protivník, když si tak lehko poradil s mými stíny.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_15");	//Nicméně s takovým jedem by nás nemohl překonat.
	MIS_PW_PoisonNrozas = LOG_Success;
	OsairTellNrozasPoison = TRUE;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Zalhal jsem mistru Osairovi, a řekl mu, že jed od mistra Nrozase je neúčinný. Tahle novinka ho nemálo znepokojila.");
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

instance DIA_Ass_127_Osair_Portal(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Portal_condition;
	information = dia_Ass_127_Osair_Portal_info;
	permanent = FALSE;
	description = "Mohu se zúčastnit následující expedice?";
};

func int dia_Ass_127_Osair_Portal_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Portal_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Portal_01_01");	//Mohu se zúčastnit následující expedice?
	AI_Output(self,other,"DIA_Ass_127_Osair_Portal_01_02");	//Cením si tvé horlivosti. Ale tuhle otázku řeší jen mistr Haniar.
	AI_Output(self,other,"DIA_Ass_127_Osair_Portal_01_03");	//Jak řekne on, tak to i bude.
	AI_Output(other,self,"DIA_Ass_127_Osair_Portal_01_04");	//Dobrá.
};

instance DIA_Ass_127_Osair_GotoHram(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_GotoHram_condition;
	information = dia_Ass_127_Osair_GotoHram_info;
	permanent = FALSE;
	description = "Kdy hodláš jít do chrámu, mistře?";
};

func int dia_Ass_127_Osair_GotoHram_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Success) && (OsairLiarNrozasPoison == TRUE) && (OsairGotoHram == FALSE) && (OsairGetKill == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_GotoHram_01_01");	//Kdy hodláš jít do chrámu, mistře?
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_01_02");	//Jak znám mistra Nrozase, bude s ním lepší vyřešit problémy do oběda.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_01_03");	//Takže věřím, že zítra dopoledne tam budu.
	OsairGotoHram = TRUE;
	OsairGotoHramDay = Wld_GetDay();
};

instance DIA_Ass_127_Osair_GotoHram_Fail(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_GotoHram_Fail_condition;
	information = dia_Ass_127_Osair_GotoHram_Fail_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_GotoHram_Fail_condition()
{
	if(OsairGetKill == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_Fail_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_01");	//Byl jsem v chrámu. Měl jsem docela nepříjemný rozhovor s mistrem Nrozasem.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_02");	//Víš, nelíbí se mi, když mě má někdo za tupce!
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_03");	//A díky tomu vypadám v očích mých bratrů jako ještě větší hlupák!
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_04");	//Hmm... Zdá se mi, že tvá hlava bude pěknou dekorací pro mou jeskyni.
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_127_Osair_GotoHram_Ok(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_GotoHram_Ok_condition;
	information = dia_Ass_127_Osair_GotoHram_Ok_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_GotoHram_Ok_condition()
{
	if((OsairGoKill == TRUE) && (OsairGetKill == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_Ok_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_01");	//Co tu děláš? A koho to s sebou máš...?
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_02");	//Prokletý Beliar! Nevěřím svým očím. Gonzales!
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_03");	//To je mi setkání. Je to dlouho, co jsme se naposledy viděli... starý příteli.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_04");	//Zajímavé, co tu spolu děláte?
	AI_Output(other,self,"DIA_Ass_127_Osair_GotoHram_Ok_01_05");	//Myslím, že už jsi to pochopil.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_06");	//Samozřejmě! Přijde mi, že je to velmi příjemná shoda okolností.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_07");	//Až přinesu mistru Haniarovi jeho a tvou hlavu - bezesporu to bude můj triumf!
	AI_Output(other,self,"DIA_Ass_127_Osair_GotoHram_Ok_01_08");	//Fajn, tak to zkus.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_09");	//Jak myslíš...
	Info_ClearChoices(DIA_Ass_127_Osair_GotoHram_Ok);
	Info_AddChoice(DIA_Ass_127_Osair_GotoHram_Ok,Dialog_Ende,DIA_Ass_127_Osair_GotoHram_Ok_Exit);
};

func void DIA_Ass_127_Osair_GotoHram_Ok_Exit()
{
	var C_Npc Gonsales;

	Gonsales = Hlp_GetNpc(NONE_1190_Assasin);
	Gonsales.attribute[ATR_HITPOINTS] = Gonsales.attribute[ATR_HITPOINTS_MAX];
	PlayerIsPrioratFake = TRUE;
	OsairAttackMe = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(Gonsales,self,AR_KILL,1);
};

instance DIA_Ass_127_Osair_DualWeapon(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_DualWeapon_condition;
	information = DIA_Ass_127_Osair_DualWeapon_info;
	permanent = FALSE;
	description = "Chtěl bych poprosit o jeden recept na výrobu měsíční čepele.";
};

func int DIA_Ass_127_Osair_DualWeapon_condition()
{
	if(MIS_MoonBlades == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_DualWeapon_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_01");	//Chtěl bych poprosit o jeden recept na výrobu měsíční čepele.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_02");	//(zamyšleně hledí) Jak ses o tom dozvěděl?
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_03");	//Mistr Tiamant mi o tom řekl.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_04");	//(podrážděně) Dobře, ale nikomu o tom neříkej. Co se dá dělat, ten recept mám u sebe.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_05");	//Něco ti ještě povím: v mém mládém věku jsem tu legendární zbraň chtěl sestrojit sám.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_06");	//Ale narazil jsem na nevelký problém, který obrátil mé plány vzhůru nohama.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_07");	//Co to byl za problém?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_08");	//Problém je v měsíčním kameni, který je potřeba pro výrobu.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_09");	//Tato vzácná ruda, kterou není možné získat v neporušeném stavu.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_10");	//Dlouhá léta jsem strávil v jejím zkoumání, ale ani tak se mi nepovedlo získat jediný exemplář.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_11");	//Rád bych se podíval na ten recept.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_12");	//Nepodíváš. Já ti ten recept jen tak nedám.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_13");	//A co mám pro to udělat?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_14");	//Můžeš ho ode mě odkoupit nebo pro mě udělat nemalý úkol.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_15");	//A teprve potom dostaneš recept na výrobu měsíčních čepelí.
	B_LogEntry(TOPIC_MoonBlades,"Mistr Osair pravděpodobně má recept na výrobu měsíčních čepelí. Ale jen tak mi ho nedá. Můžu ho buď od něj koupit, nebo splnit jeden z jeho úkolů.");
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Kolik chceš za ten recept?",DIA_Ass_127_Osair_DualWeapon_Gold);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Co to je za úkol?",DIA_Ass_127_Osair_DualWeapon_Mission);
};

func void DIA_Ass_127_Osair_DualWeapon_Gold()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Gold_01_01");	//Kolik chceš za ten recept?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Gold_01_02");	//(usmívá se) Téměř nic. Dvacet tisíc zlatých.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Gold_01_03");	//Není to mnoho?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Gold_01_04");	//Vůbec ne. A hlavně, ty ten recept určitě chceš.
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);

	if(Npc_HasItems(other,ItMi_Gold) >= 20000)
	{
		Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Dobře. Tady je tvé zlato.",DIA_Ass_127_Osair_DualWeapon_Buy);
	}
	else
	{
		Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Nemám tolik zlata.",DIA_Ass_127_Osair_DualWeapon_NoGold);
	};
};

func void DIA_Ass_127_Osair_DualWeapon_Buy()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Buy_01_01");	//Dobře. Tady je tvé zlato.
	B_GiveInvItems(other,self,ItMi_Gold,20000);
	Npc_RemoveInvItems(self,ItMi_Gold,20000);
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Buy_01_02");	//Tak a recept je tvůj. Tady, vem si ho.
	B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
	B_LogEntry(TOPIC_MoonBlades,"Koupil jsem od mistra Osaira spis s receptem. Teď mi jen zbývá najít potřebné materiály.");
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
};

func void DIA_Ass_127_Osair_DualWeapon_NoGold()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_NoGold_01_01");	//Nemám tolik zlata.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_NoGold_01_02");	//Tak se bojím, že ti nepomůžu.
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Co je to za úkol?",DIA_Ass_127_Osair_DualWeapon_Mission);
};

func void DIA_Ass_127_Osair_DualWeapon_Mission()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Mission_01_01");	//Co je to za úkol?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_02");	//Problém je delikátní. Snad mě tedy chápeš.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Mission_01_03");	//Samozřejmě.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_04");	//Tak ti řeknu o co jde. Musíš zaručit podporu několika našich bratrů.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_05");	//Ale musíš to udělat tak, aby na tebe nepadlo žádné podezření.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_06");	//A já to sám udělat nemohu.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_07");	//Proto ten úkol navrhuji tobě. Jestli to zvládneš - spis s receptem je tvůj.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_08");	//Tak co na to říkáš?
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Dobře! Udělám to.",DIA_Ass_127_Osair_DualWeapon_Yes);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Ne, to není pro mě.",DIA_Ass_127_Osair_DualWeapon_No);
};

func void DIA_Ass_127_Osair_DualWeapon_No()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_No_01_01");	//Ne, to není pro mě.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_No_01_02");	//Dobře, jak myslíš. Najdu pro to někoho jiného.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_No_01_03");	//Ale na spis s receptem můžeš zapomenout. Nikdy ho nezískáš.
	B_LogEntry(TOPIC_MoonBlades,"Odmítl jsem nabídku od mistra Osaira. Teď mi nedá jeho spis.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_DualWeapon_Yes()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Yes_01_01");	//Dobře! Udělám to.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Yes_01_02");	//Skvěle. Tak toto jsou jména těch, s kým si musíš promluvit - Famid, Rafat, Nazim a Kudir.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Yes_01_03");	//Teď jdi. Doufám, že se ti vše povede.
	MIS_CareOsair = LOG_Running;
	Log_CreateTopic(TOPIC_CareOsair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CareOsair,LOG_Running);
	B_LogEntry(TOPIC_CareOsair,"Musím si promluvit se čtyřmi bratry Masyafu a zařídit jejich podporu pro mistra Osaira. Jejich jména jsou: Famid, Rafat, Nazim a Kudir.");
	B_LogEntry_Quiet(TOPIC_MoonBlades,"Abych svitek získal, budu muset pracovat pro mistra Osaira.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_391_Adept,"PW_FAMID");
	Wld_InsertNpc(Ass_392_Adept,"PW_RAFAT");
	Wld_InsertNpc(Ass_393_Adept,"PW_NAZIM");
	Wld_InsertNpc(Ass_394_Adept,"PW_KUDIR");
};

instance DIA_Ass_127_Osair_FinalHaniar(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_FinalHaniar_condition;
	information = DIA_Ass_127_Osair_FinalHaniar_info;
	permanent = FALSE;
	description = "Dostal jsem zprávu od mistra Haniara, mistře.";
};

func int DIA_Ass_127_Osair_FinalHaniar_condition()
{
	if(Npc_HasItems(other,ItWr_HaniarToOsair) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_FinalHaniar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_127_Osair_FinalHaniar_01_01");	//Dostal jsem zprávu od mistra Haniara, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_02");	//Dobrá, dej mi ji.
	AI_Output(other,self,"DIA_Ass_127_Osair_FinalHaniar_01_03");	//Tady.
	B_GiveInvItems(other,self,ItWr_HaniarToOsair,1);
	B_UseFakeScroll();
	Npc_RemoveInvItems(self,ItWr_HaniarToOsair,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_04");	//Skvělá zpráva! Už bylo na čase.
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_05");	//Řekni mistru Haniarovi, že souhlásím s jeho návrhem.
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_06");	//A pokus se s tím neloudat.
	OsairReadyMeeting = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_RafatNeedPermission(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_RafatNeedPermission_condition;
	information = DIA_Ass_127_Osair_RafatNeedPermission_info;
	permanent = FALSE;
	description = "Rafat se chce znovu modlit v chrámu.";
};

func int DIA_Ass_127_Osair_RafatNeedPermission_condition()
{
	if((MIS_CareOsair == LOG_Running) && (RafatNeedPermission == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_RafatNeedPermission_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_01");	//Rafat se chce znovu modlit v chrámu.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_02");	//(rozhořčeně) A co s tím mám dočinění?
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_03");	//Potřebuje povolení jednoho z mistrů, protože sám mistr Haniar mu to zakázal.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_04");	//Aha, už mi to je jasné!
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_05");	//A jestli dostane povolení právě od tebe, jeho oddanost k tobě nebude znát hranic.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_06");	//To je logické. Dobře, řekni Rafatovi, že mu dávám povolení.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_07");	//Jestli se ho mistr Haniar zeptá, může ho směle poslat ke mně.
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_08");	//Tak mu i řeknu.
	RafatGetPermission = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair dal povolení Rafatovi, aby se mohl modlit v chrámu. Myslím, že se to mistru Haniarovi líbit nebude.");
	AI_StopProcessInfos(self);
};

var int FazimAboutKnow;
var int NazimAboutKnow;
var int RafatAboutKnow;
var int KudirAboutKnow;
var int CareOsairCount;

instance DIA_Ass_127_Osair_CareOsair(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_CareOsair_condition;
	information = DIA_Ass_127_Osair_CareOsair_info;
	permanent = TRUE;
	description = "Ohledně nových lidí...";
};

func int DIA_Ass_127_Osair_CareOsair_condition()
{
	if(MIS_CareOsair == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_CareOsair_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_01_01");	//Ohledně nových lidí...
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_01_02");	//Nějaké novinky?
	Info_ClearChoices(DIA_Ass_127_Osair_CareOsair);

	Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Zatím ne.",DIA_Ass_127_Osair_CareOsair_NoNews);

	if((FazimAgreed == TRUE) && (FazimAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Famid je teď jeden z tvých lidí.",DIA_Ass_127_Osair_CareOsair_Fazim);
	}
	else if((FazimRefuseTalk == TRUE) && (FazimAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Nepodařilo se mi domluvit se s Famidem.",DIA_Ass_127_Osair_CareOsair_NoFazim);
	};
	if((RafatAgreed == TRUE) && (RafatAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Rafat souhlasil, že bude tvůj člověk.",DIA_Ass_127_Osair_CareOsair_Rafat);
	};
	if((NazimKnowAboutCave == TRUE) && (NazimAboutKnow == FALSE) && ((NazimPissOff == TRUE) || (NazimGetOutCave == TRUE) || (NazimStayInCave == TRUE)))
	{
		if((NazimPissOff == TRUE) || (NazimStayInCave == TRUE))
		{
			Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Nazim pro tebe nemůže pracovat, mistře.",DIA_Ass_127_Osair_CareOsair_NoNazim);
		}
		else if(NazimGetOutCave == TRUE)
		{
			Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Nazim je připraven pro tebe pracovat.",DIA_Ass_127_Osair_CareOsair_Nazim);
		};
	};
	if((KudirGetTrollPlant == TRUE) && (KudirAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Kudir se k tobě co nejdřívě přidá.",DIA_Ass_127_Osair_CareOsair_Kudir);
	}
	else if((KudirPissOff == TRUE) && (KudirAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Kudir odmítl tvou nabídku.",DIA_Ass_127_Osair_CareOsair_NoKudir);
	};
	if((FazimAboutKnow == TRUE) && (NazimAboutKnow == TRUE) && (RafatAboutKnow == TRUE) && (KudirAboutKnow == TRUE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Myslím, že jsem si promluvil se všemi.",DIA_Ass_127_Osair_CareOsair_AlDone);
	};
};

func void DIA_Ass_127_Osair_CareOsair_AlDone()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_AlDone_01_01");	//Myslím, že jsem si promluvil se všemi.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_AlDone_01_02");	//Co naše dohoda?

	if(CareOsairCount >= 3)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_03");	//No dobrá tedy, tvoje pomoc byla samozřejmě nedocenitelná.
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_04");	//Tady, vem si spis s receptem, jak jsme se domluvili.
		B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_05");	//Teď je tvůj.
		B_LogEntry(TOPIC_MoonBlades,"Mistr Osair mi dal spis s receptem. Teď mi zbývá jen najít potřebné materiály.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_06");	//Vždyť jsi pro mě ani pro půl toho spisu nepracoval!
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_07");	//Takže počítej s tím, že naše dohoda je u konce.
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_08");	//To je vše, rozhovor je ukončen.
		B_LogEntry(TOPIC_MoonBlades,"Mistr Osair si myslí, že jsem špatně pracoval. Bojím se, že mi teď ten spis nevydá.");
	};

	MIS_CareOsair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CareOsair,LOG_SUCCESS);
	B_LogEntry(TOPIC_CareOsair,"Promluvil jsem se všemi lidmi, kteří by mohli pomoct mistru Osairovi.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_CareOsair_NoNews()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNews_01_01");	//Zatím ne.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNews_01_02");	//Tak není se o čem bavit.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_CareOsair_Fazim()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Fazim_01_01");	//Famid je teď jeden z tvých lidí, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_02");	//Skvěle! Sice jsem o něm nepochyboval.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_03");	//(usmívá se) Ale odpověz mi na jednu otázku. Co tě stála jeho oddanost?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Fazim_01_04");	//Nemalou část zlata.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_05");	//To jsem si myslel. Ale taková oddanost je pro mě nadějná.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_06");	//Ale nemysli si, že budu uhrazovat tvé výdaje.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_07");	//Vše, co jsi udělal se týká jen tebe a nikoho jiného.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Fazim_01_08");	//Nic jiného jsem ani neočekával.
	CareOsairCount += 1; 
	FazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair je rád, že se Famid přidá k jeho lidem.");
};


func void DIA_Ass_127_Osair_CareOsair_NoFazim()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_01");	//Nemohl jsem se Famidem domluvit, mistře. 
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_02");	//To je zlé. Vypadá to, že jsi mu nenabídl výhodné služby a podmínky.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_03");	//Ten bastard myslí jen na zlato.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_04");	//To nevím. Ale určitě si uvědomuješ, že to není výmluva.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_05");	//Potřebuju výsledek a nezajímá mě, jak toho docílíš.
	FazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair nemá radost z toho, že se Famid nepřidá k jeho lidem.");
};

func void DIA_Ass_127_Osair_CareOsair_Rafat()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Rafat_01_01");	//Rafat souhlasil, že se stane tvým člověkem.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Rafat_01_02");	//Skvělá zpráva! Ale nic jiného jsem ani neočekával.
	CareOsairCount += 1; 
	RafatAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair se zaradoval Rafatovu rozhodnutí.");
};

func void DIA_Ass_127_Osair_CareOsair_Nazim()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Nazim_01_01");	//Nazim je připraven pro tebe pracovat.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Nazim_01_02");	//O tom rád slyším. Myslím, že jsi ho dlouho nepřemlouval, že?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Nazim_01_03");	//Byl připraven na vše, jen aby se mohl dostat z rudného dolu.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Nazim_01_04");	//Ano, samozřejmě.
	CareOsairCount += 1; 
	NazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistra Osaira obradostnila zpráva o tom, že Nazim pro něj bude pracovat.");
};

func void DIA_Ass_127_Osair_CareOsair_NoNazim()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_01");	//Nazim pro tebe nemůže pracovat, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_02");	//(nespokojeně) A v čem je problém?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_03");	//Hlídá rudný důl, nařídil mu to mistr Haniar.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_04");	//Mluvil jsem o tom s mistrem Haniarem, ale nepodařilo se mi ho přesvědčit o jeho propuštění.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_05");	//Aha - a v tomhle je problém? Dobrá, vyřeším sám jeho problém. 
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_06");	//Od tebe toho víc nepotřebuji.
	NazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair si sám poradí s Nazimem. Moji pomoc teď nepotřebuje.");
};

func void DIA_Ass_127_Osair_CareOsair_Kudir()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Kudir_01_01");	//Kudir se k tobě co nejrychleji připojí.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_02");	//Nikdy bych si nemyslel, že by s tím souhlasil.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_03");	//Jak se ti to podařilo?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Kudir_01_04");	//Dal jsem mu nabídku, kterou nemohl odmítnout.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_05");	//Vypadá to, že se umíš domluvit s lidmi. Je to cenný dar.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_06");	//A jestli toho umíš využít, můžeš toho mnoho dosáhnout.
	CareOsairCount += 1; 
	KudirAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair se divil, že se mi povedlo podmanit Kudira na jeho stranu.");
};

func void DIA_Ass_127_Osair_CareOsair_NoKudir()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_01");	//Kudir nesouhlasil s tvou nabídkou.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_02");	//Proč?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_03");	//Teď pracuje pro mistra Haniara a nechce zatím nic měnit.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_04");	//Tak on pracuje pro mistra Haniara? Hmmm... Co se dá dělat, to podstatně mění celou situaci.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_05");	//Dobrá, o zbytek se postarám sám. Můžeš zatím nechat Kudira být.
	KudirAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Osair se o Kudira postará sám.");
};

instance DIA_Ass_127_Osair_OsairPlans(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_OsairPlans_condition;
	information = DIA_Ass_127_Osair_OsairPlans_info;
	permanent = FALSE;
	description = "Proč potřebujete přesně tyto lidi, mistře?";
};

func int DIA_Ass_127_Osair_OsairPlans_condition()
{
	if((HaniarKnowsOsairPlans_01 == TRUE) && (MIS_OsairTrait == FALSE) && ((MIS_CareOsair == LOG_Running) || (MIS_CareOsair == LOG_Success)))
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_OsairPlans_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_OsairPlans_01_01");	//Proč potřebuješ přesně tyto lidi, mistře?
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairPlans_01_02");	//To by se tě týkat nemělo. Raději se starej o své věci.
};

instance DIA_Ass_127_Osair_Trait(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Trait_condition;
	information = dia_Ass_127_Osair_Trait_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_Trait_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Trait_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_01");	//Ach, jsi tady. Už jsem slyšel, co se stalo v chrámu.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_02");	//Nepamatuji si, že by někdy předtím adept porazil převora v boji.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_03");	//Vždycky se něco stává poprvé.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_04");	//(pozorně se dívá) Na první pohled vidím, že jsi docela neklidný.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_05");	//Proto mám pro tebe jednu nabídku.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_06");	//Poslouchám tě, mistře.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_07");	//Poslední dobou jsem se ujistil, že jsi pro bratrstvo výraznou osobností.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_08");	//Jestli to tak půjde dál, tak by ses mohl stát jedním z převorů Masyafu.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_09");	//A proto, až nastane ten čas, tak si chci být jistý, že takoví lidé jako ty budou na mé straně.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_10");	//Na co narážíš?
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_11");	//Věřím, že jsi to pochopil sám. Spolehliví a odhodlaní lidé jsou pro mě v ceně zlata.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_12");	//A co když odmítnu?
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_13");	//Tak nebudu mít na výběr. A nemůžu tak riskovat.
	Info_ClearChoices(DIA_Ass_127_Osair_Trait);
	Info_AddChoice(DIA_Ass_127_Osair_Trait,"Tak riskovat budete muset.",DIA_Ass_127_Osair_Trait_No);
	Info_AddChoice(DIA_Ass_127_Osair_Trait,"Raději budu na vaší straně.",DIA_Ass_127_Osair_Trait_Yes);
};

func void dia_Ass_127_Osair_Trait_No()
{
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_No_01_01");	//Tak riskovat budeš muset.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_No_01_02");	//Co se dá dělat, sám sis o to řekl. Zabijte ho!
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void dia_Ass_127_Osair_Trait_Yes()
{
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_01");	//Raději budu na tvé straně.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_02");	//Rozumné rozhodnutí, ó otče moudrousti. Slibuji ti, že nebudeš litovat.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_03");	//A co máš v plánu, mistře?
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_04");	//Poslední dobou se dějí v bratrstvu děsné věci.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_05");	//A zdá se mi, že mistr Haniar už je přeci jen starý, aby mohl mít vše pod kontrolou.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_06");	//Tobě se to nezdá?
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_07");	//Možná ano.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_08");	//Podle toho, co jsem řekl, myslím, že nastal čas udělat v bratrstvu pár změn.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_09");	//Vypadá to, že se to mistru Haniarovi moc líbit nebude.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_10");	//Samozřejmě... Bez krveprolití se tu neobejdeme.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_11");	//Chápu tvou zmatenost, ale věř mi, že tohle nebude poprvé. 
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_12");	//Proto budeme muset prolít tu starou krev za tu novou.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_13");	//To znamená, že hodláš zaútočit na chrám?
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_14");	//Bohužel, nemáme na výběr. Budeme to muset udělat, jestli tedy opravdu chceme zachránit bratrstvo.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_15");	//Mistra Haniara teď zradilo velké množství lidí, abychom tenhle problém vyřešili po dobrém.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_16");	//Proto jsi udělal správnou věc, že jsi souhlasil s mou nabídkou.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_17");	//Až nastane čas, tak ti, kteří mě nepodpořili teď - jednoduše zemřou.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_18");	//Jinak to ani být nemůže, mistře.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_19");	//Jsem vážně rád, že si tak rozumíme. Zatím se můžeš zabývat svými věcmi.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_20");	//Až tě budu potřebovat, dám ti vědět. 
	MIS_OsairTrait = LOG_Running;
	Log_CreateTopic(TOPIC_OsairTrait,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairTrait,LOG_Running);
	B_LogEntry(TOPIC_OsairTrait,"Vypadá to, že tato akce nabírá vysokých obratů. Mistra Osaira napadlo zaútočit na chrám a zabít mistra Haniara, a nejen to, chce mít pod kontrolou celé bratrstvo Masyaf! O tom musím co nejrychleji říct mistru Haniarovi. Ale měl bych to nejlépe udělat bez svědků.");
	AI_StopProcessInfos(self);
};