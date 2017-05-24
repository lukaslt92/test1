
/*
	Description:	Warns the player if they enter an altitude targetable by SAM
	
*/

// --- Configuration ---
HandleSAMSite_ClientWarn_engageMinAlt = 50;	// !!!! Should also be same as in HandleSAMSite.sqf
// ---------------------

[] spawn {
	_wasOverAlt = false;
	while {true} do {
		if ( (getPos player select 2) > HandleSAMSite_ClientWarn_engageMinAlt && {!(typeOf(vehicle player) isKindOf "ParachuteBase")} && {vehicle player != player}) then {
			if (!_wasOverAlt) then {
				[] spawn {
					cutText ["SAM Altitude Warning!\n\nIf the enemy team has Surface-to-Air Missiles (SAM) online, you might get targeted above " + str HandleSAMSite_ClientWarn_engageMinAlt + "m.","PLAIN DOWN",2];
					_numBeeps = 3;
					_soundAmpl = 4;
					for "_dummy" from 1 to _numBeeps step 1 do {
						for "_dummy1" from 1 to _soundAmpl step 1 do {	// Play multiple times to aplify -.-
							playSound "hint3";
						};
						sleep 0.1;
					};
				};
			};
			_wasOverAlt = true;
		} else {
			_wasOverAlt = false;
		};
		sleep 0.2;
	};
};