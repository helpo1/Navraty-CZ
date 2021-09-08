instance DIA_Stoneguardian_Boss_Exit(C_Info)
{
	npc = Stoneguardian_Boss;
	nr = 999;
	condition = DIA_Stoneguardian_Boss_Exit_Condition;
	information = DIA_Stoneguardian_Boss_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Stoneguardian_Boss_Exit_Condition()
{
	return TRUE;
};

func void DIA_Stoneguardian_Boss_Exit_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_Stoneguardian_Boss_Hello(C_Info)
{
	npc = Stoneguardian_Boss;
	nr = 1;
	condition = DIA_Stoneguardian_Boss_Hello_Condition;
	information = DIA_Stoneguardian_Boss_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Stoneguardian_Boss_Hello_Condition()
{
	if(StoneTitanAwake == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Stoneguardian_Boss_Hello_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_01");	//KDO SE OPOVAŽUJE RUŠIT MŮJ POSVÁTNÝ KLID?!
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_02");	//Vlasně... já.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_03");	//Jak zajímavé. A co chcete ode mě, člověče?
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_04");	//Chtěl bych něco vědět o jednom artefaktu, který jste kdysi střežili.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_05");	//CO?! Jak to víš?
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_06");	//Z magického svitku pradávných, kterým jsem tě probudil.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_07");	//I když jsi byl schopen přečíst text pradávných, tak to ještě neznamená, že jsi hoden vlastnit posvátné znalosti.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_08");	//Jenom a pouze vyvolený Adana může poznat jeho moudrost!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_09");	//Ale já si nemyslím, že jsi to ty.
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_10");	//Ale přesto bys mě mohl něco říct o tom artefaktu?
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_11");	//A proč bych to měl dělat?
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_12");	//Možná, že jsem opravdu Adanův vyvolený!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_13");	//Ha ha ha... Nebuď směšný, ubohý človíčku! To nemůže být pravda...
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_14");	//Ale pokud se za něj považuješ - dokaž to.
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_15");	//Jak?
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_16");	//Bojuj se mnou!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_17");	//Pouze pokud mě porazíš, odkryje se ti tajemství tohoto posvátného artefaktu!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_18");	//V opačném případě za svoji troufalost zaplatíš životem.
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_19");	//S ničím jiným bych ani nepočítal.
	B_LogEntry(TOPIC_AdanosCrone,"Oživil jsem starodávného strážce, ale bylo mě to k ničemu. Strážný mi odmítl cokoliv sdělit o záhadném artefaktu. Abych získal potřebné informace, musím strážce porazit.");
	KnowAboutAdVal = TRUE;
};

//=============================Spyashchiy=================================================

instance DIA_Sleeper_Old_Exit(C_Info)
{
	npc = Sleeper_Old;
	nr = 999;
	condition = DIA_Sleeper_Old_Exit_Condition;
	information = DIA_Sleeper_Old_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Sleeper_Old_Exit_Condition()
{
	return TRUE;
};

func void DIA_Sleeper_Old_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Sleeper_Old_Hello(C_Info)
{
	npc = Sleeper_Old;
	nr = 1;
	condition = DIA_Sleeper_Old_Hello_Condition;
	information = DIA_Sleeper_Old_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sleeper_Old_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sleeper_Old_Hello_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_01");	//ARRGH... (zlověstně) TO JE NAPOSLEDY CO JSME SE SETKALI, ČLOVĚČE!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_02");	//Dlouho jsem musel čekat na tohle setkání!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_01_03");	//Spáči! Nikdy by mě nenapadlo, že tě zde zase uvidím.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_04");	//Všechny mé smysli mi říkají, že mág, co mě vyvolal, je už dávno mrtví.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_05");	//Vsadím se, že jsi v tom měl prsty ty.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_06");	//Ale na tom, už nezáleží.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_07");	//Hlavní je, že můj dávný protivník, stojí teď přede mnou!
	SleeperHello = TRUE;
	B_LogEntry(TOPIC_SLEEPERBACK,"Spáč se vrátil do lidského světa. Zdá se že jsme spolu spojeni osudem. Je čas se rozloučit a to už navždy, jen k tomu dostat příležitost.");
	Info_ClearChoices(DIA_Sleeper_Old_Hello);
	Info_AddChoice(DIA_Sleeper_Old_Hello,"Jak to tak vidím, chceš se mě pomstít.",DIA_Sleeper_Old_Hello_Battle);
	Info_AddChoice(DIA_Sleeper_Old_Hello,"Proč jsi probudil draky?",DIA_Sleeper_Old_Hello_Dragons);
	Info_AddChoice(DIA_Sleeper_Old_Hello,"A kdo vlastně jsi?",DIA_Sleeper_Old_Hello_WhoYou);
};

