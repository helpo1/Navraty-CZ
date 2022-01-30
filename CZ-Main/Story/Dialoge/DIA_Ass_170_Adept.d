instance DIA_Ass_170_Adept_EXIT(C_Info)
{
	npc = Ass_170_Adept;
	nr = 999;
	condition = DIA_Ass_170_Adept_exit_condition;
	information = DIA_Ass_170_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_170_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_170_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_170_Adept_Muritan(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_Muritan_Condition;
	information = DIA_Ass_170_Adept_Muritan_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že jsi zabil Muritana.";
};

func int DIA_Ass_170_Adept_Muritan_Condition()
{
	if(MIS_TiamantMuritan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Muritan_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_01");	//Slyšel jsem, že jsi zabil Muritana.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_02");	//Ano, to je pravda. Proč se ptáš, novici?
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_03");	//Mistr Tiamant mi přikázal vystopovat a zabít tu nestvůru.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_04");	//Tak to ti nezávidím. S tímto dravcem není radno si zahrávat.
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_05");	//Mohl bys mi dát radu, jak bych ho mohl zabít?

	if(HasimGetHisGold == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_06");	//No, když ty jsi mi pomohl... No dobrá, řeknu ti jednu kulišárnu.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_07");	//Ale slib mi, že o tom nikomu nic neřekneš!
		AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_08");	//(přikývnutí)
		AI_PlayAni(other,"T_YES");
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_09");	//Tak poslouchej. Zní to vtipně, ale ta příšera je velmi citlivá na obyčejnou síru.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_10");	//Zápach síry velmi rychle přiláká její pozornost.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_11");	//Takže prostě udělej návnadu ze syrového masa a pečlivě ji obal tou látkou na alchymistickém stole.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_12");	//Potom najdi nějaké odkryté místo a umísti tam návnadu.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_13");	//Uvidíš, že ani půl hodinka neuběhne a Muritan si tě najde sám.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_14");	//Nezabývej se s ním dlouho. Postarej se mu dát smrtící úder co nejrychleji, jinak s ním boj bude dost obtížný.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_15");	//Všechno sis zapamatoval?
		AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_16");	//Ano, děkuji za radu.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_17");	//Není zač. Jak se říká, ruka ruku myje.
		B_LogEntry(TOPIC_TiamantMuritan,"Hasim mi řekl, jak vystopovat Muritana. Vypadá to, že ho může přilákat zápach síry. Jestli ho budu chtít chytit, budu muset udělat návnadu ze syrového masa a potom ji obalit sírou na alchymistickém stole. Budu muset ještě najít místo, kde je mnoho síry a použít ji pro mou návnadu.");
		MakeMuritanSweet = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_23");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_25");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_27");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_29");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_31");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_33");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_35");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_37");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_18");	//A proč bych to měl dělat, novici? Ne, v tomhle úkolu ti pomáhat nebudu.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_19");	//Je to tvůj problém, ne můj.
		HasimNeedProof = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Ass_170_Adept_AssasinGold(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_AssasinGold_Condition;
	information = DIA_Ass_170_Adept_AssasinGold_Info;
	permanent = FALSE;
	description = "(dát váček s penězi)";
};

