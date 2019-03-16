class oCItem {
//zCVob {
  //zCObject {
  var int    _vtbl;
  var int    _zCObject_refCtr;
  var int    _zCObject_hashIndex;
  var int    _zCObject_hashNext;
  var string _zCObject_objectName;
  //}
  var int    _zCVob_globalVobTreeNode;
  var int    _zCVob_lastTimeDrawn;
  var int    _zCVob_lastTimeCollected;
  var int    _zCVob_vobLeafList_array;
  var int    _zCVob_vobLeafList_numAlloc;
  var int    _zCVob_vobLeafList_numInArray;
  var int    _zCVob_trafoObjToWorld[16];
  var int    _zCVob_bbox3D_mins[3];
  var int    _zCVob_bbox3D_maxs[3];
  var int    _zCVob_bsphere3D_center[3];
  var int    _zCVob_bsphere3D_radius;
  var int    _zCVob_touchVobList_array;
  var int    _zCVob_touchVobList_numAlloc;
  var int    _zCVob_touchVobList_numInArray;
  var int    _zCVob_type;
  var int    _zCVob_groundShadowSizePacked;
  var int    _zCVob_homeWorld;
  var int    _zCVob_groundPoly;
  var int    _zCVob_callback_ai;
  var int    _zCVob_trafo;
  var int    _zCVob_visual;
  var int    _zCVob_visualAlpha;
  var int    _zCVob_m_fVobFarClipZScale;
  var int    _zCVob_m_AniMode;
  var int    _zCVob_m_aniModeStrength;
  var int    _zCVob_m_zBias;
  var int    _zCVob_rigidBody;
  var int    _zCVob_lightColorStat;
  var int    _zCVob_lightColorDyn;
  var int    _zCVob_lightDirectionStat[3];
  var int    _zCVob_vobPresetName;
  var int    _zCVob_eventManager;
  var int    _zCVob_nextOnTimer;
  var int    _zCVob_bitfield[5];
  var int    _zCVob_m_poCollisionObjectClass;
  var int    _zCVob_m_poCollisionObject;
  
// Для всех Items
	VAR INT		id								;				
	VAR STRING  name,nameID						;
	VAR INT		hp,hp_max						;

	VAR INT     mainflag,flags					;		//	основной флаг и другие флаги
	VAR INT		weight,value					;			
															
	// для оружия								
	VAR INT		damageType						;		//	тип урона
	VAR	INT		damageTotal						;
	VAR INT		damage			[DAM_INDEX_MAX]	;

	// для брони
	VAR INT		wear							;
	VAR INT		protection		[PROT_INDEX_MAX];

	// для пищи
	VAR INT		nutrition						;		//	питательность - увеличение HP-Steigerung

	// Необходимые атрибуты для использования
	VAR INT		cond_atr		[3]				;
	VAR INT		cond_value		[3]				;

	// Атрибуты, которые изменяет Item
	VAR INT		change_atr		[3]				;
	VAR INT		change_value	[3]				;

	// Функции парсера
	VAR int 	magic							;		//	Функция парсера для "управления магией"
	VAR int 	on_equip						;		//	Функция парсера, когда Item надевается.
	VAR int 	on_unequip						;		//	Функция парсера, когда Item снимается.
	VAR int 	on_state		[4]				;		//	
															
	// Владелец									
	VAR int 	owner							;		//	Владелец : имя инстанции
	VAR INT		ownerGuild						;		//	Владелец : гильдия
	VAR INT		disguiseGuild					;		//	Ложная гильдия при переодевании

	// 3DS-модель
	VAR STRING	visual							;

	// Изменение меша NSC при надевании предмета
	VAR STRING  visual_change					;		//	Файл ASC
	VAR STRING  effect;								//	Инстанция эффекта

	VAR INT		visual_skin						;
	
	VAR STRING 	scemeName						;
	VAR INT		material						;	
	// VAR STRING	pfx								;		//	PFX для магического оружия
	VAR INT		munition						;		//	Инстанция заряда
															
	var int 	spell							;			
	var int		range							;			
	
	var int		mag_circle						;
	
	VAR STRING	description						;
	VAR STRING	text			[ITM_TEXT_MAX]	;
	VAR INT		count			[ITM_TEXT_MAX]	;
	
	// отображение в инвентаре, учитывается, только если не равно 0
	var int	    inv_zbias;								//  насколько далеко сдвинут предмет на плоскости (целочисленная шкала 100=1)
	var	int		inv_rotx;								//  поворот по оси x в градусах
	var int 	inv_roty;								//  поворот по оси y в градусах
	var int 	inv_rotz;								//  поворот по оси z в градусах
	var int 	inv_animate;							//  item должен поворачиваться в инвентаре

	var int amount;							//int Сколько предметов (в слоте)
	var int instanz;						//int индекс символа
	var int c_manipulation;					//int ?
	var int last_manipulation;				//zREAL ?
	var int magic_value;					//int ?
	var int effectVob;						//oCVisualFX*
	var int next;							//oCItem* наверное, для односвязных списков
};				