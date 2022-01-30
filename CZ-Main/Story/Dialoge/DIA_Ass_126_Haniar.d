
instance DIA_Ass_126_Haniar_EXIT(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 999;
	condition = dia_Ass_126_Haniar_exit_condition;
	information = dia_Ass_126_Haniar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_Ass_126_Haniar_exit_condition()
{
	return TRUE;
};

func void dia_Ass_126_Haniar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_PreHALLO(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_PreHALLO_condition;
	information = dia_Ass_126_Haniar_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarMurid == FALSE) && (HaniarMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreHALLO_01_00");	//Proč mě otravuješ?
};

instance DIA_Ass_126_Haniar_PreHALLO_Kill(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_PreHALLO_Kill_condition;
	information = dia_Ass_126_Haniar_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarMurid == FALSE) && (TiamantMurid == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_126_Haniar_HALLO(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_hallo_condition;
	information = dia_Ass_126_Haniar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_hallo_condition()
{
	if(TiamantMurid == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_hallo_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_01");	//(tiše) Počkej, novici... Slyšel jsem nějaké zvěsti, že mistr Tiamant tě přijal za svého murida, je to pravda?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_01_02");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_03");	//To jsi na něj asi udělal velký dojem, že sis zasloužil takovou poctu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_04");	//Ale popravdě řečeno jsem rád, že konečně máme dobré uchazeče na titul stínů.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_05");	//Tak či tak, je to jeho rozhodnutí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_06");	//Tak a teď k věci.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_07");	//Asi si říkáš, co po tobě teď chci a proč s tebou mluvím, že?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_01_08");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_09");	//No, jednoduše jsi upoutal pozornost třech převorů Masyafu, to se neobejde bez mého povšimnutí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_10");	//Proto s tebou mluvím, můžeš ji upoutat znovu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_11");	//Ale teď tě budu hodnotit já sám.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_12");	//Tak co, připraven?
	Info_ClearChoices(DIA_Ass_126_Haniar_HALLO);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"(přikývnout)",DIA_Ass_126_Haniar_HALLO_M1);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Nejsem si jistý, zda to zvládnu.",DIA_Ass_126_Haniar_HALLO_M2);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Ne, nejsem.",DIA_Ass_126_Haniar_HALLO_M3);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Samozřejmě!",DIA_Ass_126_Haniar_HALLO_M4);
};

func void DIA_Ass_126_Haniar_HALLO_M2()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M2_01_01");	//Nejsem si jistý, zda to zvládnu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_02");	//(povýšeně) Zklamal jsi mě, novici, upřímně, čekal jsem od tebe více.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_03");	//Naše bratrstvo nepotřebuje duševně slabé jedince.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_04");	//Jsem si jistý, že chápeš, co to pro tebe znamená...
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen s mými pochybnostmi a teď musím bojovat o svůj holý život proti celému bratrstvu!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M3()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M3_01_01");	//Ne, nejsem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M3_01_02");	//Jestli je to tak... Jak se říká, není to žádná ostuda.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M3_01_03");	//Pouze stačí zemřít za svou drzost!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen s mými pochybnostmi a teď musím bojovat o svůj holý život proti celému bratrstvu!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M4()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M4_01_01");	//Samozřejmě!
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_02");	//(temně) Myslel jsem, že už budeš znát naše pravidla...
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_03");	//A za takovou odpověď převorovi si zasloužíš jen jedno, smrt.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_04");	//Ale vzhledem k tvým minulým úspěchům v bratrstvu...
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_05");	//Ti poprvé tuto drzost odpustím.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_06");	//Nicméně v budoucnu važ slova.
};

func void DIA_Ass_126_Haniar_HALLO_M1()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M1_01_01");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_02");	//Velmi dobře, teď pozorně poslouchej.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_03");	//Jeden z našich bratrů byl nedávno zabit, jmenoval se Hasim Zubolam.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_04");	//Slyšel jsi o tom?
	Info_ClearChoices(DIA_Ass_126_Haniar_HALLO);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Samozřejmě, sám jsem ho zabil!",DIA_Ass_126_Haniar_HALLO_M6);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Vím, že je mrtvý.",DIA_Ass_126_Haniar_HALLO_Ok);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Ne, ani slovo, měl bych?",DIA_Ass_126_Haniar_HALLO_M5);
};

func void DIA_Ass_126_Haniar_HALLO_M5()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M5_01_01");	//Ne, ani slovo, měl bych?
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_02");	//(překvapeně) Byl zabit jeden z našich nejuznávanějších bratrů a ty se o to vůbec nezajímáš?
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_03");	//To je dost zvláštní, ví o tom všichni. Všichni kromě tebe.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_04");	//Buď jsi hluchý nebo slepý. Nebo něco skrýváš...
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_05");	//A to může znamenat jen jednu věc - jsi nedůvěryhodný.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_06");	//A já ti teď ukážu, co se dělá s nedůvěryhodnými lidmi...
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen s mým vysvětlením, teď jsem proti sobě poštval celé bratrstvo!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M6()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_01");	//Samozřejmě, sám jsem ho zabil.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_02");	//Ty? Ty jsi zabil elitního stína Masyafu? Tomu je pro mne těžké uvěřit.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_03");	//Hasim byl silný bojovník.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_04");	//No, řekněme, že ti věřím. Potom mi ale řekni... Proč jsi ho zabil?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_05");	//Z rozkazu mistra Tiamanta.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_06");	//Mistra Tiamanta?! (zamyšleně) Vše, co mi tu říkáš, je velmi zajímavé, velmi...
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_07");	//Je ti jasné, že říkat tohle nahlas, je pro tvou hlavu velké riziko? 
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_08");	//Ale na druhou stranu nevypadáš jako šílenec ochotný zahodit svůj život.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_09");	//Potom je třeba se na to řádně podívat...
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_12");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_10");	//Jdi se modlit k Beliarovi, aby tvá slova nebyla lež! 
	MIS_HasimKill = LOG_SUCCESS;
	HaniarKnowKiller = TRUE;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar se mě zeptal na osud Hasima a já mu řekl pravdu. Jistě, málem mě to stálo hlavu, ale pokud si mistr Haniar ověří má slova, může mi to pomoct. Teď bych se měl jít pomodlit k Beliarovi za Hasimovu duši... Nejspíš to bude zajímat i Gonzalese.");	
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_HALLO_Ok()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_Ok_01_01");	//Vím, že je mrtvý.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_02");	//Ano, tato zpráva nás všechny velmi znepokojila.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_03");	//Ale nejhorší je, že já sám jsem o tom nevěděl. Takhle by to být nemělo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_04");	//Tvůj úkol je zjistit, kdo je za to zodpovědný. A to co nejdříve.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_05");	//Nebude to jednoduché, ale já v tebe věřím. Jinak by ses nebyl stal muridem tří převorů.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_06");	//Teď jdi. Až se něco dozvíš, dej mi vědět. 
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar se mě zeptal na osud Hasima, ale já mu neřekl celou pravdu. Kdo ví, co by mi mohl udělat. Teď jsem dostal pokyn najít vraha, což je trochu legrační... Musím se o tom poradit s Gonzalesem.");	
	HaniarSeekKiller = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_Quest1(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_Quest1_condition;
	information = DIA_Ass_126_Haniar_Quest1_info;
	permanent = FALSE;
	description = "Ohledně Hasimova vraha...";
};

