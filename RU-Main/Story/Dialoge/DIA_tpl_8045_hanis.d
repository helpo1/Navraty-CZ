
instance DIA_HANIS_EXIT(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 999;
	condition = dia_hanis_exit_condition;
	information = dia_hanis_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hanis_exit_condition()
{
	return TRUE;
};

func void dia_hanis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANIS_NOFOREVER(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_noforever_condition;
	information = dia_hanis_noforever_info;
	permanent = FALSE;
	description = "Кто вы?";
};


func int dia_hanis_noforever_condition()
{
	if(MIS_PrioratStart == FALSE)
	{
		return TRUE;
	};
};

func void dia_hanis_noforever_info()
{
	AI_Output(other,self,"DIA_Hanis_NoForever_01_00");	//Кто вы?
	AI_Output(self,other,"DIA_Hanis_NoForever_01_01");	//(гордо) Я - Ханис, страж Братства. А те парни, которых ты видишь - сборщики болотника.
};


instance DIA_HANIS_PSIINFO(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_psiinfo_condition;
	information = dia_hanis_psiinfo_info;
	permanent = FALSE;
	description = "Братства? Какого Братства?";
};


func int dia_hanis_psiinfo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !Npc_KnowsInfo(hero,DIA_Hanis_psiinfo) && !Npc_KnowsInfo(hero,dia_balam_psiinfo) && Npc_KnowsInfo(hero,dia_hanis_noforever) && (MIS_PrioratStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_hanis_psiinfo_info()
{
	AI_Output(other,self,"DIA_Hanis_PsiInfo_01_00");	//Братства? Какого Братства?
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_01");	//Братства Спящего! Хотя теперь мы зовем его просто Братство.
	AI_Output(other,self,"DIA_Hanis_PsiInfo_01_02");	//Но я думал, что после падения барьера, Братство Спящего перестало существовать?
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_03");	//Не совсем. Конечно, некоторые из наших братьев погибли, а иные поддались злотворному влиянию демонических сил...
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_04");	//Но все же, многим удалось выжить.
	AI_Output(other,self,"DIA_Hanis_PsiInfo_01_05");	//А где находится ваш лагерь?
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_06");	//Иди в сторону прохода в Долину Рудников. Неподалеку от самого прохода есть небольшая ферма.
	AI_Output(self,other,"DIA_Hanis_PsiInfo_01_07");	//Там, поодаль от нее и находится наша новая обитель.
};


instance DIA_HANIS_HELLO(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_hello_condition;
	information = dia_hanis_hello_info;
	permanent = TRUE;
	description = "Как идет сбор болотника?";
};


func int dia_hanis_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_hanis_noforever) && (MIS_PrioratStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_hanis_hello_info()
{
	AI_Output(other,self,"DIA_Hanis_Hello_01_00");	//Как идет сбор болотника?
	AI_Output(self,other,"DIA_Hanis_Hello_01_01");	//Неплохо.
	AI_Output(other,self,"DIA_Hanis_Hello_01_02");	//А ты не из болтливых, да?
	AI_Output(self,other,"DIA_Hanis_Hello_01_03");	//Да.
};


instance DIA_HANIS_GIVEPLANT(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_giveplant_condition;
	information = dia_hanis_giveplant_info;
	permanent = TRUE;
	description = "Идол Кадар прислал меня.";
};

func int dia_hanis_giveplant_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_Running) && (FIRSTGROUPSEK == FALSE) && (other.guild == GIL_SEK) && Npc_KnowsInfo(hero,dia_hanis_noforever) && (MIS_PrioratStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_hanis_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Hanis_GivePlant_01_00");	//Идол Кадар прислал меня.
	AI_Output(self,other,"DIA_Hanis_GivePlant_01_01");	//Что хочет Гуру?
	AI_Output(other,self,"DIA_Hanis_GivePlant_01_02");	//Он просил меня доставить ему новую партию болотника, что вы собрали.

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_03");	//Хорошо, так мне не придется идти самому. Вот, возьми.
		B_GiveInvItems(self,other,ItPl_SwampHerb,100);
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_04");	//Не забудь заглянуть к другим сборщикам, если ты у них еще не был.
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_05");	//В противном случае кое-кому дневной сбор может показаться слишком маленьким, и кое-кто может даже подумать, что ты продал половину, хе-хе.
		FIRSTGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_06");	//Сомневаюсь, что тебя прислал Идол Кадар. Ты не похож на человека из нашего Братства.
		AI_Output(self,other,"DIA_Hanis_GivePlant_01_07");	//Я не отдам тебе болотник - даже не мечтай!
	};
};

