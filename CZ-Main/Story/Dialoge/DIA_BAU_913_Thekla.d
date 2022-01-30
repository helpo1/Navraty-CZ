/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int DIA_Thekla_Baker_Condition - upraveny podmínky dialogu

*/


instance DIA_Thekla_EXIT(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 999;
	condition = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Thekla_HALLO(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 1;
	condition = DIA_Thekla_HALLO_Condition;
	information = DIA_Thekla_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thekla_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Co děláš v mé kuchyni?
};

instance DIA_Thekla_Lecker(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 2;
	condition = DIA_Thekla_Lecker_Condition;
	information = DIA_Thekla_Lecker_Info;
	permanent = FALSE;
	description = "Něco tady výborně voní!";
};

func int DIA_Thekla_Lecker_Condition()
{
	return TRUE;
};

func void DIA_Thekla_Lecker_Info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Něco tady výborně voní!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//No jasně! Takové jako ty dobře znám! Takových se tady po okolí potulují spousty.
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Nejdřív se snaží vetřít do tvojí přízně a pak, když je potřebuješ, nejsou nikde k nalezení!
};

instance DIA_Thekla_Baker(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 3;
	condition = DIA_Thekla_Baker_Condition;
	information = DIA_Thekla_Baker_Info;
	permanent = FALSE;
	description = "To je tvá pec?";
};

func int DIA_Thekla_Baker_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Thekla_Lecker) == TRUE)) // && (BakerSee == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Baker_Info()
{
	AI_Output(other,self,"DIA_Thekla_Baker_01_00");	//To je tvá pec?
	AI_Output(self,other,"DIA_Thekla_Baker_01_01");	//Ano, moje.
	AI_Output(other,self,"DIA_Thekla_Baker_01_02");	//A co v ní pečeš?
	AI_Output(self,other,"DIA_Thekla_Baker_01_03");	//Obvykle chleba a koláče. Ale klidně i maso, pokud bych potřebovala.
	AI_Output(other,self,"DIA_Thekla_Baker_01_04");	//Mohl bych ji použít?
	AI_Output(self,other,"DIA_Thekla_Baker_01_05");	//Ano, ale jen když si budu jistá, že mi ji nezničíš.
	AI_Output(other,self,"DIA_Thekla_Baker_01_06");	//Jak tě můžu přesvědčit?
	AI_Output(self,other,"DIA_Thekla_Baker_01_07");	//No, třeba... (zamyšleně) Umíš upéct koláč?
	AI_Output(other,self,"DIA_Thekla_Baker_01_08");	//Bohužel ne.
	AI_Output(self,other,"DIA_Thekla_Baker_01_09");	//Hmmm... (usmívá se) Dovolím ti ji používat, až se je naučíš péct.
};

instance DIA_Thekla_BakerDo(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 3;
	condition = DIA_Thekla_BakerDo_Condition;
	information = DIA_Thekla_BakerDo_Info;
	permanent = FALSE;
	description = "A ty mě můžeš naučit péct koláče?";
};

func int DIA_Thekla_BakerDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Baker) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_BakerDo_Info()
{
	AI_Output(other,self,"DIA_Thekla_BakerDo_01_00");	//A ty mě můžeš naučit péct koláče?
	AI_Output(self,other,"DIA_Thekla_BakerDo_01_01");	//Samozřejmě. Ale ne jen tak. Budeš potřebovat nějaké zkušenosti s vařením.
	TheklaTeachMe = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Thekla mě může naučit, jak péct koláče.");
};

instance DIA_Thekla_TeachCookDone(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 6;
	condition = DIA_Thekla_TeachCookDone_Condition;
	information = DIA_Thekla_TeachCookDone_Info;
	permanent = TRUE;
	description = "Nauč mě, jak upéct koláče.";
};

func int DIA_Thekla_TeachCookDone_Condition()
{
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		if((TheklaTeachMe == TRUE) && ((Thekla_Cake_01 == FALSE) || (Thekla_Cake_02 == FALSE) || (Thekla_Cake_03 == FALSE) || (Thekla_Cake_04 == FALSE) || (Thekla_Cake_05 == FALSE)))
		{
			return TRUE;
		};
	}
	else
	{
		if((TheklaTeachMe == TRUE) && ((Thekla_Cake_01 == FALSE) || (Thekla_Cake_02 == FALSE) || (Thekla_Cake_03 == FALSE) || (Thekla_Cake_04 == FALSE)))
		{
			return TRUE;
		};
	};
};