func int DIA_Ass_126_Haniar_Quest1_condition()
{
	if((HaniarSeekKiller == TRUE) && (MIS_HasimKill != LOG_SUCCESS) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_Quest1_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_01_01");	//Ohledně Hasimova vraha...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_01_02");	//Mluv, rychle!

	Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Nic nového jsem se nedozvěděl, mistře.",DIA_Ass_126_Haniar_Quest1_M1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Já ho zabil.",DIA_Ass_126_Haniar_Quest1_M2);

	if(Npc_HasItems(other,ItWr_TiamantPaperToHaniar) >= 1)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Mám pro tebe dopis od mistra Tiamanta, mistře.",DIA_Ass_126_Haniar_Quest1_Ok);
	};
};


func void DIA_Ass_126_Haniar_Quest1_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_Ok_01_01");	//Mám pro tebe dopis od mistra Tiamanta, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_02");	//Dopis? Počkej chvíli.
	B_GiveInvItems(other,self,ItWr_TiamantPaperToHaniar,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_03");	//(zamyšleně) Víš, jak získat vlivné přátele, když sám Tiamant za tebou stojí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_04");	//No, nechme stranou tu vraždu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_05");	//Proč jsi mi to ale hned neřekl?
	Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Mistr Tiamant mě o to požádal.",DIA_Ass_126_Haniar_Quest1_M3);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Mé slovo nemá stejnou váhu jako slovo mistra Tiamanta.",DIA_Ass_126_Haniar_Quest1_M7);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Bál jsem se.",DIA_Ass_126_Haniar_Quest1_M4);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Jsem trochu zmatený. Nebude se to opakovat.",DIA_Ass_126_Haniar_Quest1_M5);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Chtěl jsem nejdřív pochopit situaci.",DIA_Ass_126_Haniar_Quest1_M6);
};


func void DIA_Ass_126_Haniar_Quest1_M1()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M1_01_01");	//Nic nového jsem se nedozvěděl, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_02");	//Tak proč za mnou lezeš?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_03");	//Chceš mě otravovat s takovými blbostmi?
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M1_01_04");	//Já...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_04");	//Nedokážeš pochopit základní pokyny.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_05");	//Ve jménu Beliara, teď zemřeš.
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl spokojen s mým vysvětlením a teď po mně jde celé bratrstvo!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M2()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_01");	//Já ho zabil.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_02");	//Ty? Elitního bojovníka? Těžko se mi tomu věří.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_03");	//Hasim byl silný bojovník.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_04");	//No, řekněme, že ti věřím, ale proč jsi to udělal?
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_05");	//Z příkazu mistra Tiamanta.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_06");	//Mistra Tiamanta? A kde máš důkaz, že to byl jeho rozkaz?

	if(Npc_HasItems(other,ItWr_TiamantPaperToHaniar) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_07");	//Mám pro tebe dopis od mistra Tiamanta, mistře.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_08");	//Dopis? Ukaž, podívám se.
		B_GiveInvItems(other,self,ItWr_TiamantPaperToHaniar,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_09");	//Máš velmi vlivné přátele.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_10");	//No, nechme tu vraždu.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_11");	//Ale proč jsi mi to neřekl hned?
		Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Mistr Tiamant mě o to požádal.",DIA_Ass_126_Haniar_Quest1_M3);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Mé slovo nemá stejnou váhu jako slovo mistra Tiamanta.",DIA_Ass_126_Haniar_Quest1_M7);
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Bál jsem se.",DIA_Ass_126_Haniar_Quest1_M4);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Jsem trochu zmatený. Nebude se to opakovat.",DIA_Ass_126_Haniar_Quest1_M5);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Rozhodl jsem se nejdřív trochu pochopit situaci.",DIA_Ass_126_Haniar_Quest1_M6);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_12");	//Nyní žádný nemám, ale jestli mi dáš čas...
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_13");	//Je mi líto, ale tvůj čas vypršel.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_14");	//Nikdo nesmí bez mého souhlasu zabít někoho z bratrstva.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_15");	//Toto je náš zákon. Musíš být potrestán.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_16");	//Za Beliara!
		MIS_HasimKill = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
		B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen a teď jde po mně celé bratrstvo!");	
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};
	
func void DIA_Ass_126_Haniar_Quest1_M6()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M6_01_01");	//Rozhodl jsem se nejdřív trochu pochopit situaci.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_02");	//Pochopit situaci? Co na ní nechápeš? 
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_03");	//Teď ti ji teda vysvětlím.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_04");	//Za Beliara!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen a teď jde po mně celé bratrstvo!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};
	
