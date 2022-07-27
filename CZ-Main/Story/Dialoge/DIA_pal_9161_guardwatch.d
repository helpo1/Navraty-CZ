
instance DIA_PAL_9161_GUARDWATCH_EXIT(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 999;
	condition = dia_pal_9161_guardwatch_exit_condition;
	information = dia_pal_9161_guardwatch_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9161_guardwatch_exit_condition()
{
	return TRUE;
};

func void dia_pal_9161_guardwatch_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9161_GUARDWATCH_HALLO(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_hallo_condition;
	information = dia_pal_9161_guardwatch_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_hallo_condition()
{
	if(GRANTTOVARUS == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_hallo_info()
{
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_00");	//Stůj! (hrozivě) Ani o krok dál!
	if(PYROKARSENTTOHAGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_26");	//Nech mě slečinko! Mám naléhavou zprávu pro lorda Varuse jsem mág Ohně, služebínk boha Innose, tvého pána.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_27");	//Od nejvyššího mága Ohně? Hmmm... (překvapeně) Ale jestli lžeš, kámo?
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_29");	//Jsem posel Pyrokara.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_30");	//Tak jdi, ale jestli jsi lhal, tak tě stáhnu z kůže.
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_01");	//Kam si myslíš že jdeš?
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_02");	//A kam, že jdu?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_03");	//K lordovi Varusovi - vedoucímu posádky.
		if((MIS_PALADINFOOD == LOG_Running) && (HAGENSENTTOVARUS == TRUE))
		{
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_04");	//Mohu dovnitř?
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_05");	//A proč?
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_06");	//Mám zde příkaz od samotného velitele paladinů.
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_07");	//Příkaz od samotného lorda Hagena?
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_08");	//Samozřejmě, ještě mě chceš zadržovat nebo můžu projít?
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_09");	//Hmm... (zadumaně) Můžeš vejít!
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_10");	//Ale pamatuj, jestli budeš lorda Varuse obtěžovat, tak...
			AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_11");	//... já budu první, kdo tě naučí slušnému chování. Rozumíš?
			GRANTTOVARUS = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Hallo_01_13");	//Díky, budu na to myslet. A teď už můžu projít?
			if(other.guild == GIL_PAL)
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_14");	//No jelikož jsi jedním z nás můžeš jít, ale nedělej problémy.
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_15");	//Ale pamatuj jestli budeš lorda Varuse otravovat tak...
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_16");	//... já budu první kdo tě naučí slušnému chování. Rozumíš?
				GRANTTOVARUS = TRUE;
				AI_StopProcessInfos(self);
			}
			else if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_18");	//No protože jsi, jeden ze ctihodných služebníků Innose - tak můžeš jít.
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_19");	//Ale pamatuj mágu, jestli budeš dělat problémy tak...
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_20");	//... já budu první kdo tě naučí slušnému chování. Rozumíš?
				GRANTTOVARUS = TRUE;
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_22");	//Ne!
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_23");	//A jestli uděláš ještě jeden krok - přísahám Innosovi sejmu tě.
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_24");	//Tak radši nepokoušej osud.
				other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,"LGR_RATSHAUS_17");
				AI_StopProcessInfos(self);
			};
		};
	};
};


