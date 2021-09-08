
var int RagnarPissOff;

instance DIA_STRF_8160_Ragnar_EXIT(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 999;
	condition = DIA_STRF_8160_Ragnar_exit_condition;
	information = DIA_STRF_8160_Ragnar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int DIA_STRF_8160_Ragnar_exit_condition()
{
	return TRUE;
};
func void DIA_STRF_8160_Ragnar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_PreHello(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_PreHello_condition;
	information = DIA_STRF_8160_Ragnar_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8160_Ragnar_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_PreHello_01_00");	//Co, přišel ses mi posmívat? Do toho, mě už je to jedno.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_PreHello_01_01");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_PreHello_01_02");	//Říkám - nech mě na pokoji! Nech mě v klidu umřít.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_Hello(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_Hello_condition;
	information = DIA_STRF_8160_Ragnar_Hello_info;
	permanent = FALSE;
	description = "Zdá se, že máš nějaký problém kamaráde.";
};

func int DIA_STRF_8160_Ragnar_Hello_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_PreHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_Hello_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_01_00");	//Zdá se, že máš nějaký problém kamaráde.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_01_01");	//Problém? (mrzutě) A co ty! Já žádnej nemám.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_01_02");	//Tedy jestli nepočítáš to, že jsem uprchlý trestanec a už týden jsem nic nejedl.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_01_03");	//No tak vidíš? Potřebuješ mojí pomoc!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_01_04");	//Hmmm... (podezřívavě) A co za to budeš chtít?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Taky jsem byl za bariérou, stejně jako ty.",DIA_STRF_8160_Ragnar_Hello_W1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Jen hledám dobrodružství.",DIA_STRF_8160_Ragnar_Hello_W2);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"To já jsem zničil bariéru nad kolonií!",DIA_STRF_8160_Ragnar_Hello_W3);
};

func void DIA_STRF_8160_Ragnar_Hello_W1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_W1_01_00");	//Taky jsem byl za bariérou, stejně jako ty.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W1_01_01");	//Opravdu?!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W1_01_02");	//Slyšel jsem, že uprchlíci se buď přidali k žoldákům nebo se z nich stali banditi.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);

	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Jak vidíš, jsem žoldák z Onarovy farmy.",DIA_STRF_8160_Ragnar_Hello_Q2);
	}
	else
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"To není nic pro mě!",DIA_STRF_8160_Ragnar_Hello_Q1);
	};

	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Jsem prostě bandita.",DIA_STRF_8160_Ragnar_Hello_Q3);
};

func void DIA_STRF_8160_Ragnar_Hello_W2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_W2_01_00");	//Jen hledám dobrodružství.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W2_01_01");	//Tak to jsi na špatném místě.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W2_01_02");	//Jak vidíš, tady žádné dobrodružství nezažiješ.
};

func void DIA_STRF_8160_Ragnar_Hello_W3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_W3_01_00");	//To já jsem zničil bariéru nad kolonií!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W3_01_01");	//No ano, je to na tobě vidět.
};

func void DIA_STRF_8160_Ragnar_Hello_Q1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_00");	//To není nic pro mě! Spoléhám sám na sebe, nepaktuju se s jedněma ani s druhýma.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_01");	//Na tvém místě bych se vydal buď do města nebo do kláštera k mágům Ohně.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_02");	//No, v krajním případě se můžeš vydat do tábora Bratrstva.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_03");	//Tam stále potřebují nové členy!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_04");	//Ó, ne. Jen k nim ne! Znám je ještě z dob bariéry, ty to nemaj v hlavě úplně srovnaný!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_05");	//Celý dny jenom hulej trávu a plkaj o tom svém Spáči.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_06");	//O městě jsem už taky přemýšlel. Ale stráže mě nechtějí pustit přes bránu do města.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_07");	//A klášter to je vůbec ztracený. Co by asi mágové řekli na mojí minulost?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Tady máš sto zlatých.",DIA_STRF_8160_Ragnar_Hello_T1);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Vem si tisíc zlatých a přestaň remcat!",DIA_STRF_8160_Ragnar_Hello_T2);
	};

	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Tvé činy jsou zřejmě velmi špatné.",DIA_STRF_8160_Ragnar_Hello_T3);
};

