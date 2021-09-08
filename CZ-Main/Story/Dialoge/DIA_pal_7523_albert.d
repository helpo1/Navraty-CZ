
instance DIA_PAL_7523_EXIT(C_Info)
{
	npc = pal_7523_albert;
	nr = 999;
	condition = dia_pal_7523_exit_condition;
	information = dia_pal_7523_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7523_exit_condition()
{
	return TRUE;
};

func void dia_pal_7523_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7523_GREET(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet_condition;
	information = dia_pal_7523_greet_info;
	important = TRUE;
};


func int dia_pal_7523_greet_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet_info()
{
	AI_Output(self,other,"DIA_PAL_7523_Greet_01_00");	//Kdo jsi?... A jak jsi to tu našel?!
	AI_Output(other,self,"DIA_PAL_7523_Greet_01_01");	//Jsem ze hradu, dělám průzkum.
	AI_Output(self,other,"DIA_PAL_7523_Greet_01_02");	//Byl jsi na hradě? Jak jsou na tom?!

	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet_01_03");	//Skřeti útočí na hrad!
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_04");	//U Innose!... Jak se to mohlo stát?!
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_05");	//Jsou to hrozné zprávy, ale... Děkuji ti za ně.
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_06");	//Už asi nemá cenu jít Garondovi na pomoc... musíme se probít sami.
	}
	else
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet_01_07");	//Nic dobrého! Skřeti obléhají hrad.
		AI_Output(other,self,"DIA_PAL_7523_Greet_01_08");	//A každý týden přicházejí další...
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_09");	//To je špatné!... Nemůžeme se dostat k hradu, abychom bojovali společně.
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_11");	//Nemohl bys nám alespoň trochu pomoci?
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_13");	//Někdo musí na hrad přinést zprávu kde jsme a kolik nás je...
		AI_Output(other,self,"DIA_PAL_7523_Greet_Ok_01_01");	//Dobrá, řeknu Garondovi o vás.
		AI_Output(self,other,"DIA_PAL_7523_Greet_Ok_01_02");	//Innos ti žehnej!
	};

	AlbertGroup = TRUE;

	if(MIS_LostPaladins == LOG_Running)
	{
		B_LogEntry(TOPIC_LostPaladins,"Za skřetí palisádou jsem našel skupinku paladinů.");
	};
};

instance DIA_PAL_7523_GREET2(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet2_condition;
	information = dia_pal_7523_greet2_info;
	permanent = FALSE;
	description = "Není paladin Tandor z tvé skupiny?!";
};

func int dia_pal_7523_greet2_condition()
{
	if((AlbertGroup == TRUE) && Npc_KnowsInfo(other,DIA_Tandor_Trupp) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet2_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Greet2_01_00");	//Není paladin Tandor z tvé skupiny?!
	AI_Output(self,other,"DIA_PAL_7523_Greet2_01_01");	//Ano, on byl s námi, když jsme narazili na předvoj skřetů.
	AI_Output(self,other,"DIA_PAL_7523_Greet2_01_02");	//Bohužel po boji byl nezvěstný. Víš o něm něco?

	if(Npc_IsDead(tandor))
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet2_01_03");	//Podařilo se mu dostat na hrad, ale během jedné potyčky se skřety padl.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_04");	//Je to smutné, i přesto že jsme věřily že už je delší dobu mrtvý.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_05");	//Innos ho odmění! Zaslouží si to...
	}
	else
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet2_01_06");	//Mám dobré zprávy, podařilo se mu dostat do hradu - je živý a zdravý.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_07");	//U Innose!... To jsou velmi radostné zprávy!
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_08");	//Řekni mu prosím, že jeho bratři ve zbrani jsou také v pořádku!
		SAYTOTANDORABOUTGROUP = TRUE;
	};
};

instance DIA_PAL_7523_GREET3(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet3_condition;
	information = dia_pal_7523_greet3_info;
	permanent = FALSE;
	description = "Doručil jsem Garondovi zprávu.";
};