func void DIA_Ass_126_Haniar_Quest1_M5()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M5_01_01");	//Jsem trochu zmatený, ale nebude se to opakovat.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_02");	//Zajímavé... Vždy jsem myslel, že důvěryhodnost je to, co nás odlišuje od obyčejných vrahů a banditů. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_03");	//Není nic důležitějšího, než naše zásady a víra.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_04");	//Lidé, jako ty, u nás nemají místo.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M5_01_05");	//Mistře...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_06");	//Tvá slabost je známkou toho, že se to může opakovat.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_07");	//Radši zabít jednu ovci, než ztratit celé stádo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_08");	//Za Beliara!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen a teď jde po mně celé bratrstvo!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M4()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M4_01_01");	//Bál jsem se.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_02");	//(zamyšleně) Takže strach, ty jsi měl strach...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_03");	//Měl bys vědět, že v našem společenství pro něco takového není místo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_04");	//Silný duch a tvář beze strachu, to nás odlišuje od obyčejných vrahů a banditů.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_05");	//Zbabělci mezi námi nemají místo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_06");	//Za Beliara!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen a teď jde po mně celé bratrstvo!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M3()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M3_01_01");	//Mistr Tiamant mě o to požádal.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_02");	//(rozhněvaně) Cože? Co to říkáš za hlouposti, novici?!
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_03");	//Mistr Tiamant by o tohle nikdy nepožádal žádného murida. Ani žádný jiný převor našeho bratrstva.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_04");	//Ty sis snad myslel, že jsem úplný hlupák a skočím na takovou lež!
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_05");	//Tohle je neodpustitelné!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Mistr Haniar nebyl moc spokojen a teď jde po mně celé bratrstvo!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M7()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_01");	//Obával jsem se, že narozdíl od slova Tiamanta, mé slovo nebude mít takovou váhu.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_02");	//S největší pravděpodobností bys mě na místě zabil.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_03");	//I když je to tvé právo, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_04");	//Hmm... Nejsi hloupý.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_05"); 	//Asi bych ti už utrhl hlavu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_06");	//I přesto, že tě chrání Tiamant.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_07");	//Nicméně by to ode mne nebylo moudré.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_08");	//Ještě pro nás budeš užitečný. Ale dost už o tom.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_09");	//Na tvém místě bych se šel pomodlit za duši našeho bratra Hasima.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_10");	//To je to nejlepší, co teď můžeš udělat.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_12");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_11");	//Tak tu nestůj a jdi už.
	MIS_HasimKill = LOG_SUCCESS;
	HaniarKnowKiller = TRUE;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Nebylo to jednoduché, ale podařilo se mi uniknout hněvu mistra Haniara. Abych aspoň nějak zmírnil svou vinu, měl bych se k Beliarovi pomodlit za Hasimovu duši. Jsem si jistý, že Gonzalese bude zajímat, jak to všechno dopadlo.");	
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_FollowMe(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_FollowMe_condition;
	information = dia_Ass_126_Haniar_FollowMe_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_FollowMe_condition()
{
	if((GonsalesFinishHasimStory == TRUE) && (PrayForHasim == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_FollowMe_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_FollowMe_01_01");	//Dobře, že jsi tady. Musíme něco probrat.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FollowMe_01_02");	//Ale ne tady. Následuj mě. 
	AI_Output(other,self,"DIA_Ass_126_Haniar_FollowMe_01_03");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HideMeet");
};

instance DIA_Ass_126_Haniar_ANGEKOMMEN(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 55;
	condition = DIA_Ass_126_Haniar_ANGEKOMMEN_Condition;
	information = DIA_Ass_126_Haniar_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_ANGEKOMMEN_Condition()
{
	if((GonsalesFinishHasimStory == TRUE) && (PrayForHasim == TRUE) && (Npc_GetDistToWP(self,"PW_HANIAR_HIDE") < 500))
	{
		return TRUE;
	};
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_01_00");	//Výborně, tady můžeme nepozorovaně mluvit...
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_01_01");	//Tak mi řekni, novici, bojíš se smrti?
	Info_ClearChoices(DIA_Ass_126_Haniar_ANGEKOMMEN);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Ne.",DIA_Ass_126_Haniar_ANGEKOMMEN_No);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Ano.",DIA_Ass_126_Haniar_ANGEKOMMEN_Yes);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_No()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_01");	//Ne.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_02");	//Dobře, to jsem chtěl slyšet.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_03");	//Nyní zpět k Hasimově vraždě.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_04");	//Jak jistě víš, jeho smrt mě moc nepotěšila.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_05");	//A nejen proto, že to byl náš bratr.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_06");	//Hasim byl mým poslem a důvěrníkem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_07");	//Skrze něj jsem pozoroval všechny věci, které se kolem nás i u nás dějí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_08");	//A měl jsem jistotu, že to budou pravdivé informace.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_09");	//To pro mě bylo velmi užitečné.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_10");	//Jeho smrt je tak ještě větší ztráta.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_11");	//To jsem nevěděl, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_12");	//Samozřejmě, že ne! (smích) Nikdo kromě mě to vědět nemohl. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_13");	//Jsi naprosto slepý nástroj v rukou Beliara, ale to je jedno. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_14");	//Ale nyní se obávám jistého faktu.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_15");	//A to?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_16");	//Naposled Hasim zmínil něco o tom, že mistr Tiamant má nějaké 'špinavé prádlo'.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_17");	//Myslím, že jeho smrt nebyla náhoda.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_18");	//Po tobě bych chtěl, abys zjistil, o co se jedná.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_19");	//Chceš, abych pro tebe pracoval? Nahradil Hasima?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_20");	//Dalo by se říct. Nejsi nejhloupější a hlavně ti mistr Tiamant věří.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_21");	//Věří ti, o tom nemůže být pochyb.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_22");	//Bylo by pošetilé toho nevyužít. Tak co?
	Info_ClearChoices(DIA_Ass_126_Haniar_ANGEKOMMEN);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Nezajímá mě to.",DIA_Ass_126_Haniar_ANGEKOMMEN_None);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"A co z toho budu mít?",DIA_Ass_126_Haniar_ANGEKOMMEN_What);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Dobře, souhlasím.",DIA_Ass_126_Haniar_ANGEKOMMEN_Ok);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Yes()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_01");	//Ano.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_02");	//Škoda, ale to se může stát každému.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_03");	//Neboj se, nebude to bolet.
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_None_01_01");	//Nezajímá mě to.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_None_01_02");	//Potom nemám jinou možnost...
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_What()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_01");	//A co já z toho budu mít?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_02");	//Dobrá otázka, čekal jsem na ni. HODNĚ!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_03");	//Pro začátek moji podporu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_04");	//A tu nemá každý.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_05");	//Za druhé, budeš můj murid a dám ti souhlas k budování tvé pozice stína.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_06");	//A jestli chceš zlato, Hasimovi jsem za každou informaci dobře platil.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_07");	//Taky se tě jen tak nezbavím, dobré informace jsou mi dražší.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_08");	//Je to dost?
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Ok()
{
	HaniarMurid = TRUE;
	MasiafShadowRitual = Wld_GetDay();
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_01");	//Dobře, souhlasím.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_02");	//V souladu s našimi zákony tě tedy jmenuji svým muridem!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_03");	//Od této chvíle jsem si tě vybral z noviců a stanu se tvým učitelem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_04");	//A protože jsi muridem i u jiných převorů...
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_05");	//... Tak nebudeš muset projít zkouškou pro přijetí do pozice stína.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_06");	//Nicméně přijímacím rituálem projít musíš. To zařídíme až se vrátíme do chrámu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_07");	//Bude to zítra, do té doby odpočívej.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_08");	//Pokud jde o tvé nové povinnosti - zde, vezmi si tento dopis.
	B_GiveInvItems(self,other,ItWr_HaniarOrder,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_09");	//Najdeš v něm pokyny.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_10");	//Teď jdi.
	B_LogEntry(TOPIC_MasiafStory,"Stal jsem se muridem samotného Haniara Slepého. Zítra mě i ostatní převorové oficiálně přijmou do hodnosti stína. Jsem řádným členem bratrstva. Měl bych si promluvit s Gonzalesem.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(Ass_183_Adept,"PW_TEMPLE_KADUIN");
	Wld_InsertNpc(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
};

instance DIA_Ass_126_Haniar_MasiafShadowRitual(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_MasiafShadowRitual_condition;
	information = DIA_Ass_126_Haniar_MasiafShadowRitual_info;
	permanent = TRUE;
	description = "Jsem připraven stát se stínem Masyafu.";
};

func int DIA_Ass_126_Haniar_MasiafShadowRitual_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((HaniarMurid == TRUE) && (MasiafShadowRitual < daynow) && (PriorDipost == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_MasiafShadowRitual_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_01");	//Jsem připraven stát se stínem Masyafu.

 	if(Wld_IsTime(10,0,20,0))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_02");	//Dobře, ale stejně nejdřív musíme počkat na ostatní převory.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_03");	//Už jsem poslal pro mistra Osaira, přijde brzy.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_04");	//Až budou všichni zde, začneme.
		AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_05");	//Co mě čeká?
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_06");	//Nic, jen si pak stoupni do kruhu síly. 
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_07");	//Přesně tam, kde teď stojím já.
		PriorDipost = TRUE;
		Info_ClearChoices(DIA_Ass_126_Haniar_MasiafShadowRitual);
		Info_AddChoice(DIA_Ass_126_Haniar_MasiafShadowRitual,Dialog_Ende,DIA_Ass_126_Haniar_MasiafShadowRitual_Ok);	

	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_08");	//(otráveně) Ty bys přišel ještě i o půlnoci. Vidíš přece, že už je noc.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_09");	//Rituál odložíme na zítra.
		AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_10");	//Kdy přesně?
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_11");	//Kolem poledne, do té doby dělej něco užitečného.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Ass_126_Haniar_MasiafShadowRitual_Ok()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_138_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_139_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_140_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_141_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_125_Tiamant,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_126_Haniar,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_127_Osair,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"MasiafRitual");
	AI_Teleport(Ass_127_Osair,"PW_OUTSIDE_15");
	AI_GotoWP(Ass_126_Haniar,"PW_HANIAR_RITUAL");
};

