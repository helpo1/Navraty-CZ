
instance DIA_ORCSHAMAN_UR_DAH_EXIT(C_Info)
{
	npc = orcshaman_ur_dah;
	nr = 999;
	condition = dia_orcshaman_ur_dah_exit_condition;
	information = dia_orcshaman_ur_dah_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orcshaman_ur_dah_exit_condition()
{
	if(URDAHTELLME == FALSE)
	{
		return TRUE;
	}
	else if(URDAHTELLME >= 4)
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORCSHAMAN_UR_DAH_HELLO(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_hello_condition;
	information = dia_orcshaman_ur_dah_hello_info;
	permanent = FALSE;
	description = "Jsi ten šaman jménem Ur-Dah?.";
};


func int dia_orcshaman_ur_dah_hello_condition()
{
	if(NAGSHORTELLME == TRUE)
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_01");	//Jsi ten šaman jménem Ur-Dah?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_02");	//Správně, člověče... (vznešeně) Já jsem Ur-Dah, vznešený šaman z klanu Vysoká skála.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_03");	//Takže jsem se nemýlil - něco po tobě potřebuji!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_04");	//Člověk mě hledal?!... (trochu udiveně) A co potřebuje člověk po Ur-Dahovi?
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_05");	//Potřebuji si promluvit o jedné věci - Duch Vody.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_06");	//Shor, vůdce tvého klanu, mi řekl, že bys o tom měl něco málo vědět.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_07");	//Duch Vody?! Hmmm... (zamyšleně) A proč to chce člověk vědět?!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_08");	//Slyšel jsem, že kdysi dávno jeden ze skřetích šamanů zotročil tuto bytost.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_09");	//Chci najít způsob jak vrátit tomuto stvoření svobodu.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_10");	//Ty chceš osvobodit Ducha Vody?! Hmmm... (velmi udiveně) Nicméně tím člověk velmi překvapit Ur-Daha!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_15");	//Člověk musí být velmi odvážný - přijít sem mezi tolik skřetů.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_16");	//Jestli o tom ale člověk řekne ostatním klanům - skřeti teď člověka zabijou! Člověk zemře.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_17");	//Ur-Dah věří, že ani znamení síly teď nemůže člověka zachránit.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_18");	//Člověk být moudrý, že říct o tom pouze Ur-Dah.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_19");	//Ur-Dah vyslechnout člověk - jestli on zkusí osvobodit Ducha Vody, Ur-Dah pomůže.
	B_LogEntry(TOPIC_WAKONTEST,"Našel jsem skřetího šamana Ur-Daha. Prvně byl překvapen, ale když zjistil důvod mé návštěvy, souhlasil, že mi pomůže.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_condition;
	information = dia_orcshaman_ur_dah_tellstory_info;
	permanent = FALSE;
	description = "Řekni mi co víš o Duchu Vody.";
};


func int dia_orcshaman_ur_dah_tellstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_hello))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_01");	//Řekni mi co víš o Duchu Vody.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_02");	//Dobrá! Ur-Dah bude mluvit - poslouchej pozorně.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_04");	//Bylo to hodně zim zpátky, hodně zim - když Ur-Dah odešel.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_05");	//Velký šaman mocného kmene Velký kámen šel hledat něco, co mu pomůže konečně porazit jeho nepřátele!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_06");	//Chápu dobře, že Velký kámen je Vysoká skála?!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_07");	//Správně človeče - nyní se nazýváme Vysoká.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_08");	//Jasně. A dál?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_09");	//Bratři viděli, že jejich nepřítel přivolat zlý démon - Krushak - a stát se velmi silný! Nepřítele teď nemožné porazit!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_10");	//Krushak?! Vím o čem mluvíš - mi mu říkáme Spáč.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_11");	//Pravda, člověče. Lidé volali na Krushaka Spáč!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_14");	//Bratři také usilovat o sílu jako Krushak.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_15");	//Šamani klanů vyvolali své předky, aby jim dali radu.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_16");	//Předkové řekli šamanům, že existuje prastaré stvoření - Duch Vody. Duch Vody prý velmi silný a dát bratrům sílu ne menší, než ta Spáčova!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_17");	//Bratři se vydali hledat Ducha Vody a našli jej tady v údolí.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_18");	//Šamani použili magii, velmi silnou magii, která měla zajistit, aby nás Duch nemohl opustit.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_19");	//Nicméně po té bratři nezjistili, jak využít jeho sílu!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_22");	//Bratři se velmi rozhněvali, že nemohou využít moc proti nepříteli!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_23");	//Prokleli Ducha Vody, aby už nikdy nemohl získat svobodu.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_24");	//Šamani klanu užili prastarou a mocnou magii, aby NIKDO kromě šamanů klanu nemohl Ducha Vody osvobodit.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_25");	//Ale pak začala válka s nepřáteli! (smutně) Nepřátelé zabili všechny šamany... A Ducha Vody už nemohl zachránit nikdo.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_27");	//No, to nebyl nejlepší výsledek...
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_28");	//Ale to nejhorší je, že vesnici opustila voda!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_29");	//Není voda, nebude nic... Jen skála.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_30");	//Skřeti odešli a našli si jiné místo, ale tam to být stejné.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_31");	//Bratři pochopili a vrátili se zpátky. Žít vedle velké skály a být zatraceni navždy!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_32");	//Takže jste se chytili do vlastní pasti.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_33");	//Ur-Dah myslí to samé. Skřeti se sami potrestali.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_34");	//Proto Ur-Dah pomůže člověku osvobodit Ducha Vody!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_35");	//Jestli jej člověk dokáže osvobodit, prokletí možná zmizet a voda se vrátí do tábora.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_36");	//Bez vody klan pomalu, ale jistě vymře.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_37");	//Vše je mi jasné.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Ur-Dah mi vyprávěl příběh, jak šamani z 'Vysoké skály' přišli k Duchu Vody. Když zjistili že nedokážou získat jeho sílu pro sebe, uvalili na něj starobylé kouzlo, kterým ho navždy skryli před zraky ostatního světa! Jak se ukázalo ani skřeti z toho nevyšli snadno. Na jejich území přestal padat déšť a vodní zdroje vyschly. Jednoduše řečeno, skřeti byli prokleti!");
	Log_AddEntry(TOPIC_WAKONTEST,"Co se týče Ducha Vody - dokážou ho osvobodit pouze šamani, kteří na něj uvalili své kouzlo. Nicméně, v jedné z válek mezi skřety byli zabiti všichni šamani klanu Vysoké skály, a to tajemství, zdá se, zemřelo s nimi.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_MAGIC(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_magic_condition;
	information = dia_orcshaman_ur_dah_tellstory_magic_info;
	permanent = FALSE;
	description = "Jakou magii šamani použili?";
};