instance DIA_PAL_9161_GUARDWATCH_HALLOATTACK(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_halloattack_condition;
	information = dia_pal_9161_guardwatch_halloattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_halloattack_condition()
{
	if((GRANTTOVARUS == FALSE) && Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_hallo) && (Npc_GetDistToWP(hero,"LGR_RATSHAUS_17") <= (hero.aivar[AIV_LastDistToWP] - 20)) && ((HAGENSENTTOVARUS == FALSE) || (hero.guild != GIL_PAL) || (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_halloattack_info()
{
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloAttack_01_00");	//Myslím, že jsem tě varoval!
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloAttack_01_01");	//Můžeš si za to sám...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_9161_GUARDWATCH_HALLONOTATTACK(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_hallonotattack_condition;
	information = dia_pal_9161_guardwatch_hallonotattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_hallonotattack_condition()
{
	if((GRANTTOVARUS == FALSE) && Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_hallo) && ((PYROKARSENTTOHAGEN == TRUE) || (HAGENSENTTOVARUS == TRUE) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_hallonotattack_info()
{
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_00");	//Stůj! (hrozivě) Co tady zase děláš?
	if(PYROKARSENTTOHAGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_20");	//Nech mě slečinko! Mám naléhavou zprávu pro lorda Varuse, jsem mág Ohně.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_21");	//Od nejvyššího mága Ohně? Hmmm... (překvapeně) Ale jestli lžeš, kámo?
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_23");	//Jsem posel Pyrokara.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_24");	//Tak jdi, ale jestli jsi lhal, tak tě stáhnu z kůže!
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(HAGENSENTTOVARUS == TRUE)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_11");	//Mám pro něho příkaz od velitele paladinů.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_12");	//Příkaz od samotného lorda Hagena?!
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_13");	//Samozřejmě, ještě mě chceš zadržovat nebo můžu projít?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_14");	//Hmm... (zadumaně) můžeš vejít!
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_15");	//Ale pamatuj jestli budeš lorda Varuse obtěžovat tak...
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_16");	//... já budu první kdo tě naučí slušnému chování. Rozumíš?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_01");	//Jsem členem řádu paladinů, pustíš mě.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_02");	//No protože jsi jedním z nás, jdi.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_03");	//Ale pamatuj jestli budeš lorda Varuse otravovat...
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_04");	//... já budu první kdo tě naučí slušnému chování. Rozumíš?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_06");	//Jsem mág Ohně, pusť mě?
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_07");	//No protože jsi, jeden ze ctihodných služebníků Innose - tak můžeš jít.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_08");	//Ale pamatuj mágu, jestli budeš dělat problémy tak...
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_09");	//... já budu první kdo tě naučí slušnému chování. Rozumíš?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_18");	//Nic.
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_19");	//Tak vypadni!
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9161_GUARDWATCH_WHAT(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_what_condition;
	information = dia_pal_9161_guardwatch_what_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_pal_9161_guardwatch_what_condition()
{
	if(GRANTTOVARUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_what_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_What_01_00");	//Jak to jde?
	if(MIS_LANZRING == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pal_9161_GuardWatch_What_01_01");	//Vše v pohodě příteli, můžeš jít.
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,30);
	};
};


instance DIA_PAL_9161_GUARDWATCH_POST(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_post_condition;
	information = dia_pal_9161_guardwatch_post_info;
	permanent = FALSE;
	description = "Jsi vždycky tady na stanovišti?";
};


func int dia_pal_9161_guardwatch_post_condition()
{
	if(GRANTTOVARUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_post_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Post_01_01");	//Jsi vždycky tady na stanovišti?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Post_01_02");	//Skoro vždycky.
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_Post_01_03");	//A nikdy neodpočíváš?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Post_01_04");	//Ne, já nepotřebuju odpočinek... Innos mě dává sílu.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Post_01_05");	//A přestaň mě zdržovat od práce, radši něco dělej.
};


instance DIA_PAL_9161_GUARDWATCH_MISSGOLD(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_missgold_condition;
	information = dia_pal_9161_guardwatch_missgold_info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};


func int dia_pal_9161_guardwatch_missgold_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_post))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_missgold_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_01");	//Jsi v pořádku? Proč jsi tak mrzutý?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_02");	//Proč tě to zajímá?
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_05");	//Jen mi řekni, co se stalo a uvidíme.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_06");	//No... no, během jedné noční služby na východní zdi pevnosti, jsem omylem upustil svůj měšec.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_07");	//Zpočátku jsem chtěl jít dolů a sebrat ho, ale pak jsem si uvědomil, že nemůžu kvůli takové maličkosti, opustit svoje místo!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_08");	//A v čem je problém mohl jsi ho sebrat po službě.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_09");	//To je pravda, ale já prostě na to nemám čas. (podrážděně)
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_10");	//Z křoví vylezla nějaká potvora, vytrhla mě měšec a zdrhla směrem k pláži.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_11");	//Vystřelil jsem po ní z kuše, ale byla moc velká tma.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_12");	//Byl jsem rozčílenej ale zjistil jsem, že je to k ničemu.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_13");	//Nyní nemám klid, musím najít svůj měšec!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_14");	//A co v něm bylo tak cenné?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_15");	//Kromě několika zlatých, jsem tam měl prsten. Moc pro mě znamenal!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_16");	//Co to je za prsten?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_17");	//Je to můj milášek! Daroval mi ho lord Hagen, po bitvě se skřety v pustinách Varantu.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_18");	//Byli jsme pořád spolu nikdy jsme se nerozdělili! Až do toho večera... (lítostivě)
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_19");	//Rozumím. A jak já ti mohu pomoct?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_20");	//Pochopitelně. Stačí když najdeš můj měšec a doneseš mě ho.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_21");	//Nezáleží mi na měšci ani na zlaťácích, jde mi jen o miláška.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_22");	//Zlaťáky si můžeš nechat pro sebe.
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGold_01_23");	//Dobře podívám se po něm.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_24");	//Děkuju. Uděláš mě velkou radost jestli ho najdeš.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGold_01_25");	//A teď promiň, musím se věnovat službě.
	MIS_LANZRING = LOG_Running;
	Log_CreateTopic(TOPIC_LANZRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LANZRING,LOG_Running);
	B_LogEntry(TOPIC_LANZRING,"Strážce Glantz upustil měšec, zatímco střežil východní stěnu pevnosti. Nezáleží mu na měšci, ale jde mu o prsten, který mu dal, lord Hagen. Nabídl jsem mu pomoc. Tvor, který mu ukradl měšec, utekl směrem k písečné pláži.");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9161_GUARDWATCH_MISSGOLDDONE(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_missgolddone_condition;
	information = dia_pal_9161_guardwatch_missgolddone_info;
	permanent = FALSE;
	description = "Našel jsem miláška.";
};