instance DIA_Ass_126_Haniar_MasiafShadowRitual_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_MasiafShadowRitual_Done_condition;
	information = DIA_Ass_126_Haniar_MasiafShadowRitual_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_MasiafShadowRitual_Done_condition()
{
	if(ReadyForMasiafRitual == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_MasiafShadowRitual_Done_info()
{
	Snd_Play("OPEN_PORTAL");
	Wld_SendTrigger("EVT_CAM_03");
	AI_ReadyMeleeWeapon(Ass_125_Tiamant);
	AI_ReadyMeleeWeapon(Ass_126_Haniar);
	AI_ReadyMeleeWeapon(Ass_127_Osair);
	AI_ReadyMeleeWeapon(Ass_128_Nrozas);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	AI_Wait(self,25);
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_01");	//Bratři, sešli jsme se dnes, abychom přijali tohoto novice na pozici stína.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_02");	//Musím přiznat, že podobný případ si nepamatuji...
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_03");	//Případ, že by byl někdo přijat do bratrstva bez absolvování zkoušek.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_04");	//Ale vzhledem k tomu, že je muridem všech přítomných převorů...
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_05");	//... A jediným kandidátem na členství, je od zkoušky osvobozen.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_06");	//Proto ho jménem nejvyšší rady převorů Masyafu přijímám mezi stíny.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_07");	//Od této chvíle je tvůj osud neodlučitelně spjat s bratrstvem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_08");	//Nechť je tvá víra silná a ty ničíš nepřátele Beliara!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_09");	//Zde je zbraň a zbroj stína. Symbol toho, že patříš mezi nás.
	CreateInvItems(hero,ItMw_1H_AssBlade_Hero,1);
	CreateInvItems(hero,ITAR_ASSASINS_04,1);
	AI_EquipArmor(hero,ITAR_ASSASINS_04);
	Npc_RemoveInvItems(other,ITAR_ASSASINS_03,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_10");	//... Ler Ilakh Il Al'u Ta Masyaf Masuli Beliar! ...
	B_LogEntry(TOPIC_MasiafStory,"Převorové mě přijali do pozice stína Masyafu. Jsem teď opravdový člen bratrstva. Měl bych co nejrychleji zajít za Gonzalesem, určitě to na něj udělá dojem.");
	PlayerIsAssNow = TRUE;
	Info_ClearChoices(DIA_Ass_126_Haniar_MasiafShadowRitual_Done);
	Info_AddChoice(DIA_Ass_126_Haniar_MasiafShadowRitual_Done,Dialog_Ende,DIA_Ass_126_Haniar_MasiafShadowRitual_Done_Ok);	
};

func void DIA_Ass_126_Haniar_MasiafShadowRitual_Done_Ok()
{
	AI_StopProcessInfos(self);
	AI_RemoveWeapon(Ass_125_Tiamant);
	AI_RemoveWeapon(Ass_126_Haniar);
	AI_RemoveWeapon(Ass_127_Osair);
	AI_RemoveWeapon(Ass_128_Nrozas);
	B_StartOtherRoutine(Ass_125_Tiamant,"Start");
	B_StartOtherRoutine(Ass_126_Haniar,"Start");
	B_StartOtherRoutine(Ass_127_Osair,"Start");
	B_StartOtherRoutine(Ass_128_Nrozas,"Start");
	B_StartOtherRoutine(Ass_138_Adept,"Start");
	B_StartOtherRoutine(Ass_139_Adept,"Start");
	B_StartOtherRoutine(Ass_140_Adept,"Start");
	B_StartOtherRoutine(Ass_141_Adept,"Start");
	AI_GotoWP(Ass_126_Haniar,"PW_HANIAR");
};

var int HaniarRefuseFirstTime;

instance DIA_Ass_126_Haniar_BlameTiamant(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_BlameTiamant_condition;
	information = DIA_Ass_126_Haniar_BlameTiamant_info;
	permanent = TRUE;
	description = "Ohledně tvého rozkazu o informacích, mistře.";
};

func int DIA_Ass_126_Haniar_BlameTiamant_condition()
{
	if((MIS_Intriges == LOG_Running) && (HaniarBlameTiamant == FALSE) && ((KnowOsairToTiamant == TRUE) || (KnowNrozasToTiamant == TRUE) || (KnowWhyHasimDead == TRUE)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_BlameTiamant_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_01_01");	//Ohledně tvého rozkazu o informacích, mistře.

	if(Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_02");	//Dobře, poslouchám.
		Info_ClearChoices(DIA_Ass_126_Haniar_BlameTiamant);
		Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"No, nemám co říct.",DIA_Ass_126_Haniar_BlameTiamant_None);

		if((HaniarKnowOsair == FALSE) && (KnowOsairToTiamant == TRUE))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"Zjistil jsem něco o mistru Osairovi.",DIA_Ass_126_Haniar_BlameTiamant_Osair);	
		};
		if((HaniarKnowNrozas == FALSE) && (KnowNrozasToTiamant == TRUE))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"Zjistil jsem něco o mistru Nrozasovi.",DIA_Ass_126_Haniar_BlameTiamant_Nrozas);	
		};
		if((HaniarKnowHasim == FALSE) && (KnowWhyHasimDead == TRUE) && (Npc_HasItems(other,ItWr_Luka) >= 1))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"Vím, proč musel Hasim zemřít.",DIA_Ass_126_Haniar_BlameTiamant_Hasim);
		};
	}
	else
	{
		if(HaniarRefuseFirstTime == FALSE)
		{
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_03");	//(podrážděně) Zdá se mi, že na to není vhodná chvíle.
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_04");	//Budeme o tomhle mluvit až v soukromí.
			B_LogEntry(TOPIC_Intriges,"Mistr Haniar mě neposlouchal. Musím počkat, až budeme mít dost soukromí a nikdo nebude kolem. Zdá se, že mistr Haniar nikdy nevyjde z chrámu na čerstvý vzduch.");
			HaniarRefuseFirstTime = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_05");	//Co jsi z toho, co jsem řekl, nepochopil?
			AI_StopProcessInfos(self);
		};
	};
};

func void DIA_Ass_126_Haniar_BlameTiamant_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_None_01_01");	//No, nemám co říct.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_None_01_02");	//Tak proč plýtváš mým časem?!
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_None_01_03");	//Odpusť, mistře, už jdu pryč.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_BlameTiamant_Osair()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_01");	//Zjistil jsem něco o mistru Osairovi.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_02");	//Co přesně?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_03");	//Byl velmi rozzloben na mistra Tiamanta, že nedokázal zabezpečit rudné doly.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_04");	//A ten po něm chce další lidi, aby mohl pokračovat v práci...
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_05");	//Důl někdo napadl?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_06");	//Důlní červi všechny sežrali...
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_07");	//Tak to tedy je... Ještě se to ke mně nedoneslo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_08");	//Vypadá to, že se to mistr Tiamant snažil přede mnou utajit. To nebylo moc chytré.
	HaniarKnowOsair = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_09");	//Dobře, tak s tím se vypořádáme později, ještě něco?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_10");	//To je vše, mistře.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_11");	//No, dobrá práce, máš mou důvěru.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_12");	//A co teď?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_13");	//Nic dobrého. Aspoň ne pro mistra Tiamanta.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_14");	//Podle toho, co jsi mi řekl, má už dle našich zákonů smrt jistou.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_15");	//Takže ho mám zabít?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_16");	//Ne, samozřejmě, že ne. (smích) Za prvé, podle našich zákonů, na to nemáš právo. 
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_17");	//Může to udělat jen někdo jemu roven.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_18");	//A za druhé nejsi dost zkušený na utkání s nejlepším bojovníkem Masyafu.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_19");	//Nebo myslíš, že stín na to má?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_20");	//Ne, tady mi nijak pomoci nemůžeš.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_21");	//Udělám to sám, můžeš se dívat.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_22");	//Teď jdi, můžeš si chvíli odpočinout. 
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_23");	//Tady, vem si tohle zlato. Zasloužíš si ho.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_24");	//Teď jdi.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges,"Řekl jsem mistru Haniarovi vše, co jsem se dozvěděl o mistru Osairovi. Zdá se, že mistr Tiamant se za to bude brzy zodpovídat. No, mě to neuškodí.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_25");	//Dobře, tak tohle vyřídíme později, máš ještě něco?
	};
};


