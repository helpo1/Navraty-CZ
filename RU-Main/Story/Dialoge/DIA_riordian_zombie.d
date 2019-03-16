
instance DIA_RIORDIAN_ZOMBIE_EXIT(C_Info)
{
	npc = riordian_zombie;
	nr = 999;
	condition = dia_riordian_zombie_exit_condition;
	information = dia_riordian_zombie_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_riordian_zombie_exit_condition()
{
	return TRUE;
};

func void dia_riordian_zombie_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RIORDIAN_ZOMBIE_HALLO(C_Info)
{
	npc = riordian_zombie;
	nr = 1;
	condition = dia_riordian_zombie_hallo_condition;
	information = dia_riordian_zombie_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_riordian_zombie_hallo_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_riordian_zombie_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_00");	//(мертвым голосом) Аарггг, вот ты и пришел, человек... Я ждал тебя!
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_01");	//Риордиан?!
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_02");	//Ты ошибся, смертный... Это не Риордиан! Точнее, это уже не он.
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_03");	//Тогда кто ты?
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_04");	//А ты подумай...
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_05");	//И пусть тебя не обманывает ложный вид этой гниющей плоти, источающей ужасное зловоние.
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_06");	//Лучше повнимательней всмотрись в ее мертвые глаза, и ты увидишь своего настоящего врага, избранный!
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_07");	//Не может быть! Хранители?!
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_08");	//(зловеще смеется) А ты думал, кто-то другой?
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_09");	//В прошлый раз мы несколько недооценили тебя. На сей же раз мы хорошо подготовились!
	AI_Output(other,self,"DIA_Riordian_Zombie_HALLO_01_12");	//Где древний артефакт, который Зодчие использовали для своих ритуалов?
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_13");	//Он у меня... Но тебе его никогда не получить! Равно как и спасти этот мир.
	AI_Output(self,other,"DIA_Riordian_Zombie_HALLO_01_14");	//Скоро эта земля познает наш гнев, никому не остановить нас!
	B_LogEntry(TOPIC_GUARDIANS,"В одном из храмов древних мне вновь пришлось столкнуться с Хранителями. Похоже, они не успокоятся, пока не убьют меня!");
	Log_AddEntry(TOPIC_RESTOREHRAM,"Я нашел Риордиана, но, кажется, опоздал! Зло, посеянное Хранителями, уже полностью овладело им и превратило в бездушного зомби. Теперь мне остается положить его мучениям конец и забрать у него древний артефакт, который нужен Сатурасу.");
	Info_ClearChoices(dia_riordian_zombie_hallo);
	Info_AddChoice(dia_riordian_zombie_hallo,"Это мы еще посмотрим!",dia_riordian_zombie_hallo_end);
};

func void dia_riordian_zombie_hallo_end()
{
	AI_Output(other,self,"DIA_Riordian_Zombie_Hallo_End_01_00");	//Это мы еще посмотрим!
	AI_Output(self,other,"DIA_Riordian_Zombie_Hallo_End_01_01");	//(зловещий вопль) Умри, смертный!
	self.aivar[AIV_EnemyOverride] = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