func int dia_pal_7523_greet3_condition()
{
	if((MIS_FINDEDOCGROUP == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet3_info()
{
	var C_Npc ritter1;
	var C_Npc ritter2;
	AI_Output(other,self,"DIA_PAL_7523_Greet3_01_00");	//Doručil jsem Garondovi zprávu.
	AI_Output(self,other,"DIA_PAL_7523_Greet3_01_01");	//A co říkal?!
	AI_Output(other,self,"DIA_PAL_7523_Greet3_01_02");	//Abyste tu vyčkávali než přijde lord Hagen.
	AI_Output(other,self,"DIA_PAL_7523_Greet3_01_03");	//Pak máte skřetům vpadnout do zad.
	AI_Output(self,other,"DIA_PAL_7523_Greet3_01_04");	//Potom budeme čekat...
	MIS_FINDEDOCGROUP = LOG_Success;
	Log_SetTopicStatus(TOPIC_FINDEDOCGROUP,LOG_Success);
	B_LogEntry_Quiet(TOPIC_FINDEDOCGROUP,"Předal jsem rozkaz od Garonda Albertovi.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"Prepare");
	ritter1 = Hlp_GetNpc(pal_7520_ritter);
	ritter2 = Hlp_GetNpc(pal_7521_ritter);

	if(Hlp_IsValidNpc(ritter1) && !Npc_IsDead(ritter1))
	{
		B_StartOtherRoutine(ritter1,"Prepare");
	};
	if(Hlp_IsValidNpc(ritter2) && !Npc_IsDead(ritter2))
	{
		B_StartOtherRoutine(ritter2,"Prepare");
	};
};


instance DIA_PAL_7523_FORESTBASE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_forestbase_condition;
	information = dia_pal_7523_forestbase_info;
	permanent = FALSE;
	description = "Jak je to s osadou nad táborem?";
};

func int dia_pal_7523_forestbase_condition()
{
	if((HEROKNOWFORESTBASE == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_forestbase_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Forestbase_01_00");	//Jak je to s osadou nad táborem?
	AI_Output(self,other,"DIA_PAL_7523_Forestbase_01_01");	//Všichni jsou to zločinci z kolonie (arogantně)
	AI_Output(self,other,"DIA_PAL_7523_Forestbase_01_02");	//Udržujeme s nimi kontakt, obchodujeme, a dokonce nám i poskytují informace...
	AI_Output(self,other,"DIA_PAL_7523_Forestbase_01_03");	//Jestli nás skřeti najdou, budou ti trestanci vítanou posilou...
};


instance DIA_PAL_7523_PERM(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_perm_condition;
	information = dia_pal_7523_perm_info;
	permanent = TRUE;
	description = "Jak se věci mají?";
};


func int dia_pal_7523_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet))
	{
		return TRUE;
	};
};

func void dia_pal_7523_perm_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Perm_01_00");	//Jak se věci mají?
	if(KAPITELORCATC == TRUE)
	{
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_01");	//Myslím, že sám to dobře vidíš...
		AI_StopProcessInfos(self);
	};
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet3))
	{
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_02");	//Nedá se říct, že špatně...
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_03");	//Můžeme jen čekat na okamžik, kdy lord Hagen dorazí s posilama.
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_04");	//A pak vpadneme skřetům do zad a budem doufat, že to dobře dopadne.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_05");	//Zatím je tu klid, ale zdání může klamat.
	};
};


instance DIA_PAL_7523_DRAKAR(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_drakar_condition;
	information = dia_pal_7523_drakar_info;
	permanent = FALSE;
	description = "Mohu nějak pomoct?";
};