func void DIA_Ass_126_Haniar_BlameTiamant_Nrozas()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_01");	//Zjistil jsem něco o mistru Nrozasovi.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_02");	//Co s ním?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_03");	//Vypadá to, že moc nevychází s mistrem Tiamantem.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_04");	//Hlavně potom, co mu mistr Tiamant odepřel jednu žádost.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_05");	//Zajímavé. Povídej dál.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_06");	//Mistr Nrozas potřeboval vzácný jed z Muritana. Ale mistr Tiamant se s ním nechtěl podělit. 
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_07");	//Mistr Nrozas teď čeká až mu bude moci tuto 'laskavost' oplatit. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_08");	//Cože? Mistr Tiamant se tedy pohádal s mistrem Nrozasem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_09");	//Měl by mu vyjít vstříc.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_10");	//Lidí, jako je mistr Nrozas, je třeba se obávat.
	HaniarKnowNrozas = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_11");	//Ale dost o tom. Máš ještě něco?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_12");	//To je vše, mistře.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_13");	//Dobrá práce, důvěřuji ti.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_14");	//Co teď?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_15");	//Nic dobrého pro mistra Tiamanta...
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_16");	//Jen polovina toho, co jsi řekl, by stačila na to, aby podle našich zákonů zemřel. 
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_17");	//Mám ho tedy zabít?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_18");	//Ne, ty na to nemáš dostatečné postavení.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_19");	//Musí to být někdo na stejné úrovni, jinak je to dle našeho práva nemožné. 
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_20");	//A taky si nemyslím, že bys porazil jednoho z nejlepších bojovníků Masyafu!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_21");	//Nebo si myslíš, že na to obyčejný stín má?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_22");	//Ne, tohle musím udělat sám.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_23");	//Ale můžeš se dívat.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_24");	//No, můžeš jít, trochu si odpočiň.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_25");	//A taky si vem tohle zlato. Nelhal jsem ti, když jsem řekl, že se ti vyplatí pro mě pracovat.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_26");	//Tak a už jdi.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges,"Řekl jsem mistru Haniarovi vše, co jsem se dozvěděl o mistru Tiamantovi. Zdá se, že mistr Tiamant za to bude brzy zodpovídat. No, mě to neuškodí.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_27");	//Ale dost o tomhle... Máš ještě něco?
	};
};


func void DIA_Ass_126_Haniar_BlameTiamant_Hasim()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_01");	//Vím, proč musel Hasim zemřít.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_02");	//Tak to mi hned řekni vše, co víš.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_03");	//V podhorském průchodu je velký a bohatý zlatý důl.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_04");	//Nikdo o tom nevěděl. Nikdo kromě mistra Tiamanta. Až do teď. 
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_05");	//Chtěl důl jen pro sebe, ale Hasim se o tom tajemství dozvěděl.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_06");	//Ale neměl už čas ti o tom říct... Díky mně...
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_07");	//Prvně chtěl mistr Tiamant tuhle záležitost svěřit Lukovi.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_08");	//Ale pak se rozhodl pro mě. 
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_09");	//A jako důkaz svých slov ti nesu tento dopis.
	B_GiveInvItems(other,self,ItWr_Luka,1);
	B_UseFakeScroll();
	HaniarKnowHasim = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_11");	//Hmm... (smutně) Ještě něco?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_12");	//To je vše, mistře.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_13");	//Dobrá práce, důvěřuji ti.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_14");	//Co teď?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_15");	//Nic dobrého pro mistra Tiamanta.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_16");	//Jen polovina toho, co jsi řekl, by stačila na to, aby podle našich zákonů zemřel. 
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_17");	//Mám ho zabít?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_18");	//Ne, ty na to nemáš dostatečné postavení.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_19");	//Musí to být někdo na stejné úrovni, jinak je to dle našeho práva nemožné. 
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_20");	//A taky si nemyslím, že bys porazil jednoho z nejlepších bojovníků Masyafu!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_21");	//Nebo si myslíš, že na to obyčejný stín má?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_22");	//Ne, tohle musím udělat sám.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_23");	//Ale můžeš se dívat.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_24");	//No, můžeš jít, trochu si odpočiň.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_25");	//A taky si vem tohle zlato. Nelhal jsem ti, když jsem řekl, že se ti vyplatí pro mě pracovat.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_26");	//Teď už jdi.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges,"Řekl jsem mistru Haniarovi vše, co jsem se dozvěděl o mistru Tiamantovi. Zdá se, že mistr Tiamant za to bude brzy zodpovídat. No, mě to neuškodí.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_27");	//(zasmušile) Co ještě?
	};
};

instance DIA_Ass_126_Haniar_DeadTiamant(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_DeadTiamant_condition;
	information = DIA_Ass_126_Haniar_DeadTiamant_info;
	permanent = FALSE;
	description = "To bylo působivé, mistře!";
};

