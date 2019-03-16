
const int MAX_CHAPTER = 5;
const int MAX_MISSIONS = 5;
const int MAX_HITCHANCE = 5;

class C_AIVAR
{
	var string AIVARS[400];
};
class C_Npc
{
	var int id;
	var string name;
	var int vars[20];
	var string slot;
	var string effect;
	var int npcType;
	var int flags;
	var int attribute[ATR_INDEX_MAX];
	var int HitChance[MAX_HITCHANCE];
	var int protection[PROT_INDEX_MAX];
	var int damage[DAM_INDEX_MAX];
	var int damagetype;
	var int guild;
	var int level;
	var int mission[5];
	var int fight_tactic;
	var int weapon;
	var int voice;
	var int voicePitch;
	var int bodymass;
	var func daily_routine;
	var func start_aistate;
	var string spawnPoint;
	var int spawnDelay;
	var int senses;
	var int senses_range;
	var int aivar[100];
	var string wp;
	var int exp;
	var int exp_next;
	var int lp;
	var int bodyStateInterruptableOverride;
	var int noFocus;
};

class C_Mission
{
	var string name;
	var string description;
	var int duration;
	var int important;
	var func offerConditions;
	var func offer;
	var func successConditions;
	var func success;
	var func failureConditions;
	var func failure;
	var func obsoleteConditions;
	var func obsolete;
	var func running;
};

class C_Item
{
	var int id;
	var string name;
	var string nameID;
	var int hp;		//Заточено
	var int hp_max;		//Можно точить
	var int mainflag;
	var int flags;
	var int weight;	//Отравлено или нет
	var int value;
	var int damagetype;
	var int damageTotal;
	var int damage[DAM_INDEX_MAX];
	var int wear;
	var int protection[PROT_INDEX_MAX];
	var int nutrition;	//Можно отравить
	var int cond_atr[3];
	var int cond_value[3];
	var int change_atr[3];
	var int change_value[3];
	var func magic;
	var func on_equip;
	var func on_unequip;
	var func on_state[4];
	var func owner;
	var int ownerGuild;
	var int disguiseGuild;
	var string visual;
	var string visual_change;
	var string effect;
	var int visual_skin;
	var string scemeName;
	var int material;
	var int munition;
	var int spell;
	var int range;
	var int mag_circle;
	var string description;
	var string text[6];
	var int count[6];
	var int inv_zbias;
	var int inv_rotx;
	var int inv_roty;
	var int inv_rotz;
	var int inv_animate;
};

class C_Focus
{
	var float npc_longrange;
	var float npc_range1;
	var float npc_range2;
	var float npc_azi;
	var float npc_elevdo;
	var float npc_elevup;
	var int npc_prio;
	var float item_range1;
	var float item_range2;
	var float item_azi;
	var float item_elevdo;
	var float item_elevup;
	var int item_prio;
	var float mob_range1;
	var float mob_range2;
	var float mob_azi;
	var float mob_elevdo;
	var float mob_elevup;
	var int mob_prio;
};

class C_Info
{
	var int npc;
	var int nr;
	var int important;
	var func condition;
	var func information;
	var string description;
	var int trade;
	var int permanent;
};

class C_ITEMREACT
{
	var int npc;
	var int trade_item;
	var int trade_amount;
	var int requested_cat;
	var int requested_item;
	var int requested_amount;
	var func reaction;
};

class C_Spell
{
	var float time_per_mana;
	var int damage_per_level;
	var int damagetype;
	var int spellType;
	var int canTurnDuringInvest;
	var int canChangeTargetDuringInvest;
	var int isMultiEffect;
	var int targetCollectAlgo;
	var int targetCollectType;
	var int targetCollectRange;
	var int targetCollectAzi;
	var int targetCollectElev;
};

instance self(C_Npc)
{
};

instance other(C_Npc)
{
};

instance victim(C_Npc)
{
};

instance item(C_Item)
{
};

instance hero(C_Npc)
{
};

class C_STATUSBAR
{
	var int			posx;	//Положение полосы по оси X (макс. значение 864(8192/9.5) )
	var int			posy;	//Положение полосы по оси Y (макс. значение 864(8192/9.5) )
	var int			sizex;	//Размер по оси X(макс. значение 864)
	var int			sizey;	//Размер по оси Y(макс. значение 864)
	var	int 		value;
	var	int 		maxrange;
	var	STRING 		backtex;
	var	STRING 		bartex;
	var string		temptex;
	var	int 		bShow;
};

class C_CRAFT
{
	var	STRING 		reagent[6];
	var	STRING 		out;
	var	int 		skill;
	var	int 		skillVal;
	var	int 		id;
};

class Prs_StackPos
{
 	var int pos;
};

instance StackPos (Prs_StackPos);

prototype CRAFT(C_CRAFT)
{
	reagent[0] 	= "";
	reagent[1] 	= "";
	reagent[2] 	= "";
	reagent[3] 	= "";
	reagent[4] 	= "";
	reagent[5] 	= "";
	out			= "";
	skill		= 0;
	skillVal	= 0;
	id			= 0;
};

prototype StatusBar(C_STATUSBAR)
{
	posx		= 0;	//Положение полосы по оси X (макс. значение 864(8192/9.5) )
	posy		= 0;	//Положение полосы по оси Y (макс. значение 864(8192/9.5) )
	sizex		= 0;	//Размер по оси X(макс. значение 864)
	sizey		= 0;	//Размер по оси Y(макс. значение 864)
	value		= 0;	
	maxrange	= 0;
	backtex		= "";
	bartex		= "";
	bShow		= 0;
};

instance TargetManaBar(StatusBar)
{
	posy = 1; //Поместить сатус бар под бар хп цели
	value		= 1;
	maxrange	= 10;
	backtex		= "BAR_back.tga";
	bartex 		= "BAR_Mana.tga";
	bShow 		= 0;
};

instance StaminaBar(StatusBar)
{
	posx = 3710;
	posy = 7965; 
	value	 = ATR_STAMINA;
	maxrange = ATR_STAMINA_MAX * 10;
	backtex = "BAR_back.tga";
	bartex = "BAR_Stamina.tga";
	temptex = "BAR_TEMPMAX.tga";
	bShow = 0;
};

instance TargetHealthBar(StatusBar)
{
	posy = 1; 
	sizex	 = 180;
	sizey	 = 42;
	backtex = "BAR_BACK_NEW.tga";
	bartex = "BAR_HEALTH_NEW.tga";
	temptex = "BAR_TEMPMAX_NEW.tga";
	bShow = 0;
};

instance TargetHealthBarRare(StatusBar)
{
	posy = 1; 
	sizex	 = 256;
	sizey	 = 48;
	backtex = "BAR_RARE.tga";
	bartex = "BAR_HEALTH_RARE.tga";
	temptex = "BAR_TEMPMAX_NEW.tga";
	bShow = 0;
};

instance TargetHealthBarLege(StatusBar)
{
	posy = 1; 
	sizex	 = 256;
	sizey	 = 48;
	backtex = "BAR_LEGEND.tga";
	bartex = "BAR_HEALTH_LEGE.tga";
	temptex = "BAR_TEMPMAX_NEW.tga";
	bShow = 0;
};

instance TargetHealthBarEpic(StatusBar)
{
	posy = 1; 
	sizex	 = 256;
	sizey	 = 48;
	backtex = "BAR_EPIC.tga";
	bartex = "BAR_HEALTH_EPIC.tga";
	temptex = "BAR_TEMPMAX_NEW.tga";
	bShow = 0;
};
