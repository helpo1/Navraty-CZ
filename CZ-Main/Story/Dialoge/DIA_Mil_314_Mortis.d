
instance DIA_Mortis_EXIT(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 999;
	condition = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mortis_Hallo(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Hallo_Condition;
	information = DIA_Mortis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Mortis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Co chceš? Peck tady není. Takže nic nedostaneš. Přijď později.
};


instance DIA_Mortis_Waffe(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Waffe_Condition;
	information = DIA_Mortis_Waffe_Info;
	permanent = FALSE;
	description = "Kde je Peck?";
};


func int DIA_Mortis_Waffe_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//Kde je Peck?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//Jsi u nás nový, co? V tom případě vítej mezi námi.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Peck už je ve městě vážně dost dlouho. Vsadím se, že se zase motá kolem té slaďoučké Vanji u Červené lucerny.
};


instance DIA_Mortis_Paket(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Paket_Condition;
	information = DIA_Mortis_Paket_Info;
	permanent = FALSE;
	description = "Co víš o tom balíku trávy z bažin?";
};


func int DIA_Mortis_Paket_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Paket_Info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Co víš o tom balíku trávy z bažin?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Hm... když jsem byl posledně v přístavní krčmě, slyšel jsem, jak se o něm baví Kardif s nějakým dalším chlapíkem.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Kdo byl ten druhej chlápek?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Nemám tušení. Ale říkal, že pro své rostlinky našel nejlepší možné místo - pak se oba začali chlámat jako opilí skřeti.
	B_LogEntry(TOPIC_Warehouse,"Mortis zaslechl, jak se hospodský Kardif v přístavní krčmě domlouvá s nějakým dalším mužem o balíku trávy. Dohadovali se o tom, kde ji uskladnit.");
};


instance DIA_Mortis_Redlight(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Redlight_Condition;
	information = DIA_Mortis_Redlight_Info;
	permanent = FALSE;
	description = "Co víš o přístavní čtvrti?";
};


func int DIA_Mortis_Redlight_Condition()
{
	if(MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Co víš o přístavní čtvrti? Rád bych našel toho, kdo tu prodává trávu z bažin.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Nooo, ti chlápci odtamtud toho moc nenamluví, a rozhodně neřeknou nic někomu, kdo je od městské stráže.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Jestli chceš tam dole něco zjistit, měl bys - ne, MUSÍŠ - si sundat zbroj.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//Dobrá, a potom?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Nejlepší asi bude zajít do krčmy a bordelu. Jestli se někde něco dozvíš, tak právě tam.
	B_LogEntry(TOPIC_Redlight,"Mortis se domnívá, že když si budu chtít v přístavu koupit trávu, radši bych na sobě neměl mít žádnou zbroj. Nejspíš bych to měl zkusit v krčmě nebo v nevěstinci.");
};


instance DIA_Mortis_CanTeach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = DIA_Mortis_CanTeach_Condition;
	information = DIA_Mortis_CanTeach_Info;
	permanent = TRUE;
	description = "Chci se stát silnějším.";
};


func int DIA_Mortis_CanTeach_Condition()
{
	if(Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Chci se stát silnějším.

	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Jasně. Jestli jsi dost zkušený, můžu ti pomoci s tréninkem.
		Mortis_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Mortis, příslušník městské gardy, mi může pomoci zvýšit sílu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Jasně, že bys chtěl. Ale protože nejsi ani jeden z nás, ani paladin, tak z toho nic nebude.
	};
};

instance DIA_Mortis_Trade(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 80;
	condition = DIA_Mortis_Trade_Condition;
	information = DIA_Mortis_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi můžeš nabídnout?";
};

func int DIA_Mortis_Trade_Condition()
{
	if(Wld_IsTime(7,0,23,59) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi můžeš nabídnout?

	if((MilBelt_01 == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_MIL)))
	{
		CreateInvItems(self,ItBE_Addon_MIL_01,1);
		MilBelt_01 = TRUE;
	};
	if((MilBelt_02 == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_MIL)))
	{
		CreateInvItems(self,ItBE_Addon_MIL_02,1);
		MilBelt_02 = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
};

instance DIA_Mortis_Teach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 100;
	condition = DIA_Mortis_Teach_Condition;
	information = DIA_Mortis_Teach_Info;
	permanent = TRUE;
	description = "Chci se stát silnějším.";
};

func int DIA_Mortis_Teach_Condition()
{
	if(Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Chci se stát silnějším.
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//Už jsi dost silný. Jestli bys chtěl trénovat dál, musíš se poohlédnout po někom jiném.
	};
	Info_ClearChoices(DIA_Mortis_Teach);
};

func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};


