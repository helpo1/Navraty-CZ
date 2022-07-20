
instance DIA_HANIS_EXIT(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 999;
	condition = dia_hanis_exit_condition;
	information = dia_hanis_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hanis_exit_condition()
{
	return TRUE;
};

func void dia_hanis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANIS_NOFOREVER(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_noforever_condition;
	information = dia_hanis_noforever_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_hanis_noforever_condition()
{
	if(MIS_PrioratStart == FALSE)
	{
		return TRUE;
	};
};

func void dia_hanis_noforever_info()
{
	AI_Output(other,self,"DIA_Hanis_NoForever_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Hanis_NoForever_01_01");	//Mé jméno je Hanis, templář Bratrstva!... (hrdě) A ti chlapi kolem. To jsou sběrači drogy.
};


instance DIA_HANIS_PSIINFO(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_psiinfo_condition;
	information = dia_hanis_psiinfo_info;
	permanent = FALSE;
	description = "Bratrstva? Jakého Bratrstva?";
};


func int dia_hanis_psiinfo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !Npc_KnowsInfo(hero,DIA_Hanis_psiinfo) && !Npc_KnowsInfo(hero,dia_balam_psiinfo) && Npc_KnowsInfo(hero,dia_hanis_noforever) && (MIS_PrioratStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_hanis_psiinfo_info()
{
	AI_Output(other,self,"DIA_Hanis_PsiInfo_01_00");	//Bratrstva? Jakého Bratrstva?
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_01");	//Bratrstvo Spáče! I když teď je možné ho prostě nazývat Bratrstvem.
	AI_Output(other,self,"DIA_Hanis_PsiInfo_01_02");	//Ale já si myslel, že po pádu bariéry, Bratrstvo Spáče přestalo existovat?!
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_03");	//Tak to není! Většina z našich bratrů zemřela, nebo byli posednuti démony...
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_04");	//Ale někteří z nás přežili. Tak jsme založili nový tábor.
	AI_Output(other,self,"DIA_Hanis_PsiInfo_01_05");	//A kde je váš tábor?
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_06");	//Jdi po cestě do Hornického údolí. Poblíž vstupu najdeš malé jezero. Jdi po jeho břehu.
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_07");	//Poblíž najdeš tábor Bratrstva.
};


instance DIA_HANIS_HELLO(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_hello_condition;
	information = dia_hanis_hello_info;
	permanent = TRUE;
	description = "Jak pokračuje sběr drogy?";
};


func int dia_hanis_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_hanis_noforever) && (MIS_PrioratStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_hanis_hello_info()
{
	AI_Output(other,self,"DIA_Hanis_Hello_01_00");	//Jak pokračuje sběr drogy?
	AI_Output(self,other,"DIA_Hanis_Hello_01_01");	//Ne špatně.
	AI_Output(other,self,"DIA_Hanis_Hello_01_02");	//Ty asi nejsi zrovna výřečný člověk, že?
	AI_Output(self,other,"DIA_Hanis_Hello_01_03");	//Ne.
};


instance DIA_HANIS_GIVEPLANT(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_giveplant_condition;
	information = dia_hanis_giveplant_info;
	permanent = TRUE;
	description = "Baal Cadar mě poslal.";
};

func int dia_hanis_giveplant_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_Running) && (FIRSTGROUPSEK == FALSE) && (other.guild == GIL_SEK) && Npc_KnowsInfo(hero,dia_hanis_noforever) && (MIS_PrioratStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_hanis_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Hanis_GivePlant_01_00");	//Baal Cadar mě poslal.
	AI_Output(self,other,"DIA_Hanis_GivePlant_01_01");	//Co si přeje Guru?
	AI_Output(other,self,"DIA_Hanis_GivePlant_01_02");	//Požádal mě, abych mu doručil všechnu drogu, kterou jste zatím posbírali.

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_03");	//To je skvělé, alespoň nemusím jít sám. Měl jsem strach nechat sběrače osamotě.
		B_GiveInvItems(self,other,ItPl_SwampHerb,100);
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_04");	//Nezapomeň navštívit ostatní sběrače. Tedy pokud jsi je ještě nenavštívil.
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_05");	//Nebo si budou myslet, že jsi snad část z drogy někde prodal, nebo snad vykouřil... (s úsměvem)
		FIRSTGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_06");	//Ty určitě nejsi z našeho Bratrstva! Baal Cadar tě nemohl poslat.
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_07");	//Tobě bych drogu nesvěřil ani ve snu!
	};
};

instance DIA_Hanis_NewPlants(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_NewPlants_condition;
	information = DIA_Hanis_NewPlants_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hanis_NewPlants_condition()
{
    if((Kapitel < 3) && (FIRSTGROUPSEK == TRUE) && (hero.attribute[ATR_STRENGTH] >= 100))
	{
		return TRUE;
	};
};

func void DIA_Hanis_NewPlants_info()
{
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_01");	//Počkej...
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_02");	//Co?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_03");	//Vypadáš na silného chlapa.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_04");	//A pomoc takového chlapa by se mi šikla.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_05");	//Tak k věci.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_06");	//Jeden z našich mentorů mi dal takový menší úkol.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_07");	//Ve jménu prosperity naší komunity mě pověřil hledáním nových míst na pestování drogy.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_08");	//Aha a co to znamená?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_09");	//Prostě potřebuji najít nové místo na pestování drogy.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_10");	//A co s tím mám já?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_11");	//Našel jsem perfektní místo, ale nedávno se tam usadila smečka ještěrů.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_12");	//Já bych se jich klidně zbavil... Ale...
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_13");	//Tak proč mě otravuješ?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_14");	//Nooo, kdo ví co by se mohlo stát, když tu nebudu dávat pozor.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_15");	//No co?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_16");	//Však to poznáš... Tihle novici a motyky v jejich rucích...
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_17");	//Nedávno se jim do stanu dostal krysokrt.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_18");	//A oni se tvářili jako by to byl samotný Beliar.
	Info_ClearChoices(DIA_Hanis_NewPlants);
	Info_AddChoice(DIA_Hanis_NewPlants,"Co mám udělat?",DIA_Hanis_NewPlants_yes);
	Info_AddChoice(DIA_Hanis_NewPlants,"Zájmy Bratrstva mě nezajímají.",DIA_Hanis_NewPlants_no);
};
	
