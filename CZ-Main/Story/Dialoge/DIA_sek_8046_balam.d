
instance DIA_BALAM_EXIT(C_Info)
{
	npc = sek_8046_balam;
	nr = 999;
	condition = dia_balam_exit_condition;
	information = dia_balam_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_balam_exit_condition()
{
	return TRUE;
};

func void dia_balam_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALAM_NOFOREVER(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_noforever_condition;
	information = dia_balam_noforever_info;
	permanent = FALSE;
	description = "Kdo jste?";
};


func int dia_balam_noforever_condition()
{
	return TRUE;
};

func void dia_balam_noforever_info()
{
	AI_Output(other,self,"DIA_Balam_NoForever_01_00");	//Kdo jste?
	AI_Output(self,other,"DIA_Balam_NoForever_01_01");	//My jsme sběrači trávy z bažin!... (hrdě)
	AI_Output(self,other,"DIA_Balam_NoForever_01_02");	//Bratrstvo potřebuje hromadu drogy. Proto sbíráme jak můžeme.
};


instance DIA_BALAM_PSIINFO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_psiinfo_condition;
	information = dia_balam_psiinfo_info;
	permanent = FALSE;
	description = "Bratrstvo? Jaké Bratrstvo?";
};


func int dia_balam_psiinfo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !Npc_KnowsInfo(hero,dia_hanis_psiinfo) && !Npc_KnowsInfo(hero,dia_shrat_psiinfo) && Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_psiinfo_info()
{
	AI_Output(other,self,"DIA_Balam_PsiInfo_01_00");	//Bratrstvo? Jaké Bratrstvo?
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_01");	//Bratrstvo Spáče! I když teď už stačí ho nazývat jen Bratrstvem.
	AI_Output(other,self,"DIA_Balam_PsiInfo_01_02");	//Ale já si myslel, že po pádu bariéry Bratrstvo Spáče přestalo existovat?!
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_03");	//Ne! Ve skutečnosti, jsme přišli o hodně bratrů, někteří se dokonce zbláznili!
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_04");	//Ale někteří z nás přežili. Z nich se stali noví velitelé Bratrstva.
	AI_Output(other,self,"DIA_Balam_PsiInfo_01_05");	//A kde je to Bratrstvo?
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_06");	//Jdi po cestě do Hornického údolí. Po cestě najdeš malou farmu. Vede ji jakýsi Bengar...
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_07");	//Kousek odtud najdeš náš nový tábor.
};


instance DIA_BALAM_HELLO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_hello_condition;
	information = dia_balam_hello_info;
	permanent = FALSE;
	description = "A proč nepomáháš ostatním?";
};


func int dia_balam_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_hello_info()
{
	AI_Output(other,self,"DIA_Balam_Hello_01_00");	//A proč nepomáháš ostatním?
	AI_Output(self,other,"DIA_Balam_Hello_01_01");	//A kdo bude dávat pozor, aby nějaká potvora neukradla to, co už nasbírali?
	AI_Output(self,other,"DIA_Balam_Hello_01_02");	//Tohle místo se jen hemží obludami, takže člověk musí být ostražitý!
	AI_Output(other,self,"DIA_Balam_Hello_01_03");	//Na to jsem nepomyslel.
	AI_Output(self,other,"DIA_Balam_Hello_01_04");	//Tak, tak.
};


instance DIA_BALAM_HELLOTWO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_hellotwo_condition;
	information = dia_balam_hellotwo_info;
	permanent = TRUE;
	description = "Jak pokračuje sběr drogy?";
};


func int dia_balam_hellotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_hellotwo_info()
{
	AI_Output(other,self,"DIA_Balam_HelloTwo_01_00");	//Jak pokračuje sběr drogy?
	AI_Output(self,other,"DIA_Balam_HelloTwo_01_01");	//Pokud nebudeš otravovat sběrače, tak půjde mnohem rychleji!
};

instance DIA_BALAM_GIVEPLANT(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_giveplant_condition;
	information = dia_balam_giveplant_info;
	permanent = TRUE;
	description = "Poslal mě Baal Cadar.";
};


