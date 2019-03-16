
var int Lothar_ImOV;

instance DIA_Lothar_EXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lothar_EXIT_Condition()
{
	if(Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_FirstEXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lothar_FirstEXIT_Condition()
{
	if(Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_FirstEXIT_Info()
{
	AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_00");	//Musím jít!

	if(Lothar_Regeln == FALSE)
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//Počkej! Ještě neznáš městské zákony!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//Později.
		AI_StopProcessInfos(self);
	}
	else
	{
		if((Player_TalkedAboutDragons == TRUE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW)))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//Ještě JEDNOU uslyším, že lidem vyprávíš o dracích, a budeš mít velké problémy. Vyjádřil jsem se jasně?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//Dokud jsi v Khorinisu, jsi v bezpečí.

			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//Na město teď dohlížejí královští paladinové!
			};
		};

		Lothar_ImOV = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
	if(Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine(Canthar,"START");
		Canthar_InStadt = TRUE;
	};
	if((LesterGoXar == FALSE) && (LesterCanGoXar == TRUE))
	{
		Npc_ExchangeRoutine(PC_Psionic,"XARDAS");
		LesterGoXar = TRUE;
	};
};

instance DIA_Lothar_Hallo(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Hallo_Condition;
	information = DIA_Lothar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lothar_Hallo_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//Stůj, cizinče!

	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW)))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//Neviděl jsem tě procházet branou.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//A?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//A stráže u druhé brány mají zákaz vpouštět do města neznámé osoby.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//Nooooooo...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//Budu si s těma dvěma muset promluvit!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//Ale mezi námi:
		CITYGATEACCESSGRANTED = TRUE;
		Mil_333_schonmalreingelassen = TRUE;
		Mil_310_schonmalreingelassen = TRUE;
		MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
	}
	else
	{
		LotarTrueCome = TRUE;
	};

	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//Jsem Lothar. Královský paladin a skromný služebník Innose, tvého Pána.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//Náš velitel, lord Hagen, mě pověřil úkolem vysvětlit všem příchozím nové zákony města, které se vztahují na všechny zdejší obyvatele.
	AI_Output(self,other,"DIA_Addon_Lothar_Hallo_01_00");	//Už nějakou dobu lidě ve městě mizí. Dávej si bacha, ať tak taky neskončíš.
};


instance DIA_Lothar_MESSAGE(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_MESSAGE_Condition;
	information = DIA_Lothar_MESSAGE_Info;
	permanent = FALSE;
	description = "Mám důležitý vzkaz pro velitele paladinů!";
};


func int DIA_Lothar_MESSAGE_Condition()
{
	if((Mil_305_schonmalreingelassen == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//Mám důležitý vzkaz pro velitele paladinů!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//Ctihodný lord Hagen nikoho nepřijímá.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//Za všechny věci týkající se běžných občanů je zodpovědný lord Andre, velitel městské stráže.
};


instance DIA_Lothar_EyeInnos(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_EyeInnos_Condition;
	information = DIA_Lothar_EyeInnos_Info;
	permanent = FALSE;
	description = "Přišel jsem si pro Innosovo oko!";
};


func int DIA_Lothar_EyeInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_EyeInnos_Info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//Přišel jsem si pro Innosovo oko!

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//Oko spadá pod rozhodnutí lorda Hagena. Promluv si s ním.
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//Posvátné Innosovo oko! Jak to, že o něm víš?! Nejsi členem našeho řádu!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//Řekl mi o něm jeden mág.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//Netuším, co tím zamýšlel, když ti svěřil jedno z tajemstvích našeho řádu...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//... ale určitě nechtěl, abys na něj právě TY vztáhl ruku.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//Ale...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//Už o tom nechci slyšet!
		if(Player_TalkedAboutDragons == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//Nejdřív začneš s báchorkami o dracích, a teď tohle - neuvěřitelné!
		};
	};
};


instance DIA_Lothar_Dragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Dragons_Condition;
	information = DIA_Lothar_Dragons_Info;
	permanent = FALSE;
	description = "Poslouchej - město ohrožují draci!";
};


