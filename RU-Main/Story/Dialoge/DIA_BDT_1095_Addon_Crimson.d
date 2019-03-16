
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
	description = "Что ты делаешь? Ты плавишь наше золото?";
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Что ты делаешь? Ты плавишь наше золото?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Нет, мою овощи. Конечно же, я плавлю золото. И отливаю из него монеты.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Представляешь, однажды вечером Ворон подошел ко мне и бросил мне форму для отливки.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Из одного самородка я могу сделать целую пригоршню монет. Они получаются такого качества, что от настоящих их не отличить!
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = "Сколько монет ты дашь мне за самородок?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Сколько монет ты дашь мне за самородок?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Ну, тебя я совсем не знаю, но думаю, что дам тебе особую цену. За один самородок я дам тебе...
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_02");	//...восемь золотых монет! И не монетой больше.
	AI_Output(other,self,"DIA_Addon_Crimson_How_10_03");	//Как?! Всего восемь золотых?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_04");	//Ты прекрасно меня слышал! А если тебя это не устраивает, то можешь оставить свое золото себе.
};

var int CrimsonMoreGold;

instance DIA_Addon_Crimson_Feilsch(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = "Давай поторгуемся!";
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
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Давай поторгуемся!

	if(RhetorikSkillValue[1] >= 40)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_50");	//Хммм...(качая головой) А ты умеешь убалтывать людей, да?
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_51");	//Ладно, я дам тебе десять монет за каждый золотой самородок. Теперь доволен?
		AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_10_52");	//Вполне.
		CrimsonMoreGold = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Хммм...(задумчиво) Нет! Столько я даю каждому рудокопу.
		AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Но ты говорил, что это особая цена.
		AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//Это так! Я всем плачу особую цену.
	};
};


instance DIA_Addon_Crimson_Gold(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 99;
	condition = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent = TRUE;
	description = "Продать золотые слитки...";
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
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Займемся торговлей...
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять все золотые слитки",DIA_Addon_Crimson_Gold_ALLE);

		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять десяток золотых слитков",dia_addon_crimson_gold_10);
		};

		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять один золотой слиток",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Но у тебя с собой нет ни одного самородка.
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
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять все золотые слитки",DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять десяток золотых слитков",dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять один золотой слиток",DIA_Addon_Crimson_Gold_1);
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
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять все золотые слитки",DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять десяток золотых слитков",dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять один золотой слиток",DIA_Addon_Crimson_Gold_1);
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
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять все золотые слитки",DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять десяток золотых слитков",dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Обменять один золотой слиток",DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(заклинательно) КХАРДИМОН ФАТАГН ШАТАР ФАТАГН БЕЛИАР.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = "Что ты знаешь о Вороне?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Что ты знаешь о Вороне?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Ты не поверишь! Я был там. Я видел, что он делал в гробнице!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(со страхом) Он бормотал и выкрикивал какие-то странные слова. Снова и снова...
	B_Say_CrimsonBeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//А потом из могилы вырвался столб света, и я услышал ужасный вопль.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//О боги... Этот голос... Он звучал, как голос предвестника конца света!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Ворон говорил с ним! Они разговаривали - Ворон и этот голос!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Я не помню, о чем они говорили. Но дрожь в конечностях мне удалось унять только через несколько часов.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = "Ты можешь повторить слова Ворона?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//Ты можешь повторить слова Ворона?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Конечно. Ты готов?
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"Я готов.",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Думаю, нам лучше не ввязываться в это...
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
	description = "Ты умеешь ковать доспехи?";
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
	AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_00");	//Ты умеешь ковать доспехи?
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_01");	//Может и умею. А тебе-то что?
	AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_02");	//А ты может научишь меня этому?
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_03");	//Хм... Сама наивность! А с чего это ты решил, что я буду тебя этому учить?
	AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_06");	//Я бы заплатил тебе за твои уроки.
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_07");	//С этого и надо было начинать. Ведь это уже совсем другой разговор, парень!
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_08");	//Если у тебя действительно водится золотишко, я бы мог показать тебе несколько способов, как улучшить твою броню.
	AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_09");	//Правда для начала, тебе надо немного разбираться в ковке.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_10");	//Я довольно сносно разбираюсь в ковке.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_11");	//Ну-ка поглядим. Да, ты действительно разбираешься. Ну, что же. Это все немного упрощает.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_12");	//Я научу тебя тому, что знаю сам. И учти одну вещь - за твое обучение тебе придется заплатить. Благотворительностью я не занимаюсь!
		AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_14");	//Хорошо, я все понял.
	}
	else
	{
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_15");	//А ты, как я погляжу, даже понятия не имеешь, что это такое.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_16");	//Вот что, парень. Иди сначала научись хоть как-то ковать. После, мы поговорим о твоем обучении.
		AI_Output(self,other,"DIA_Crimson_ArmorCanTeach_01_17");	//И учти одну вещь - за твое обучение тебе придется заплатить. Благотворительностью я не занимаюсь.
		AI_Output(other,self,"DIA_Crimson_ArmorCanTeach_01_18");	//Это я уже понял.
	};
	CRIMSON_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Кримсон может научить меня улучшать доспехи стражников.");
};