func void DIA_STRF_8160_Ragnar_Hello_Q2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q2_01_00");	//Jak můžeš vidět, mám pomocníka žoldáka.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_01");	//Vidím, nejsem slepej. Také jsem se k nim chtěl přidat.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_02");	//Ale ten vydřiduch Sentenza po mě chtěl 50 zlatých za vstup.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_03");	//Jelikož jsem neměl ani floka, tak mě odkázal až k Beliarovi!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q2_01_04");	//Na mě to taky zkoušel.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_05");	//A co jsi udělal?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Zaplatil, samozřejmě! Svým způsobem.",DIA_STRF_8160_Ragnar_Hello_Y1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Bez ohledu na to, co jsem udělal.",DIA_STRF_8160_Ragnar_Hello_Y2);
};

func void DIA_STRF_8160_Ragnar_Hello_Y1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y1_01_06");	//Zaplatil, samozřejmě! Svým způsobem.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y1_01_07");	//Hmm... ano, taky bych to tak udělal, kdybych měl zlato.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y1_01_08");	//Možná, že bys mě mohl založit 50 zlatými?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y1_01_09");	//Dlužnej ti nezůstanu! Co říkáš?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Ne, zbláznil ses! Tolik zlata.",DIA_STRF_8160_Ragnar_Hello_R1);

	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Samozřejmě příteli, ať ti poslouží dobře.",DIA_STRF_8160_Ragnar_Hello_R2);
	};
};

func void DIA_STRF_8160_Ragnar_Hello_Y2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_10");	//Bez ohledu na to, co jsem udělal. Hlavní je, že ten bastard ode mě nedostal ani vindru.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y2_01_11");	//Jseš tvrďák, to je vidět... (nejistě) Možná bych mu i já mohl nakopat zadek?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_12");	//Samozřejmě! To je jediný způsob jak si získat respekt.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y2_01_13");	//No dobře... (drbe se na hlavě) Teď si trochu odpočinu a pak si to s ním vyřídím.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y2_01_14");	//Děkuji za radu, příteli.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_15");	//Není za co.
	AI_StopProcessInfos(self);
	RagnarKill = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_Q3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q3_01_00");	//Jelikož jsem bandita! Tak bych rád viděl tvoje zlato.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q3_01_01");	//Nemám ani vindru... (poraženecky) Tak co, jestli chceš, tak mě zabij!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q3_01_02");	//Dělej, mě už je všechno jedno...
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};


func void DIA_STRF_8160_Ragnar_Hello_R1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_R1_01_00");	//Ne, zbláznil ses! Tolik zlata.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R1_01_01");	//No co... (smutně) Pak máš někomu věřit, když mu je zatěžko půjčit 50 zlatých.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R1_01_02");	//Vypadni, sončil jsem s tebou. Nemáme už o čem diskutovat.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_R2()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_R2_01_00");	//Samozřejmě příteli, když ti to pomůže.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Npc_RemoveInvItems(self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R2_01_01");	//To je něco jiného. Hned vidím, že je předemnou člověk a ne kus hovna.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R2_01_02");	//Znamená to, že teď se můžu přidat k žoldákům. Nejdřív si, ale trochu odpočinu, než se vidám na farmu.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_R2_01_03");	//Tak se tam potkáme!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R2_01_04");	//Samo sebou.
	AI_StopProcessInfos(self);
	RagnarIsSLD = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_T1()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_00");	//Zde je sto zlatých a přestaň fňukat.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Npc_RemoveInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T1_01_01");	//A proč mě dáváš to zlato?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_02");	//Dáš ho strážím u jižní brány.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_03");	//Za takovou sumu, tě bez zbytečného vyptávání pustí do města.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T1_01_04");	//No, dobře tedy... Nyní se vydám do města a zkusím tam své štěstí.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_05");	//Dobře, ještě se uvidíme.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T1_01_06");	//Samo sebou.
	AI_StopProcessInfos(self);
	RagnarIsMIL = TRUE;
};