func int DIA_Ass_170_Adept_AssasinGold_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (HasimGetHisGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_AssasinGold_Info()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	Npc_RemoveInvItems(self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_01");	//Co to je?
	AI_Output(other,self,"DIA_Ass_170_Adept_AssasinGold_01_02");	//Mistr Osair ti dává zlato za poslední skupinu otroků.
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_03");	//Konečně! Už jsem si myslel, že k němu budu muset jít já sám.
	AI_Output(other,self,"DIA_Ass_170_Adept_AssasinGold_01_04");	//Je s tím snad problém?
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_05");	//Žádný problém. Prostě se mi nelíbí, když musím jít do jeho jeskyně.
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_06");	//Vždycky mám takový pocit, že jsem nepřišel k němu, ale k samotnému Beliarovi.
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_07");	//Takže jsi pro mě udělal nemalou službičku tím, že jsi mi to zlato přinesl.
	B_LogEntry(TOPIC_AssasinGold,"Předal jsem zlato Hasimovi. Byl rád, že nemusel jít za mistrem Osairem osobně.");
	HasimGetHisGold = TRUE;
};

instance DIA_Ass_170_Adept_Muritan_Ext(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_Muritan_Ext_Condition;
	information = DIA_Ass_170_Adept_Muritan_Ext_Info;
	permanent = FALSE;
	description = "Možná bys mi teď mohl říci, jak zabít Muritana?";
};

func int DIA_Ass_170_Adept_Muritan_Ext_Condition()
{
	if((MIS_TiamantMuritan == LOG_Running) && (HasimGetHisGold == TRUE) && (HasimNeedProof == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Muritan_Ext_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_01");	//Možná bys mi teď mohl říci, jak zabít Muritana?
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_02");	//No, když ty jsi mi pomohl... no dobrá, řeknu ti jednu kulišárnu.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_03");	//Ale slib mi, že o tom nikomu nic neřekneš!
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_04");	//(přikývnutí)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_05");	//Tak poslouchej. Zní to vtipně, ale ta příšera je velmi citlivá na obyčejnou síru.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_06");	//Zápach síry velmi rychle přiláká její pozornost.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_07");	//Takže prostě udělej návnadu ze syrového masa a pečlivě ji obal tou látkou na alchymistickém stolku.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_08");	//Potom najdi nějaké odkryté místo a umísti tam návnadu.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_09");	//Uvidíš, že ani půl hodinka neuběhne a Muritan si tě najde sám.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_10");	//Postarej se mu dát smrtící úder co nejrychleji, jinak s ním boj bude dost obtížný.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_11");	//Všechno sis zapamatoval?
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_12");	//Ano, děkuji za radu.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_13");	//Není zač. Jak se říká, ruka ruku myje.
	B_LogEntry(TOPIC_TiamantMuritan,"Hasim mi řekl, jak vystopovat Muritana. Vypadá to, že ho může přilákat zápach síry. Jestli ho budu chtít chytit, budu muset udělat návnadu ze syrového masa a potom ji obalit sírou na alchymistickém stole. Budu muset ještě najít místo, kde je mnoho síry a použít ji pro mou návnadu.");
	MakeMuritanSweet = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_23");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_25");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_27");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_29");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_31");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_33");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_35");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_37");
};

instance DIA_Ass_170_Adept_Narug(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_Narug_Condition;
	information = DIA_Ass_170_Adept_Narug_Info;
	permanent = FALSE;
	description = "Nevíš, kde bych mohl najít Naruga?";
};

func int DIA_Ass_170_Adept_Narug_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimGetHisGold == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Narug_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Narug_01_01");	//Nevíš, kde bych mohl najít Naruga? 
	AI_Output(self,other,"DIA_Ass_170_Adept_Narug_01_02");	//Ne. Ale myslím, že šel navštívit mistra Osaira, aby si vzal své zlato.
	AI_Output(self,other,"DIA_Ass_170_Adept_Narug_01_03");	//Jistě tě poslal mistr Osair - je divné, že jsi ho nepotkal.
	AI_Output(other,self,"DIA_Ass_170_Adept_Narug_01_04");	//Nevadí, to vyřešíme.
	B_LogEntry(TOPIC_AssasinGold,"Hasim řekl, že Narug šel sám navštívit Osaira. Je to zvláštní, ale vypadá to, že se do jeho jeskyně nedostal.");
	Wld_InsertNpc(Ass_171_Adept,"PW_NARUG");
};


instance DIA_Ass_170_Adept_NarugGold(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_NarugGold_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Info;
	permanent = FALSE;
	description = "Hele, nějak se mi nedaří najít Naruga.";
};

func int DIA_Ass_170_Adept_NarugGold_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (MakeHasimKiller == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_01_01");	//Hele, nějak se mi nedaří najít Naruga.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_01_02");	//Co ode mě chceš?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_01_03");	//Nemohl bys vzít jeho měšec se zlatem, abys mu ho pak předal při setkání?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_01_04");	//(udiveně) Já? Ne. Promiň, ale tohle udělat nemůžu.
	Info_ClearChoices(DIA_Ass_170_Adept_NarugGold);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"Co chceš za svou pomoc?",DIA_Ass_170_Adept_NarugGold_Help);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"A co třeba pár zlaťáků za tvou pomoc?",DIA_Ass_170_Adept_NarugGold_Gold);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"Tak to teda budu muset oznámit mistru Osairovi.",DIA_Ass_170_Adept_NarugGold_Osair);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"Možná bychom se domluvili ještě jinak?",DIA_Ass_170_Adept_NarugGold_Deal);
};