func void DIA_Hanis_NewPlants_yes()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_yes_01_00");	//Co mám udělat?
	AI_Output(self,other,"DIA_Hanis_NewPlants_yes_01_01");	//Není to jasné? Běž a zabij je.
	AI_Output(self,other,"DIA_Hanis_NewPlants_yes_01_02");	//Na oplátku ti zaplatím anebo ti dám pár stébel trávy z bažin.
	AI_Output(other,self,"DIA_Hanis_NewPlants_yes_01_03");	//Dobrá. Kde to je?
	AI_Output(self,other,"DIA_Hanis_NewPlants_yes_01_04");	//Jdi kousek popri tomhle svahu a nemůžeš to minout.
	AI_Output(other,self,"DIA_Hanis_NewPlants_yes_01_05");	//Dobrá, hned jsem zpátky.
	MIS_HanisPlants = LOG_Running;
	Log_CreateTopic(TOPIC_HanisPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HanisPlants,LOG_Running);
	B_LogEntry(TOPIC_HanisPlants,"Mám pro Hanise zabít pár ještěrů.");
    	AI_StopProcessInfos(self);
	Wld_InsertNpc(HanisWaran_01,"FP_ROAM_HANISLIZARD_02");
	Wld_InsertNpc(HanisWaran_02,"FP_ROAM_HANISLIZARD_04");
	Wld_InsertNpc(HanisWaran_03,"FP_ROAM_HANISLIZARD_06");
	Wld_InsertNpc(HanisWaran_04,"FP_ROAM_HANISLIZARD_08");
	Wld_InsertNpc(HanisWaran_05,"FP_ROAM_HANISLIZARD_10");
};

func void DIA_Hanis_NewPlants_no()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_no_01_00");	//Zájmy Bratrstva mě nezajímají.
	AI_Output(self,other,"DIA_Hanis_NewPlants_no_01_01");	//Dobrá.
	AI_StopProcessInfos(self);
};

instance DIA_Hanis_NewPlants_Done(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_NewPlants_Done_condition;
	information = DIA_Hanis_NewPlants_Done_info;
	permanent = FALSE;
	description = "Všichni ještěri jsou mrtví.";
};