func void DIA_STRF_8160_Ragnar_Hello_T2()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_00");	//Tady máš tisíc zlatých a nestěžuj si!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_01");	//Chlape tobě přeskočilo? (udiveně) Ty mě opravdu chceš dát tolik zlata?!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_02");	//Mágové Ohně chtějí od každého nově příchozího nezrovna malý dar.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_03");	//A to je přesně ta suma, aby ti Innos odpustil všechny tvé předchozí hříchy.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_04");	//Nemyslel jsem si, že někdy potkám někoho takového jako jsi ty... (s rozvahou) Ale mýlil jsem se.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_05");	//Dobře teď mě omluv, vydám se do kláštera. Slyšel jsem, že dělají výborné víno!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_07");	//Potkáme se tam.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_08");	//Samo sebou.
	AI_StopProcessInfos(self);
	RagnarIsNOV = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_T3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T3_01_00");	//Tvé činy jsou zřejmě velmi špatné.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T3_01_01");	//To by ses divil! I bez tebe to vím moc dobře.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T3_01_02");	//Ach... (mrzutě) Běž si svou cestou a nech mě na pokoji.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_PissOff(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_PissOff_condition;
	information = DIA_STRF_8160_Ragnar_PissOff_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8160_Ragnar_PissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RagnarPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_PissOff_info()
{
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_PissOff_01_00");	//Nech mě být! Nic ty do mě...
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_Wait(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_Wait_condition;
	information = DIA_STRF_8160_Ragnar_Wait_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8160_Ragnar_Wait_condition()
{
	if((RagnarIsNOV == TRUE) || (RagnarIsSLD == TRUE) || (RagnarIsMIL == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_Wait_info()
{
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};

	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_00");	//Počkej chvilku! Sakra... Nemůžu ani vstát.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Wait_01_01");	//Co je to s tebou?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_02");	//Tolik dní jsem už nejedl, že jsem přišel o veškeré síly.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_03");	//Co kdybys mi přinesl něco k jídlu?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_04");	//Co takhle, kousek opečeného masa a láhev vody.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_05");	//Nic víc nežádám... (smutně) Bez toho dlouho nevydržím.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Wait_01_06");	//Dobře, počkej tady. Něco ti přinesu.
	MIS_RagnarFood = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarFood,LOG_Running);
	B_LogEntry(TOPIC_RagnarFood,"Ragnar nejedl tak dlouho, že je zcela vyčerpán. Budu tomu chudákovi muset pomoct, a přinést mu nějaké jídlo, měl by stačit kus opečeného masa a láhev vody.");
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_WaitDone(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_WaitDone_condition;
	information = DIA_STRF_8160_Ragnar_WaitDone_info;
	permanent = FALSE;
	description = "Tady je tvé jídlo.";
};

func int DIA_STRF_8160_Ragnar_WaitDone_condition()
{
	if((MIS_RagnarFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 1) && (Npc_HasItems(other,ItFo_Water) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_WaitDone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_WaitDone_01_00");	//Tady je tvé jídlo.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Water,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_WaitDone_01_01");	//Innos ti žehnej, příteli. Nenechal jsi mě zemřít hlady.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_WaitDone_01_02");	//Nech si chutnat.
	MIS_RagnarFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarFood,LOG_Success);
	B_LogEntry(TOPIC_RagnarFood,"Nenechal jsem Ragnara umřít hlady.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Pear");
};

//--------------------------------vetka monastyrya------------------------------------------------


instance DIA_STRF_8160_Ragnar_NOV(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_condition;
	information = DIA_STRF_8160_Ragnar_NOV_info;
	permanent = FALSE;
	description = "Jak to šlo?";
};

func int DIA_STRF_8160_Ragnar_NOV_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_01_00");	//Jak to šlo?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_01");	//Díky tvé pomoci mě mágové přijali za novice. Přesto jsem byl trochu zklamán.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_01_02");	//A proč?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_03");	//Bylo by to dobrý nebýt toho, že celé dny zametám dlažbu a večer zpátky do postele.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_04");	//Všichni okolo mě říkají 'Uč se trpělivosti', i když to může trvat celé roky.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_01_05");	//I tak je to lepší než umírat od hladu někde v lese. Nebo ne?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_06");	//Ano, to nepopírám... (smích)
};


instance DIA_STRF_8160_Ragnar_NOV_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Q1_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Q1_info;
	permanent = FALSE;
	description = "Potřebuješ jenom zapůsobit na mágy.";
};