func int dia_orcshaman_ur_dah_tellstory_magic_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_magic_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_01");	//Jakou magii šamani použili?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_02");	//To nemůžu vědět přesně! Ale slyšel jsem, že šamani položili na prastarý oltář kmene 5 černých kamenů, do kterých zavřeli prastarou sílu.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_03");	//Magie šamanů byla velmi stará, velmi silná... takovou Ur-Dah ještě neviděl!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_04");	//Když Ur-Dah zkusil osvobodit Ducha Vody, nic se nestalo.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_05");	//Myslím, že budou třeba černé krystaly, které použili šamani k jeho uvěznění.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_06");	//Jestli magie zmizí, Duch Vody bude svobodný!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_07");	//Pak ty krystaly zničím, zkoušel jsi to už někdy?!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_08");	//Ur-Dah zkoušel... (pohnutě) Je nemožné ji zlomit, je nemožné ji zničit!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_09");	//Člověk by se neměl dotékat kamene, mohl by okamžitě zemřít!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_10");	//Ur-Dah nechce, aby člověk zemřel - proto mu o tom teď řekl!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_11");	//Díky za varování. Víš něco o těch krystalech?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_12");	//Slyšel jsem, že když šamani takový krystal udělali, rozbili jej!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_13");	//Rozbili?!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_14");	//Rozbili je na kousky a schovali, pro šamany to být velmi důležité!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_15");	//Velmi silně je chránili, ostatní bratři ani neví kam je schovali.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_16");	//Proč to pro ně bylo tak důležité?!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_17");	//Ur-Dah tohle neví! Ale myslím, že v každém krystalu je kus magie.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_18");	//Jestli to tak je, pak ty kameny můžou být klíčem k řešení.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_19");	//Ur-Dah neví jistě, ale myslí, že člověk by mohl mít pravdu.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_20");	//Takže pro začátek musíme najít ty šutry. Kolik jich je a kde jsou?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_21");	//Kousků krystalu bylo tolik kolik šamanů. Pět šamanů - pět kousků.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_22");	//Pět šamanů? To mi něco připomíná.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_23");	//Proč je člověk překvapen? Ur-Dah nerozumí... (udiveně)
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_24");	//Šamani ze skřetího města povolali Spáče - Krushaka! Bylo jich také pět!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_25");	//Arrgh... Člověk mít pravdu! Nyní Ur-Dah rozumí proč všecho velmi podobné pro člověk.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_26");	//Nevím, proč jsem nerozuměl hned!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_27");	//Dobře, ale teď není čas o tom mluvit.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_28");	//Raději mi řekni - kde najdu ty úlomky?!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_29");	//Pokud si vzpomínám, řekl jsi, že během války byli ti šamani zabiti. Nezústali ty úlomky u nich?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_30");	//Ne tak docela! Každý šaman ukryl svůj úlomek na tajné místo - nenosit ho pořád u sebe.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_31");	//Nikdo neví kde přesně!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_32");	//Jasně. Hledání se teda zřejmě nevyhnu...
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_33");	//Ur-dah doufá, že člověk hledat pořádně. Hodně štěstí!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_34");	//No, dík.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Aby Duch Vody nemohl být osvobozen, skřetí šamani položili na starý oltář v jejich kmeni velký černý kámen a uzavřeli do něj magickou sílu. Ur-Dah neví jaké je kouzlo podstaty, ale varoval mě, že kdo se ho dotkne, zemře! Po rituálu prý každý šaman ulomil kus krystalu z kamene. Co s nimi udělali - nikdo neví! Ale myslí si, že úlomky jsou klíčem k osvobození Ducha Vody. Pro začátek bych měl najít ty úlomky a pak zjistit jak je použít. Nicméně kde je hledat neví přesně ani Ur-Dah!");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_FIND(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_find_condition;
	information = dia_orcshaman_ur_dah_tellstory_find_info;
	permanent = FALSE;
	description = "Kde přesně skřeti uchovávají Ducha Vody?";
};


