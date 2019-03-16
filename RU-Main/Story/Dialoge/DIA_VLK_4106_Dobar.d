
instance DIA_Dobar_EXIT(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 999;
	condition = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dobar_HALLO(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 2;
	condition = DIA_Dobar_HALLO_Condition;
	information = DIA_Dobar_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dobar_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dobar_HALLO_Info()
{
	AI_Output(self,other,"DIA_Dobar_HALLO_08_00");	//Что тебе нужно?!
};


instance DIA_Dobar_Talent(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Talent_Condition;
	information = DIA_Dobar_Talent_Info;
	permanent = FALSE;
	description = "Я немного знаю кузнечное дело.";
};


func int DIA_Dobar_Talent_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dobar_Talent_Info()
{
	AI_Output(other,self,"DIA_Dobar_Talent_15_00");	//Я немного знаю кузнечное дело.
	AI_Output(self,other,"DIA_Dobar_Talent_08_01");	//Хорошо... и что?
};


instance DIA_Dobar_Schmiede(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Schmiede_Condition;
	information = DIA_Dobar_Schmiede_Info;
	permanent = FALSE;
	description = "Могу я воспользоваться твоей кузницей?";
};


func int DIA_Dobar_Schmiede_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Schmiede_Info()
{
	AI_Output(other,self,"DIA_Dobar_Schmiede_15_00");	//Могу я воспользоваться твоей кузницей?
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_01");	//У меня много работы. Мы будем только мешать друг другу. Лучше дождись темноты.
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_02");	//Тогда Парлаф и я пойдем спать, и ты сможешь спокойно поработать.
};

instance DIA_Dobar_Waffe(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 80;
	condition = DIA_Dobar_Waffe_Condition;
	information = DIA_Dobar_Waffe_Info;
	permanent = FALSE;
	description = "Ты можешь сделать оружие для меня?";
};

func int DIA_Dobar_Waffe_Condition()
{
	return TRUE;
};

func void DIA_Dobar_Waffe_Info()
{
	AI_Output(other,self,"DIA_Dobar_Waffe_15_00");	//Ты можешь сделать оружие для меня?
	AI_Output(self,other,"DIA_Dobar_Waffe_08_01");	//У меня нет времени на это. Тандор распоряжается всем оружием - я только кую его, а Парлаф затачивает.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Тандор продает оружие в замке.");
};

instance DIA_Dobar_NEWS(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 900;
	condition = DIA_Dobar_NEWS_Condition;
	information = DIA_Dobar_NEWS_Info;
	permanent = TRUE;
	description = "Как работа?";
};

func int DIA_Dobar_NEWS_Condition()
{
	return TRUE;
};

func void DIA_Dobar_NEWS_Info()
{
	AI_Output(other,self,"DIA_Dobar_NEWS_15_00");	//Как работа?
	if(Dobar_einmalig == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_01");	//Я кую оружие для рыцарей замка. С тех пор, как мы прибыли сюда, я не отхожу от кузницы.
		AI_Output(self,other,"DIA_Dobar_NEWS_08_02");	//Это оружие нам очень пригодится. Мы еще покажем этим проклятым оркам!
		if(Npc_IsDead(Parlaf) == FALSE)
		{
			B_TurnToNpc(self,Parlaf);
			AI_Output(self,other,"DIA_Dobar_NEWS_08_03");	//(зовет) Эй, Парлаф - затачивай эти мечи получше - орки чертовски сильные противники!
			B_TurnToNpc(self,other);
		};
		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_04");	//Могло бы быть и лучше. Если бы ты постоянно не отвлекал меня, работа продвигалась бы быстрее.
	};
};

instance DIA_DOBAR_ARMORCANTEACH(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 5;
	condition = dia_dobar_armorcanteach_condition;
	information = dia_dobar_armorcanteach_info;
	permanent = TRUE;
	description = "Ты разбираешься в ковке доспехов?";
};


func int dia_dobar_armorcanteach_condition()
{
	if((DOBAR_TEACHARMOR == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dobar_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Dobar_ArmorCanTeach_01_00");	//Ты разбираешься в ковке доспехов?
	AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_01");	//Да, я немного смыслю в их изготовлении. Хотя, если честно, ковать оружие мне больше по душе.
	AI_Output(other,self,"DIA_Dobar_ArmorCanTeach_01_02");	//Можешь научить меня, как улучшать доспехи?
	AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_03");	//Ну, поскольку ты один из нас, я бы мог показать тебе, как сделать твои доспехи более крепкими и надежными.
	AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_04");	//Но ты должен хотя бы немного разбираться в кузнечном деле.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Dobar_ArmorCanTeach_01_05");	//Я неплохой кузнец.
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_07");	//Это хорошо! Только сразу хочу предупредить тебя, что все имеет свою цену - и мои уроки в том числе.
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_08");	//Скажи мне, как будешь готов - и мы начнем обучение.
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_09");	//А судя по всему, ты даже молот кузнечный в руках не держал!
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_10");	//Дам тебе совет, малыш. Сначала научись ковать, а потом я подумаю насчет твоей просьбы...
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_11");	//И хочу предупредить тебя, что все имеет свою цену - и мои уроки в том числе.
	};

	DOBAR_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Добар может научить меня улучшать доспехи городского ополчения.");
};

func void b_dobar_teacharmor_1()
{
	AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_01");	//Хорошо, начнем. Возьми все необходимые материалы...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"OC_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_02");	//...на наковальне добавь их в нужной последовательности к разогретой стальной заготовке...
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_03");	//...после чего придай ей требуемую форму и скрепи с доспехом...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_05");	//...вот и все!
	};
};

