
instance DIA_ORC_8564_VANHAN_EXIT(C_Info)
{
	npc = orc_8564_vanhan;
	condition = dia_orc_8564_vanhan_exit_condition;
	information = dia_orc_8564_vanhan_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8564_vanhan_exit_condition()
{
	return TRUE;
};

func void dia_orc_8564_vanhan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8564_VANHAN_HELLO(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_hello_condition;
	information = dia_orc_8564_vanhan_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8564_vanhan_hello_condition()
{
	if((FIRSTVANHAN == FALSE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_hello_info()
{
	var C_Item heroweapon;
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_01");	//UCHA-CHA... FATGAR!
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_02");	//NOR KHATAG BAR KER DARAN!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_03");	//Nerozumím... Co to říkáš?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_04");	//BER TOGAN URHAN BOGOT!... Proč člověk rušit Ur-Han, proč sem přijít?
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_05");	//... (takže Emnol měl pravdu, ze všech se staly duchové!)
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_06");	//Přišel jsem si promluvit se skřety - mám otázky.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_07");	//NOKAN BADAR!... Proč skřeti mluvit s člověkem o jeho otázce?!
	if(Npc_HasItems(hero,itmw_2h_orcprestige) >= 1)
	{
		heroweapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
		{
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_08");	//Proto.
			AI_ReadyMeleeWeapon(other);
			AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_09");	//Mmm!... (udiveně) Ur-Han už vědět! Ur-Han vidět, že člověk nést Ulu-Mulu. Ty muset být velká válečník.
			AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_10");	//Jak smrtelník vědet o Ulu-Mulu? Jak člověk vědět, že nezemřít, když sem přijít?
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_11");	//Jeden skřet ho pro mne udělal a vysvětlil mi, co tento talisman znamená.
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_12");	//Nyní mě vyslechni...
			AI_RemoveWeapon(other);
		}
		else
		{
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_51");	//Teď jsi mluvil ty, takže to znamená, že teď budeš zticha a necháš mluvit mě!
			AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_52");	//KVAGAD DZHABAR! Nooo, člověk... Tak dobrá, mluvit!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_53");	//Teď jsi mluvil ty, takže to znamená, že teď budeš zticha a necháš mluvit mě!
		AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_54");	//KVAGAD DZHABAR! Nooo, člověk... Tak dobrá, mluvit!
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_12A");	//Říkáš, že tvé jméno je Ur-Han. Kdo jsi?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_13");	//Je to už hodně zim, co Ur-Han být jeden ze synů ducha. Lidé říkat šaman...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_14");	//Ale nyní se z vás staly duchové - proč?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_15");	//Zlý démon nás chtít zabít, prokletí všichni... Vzít nám ducha.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_16");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_17");	//Ur-Han myslet to, co říct.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_18");	//A co to bylo za démona?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_19");	//KRAKTAR TEKAN...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_20");	//Co to znamená?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_21");	//Lidé říkat - VELKÝ STÍN, být ten, kdo proklít každý...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_22");	//Velký Stín?! O tom jsem už slyšel...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_23");	//A není to náhodou ten velký černý drak, kterému se říká Azgalor?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_24");	//KROT BUTUR ORFAG!... Ur-Han tak věřit... KRAKTAR TEKAN AZGALOR!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_25");	//Teď je mi to jasné. Ale jak se Azgalor dostal k nám do světa?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_26");	//Ur-Han a bratři vyvolat démon. Myslet si, že démon pomoci - udělat bratři silné.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_27");	//Jak předvídatelné! Vidím, že vás historie se Spáčem nic nenaučila!
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_28");	//Kdo být Spáč?!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_29");	//No, ve skřetím jazyce - KRUSHAK! Něco jako ten tvůj Azgalor... Také démon, také zlý a zlomyslný a také chtěl všechny zabít - Včetně tvých bratrů a skoro se mu to povedlo.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_30");	//Ur-Han KRUSHAK nic neříkat... Ale myslet, že to zlý démon, pokud zabít bratry.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_31");	//Řekni mi, jak se ti podařilo přivolat Azgalora do údolí?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_32");	//Bratři hledat starodávný artefakt - DAKH BAR FATGAR... Najít, vyvolat, démon přijít.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_33");	//DAKH BAR FATGAR je pravděpodobně Oko hněvu...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_34");	//Ano, tak nazývat lidé... Ur-Han vidět - člověk vědět o skřetech hodně. Ur-Han překvapen!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_35");	//Nic překvapujícího, slyšel jsem o jedné legendě, ve které byl Velký Stín a Oko hněvu, které ho mohlo zavolat...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_37");	//Dobrá, řekni mi, kde je teď tento Azgalor? Kde ho můžu najít?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_38");	//Ur-Han nevědět. Démon dlouho být pryč...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_39");	//Proč člověk chtít najít zlý démon?
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_40");	//Chci zbavit svět tohoto netvora jednou provždy.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_41");	//Člověk chtít zabít Azgalora?!... KHROTOK DZHABAR!
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_42");	//Člověk muset být velká válečník... Ale zemřít, pokud zkusit. Démon velmi silná! Více než člověk myslet.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_43");	//No, to uvidíme! Jak ho můžu najít?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_44");	//Ur-Han nevědět... (zamyšleně)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_45");	//Ale přemýšlet, když člověk zkusit vyvolat démona jako bratři, démon přijít znovu.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_46");	//Pak potřebuji Oko hněvu... Kde bych ho měl hledat?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_47");	//Bratři dát démon DAKH BAR FATGAR, když démon přijít...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_48");	//Ur-Han nevědět, kde hledat DAKH BAR FATGAR. Člověk hledat...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_49");	//Ano, jako vždy, musím udělat všechno sám... (ironicky)
	FIRSTVANHAN = TRUE;
	B_LogEntry(TOPIC_URNAZULRAGE,"Mluvil jsem s duchem skřetího šamana Ur-Hana. Nyní do sebe vše zapadá. Podle něj skřeti našli Oko hněvu, o kterém mi řekl Elvais. S pomocí artefaktu do údolí přivedli Velký Stín - tak skřeti nazývají Azgalora. Zbytek už se v údolí odehrálo dle známého scenáře.");
	B_LogEntry(TOPIC_URNAZULRAGE,"Také dle slov Ur-Hana, Azgalor už není v údolí po velmi dlouhou dobu a je jenom jediný způsob jak ho přivolat zpátky - musím najít Oko hněvu a provést rituál. Až ho zavolám, sejmu ho a jsem tu hotov. Vše je jednoduché...");
	B_LogEntry(TOPIC_URNAZULRAGE,"Ur-Han neví, kde bych měl hledat Oko hněvu, ale já už to tu pročešu.");
	self.name[0] = CZ_NAME_Orc_Unique_Vanhan_Title;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8564_VANHAN_TALISMAN(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_talisman_condition;
	information = dia_orc_8564_vanhan_talisman_info;
	important = FALSE;
	permanent = TRUE;
	description = "Našel jsem ten talisman.";
};


func int dia_orc_8564_vanhan_talisman_condition()
{
	if((FIRSTVANHAN == TRUE) && (BLKDRAGNISDEAD == FALSE) && (Npc_HasItems(other,itmi_orcamulet_vanhan) >= 1))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_talisman_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_01");	//Našel jsem ten talisman.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_02");	//KAVAROK MATAR NEMROK!... (udiveně)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_03");	//Kde člověk najít?
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_04");	//V chrámu na východě, nevíš, jak se to tam mohlo dostat?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_05");	//Ur-Han nevědět. Ztratit jej, když bitva začít mezi služebníky Azgalora a bratry.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_06");	//Ur-Han tím být velmi zdrcen - dar od největší šaman...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_07");	//Ale nyní člověk znovu nalézt...
	B_GiveInvItems(other,self,itmi_orcamulet_vanhan,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_09");	//Šamani dlužit slova díky.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_10");	//Ur-Han chtít dát odměnu...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_11");	//Ur-Han ale nemít... Dát člověku klíč od truhly. Člověk moci otevřít a vzít vše, co najít.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_12");	//A kde je ta truhla?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_13");	//Člověk podívat dole v táboře, tam najít ji.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_14");	//A co v té truhle je?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_15");	//Ur-Han nepamatovat. Být moc dávno.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_16");	//Áha.
	B_GiveInvItems(self,other,itke_orcshaman_shv,1);
};


