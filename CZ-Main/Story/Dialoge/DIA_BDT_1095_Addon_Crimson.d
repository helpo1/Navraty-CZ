
instance DIA_Addon_Crimson_EXIT(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 999;
	condition = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Crimson_PICKPOCKET(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 900;
	condition = DIA_Addon_Crimson_PICKPOCKET_Condition;
	information = DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	return C_Beklauen(66,66);
};

func void DIA_Addon_Crimson_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,Dialog_Back,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};

func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};


instance DIA_Addon_Crimson_Hi(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent = FALSE;
	description = "Co to děláš? Tavíš zlato?";
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Co to děláš? Tavíš zlato?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Ne, vařím zeleninu - samozřejmě, že tady tavím zlato a dělám z něj mince.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Jednoho krásného večera prostě přišel Raven a hodil mi formu na odlévání mincí.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//A teď z jednoho zlatého nugetu udělám kopu mincí - má práce je dobrá, nikdo nepozná rozdíl!
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = "Kolik mincí mi dáš za nuget?";
};


func int DIA_Addon_Crimson_How_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Crimson_How_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Kolik mincí mi dáš za nuget?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Nevím to jistě, ale víš co, udělám ti přátelskou cenu, dám ti...
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_02");	//... Pět zlatých - ne více, ne méně.
	AI_Output(other,self,"DIA_Addon_Crimson_How_10_03");	//Jen pět zlatých?!
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_04");	//Slyšel jsi mě dobře, podmínky jsou pro všechny stejné.
};

var int CrimsonMoreGold;

instance DIA_Addon_Crimson_Feilsch(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = "Chci víc zlatých!";
};


func int DIA_Addon_Crimson_Feilsch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Chci víc zlatých!

	if(RhetorikSkillValue[1] >= 40)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_50");	//Hmm...(zavrtí hlavou) Ty víš jak ukecat lidi co?
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_51");	//Dobře dám ti deset zlatých za jeden nuget. Jsi štastný?
		AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_10_52");	//Samozřejmě.
		CrimsonMoreGold = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm... (zamyšleně) NE! To je normální cena, jakou dostane každý.
		AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Myslel jsem, že toto je cena pro přítele.
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//To je, tady jsme všichni přátelé!
	};
};


instance DIA_Addon_Crimson_Gold(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 99;
	condition = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent = TRUE;
	description = "Obchodujme...";
};


func int DIA_Addon_Crimson_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Crimson_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Obchodujme...
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit všechny zlaté nugety)",DIA_Addon_Crimson_Gold_ALLE);

		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 10 zlatých nugetů)",dia_addon_crimson_gold_10);
		};

		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 1 zlatý nuget)",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Ale vždyť nemáš žádné nugety.
	};
};

func void DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems(other,ItMi_Addon_GoldNugget);
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,CurrentNuggets);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));

	if(CrimsonMoreGold == TRUE)
	{
		B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 10);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 8);
	};

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit všechny zlaté nugety)",DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 10 zlatých nugetů)",dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 1 zlatý nuget)",DIA_Addon_Crimson_Gold_1);
	};
};

func void dia_addon_crimson_gold_10()
{
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,10);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));

	if(CrimsonMoreGold == TRUE)
	{
		B_GiveInvItems(self,other,ItMi_Gold,100);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,80);
	};

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit všechny zlaté nugety)",DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 10 zlatých nugetů)",dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 1 zlatý nuget)",DIA_Addon_Crimson_Gold_1);
	};
};

func void DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,1);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));

	if(CrimsonMoreGold == TRUE)
	{
		B_GiveInvItems(self,other,ItMi_Gold,10);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,8);
	};

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit všechny zlaté nugety)",DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 10 zlatých nugetů)",dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,"(vyměnit 1 zlatý nuget)",DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(pekelně) KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = "Co víš o Ravenovi?";
};

func int DIA_Addon_Crimson_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Crimson_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Nebudeš tomu věřit. Byl jsem tam. Viděl jsem co dělal v hrobce!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(se strachem) Mumlal a říkal jakási divná slova. Znovu a znovu...
	B_Say_CrimsonBeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//(hlasitě) A potom jsem uviděl oslepující světlo a slyšel ten strašný výkřik!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//Můj bože, ten zvuk. Bylo to, jako by se hroutil svět!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Raven s tím mluvil, hovořili spolu - Raven a TEN zvuk!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Nevzpomínám si, o čem spolu mluvili - vzpomínám si pouze, že jsem se nemohl ještě dlouho pohnout.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = "Můžeš mi zopakovat Ravenova slova ještě jednou?";
};


func int DIA_Addon_Crimson_FATAGN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Raven) && (Crimson_SayBeliar < 4))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = Crimson_SayBeliar + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//Můžeš mi zopakovat Ravenova slova ještě jednou?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Jistě, můžu.
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"Tak povídej.",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Myslím, že bude lepší, když už toho necháme...
	};
};