func int DIA_Lothar_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Dragons_Info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//Poslouchej - město ohrožují draci!

	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//To není možné!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//Další šílenec!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//Už takhle máme ve městě dost nepokojů. Nepotřebujeme žádného troubu, který bude děsit lid povídačkami o dracích!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//Posledního člověka, který si takovéhle věci vymýšlel, jsem dal okamžitě zavřít a poslat do Hornického údolí s vězeňským transportem. Takže pozor na jazyk!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//Nepotřebujeme nikoho, kdo by nám mezi lidmi šířil paniku!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//Hodně jsem o tom slyšel. Ale těžko tomu uvěřit.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//Bude lepší, když si to necháš pro sebe. Musíme předejít tomu, aby se mezi lidem šířil strach a panika.
	};
	Player_TalkedAboutDragons = TRUE;
};


instance DIA_Addon_Lothar_Ornament(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Addon_Lothar_Ornament_Condition;
	information = DIA_Addon_Lothar_Ornament_Info;
	description = "Víš něco o té věci, která byla v kamenném kruhu za Lobartovou farmou?";
};


func int DIA_Addon_Lothar_Ornament_Condition()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_15_00");	//Víš něco o té věci, která byla v kamenném kruhu za Lobartovou farmou?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_01");	//Jistě, že ano. Zničili jsme ji. Znepokojovala blízké farmáře.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_02");	//Proč se ptáš?
	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
	Info_AddChoice(DIA_Addon_Lothar_Ornament,"Hledám kovový úlomek z kruhového ornamentu.",DIA_Addon_Lothar_Ornament_suche);
	Info_AddChoice(DIA_Addon_Lothar_Ornament,"Shledáváš to normální?",DIA_Addon_Lothar_Ornament_normal);
};

func void DIA_Addon_Lothar_Ornament_normal()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_00");	//Shledáváš to normální?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_01");	//Myslíš to kamenné monstrum?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_02");	//Pokud vím, tak tím se zabývají mágové Vody.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_03");	//Nechci o tom vědět víc. My se zajímáme zde o město a o Hornické údolí.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_04");	//Dobrá.
};

func void DIA_Addon_Lothar_Ornament_suche()
{
	AI_Output(other,self,"DIA_Addon_Lord_Hagen_GiveOrnament_15_00");	//Hledám kovový úlomek z kruhového ornamentu. Měl být někde u kamenného kruhu blízko Lobartovy farmy.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_01");	//Pokud myslíš tohle... Mysleli jsme, že by to mohla být magická runa, ale je to bezcenné.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_02");	//Pro mě za mě si ho vem. Stejně je k ničemu!
	CreateInvItems(self,ItMi_Ornament_Addon,1);
	B_GiveInvItems(self,other,ItMi_Ornament_Addon,1);
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
};


instance DIA_Lothar_WhoDragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_WhoDragons_Condition;
	information = DIA_Lothar_WhoDragons_Info;
	permanent = FALSE;
	description = "Někdo už o přítomnosti draků mluvil?";
};


func int DIA_Lothar_WhoDragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WhoDragons_Info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//Někdo už o přítomnosti draků mluvil?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//Ano. Ten chlapík se jmenoval Diego. Alespoň myslím...


	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(výhrůžně) Varoval jsem ho - zrovna jako tebe! Ale ten blázen si nedal pokoj a pořád otravoval!
	};
};


instance DIA_Lothar_Regeln(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_Regeln_Condition;
	information = DIA_Lothar_Regeln_Info;
	permanent = FALSE;
	description = "Dobrá - vysvětli mi zákony města!";
};


func int DIA_Lothar_Regeln_Condition()
{
	return TRUE;
};

func void DIA_Lothar_Regeln_Info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(s mírným povzdechem) Dobrá - vysvětli mi zákony města!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//Za prvé: Ctihodný paladin lord Hagen bydlí se svými jednotkami v horní čtvrti.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//Proto tam mají přístup pouze ctihodní občané.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//Za druhé: V radnici v horní čtvrti je teď velitelství paladinů. Mají do ní přístup pouze samotní paladinové a členové domobrany.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//A za třetí: Každý, kdo je obviněný z nějakého zločinu, se musí dostavit k veliteli domobrany.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//Nějaké otázky?
	Lothar_Regeln = TRUE;
};


instance DIA_Addon_Lothar_MissingPeople(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Addon_Lothar_MissingPeople_Condition;
	information = DIA_Addon_Lothar_MissingPeople_Info;
	description = "Obyvatelé města mizí?";
};


func int DIA_Addon_Lothar_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == FALSE) && Npc_KnowsInfo(other,DIA_Lothar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_MissingPeople_15_00");	//Obyvatelé města mizí?
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_01");	//Ano a zdá se, že čím dál častěji.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_02");	//Je až mrzuté, že domobrana nebyla schopna tuto záhadu vyřešit.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_03");	//Je pochopitelné, že obyvatelé města jsou velmi nedůvěřiví k cizincům.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_04");	//Tak ve městě na sebe zbytečně neupoutávej pozornost, chápeš?
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};
	SC_HearedAboutMissingPeople = TRUE;
};