instance DIA_ORC_8564_VANHAN_PRISONSOUL(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_prisonsoul_condition;
	information = dia_orc_8564_vanhan_prisonsoul_info;
	important = FALSE;
	permanent = TRUE;
	description = "Našel jsem tenhle zvláštní artefakt.";
};


func int dia_orc_8564_vanhan_prisonsoul_condition()
{
	if((FIRSTVANHAN == TRUE) && (BLKDRAGNISDEAD == FALSE) && (Npc_HasItems(other,itmi_prisonsoul) >= 1) && (FINDPRISONSOUL == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_prisonsoul_info()
{
	AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_01");	//Našel jsem tenhle zvláštní artefakt.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_02");	//Ur-Han se podívat... Ur-Han říct.
	B_GiveInvItems(other,self,itmi_prisonsoul,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_03");	//Mmm... Ur-Han vidět, že to DAKH FATGAR!...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_04");	//Co je to, DAKH FATGAR?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_05");	//Člověk najít DAKH FATGAR - Oko hněvu, ale tam nebýt magie.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_06");	//Co to znamená?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_07");	//Člověk muset navrátit magie DAKH BAR FATGAR. Pak člověk moci vyvolat démon.
	if(READ_AZGOLOR == FALSE)
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_08");	//A jak mu můžu navrátit jeho sílu?
		AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_09");	//Ur-Han nevědět.
		B_LogEntry(TOPIC_URNAZULRAGE,"Našel jsem zvláštní druh kamene a ukázal ho Ur-Hanovi. Skřet řekl, že jsem našel mocný artefakt - Oko hněvu. Ale kámen ztratil magickou sílu a Ur-Han neví, jak ji artefaktu vrátit.");
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_10");	//Myslím, že vím jak to udělat. Našel jsem v chrámu tuhle starou knihu.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_11");	//Díky za pomoc.
		B_LogEntry(TOPIC_URNAZULRAGE,"Ukázal jsem Ur-Hanovi ten zláštní kámen, co jsem našel. Řekl, že je to Oko hněvu. Nyní mu navrátím moc pomocí knihy démonů.");
	};
	B_GiveInvItems(self,other,itmi_prisonsoul,1);
	FINDPRISONSOUL = TRUE;
};