func int dia_balam_giveplant_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_Running) && (SEKONGROUPSEK == FALSE) && (other.guild == GIL_SEK) && Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Balam_GivePlant_01_00");	//Poslal mě Baal Cadar.
	AI_Output(self,other,"DIA_Balam_GivePlant_01_01");	//A proč to udělal?
	AI_Output(other,self,"DIA_Balam_GivePlant_01_02");	//Chce abych mu donesl drogu, kterou jste už posbírali.
	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other,"DIA_Balam_GivePlant_01_03");	//Dobře, tady. To je vše, co jsme doteď nasbírali.
		B_GiveInvItems(self,other,ItPl_SwampHerb,50);
		AI_Output(self,other,"DIA_Balam_GivePlant_01_04");	//Neztrať to! Trvalo nám nejméně měsíc, než jsme to nasbírali.
		SEKONGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Balam_GivePlant_01_05");	//Ty nemůžeš být osoba, kterou Baal Cadar poslal.
		AI_Output(self,other,"DIA_Balam_GivePlant_01_06");	//Nesvěřil bych ti ani stéblo trávy!
	};
};

//-----------------PRIORAT---------------------


instance dia_balam_PrioratStart(C_Info)
{
	npc = sek_8046_balam;
	nr = 1;
	condition = dia_balam_PrioratStart_condition;
	information = dia_balam_PrioratStart_info;
	permanent = FALSE;
	description = "Poslal mě Baal Namib.";
};


func int dia_balam_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_balam_PrioratStart_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"dia_balam_PrioratStart_01_00");	//Poslal mě Baal Namib.
	AI_Output(self,other,"dia_balam_PrioratStart_01_01");	//Ó! (uctivě) Takže tě poslal jeden z našich duchovních vůdců. A co, že chce?
	AI_Output(other,self,"dia_balam_PrioratStart_01_02");	//Chce se jen ujistit, že jste v pořádku.
	AI_Output(self,other,"dia_balam_PrioratStart_01_03");	//Můžeš mu vyřídit, že u nás je vše v pořádku.
	AI_Output(other,self,"dia_balam_PrioratStart_01_04");	//No, to je velmi zajímavé, že víte o zmizení několika noviců z tábora Bratrstva.
	AI_Output(self,other,"dia_balam_PrioratStart_01_05");	//Jak to máme vědět? (zmateně) Všechny novinky se dozvíme teprve tehdy, když se vrátíme do tábora s další várkou trávy z bažin.
	AI_Output(self,other,"dia_balam_PrioratStart_01_06");	//A o tom, že někdo chybí slyším poprvé.
	AI_Output(other,self,"dia_balam_PrioratStart_01_07");	//Možná jste je viděli?
	AI_Output(self,other,"dia_balam_PrioratStart_01_08");	//Pokud by tomu tak bylo, tak by Baal Namib byl první koho bychom informovali.
	AI_Output(self,other,"dia_balam_PrioratStart_01_09");	//Tak co, chceš mě ještě něco říct.
	AI_Output(other,self,"dia_balam_PrioratStart_01_10");	//Ne, nic.
	PsiCamp_01_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"V táboře sběračů pod vedením Balama je vše v pořádku. O chybějících novicích nikdo nic neví.");
};

