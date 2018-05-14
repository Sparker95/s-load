for [{_i=0}, {_i<5}, {_i=_i+1}] do
{
    [] spawn {
		sleep random 1;
		while {true} do {
			sleep 0.5;
			private _a = []; //6 ms
			_a set [70, 0];
			_a = _a apply {2};
			{
				private _sum = 0;
				{
					_sum = _sum + _x;
				}forEach _a;
			} forEach _a;
		};
	};
};