func int dia_pal_7523_drakar_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet3) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_drakar_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_00");	//Mohu nějak pomoct?
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_05");	//Ach... s každým dnem je tady čím dál tím víc těch chlupatejch, zelenejch potvor.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_06");	//Byl jsi u moře, viděl jsi válečnou loď skřetů?
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_07");	//Ano ta loď přiváží stále další skřety.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_08");	//Pokud to takle půjde dál, tak brzy převezmou kontrolu nad údolím.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_09");	//Pak nám už nedokáže pomoci ani lord Hagen se svými lidmi.
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_10");	//Co navrhuješ?
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_11");	//Jestli se nám podaří nějakým způsobem sabotovat loď, způsobíme skřetům vážnou ztrátu.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_12");	//Aspoň nějaký čas zůstanou bez podpory a to je dost dobrý.
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_13");	//A jak to mám udělat, mam jim provrtat díru do trupu.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_15");	//(smích) Ne, ale možná bude stačit poškodit některá zařízení v řídící části lodě.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_16");	//Jsem si jistý, že se ti podaří najít slabé místo.
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_18");	//Podívám se co se dá dělat.
	MIS_DRAKARBROKE = LOG_Running;
	Log_CreateTopic(TOPIC_DRAKARBROKE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRAKARBROKE,LOG_Running);
	B_LogEntry(TOPIC_DRAKARBROKE,"Albert po mě chce, aby se pokusili sabotovat válečnou loď skřetů, která zakotvila na pobřeží. To by skřetům zabránilo v přísunu nových jednotek. Albert sám přesně neví, jak to udělat, ale věří, že je to možné.");
};


instance DIA_PAL_7523_DRAKARDONE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_drakardone_condition;
	information = dia_pal_7523_drakardone_info;
	permanent = FALSE;
	description = "Ohledně té skřetí lodi...";
};


func int dia_pal_7523_drakardone_condition()
{
	if((MIS_DRAKARBROKE == LOG_Running) && (DRAKARISBROKEN == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_drakardone_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_PAL_7523_DrakarDone_01_00");	//Ohledně té skřetí lodi...
	AI_Output(other,self,"DIA_PAL_7523_DrakarDone_01_02");	//Věřím, že ta loď už nikam neodpluje.
	AI_Output(self,other,"DIA_PAL_7523_DrakarDone_01_04");	//To myslíš vážně? (obdivně) To je velmi dobrá zpráva!
	AI_Output(self,other,"DIA_PAL_7523_DrakarDone_01_05");	//Přísun skřetů se sníží a to určitě oslabí jejich pozici.
	AI_Output(self,other,"DIA_PAL_7523_DrakarDone_01_06");	//Musíme jen počkat na lorda Hagen s posilami. A pak je můžem nadobro poslat za Beliarem.
	MIS_DRAKARBROKE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DRAKARBROKE,LOG_SUCCESS);
	B_LogEntry(TOPIC_DRAKARBROKE,"Albert byl rád, když slyšel, že válečná loď skřetů je poškozená a neschopná plavby.");
};


instance DIA_PAL_7523_ORCORDER(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorder_condition;
	information = dia_pal_7523_orcorder_info;
	permanent = FALSE;
	description = "Něco tu pro tebe mám.";
};

func int dia_pal_7523_orcorder_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_drakar) && (KNOWSTARANBUILD == FALSE) && (FLAG_ORCS_DRAKAR == TRUE) && (Npc_IsDead(NONE_110_Urshak) == FALSE) && (Npc_HasItems(hero,itwr_orcsorder) >= 1) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorder_info()
{
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_00");	//Něco tu pro tebe mám.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_01");	//Zde je zajímavý dopis s rozkazy- Našel jsem ho u jejich vůdce na palubě Drakaru.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_02");	//Hmm... (se zájmem) já se podívám.
	B_GiveInvItems(other,self,itwr_orcsorder,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_04");	//No, no... Zdá se, že je to psané ve skřetím jazyce. Už dřív jsem se setkal s takovíma písemnostma.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_05");	//(sarkasticky) A já myslel, že je to jen trochu nečitelné.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_06");	//(nepřerušuj) Skřeti je dávají na významé vojenské dokumenty.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_08");	//Tak, to je vojenský dokument! A pravděpodobně obsahuje informace o skřetích plánech.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_10");	//Dobře, dej mi ten dopis, já něco vymyslím.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_11");	//Chystáš se zajmout skřeta a zeptat se ho? (směje se)
	B_GiveInvItems(self,other,itwr_orcsorder,1);
	MIS_ORCORDER = LOG_Running;
	Log_CreateTopic(TOPIC_ORCORDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCORDER,LOG_Running);
	B_LogEntry(TOPIC_ORCORDER,"Ukázal jsem Albertovi dopis, který jsem získal od vůdce skřetů na palubě Drakar. Podle něj jsou údaje v tom dopise pro skřety velmi důležité, protože dopis obsahuje jejich vojenskou značku. Nyní je třeba zjistit - o čem se v dopise píše. Musíme najít někoho, kdo mi pomůže přeložit ten dopis.");
};