instance DIA_BALAM_NamibSendTempler(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_NamibSendTempler_condition;
	information = dia_balam_NamibSendTempler_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_balam_NamibSendTempler_condition()
{
	if((NamibSendTempler == TRUE) && (CountDownAssInvasion == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_balam_NamibSendTempler_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Balam_NamibSendTempler_01_01");	//Zase ty? (překvapeně) Co jsem tentokrát udělal?
	AI_Output(other,self,"DIA_Balam_NamibSendTempler_01_02");	//Jsem tu na žádost Baala Namiba. Váš tábor sběračů může být napaden!
	AI_Output(self,other,"DIA_Balam_NamibSendTempler_01_03");	//Napaden? (úzkostlivě) Tak proč nám Guru neposlali templáře.
	AI_Output(other,self,"DIA_Balam_NamibSendTempler_01_04");	//Proto jsem tady.
	AI_Output(self,other,"DIA_Balam_NamibSendTempler_01_05");	//No výborně! Doufám, že teď budem v bezpečí.
	AI_Output(other,self,"DIA_Balam_NamibSendTempler_01_06");	//Můžeš přestat zpochybňovat.
	CountDownAssInvasion = TRUE;
	CountDownAssInvasionDay = Wld_GetDay();
	CountDownAssInvasionRandomDay = Hlp_Random(2);
};


instance DIA_BALAM_JobInCamp(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_JobInCamp_condition;
	information = dia_balam_JobInCamp_info;
	permanent = FALSE;
	description = "Není tu pro mě nějaká práce?";
};

func int dia_balam_JobInCamp_condition()
{
	if(CountDownAssInvasion == TRUE)
	{
		return TRUE;
	};
};

func void dia_balam_JobInCamp_info()
{
	AI_Output(other,self,"DIA_Balam_JobInCamp_01_01");	//Není tu pro mě nějaká práce?
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_02");	//Hmmm... (zamyšleně) Jestli chceš, můžeš pomoct našim chlapcům zbírat trávu z bažin.
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_03");	//Po pravdě řečeno, ruce navíc by se nám hodily.
	AI_Output(other,self,"DIA_Balam_JobInCamp_01_04");	//Dobře. A kde jí mám hledat?
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_05");	//Tady, v blízkosti tábora. Nebo se můžeš podívat k jezeru. Prostě přines co najdeš. Ale ne míň než deset stonků!
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_06");	//Ale dávej pozor! V místních houštinách se nacházejí někdy docela nebezpečné potvory.
	Log_CreateTopic(TOPIC_JobInCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JobInCamp,LOG_Running);
	B_LogEntry(TOPIC_JobInCamp,"Balam mě poprosil, jestli bych nepomohl jeho chlapcům se sběrem trávy. V táboře je nuda tak jsem se rozhodl trochu se projít a pozbírat aspoň deset stonků trávy.");
	MIS_JobInCamp = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_01");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_02");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_03");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_04");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_05");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_06");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_07");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_08");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_09");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_10");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_11");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_12");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_13");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_14");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_15");
};

instance DIA_BALAM_JobInCamp_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_JobInCamp_Done_condition;
	information = dia_balam_JobInCamp_Done_info;
	permanent = FALSE;
	description = "Mám pro tebe nějakou trávu.";
};

func int dia_balam_JobInCamp_Done_condition()
{
	if((MIS_JobInCamp == LOG_Running) && (Npc_HasItems(other,ItPl_SwampHerb) >= 10))
	{
		return TRUE;
	};
};

func void dia_balam_JobInCamp_Done_info()
{
	var int swamp_herbz;
	var int swamp_xp;
	var int swamp_xp_big;

	AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_01");	//Mám pro tebe nějakou trávu.
	AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_02");	//Dobře chlapče, dej to sem.

	swamp_xp_big = FALSE;	
	swamp_herbz = Npc_HasItems(hero,ItPl_SwampHerb);
	B_GiveInvItems(other,self,ItPl_SwampHerb,swamp_herbz);
	Npc_RemoveInvItems(self,ItPl_SwampHerb,swamp_herbz);
	swamp_xp_big = swamp_herbz * 50;
	B_GivePlayerXP(swamp_xp_big);

	if(swamp_herbz >= 10)
	{
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_03");	//Tady máš. To je vše co jsem dokázal pozbírat.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_04");	//Dobrá myslím, že máme splněno.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_05");	//Dobře jsi pracoval, na vem si tenhle lektvar jako odměnu za svoji pomoc.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_06");	//Rád jsem pomoh.
	}
	else
	{
		B_GivePlayerXP(swamp_xp_big);
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_07");	//To je - vše, co mám.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_08");	//No dobře. Abych byl upřímný čekal jsem trochu víc.
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_09");	//Zdá se ti to málo?
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_10");	//Viděl jsi poslední sběr co jsme posílali do tábora, nebylo to nic moc.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_11");	//No dobrá, kolik už máme.
	};

	MIS_JobInCamp = LOG_SUCCESS;
	Log_CreateTopic(TOPIC_JobInCamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_JobInCamp,"Sesbíral jsem pro Balama dostatek trávy pro další zásilku do tábora Bratrstva.");
};