instance DIA_Mortis_PICKPOCKET(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 900;
	condition = DIA_Mortis_PICKPOCKET_Condition;
	information = DIA_Mortis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mortis_PICKPOCKET_Condition()
{
	return C_Beklauen(38,60);
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,Dialog_Back,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};


instance DIA_MORTIS_ARMORCANTEACH(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = dia_mortis_armorcanteach_condition;
	information = dia_mortis_armorcanteach_info;
	permanent = TRUE;
	description = "Co takhle nějaká lepší zbroj?";
};

func int dia_mortis_armorcanteach_condition()
{
	if((MORTIS_TEACHARMOR == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_mortis_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_00");	//Co takhle nějaká lepší zbroj?
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_01");	//Jaká zbroj?
	AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_02");	//Jsi kovář, takže určitě něco o kování zbrojí víš, nebo ne?
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_03");	//A co s tím?
	AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_04");	//No, myslel jsem, že bys mi mohl prodat nebo vyrobit lepší zbroj, než je tahle.
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_05");	//Hmm... (směje se) Ano, vyrábím zbroje pro domobranu. Ale i když jsi jeden z nás - nemůžu ti nic prodat.
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_06");	//Lord Andre by mi utrhl hlavu, kdyby se o tom dověděl! Ne, chlape, na to zapomeň!
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_07");	//Ale... Pokud myslíš, že je to tak nezbytné, mohu ti ukázat, jak svou zbroj vylepšit.
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_08");	//Měl bys už ale rozumět alespoň základům kovářství.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_09");	//Jo, o kování už něco vím.
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_10");	//No, to vidím... (směje se) Dobrá! Ale pamatuj, moje lekce nebudou zadarmo, takže jestli nemáš dost zlata, ani neotravuj!
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_11");	//Až budeš připraven, dej vědět a začneme s výukou, jasné?
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_12");	//Vždyť ty ani nemáš páru, jak vypadá kovářské kladivo!
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_13");	//Jdi a nauč se kovat - pak můžeme mluvit o vylepšení tvé zbroje.
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_14");	//A pamatuj, moje lekce nebudou zadarmo, takže jestli nemáš dost zlata, ani neotravuj!
	};
	MORTIS_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Mortis mě může naučit, jak vylepšit zbroje domobrany.");
};

func void b_mortis_teacharmor_1()
{
	AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_01");	//Tak se pozorně dívej, jak se to dělá. Vezmeš si potřebné materiály...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_KASERN_ARMORY_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_02");	//... na kovadlině je ve správném pořadí připevníš na připravenou žhavou ocel...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_03");	//... poté všechno vytvaruješ, jak je třeba, a připevníš ke své zbroji...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_04");	//... mělo by to vypadat asi nějak takhle... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_05");	//... a to je vše!
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_06");	//Teď si to můžeš vyzkoušet sám.
	};
};

func void b_mortis_teacharmor_2()
{
	AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_01");	//Skvěle, dobře si pamatuj, co ti teď ukážu. Nejprve u sebe musíš mít všechen potřebný materiál...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_KASERN_ARMORY_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_02");	//... vezmeš jeden rozžhavený ocelový prut a rozdělíš ho na několik částí...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_03");	//... v tomhle pořadí hezky spojíš všechny materiály...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_04");	//... pak je přikováš na kostru své zbroje, přičemž obzvláštní péči věnuješ místu spojení. Takhle, jak vidíš... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_05");	//... a je hotovo!
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_06");	//Nic těžkého, věř mi. Musíš si jen zapamatovat správné pořadí úkonů.
	};
};

func void b_mortisarmorchoices()
{
	Info_ClearChoices(dia_mortis_armorteach);
	Info_AddChoice(dia_mortis_armorteach,Dialog_Back,dia_mortis_armorteach_back);

	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_mortis_armorteach,"Zbroj domobránce (cena: 500 zlatých)",dia_mortis_armorteach_itar_mil_l_v1);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (SHOW_ITAR_MIL_M == TRUE))
	{
		Info_AddChoice(dia_mortis_armorteach,"Těžká zbroj domobránce (cena: 1000 zlatých)",dia_mortis_armorteach_itar_mil_m_v1);
	};
};

instance DIA_MORTIS_ARMORTEACH(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = dia_mortis_armorteach_condition;
	information = dia_mortis_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};

func int dia_mortis_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (MORTIS_TEACHARMOR == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		if((PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[13] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_mortis_armorteach_info()
{
	AI_Output(other,self,"DIA_Mortis_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.

	if(Wld_IsTime(7,10,20,59))
	{
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_01");	//No, co potřebuješ vědět...
		b_mortisarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_02");	//Chlape, už je pozdě. Navíc, pro dnešek jsem už s prací skončil.
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_03");	//A pak, kde myslíš, že ti budu všechno ukazovat... (směje se)
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_04");	//Přijď ráno, až budu v kovárně. Pak se na to můžeme podívat.
	};
};

func void dia_mortis_armorteach_back()
{
	Info_ClearChoices(dia_mortis_armorteach);
};

func void dia_mortis_armorteach_itar_mil_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_mortis_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_TeachArmor_01_00");	//Nemáš přeci dost zlata! Neříkal jsem ti to snad?
	};
	b_mortisarmorchoices();
};

func void dia_mortis_armorteach_itar_mil_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			b_mortis_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_TeachArmor_01_00");	//Nemáš přeci dost zlata! Neříkal jsem ti to snad?
	};
	b_mortisarmorchoices();
};