instance DIA_PAL_7523_ORCORDERPROGRESS(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorderprogress_condition;
	information = dia_pal_7523_orcorderprogress_info;
	permanent = FALSE;
	description = "Zjistil jsem co znamená te skřetí dokument.";
};


func int dia_pal_7523_orcorderprogress_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (KNOWSTARANBUILD == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorderprogress_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_00");	//Zjistil jsem co znamená te skřetí dokument.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_01");	//Skřeti neopustí údolí dokud nedobudou pevnost.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_02");	//To je mě novina, na to by přišel i goblin.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_03");	//A co je důležité. Pro tento účel poslali skupinku dělníků, aby postavili nová eranidla a katapulty.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_04");	//Až budou mít hotovo, zaůtočí na hrad.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_05");	//Proklatě! Jestli se dostanou přes bránu, tak Garond jejich útok nezadrží!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_06");	//To nemůžem připusti, kde se nyní nachází ten pracovní oddíl?
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_07");	//Zřejmě se přemísťují na pozice skřetů.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_08");	//Pak je musíme zastavit za každou cenu, hrad nesmí padnout!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_10");	//Dám ti některé ze svých nejlepších lidí!... A teď můžeš vyrazit!
	B_LogEntry(TOPIC_ORCORDER,"Řekl jsem Albertovi o obsahu skřetího dokumentu. Řekl mi, že musím pracovní oddíl zastavit a dal mi několik svých nejlepších lidí.");
	Wld_InsertNpc(orcslave_01,"FP_ROAM_ORCSLAVETEAM_01");
	Wld_InsertNpc(orcslave_02,"FP_ROAM_ORCSLAVETEAM_02");
	Wld_InsertNpc(orcslave_03,"FP_ROAM_ORCSLAVETEAM_03");
	Wld_InsertNpc(orcslave_04,"FP_ROAM_ORCSLAVETEAM_04");
	Wld_InsertNpc(orcslave_05,"FP_ROAM_ORCSLAVETEAM_05");
	Wld_InsertNpc(orcslave_06,"FP_ROAM_ORCSLAVETEAM_06");
	Wld_InsertNpc(orcslave_07,"FP_ROAM_ORCSLAVETEAM_07");
	Wld_InsertNpc(orcslave_08,"FP_ROAM_ORCSLAVETEAM_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_01");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ORCSLAVEGUARD_03");
	GOTOKILLORCSLAVES = TRUE;
};

instance DIA_PAL_7523_ORCORDERDONE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorderdone_condition;
	information = dia_pal_7523_orcorderdone_info;
	permanent = FALSE;
	description = "Se skřetím oddílem je konec!";
};