instance DIA_BALAM_StrangeCave(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_condition;
	information = dia_balam_StrangeCave_info;
	permanent = FALSE;
	description = "Nějaká další práce pro mě?";
};

func int dia_balam_StrangeCave_condition()
{
	if(MIS_JobInCamp == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_info()
{
	AI_Output(other,self,"DIA_Balam_StrangeCave_01_01");	//Nějaká další práce pro mě?
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_02");	//Hmmm... (zamyšleně) Jestli chceš, můžeš pomoct našim chlapcům zbírat trávu z bažin.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_03");	//... Pak můžete navštívit jeskyně, což není daleko od našeho tábora.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_05");	//Poslední dobou, se od tud v noci ozývají podivné zvuky!
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_06");	//Byli jsme tan s chlapci několikrát přes den, ale kromě několika žravých štěnic jsme nic nenašli.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_07");	//Možná budeš mít štěstí a zjistíš co se tam děje.
	AI_Output(other,self,"DIA_Balam_StrangeCave_01_08");	//Dobře, budu se snažit.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_09");	//To by bylo dobré, kamaráde... To by bylo!
	Log_CreateTopic(TOPIC_StrangeCave,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_StrangeCave,LOG_Running);
	B_LogEntry(TOPIC_StrangeCave,"Balam mě požádal abych zjistil co to za podivné zvuky, v noci slyší z jeskyně. Sběrači trávy tam našli akorát žravé štěnice. No zdá se, že musím do jeskyně proklouznout pěkně potichu.");
	MIS_StrangeCave = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertItem(ITSC_TRFMEATBUG,"FP_ITEM_NW_TROLLAREA_TRFMEATBUG");
};


instance DIA_BALAM_StrangeCave_News(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_News_condition;
	information = dia_balam_StrangeCave_News_info;
	permanent = FALSE;
	description = "Co mě můžeš říct o té jeskyni?";
};

func int dia_balam_StrangeCave_News_condition()
{
	if((MIS_StrangeCave == LOG_Running) && (StrangeCaveMageIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_News_info()
{
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_01");	//Co mě můžeš říct o té jeskyni?
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_02");	//No, je tu ještě něco jiného... (vážně) Možná by ti to mohlo pomoci.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_03");	//No ven s tím, nenapínej.
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_04");	//Když jsme vešli do jeskyně, jeden ze sběračů si všiml, že se podél stěny mihnul stín a pak zmizel.
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_05");	//Myslím, že možná svou přítomností jsme ho vyděsily!
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_06");	//A další už znáš. Kromě žravých štěnic, jen prach a nic a nic.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_07");	//Opravdu nic?
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_08");	//Nic co by stálo za řeč.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_09");	//Dobře.
	B_LogEntry(TOPIC_StrangeCave,"Balam řekl, že jeden z jeho sběračů si všimnul stínu na stěně, který zmizel. Ale nenašli nic jiného než žravé štěnice.");
};


instance DIA_BALAM_StrangeCave_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_Done_condition;
	information = dia_balam_StrangeCave_Done_info;
	permanent = FALSE;
	description = "Přišel jsem na to, co bylo v jeskyni.";
};