func int DIA_STRF_8160_Ragnar_NOV_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_NOV) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_01");	//Potřebuješ jenom zapůsobit na mágy.
 	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_02");	//Už jsem o tom přemýšlel a něco mě napadlo!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_03");	//Co jsi vymyslel?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_04");	//Slyšel jsem, že mistr Neoras nutně potřebuje pomocníka. A zatím si nikoho z noviců nevybral.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_05");	//A ještě mě zaujalo, že se zajímá o vzácné byliny.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_06");	//A o jaké konkrétně se zajímá?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_07");	//Jedná se o rostlinu, kterou nazývá trolí bobule. Jen Beliar ví, jak to vypadá a kde to roste!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_08");	//Kdyby se mě podařilo přinést mu tu rostlinu, tak by si určitě vybral mě.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_09");	//Tak na co čekáš? Běž a najdi jí!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_10");	//Není to tak jednoduché příteli... (mrzutě) Parlan, mě nepustí za zdi kláštera.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_11");	//Ten starý bastard mě pořád sleduje. A vypadá to, že mě moc nevěří.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_12");	//Myslel jsem: jestli bys ty, nemohl pro mě tu rostlinu získat?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_NOV_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_NOV_Q1,"Dobře, zkusím ji pro tebe sehnat.",DIA_STRF_8160_Ragnar_NOV_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_NOV_Q1,"Ne, musíš se snažit sám!",DIA_STRF_8160_Ragnar_NOV_Q1_No);
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_Yes()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_01");	//Dobře, zkusím ji pro tebe sehnat.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_02");	//Děkuji ti, příteli. Neumíš si představit jak je únavné, to stálé zametání a okopávání vinic!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_03");	//Koneckonců nevyhrabal jsem se z Hornického údolí, abych znova dřel jak prokletej!
	MIS_RagnarNeoras = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarNeoras,LOG_Running);
	B_LogEntry(TOPIC_RagnarNeoras,"Ragnar je naštvaný, že musí trávit dny v klášteře těžkou dřinou. Ale slyšel, že mistr Neorasu potřebuje asistenta. Aby na něj udělal dojem, potřebuje vzácnou rostlinu - trolí bobuli. A požádal mě, abych mu ji sehnal, protože nemůže opustit klášter.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ITPL_SUPER_HERB,"FP_ITEM_RAGNARFLOWER");
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_No()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_01");	//Ne, musíš se snažit sám!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_02");	//Už tak jsem ti pomohl vstoupit do kláštera. Na ostatní teď nemám čas.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_03");	//Ach, dobře... Tak to asi do konce života budu zametat tuhle dlažbu.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_04");	//A já na tebe tak spoléhal, příteli...
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_NOV_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Q1Done_info;
	permanent = FALSE;
	description = "Přinesl jsem ti tu rostlinu co jsi potřeboval.";
};

func int DIA_STRF_8160_Ragnar_NOV_Q1Done_condition()
{
	if((MIS_RagnarNeoras == LOG_Running) && (Npc_HasItems(other,ITPL_SUPER_HERB) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Q1Done_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_00");	//Přinesl jsem ti tu rostlinu co jsi potřeboval.
	B_GiveInvItems(other,self,ITPL_SUPER_HERB,1);
	Npc_RemoveInvItems(self,ITPL_SUPER_HERB,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_01");	//Aha! Nikdy bych si nemyslel, že bude takhle vypadat.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_02");	//Místo toho tlachání běž a dones ji Neorasovi.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_03");	//Ano příteli, máš pravdu! Aby mě ještě někdo nepředběhnul.
	MIS_RagnarNeoras = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarNeoras,LOG_Success);
	B_LogEntry(TOPIC_RagnarNeoras,"Přinesl jsem Ragnarovi rostlinu co potřeboval.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Neoras");
};

var int RangarFireContestDay;

instance DIA_STRF_8160_Ragnar_NOV_Neoras(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Neoras_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Neoras_info;
	permanent = FALSE;
	description = "Povedlo se?";
};

func int DIA_STRF_8160_Ragnar_NOV_Neoras_condition()
{
	if(MIS_RagnarNeoras == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Neoras_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_00");	//Povedlo se?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_01");	//(spokojeně) Jak vidíš. Jsem pomocník mistra Neorase! A za vše vděčím tobě.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_02");	//Tady, vezmi si tenhle lektvar. Dal mě ho mistr Neoras, za to, že jsem mu donesl tu rostlinu.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_03");	//Myslím si, že je po právu tvůj.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	RangarFireContestDay = Wld_GetDay();
};

instance DIA_STRF_8160_Ragnar_BecameKDF(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_info;
	permanent = FALSE;
	description = "Co je nového?";
};

func int DIA_STRF_8160_Ragnar_BecameKDF_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_NOV_Neoras) == TRUE) && (Kapitel >= 4) && (RangarFireContestDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_01_00");	//Co je nového?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_01");	//Nedávno začala zkouška ohně... (nervózně) Pro mě a ještě několik noviců.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_01_02");	//Vypadá to, že z toho nemáš radost.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_03");	//Neměl jsem na vybranou. Mistr Neoras předložil moji kandidaturu přímo mistru Pyrokarovi!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_04");	//A já netuším, jak se s tím vším mám vypořádat.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_05");	//Jestli tou zkouškou neprojdu, tak to bude velké zklamání pro mistra Neorase.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_06");	//A pomažu zpátky s motykou v ruce na vinohrad.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_07");	//A jak víš, není to zrovna příjemná práce!
};

