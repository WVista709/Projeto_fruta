//Variaveis do teclado
var _key_down, _key_left, _key_right, _key_up, _vel;
_key_down = keyboard_check(ord("S"));
_key_up = keyboard_check(ord("W"));
_key_left = keyboard_check(ord("A"));
_key_right = keyboard_check(ord("D"));

state = (_key_down || _key_up || _key_left || _key_right) ? States.MOVE : States.IDLE;

function Animated_sprite(_state){
	var _start, _end;
	
	if (_state == States.IDLE){
		_start = img_idle_start[direction];
		_end = img_idle_end[direction];
	} else {
		_start = img_walk_start[direction];
		_end = img_walk_end[direction];
	}

	if (image_index < _start || image_index > _end){
		image_index = _start;
	} else {
		image_index += 0.2;
		if (image_index > _end) image_index = _start;
	}
}

function Set_sprite_direction(_hdir, _vdir, _spr_present = spr_present){
	if (_vdir > 0){
		direction = Directions.FRONT;
		_spr_present = spr_front;
	}
	else if (_vdir < 0){
		direction = Directions.BACK;
		_spr_present = spr_back;
	}
	else if (_hdir > 0){
		direction = Directions.RIGHT;
		_spr_present = spr_right;
	}
	else if (_hdir < 0){
		direction = Directions.LEFT;
		_spr_present = spr_left;
	}
	sprite_index = _spr_present;
}

function Move(_right, _left, _down, _up){
	var _hdir = _right - _left; 
	var _vdir = _down - _up;
	
	var _len = point_distance(0, 0, _hdir, _vdir);
	if (_len != 0){
		_hdir /= _len;
		_vdir /= _len;
	}
	
	if (_hdir != 0 || _vdir != 0){
		var _dir = point_direction(0, 0, _hdir, _vdir);
		speedx = lengthdir_x(velocity, _dir);
		speedy = lengthdir_y(velocity, _dir);
		
		Set_sprite_direction(_hdir, _vdir);
	}
	
	//Sprites
	Animated_sprite(States.MOVE);
}

function Idle(){
	//Sprites
	Animated_sprite(States.IDLE);
	
	speedx = 0;
	speedy = 0;
}

//States Machine
switch (state){
	case States.IDLE: Idle(); break;
	case States.MOVE: Move(_key_right, _key_left, _key_down, _key_up); break;
}

x += speedx;
y += speedy;