func int DIA_Ass_126_Haniar_DeadTiamant_condition()
{
	if((TiamantIsDead == TRUE) && (MIS_PW_FollowGoldOre == LOG_Success))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_DeadTiamant_info()
{
	OsairSeekYou = TRUE;
	AI_Output(other,self,"DIA_Ass_126_Haniar_DeadTiamant_01_01");	//To bylo působivé, mistře!
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_02");	//Možná, ale nemysli si, že jsem to udělal rád.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_03");	//Ztráta jednoho z převorů, obzvláště takového, jako byl Tiamant, bude mít zcela jistě vliv na bratrstvo. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_04");	//A to ne zrovna dobrý.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_05");	//Ale musel jsem to udělat, žádaly si to naše zákony.
	AI_Output(other,self,"DIA_Ass_126_Haniar_DeadTiamant_01_06");	//Co teď?
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_07");	//Zatím nic. Časem budeme muset zvolit nového převora.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_08");	//Mezitím mistr Osair převezme Tiamantovu práci.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_09");	//Mimochodem myslím, že tě hledal. Neměl bys ho nechat čekat.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_10");	//Tak jdi.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_TrueBattle(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_condition;
	information = dia_Ass_126_Haniar_TrueBattle_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_TrueBattle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Running) && (NrozasIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_01_00");	//Teď ne!
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_info;
	permanent = FALSE;
	description = "Chtěl jsi mě vidět, mistře?";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_01");	//Chtěl jsi mě vidět, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_02");	//Ano, dobře, že jsi tady. Slyšel jsem, že jsi mistru Nrozasovi pomohl s jeho studiem.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_03");	//To je pravda, testovali jsme jeden jed.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_04");	//A jak to dopadlo?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_05");	//Obrovského trola vyřídil za pár sekund.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_06");	//Hmm... Jsem velmi spokojen s jeho pokrokem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_07");	//Ale zároveň je to trochu... Děsivé.
	AI_PlayAni(other,"T_SEARCH");
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_08");	//Co tím myslíš, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_09");	//No, samozřejmě, že nepochybuji o jeho úmyslech, ale s tímto jedem se může stát nebezpečným...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_10");	//... Kdyby ho použil jinak, než pro dobro bratrstva. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_11");	//A pokušení může zlomit i nejodolnější mysl. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_12");	//Kromě toho se v poslední době dějí v bratrstvu divné věci.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_13");	//Někdy mám dojem, že do našich záležitostí zasahuje nějaká zlá síla.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_14");	//Chování mnoha bratrů mě znepokojuje.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_15");	//Třeba mistr Tiamant! 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_16");	//Máš teď nějaké rozkazy?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_17");	//Jenom donést mistru Nrozasovi láhev vína.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_18");	//Láhev vína?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_19");	//Dal mi ho mistr Osair jako výraz vděčnosti za lahvičku s jedem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_20");	//(překvapeně) Mistr Osair o něj měl zájem? 
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_21");	//Myslím, že ano. Chtěl od mistra Nrozase větší množsví.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_22");	//Podivné... A já zase nic nevím.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_23");	//To mi mohl říct.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_24");	//Má to pro své lidi, s tím jedem budou neporazitelní.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_25");	//No, nechci dělat ukvapené závěry...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_26");	//Ale zdá se, že naše bratrstvo je v nebezpečí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_27");	//Mistr Osair, to je už o něčem jiném.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_28");	//On chtěl vždy moc pro sebe.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_29");	//Dokonce i když jsme přijeli na toto místo. Hned se usadil v samostatné jeskyni.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_30");	//Myslím, že by chtěl mé místo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_31");	//(vážně) Tu láhev vína, máš ji s sebou?

	if(Npc_HasItems(other,ItFo_BeliarTear) >= 1)
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_32");	//Ano, to je ona.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_33");	//Dej mi ji.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_34");	//Samozřejmě, tady je...
		B_GiveInvItems(other,self,ItFo_BeliarTear,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_35");	//(překvapeně) Beliarova slza? Tento druh vína pijí snad jen králové.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_36");	//Proč by se mistr Osair loučil s takovým pokladem?
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_37");	//Vypadá to celé dost divně, musím popřemýšlet...
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_38");	//Promluvíme si později.
		HaniarGetGift = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_39");	//Nemám ji.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_40");	//Už jsi ji dal mistru Nrozasovi?
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_41");	//Okamžitě mi ji přines! 
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift_Lol(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_info;
	permanent = FALSE;
	description = "Zde je ta láhev vína.";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE) && (Npc_HasItems(hero,ItFo_BeliarTear) >= 1) && (Npc_KnowsInfo(hero,DIA_Ass_126_Haniar_NrozasPoisonGift)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_01");	//Zde je ta láhev vína.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_02");	//Sem s tím!
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_03");	//Jistě, tady je, mistře.
	B_GiveInvItems(other,self,ItFo_BeliarTear,1);
	Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_04");	//(překvapeně) Beliarova slza? Tento druh vína pijí snad jen králové.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_05");	//Proč by se mistr Osair loučil s takovým pokladem?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_06");	//Vypadá to celé dost divně, musím popřemýšlet...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_07");	//Promluvíme si později.
	HaniarGetGift = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift_Ok(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == TRUE) && (Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_01");	//Mé obavy byly potvrzeny. To víno bylo otráveno.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_02");	//Cože?!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_03");	//Měl jsi štěstí, že se to zjistilo dříve, než jsi ho doručil mistru Nrozasovi. Přesněji měli jste štěstí oba.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_04");	//Ten blázen by to pravděpodobně vypil a ani by ho nenapadlo, že je něco špatně. 
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_05");	//Děkuji, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_06");	//Mistr Osair hraje nebezpečnou hru. A Tiamantova smrt mu jen rozvázala ruce.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_07");	//Chtěl zabít i mistra Nrozase a hodit odpovědnost na tebe.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_08");	//Pak bych mu zůstal v cestě už jenom já.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_09");	//Nicméně to udělal velkou chybu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_10");	//Jeho touha po moci se stane jeho záhubou.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_11");	//Ale rozhodně bychom ho neměli podceňovat.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_12");	//Nedovolím, aby zničil něco, co jsme budovali po staletí.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_13");	//Co máš v úmyslu, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_14");	//Potřebuji důkazy, abych mohl mistra Osaira veřejně obvinit.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_15");	//Je nutné ho jen přinutit, aby pokračoval ve svých plánech...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_16");	//A to zařídíš ty.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_17");	//Udělám vše, co bude v mých silách.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_18");	//Skvěle, já se zatím postarám o mistra Nrozase, jeho smrt nám pomůže.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_19");	//Ty ho chceš zabít...?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_20");	//Ne tak docela. Kromě toho je příliš cenný a jeho znalosti jsou příliš velké, než abychom si mohli dovolit ho ztratit.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_21");	//Pouze ho na chvíli uklidím do vnitřní svatyně, kde se bude moci nerušeně věnovat svým experimentům ve prospěch bratrstva.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_22");	//Ale pro ostatní je mistr Nrozas mrtvý! Hlavně pro mistra Osaira...
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_23");	//Vnitřní svatyně...?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_24");	//Chápu tvé překvapení, vím o ní jen já. A teď i ty... 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_25");	//Je to ideální místo pro ukrytí důležitých tajemství.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_26");	//A co se tam skrývá?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_27");	//To vědět nepotřebuješ.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_28");	//Pokud jde o mistra Osaira, napíšu ti pro něj dopis, který mu doneseš.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_29");	//Nabídnu mu vysvětlení situace v bratrstvu z očí do očí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_30");	//Jsem si jistý, že takovou možnost si nenechá ujít.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_31");	//A to bude jeho konec.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_32");	//Nicméně potřebuji chvilku na napsání toho dopisu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_33");	//A až půjdeš za mistrem Nrozasem, dones mu tohle víno.
	B_GiveInvItems(self,other,ItFo_BeliarTear_Haniar,1); 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_34");	//A samozřejmě ho představ jako Osairův dar!
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_35");	//Nezabije ho to...?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_36");	//Neboj se, nyní je naprosto bezpečné.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_37");	//Dopřej starému muži trochu božského nektaru.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_38");	//Tak jdi, uvidíme se později. 
	B_LogEntry(TOPIC_NrozasPoisonGift,"Mistr Haniar mi řekl, že víno pro mistra Nrozase bylo otrávené. Zdá se, že mistr Osair chtěl zabít mistra Nrozase a mě do toho namočit. Vypadá to, že se chce zbavit všech převorů bratrstva a ujmout se moci. Nicméně mistr Haniar přišel se svým vlastním plánem... A ten se mistru Osairovi líbit nebude. Mám teď ještě donést mistru Nrozasovii již bezpečné víno.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_NrozasPoisonGift_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Done_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Done_info;
	permanent = FALSE;
	description = "Donesl jsem mistru Nrozasovi to víno, mistře.";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Done_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Success) && (HaniarGetGift == TRUE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Done_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_01");	//Donesl jsem mistru Nrozasovi to víno, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_02");	//Výborně, tam, kde je teď, mu bude dobře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_03");	//Já jsem mezitím napsal ten dopis. Vezmi si ho a dones ho mistru Osairovi.
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1); 
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_04");	//Myslím, že nebude moc rád až mě uvidí.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_05");	//Neboj se, nedotkne se mého posla!
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_06");	//A co ty? Půjdeš sám, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_07");	//Samozřejmě.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_08");	//Mohl bys mistra Osaira vyplašit a pak bych z něj nic nedostal.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_09");	//Budeš proti němu a jeho lidem bojovat sám.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_10");	//Doufám, že prohlédnou, co je mistr Osair zač.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_11");	//A teď už dost, jdi mu zanést ten dopis.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_12");	//Už jdu, mistře.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_TrueBattle_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_Done_condition;
	information = dia_Ass_126_Haniar_TrueBattle_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_TrueBattle_Done_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_Done_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_00");	//Mistr Nrozas padl... Kdo by si to pomyslel.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_01");	//Takže jsi měl pravdu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_02");	//Avšak není pochyb o tom, že jeho ztráta nám do budoucna poslouží.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_03");	//Co už, stalo se. 
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Ass_126_Haniar,"Start");
};

instance DIA_Ass_126_Haniar_TrueBattle_Next(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_Next_condition;
	information = dia_Ass_126_Haniar_TrueBattle_Next_info;
	permanent = FALSE;
	description = "Ještě nějaké příkazy, mistře?";
};