func void DIA_Ass_170_Adept_NarugGold_Gold()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Gold_01_01");	//A co třeba pár zlaťáků za tvou pomoc?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_02");	//Zlato ti tu nepomůže, novici.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_03");	//Jsou tu o hodně vážnější věci.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Gold_01_04");	//Například?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_05");	//To ti nemůžu říct. Vždyť nepatříš ani ke stínům. 
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_06");	//Takže neplýtvej mým ani svým časem.
	HasimPissOffGold = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Osair()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Osair_01_01");	//Tak to teda budu muset oznámit mistru Osairovi.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Osair_01_02");	//A zajímá mě, jestli se mu bude líbit zjištění, že Narug někam zmizel?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_03");	//A co s tím?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Osair_01_04");	//Pravděpodobně bude chtít tuhle věc vyřešit s tebou. 
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_05");	//(nespokojeně) Jestli mě mistr Osair bude chtít vidět... tak to znamená, že si budu muset udělat výlet do jeho jeskyně.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_06");	//Ale to stejně nic nemění. Narugův měšec si nevezmu! Ani mě nepros.
	HasimPissOffGold = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Deal()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Deal_01_01");	//Možná bychom se domluvili ještě jinak?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Deal_01_02");	//O tom se nemůžeme bavit, novici.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Deal_01_03");	//Na ničem se s tebou nechci domlouvat.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Deal_01_04");	//Takže radši jdi tam, kam potřebuješ, co nejdál od hříchu.
	HasimPissOffGold = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Help()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_01");	//Co chceš za svou pomoc?

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_02");	//(zamyšleně) Ani nevím, co bych ti měl říct.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_03");	//Určitě se najde pár věcí, které bych chtěl dostat.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_04");	//Pro mě by to bylo docela riskantní a tebe to může stát život.
		AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_05");	//Takže moje nabídka ti vyhovuje a stačí, když se dohodneme na ceně?
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_06");	//Tak dobře no. Ale nikomu ani muk. Rozuměls?
		AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_07");	//Samozřejmě.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_08");	//Tak fajn, slyšel jsem, že na skladě je jedna láhev velmi vzácného a drahého vína.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_09");	//Jestli tu láhev pro mě získáš, tak počítej s tím, že si vezmu Narugův měšec.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_10");	//Ale do ničeho se nemíchej, jinak můžeš na naši domluvu zapomenout.
		B_LogEntry(TOPIC_AssasinGold,"Hasim nakonec souhlasil, že vezme Narugův měšec s penězi, ale musím pro něj získat vzácnou láhev vína, která je uschovaná ve skladišti bratrstva.");
		HasimNeedRareWine = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_11");	//Hmmm... (zamyšleně) Nejspíš nic.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_12");	//A příště ke mně nechoď s podobnými otázkami.
		HasimPissOffGold = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_170_Adept_NarugGold_Again(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_NarugGold_Again_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Again_Info;
	permanent = FALSE;
	description = "Nechceš se napít kvalitního vína?";
};

func int DIA_Ass_170_Adept_NarugGold_Again_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimPissOffGold == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (Npc_HasItems(other,ItPo_AssasinsRareWine) >= 1) && (RhetorikSkillValue[1] > 0))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Again_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_01");	//Nechceš se napít kvalitního vína?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_02");	//Záleží jakého. A hlavně... je dost obtížné tady najít opravdu kvalitní pití.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_03");	//A co říkáš na toto?
	B_GiveInvItems(other,self,ItPo_AssasinsRareWine,1);
	Npc_RemoveInvItems(self,ItPo_AssasinsRareWine,1);
	CreateInvItems(self,ItPo_AssasinsRareWine_Use,2);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_04");	//Hmmm... zajímavé. No tak dej, vyzkoušíme.
	AI_UseItem(self,ItPo_AssasinsRareWine_Use);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_05");	//Výborné víno! Abych řekl pravdu, dávno jsem neměl takové skvělé pití.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_06");	//Co chceš za tu láhev?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_07");	//Můžeš si ji nechat. Teď prodiskutujeme to Narugovo zlato.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_08");	//Aha, tak ty tahkle. No dobře! Za takovou věc to nejspíš můžu risknout.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_09");	//Dej mi jeho měšec. Ale tiše!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_10");	//Tady máš.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_11");	//Podívej - nikomu neříkej ani slovo. Jinak budeme mít problémy oba dva.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_12");	//Jasně.
	B_LogEntry(TOPIC_AssasinGold,"Napařil jsem Hasimovi měšec s Narugovým zlatem. Myslím, že by bylo dobré informovat mistra Osaira, že zlato za skupinu otroků bylo distribuováno.");
	HasimNeedRareWineDone = TRUE;
};