func int DIA_Hanis_NewPlants_Done_condition()
{
	if((MIS_HanisPlants == LOG_Running) && (Npc_IsDead(HanisWaran_01) == TRUE) && (Npc_IsDead(HanisWaran_02) == TRUE) && (Npc_IsDead(HanisWaran_03) == TRUE) && (Npc_IsDead(HanisWaran_04) == TRUE) && (Npc_IsDead(HanisWaran_05) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanis_NewPlants_Done_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_01_01");	//Všichni ještěri jsou mrtví.
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_01_02");	//Jsi si jistý?
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_01_03");	//Proč mi každý hned nevěří?
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_01_04");	//Dobrá, věřím ti.
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_01_05");	//A co má odměna?
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_01_06");	//Jak jsme se dohodli.
	MIS_HanisPlants = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HanisPlants,LOG_SUCCESS);
	B_LogEntry(TOPIC_HanisPlants,"Hanis byl spokojen s mou prací.");
	Info_ClearChoices(DIA_Hanis_NewPlants_Done);
	Info_AddChoice(DIA_Hanis_NewPlants_Done,"Chci zlato.",DIA_Hanis_NewPlants_Done_Gold);
	Info_AddChoice(DIA_Hanis_NewPlants_Done,"Dej mi ty rostliny.",DIA_Hanis_NewPlants_Done_Herb);
	Info_AddChoice(DIA_Hanis_NewPlants_Done,"Co mi ještě nabídneš?",DIA_Hanis_NewPlants_Done_More);
};

func void DIA_Hanis_NewPlants_Done_Gold()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_Gold_01_00");	//Chci zlato.
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_Gold_01_01");	//Tady.
	B_GiveInvItems(self,other,ItMi_Gold,350);
	AI_StopProcessInfos(self);
};

func void DIA_Hanis_NewPlants_Done_Herb()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_Herb_01_00");	//Dej mi ty rostliny.
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_Herb_01_01");	//Tady.
	B_GiveInvItems(self,other,ItPl_SwampHerb,50);
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_Herb_01_02");	//Používej je moudře.
	AI_StopProcessInfos(self);
};
	
func void DIA_Hanis_NewPlants_Done_More()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_00"); //Co mi ještě nabídneš?

	if(hero.attribute[ATR_STRENGTH] >= 150)
	{
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_01"); //Jednoduchá odměna, to by tě nezajímalo.
		AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_02"); //Máš pravdu, chci něco speciálního.
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_03"); //Tak dobře. Tady máš elixír síly.
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_06"); //Nic, málí se ti?
		AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_07"); //Samozřejmě.
		AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_08"); //Takže ukaž co máš vo vreckách a já si vyberu.
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_09"); //No to určitě, měl bych tě naučit manérům!
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_10"); //Ale mám dobrý den, máš štěstí.
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_11"); //Považuj to za svou odměnu.
		AI_StopProcessInfos(self);
	};
};

//-----------------PRIORAT---------------------



instance DIA_Hanis_PrioratStart(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_PrioratStart_condition;
	information = DIA_Hanis_PrioratStart_info;
	permanent = FALSE;
	description = "Co se tady stalo?";
};

func int DIA_Hanis_PrioratStart_condition()
{

	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hanis_PrioratStart_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_00");		//Co se tady stalo?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_01");		//Byli jsme napadeni! Nevím kdo to byl...
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_02");		//Překvapili nás... Jediné co jsem dokázal bylo zranit jednoho z útočníků.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_03");		//A co se stalo ostatním?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_04");		//Nevím, myslím, že je unesli.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_05");		//Vydrž tady. Přivedu pomoc!
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_06");		//Na to je už příliš pozdě... Cítím, že už dlouho nevydržím.
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_07");		//Myslím, že použili nějaký silný jed.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_08");		//Tak jak mohu pomoci?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_09");		//Slib mi, že zachráníš naše novice.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_10");		//Dobrá. Viděl jsi kam útočníci šli?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_11");		//Neeee... (dusí se krví) Ale jsem jsi jistý, že ten kterého jsem zranil silno krvácí.
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_12");		//Zkus... sledovat... jeho krev...

	if(MIS_HanisPlants == LOG_Running)
	{
		MIS_HanisPlants = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_HanisPlants);
	};

	self.aivar[93] = FALSE;
	B_LogEntry_Quiet(TOPIC_PrioratStart,"Měl bych o tom útoku informovat Baala Namiba, ale nejdřív bych měl skusit vystopovat toho raněného útočníka, určitě nedošel daleko...");
	Info_ClearChoices(DIA_Hanis_PrioratStart);
	Info_AddChoice(DIA_Hanis_PrioratStart,"Ee...",DIA_Hanis_PrioratStart_Death);
};

func void DIA_Hanis_PrioratStart_Death()
{
	AI_StopProcessInfos(self);
	PsiCamp_03_Ok = TRUE;
	Wld_SendTrigger("NW_ASS_BLOOD_02");
	Wld_InsertNpc(Ass_120_Adept,"NW_FOREST_VINOSKELLEREI_01");
};
