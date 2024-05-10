<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr SEQ
	kNotes[] fillarray 0,0,0,0,0,0,0,0
	kBeat init 0 
	kTempo chnget "tempo"
	
	if metro(kTempo) == 1 then
		if kNotes[kBeat] ==1 then
			event "i", "SYNTH", 0, 5, kBeat
		endif 
		chnset kBeat, "beat"
		kBeat = (kBeat<7 ? kbeat+1 :0)
	endif
	
	kUpdateIndex chnget "updateTable"
	
	if changed(kUpdateIndex) == 1 then 
		kNotes[kUpdateIndex] = kNotes[kUpdateIndex]==1 ? 0 : 1
	endif
endin

instr SYNTH 
	a1 expon .1, p3, 0.001 
	aOut oscili a1, p4*100
	outs aOut, aOut
endin
</CsInstruments>
<CsScore>
i"SEQ" 0 [3600*12] 

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