func int dia_Ass_126_Haniar_TrueBattle_Next_condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_Next_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_TrueBattle_Next_01_00");	//Ještě nějaké příkazy, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_01");	//Ano. Potřebuji, abys šel ke svatyni Beliara.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_02");	//Dám ti zlato, které mu nabídneš jako dar.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_03");	//V poslední době věci v bratrstvu nejsou zrovna poklidné.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_04");	//Snad nám tato oběť přinese jeho náklonnost.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_05");	//Jen si to zlato nezkoušej přisvojit... Sedřel bych z tebe kůži.
	AI_Output(other,self,"DIA_Ass_126_Haniar_TrueBattle_Next_01_06");	//Jistě, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_07");	//Tady máš, jdi.
	B_GiveInvItems(self,other,ItMi_Gold,2000); 
	MIS_BeliarTribe = LOG_Running;
	Log_CreateTopic(TOPIC_BeliarTribe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BeliarTribe,LOG_Running);
	B_LogEntry(TOPIC_BeliarTribe,"Musím jít ke svatyni Beliara a obětovat mu zlato mistra Haniara Slepého.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_BeliarTribe(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_BeliarTribe_condition;
	information = dia_Ass_126_Haniar_BeliarTribe_info;
	permanent = FALSE;
	description = "Beliar dostal svou oběť, mistře.";
};

func int dia_Ass_126_Haniar_BeliarTribe_condition()
{
	if(MIS_BeliarTribe == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_BeliarTribe_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BeliarTribe_01_00");	//Beliar dostal svou oběť, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BeliarTribe_01_01");	//To rád slyším, doufejme, že nám to pomůže!
};

instance DIA_Ass_126_Haniar_OsairTrait(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_OsairTrait_condition;
	information = dia_Ass_126_Haniar_OsairTrait_info;
	permanent = FALSE;
	description = "Mám pro tebe špatnou zprávu, mistře.";
};

func int dia_Ass_126_Haniar_OsairTrait_condition()
{
	if((MIS_OsairTrait == LOG_Running) && (Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0)))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_OsairTrait_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_00");	//Mám pro tebe špatnou zprávu, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_01");	//Co je to?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_02");	//Zdá se, že mistr Osair shromažďuje své věrné stoupence k útoku na chrám.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_03");	//(zachmuřeně) Nepříjemné. Jsi si jistý?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_04");	//Osobně se mě také snažil získat na svou stranu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_05");	//A co jsi mu odpověděl?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_06");	//No, předstíral jsem souhlas.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_07");	//Dobře! To, že jsi teď přišel za mnou, vypovídá dost.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_08");	//Je dobře, že jsi tak chytrý abys věděl, komu věřit.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_09");	//Takže mistr Osair začal svou nebezpečnou hru. Smrt mistra Tiamanta a Nrozase mu rozvázala ruce.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_10");	//A teď se ukázalo, jaký ve skutečnosti je.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_11");	//Vypadá to tak.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_12");	//Dělá velkou chybu, jestli si myslí, že mě odstraní.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_13");	//Jeho touha po moci mu brání vidět mou vlastní sílu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_14");	//Ale neměli bychom ho podceňovat...
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_15");	//Chce kvůli svým ambicím zničit něco, co jsme budovali staletí.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_16");	//Co budeme dělat, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_17");	//Zatím nemůžeme dělat nic, dokud nebudeme mít důkazy.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_18");	//Je nutné ho nechat udělat první krok.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_19");	//Ty mi s tím pomůžeš!
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_20");	//Udělám vše, co bude v mých silách, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_21");	//Dobře. Napíšu ti dopis. Doneseš mu ho.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_22");	//Vyzvu ho, aby si se mnou promluvil osobně.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_23");	//Jsem si jistý, že to neodmítne.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_24");	//A to bude jeho konec.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_25");	//Hned ten dopis napíšu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_26");	//Počkej chvíli. 
	B_LogEntry(TOPIC_OsairTrait,"Řekl jsem mistru Haniarovi o plánech mistra Osaira. Ten přišel se svým vlastním, jak mistra Osaira zastavit. Potřebuji počkat, než napíše dopis pro mistra Osaira a pak ho doručit.");
	HaniarWriteLetter = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LetterWrite");
};

instance DIA_Ass_126_Haniar_OsairTrait_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_OsairTrait_Done_condition;
	information = DIA_Ass_126_Haniar_OsairTrait_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_OsairTrait_Done_condition()
{
	if((MIS_OsairTrait == LOG_Running) && (HaniarWriteLetter == TRUE) && (HaniarWriteLetterDone == TRUE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_OsairTrait_Done_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_01");	//Tady, vem si ten dopis a jdi s ním za mistrem Osairem.
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1); 
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_02");	//Nemyslím, že mě zrovna uvítá.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_03");	//Nedovolí si vztáhnout ruku na mého posla, jen jdi.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_04");	//A co ty mistře, půjdeš pak za ním sám?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_05");	//Rozhodně.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_06");	//Kdybys šel se mnou, mohlo by ho to vystrašit.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_07");	//Budeš muset čelit všem jeho lidem.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_08");	//Já vím, ale doufejme, že dostanou rozum!
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_09");	//Teď už dost, dones mu ten dopis.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_10");	//Už jdu, mistře.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Ass_126_Haniar_PRETEACH_MANA(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 23;
	condition = dia_Ass_126_Haniar_preteach_mana_condition;
	information = dia_Ass_126_Haniar_preteach_mana_info;
	permanent = FALSE;
	description = "Co mě můžeš naučit, mistře?";
};

func int dia_Ass_126_Haniar_preteach_mana_condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_preteach_mana_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_PreTeach_Mana_01_00");	//Co mě můžeš naučit, mistře?
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_01");	//Hmm... Nejdůležitější je duševní síla.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_02");	//I když samozřejmě nepraktikujeme magii stejně, jako temní mágové ve Varantu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_03");	//Ale to stále neznamená, že bychom duševní sílu mohli opomínat.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_04");	//Takže jestli chceš, můžu učit i tebe.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_05");	//Také ti pomůžu zocelit tělo a posílit tvou vytrvalost.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_06");	//Samozřejmě za předpokladu, že na to budeš připraven.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_07");	//Chceš-li se věnovat umění boje, měl bysi navštívit mistra Tiamanta.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_08");	//Učí naše bratry boji.
	HaniarTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Mistr Haniar mě může trénovat v oblastech duševní síly, životní energie a výdrže.");
};


instance DIA_Ass_126_Haniar_TEACH_MANA(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 10;
	condition = dia_Ass_126_Haniar_teach_mana_condition;
	information = dia_Ass_126_Haniar_teach_mana_info;
	permanent = TRUE;
	description = "Chci se učit, mistře.";
};

func int dia_Ass_126_Haniar_teach_mana_condition()
{
	if(HaniarTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_TEACH_MANA_01_00");	//Chci se učit, mistře.
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_back()
{
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
};

func void DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth()
{
	var int kosten;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_04");	//Nauč mě regeneraci zdraví.

	kosten = 5;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Naučeno: Regenerace zdraví");
		VATRAS_TEACHREGEN = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);
};

func void dia_Ass_126_Haniar_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_stamina_1()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,1))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_stamina_5()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,5))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_hp_1()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_hp_5()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Regenerace zdraví (VB: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};


instance DIA_Ass_126_Haniar_FinalHaniar(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_FinalHaniar_condition;
	information = DIA_Ass_126_Haniar_FinalHaniar_info;
	permanent = FALSE;
	description = "Mistr Osair souhlasil se schůzkou, mistře.";
};

