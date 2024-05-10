<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
rslider bounds(296, 162, 100, 100), channel("tempo"), range(0, 5, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

gkNotes[] fillarray 60, 64, 67, 71, 74, 69, 71, 67, 79
gkNoteCnt init 8
gkAdd = 2


instr SEQUENCER 
    
    kCnt init 0 
    kNoteIndex init 0 
    kTempo chnget "tempo"
    kInt chnget "interval"
   
    if kInt = 3 then 
        prints("interval initialized csound")
    endif
    
    kInt = 4

    while kCnt < 8 do
        gkNotes[kCnt] = 48+(kCnt*kInt)
  
        kCnt+=1
    od
    
    if metro(2) == 1 then 
        event "i", "SYNTH", 0, .5, gkNotes[kNoteIndex]
        kNoteIndex  = kNoteIndex<7 ? kNoteIndex +1 : 0 
    endif 
endin

instr SYNTH 
    a1 expon 0.04, 0.2, 0.0002
    ares adsr 0.01, 0.1, 0.01, 0.3
    aOut oscili ares, cpsmidinn(p4)
    aDelR vdelay aOut, 400 , 1000
    aDelL vdelay aOut, 200 , 1000
    amixR ntrpol		aOut, aDelR, 0.2
    amixL ntrpol		aOut, aDelL, 0.2
    aresL = rezzy(amixL, 2000, 1)
    aresR = rezzy(amixR, 2000, 1)
    arevl,arevr   reverbsc 	aresL, aresR, 0.9, 12000, sr, 0.5, 1
    //asig pluck 0.7, 400, cpsmidinn(p4), 0, 5, .1, 10
    out arevl, arevr
    


endin


</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