func void b_crimson_teacharmor_1()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_01");	//Хорошо, смотри внимательно, как это делается. Берешь нужные материалы и...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_02");	//...на наковальне добавляешь их в нужной последовательности к разогретой стальной заготовке...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_03");	//...после чего придаешь ей необходимую форму и скрепляешь с имеющимся доспехом...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_04");	//...вот так, как это делаю я сейчас...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_05");	//...вот и все!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_06");	//Теперь ты можешь попробовать сделать это сам.
	};
};

func void b_crimson_teacharmor_2()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_01");	//Отлично. Запоминай тщательно все, что я тебе сейчас буду показывать. Прежде всего, тебе необходимо иметь под рукой все материалы для ковки...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_02");	//...берешь раскаленную стальную заготовку и разбиваешь ее на несколько составных частей...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_03");	//...в определенной последовательности смешивая каждую часть с очередным материалом...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_04");	//...потом вковываешь их в каркас имеющейся брони, особенно тщательно проковывая места схода. Вот так, видишь? (показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_05");	//...и всего-то делов!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_2_01_06");	//Ничего сложного, поверь мне. Главное - запомни правильную последовательность действий.
	};
};

func void b_crimson_teacharmor_3()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_01");	//Смотри и запоминай все то, что я тебе сейчас покажу. На самом деле ничего сложного тут нет...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_02");	//...обрабатываешь раскаленную стальную заготовку на наковальне...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_03");	//...доводишь сплав до однородной субстанции, после чего смешиваешь его с остальными компонентами...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_04");	//...далее придаешь ей законченнную форму и проковываешь с контуром доспеха...Вот так, смотри видишь как я делаю...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_05");	//...вот и готово!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_3_01_06");	//Сам видишь, все просто. Теперь иди, сам пробуй.
	};
};

func void b_crimson_teacharmor_4()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_01");	//Итак, приступим. Проверь, что все необходимые материалы у тебя под рукой. Берешь разогретую стальную заготовку...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_02");	//...на наковальне придаешь ей форму пластины и вковываешь в нее еще один кусок стали....
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_03");	//...далее делаешь крепления и соединяешь пластину с ними, тщательно проковывая места схода...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_04");	//...после этого тщательно крепишь полученный элемент на корпус доспеха - вот таким образом... смотри... (показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_06");	//Это все, что тебе следует знать, чтобы улучшить этот доспех.
	};
};

func void b_crimson_teacharmor_5()
{
	AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_01");	//Ну что ж, пожалуй начнем. Для создания этого доспеха тебе потребуется много времени и усилий - но поверь, это того стоит...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_02");	//...возьми раскаленную стальную заготовку и раздели ее на несколько равных частей. Постарайся, чтобы они были примерно одного размера...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_03");	//...далее бери каждую часть и обработай ее последовательно с помощью смоленого раствора. После скрепи две части и прокуй места схода...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_04");	//...а после полученный элемент скрепляешь с доспехом по бокам с помощью металлической пластины. Смотри, как я это делаю...
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_05");	//...видишь как он сел четко, практически обтекая поверхность доспеха. Усиливаешь крепление металлическими болтами и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_06");	//...готово! Ну и как тебе процесс? (смеется) Ничего, немного практики - и у тебя все выйдет, как надо.
		AI_Output(self,other,"DIA_Crimson_TeachArmor_5_01_07");	//Теперь иди, пробуй сам.
	};
};