func void DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play("Mystery_09");
	B_Say_CrimsonBeliar();

	if(Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		//Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};

	Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
};


instance DIA_CRIMSON_ARMORCANTEACH(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = dia_crimson_armorcanteach_condition;
	information = dia_crimson_armorcanteach_info;
	permanent = TRUE;
	description = "Můžeš mi vykovat zbroj?";
};

func int dia_crimson_armorcanteach_condition()
{
	if((CRIMSON_TEACHARMOR == FALSE) && (SCATTY_CANTRADEARMOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_crimson_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_00");	//Můžeš mi vykovat zbroj?
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_01");	//Můžu, ale co ty s tím, když ti ji nevykovám?
	AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_02");	//No, myslel jsem, jestli mě to můžeš naučit.
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_03");	//A proč bych tě to měl učit, proč sis MYSLEL, že bych tě to měl učit?
	AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_06");	//Za tvé lekce bych zaplatil.
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_07");	//Proč jsi to neřekl hned?!
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_08");	//Starej hodnej Crimson ti přece vždy ukáže pár triků.
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_09");	//Ale pro začátek se trochu musíš naučit kovat.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_10");	//Kovat už celkem umím.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_11");	//No, celkem jo. Aspoň to bude jednodušší.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_12");	//Naučím tě co umím, ale musíš si zaplatit, nejsem charita!
		AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_14");	//Jasně. Chápu to.
	}
	else
	{
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_15");	//Ale ty nemáš páru o co tu jde!
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_16");	//První najdi někoho, kdo tě naučí nejaké základy o kovařine a pak přijď.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_17");	//A budeš muset zaplatit, nejsem charita!
		AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_18");	//Jasně.
	};
	CRIMSON_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Crimson mě může naučit, jak vylepšit zbroje stráží.");
};

func void b_crimson_teacharmor_1()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_01");	//Dobře. Vezmi nezbytné materiály...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_02");	//... Na kovadlině si roztavíš ocel...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_03");	//... Pak jí dáš tvar, který požaduješ...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_04");	//... Asi takhle... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_05");	//... To je vše!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_06");	//Teď už víš jak na to.
	};
};

func void b_crimson_teacharmor_2()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_01");	//Výborně, pamatuj si co ti teď budu ukazovat. Za prvé je nutné mít veškeré materiály pro kování.
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_02");	//... Vezmeš rozžhavenou ocel a ohneš ji asi takhle...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_03");	//... Tak se správně prolne s dalšími materiály...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_04");	//... A pak dostaneš něco takového... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_05");	//... Hotovo!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_06");	//Není to ale zase tak jednoduché, věř mi.
	};
};

func void b_crimson_teacharmor_3()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_01");	//Dívej se a pamatuj si všechno co ti teď ukážu... ve skutečnosti na tom nic není.
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_02");	//... Připrav si ocel...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_03");	//... Stejnorodou směs pak smícháš s ostatními částmi...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_04");	//... Tak dosáhneš lepší výdrže a pevnosti... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_05");	//... A máš hotovo!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_06");	//Je to jednoduché, jdi si to zkusit.
	};
};

func void b_crimson_teacharmor_4()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_01");	//Takže začínáme. Ujisti se, že máš všechny materiály po ruce...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_02");	//... Na kovadlině ocel zformuj do menšího kousku...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_03");	//... Jakmile do sebe zapadne...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_04");	//... Můžeš ji opatrně přikovat ke zbroji... podívej... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_05");	//... Hotovo!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_06");	//To je všechno, co bys měl vědět.
	};
};

func void b_crimson_teacharmor_5()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_01");	//No tak můžeme začít. K vytvoření této zbroje budeš potřebovat hodně času a usilí - ale veř mi, ta zbroj za to stojí!
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_02");	//... Vem ocel, roztav ji a pokus se ji rozdělit na zhruba stejné kousky...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_03");	//... Každý kousek opracuj a spoj se spojem, který si vytvoříš na zbroji...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_04");	//... Tímto způsobem na ni lépe připevníš kovové pláty... Asi nějak takhle... (ukazuje)
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_05");	//... Teď je tvá zbroj odolnejší vůči střelám, ale stále je může rozrazit šipka, takže musíš udělat dvojitou výstuž...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_06");	//... A máš to, jen cvič a budeš vše chápat...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_07");	//Jdi si to zkusit.
	};
};

