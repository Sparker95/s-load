sl_prev = time;
private _i = 0;
private _ds = 0; // Smoothed value of delta
private _a = 0.009; //
private _N = 30;
while {true} do {
	sleep 0.001;
	private _t = time; // Get current time
	private _delta = _t - sl_prev; // Calculate time passed since previous measurement
	sl_prev = _t; // Store the new time back
	_ds = _a * _delta + (1-_a)*_ds; // Exponential averaging
	
	//Output value every N measurements
	_i = _i + 1;
	if (_i == _N) then {
		_i = 0;
		private _overloadPercent = round(100*diag_fps*_ds);
		systemChat ((format ["Scheduler delay: %1 ms, overload: %2", round(_ds*1000), _overloadPercent]) + "%");
		// Calculate new value for N to produce outputs every 0.5 seconds
		_N = ceil(0.5/_ds);
	};
};