func void b_crimsonarmorchoices()
{
	Info_ClearChoices(dia_crimson_armorteach);
	Info_AddChoice(dia_crimson_armorteach,Dialog_Back,dia_crimson_armorteach_back);
	if((PLAYER_TALENT_SMITH[25] == FALSE) && (Npc_HasItems(other,itar_grd_l) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach,"Лeгкие доспехи стражника (Цена: 750 монет)",dia_crimson_armorteach_itar_grd_l_v1);
	};
	if((PLAYER_TALENT_SMITH[26] == FALSE) && (Npc_HasItems(other,ITAR_Bloodwyn_Addon) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach,"Доспехи стражника (Цена: 1000 монет)",dia_crimson_armorteach_itar_bloodwyn_addon_v1);
	};
	if((PLAYER_TALENT_SMITH[27] == FALSE) && (Npc_HasItems(other,ITAR_Thorus_Addon) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach,"Тяжелые доспехи стражника (Цена: 1500 монет)",dia_crimson_armorteach_itar_thorus_addon_v1);
	};
};


instance DIA_CRIMSON_ARMORTEACH(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = dia_crimson_armorteach_condition;
	information = dia_crimson_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
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
	AI_Output(other,self,"DIA_Crimson_ArmorTeach_01_00");	//Научи меня улучшать доспехи.
	AI_Output(self,other,"DIA_Crimson_ArmorTeach_01_01");	//И что же ты хочешь узнать?
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
		AI_Output(self,other,"DIA_Crimson_TeachArmor_03_00");	//Ты что думаешь, что меня вот так просто можно надуть? Неси золото, тогда и поговорим.
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
		AI_Output(self,other,"DIA_Crimson_TeachArmor_04_00");	//Ты что думаешь, что меня вот так просто можно надуть? Неси золото, тогда и поговорим.
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
		AI_Output(self,other,"DIA_Crimson_TeachArmor_05_00");	//Ты что думаешь, что меня вот так просто можно надуть? Неси золото, тогда и поговорим.
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
	description = "А меня сможешь научить плавить золото?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_GoldStuck_01_00");	//Можешь научить меня плавить золото?
	AI_Output(self,other,"DIA_Addon_Crimson_GoldStuck_01_01");	//Могу, но не за спасибо.
	AI_Output(self,other,"DIA_Addon_Crimson_GoldStuck_01_02");	//Процесс не особенно сложный, но немного практики здесь не помешает.
	B_LogEntry(TOPIC_STEELDRAW,"Кримсон может научить меня плавить золотые самородки.");
};

instance DIA_Addon_Crimson_DoGoldStuck(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = DIA_Addon_Crimson_DoGoldStuck_condition;
	information = DIA_Addon_Crimson_DoGoldStuck_info;
	permanent = TRUE;
	description = "Научи меня плавить золото. (Очки обучения: 5, Цена: 1500 монет)";
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
	AI_Output(other,self,"DIA_Addon_Crimson_DoGoldStuck_01_00");	//Научи меня плавить золото!
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
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_01");	//Хорошо, смотри. Тут все просто.
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_02");	//Берешь примерно четверть сотни золотых самородков и бросаешь их в горн.
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_03");	//Доводишь сплав до нужной температуры и сливаешь в форму через сито.
		AI_Output(self,other,"DIA_Addon_Crimson_DoGoldStuck_01_04");	//Вот и все. Золотой слиток готов.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучено: плавка золота");
		KNOWHOWTOOREFUSGOLD = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_STEELDRAW,"Теперь я умею переплавлять золото в слитки. Для выплавки одного слитка необходимо двадцать пять золотых самородков.");
	};
};