func int dia_balam_StrangeCave_Done_condition()
{
	if((MIS_StrangeCave == LOG_Running) && (StrangeCaveMageIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Balam_StrangeCave_Done_01_01");	//Přišel jsem na to, co bylo v jeskyni.
	AI_Output(self,other,"DIA_Balam_StrangeCave_Done_01_02");	//A kdo v noci vydával ty zvuky?
	AI_Output(other,self,"DIA_Balam_StrangeCave_Done_01_03");	//Zlo... Prosté zlo! No buď v klidu, už vás nic rušit nebude.
	AI_Output(self,other,"DIA_Balam_StrangeCave_Done_01_04");	//Doufám, že máš pravdu.
	AI_Output(self,other,"DIA_Balam_StrangeCave_Done_01_05");	//Dobře, na tady něco za tvoji námahu. Zasloužíš si to po právu!
	B_GiveInvItems(self,other,ItMi_Joint,10);
	B_LogEntry(TOPIC_StrangeCave,"Řekl jsem Balamovi, že problém v jeskyni je vyřešen.");
	Log_CreateTopic(TOPIC_StrangeCave,LOG_SUCCESS);
	MIS_StrangeCave = LOG_SUCCESS;
};

instance DIA_BALAM_Proviant(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_Proviant_condition;
	information = dia_balam_Proviant_info;
	permanent = FALSE;
	description = "Jaká je součastná situace?";
};

func int dia_balam_Proviant_condition()
{
	if(MIS_StrangeCave == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_balam_Proviant_info()
{
	AI_Output(other,self,"DIA_Balam_Proviant_01_01");	//Jaká je součastná situace?
	AI_Output(self,other,"DIA_Balam_Proviant_01_02");	//Vše při starém. 
	AI_Output(self,other,"DIA_Balam_Proviant_01_03");	//Brzy však budem muset doplnit zásoby potravin. Ty co zůstali, se už tenčí.
	AI_Output(other,self,"DIA_Balam_Proviant_01_04");	//A máš nějaký plán?
	AI_Output(self,other,"DIA_Balam_Proviant_01_05");	//Hmmm... (zamyšleně) Zde nedaleko od tábora, se pase celé stádo horských mrchožroutů.
	AI_Output(self,other,"DIA_Balam_Proviant_01_06");	//Domnívám se, že by bylo pěkné jich pár ulovit.
	AI_Output(self,other,"DIA_Balam_Proviant_01_07");	//To maso by nám vystačilo, přinejmenším na pár týdnů!
	AI_Output(other,self,"DIA_Balam_Proviant_01_08");	//A koho chceš poslat na lovu?
	AI_Output(self,other,"DIA_Balam_Proviant_01_09");	//Nejdřív mě napadnul Tiraks. Ale je poslední dobou nějak podrážděný, ten mě pošle kamsi.
	AI_Output(self,other,"DIA_Balam_Proviant_01_10");	//Tak to zase zbyde na tebe, jestli nejsi proti?
	AI_Output(other,self,"DIA_Balam_Proviant_01_11");	//Proč ne, je to lepší než se tu nudit.
	AI_Output(self,other,"DIA_Balam_Proviant_01_12");	//Dobře, na tebe se dá spolhnout. 
	AI_Output(other,self,"DIA_Balam_Proviant_01_13");	//A kde jsou ty pastviny horských mrchožroutů?
	AI_Output(self,other,"DIA_Balam_Proviant_01_14");	//Až vyjdeš ze stanu, běž pořád za nosem. 
	AI_Output(self,other,"DIA_Balam_Proviant_01_15");	//Buď opatrný, ač jsou to jen ptáci, mohou tě uklovat k smrti.
	AI_Output(other,self,"DIA_Balam_Proviant_01_16");	//Znám ty potvory, nelovím je poprvé.
	AI_Output(self,other,"DIA_Balam_Proviant_01_17");	//Tak už se těším na tvůj návrat a doufám, že ne s prázdnýma rukama.
	AI_Output(self,other,"DIA_Balam_Proviant_01_18");	//Přines tolik masa co jen uneseš.
	Log_CreateTopic(TOPIC_BalamProviant,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalamProviant,LOG_Running);
	B_LogEntry(TOPIC_BalamProviant,"Balam potřebuje doplnit zásoby, a požádal mě, jestli bych neulovil nějaké horské mrchožrouty.");
	MIS_BalamProviant = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_01");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_02");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_03");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_04");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_05");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_06");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_07");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_08");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_09");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_10");
};

instance DIA_BALAM_Proviant_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_Proviant_Done_condition;
	information = dia_balam_Proviant_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem ti maso horských mrchožroutů.";
};

func int dia_balam_Proviant_Done_condition()
{
	if((MIS_BalamProviant == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw_Mount) >= 1))
	{
		return TRUE;
	};
};