instance DIA_Ass_170_Adept_NarugGold_Wine(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_NarugGold_Wine_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Wine_Info;
	permanent = FALSE;
	description = "Tady máš to vzácné víno.";
};

func int DIA_Ass_170_Adept_NarugGold_Wine_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimNeedRareWine == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (Npc_HasItems(other,ItPo_AssasinsRareWine) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Wine_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_01");	//Tady máš to vzácné víno.
	B_GiveInvItems(other,self,ItPo_AssasinsRareWine,1);
	Npc_RemoveInvItems(self,ItPo_AssasinsRareWine,1);
	CreateInvItems(self,ItPo_AssasinsRareWine_Use,2);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_02");	//Hmmm... No skvělé! Podíváme se, co jsi přinesl.
	AI_UseItem(self,ItPo_AssasinsRareWine_Use);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_03");	//A jo! Opravdové a vynikající víno! Už dlouho jsem neměl takové skvělé pití.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_04");	//A co ohledně Narugova zlata?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_05");	//No, jak jsme se domluvili. Dej mi jeho měšec. Ale tiše!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_06");	//Tady máš.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	Npc_RemoveInvItems(self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_07");	//Hlavněj - nikomu neříkej ani slovo. Jinak budeme mít problémy oba dva.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_08");	//Jasně.
	B_LogEntry(TOPIC_AssasinGold,"Napařil jsem Hasimovi měšec s Narugovým zlatem. Myslím, že by bylo dobré informovat mistra Osaira, že zlato za skupinu otroků bylo distribuováno.");
	HasimNeedRareWineDone = TRUE;
};

instance DIA_Ass_170_Adept_PICKPOCKET(C_Info)
{
	npc = Ass_170_Adept;
	nr = 900;
	condition = DIA_Ass_170_Adept_PICKPOCKET_Condition;
	information = DIA_Ass_170_Adept_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(pokusit se ukrást jeho modlitební korále)";
};

func int DIA_Ass_170_Adept_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MakeHasimKiller == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
	Info_AddChoice(DIA_Ass_170_Adept_PICKPOCKET,Dialog_Back,DIA_Ass_170_Adept_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ass_170_Adept_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ass_170_Adept_PICKPOCKET_DoIt);
};

func void DIA_Ass_170_Adept_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(self,other,ItMi_HasimAmuls,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
	}
	else
	{
		PlayerIsPrioratFake = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Ass_170_Adept_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
};

var int ExpLoseCount;

instance DIA_Ass_170_Adept_HasimKill(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_HasimKill_Condition;
	information = DIA_Ass_170_Adept_HasimKill_Info;
	permanent = FALSE;
	description = "Mám na tebe jednu otázku.";
};