instance DIA_Hanis_NewPlants(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_NewPlants_condition;
	information = DIA_Hanis_NewPlants_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hanis_NewPlants_condition()
{
    if((Kapitel < 3) && (FIRSTGROUPSEK == TRUE) && (hero.attribute[ATR_STRENGTH] >= 100))
	{
		return TRUE;
	};
};

func void DIA_Hanis_NewPlants_info()
{
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_01");	//Постой...
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_02");	//Что еще?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_03");	//(оценивающе) Просто ты выглядишь довольно крепким парнем.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_04");	//А мне сейчас не помешала бы помощь такого сильного человека, как ты. 
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_05");	//Давай ближе к делу.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_06");	//Хорошо. Дело в том, что один из наставников нашего Братства, Идол Кадар, дал мне одно небольшое поручение.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_07");	//Во имя процветания нашей общины, он поручил мне исследовать близлежащие места для основания новой плантации травы прозрения и воссияния сознания.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_08");	//Кммм... А если попроще?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_09");	//Иными словами, мне нужно было найти новое место для плантации болотника.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_10");	//И в чем же дело?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_11");	//Место я нашел, но там с недавних пор обосновалась стая огромных ящеров.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_12");	//Конечно, я бы и сам с ними справился...(задумчиво) Но...
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_13");	//И что же тебя смущает?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_14");	//Просто пока я буду возиться в их потрохах, неизвестно что может произойти в лагере во время моего отсутствия.
	AI_Output(other,self,"DIA_Hanis_NewPlants_01_15");	//А что может произойти?
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_16");	//Да ведь эти послушники, кроме своих мотыг, ничего толком в руках держать не умеют.
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_17");	//Недавно в их палатку заполз мелкий кротокрыс...(качая головой)
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_18");	//Так эти слюнтяи такой ор подняли, как будто сам Белиар явился к ним!
	Info_ClearChoices(DIA_Hanis_NewPlants);
	Info_AddChoice(DIA_Hanis_NewPlants,"Что от меня требуется?",DIA_Hanis_NewPlants_yes);
	Info_AddChoice(DIA_Hanis_NewPlants,"Дела Братства меня не интересуют.",DIA_Hanis_NewPlants_no);
};
	
func void DIA_Hanis_NewPlants_yes()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_yes_01_00");	//Что от меня требуется?
	AI_Output(self,other,"DIA_Hanis_NewPlants_yes_01_01");	//А разве это не ясно? Пойти и убить всех этих мерзких тварей вместо меня, конечно же.
	AI_Output(self,other,"DIA_Hanis_NewPlants_yes_01_02");	//В благодарность за это, я дам тебе немного золота или несколько стеблей болотной травы.
	AI_Output(other,self,"DIA_Hanis_NewPlants_yes_01_03");	//Ладно, с парой ящеров я справлюсь. Где это место?
	AI_Output(self,other,"DIA_Hanis_NewPlants_yes_01_04");	//Просто ступай дальше по этому склону. Уверен, ты его не пропустишь.
	AI_Output(other,self,"DIA_Hanis_NewPlants_yes_01_05");	//Хорошо, я скоро вернусь.
	MIS_HanisPlants = LOG_Running;
	Log_CreateTopic(TOPIC_HanisPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HanisPlants,LOG_Running);
	B_LogEntry(TOPIC_HanisPlants,"Страж Ханис попросил очистить от ящеров приглянувшееся ему место для новой плантации болотника. Если я пойду дальше по склону от палатки сборщиков, то не пропущу это место.");
    	AI_StopProcessInfos(self);
	Wld_InsertNpc(HanisWaran_01,"FP_ROAM_HANISLIZARD_02");
	Wld_InsertNpc(HanisWaran_02,"FP_ROAM_HANISLIZARD_04");
	Wld_InsertNpc(HanisWaran_03,"FP_ROAM_HANISLIZARD_06");
	Wld_InsertNpc(HanisWaran_04,"FP_ROAM_HANISLIZARD_08");
	Wld_InsertNpc(HanisWaran_05,"FP_ROAM_HANISLIZARD_10");
};