func void b_dobar_teacharmor_2()
{
	AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_01");	//Тщательно запоминай все, что я тебе сейчас буду показывать. И как всегда, убедись, что у тебя под рукой есть все материалы для ковки...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"OC_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_02");	//...возьми раскаленную стальную заготовку и раздели ее на несколько равных частей...
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_03");	//...смешай каждую часть в нужной последовательности с очередным материалом...
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_04");	//...а потом вковываешь их в каркас имеющейся брони, старательно проковывая места схода...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_05");	//...и всего-то делов!
	};
};

func void b_dobararmorchoices()
{
	Info_ClearChoices(dia_dobar_armorteach);
	Info_AddChoice(dia_dobar_armorteach,Dialog_Back,dia_dobar_armorteach_back);

	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_dobar_armorteach,"Доспехи ополчения (Цена обучения: 600 монет)",dia_dobar_armorteach_itar_mil_l_v1);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (SHOW_ITAR_MIL_M == TRUE))
	{
		Info_AddChoice(dia_dobar_armorteach,"Тяжелые доспехи ополчения (Цена обучения: 1200 монет)",dia_dobar_armorteach_itar_mil_m_v1);
	};
};

instance DIA_DOBAR_ARMORTEACH(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 5;
	condition = dia_dobar_armorteach_condition;
	information = dia_dobar_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};

func int dia_dobar_armorteach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent) && (Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (DOBAR_TEACHARMOR == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		if((PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[13] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_dobar_armorteach_info()
{
	AI_Output(other,self,"DIA_Dobar_ArmorTeach_01_00");	//Научи меня улучшать доспехи.
	if(Wld_IsTime(8,0,20,0))
	{
		AI_Output(self,other,"DIA_Dobar_ArmorTeach_01_01");	//Хорошо, давай начнем...
		b_dobararmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_ArmorTeach_01_02");	//Ты что, совсем сбрендил, приятель? Сейчас же ночь! Дождись утра, тогда и приходи.
	};
};

func void dia_dobar_armorteach_back()
{
	Info_ClearChoices(dia_dobar_armorteach);
};

func void dia_dobar_armorteach_itar_mil_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 600)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,600);
			b_dobar_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_TeachArmor_01_00");	//(раздраженно) Парень, не пытайся надуть меня! Сначала достань золото...
	};
	b_dobararmorchoices();
};