func void DIA_Sleeper_Old_Hello_WhoYou()
{
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_WhoYou_01_01");	//A kdo vlastně jsi?
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_WhoYou_01_02");	//Na pohled nevypadáš jako Beliarovo stvoření.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_03");	//Je to tak... (zlověstně) Ale jeho magie mi pomohla vrátit se na tento svět!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_04");	//Jsem dávný démon, vzniklí z magie tohoto světa v jeho samém počátku.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_05");	//Kdysi se mi lidé klaněli, tak jako vy se klaníte svým bohům.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_06");	//Ale můj čas je dávno pryč. A jen díky skřetům jsem se mohl vrátit ze zapomnění.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_07");	//Ale ty bídný červe, jsi všechno zničil! 
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_08");	//Byl jsem příliš slabý, abych odolal síle tvých zbraní.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_09");	//Ale teď, díky Beliarovi a jeho služebníkům jsem připraven vrátit se zpět!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_10");	//A tentokrát se už nenechám zaskočit.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_11");	//Získal jsem svou bývalou sílu, a jsem připraven obrátit svůj hněv na kohokoliv, kdo se opováží bouřit proti svému pánu.
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_WhoYou_01_12");	//Vypadá to, že z mocného démona se stala Beliarova loutka.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_13");	//Říkej si co chceš, člověče! Všeho do času a tobě už se ho moc nedostává...
};

func void DIA_Sleeper_Old_Hello_Dragons()
{
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Dragons_01_01");	//Proč jsi probudil draky?
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_02");	//Ty co nazýváš draky, jsou dávní tvorové jako já.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_03");	//Oni prostě nemohli neslyšet mé volání o pomoc!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_04");	//Ale já je neprobudil... (zlověstně) Poslouchají jen vůli těch, kdo je na samém počátku stvořil!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Dragons_01_05");	//Mluvíš o Strážcích?
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_06");	//Přímo o nich! 
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_07");	//Pradávní Strážci vesmíru, skrývající se ve stínech, aby nezastínili slávu vašich bohů.
};

func void DIA_Sleeper_Old_Hello_Battle()
{
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_01");	//Jak to tak vidím, chceš se mě pomstít za tu malou roztržku v chrámu.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_02");	//Nemá cenu zapírat, toužím po odplatě jako po ničem jiném!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_03");	//To co se stalo při našem posledním setkání, byla jen hloupá náhoda... už takoví štěstí mít nebudeš!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_04");	//Tak neztrácejme čas zdvořilostma.
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_05");	//Nikdo ti neříkal, že se historie často opakuje. Pošlu tě zpátky stejnou dírou jakou jsi na tento svět přišel!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_06");	//(zlověstný smích) Tentokrát ne, člověče!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_07");	//Nejprve to skončím s tebou, a pak se postarám o celý ten ubohý svět!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_08");	//Tak se ukaž jak jsi schopný, slizoune!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_09");	//Neboj se, nenechám tě dlouho čekat...
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};

instance DIA_XranFreg_Exit(C_Info)
{
	npc = XranFreg;
	nr = 999;
	condition = DIA_XranFreg_Exit_Condition;
	information = DIA_XranFreg_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_XranFreg_Exit_Condition()
{
	return TRUE;
};

func void DIA_XranFreg_Exit_Info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_XranFreg_Hello(C_Info)
{
	npc = XranFreg;
	nr = 1;
	condition = DIA_XranFreg_Hello_Condition;
	information = DIA_XranFreg_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_XranFreg_Hello_Condition()
{
	return TRUE;
};

func void DIA_XranFreg_Hello_Info()
{
	AI_Output(self,other,"DIA_XranFreg_Hello_01_01");	//Člověče, jak jsi přišel...
	AI_Output(other,self,"DIA_XranFreg_Hello_01_02");	//Ty mluvíš? A já myslel, že jsem potkal dalšího kamennýho troubu.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_03");	//Takže ty jsi živý kamenný obr? Co to je s tvojí velikostí.
	AI_Output(self,other,"DIA_XranFreg_Hello_01_04");	//Na mojí velikosti nezáleží, smrtelníku!
	AI_Output(self,other,"DIA_XranFreg_Hello_01_05");	//Jestli budu chtít můžu být do výšky se tyčící skálou, nebo malým kamínkem pod tvojí botou.
	AI_Output(self,other,"DIA_XranFreg_Hello_01_06");	//Ale na mojí moc a sílu to nemá vliv.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_07");	//Kdo jsi a proč jsi tady?
	AI_Output(self,other,"DIA_XranFreg_Hello_01_08");	//Strážci mě dali jméno Fregarah, a strážím bránu Egezarta.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_09");	//A kdo je Egezart?
	AI_Output(self,other,"DIA_XranFreg_Hello_01_10");	//Ten kdo se nachází za touto bránou, víc vědět nepotřebuješ.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_11");	//A jak můžu projít?
	AI_Output(self,other,"DIA_XranFreg_Hello_01_12");	//Tvoje cesta končí zde smrtelníku, odejdi nebo zemři.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_13");	//Nedáváš mě na výběr strážče. Teď půjdu dál!
	AI_Output(self,other,"DIA_XranFreg_Hello_01_15");	//Vybral sis sám. Dál už nepůjdeš.

	if(MIS_XRANFREG == LOG_Running)
	{
		B_GivePlayerXP(1000);
		B_LogEntry(TOPIC_XRANFREG,"Potkal jsem kamenného obra o které byla zmínka v záznamech. Po prvdě neudělal na mě dojem, ale vzhled může klamat.");
	};
};