instance DIA_ORC_8564_VANHAN_AZGALORBOOK(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_azgalorbook_condition;
	information = dia_orc_8564_vanhan_azgalorbook_info;
	important = FALSE;
	permanent = TRUE;
	description = "Můžeš přečíst tuto knihu?";
};


func int dia_orc_8564_vanhan_azgalorbook_condition()
{
	if((FIRSTVANHAN == TRUE) && (BLKDRAGNISDEAD == FALSE) && (Npc_HasItems(other,itwr_azgolor) >= 1) && (FINDAZGALORBOOK == FALSE) && (READ_AZGOLOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_azgalorbook_info()
{
	var int ingcount;
	ingcount = 0;
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_01");	//Můžeš přečíst tuto knihu?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_02");	//Dát knihu Ur-Han...
	B_GiveInvItems(other,self,itwr_azgolor,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_03");	//... (zkoumá knihu)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_04");	//Starobylý jazyk - jazyk démona... Ur-Han znát jazyk, vykouzlit KRAKTAR TEKAN.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_05");	//O čem se tam píše?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_06");	//... (dívá se do knihy)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_07");	//Kniha psát co je potřeba pro DAKH BAR FATGAR a jak navrátit magie.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_09");	//Počkat, hned to říct.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_10");	//... (listuje v knize)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_11");	//Pro navrácení magie člověk mít BLADAR, KHORKAN a SOLFAG.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_12");	//Nerozumím ti ani slovo. Co je BLADAR?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_13");	//Být krev bratra, krev skřeta.
	if(Npc_HasItems(other,itmi_orcblood) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_14");	//A KHORKAN?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_15");	//Být krev ohnivá démon.
	if(Npc_HasItems(other,itmi_barlokheart) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_16");	//A SOLFAG?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_17");	//Žlutá, hořlavá a smradlavá kámen. Když být hozen do ohně, hořet.
	if(Npc_HasItems(other,ItMi_Sulfur) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_18");	//Mm... Zajímavá sestavička. A co s tím vším mám dělat?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_19");	//Muset se dát spolu s DAKH BAR FATGAR, uvolnit tak magie z krve démona.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_19A");	//Krev být nasycená magie. Oko hněvu probudit!
	if(ingcount == 0)
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_20");	//To je zajímavé. A ty asi nevíš, kde ty věci najdu, co?
		AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_21");	//...
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_22");	//Jasně.
		B_LogEntry(TOPIC_URNAZULRAGE,"Přinesl jsem Ur-Hanovi knihu, co jsem našel v chrámu. Kniha je sepsaná v starobylém jazyce démonů. Zjistili jsme, jak obnovit magii Oka. Potřebuji tyto věci - krev skřeta, krev démona a smradlavou substanci žluté barvy - prý dobře hoří. Ur-Han neřekl, co přesně to bude. Nyní bych to měl najít a obnovit sílu Oka.");
	}
	else if(ingcount == 3)
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_23");	//Zajímavé, vše co jsi říkal, je náhodou u mě.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_24");	//Teď jen jak Oku vrátit magii.
		B_LogEntry(TOPIC_URNAZULRAGE,"Přinesl jsem Ur-Hanovi knihu, co jsem našel v chrámu. Kniha je sepsaná v starobylém jazyce démonů. Zjistili jsme, jak obnovit magii Oka. Potřebuji tyto věci - krev skřeta, krev démona a smradlavou substanci žluté barvy - prý dobře hoří. Ur-Han neřekl, co přesně to bude, ale mám podezření, že je to síra. Nyní bych měl obnovit sílu Oka.");
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_25");	//Zajímavé... Část z toho zrovna mám...
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_26");	//Teď jen najít zbytek a mám to.
		B_LogEntry(TOPIC_URNAZULRAGE,"Přinesl jsem Ur-Hanovi knihu, co jsem našel v chrámu. Kniha je sepsaná v starobylém jazyce démonů. Zjistili jsme, jak obnovit magii Oka. Potřebuji tyto věci - krev skřeta, krev démona a smradlavou substanci žluté barvy - prý dobře hoří. Ur-Han neřekl, co přesně to bude. Nyní bych měl najít to, co mi chybí, a obnovit sílu Oka.");
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_27");	//Píše se v té knize co dál?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_28");	//Člověk muset znát Slova Síly.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_29");	//Co je to?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_30");	//Slova, kterými démoni napsat jedna kniha.
	if(KNOWS_AZGOGLOR_SUMMON == TRUE)
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_31");	//Vím co myslíš.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_32");	//V jedné knize jsem našel popis starého rituálu.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_33");	//Vím, že jsou potřebná nějaká slova...
		B_LogEntry(TOPIC_URNAZULRAGE,"Jestli chci přivolat Azgalora, musím najít knihu Slovo Síly... Někde jsem ji viděl...");
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_34");	//To je vše?
		B_LogEntry(TOPIC_URNAZULRAGE,"Ur-Han řekl, že pro vyvolání Azgalora musím najít Slova Síly...");
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_34");	//Není v knize nic dalšího, co by mi pomohlo?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_35");	//Ur-Han myslet, být vše.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_37");	//Ur-Han přát hodně štěstí.
	B_GiveInvItems(self,other,itwr_azgolor,1);
	READ_AZGOLOR = TRUE;
	FINDAZGALORBOOK = TRUE;
};