func void dia_dobar_armorteach_itar_mil_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1200)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1200);
			b_dobar_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_TeachArmor_01_00");	//(раздраженно) Парень, не пытайся надуть меня! Сначала достань золото...
	};
	b_dobararmorchoices();
};


instance DIA_Dobar_WarGoods(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_WarGoods_Condition;
	information = DIA_Dobar_WarGoods_Info;
	permanent = FALSE;
	description = "Помощь не нужна?";
};

func int DIA_Dobar_WarGoods_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_WarGoods_Info()
{
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_00");	//Помощь не нужна?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_01");	//Хммм...(ворчливо) Мне сейчас действительно не помешала бы чья-либо помощь.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_02");	//Нашим парням порой приходится отстреливаться от орков, что бродят возле тарана.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_03");	//А для этого нужны болты. Много болтов! Но поскольку замок окружен этими тварями, то...
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_04");	//...то я должен достать для вас болты. Я прав?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_05");	//Не перебивай меня! Болты я и сам могу сделать, но для этого...
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_06");	//...нужна сталь. Угадал?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_07");	//(раздраженно) Белиар бы тебя побрал, мальчишка! Ты вообще можешь дослушать до конца?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_08");	//Стали у меня полно! К тому же я научился переплавлять оружие убитых паладинами орков, и с ней теперь проблем особо нет.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_09");	//Мне нужен уголь. Его запасы в замке подходят к концу, а мне необходимо каждый день чем-то растапливать свой горн.
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_10");	//И где же мне взять для тебя этот уголь?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_11");	//(ворчливо) Откуда мне знать? Но, думаю, его можно поискать в старых рудных шахтах.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_12");	//Там должны были остаться огромные плавильные печи. А для их разогрева обычно требуется просто невероятное количество угля.
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_13");	//Понятно. Тогда загляну туда при случае.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_14");	//Так-то лучше...
	MIS_DobarCoal = LOG_Running;
	Log_CreateTopic(TOPIC_DobarCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DobarCoal,LOG_Running);
	B_LogEntry(TOPIC_DobarCoal,"У кузнеца Добара подходят к концу запасы угля в замке. А без него он не сможет ковать оружие и болты для паладинов. Добар предположил, что большое количество угля можно достать в старых рудных шахтах.");
};

instance DIA_Dobar_WarGoods_Done(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_WarGoods_Done_Condition;
	information = DIA_Dobar_WarGoods_Done_Info;
	permanent = FALSE;
	description = "Я принес тебе огромный пакет с углем.";
};

func int DIA_Dobar_WarGoods_Done_Condition()
{
	if((MIS_DobarCoal == LOG_Running) && (Npc_HasItems(other,ITMI_COALBAG) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dobar_WarGoods_Done_Info()
{
	var int MoreCoal;

	AI_Output(other,self,"DIA_Dobar_WarGoods_Done_01_00");	//Я принес тебе огромный пакет с углем.

	if(Npc_HasItems(other,ITMI_COALBAG) == 1)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ITMI_COALBAG,1);
		Npc_RemoveInvItems(self,ITMI_COALBAG,1);
	}
	else if(Npc_HasItems(other,ITMI_COALBAG) >= 2)
	{
		B_GivePlayerXP(1000);
		B_GiveInvItems(other,self,ITMI_COALBAG,2);
		Npc_RemoveInvItems(self,ITMI_COALBAG,2);
		MoreCoal = TRUE;
	};

	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_01");	//Ого! Какой огромный! И где же ты умудрился его достать?
	AI_Output(other,self,"DIA_Dobar_WarGoods_Done_01_02");	//Как ты и предполагал, я нашел его в старой шахте.
	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_03");	//Вот видишь? Мои предчувствия меня не обманули.
	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_04");	//Спасибо тебе за помощь, приятель. За это я дам тебе немного болтов из наших запасов.

	if(MoreCoal == TRUE)
	{
		B_GiveInvItems(self,other,ItRw_Bolt,200);
	}
	else
	{
		B_GiveInvItems(self,other,ItRw_Bolt,100);
	};

	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_06");	//Надеюсь, они тебе пригодятся, если ты вдруг решишь подстрелить парочку орков.
	MIS_DobarCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_DobarCoal,LOG_Success);
	B_LogEntry(TOPIC_DobarCoal,"Добар остался доволен количеством принесенного мной угля.");
};

