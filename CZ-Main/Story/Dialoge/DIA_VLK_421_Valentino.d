
instance DIA_Valentino_EXIT(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 999;
	condition = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Valentino_HALLO(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 1;
	condition = DIA_Valentino_HALLO_Condition;
	information = DIA_Valentino_HALLO_Info;
	permanent = FALSE;
	description = "Takže copak to tu máme?";
};


func int DIA_Valentino_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Takže copak to tu máme?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Jmenuji se Valentino. Snažím se, abych tento den, který mi Innos dal, neznesvětil žádnou prací.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Dávej pozor na to, co říkáš.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Ach, omluv mě. Nechtěl jsem Tvou Milost nijak urazit, ó, prosím za odpuštění, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Copak se neumíš chovat? To je nechutné!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Pořád tahle špinavá chátra! Nemáš být náhodou někde v práci?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Ale počítám, že takového ošuntělého chlápka jako ty si každý všimne, co?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//No, až budeš mít tolik zlata jako já, taky nebudeš muset vůbec pracovat. Ale ty nikdy takhle bohatý nebudeš.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Vidím, že s tebou si užiju pořádnou srandu.
	};
};


instance DIA_Valentino_WhoAgain(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 2;
	condition = DIA_Valentino_WhoAgain_Condition;
	information = DIA_Valentino_WhoAgain_Info;
	permanent = FALSE;
	description = "Ptal jsem se tě, kdo jsi!";
};


func int DIA_Valentino_WhoAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (other.guild != GIL_KDM) && (VALENTINOCANJOINPSI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Ptal jsem se tě, kdo jsi!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Jsem švihák Valentino. Bonviván a miláček žen!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Trápení neznám, však moudrostí a zlatem oplývám a ženy mi padají k nohám, sotva mne spatří.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Jestli máš problémy, nech si je pro sebe, já je nepotřebuju.
};


instance DIA_Valentino_Manieren(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 3;
	condition = DIA_Valentino_Manieren_Condition;
	information = DIA_Valentino_Manieren_Info;
	permanent = FALSE;
	description = "Zdá se mi, že bych ti měl uštědřit menší lekci slušného chování!";
};


func int DIA_Valentino_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF) && (other.guild != GIL_KDW) && (other.guild != GIL_KDM) && (VALENTINOCANJOINPSI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Zdá se mi, že bych ti měl uštědřit menší lekci slušného chování!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Mně to nevadí. Jen si mne klidně zbij. Až se zítra ráno probudím, zase mi bude dobře.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Ale ty s tímhle ksichtem budeš muset chodit celý život.
};


var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;

instance DIA_Valentino_WASNUETZLICHES(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 4;
	condition = DIA_Valentino_WASNUETZLICHES_Condition;
	information = DIA_Valentino_WASNUETZLICHES_Info;
	permanent = TRUE;
	description = "Chceš mi říci ještě něco jiného?";
};


func int DIA_Valentino_WASNUETZLICHES_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (VALENTINOCANJOINPSI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(klidně) Chceš mi říci ještě něco jiného?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if((Valentino_Lo_Perm == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Získej si věhlas, nikdy nikomu nic neslibuj, ber si, co chceš, a dávej si pozor, aby ses nedostal do sporu s domobranou.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Nebo se žárlivými manželi, samozřejmě - ti jsou ze všech nejhorší, to ti povím.
		Valentino_Lo_Perm = TRUE;
	}
	else if((Valentino_Hi_Perm == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//Pro muže tvého postavení není nic nemožné. Prostě jen musíš poznat, kdy je čas k činu.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Tak neztrácej čas a jednej!
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Už jsem ti řekl všechno, co potřebuješ vědět - zbytek je na tobě.
	};
};


instance DIA_Valentino_PICKPOCKET(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = DIA_Valentino_PICKPOCKET_Condition;
	information = DIA_Valentino_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tenhle klíč lze snadno ukrást)";
};


func int DIA_Valentino_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Valentino) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Valentino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,Dialog_Back,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_Valentino,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
};


instance DIA_VALENTINO_JOINSEKTA(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_joinsekta_condition;
	information = dia_valentino_joinsekta_info;
	permanent = FALSE;
	description = "Ve městě tě moc rádi nemají.";
};