func int dia_orcshaman_ur_dah_tellstory_find_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_find_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_01");	//Kde přesně skřeti uchovávají Ducha Vody?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_02");	//Člověk půjde do klanu Vysoká skála a najde vééélký kámen. Uvnitř je Duch Vody!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_03");	//Nicméně, člověk by neměl skoušet zničit kámen - to nelze provést, jinak Duch Vody okamžitě umřít.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_04");	//Dobře! Pochopil jsem.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Ur-Dah řekl, že Duch Vody je ve klanu Vysoké skály, uvězněn ve velkém kameni.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_DONE(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_done_condition;
	information = dia_orcshaman_ur_dah_tellstory_done_info;
	permanent = FALSE;
	description = "Co mám dělat až ty šutry najdu?";
};


func int dia_orcshaman_ur_dah_tellstory_done_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory_magic))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_done_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_01");	//Co mám dělat až ty šutry najdu?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_02");	//To přesně nemůžu člověku říci.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_03");	//Ale myslím si, že člověk by měl krystal znovu zcelit!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_04");	//Ale řekl jsi, že je nemožné se ho dotknout, ne?!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_05");	//Ur-Dah řekl! Dotknout se nikdo nemůže, jinak zemře.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_06");	//Proto musí člověk najít magii, která ho ochrání a musí být silnější než magie šamanů!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_07");	//Magii jako je ta Ducha Vody.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_09");	//Člověk by měl přemýšlet pořádně, jestli nechce zemřít...
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_10");	//Samosebou.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Ur-Dah řekl, že jakmile najdu krystaly, mám je vrátit na své místo. Nicméně před tím potřebuji magii, která mě ochrání proti magii šamanů! Ur-Dah řekl, že musím najít magii měřitelnou s magií Ducha Vody.");
};

