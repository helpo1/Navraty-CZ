
instance DIA_Orc_5500_WoundedOrc_EXIT(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_exit_condition;
	information = DIA_Orc_5500_WoundedOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_5500_WoundedOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_5500_WoundedOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_5500_WoundedOrc_Hello(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_Hello_condition;
	information = DIA_Orc_5500_WoundedOrc_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_5500_WoundedOrc_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_01");	//Arrgh! (těžce dýchá) Další muž mě přišel zabít.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_02");	//Ano, obvykle to tak dělám! Ačkoli ne často je vidět skřeta, který mluví lidskou řečí.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_03");	//Vyslyším tě tedy, ale varuji tě - jeden špatný pohyb - a setnu ti hlavu, skřete!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_04");	//A teď mi odpověz - kdo jsi a co tu děláš?!
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_05");	//Jmenuji se Ur-Karras, no domnívám se, že tobě to nic neříká.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_06");	//Pravda, takové jméno jsem dosud neslyšel. Ale soudě podle tvé zbroje, nejsi jen obyčejný skřet.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_07");	//Zřejmě jsi jedním ze skřetích velitelů. Kde je tedy tvá skupina?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_08");	//Všechny zabily, všichni mrtví! Jen já sám zůstal žít, ale být vážně zraněn a není schopen se vrátit do údolí.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_09");	//Pobili je paladinové?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_10");	//Ne, my nebojovat s paladiny... (lapá po dechu) Moje četa príliš malá, aby na ně zaútočit.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_11");	//Pokud ne oni, tak kdo? A co ste v takovém případě dělali v Khorinisu?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_12");	//Já nemohu říci člověku.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_13");	//Pokud mi to okamžitě neřekneš, na míste tě zabiju!
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_14");	//Pokud člověk chce zabít, ať nestrácí čas. (bolestivě) Ur-Karras se nebát smrti.
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_Hello);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Tvá slova si zaslouží respekt, Ur-Karras.",DIA_Orc_5500_WoundedOrc_Hello_Mercy);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Nuže, sám sis vybral svůj osud, skřete!",DIA_Orc_5500_WoundedOrc_Hello_Kill);
};


func void DIA_Orc_5500_WoundedOrc_Hello_Mercy()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_01");	//Tvá slova si zaslouží respekt, Ur-Karras. Myslím, že tě nechám naživu.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_02");	//Ale musíš mi přísahat, že okamžitě opustíš Khorinis! Jestli tě příště potkám, bez zaváhání ti podříznu hrdlo.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_03");	//Člověk si nemusí dělat starost. Jak jsem již říkal, Ur-Karras vážne zranen a nemůže se vrátit ke svým bratrům...
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_04");	//Můžeš mě rovnou zabít... (funění) čas na tom stejně nic nezmění.
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_Hello);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Jak již bylo rěčeno - já tě nechci zabít!",DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"No nedáváš mi na vybranou, skrěte!",DIA_Orc_5500_WoundedOrc_Hello_Kill_Two);
};

func void DIA_Orc_5500_WoundedOrc_Hello_Kill()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_01");	//Nuže, sám sis vybral svůj osud, skřete!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_02");	//Teď tě zabiju, o jedno další odporné stvoření méně.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_03");	//Arrgh!
	AI_StopProcessInfos(self);
	self.guild = GIL_ORC;
};

func void DIA_Orc_5500_WoundedOrc_Hello_Kill_Two()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Kill_Two_18_01");	//Nedáváš mi jinou možnost, skřete! Připrav se zemřít.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Kill_Two_18_02");	//Arrgh!
	AI_StopProcessInfos(self);
	self.guild = GIL_ORC;
};

func void DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_01");	//Já tě nechci zabít.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_02");	//No v žádném případě ti nemohu dovolit zůstat v Khorinisu, tak co mám s tebou dělat?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_03");	//Ur-Karras neví.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_04");	//Hmmm. Dovol mi aspoň podívat se na tvoje rány.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_05");	//Chrrrr...(lapá po dechu) Dobře, podívej, člověče.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_06");	//Ano, to jsou vážná zranení. Vypadá to, žes byl pokousán nějakým hrozným tvorem.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_07");	//Existuje nějaký způsob, který by ti pomohl vyléčit se?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_08");	//Ur-Karras si myslí, že jen jeho bratři - mluvící s duchy, by mohly pomoci. Ale bratři být daleko v údolí...
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_09");	//Mluvící s duchy?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_10");	//Být velcí mágové skřetů. Lidé obvykle nazývat je šamany.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_11");	//Ale k vaším šamanem se tak jednoduše přiblížit nedá...
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_12");	//Promění mě v pochodeň dřív než jim stihnu něco říct.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_13");	//Pak človeku zůstává jen odejít... (chrapčí) a nechat Ur-Karrase zemřít!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_14");	//Ne. Když už nic jiného, zůstanu u tebe!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_15");	//Vypadá to, že mám ve zvyku pomáhat zraněným skrětům.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_17");	//Ááá... (překvapeně) Ur-Karras být překvapen, že se člověk snaží, aby mu pomohl.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_18");	//Obvykle ho dříve chtějí všichni lidé prostě zabít!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_19");	//Dobře, tady seď a pokus se nezemřít, dokud se nevrátím.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_20");	//Nelíbila by se mi představa, že sem s tebou jen strácel čas.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_21");	//Ur-Karras mít nějaké léčivé lektvary skrětů, aby nezemřel. Ale ne nadlouho.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_22");	//Pak tedy nestrácejme čas mluvením. Brzy se vrátím.
	MIS_Orcwayhero = LOG_Running;
	Log_CreateTopic(TOPIC_Orcwayhero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Orcwayhero,LOG_Running);
	B_LogEntry(TOPIC_Orcwayhero,"Kousek od Khorinisu, jsem narazil na zraněného skřeta jménem Ur-Karras. Vedl malý oddíl skrětů z údolí aby provedli důležitý úkol, který mi však odmítl prozradit dokonce i pod hrozbou smrti. On jediný přežil ale je těžce raněný a nemůže se vrátit. Rozhodl jsem se pomoci tomuto skřetovi, který mluví lidskou řečí. Léčivé kouzla šamanů by mu mohli pomoci, ale kde v Khorinisu najít skřetího šamana, který by byl ochotný se mnou mluvit? Musím něco vymyslet - času je málo, je třeba jednat rychle.");
	AI_StopProcessInfos(self);
	self.name[0] = CZ_NAME_Orc_Unique_Urkarras;
};