instance DIA_STRF_8160_Ragnar_BecameKDF_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_Q1_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_Q1_info;
	permanent = FALSE;
	description = "Co ti dali mágové za úkol?";
};

func int DIA_STRF_8160_Ragnar_BecameKDF_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_BecameKDF) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_00");	//Co ti dali mágové za úkol?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_01");	//Vytvořit runu ohnivého šípu. Ale já ani nevím, kde začít.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_02");	//Myslím, že nejdřív potřebuješ runový kámen.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_03");	//A ty to víš... (ufňukaně) Tak mě řekni - jak se z bývalého kopáče-trestance stane mág Ohně?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_04");	//S tím nic nenaděláme, příteli. Budeme se muset aspoň pokusit.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_05");	//Víš, dostal jsem takový nápad.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_06");	//Ty se v tom všem vyznáš mnohem víc než já - Mohl bys mi tu runu vyrobit?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_07");	//Co?! Jak jsi na to přišel?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_08");	//Přece mě znáš, nezůstanu ti dlužen.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_09");	//Tady ve sklepeních kláštera je spousta cenných věcí!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_10");	//A já bych se s tebou o ty poklady mohl podělit. Tak co říkáš, něco za něco.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_11");	//Jak se ti líbí moje nabídka?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_BecameKDF_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_BecameKDF_Q1,"Dobře, ruku na to!",DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_BecameKDF_Q1,"Ne, nechci s tím mít nic společného.",DIA_STRF_8160_Ragnar_BecameKDF_Q1_No);
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_01");	//Dobře, ruku na to!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_02");	//Věřím, že tam budou opravdu hodnotné věcičky.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_03");	//Rozumím ti, příteli... (usmívá se) Nemusíš si dělat starosti.
	MIS_RagnarRune = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarRune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarRune,LOG_Running);
	B_LogEntry(TOPIC_RagnarRune,"Ragnar byl donucen zůčasnit se zkoušky Ohně! Mágové mu dali za úkol - aby vytvořil runu ohnivý šíp. Nicméně, ten chudák ani neví kde má začít. Když neprojde zkouškou, tak bude muset znovu makat jak černej. Když mu pomůžu slíbil mě něco cenného z klášterní sbírky.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItRu_FireBolt,"FP_ITEM_RAGNARRUNE");
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_No()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_No_01_01");	//Ne, nechci s tím mít nic společného.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_No_01_02");	//Dobře, jak chceš. Budu si s tím muset nějak poradit.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_BecameKDF_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_info;
	permanent = FALSE;
	description = "Tady je tvoje runa.";
};