var int DobarTeachOrcsWeapon;

instance DIA_Dobar_OrcsWeapon(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_OrcsWeapon_Condition;
	information = DIA_Dobar_OrcsWeapon_Info;
	permanent = FALSE;
	description = "Ты умеешь переплавлять оружие орков?";
};

func int DIA_Dobar_OrcsWeapon_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dobar_WarGoods))
	{
		return TRUE;
	};
};

func void DIA_Dobar_OrcsWeapon_Info()
{
	AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_00");	//Ты умеешь переплавлять оружие орков?
	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_01");	//Пришлось научиться! Иначе откуда паладинам брать боеприпасы?
	AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_02");	//А меня можешь этому научить?
	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_03");	//Ну... почему бы и нет?
	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_05");	//Но прежде ты должен будешь освоить процесс выплавки стали из железной руды.

	if(KNOWHOWTOOREFUS == TRUE)
	{
		AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_06");	//Это я уже знаю.
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_07");	//Хорошо! Тем будет проще для тебя...
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_08");	//Но сразу хочу предупредить, что в качестве платы за обучение я принимаю только магическую руду.
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_09");	//Без этих знаний я вряд ли смогу тебе помочь.
		AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_10");	//Понимаю.
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_11");	//И еще кое-что. В качестве платы за обучение я принимаю только магическую руду.
	};


	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_12");	//Золото нам тут без надобности!
	DobarTeachOrcsWeapon = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"Добар может обучить меня переплавлять оружие орков в стальные болванки.");
};

instance DIA_Dobar_OrcsWeaponTeach(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 5;
	condition = DIA_Dobar_OrcsWeaponTeach_condition;
	information = DIA_Dobar_OrcsWeaponTeach_info;
	permanent = TRUE;
	description = "Обучи меня переплавлять оружие орков. (Очки обучения: 2, Цена: 10 кусков руды)";
};

func int DIA_Dobar_OrcsWeaponTeach_condition()
{
	if((DobarTeachOrcsWeapon == TRUE) && (OrcsWeaponSteel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dobar_OrcsWeaponTeach_info()
{
	AI_Output(other,self,"DIA_Dobar_OrcsWeaponTeach_01_00");	//Обучи меня переплавлять оружие орков.

	if(KNOWHOWTOOREFUS == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_01");	//Пока ты не знаком с техникой плавки стали, ты не сможешь этому научиться. Разве я не говорил тебе?
	}
	else
	{
		if((hero.lp >= 2) && (Npc_HasItems(other,ItMi_Nugget) >= 10))
		{
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_02");	//Хорошо. Для начала тебе нужна одна своя стальная болванка.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_03");	//Она необходима для того, чтобы все твои последующие болванки были одинакового размера.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_04");	//Также следует знать, что орочья сталь совсем не похожа на нашу. Орки не слишком заботятся о чистоте сплава.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_05");	//Поэтому, чтобы получить одну стальную болванку хорошего качества, одного их топора или меча не хватит.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_06");	//У меня обычно уходит порядка десяти на изготовления одной заготовки.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_07");	//И самое главное - необходимо хорошенько выпарить из сплава различные примеси!
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_08");	//Ну, вот, вроде бы, и все.
			hero.lp = hero.lp - 2;
			RankPoints = RankPoints + 2;
			Npc_RemoveInvItems(hero,ItMi_Nugget,10);
			OrcsWeaponSteel = TRUE;
			AI_Print("Изучено: переплавка оружия");
			B_LogEntry(TOPIC_STEELDRAW,"Теперь я умею переплавлять оружие орков.");
			Snd_Play("LevelUP");
		}
		else
		{
			if(hero.lp < 2)
			{
				AI_Print(PRINT_NotEnoughLearnPoints);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Print(Print_NotEnoughOre);
				AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_12");	//Парень, а где руда? Без нее я не стану тебя обучать.
			};
		};
	};
};