func int dia_pal_7523_orcorderdone_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (GOTOKILLORCSLAVESDONE == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorderdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderDone_01_00");	//Se skřetím oddílem je konec!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_01");	//Super!... Nejlepší zprávy, jaké jsi mi mohl přinést!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_02");	//Nyní se paladinové v pevnosti nemusí bát útoku! 
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_03");	//Nyní se skřeti můžou zkusit přes kamennou zeď prokousat.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_05");	//Co se týče tebe - myslím, že si zaslouží štědrou odměnu za svoji práci.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_06");	//Bohužel nemám dostatek zlata, které bych ti mohl dát...
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_07");	//Ale myslím, že ti můžu nabídnout něco jiného.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_09");	//Tady! (pyšně) Vezmi si tenhle drahocenný prsten!
	CreateInvItems(self,itri_innosjudge,1);
	B_GiveInvItems(self,other,itri_innosjudge,1);
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_10");	//Dal mi ho sám král Rhobar za mé činy ve válce!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_11");	//Obvykle se takovédle věci udělují pouze nejodvážnějším válečníkům Innose!
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_12");	//I když nejsi paladin, tak si ho po právu zasloužíš. Nos ho s hrdostí.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_13");	//Po právu si zasloužíš takovoupoctu! Nos ho s hrdostí.
	};
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderDone_01_14");	//Děkuji.
	MIS_ORCORDER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORCORDER,LOG_SUCCESS);
	B_LogEntry(TOPIC_ORCORDER,"Řekl jsem Albertovi, že skřetí oddíl je zničen. Dal mi prsten Chrabrost Innose, který mohou nosit jen ti nejstatečnější paladinové.");
	if(!Npc_IsDead(pal_7518_ritter))
	{
		Npc_ExchangeRoutine(pal_7518_ritter,"Start");
		AI_Teleport(pal_7518_ritter,"WP_COAST_CAMP_01_ORCTEAM");
	};
	if(!Npc_IsDead(pal_7519_ritter))
	{
		Npc_ExchangeRoutine(pal_7519_ritter,"Start");
		AI_Teleport(pal_7519_ritter,"WP_COAST_CAMP_02_ORCTEAM");
	};
};


instance DIA_PAL_7523_LEADER(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_leader_condition;
	information = dia_pal_7523_leader_info;
	permanent = FALSE;
	description = "Kdo vám nyní velí?";
};


func int dia_pal_7523_leader_condition()
{
	if((KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE) && (COMMANDPALOW == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_leader_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Leader_01_00");	//Kdo vám nyní velí?
	AI_Output(self,other,"DIA_PAL_7523_Leader_01_01");	//Naši skupinu má nyní na povel Nathan, protože je služebně nejstarší a nejzkušenější.
	AI_Output(other,self,"DIA_PAL_7523_Leader_01_03");	//Jasně.
	COMMANDPALOW = TRUE;
};


instance DIA_PAL_7523_HOWHERE(C_Info)
{
	npc = pal_7523_albert;
	nr = 1;
	condition = dia_pal_7523_howhere_condition;
	information = dia_pal_7523_howhere_info;
	permanent = FALSE;
	description = "Jak jste se sem dostali?";
};


func int dia_pal_7523_howhere_condition()
{
	if((KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_howhere_info()
{
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_00");	//Jak jste se sem dostali?
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_01");	//Byl to Garondův rozkaz. Potřeboval někoho, kdo pošle zprávu o blížícím se skřetím útoku.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_02");	//Měli jsme co nejrychleji přijít a napadnout skřety zezadu.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_03");	//A jak to dopadlo?
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_04");	//Věř mi - plán byl dobrý... (naštvaně) Ale, bohužel, naše pomoc dorazila příliš pozdě!
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_06");	//Na cestě do obléhané pevnosti, naše oddíl přepadli skřeti.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_07");	//Nebylo jich moc, ale drahocenej čas byl ztracen!
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_08");	//Když jsme přišli k pevnosti, tak nad ní už vlála skřetí standarta.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_09");	//Utábořili jsme se zde a měli jsme v plánu počkat, jestli někdo nepřežil. Nikdo se neukázal.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_10");	//Proč zrovna tady?
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_11");	//Cesta nahoru se dá dobře bránit a jestli nejsi skřet, tak je to jediná cesta z údolí.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_12");	//Zatím se, ale nic nestalo.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_13");	//Pochopitelně.
};