func void DIA_Thekla_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_Thekla_TeachCookDone_01_00");	//Nauč mě, jak upéct koláče.
	AI_Output(self,other,"DIA_Thekla_TeachCookDone_01_01");	//Tak... (utírá si ruce) Co bys chtěl naučit péct?
	Info_ClearChoices(DIA_Thekla_TeachCookDone);
	Info_AddChoice(DIA_Thekla_TeachCookDone,Dialog_Back,DIA_Thekla_TeachCookDone_back);

	if(Thekla_Cake_01 == FALSE)
	{
		Info_AddChoice(DIA_Thekla_TeachCookDone,"Jablečný koláč (VB: 1, cena: 250 zlatých)",DIA_Thekla_TeachCookDone_Apple);
	};
	if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_02 == FALSE))
	{
		Info_AddChoice(DIA_Thekla_TeachCookDone,"Masový koláč (VB: 3, cena: 500 zlatých)",DIA_Thekla_TeachCookDone_Meat);
	};
	if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_03 == FALSE))
	{
		Info_AddChoice(DIA_Thekla_TeachCookDone,"Houbový koláč (VB: 3, cena: 750 zlatých)",DIA_Thekla_TeachCookDone_Mushroom);
	};
	if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_04 == FALSE))
	{
		Info_AddChoice(DIA_Thekla_TeachCookDone,"Rybí koláč (VB: 3, cena: 1000 zlatých)",DIA_Thekla_TeachCookDone_Fish);
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_03 == TRUE) && (Thekla_Cake_05 == FALSE))
		{
			Info_AddChoice(DIA_Thekla_TeachCookDone,"Medový koláč (VB: 5, cena: 1500 zlatých)",DIA_Thekla_TeachCookDone_Honey);
		};
	};
};

func void DIA_Thekla_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Thekla_TeachCookDone);
};