func void b_crimsonarmorchoices()
{
	Info_ClearChoices(dia_crimson_armorteach);
	Info_AddChoice(dia_crimson_armorteach,Dialog_Back,dia_crimson_armorteach_back);
	if((PLAYER_TALENT_SMITH[25] == FALSE) && (Npc_HasItems(other,itar_grd_l) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach,"Lehká zbroj stráže (cena: 750 zlatých)",dia_crimson_armorteach_itar_grd_l_v1);
	};
	if((PLAYER_TALENT_SMITH[26] == FALSE) && (Npc_HasItems(other,ITAR_Bloodwyn_Addon) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach,"Zbroj stráže (cena: 1000 zlatých)",dia_crimson_armorteach_itar_bloodwyn_addon_v1);
	};
	if((PLAYER_TALENT_SMITH[27] == FALSE) && (Npc_HasItems(other,ITAR_Thorus_Addon) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach,"Těžká zbroj stráže (cena: 1500 zlatých)",dia_crimson_armorteach_itar_thorus_addon_v1);
	};
};


instance DIA_CRIMSON_ARMORTEACH(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = dia_crimson_armorteach_condition;
	information = dia_crimson_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};


func int dia_crimson_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (CRIMSON_TEACHARMOR == TRUE) && (SCATTY_CANTRADEARMOR == TRUE))
	{
		if((PLAYER_TALENT_SMITH[23] == FALSE) || (PLAYER_TALENT_SMITH[24] == FALSE) || (PLAYER_TALENT_SMITH[25] == FALSE) || (PLAYER_TALENT_SMITH[26] == FALSE) || (PLAYER_TALENT_SMITH[27] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_crimson_armorteach_info()
{
	AI_Output(other,self,"DIA_Crimson_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.
	AI_Output(self,other,"DIA_Crimson_ArmorTeach_01_01");	//Co chceš vědět?
	b_crimsonarmorchoices();
};

func void dia_crimson_armorteach_back()
{
	Info_ClearChoices(dia_crimson_armorteach);
};

func void dia_crimson_armorteach_itar_grd_l_v1()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 750)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_GRD_L_V1))
		{
			Npc_RemoveInvItems(other,ItMi_Gold,750);
			b_crimson_teacharmor_3();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Crimson_TeachArmor_03_00");	//Myslíš, že tě to budu učit zadarmo? Přines zlato, pak si promluvíme.
	};
	b_crimsonarmorchoices();
};

func void dia_crimson_armorteach_itar_bloodwyn_addon_v1()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_BLOODWYN_ADDON_V1))
		{
			Npc_RemoveInvItems(other,ItMi_Gold,1000);
			b_crimson_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Crimson_TeachArmor_04_00");	//Myslíš, že tě to budu učit zadarmo? Přines zlato, pak si promluvíme.
	};
	b_crimsonarmorchoices();
};

func void dia_crimson_armorteach_itar_thorus_addon_v1()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_THORUS_ADDON_V1))
		{
			Npc_RemoveInvItems(other,ItMi_Gold,1500);
			b_crimson_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Crimson_TeachArmor_05_00");	//Myslíš, že tě to budu učit zadarmo? Přines zlato, pak si promluvíme.
	};
	b_crimsonarmorchoices();
};


instance DIA_Addon_Crimson_GoldStuck(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_GoldStuck_Condition;
	information = DIA_Addon_Crimson_GoldStuck_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit jak se taví zlato?";
};


func int DIA_Addon_Crimson_GoldStuck_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Crimson_Hi) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_GoldStuck_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_GoldStuck_01_00");	//Můžeš mě naučit jak se taví zlato?
	AI_Output(self,other,"DIA_Addon_Crimson_GoldStuck_01_01");	//Můžu, ale ne zadarmo.
	AI_Output(self,other,"DIA_Addon_Crimson_GoldStuck_01_02");	//Tento proces není nijak těžký, ale trocha praxe neuškodí.
	B_LogEntry(TOPIC_STEELDRAW,"Crimson mě může naučit, jak tavit zlato.");
};

instance DIA_Addon_Crimson_DoGoldStuck(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = DIA_Addon_Crimson_DoGoldStuck_condition;
	information = DIA_Addon_Crimson_DoGoldStuck_info;
	permanent = TRUE;
	description = "Nauč mě tavit zlato. (VB: 5, cena: 1500 zlatých)";
};

func int DIA_Addon_Crimson_DoGoldStuck_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Addon_Crimson_GoldStuck) == TRUE) && (KNOWHOWTOOREFUSGOLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_DoGoldStuck_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Addon_Crimson_DoGoldStuck_01_00");	//Nauč mě roztavit zlato.
	kosten = 5;
	money = 1500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_03_90");	//Vždyť nemáš ani zlato. Přijď až ho budeš mít!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_01");	//Potřebovat budeš samozřejmě zlaté nugety.
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_02");	//Chcete-li získat jeden ingot, potřebujete asi čtvrtinu stovky zlatých nugetů.
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_03");	//Zlato se vloží do pece, přivede na správnou teplotu.
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_04");	//Nakonec jen sléváš do formy přes síto
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Tavení zlata");
		KNOWHOWTOOREFUSGOLD = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_STEELDRAW,"K přetavení zlatých nugetů na ingot potřebuji výheň a pětadvacet zlatých nugetů.");
	};
};