instance DIA_Lothar_HowCitizen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 4;
	condition = DIA_Lothar_HowCitizen_Condition;
	information = DIA_Lothar_HowCitizen_Info;
	permanent = FALSE;
	description = "Jak se mohu JÁ stát občanem města?";
};


func int DIA_Lothar_HowCitizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_HowCitizen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//Jak se mohu JÁ stát občanem města?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//Za občany města jsou považováni jen ti, kdo mají stálé zaměstnání!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//Ale neřekl bych, že by k setkání s lordem Hagenem stačilo být občanem města!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//Jako občan máš přístup do horní čtvrti, nic víc!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//Na radnici můžeš být vpuštěn jen v případě, že se staneš členem domobrany!
};


instance DIA_Lothar_WoArbeit(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Lothar_WoArbeit_Condition;
	information = DIA_Lothar_WoArbeit_Info;
	permanent = FALSE;
	description = "Kde bych mohl najít práci?";
};


func int DIA_Lothar_WoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_HowCitizen) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoArbeit_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//Kde bych mohl najít práci?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//Musíš se přihlásit jako učedník k jednomu z mistrů tady v dolní čtvrti.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//Jakmile tě mistr přijme, stane se z tebe občan.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//Musí s tím ale souhlasit i ostatní mistři, tak velí zvyk tady v Khorinisu.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//Pokud sis pohrával s myšlenkou, že najdeš nějakou práci v přístavu, tak na to zase rychle zapomeň!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//Žije tam spodina. Ani tam nechoď, nebo toho budeš litovat!
};


instance DIA_Lothar_ToOV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 6;
	condition = DIA_Lothar_ToOV_Condition;
	information = DIA_Lothar_ToOV_Info;
	permanent = FALSE;
	description = "Jak se dostanu do horní čtvrti?";
};


func int DIA_Lothar_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToOV_Info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//Jak se dostanu do horní čtvrti?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//No tak, posloucháš mě vůbec?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//Nejsi občanem tohoto města. Můžeš si tu zacházku ušetřit - stráže tě dovnitř nepustí.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//Do celé té oblasti za vnitřní branou máš vstup zakázán!
};


instance DIA_Lothar_ToMiliz(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToMiliz_Condition;
	information = DIA_Lothar_ToMiliz_Info;
	permanent = FALSE;
	description = "Jak se mohu přidat k domobraně?";
};


func int DIA_Lothar_ToMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToMiliz_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//Jak se mohu přidat k domobraně?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//Na příkaz lorda Hagena mohou do domobrany vstoupit jen občané města.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//Aha.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//Pokud by ses chtěl dozvědět něco víc, promluv si v kasárnách s lordem Andrem.
};


instance DIA_Lothar_ToPaladins(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToPaladins_Condition;
	information = DIA_Lothar_ToPaladins_Info;
	permanent = FALSE;
	description = "Co musím udělat, abych měl takovou zbroj jako ty?";
};


func int DIA_Lothar_ToPaladins_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_ToMiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM) && (hero.guild != GIL_SEK) && (hero.guild != GIL_TPL) && (hero.guild != GIL_GUR))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToPaladins_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//Co musím udělat, abych měl takovou zbroj jako ty?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(křičí) Cože? Vždyť ani nejsi členem domobrany!
	};
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//Nejsi dokonce ani OBČAN!
	};

	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//Jak tě může vůbec napadnout, že bys mohl nosit zbroj PALADINA?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//Tuhle čest si vysloužilo jen několik málo členů domobrany, a to za své neobyčejně odvážné skutky.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(stroze) Pokud by ses chtěl stát paladinem, máš před sebou hodně dlouhou cestu, chlapče!
};


instance DIA_Lothar_WoAndre(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 8;
	condition = DIA_Lothar_WoAndre_Condition;
	information = DIA_Lothar_WoAndre_Info;
	permanent = FALSE;
	description = "Kde najdu velitele městské stráže?";
};


func int DIA_Lothar_WoAndre_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lothar_Regeln) || Npc_KnowsInfo(other,DIA_Lothar_MESSAGE)) && (Andre.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoAndre_Info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//Kde najdu velitele městské stráže?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//Lord Andre sídlí v kasárnách na druhém konci města.
};