instance DIA_Orc_5500_WoundedOrc_HaveCure(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_HaveCure_condition;
	information = DIA_Orc_5500_WoundedOrc_HaveCure_info;
	important = FALSE;
	permanent = FALSE;
	description = "Zjistil jsem, jak tě postavit na nohy.";
};


func int DIA_Orc_5500_WoundedOrc_HaveCure_condition()
{
	if((MIS_Orcwayhero == LOG_Running) && (Npc_HasItems(other,ItSc_OrcHeal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_HaveCure_info()
{
	B_GivePlayerXP(250);	
	Npc_RemoveInvItems(other,ItSc_OrcHeal,1);
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_01");	//Zjistil jsem, jak tě postavit na nohy.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_02");	//Doufám, že říkáš pravdu...(plive krev) Ur-Karras cítí, že brzy zemře.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_03");	//Jen vydrž, skřete. Myslím, že ti to pomůže.
	B_HeroUseFakeScroll();
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_04");	//Aargh... Co to člověk udělat s Ur-Karras?!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_05");	//Uklidni se! Je to jen léčivé kouzlo.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_06");	//A zdá se, že se tvé rány začaly pomalu hojit.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_07");	//Nevěřit svým očím! Člověk byl schopen vyléčit Ur-Karras.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_08");	//Ur-Karras cítit, že se k němu začala vracet jeho síla. Myslet si, že jeho smrt ustoupit pro lidské kouzlo.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_09");	//No, počkej radši ještě chvíli...
	B_HeroUseFakeScroll();
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_10");	//Tak co? Myslím, že teď by ses měl cítit zcela v pořádku.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_11");	//Ur-Karras se cítit velmi zdravě! (obdivně) Člověk musí být velký šaman, když mohl vyléčit Ur-Karras!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_12");	//No, když chceš, můžeš mi tak říkat.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_13");	//Ur-Karras děkovat člověku...(s uznáním) On tohle nikdy neříkat, no nyní si vážit člověk.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_14");	//Hej, nech si ty komplimenty! Teď, když jsi zpátky na nohách, můžeš opustit Khorinis.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_15");	//A bude lepší, když to uděláš co nejdříve.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_16");	//Člověk pomohl Ur-Karras, a on teď může jít ke svým bratřím v údolí...
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_17");	//Ur-Karras počkat do setmění, než se k nim vydá.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_18");	//Dobře, věřím ti, skřete. A doufám, že se znovu nesetkáme.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_19");	//Příště nemusí jít všechno tak hladce.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_20");	//Tohle Ur-Karras nemůže slíbit člověku. Ale nezapomene na jeho pomoc, nyní se člověk stát jeho bratrem!
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_21");	//Ur-Karras přísahat člověku tohle. Nyní Ur-Karras rozloučit s velkým šamanem!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_22");	//Samo sebou... hmmm... bratře.
	MIS_Orcwayhero = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Orcwayhero,LOG_SUCCESS);
	B_LogEntry(Topic_Orcwayhero,"Pomohl jsem Ur-Karrasovi zotavit se ze svých zranění. Teď se může vrátit do údolí. Ur-Karras slíbil, že na mou pomoc nezapomene a začal mě od této chvíle nazývat... bratrem. Zvláštní tvorové, tihle skrěti.");
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_HaveCure);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_HaveCure,Dialog_Ende,DIA_Orc_5500_WoundedOrc_HaveCure_Quit);
};

func void DIA_Orc_5500_WoundedOrc_HaveCure_Quit()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	self.attribute[ATR_STRENGTH] = 300;
	self.attribute[ATR_DEXTERITY] = 300;
	self.attribute[ATR_HITPOINTS_MAX] = 3000;
	self.attribute[ATR_HITPOINTS] = 3000;
	self.attribute[ATR_MANA_MAX] = 10;
	self.attribute[ATR_MANA] = 10;
	self.protection[PROT_BLUNT] = 300;
	self.protection[PROT_EDGE] = 300;
	self.protection[PROT_POINT] = 300;
	self.protection[PROT_FIRE] = 100;
	self.protection[PROT_FLY] = 100;
	self.protection[PROT_MAGIC] = 100;
	self.HitChance[NPC_TALENT_1H] = 100;
	self.HitChance[NPC_TALENT_2H] = 100;
	self.HitChance[NPC_TALENT_BOW] = 100;
	self.HitChance[NPC_TALENT_CROSSBOW] = 100;
	CreateInvItems(self,ItMw_2H_OrcSword_02,1);
	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Orc_5500_WoundedOrc_Buy(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_Buy_condition;
	information = DIA_Orc_5500_WoundedOrc_Buy_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_5500_WoundedOrc_Buy_condition()
{
	if((Npc_IsInState(self,ZS_Talk)) && (MIS_Orcwayhero == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_Buy_info()
{
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Buy_Info_18_01");	//Ur-Karras jít k svým bratrům, jak slíbil bratru člověku.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Buy_Info_18_02");	//On nemusí mít strach!
	AI_StopProcessInfos(self);
};