func void DIA_Thekla_TeachCookDone_Apple()
{
	AI_Output(other,self,"DIA_Thekla_TeachCookDone_Apple_01_00");	//Nauč mě upéct jablečný koláč.

	if((Npc_HasItems(hero,ItMi_Gold) >= 250) && (hero.lp >= 1))
	{
		hero.lp = hero.lp - 1;
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Apple_01_01");	//Budeš potřebovat pětadvacet kusů jablek, pět krajíců chleba, kousek sýru, rostlinku modrého bezu a vodu.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Apple_01_02");	//Dělá se z jablečného pyré, které se míchá s chlebem. K směsi přidáme strouhaný sýr a ochutíme modrým bezem.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Apple_01_03");	//Dáš do trouby a po několika minutách je koláč hotový.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Apple_01_04");	//Děkuji.
		AI_Print("Naučeno: Vaření - 'Jablečný koláč'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro JABLEČNÝ KOLÁČ: 25x jablko, 5x chléb, sýr, modrý bez a voda.");
		Snd_Play("LevelUP");
		Thekla_Cake_01 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 250)
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Apple_01_05");	//Je mi líto, ale zadarmo to dělat nebudu.
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Apple_01_06");	//Přines zlato.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Apple_01_07");	//Je mi líto, ale nemáš dostatek zkušeností.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Meat()
{
	AI_Output(other,self,"DIA_Thekla_TeachCookDone_Meat_01_00");	//Nauč mě upéct masový koláč.

	if((Npc_HasItems(hero,ItMi_Gold) >= 500) && (hero.lp >= 3))
	{
		hero.lp = hero.lp - 3;
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Meat_01_01");	//Budeš potřebovat pětadvacet kousků syrového masa, pět krajíců chleba, dvě láhve mléka a láhev kořalky.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Meat_01_02");	//Mléko a mleté maso promícháme s chlebem a přidáme trochu kořalky, dle chuti.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Meat_01_03");	//Pak vložíš do trouby a po několika minutách je koláč hotový.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Meat_01_04");	//Děkuji.
		AI_Print("Naučeno: Vaření - 'Masový koláč'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro MASOVÝ KOLÁČ: 25x syrové maso, 5x chléb, 2x mléko, 2x sýr a kořalka.");
		Snd_Play("LevelUP");
		Thekla_Cake_02 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 500)
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Meat_01_05");	//Je mi líto, ale zadarmo to dělat nebudu.
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Meat_01_06");	//Přines zlato.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Meat_01_07");	//Je mi líto, ale nemáš dostatek zkušeností.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Mushroom()
{
	AI_Output(other,self,"DIA_Thekla_TeachCookDone_Mushroom_01_00");	//Nauč mě upéct houbový koláč.

	if((Npc_HasItems(hero,ItMi_Gold) >= 750) && (hero.lp >= 3))
	{
		hero.lp = hero.lp - 3;
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Mushroom_01_01");	//Budeš potřebovat pětadvacet otrokových chlebů, pět kusů chleba, tři plátky sýra a láhev vína.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Mushroom_01_02");	//Houby promícháme s chlebem a sýrem a pak přidáš trochu vína.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Mushroom_01_03");	//Potom vložíš do trouby a po několika minutách, je koláč hotový.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Mushroom_01_04");	//Děkuji.
		AI_Print("Naučeno: Vaření - 'Houbový koláč'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro HOUBOVÝ KOLÁČ: 25x otrokův chléb, 5x chléb, 3x sýr a víno.");
		Snd_Play("LevelUP");
		Thekla_Cake_03 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 750)
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Mushroom_01_05");	//Je mi líto, ale zadarmo to dělat nebudu.
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Mushroom_01_06");	//Přines zlato.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Mushroom_01_07");	//Je mi líto, ale nemáš dostatek zkušeností.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Fish()
{
	AI_Output(other,self,"DIA_Thekla_TeachCookDone_Fish_01_00");	//Nauč mě upéct rybí koláč.

	if((Npc_HasItems(hero,ItMi_Gold) >= 1000) && (hero.lp >= 3))
	{
		hero.lp = hero.lp - 3;
		Npc_RemoveInvItems(hero,ItMi_Gold,1000);
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Fish_01_01");	//Budeš potřebovat dvacet ryb, pět krajíců chleba, dvě rostlinky modrého bezu a láhev kořalky.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Fish_01_02");	//Okořeníme ryby drceným modrým bezem, promícháme s chlebem a zalijeme kořalkou.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Fish_01_03");	//Jakmile dáš do trouby, do pár minut je koláč hotový.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Fish_01_04");	//Děkuji.
		AI_Print("Naučeno: Vaření - 'Rybí koláč'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro RYBÍ KOLÁČ: 20x ryba, 5x chléb, 2x modrý bez a kořalka.");
		Snd_Play("LevelUP");
		Thekla_Cake_04 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 1000)
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Fish_01_05");	//Je mi líto, ale zadarmo to dělat nebudu.
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Fish_01_06");	//Přines zlato.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Fish_01_07");	//Je mi líto, ale nemáš dostatek zkušeností.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Honey()
{
	AI_Output(other,self,"DIA_Thekla_TeachCookDone_Honey_01_00");	//Nauč mě jak upéct medový koláč.

	if((Npc_HasItems(hero,ItMi_Gold) >= 1500) && (hero.lp >= 5))
	{
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItMi_Gold,1500);
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Honey_01_01");	//Budeš potřebovat pět nádob medu, pět krajíců chleba, tři plátky sýra, hroznové víno, láhev mléka a vína.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Honey_01_02");	//Smíchej vše dohromady a k ochucení polej vínem.
		AI_Output(self,other,"DIA_Thekla_TeachCookDone_Honey_01_03");	//Pak dej do trouby a po několika minutách je koláč hotový.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Honey_01_04");	//Děkuji.
		AI_Print("Naučeno: Vaření - 'Medový koláč'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro MEDOVÝ KOLÁČ: 5x med, 5x chléb, 3x sýr, mléko, víno a hrozen.");
		Snd_Play("LevelUP");
		Thekla_Cake_05 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 1500)
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Honey_01_05");	//Je mi líto, ale zadarmo to dělat nebudu.
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Honey_01_06");	//Přines zlato.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output(self,other,"DIA_Thekla_TeachCookDone_Honey_01_07");	//Je mi líto, ale nemáš dostatek zkušeností.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