func int dia_pal_9161_guardwatch_missgolddone_condition()
{
	if((MIS_LANZRING == LOG_Running) && (Npc_HasItems(other,itri_lanzring) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_missgolddone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_01");	//Našel jsem miláška.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_02");	//(nedůvěřivě) Ukaž.
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_03");	//Podívej. Je to on?
	B_GiveInvItems(other,self,itri_lanzring,1);
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_04");	//Ano! To je milášek... (šťastně) Nemůžu uvěřit, že jsme opět spolu!
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_05");	//Myslím, že teď se už nemáš čeho bát.
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_MissGoldDone_01_06");	//Děkuji, příteli.
	MIS_LANZRING = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LANZRING,LOG_SUCCESS);
	B_LogEntry(TOPIC_LANZRING,"Vrátil jsem Glantzovi prsten.");
};


instance DIA_PAL_9161_GUARDWATCH_RAYNEHELP(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_raynehelp_condition;
	information = dia_pal_9161_guardwatch_raynehelp_info;
	permanent = FALSE;
	description = "Mohl bys pomoci Rayneovi ve skladě?";
};


func int dia_pal_9161_guardwatch_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_raynehelp_info()
{
	AI_Output(other,self,"DIA_Pal_9161_GuardWatch_RayneHelp_01_00");	//Mohl bys pomoci Rayneovi ve skladě?
	AI_Output(self,other,"DIA_Pal_9161_GuardWatch_RayneHelp_01_01");	//A jak si to představuješ? (podrážděně) Teď si odšlápnu svoji šichtu a pak půjdu pomáhat tomu chudákovi!
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Zdá se, že jen marním čas - žádný z paladinů není nakloněn myšlence Rayneovi pomoct. Možná bych měl zvolit poněkud drastičtější přístup...");
	};
};


