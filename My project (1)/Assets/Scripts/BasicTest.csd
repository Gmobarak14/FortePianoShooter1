<Cabbage>
form caption ("Basic Test"), size(300, 100), pluginId("def1")

hslider bounds(0, 0, 300, 50) range(20, 16000, 440, 1, 0.001) valueTextBox(1) channel("freqSlider") value(440) velocity(50)

button bounds(66, 56, 80, 40) channel("trigger")
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
;-n -d -m0d 
;-odac
-n ; -m0d
</CsOptions>
<CsInstruments> 
sr 	= 	48000 
ksmps 	= 	64
nchnls 	= 	2
0dbfs	=	1 

instr Trig
    kTrig chnget "Trigger"
    if changed(kTrig) == 1 then 
        event "i", "2", 0, 0.5
      endif
endin


instr 1

kNotes[] init 6
kNotes[] fillarray 261.63, 329.63, 392, 493.88, 587.33, 880.00

//kRnd randomh 0, 5
kRnd randomh 0, 5, 8, 2

aEnv mxadsr 0.01, 0.2, 0.2, 0.2 
printks "kRnd= %d\n", 0, kRnd
//a1 oscil aEnv, chnget:k("freqSlider") , 1
a1 oscil aEnv, kNotes[kRnd] , 1
ares nreverb a1, 0.4, 0.7
amix ntrpol		a1, ares, 0.3
outs amix, amix
//chnget:k("freqSlider")
endin



instr 2
kNotes[] init 6
kNotes[] fillarray 261.63, 329.63, 392, 493.88, 587.33, 880.00
kRnd randomh 0, 5, 8, 2

kenv mxadsr 0.01, 0.2, 0.8, 0.2
kvib  linseg 0, 0.5, 0, 1, 1, 2.5, 1
kvamp = kvib * 0.01
abow  wgbow kenv, kNotes[kRnd] , 5, 0.5, kvib, kvamp, 1
outs abow, abow
endin



</CsInstruments>
<CsScore>
f0 z
//i1 0 z 
f1 0 4096 10 1
f2 0 2048 10 1
//i1 0 10
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