var int Thekla_GaveStew;

instance DIA_Thekla_Hunger(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 3;
	condition = DIA_Thekla_Hunger_Condition;
	information = DIA_Thekla_Hunger_Info;
	permanent = FALSE;
	description = "Mám hlad!";
};


func int DIA_Thekla_Hunger_Condition()
{
	if(Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//Mám hlad!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Nechci krmit tuláky. Krmím jen ty, kteří pracují.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(opovržlivě) A tu žoldáckou chátru, samozřejmě.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Tady, tvůj dlabanec.
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Domobranu neživíme.
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Jak by se dal odmítnout Innosův zmocněnec?
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_06");	//Jak by se dal odmítnout Adanův zmocněnec?
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_07");	//Tady... 
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Nechci krmit tuláky. Krmím jen ty, kteří pracují.
	};
};


instance DIA_Thekla_Arbeit(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 4;
	condition = DIA_Thekla_Arbeit_Condition;
	information = DIA_Thekla_Arbeit_Info;
	permanent = FALSE;
	description = "Hledám práci.";
};


func int DIA_Thekla_Arbeit_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Hledám práci.
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Chceš pracovat tady na farmě?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//O tom může rozhodnout pouze Onar. Farma patří jemu, stejně jako celé údolí.
};


instance DIA_Thekla_WannaJoin(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 5;
	condition = DIA_Thekla_WannaJoin_Condition;
	information = DIA_Thekla_WannaJoin_Info;
	permanent = FALSE;
	description = "Vlastně jsem se chtěl připojit k žoldákům...";
};


func int DIA_Thekla_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//Vlastně jsem se chtěl připojit k žoldákům...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Takže ty jsi další z těch lotrů z trestanecké kolonie?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//To se dalo čekat! Nech mě na pokoji! Takových jako ty už je tady v okolí až dost!
};


instance DIA_Thekla_Schlafen(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 6;
	condition = DIA_Thekla_Schlafen_Condition;
	information = DIA_Thekla_Schlafen_Info;
	permanent = FALSE;
	description = "Potřebuju se někde vyspat.";
};


func int DIA_Thekla_Schlafen_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Potřebuju se někde vyspat.
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Ani nepomysli na to, že by ses mohl vyspat v mojí kuchyni. Najdi si něco ve stodole.
};


instance DIA_Thekla_Problem(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_Problem_Condition;
	information = DIA_Thekla_Problem_Info;
	permanent = FALSE;
	description = "Co máš za problémy se žoldáky?";
};


func int DIA_Thekla_Problem_Condition()
{
	if((Kapitel <= 3) && Npc_KnowsInfo(other,DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Co máš za problémy se žoldáky?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ach, ti pitomci mi vážně lezou na nervy! Obzvlášť Sylvio a jeho tlustej kámoš Bullco.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Ti dva tu sedí celé dny a ztrpčují mi život.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//Ta polívka je moc horká, maso moc tuhý a tak pořád dokola.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//Proč s tím teda něco neuděláš?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//A co jako mám dělat, pane Chytrý? Praštit je válečkem? To si můžu dovolit na rolníky, ale tihle podlí neurvalci mi to prostě vrátí mečem!
	};
};


instance DIA_Thekla_Manieren(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_Manieren_Condition;
	information = DIA_Thekla_Manieren_Info;
	permanent = FALSE;
	description = "Chceš, abych ty dva naučil slušným způsobům?";
};


func int DIA_Thekla_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem) && (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Chceš, abych ty dva naučil slušným způsobům?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Uděláš líp, když to nebudeš zkoušet, drahoušku. Co vím, tak Sylvio má magickou zbroj. Jeho nemůžeš porazit.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//A co Bullco?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Ten chlap je silný jako býk. Co pamatuju, srazil každého, kdo jemu nebo Sylviovi dělal potíže.
};