func int DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_condition()
{
	if((MIS_RagnarRune == LOG_Running) && (Npc_HasItems(other,ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_00");	//Tady je tvoje runa.
	B_GiveInvItems(other,self,ItRu_FireBolt,1);
	Npc_RemoveInvItems(self,ItRu_FireBolt,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_01");	//(nadšeně) Věděl jsem, že to dokážeš! Teď už se nemusím bát o svůj osud!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_02");	//A kde je má odměna?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_03");	//Samozřejmě, nezapomněl jsem na naší dohodu. Tady, vezmi si tuto starou knihu.
	B_GiveInvItems(self,other,ItWr_MonasterySecret,1);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_04");	//Kniha?! Nic zajímavějšího tam nebylo?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_05");	//Vydrž! Myslím, že představuje opravdové bohatství pro mágy.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_06");	//Sebral jsem jí přímo z uzavřené části klášterní knihovny. 
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_07");	//Pravda bylo těžké oklamat Talamona, ale nakonec jsem se tam dostal.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_08");	//A když byl zaneprázdněn, sebral jsem tuhle knihu z jedné z poliček.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_09");	//Dobře, tak se podíváme co je to za knihu. A teď už musím jít.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_10");	//Hodně štěstí příteli! Já půjdu za Pyrokarem ukázat mu co jsem vytvořil.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_11");	//Potěším staříka... (smích)
	MIS_RagnarRune = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarRune,LOG_Success);
	B_LogEntry(TOPIC_RagnarRune,"Přinesl jsem Ragnarovi magickou runu. A za to jsem dostal nějakou starou zaprášenou knihu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Pyrokar");
};

instance DIA_STRF_8160_Ragnar_KDF(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_KDF_condition;
	information = DIA_STRF_8160_Ragnar_KDF_info;
	permanent = FALSE;
	description = "Znamená to, že jsi teď mág Ohně!";
};

func int DIA_STRF_8160_Ragnar_KDF_condition()
{
	if((MIS_RagnarRune == LOG_Success) && (RagnarIsKDF == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_KDF_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_KDF_01_00");	//Znamená to, že jsi teď mág Ohně!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_01");	//(zmateně) Sám tomu nemohu uvěřit...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_02");	//Pár týdnů zpět jsem umíral hlady v lese.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_03");	//A nyní jsem jeden z vážených lidí kláštera. To není možné!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_KDF_01_04");	//Předpokládám, že nyní už moji pomoc nepotřebuješ?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_05");	//Zatím ne... (sarkasticky) Ale co bude, kdo ví.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_KDF_01_06");	//Ani o tom nepřemýšlej.
};

//--------------------------------------------Ragnar milishnik-------------------------------------------------

instance DIA_STRF_8160_Ragnar_MIL(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_condition;
	information = DIA_STRF_8160_Ragnar_MIL_info;
	permanent = FALSE;
	description = "Přidal ses k městské stráži?";
};

func int DIA_STRF_8160_Ragnar_MIL_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_01_00");	//Přidal ses k městské stráži?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_01");	//Ne ze své vůle. Udělal jsem vše jak jsi mě řekl.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_02");	//Dal jsem sto zlatých stráži, co stojí u brány a uctivě je poprosil ať mě pustí do města.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_03");	//No ne co to tu máme! Drapli mě a odvedli mě do kasáren, k samotnému lordu Andremu!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_04");	//Ten se mě nejprve dlouho vyptával a pak jsem dostal na výběr.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_05");	//Buďto se přidám k městské stráži nebo půjdu do basy!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_06");	//Tak tady stojím na stráži a chráním vstup do věže.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_07");	//No je to pořád lepší, než stát na šibenici se smičkou kolem krku.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_01_08");	//To máš pravdu, příteli. Vypadá to, že jsi šel přes špatnou bránu.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_01_09");	//Ale to už je teď jedno.
};

instance DIA_STRF_8160_Ragnar_MIL_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Q1_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Q1_info;
	permanent = FALSE;
	description = "Nepotřebuješ nějak pomoct?";
};