func void DIA_Hanis_NewPlants_no()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_no_01_00");	//Дела Братства меня не интересуют.
	AI_Output(self,other,"DIA_Hanis_NewPlants_no_01_01");	//Как скажешь...
	AI_StopProcessInfos(self);
};

instance DIA_Hanis_NewPlants_Done(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_NewPlants_Done_condition;
	information = DIA_Hanis_NewPlants_Done_info;
	permanent = FALSE;
	description = "Все ящеры мертвы!";
};

func int DIA_Hanis_NewPlants_Done_condition()
{
	if((MIS_HanisPlants == LOG_Running) && (Npc_IsDead(HanisWaran_01) == TRUE) && (Npc_IsDead(HanisWaran_02) == TRUE) && (Npc_IsDead(HanisWaran_03) == TRUE) && (Npc_IsDead(HanisWaran_04) == TRUE) && (Npc_IsDead(HanisWaran_05) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanis_NewPlants_Done_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_01_01");	//Все ящеры мертвы!
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_01_02");	//Ты в этом уверен?
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_01_03");	//Почему никто и никогда не верит мне с первого слова? Вот почему?
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_01_04");	//Ладно, я тебе верю. Надеюсь, Идолу Кадару тоже понравится это место.
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_01_05");	//А как насчет моей награды?
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_01_06");	//Как мы и договаривались. Что ты выбираешь?
	MIS_HanisPlants = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HanisPlants,LOG_SUCCESS);
	B_LogEntry(TOPIC_HanisPlants,"Ханис был доволен тем, что мне удалось разобраться с ящерами.");
	Info_ClearChoices(DIA_Hanis_NewPlants_Done);
	Info_AddChoice(DIA_Hanis_NewPlants_Done,"Мне нужно золото.",DIA_Hanis_NewPlants_Done_Gold);
	Info_AddChoice(DIA_Hanis_NewPlants_Done,"Дай мне болотник.",DIA_Hanis_NewPlants_Done_Herb);
	Info_AddChoice(DIA_Hanis_NewPlants_Done,"Что ты еще можешь мне предложить?",DIA_Hanis_NewPlants_Done_More);
};

func void DIA_Hanis_NewPlants_Done_Gold()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_Gold_01_00");	//Мне нужно золото.
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_Gold_01_01");	//Хорошо. Вот - тут все золото, что у меня есть.
	B_GiveInvItems(self,other,ItMi_Gold,350);
	AI_StopProcessInfos(self);
};

func void DIA_Hanis_NewPlants_Done_Herb()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_Herb_01_00");	//Дай мне болотник.
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_Herb_01_01");	//Хорошо. Вот твои полсотни стеблей.
	B_GiveInvItems(self,other,ItPl_SwampHerb,50);
	AI_Output(self,other,"DIA_Hanis_NewPlants_Done_Herb_01_02");	//Между прочим, это почти дневная норма наших сборщиков! Так что используй ее с умом.
	AI_StopProcessInfos(self);
};
	