instance DIA_Lothar_Schlafen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 9;
	condition = DIA_Lothar_Schlafen_Condition;
	information = DIA_Lothar_Schlafen_Info;
	permanent = FALSE;
	description = "Kde mohu strávit noc?";
};


func int DIA_Lothar_Schlafen_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Schlafen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//Kde mohu strávit noc?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//Pokud hledáš nocleh, jdi do hotelu přímo naproti kasárnám.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//Paladinové platí za ubytování všech poutníků, kteří do města přijdou.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//Najdeš zde také všechny potulné kupce z tržiště.
};


instance DIA_Lothar_PermB4OV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PermB4OV_Condition;
	information = DIA_Lothar_PermB4OV_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lothar_PermB4OV_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Mil_305_schonmalreingelassen == FALSE) && (Lothar_Regeln == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_PermB4OV_Info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//O všem ostatním si už můžeš promluvit s lordem Andrem!
	AI_StopProcessInfos(self);
};

func void B_Lothar_Blubb()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_00");	//Ale já se MUSÍM setkat s lordem Hagenem!
	AI_Output(self,other,"DIA_Lothar_Add_01_45");	//Jak vidím, tak tě přijal do domobrany.
	AI_Output(self,other,"DIA_Lothar_Add_01_46");	//Hm - určitě ví, co dělá.
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//Kolik je tady mistrů?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//Pokud vím, je jich dohromady pět.
	AI_Output(self,other,"DIA_Lothar_Add_01_62");	//Hele, neřekl jsem to snad dost jasně? Už žádné povídačky o dracích!
	AI_Output(other,self,"DIA_Lothar_Add_15_63");	//Jak víš...?
	AI_Output(self,other,"DIA_Lothar_Add_01_64");	//Do TOHO ti nic není!
	AI_Output(self,other,"DIA_Lothar_Add_01_65");	//To bylo naposledy, rozumíme si?!
	AI_Output(other,self,"DIA_Lothar_Add_15_66");	//Kde najdu velitele domobrany?
	AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Jsem teď učedník jednoho ze zdejších mistrů!
	AI_Output(self,other,"DIA_Lothar_Add_01_47");	//Zase ty.
	AI_Output(self,other,"DIA_Lothar_Add_01_43");	//Slyšel jsem, že ses setkal s lordem Andrem?
	AI_Output(self,other,"DIA_Lothar_Add_01_44");	//Říkal jsem ti snad, že k domobraně se můžeš přidat jen v případě, že jsi občanem města.
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//Oznámil jsem lordu Hagenovi, že s ním chceš mluvit.
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//A? Co říkal?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//Nikdy o tobě neslyšel.
	AI_Output(other,self,"DIA_Lothar_Add_15_51");	//Samozřejmě, že ne. Řekl jsi mu o těch dracích?
	AI_Output(self,other,"DIA_Lothar_Add_01_52");	//Copak jsem ti neřekl, abys s těmi povídačkami PŘESTAL?!
	AI_Output(self,other,"DIA_Lothar_Add_01_12");	//Slyšel jsem, že už máš souhlas několika mistrů.
	AI_Output(self,other,"DIA_Lothar_Add_01_13");	//Bereš to docela vážně, co?
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//Musíš dodržovat pravidla, stejně jako kdokoliv jiný!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//Lord Hagen nemá čas.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//Pokud máš na srdci něco PODSTATNÉHO, jdi za lordem Andrem. On ti pomůže!
};