func int DIA_STRF_8160_Ragnar_MIL_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_MIL) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_01_00");	//Nepotřebuješ nějak pomoct?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_01");	//S čím bys mi asi mohl pomoci, příteli?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_02");	//Možná bych se mohl nějak předvést před lordem Andrem...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_03");	//Abych tady nemusel postávat celý den u věže.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_01_04");	//A tebe něco napadá?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_05");	//Slyšel jsem, že nedaleko od jižní brány viděli několik banditů.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_06");	//Nebylo by špatné se s nima vypořádat, odměna na jejich hlavy určitě bude stát za to.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_01_07");	//A co ti brání?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_08");	//Jak co?! Nemůžu jen tak opustit svoje stanoviště! 
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_09");	//Kdyby se to někdo dozvěděl, nastaly by mě zlé časy.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1,"Dobře postarám se o to.",DIA_STRF_8160_Ragnar_MIL_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1,"Tak to máš zlý.",DIA_STRF_8160_Ragnar_MIL_Q1_No);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_Yes()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_00");	//Dobře postarám se o to.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_01");	//(udiveně) To myslíš vážně?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_02");	//Neboj se! Vyřídím to s nima.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_03");	//Když mě pomůžeš, dlužnej nezůstanu.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_04");	//U mě ve skladě je spousta zajmavých věcí! Jistě se ti něco bude hodit.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_05");	//Dobře domluveni.
	MIS_RagnarBandits = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarBandits,LOG_Running);
	B_LogEntry(TOPIC_RagnarBandits,"Souhlasil jsem, že pomůžu Ragnarovi s tlupou banditů u jižní brány.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(BDT_10046_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc(BDT_10047_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc(BDT_10048_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_No()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_00");	//Tak to máš zlý.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_01");	//(ufňukaně) To mě nemusíš říkat...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_02");	//A to si ještě někdo náhodou všimne, že se tady s tebou na stráži vybavuju.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_03");	//Vyhodí mě! A zase budu umírat hlady.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_MIL_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Q1Done_info;
	permanent = FALSE;
	description = "S tvýma banditama je konec.";
};

func int DIA_STRF_8160_Ragnar_MIL_Q1Done_condition()
{
	if((MIS_RagnarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_RagnarBand) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_00");	//S tvýma banditama je konec.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_01");	//Budu ti věřit kamaráde...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_02");	//Ale lord Andre určitě bude potřebovat víc přesvědčivé důkazy.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_03");	//Pak mu dej tento dopis. Byl u jednoho z těch banditů.
	B_GiveInvItems(other,self,ItWr_RagnarBand,1);
	Npc_RemoveInvItems(self,ItWr_RagnarBand,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_04");	//Co tam je?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_05");	//Podívej se sám.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_06");	//Hmm... (zamyšleně) Myslím, že lorda Andreho bude velmi zajímat jeho obsah.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_07");	//Tak to máme a co máš ty pro mně?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_08");	//Tak vybírej.
	MIS_RagnarBandits = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarBandits,LOG_Success);
	B_LogEntry(TOPIC_RagnarBandits,"Jako důkaz, že jsem se vypořádal s bandity, jsem Ragnarovi donesl dopis, co měl jeden z nich u sebe.");
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done,"Železná přilba",DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done,"50 šipek",DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done,"Paladinský meč",DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_01");	//Beru helmu.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_02");	//(horlivě) Dobře, teď je tvoje.
	B_GiveInvItems(self,other,ItAr_Helm_01,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_03");	//Jak se říká, ruka ruku myje.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_04");	//Díky.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_01");	//Dej mě šipky.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_02");	//(horlivě) Dobře, ber.
	B_GiveInvItems(self,other,ItRw_Bolt,50);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_03");	//Jak se říká, ruka ruku myje.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_04");	//Díky.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_01");	//Hodil by se mě meč.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_02");	//(horlivě) Dobře. To je on.
	B_GiveInvItems(self,other,ItMw_1h_Pal_Sword,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_03");	//Jak se říká, ruka ruku myje.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_04");	//Díky.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

instance DIA_STRF_8160_Ragnar_MIL_Up(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Up_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Up_info;
	permanent = TRUE;
	description = "Jak jde život?";
};

func int DIA_STRF_8160_Ragnar_MIL_Up_condition()
{
	if((Kapitel >= 3) && (MIS_RagnarBandits == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Up_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Up_01_00");	//Jak jde život?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Up_01_01");	//Jak vidíš, nyní hlídám horní čtvrť.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Up_01_02");	//No to mě těší, už kvůli tobě.
};

//--------------------------------------------Ragnar nayemnik-------------------------------------------------

instance DIA_STRF_8160_Ragnar_SLD(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_SLD_condition;
	information = DIA_STRF_8160_Ragnar_SLD_info;
	permanent = FALSE;
	description = "Šlo všechno hladce?";
};

func int DIA_STRF_8160_Ragnar_SLD_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_SLD_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_SLD_01_00");	//Šlo všechno hladce?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_SLD_01_01");	//(váhavě) Ano. Lee mě přijal k žoldákům! Teď jsem jeho člověk.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_SLD_01_02");	//No to mě těší, už kvůli tobě.
};