func void dia_balam_Proviant_Done_info()
{
	var int Raw_Mount;
	var int Xp_Raw_Mount;

	AI_Output(other,self,"DIA_Balam_Proviant_Done_01_01");	//Přinesl jsem ti maso horských mrchožroutů.
	AI_Output(self,other,"DIA_Balam_Proviant_Done_01_02");	//Výborně! A kolik se ti ho podařilo získat?
	AI_Output(other,self,"DIA_Balam_Proviant_Done_01_03");	//Tady, podívej se sám.

	Raw_Mount = Npc_HasItems(other,ItFoMuttonRaw_Mount);
	Xp_Raw_Mount = Raw_Mount * 10;

	B_GivePlayerXP(Xp_Raw_Mount);
	B_GiveInvItems(other,self,ItFoMuttonRaw_Mount,Raw_Mount);
	Npc_RemoveInvItems(self,ItFoMuttonRaw_Mount,Raw_Mount);

	if(Raw_Mount >= 10)
	{
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_04");	//Ano, přinesl jsi tolik masa kolik, bylo zapotřebí. Vidím, že jsi dobrý lovec!
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_05");	//Na tady máš nápoj, a trochu zlata za svoje úsilí.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_06");	//Bohužel, nyní je to to nejlepší, co ti mohu nabídnout.
		AI_Output(other,self,"DIA_Balam_Proviant_Done_01_07");	//Mě to stačí. Vaše práce je oceňována stejným způsobem.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_08");	//(usmívá se) O tom nepochybuj.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItMi_Gold,150);
		CreateInvItems(other,ITPO_FALLDEFENCE,1);
	}
	else if(Raw_Mount >= 4)
	{
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_09");	//Není to špatný jen jsem očekával trochu víc masa.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_10");	//No dobře. Myslím, že to bude stačit. Tady, vezmi si tohle zlato za svoje úsilí.
		B_GiveInvItems(self,other,ItMi_Gold,75);
	}
	else
	{
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_12");	//Hmmm... Vidím, že nejsi moc dobrý lovec, když jsi přinesl tak málo masa.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_13");	//Ale i tak děkuji za tvoji pomoc.
	};

	B_LogEntry(TOPIC_BalamProviant,"Přinesl jsem Balamovi maso horských mrchožroutů, sběrači trávy nebudou hladovět.");
	Log_CreateTopic(TOPIC_BalamProviant,LOG_SUCCESS);
	MIS_BalamProviant = LOG_SUCCESS;
};

instance DIA_BALAM_AssasinsAttack(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_AssasinsAttack_condition;
	information = dia_balam_AssasinsAttack_info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};

func int dia_balam_AssasinsAttack_condition()
{
	if((MIS_TiraksFur == LOG_SUCCESS) && (AssasinsAttackCamp == FALSE))
	{
		return TRUE;
	};
};

func void dia_balam_AssasinsAttack_info()
{
	AI_Output(other,self,"DIA_Balam_AssasinsAttack_01_01");	//Všechno v pořádku?

	if(Wld_IsTime(20,59,7,59))
	{
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_02");	//Lepší než si dokážeš představit... (uvolněně) Poslední dny byl v táboře nebývalý klid.
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_03");	//A to všechno díky tobě a templářům, které poslal Gor Na Toth.
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_04");	//Nemyslím, že by nám něco hrozilo...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_05");	//Hmmm... (úzkostlivě) Slyšel jsi to?
		Info_ClearChoices(DIA_Balam_AssasinsAttack);
		Info_AddChoice(DIA_Balam_AssasinsAttack,"Co přesně?",dia_balam_AssasinsAttack_Done);
	}
	else
	{
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_08");	//Uvidíš. Ale radši si o tom promluvíme později večer.
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_09");	//Teď musím zajít za sběrači.
		AI_StopProcessInfos(self);
	};
};

func void dia_balam_AssasinsAttack_Done()
{
	AI_Output(other,self,"DIA_Balam_AssasinsAttack_01_06");	//Co přesně?
	AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_07");	//Vzadu za tebou!
	AssasinsAttackCamp = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_121_Adept,"NW_FOREST_ASS_START_01");
	Wld_InsertNpc(Ass_122_Adept,"NW_FOREST_ASS_START_02");
	Wld_InsertNpc(Ass_123_Adept,"NW_FOREST_ASS_START_03");
	Wld_InsertNpc(Ass_124_Adept,"NW_FOREST_ASS_START_04");
};