func int DIA_Ass_126_Haniar_FinalHaniar_condition()
{
	if(OsairReadyMeeting == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_FinalHaniar_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalHaniar_01_01");	//Mistr Osair souhlasil se schůzkou, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_02");	//Velmi dobře. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_03");	//Doufám, že to je ta příležitost, na kterou se tak těším... (zlověstně)
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_04");	//Co se týče tebe, zvládl jsi svoji práci dobře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_05");	//Nyní si můžeš jít odpočinout.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_06");	//Až vyřeším problémy s mistrem Osairem, možná pro tebe ještě budu něco mít.

	if(MIS_OsairTrait == LOG_Running)
	{
		MIS_OsairTrait = LOG_Success;
		Log_SetTopicStatus(TOPIC_OsairTrait,LOG_Success);
	};

	B_LogEntry(TOPIC_MasiafStory,"Musím Gonzalese informovat o setkání mistra Haniara s mistrem Osairem, bratrstvo se rozpadá...");
	HaniarReadyMeeting = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_Meeting(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_Meeting_condition;
	information = DIA_Ass_126_Haniar_Meeting_info;
	permanent = FALSE;
	description = "Můžu ti pomoci s lidmi mistra Osaira?";
};

func int DIA_Ass_126_Haniar_Meeting_condition()
{
	if((HaniarReadyMeeting == TRUE) && (HideMeetCome == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_Meeting_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Meeting_01_01");	//Můžu ti pomoci s lidmi mistra Osaira?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Meeting_01_02");	//Jestli si ceníš svého života, raději se drž stranou.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Meeting_01_03");	//To je jediná věc, co ti k tomu řeknu.
};

instance DIA_Ass_126_Haniar_CareOsair(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_CareOsair_condition;
	information = DIA_Ass_126_Haniar_CareOsair_info;
	permanent = FALSE;
	description = "Mám pro tebe zajímavé zprávy.";
};

func int DIA_Ass_126_Haniar_CareOsair_condition()
{
	if((MIS_CareOsair == LOG_Running) && (NazimNeedGetOutCave == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_CareOsair_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_01");	//Mám pro tebe zajímavé zprávy, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_02");	//Pokračuj...
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_03");	//Mistr Osair mi dal rozkaz, abych si zajistil podporu více stínů.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_04");	//Hmm... Jména?
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_05");	//Farid, Rufat, Nazim a Kudir.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_06");	//Zajímavé, neříkal proč? 
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_07");	//Myslím, že budeš vědět.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_08");	//Samozřejmě... (smutně) Ta jména, která jsi právě řekl... Mistr Osair si je vybral záměrně.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_09");	//Pozoruj vše, co se šustne, může to být důležité.
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_10");	//Dobře, udělám vše, co budu moci.
	HaniarKnowsOsairPlans_01 = TRUE;
};

instance DIA_Ass_126_Haniar_NazimNeedGetOutCave(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NazimNeedGetOutCave_condition;
	information = DIA_Ass_126_Haniar_NazimNeedGetOutCave_info;
	permanent = FALSE;
	description = "Můžu nahradit Nazima v šachtě?";
};

func int DIA_Ass_126_Haniar_NazimNeedGetOutCave_condition()
{
	if((NazimNeedGetOutCave == TRUE) && (MIS_CareOsair == LOG_Running) && (NazimGetOutCave == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_01_01");	//Můžu nahradit Nazima v šachtě?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_01_02");	//Hmm... A co se mu stalo?
	Info_ClearChoices(DIA_Ass_126_Haniar_NazimNeedGetOutCave);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Prostě tu práci nemá rád.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_None);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Potřebuji jeho pomoc.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Je nemocný, mistře.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Chce ho u sebe mistr Osair.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_01");	//Prostě tu práci nemá rád.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_02");	//Pak se s tím bude muset smířit, protože zůstane tam, kde je.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_03");	//A delší dobu, než bylo zamýšleno.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_04");	//Dobře...
	B_LogEntry(TOPIC_CareOsair,"Myslím, že jsem Nazimovi ještě více uškodil.");
	NazimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_01");	//Potřebuji jeho pomoc.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_02");	//Opravdu? Proč?

	if(HaniarKnowsOsairPlans_01 == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_03");	//Je to důležité pro nás oba.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_04");	//Rozumím. Dobrá!
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_05");	//Řekni Nazimovi, že může opustit svoji pozici v dole.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_06");	//Doufám, že toho nebudu litovat.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_07");	//Spolehni se, mistře.
		NazimGetOutCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Mistr Haniar souhlasil s uvolněním Nazima z dolu. Měl bych mu to říct.");
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_08");	//Chci lovit divokou zvěř.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_09");	//A potřebuji. Někoho, kdo mi bude krýt záda.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_10");	//A takový zkušený bojovník by to dokázal.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_11");	//Hmm... To bude lepší, když Nazim zůstane tam, kde je.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_12");	//Tam bude užitečnější.
 		NazimStayInCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Mistr Haniar odmítl pustit Nazima z jeho pozice v dole. Teď nebude moci pracovat pro mistra Osaira.");
	};
	
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_01");	//Je nemocný, mistře.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_02");	//Opravdu...? Co je s ním?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_03");	//Má nějakou kožní nemoc, deformuje mu to celý obličej.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_04");	//No ten ale nepotřebuje, ne?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_05");	//Stín nikdy neukazuje svou pravou tvář!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_06");	//Takže může zůstat tam, kde je.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_07");	//Řekni mu to.
	NazimStayInCave = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Mistr Haniar Nazima nepustí z jeho místa v dole.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_01");	//Chce ho u sebe mistr Osair.

	if(HaniarKnowsOsairPlans_01 == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_02");	//Hmm... No!
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_03");	//Dobře, řekni mu, že může opustit své místo.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_04");	//Doufejme, že to bude stát za to.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_05");	//Děkuji, mistře.
		NazimGetOutCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Mistr Haniar souhlasil s uvolněním Nazima z dolu. Měl bych mu to říct.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_06");	//Pokud ho Osair chce tak dychtivě, ať přijde za mnou.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_07");	//Nazim je můj muž a zůstane tam, kde je.
 		NazimStayInCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Mistr Haniar odmítl pustit Nazima z jeho pozice v dole. Teď nebude moci pracovat pro mistra Osaira.");
	};

	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_FinalTalk(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_FinalTalk_condition;
	information = DIA_Ass_126_Haniar_FinalTalk_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_FinalTalk_condition()
{
	if(HaniarFinalTalk == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_FinalTalk_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_01");	//Takže ty ses odvážil přijít až sem. Varoval jsem tě.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_02");	//Jak vidíš, to mě nezastavilo.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_03");	//Překvapil jsi mě. Kdo je to s tebou?
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_04");	//Myslím, že ho znáš.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_05");	//No samozřejmě. Můj starý přítel Gonzales.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_06");	//Nyní je mi vše jasné.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_07");	//Tak, Gonzalesi. Snil jsi o tom, jak se mi pomstíš?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_08");	//Vídím to v tvých očích, ale zklamu tě.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_09");	//Tebe vyřídím bez námahy.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_10");	//Uvidíme.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_11");	//Tvé sebevědomí jen ukazuje tvou hloupost.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_12");	//Teď poznáš pravou moc mého pána.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_13");	//Takže ty jsi jen sluha? Kdo je tvůj pán?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_14");	//Mohl bys ho najít ve vnitřní svatyni chrámu... Ale tam se nikdy nedostaneš.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_15");	//Jestli tě zabiju, tak dostanu.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_16");	//Jen to zkus. Za Beliara!
	PlayerIsPrioratFake = TRUE;
	self.flags = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	Info_ClearChoices(DIA_Ass_126_Haniar_FinalTalk);
	Info_AddChoice(DIA_Ass_126_Haniar_FinalTalk,Dialog_Ende,DIA_Ass_126_Haniar_FinalTalk_None);
};

func void DIA_Ass_126_Haniar_FinalTalk_None()
{
	AI_StopProcessInfos(self);
	TempleIsClear = TRUE;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_KILL,0);
};