func int dia_valentino_joinsekta_condition()
{
	if((MIS_NOVICECANJOIN == LOG_Running) && (other.guild == GIL_SEK) && Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (VALENTINOSHIT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valentino_joinsekta_info()
{
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_00");	//Všiml jsem si, že lidi tě moc rádi nemají.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_01");	//No a co jako?!... (rozzlobeně)
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_02");	//Hej, nerozčiluj se! Nedělám si ohledně tohoto srandu.
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_04");	//Nepotřebuji pomoc od nikoho! Dokážu se o sebe postarat sám!... (povýšeně)
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_05");	//Každý občas potřebuje pomoct a ty nejsi výjimka. Chtěl bys získat respekt od lidí - ale nemáš nic.
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_07");	//A vše, čeho jsi dosáhl je pár facek od lidí, jako je Regis!
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_09");	//...(Nejistý)... Já... Já zkoušel, ale... (povzdech) Ano, asi máš pravdu...
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_10");	//Vidíš! Ale nezoufej - Vím, že ti pomůžou najít víru a znovu získat důvěru v sebe sama!
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_11");	//Ano?!... (udiveně) Koho tím myslíš?
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_12");	//Už jsi slyšel o Bratrstvu?
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_15");	//Tak to se hluboce mýlíš! Guru Bratrstva jsou velmi silní a moudří muži, kteří pochopili pravou víru po mnoha letech meditací a sebeuvědomění.
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_16");	//Myslím, že tohle je to, co potřebuješ!
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_17");	//Brarstvo ti pomůže najít sám sebe, naučíš se žít v harmonii s sebou samým. A jinak dosáhneš jiného úspěchu - získáš respekt druhých!
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_18");	//Opravdu si to myslíš?!... (s nadějí)
	AI_Output(self,other,"DIA_Valentino_JoinSekta_01_26");	//(přemýšlí)... Tak dobrá.
	AI_Output(other,self,"DIA_Valentino_JoinSekta_01_27");	//Skvělé! Následuj mě a nezdržuj se.
	B_LogEntry(TOPIC_NOVICECANJOIN,"Mluvil jsem s Valentinem. Bylo lehké ho přemluvit, aby se mnou šel za Baalem Parvezem. Když uvážím jeho problémy, udělal bych to samé.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	VALENTINOCANJOINPSI = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VALENTINO_THANKSJOINSEKTA(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_thanksjoinsekta_condition;
	information = dia_valentino_thanksjoinsekta_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_valentino_thanksjoinsekta_condition()
{
	if((MIS_NOVICECANJOIN == LOG_SUCCESS) && (VALENTINOPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_valentino_thanksjoinsekta_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Valentino_ThanksJoinSekta_01_00");	//Děkuji ti, že jsi mi pomohl. Ani nevím, jak bych se ti za to měl odvděčit!
	VALENTINOPSI = TRUE;
	self.guild = GIL_SEK;
	Npc_SetTrueGuild(self,GIL_SEK);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;

	if(MIS_VALENTINOHELP == LOG_Running)
	{
		MIS_VALENTINOHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_VALENTINOHELP);
	};

	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_TALIASANLETTER(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_taliasanletter_condition;
	information = dia_valentino_taliasanletter_info;
	permanent = FALSE;
	description = "Máš pro mě práci?";
};


func int dia_valentino_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && !Npc_KnowsInfo(other,DIA_TALIASAN_SENDTOLARIUS) && Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (VALENTINOPSI == FALSE) && ((hero.guild != GIL_KDF) || (hero.guild != GIL_PAL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDM)))
	{
		return TRUE;
	};
};

func void dia_valentino_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_00");	//Máš pro mě práci?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_06");	//Hmmm... Ty teda nevypadáš jako drsňák!
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_07");	//Ty jsi snad nikdy neřekl, kvůli vzhledu - něco vymyšleného?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_08");	//Ale jo! Tak teda... (zaujetě)
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_10");	//Je tu jeden chlap, jménem Regis, který se mnou docela hrubě zachází.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_12");	//Nejstli ti to nevadí, tak tohle je tvůj úkol - vpal mu za mě párkrát do hlavy!
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_14");	//Udělal bych to sám, jenže si nechci špinit ruce.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_18");	//Ó, ano! Asi se chceš zeptat - kolik ti za to zaplatím?!...(směje se)
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_21");	//Zlato mě nezajímá.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_22");	//Fakt?!... (udiveně) To jsou časy! Takže si chceš zachovat hrdost?! Odmítáš zlato?!
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_23");	//Ne! Je to práce jako každá jiná.
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_25");	//Potřebuju vyřešit malý problém za pomoci vlvnýc lidí tady ve městě.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_30");	//Hmmm... Dobrá, fajn. A co bys teda potřeboval?
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_31");	//Vlastně ani ne tak já. Slyšel jsi o někom jménem Gallahad?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_32");	//Gallahad?!... Jasně! Kdo o něm neslyšel!
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_33");	//Takže - i on potřebuje pomoc.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_34");	//Ale! Takže ty jsi poslíček Gallahada!...(směje se) Teď je to vše jasné!
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_35");	//A co Gallahad potřebuje?
	AI_Output(other,self,"DIA_Valentino_TaliasanLetter_01_36");	//Potřebuje, abys napsal doporučující dopis pro Lariuse, který by ho před ním vychválil.
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_37");	//Před místodržícím?! Proč by to měl chtít?
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_41");	//Ale před tím - zmlať Regise!
	AI_Output(self,other,"DIA_Valentino_TaliasanLetter_01_44");	//Měj na paměti - Regis musí vědět, že ten výprask je ode mně!... (směje se)
	MIS_VALENTINOHELP = LOG_Running;
	Log_CreateTopic(TOPIC_VALENTINOHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_Running);
	B_LogEntry(TOPIC_VALENTINOHELP,"Valentiono napíše doporučující dopis pro Gallahada, pokud zmlátím Regise za nadávání při jejich poslední hádce.");
	AI_StopProcessInfos(self);
};