func int DIA_Ass_170_Adept_HasimKill_Condition()
{
	if(MIS_HasimKill == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_HasimKill_Info()
{
	ExpLoseCount = TRUE;
	AI_Output(other,self,"DIA_Ass_170_Adept_HasimKill_01_01");	//Mám na tebe jednu otázku.
	AI_Output(self,other,"DIA_Ass_170_Adept_HasimKill_01_02");	//Co se děje?
	Info_ClearChoices(DIA_Ass_170_Adept_HasimKill);
	Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Mistr Osair tě chce vidět.",DIA_Ass_170_Adept_Osair);
	Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Nechceš vyrazit na lov?",DIA_Ass_170_Adept_Hunt);
	Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Našel jsem tvého přítele Naruga.",DIA_Ass_170_Adept_NarugFind);

	if(PW_GOLDSHAHT == TRUE)
	{
		Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Netoužíš po nějakém zisku?",DIA_Ass_170_Adept_Gold);
	};
};

func void DIA_Ass_170_Adept_Osair()
{
	var int bonusexp;

	bonusexp = 1000 / ExpLoseCount;

	B_GivePlayerXP(bonusexp);
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_01");	//Mistr Osair tě chce vidět.
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_02");	//A poprosil mě, abych tě co nejdříve doprovodil do jeho jeskyně.
	AI_Output(self,other,"DIA_Ass_170_Adept_Osair_01_03");	//(udiveně) Mistr Osair? Hmmm. Dřív mi neposílal novice, aby mě o tomhle informovali. 
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_04");	//Věřím, že to není jen tak.
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_05");	//Proto by bylo nejlepší neztrácet čas a jít. 
	AI_Output(self,other,"DIA_Ass_170_Adept_Osair_01_06");	//Dobře, jak říkáš. Jdi první, půjdu hned za tebou. 
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	HasimGoForKilled = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowHero");
};

func void DIA_Ass_170_Adept_Hunt()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Hunt_01_01");		//Nechceš vyrazit na lov?
	AI_Output(self,other,"DIA_Ass_170_Adept_Hunt_01_02");		//Ne. Raději zůstanu tady a vychutnám si chuť této skvělé dýmky.
	AI_Output(self,other,"DIA_Ass_170_Adept_Hunt_01_03");		//Takže mě omluv, příteli.
	AI_Output(other,self,"DIA_Ass_170_Adept_Hunt_01_04");		//Chápu.
	ExpLoseCount = ExpLoseCount + 1;
};


func void DIA_Ass_170_Adept_NarugFind()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugFind_01_01");	//Našel jsem tvého přítele Naruga.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_02");	//Hmmm... (chladně) A kde se loudá ten flákač?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugFind_01_03");	//Nedaleko odsud, v lese. A řekl mi, ať ti vzkážu, že tě čeká.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugFind_01_04");	//Vypadá to, že něco vymyslel. 
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_05");	//Opravdu? A co asi mohl ten hlupák vymyslet?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_06");	//Ne, promiň, ale radši zůstanu tady.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_07");	//Jestli ode mě něco potřebuje, ať svůj zadek dotáhne sem.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_08");	//Tak mu vzkaž.
	ExpLoseCount = ExpLoseCount + 1;
};

func void DIA_Ass_170_Adept_Gold()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_01");		//Netoužíš po nějakém zisku?
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_02");		//Hmmm... a o čem je řeč?
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_03");		//V jedné z jeskyň jsem narazil na velké ložiska zlaté rudy.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_04");		//Ale sám to tam nezvládnu.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_05");		//Napadlo mě, že by tě to mohlo zajímat.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_06");		//Hmmm... Zlatá ruda? Abych řekl pravdu, zlato mě vůbec nezajímá.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_07");		//Mám ho dostatek a ničit si záda v dole není nic pro mě.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_08");		//Bylo by dobré tam poslat nějaké otroky. 
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_09");		//Ale pak to zjistí převorové a na zlato můžeme zapomenout.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_10");		//Takže já radši zůstanu tady.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_11");		//Je to na tobě.
	ExpLoseCount = ExpLoseCount + 1;
};

instance DIA_Ass_170_Adept_ANGEKOMMEN(C_Info)
{
	npc = Ass_170_Adept;
	nr = 55;
	condition = DIA_Ass_170_Adept_ANGEKOMMEN_Condition;
	information = DIA_Ass_170_Adept_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_Ass_170_Adept_ANGEKOMMEN_Condition()
{
	if((MIS_HasimKill == LOG_Running) && (HasimGoForKilled == TRUE) && (Npc_GetDistToWP(self,"PW_HASIM_DEAD") < 6000))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_00");	//Proč ses zastavil?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_01");	//Protože už jsme došli.
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_02");	//(překvapeně) Jak tomu mám rozumět?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_03");	//Mistr Tiamant chce, abys zemřel, a já teď plním jeho vůli.
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_04");	//Cože?! Takže tys mě nalákal do téhle divočiny, abys mě zabil?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_05");	//Přesně tak.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_06");	//(zlověstně) Co se dá dělat, můžeš to zkusit, zrádče!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,AR_KILL,1);
};
