<Cabbage>
form caption("Untitled") size(450, 300), guiMode("queue") pluginId("def1")
button bounds (30,19,80,40) channel ("Trigger")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

ga1		init	0


instr Trig
    kTrig chnget "Trigger"
    if changed(kTrig) == 1 then 
        event "i", "Synth", 0, 0.2
      endif
endin


instr 2
   //aEnv expon 1, p3, 0.001
  // kfilt chnget "cutoff"
   //aEnv adsr chnget:i("attack"), 0.2, 0.5, chnget:i("release")
    aEnv expon 1, p3, 0.001
    aSig oscili aEnv, 400+(1-aEnv)*400 
 outs aSig,aSig
 endin
 
instr Synth
kNotes[] init 6
kNotes[] fillarray 261.63, 329.63, 392, 493.88, 587.33, 880.00

//kRnd randomh 0, 5
kRnd randomh 0, 5, 8, 3

aEnv mxadsr 0.01, 0.2, 0.2, 0.2 
printks "kRnd= %d\n", 0, kRnd
//a1 oscil aEnv, chnget:k("freqSlider") , 1
a1 oscil aEnv, kNotes[kRnd] , 1
ares nreverb a1, 0.4, 0.7
amix ntrpol		a1, ares, 0.3
outs amix, amix
//chnget:k("freqSlider")

endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
f1 0 4096 10 1
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
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