func void DIA_Hanis_NewPlants_Done_More()
{
	AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_00"); //Что ты еще можешь мне предложить?

	if(hero.attribute[ATR_STRENGTH] >= 150)
	{
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_01"); //(оценивающе) Похоже, простая награда тебя не очень-то интересует.
		AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_02"); //Ты прав. Мне нужно что-нибудь особенное.
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_03"); //Ну хорошо. Я дам тебе эликсир силы. Это отличная награда для такого воина, как ты!
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_06"); //Ничего. Разве тебе этого мало?
		AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_07"); //Конечно! Мне нужно куда больше, чем просто болотная трава или золото.
		AI_Output(other,self,"DIA_Hanis_NewPlants_Done_More_01_08"); //Так что давай - выворачивай свои карманы! А я уж сам погляжу, что мне сгодится.
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_09"); //Полагаю, мне стоило бы научить тебя хорошим манерам, наглец!
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_10"); //Но так уж и быть - я не стану сегодня ломать тебе челюсть.
		AI_Output(self,other,"DIA_Hanis_NewPlants_Done_More_01_11"); //Считай, что это и есть твоя достойная награда...
		AI_StopProcessInfos(self);
	};
};

//-----------------PRIORAT---------------------



instance DIA_Hanis_PrioratStart(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_PrioratStart_condition;
	information = DIA_Hanis_PrioratStart_info;
	permanent = FALSE;
	description = "Что здесь произошло?";
};

func int DIA_Hanis_PrioratStart_condition()
{

	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hanis_PrioratStart_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_00");		//Что здесь произошло?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_01");		//На нас...(превозмогая боль) На нас напали! Я не знаю, кто это был.
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_02");		//Они застали нас врасплох... Единственное, что я успел сделать, это серьезно ранить одного из нападавших.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_03");		//А что случилось с остальными?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_04");		//Я не знаю... Кажется, они забрали их собой.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_05");		//Ладно, держись! Я скоро приведу помощь.
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_06");		//Не стоит... Я уже чувствую, что дни мои сочтены. Мое тело слабеет с каждой секундой...
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_07");		//Скорее всего, это какой-то сильнодействующий яд. Лишь сила моего духа не дает ему до конца овладеть моим телом.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_08");		//Тогда чем я могу помочь?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_09");		//Лучше пообещай мне, что попытаешься спасти наших послушников.
	AI_Output(other,self,"DIA_Hanis_PrioratStart_01_10");		//Хорошо. Ты знаешь, куда отправились нападавшие?
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_11");		//Нееет...(захлебываясь кровью) Но я уверен, что тот, кого я ранил, наверняка истекает кровью.
	AI_Output(self,other,"DIA_Hanis_PrioratStart_01_12");		//И... возможно, тебе удастся... выследить его...

	if(MIS_HanisPlants == LOG_Running)
	{
		MIS_HanisPlants = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_HanisPlants);
	};

	self.aivar[93] = FALSE;
	B_LogEntry_Quiet(TOPIC_PrioratStart,"Я прибыл слишком поздно. На лагерь стража Ханиса напали неизвестные! Они смертельно ранили его, а послушников забрали с собой. Полагаю, мне надо срочно сообщить об этом Идолу Намибу. Это коварное нападение и недавняя пропажа послушников из лагеря Братства могут быть неслучайными. Однако перед тем как это сделать, я должен попытаться выследить нападавших. Ханис сильно ранил одного из них, и тот наверняка не мог далеко уйти.");
	Info_ClearChoices(DIA_Hanis_PrioratStart);
	Info_AddChoice(DIA_Hanis_PrioratStart,"Эй...",DIA_Hanis_PrioratStart_Death);
};

func void DIA_Hanis_PrioratStart_Death()
{
	AI_StopProcessInfos(self);
	PsiCamp_03_Ok = TRUE;
	Wld_SendTrigger("NW_ASS_BLOOD_02");
	Wld_InsertNpc(Ass_120_Adept,"NW_FOREST_VINOSKELLEREI_01");
};