instance DIA_Lothar_HelloAgain(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_HelloAgain_Condition;
	information = DIA_Lothar_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_HelloAgain_Condition()
{
	if(Mil_305_schonmalreingelassen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//Aaa! Zase ty!
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//Takže se ti nakonec podařilo dostat se do horní čtvrti!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//Kde jsi vzal to roucho?
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//Prošel jsem Zkouškou Ohně.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//Neuvěřitelné. V tom případě to, co se tu děje, musí být Innosova vůle...
	};
	if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_3A");	//Kde jsi vzal to roucho?
		AI_Output(other,self,"DIA_Lothar_Add_15_3B");	//Nyní jsem mág Vody, jak sis již mohl všimnout.
		AI_Output(self,other,"DIA_Lothar_Add_01_3C");	//Neuvěřitelné. Asi to bude Adanova vůle...
	};
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_3D");	//KDE jsi vzal to roucho?
		AI_Output(other,self,"DIA_Lothar_Add_15_3E");	//Nyní jsem nekromant, jak sis již mohl všimnout.
		AI_Output(self,other,"DIA_Lothar_Add_01_3F");	//Neuvěřitelné!
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_3J");	//Kde jsi vzal to roucho?
		AI_Output(other,self,"DIA_Lothar_Add_15_3H");	//Byl jsem přijat do Bratrstva sektářů.
		AI_Output(self,other,"DIA_Lothar_Add_01_3I");	//Á... Ti šílení sektáři. Ale co bychom mohli od tebe čekat, že? (směje se)
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_39");	//Nepřidal ses k Onarovým žoldákům, že ne?
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//Jak ses sem dostal?
		AI_Output(other,self,"DIA_Lothar_Add_15_41");	//Přináším nabídku příměří od Leeho...
		AI_Output(self,other,"DIA_Lothar_Add_01_42");	//Pche! Lord Hagen s tím nikdy nebude souhlasit.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//Musíš tady dbát na některé věci, jinak odsud poletíš stejně rychle, jako ses sem dostal.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//Vstup máš povolen jen do budov obchodníků. Poznáš je podle znamení nade dveřmi - to jen aby nedošlo k nějakým nedorozuměním.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//Ostatní budovy patří významným občanům - tam nemáš co pohledávat!
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//Nic na tom nemění, že teď jsi členem Innosova řádu.
	};
	if((other.guild == GIL_KDW) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_0A");	//Dokonce i když jsi mág!
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//Jakožto člen domobrany máš také povolen přístup do prostor paladinů.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//Svoje ubikace máš ale pořád v kasárnách.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//V téhle čtvrti žijí významní občané města. Chovej se k nim tedy s náležitou úctou.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//Rozumíme si?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//Jasně.
};


instance DIA_Lothar_Hagen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_Hagen_Condition;
	information = DIA_Lothar_Hagen_Info;
	permanent = TRUE;
	description = "Kde najdu lorda Hagena?";
};


func int DIA_Lothar_Hagen_Condition()
{
	if((Mil_305_schonmalreingelassen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hagen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//Kde najdu lorda Hagena?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//Je v radnici, na konci horní čtvrti.
	AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//Pokud ale nemáš dobrý důvod, tak tě tam stejně nikdo nepustí.
};


instance DIA_Lothar_OWRunning(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunning_Condition;
	information = DIA_Lothar_OWRunning_Info;
	permanent = FALSE;
	description = "Byl jsem si promluvit s lordem Hagenem.";
};


func int DIA_Lothar_OWRunning_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Npc_HasItems(hero,ItWr_PaladinLetter_MIS) == 0))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunning_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//Byl jsem si promluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//A? Nesnažil ses ho obtěžovat s těmi báchorkami o dracích, že ne?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//Přesně to jsem udělal.
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//To snad nemůže být pravda...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//Poslal mě sehnat nějaké důkazy...
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//V tom případě hodně štěstí. (pro sebe) Blázne...
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_OWRunningBrief(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunningBrief_Condition;
	information = DIA_Lothar_OWRunningBrief_Info;
	permanent = FALSE;
	description = "Mám důkaz! Tady je dopis od velitele Garonda!";
};


func int DIA_Lothar_OWRunningBrief_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Npc_HasItems(hero,ItWr_PaladinLetter_MIS) > 0))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunningBrief_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//Mám důkaz! Tady je dopis od velitele Garonda!
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//Takže ti draci nejsou výmysl?
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//Křivdil jsem ti. Budu se modlit k Innosovi, aby mi odpustil mé chování.
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_PERM(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PERM_Condition;
	information = DIA_Lothar_PERM_Info;
	permanent = TRUE;
	description = "Stalo se v poslední době něco zajímavého?";
};


func int DIA_Lothar_PERM_Condition()
{
	if((Mil_305_schonmalreingelassen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_PERM_Info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//Stalo se v poslední době něco zajímavého?
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//Ano - že sem vpustili někoho, jako jsi TY. Něco takového se nestalo už celé věky!
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//Ty bys to měl vědět nejlíp. Jako člen městské stráže musíš dohlížet na pořádek a dodržování zákona!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//Ne.
	};
};


instance DIA_Lothar_PICKPOCKET(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 900;
	condition = DIA_Lothar_PICKPOCKET_Condition;
	information = DIA_Lothar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lothar_PICKPOCKET_Condition()
{
	return C_Beklauen(56,95);
};

func void DIA_Lothar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
	Info_AddChoice(DIA_Lothar_PICKPOCKET,Dialog_Back,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lothar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