instance DIA_VALENTINO_PAYBACK(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_payback_condition;
	information = dia_valentino_payback_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_valentino_payback_condition()
{
	if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE) && ((REGISFIGHTOK == TRUE) || (REGISFIGHTNOTOK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_valentino_payback_info()
{
	if(REGISFIGHTOK == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Valentino_PayBack_01_00");	//Hej! Slyšel jsem, že jsi napráskal Regisovi!
		AI_Output(self,other,"DIA_Valentino_PayBack_01_04");	//Doufám, že bude dlouho vzpomínat na lekci, kterou jsi mu udělil.

		if(MIS_TALIASANHELP == LOG_Running)
		{
			AI_Output(other,self,"DIA_Valentino_PayBack_01_05");	//Napsal jsi dopis Gallahadovi?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_08");	//Tady to máš, jak jsme se dohodli.
			AI_Output(self,other,"DIA_Valentino_PayBack_01_09");	//Tohle je to nejlepší doporučení, která ode mně můžeš dostat.
			B_GiveInvItems(self,other,itwr_valentinoletter,1);
		};
		
		AI_Output(self,other,"DIA_Valentino_PayBack_01_14");	//No, když tak se stav.
		AI_Output(self,other,"DIA_Valentino_PayBack_01_15");	//Možná se ještě v budoucnu najde pro tebe nějaká další práce.(směje se)
		MIS_VALENTINOHELP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_SUCCESS);
		B_LogEntry(TOPIC_VALENTINOHELP,"Valentino byl velmi rád, že jsem ztřískal Regise. Na oplátku mi napsal doporučení pro Gallahada.");
		AI_StopProcessInfos(self);
	};
	if(REGISFIGHTNOTOK == TRUE)
	{
		AI_Output(self,other,"DIA_Valentino_PayBack_01_18");	//Hej! Slyšel jsem, že ti Regis napráskal!
		AI_Output(self,other,"DIA_Valentino_PayBack_01_19");	//A já myslel, že se jen nechlubíš, jak ti ostatní.
		AI_Output(self,other,"DIA_Valentino_PayBack_01_20");	//Jsi nepoužitelný... (s posměchem)

		if(MIS_TALIASANHELP == LOG_Running)
		{
			AI_Output(other,self,"DIA_Valentino_PayBack_01_24");	//A co dopis pro Gallahada?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_25");	//CO?!...(směje se) Jak se vůbec opovažuješ si o to žádat, drzý hochu?!
			AI_Output(self,other,"DIA_Valentino_PayBack_01_26");	//Nebo jsi zapomněl na naši dohodu?
			AI_Output(self,other,"DIA_Valentino_PayBack_01_27");	//Trosko! Takoví idioti jako jsi ty ode mně nic nedostanou.
		};

		MIS_VALENTINOHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_VALENTINOHELP);
		AI_StopProcessInfos(self);
	};
};