instance DIA_Thekla_AfterFight(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_AfterFight_Condition;
	information = DIA_Thekla_AfterFight_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thekla_AfterFight_Condition()
{
	if((Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || ((Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Kapitel <= 3)))
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info()
{
	if(Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//Vážně bys měl nechat Bullca na pokoji, drahoušku.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//Musí to být pořádná fuška srazit ho na kolena.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//Dostals docela nakládačku, drahoušku.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//Neříkala jsem ti to snad? Teď víš, co jsem měla na mysli.
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Jsem rád, že se dobře bavíš.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//Tak teď tak neprotahuj obličej. Nejsi první, kdo od toho neřáda dostal napráskáno.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Tady, dej si trochu vývaru, ať se ti vrátí síla.
	B_GiveInvItems(self,other,ItFo_XPStew,1);
	Thekla_GaveStew = TRUE;
};


instance DIA_Thekla_SagittaPaket(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 4;
	condition = DIA_Thekla_SagittaPaket_Condition;
	information = DIA_Thekla_SagittaPaket_Info;
	permanent = TRUE;
	description = "Tady je balík od Sagitty.";
};


func int DIA_Thekla_SagittaPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_TheklasPaket) && (MIS_Thekla_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info()
{
	B_GiveInvItems(other,self,ItMi_TheklasPaket,1);
	Npc_RemoveInvItems(self,ItMi_TheklasPaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Tady je balík od Sagitty.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Díky moc. Tak jsi byl přece jen k něčemu dobrý.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_TheklasPaket);
};


var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;

instance DIA_Thekla_PERM(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 900;
	condition = DIA_Thekla_PERM_Condition;
	information = DIA_Thekla_PERM_Info;
	permanent = TRUE;
	description = "Můžu dostat ještě trochu toho vývaru?";
};


func int DIA_Thekla_PERM_Condition()
{
	if(Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Můžu dostat ještě trochu toho vývaru?

	if(MIS_Thekla_Paket == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//Už nic nemám.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Ani maličkou misku?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Ne.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//A můžu alespoň vylízat hrnec?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Necháš už toho?!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Když tak prahneš po mém vývaru, měl bys pro to něco udělat.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Co?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Zajdi za léčitelkou Sagittou, co žije za Sekobovou farmou, a přines mi od ní balík bylinek.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Když mi přineseš ty bylinky, udělám ti trochu vývaru.
		MIS_Thekla_Paket = LOG_Running;
		Log_CreateTopic(TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_TheklaEintopf,LOG_Running);
		B_LogEntry(TOPIC_TheklaEintopf,"Když Thekle přinesu byliny od léčitelky Sagitty, uvaří mi ještě další vývar. Sagitta přebývá kousek za Sekobovým statkem.");
	}
	else if(MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if(Kapitel <= 2)
		{
			if(Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//Dobrá. Tak budu hodná. Tady. Ať mi neumřeš hlady před očima.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Hej, hej, hej, ne tak rychle! Dám ti vědět, až pro tebe najdu nějakou práci.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//A PAK dostaneš víc vývaru, je to jasný?
			};
		};
		if((Kapitel == 3) || (Kapitel == 4))
		{
			if((Thekla_MehrEintopfKap3 == FALSE) && (MIS_RescueBennet == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//Slyšela jsem, žes pomohl Bennetovi z vězení. Dobrá práce, chlapče.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else if(MIS_RescueBennet != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Ti ničemové z domobrany hodili Benneta do vězení.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Udělej mi laskavost a dostaň ho odtamtud. A já ti mezitím udělám trochu mého báječnýho vývaru.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//Už mi nic nezbylo. Vrať se později.
			};
		};
		if(Kapitel >= 5)
		{
			if(Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Ty jsi pořád hladový, co? A co vlastně pořád děláš?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//Sejmul jsem pár draků.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Ó! Tak to mám dojem, že nadešla chvíle na pořádnej hrnec vývaru.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//Pozdě. Už žádný vývar nezbyl.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//Žádné bylinky, žádný vývar - rozuměls?
	};
};


instance DIA_Thekla_PICKPOCKET(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 900;
	condition = DIA_Thekla_PICKPOCKET_Condition;
	information = DIA_Thekla_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Thekla_PICKPOCKET_Condition()
{
	return C_Beklauen(53,60);
};

func void DIA_Thekla_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
	Info_AddChoice(DIA_Thekla_PICKPOCKET,Dialog_Back,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thekla_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};

func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};

