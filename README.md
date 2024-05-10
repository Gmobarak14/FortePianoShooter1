# FortePianoShooter
What I learned with csound Unity
- Interesting capabilities for procedurally generated sd in Unity
- Would not be my first option for implementing sounds to a game (granted thats not what it is designed for) 
- I am going to continue on this project for sure. It was just a little frustrating coming from a week of pretty intense Wwise study to struggle with a whole new audio platform. There were a lot of moments of struggle where I thought to myself “I know how or have an idea how I could do this with Wwise” but then faced with multiple csoundUnity errors and limitations. It was a lot of learning new things plus a good csound intensive refresher. 

CsoundUnity Issues
- A lot of pops when starting and stopping the scene 
- Frustration with communication with channels between both unity script and csound (, chnget) 
- Not a ton of documentation compared to Wwise and Native Unity audio engine. 
- A lot of clicking sometimes when there are more than ~4 balls. Sometimes I can spam click, other times it freaks out. This is disappointing because I think where this project would shine is when there are a lot of balls you could walk through.

Particular struggles I had in my game 
- The biggest struggle I had was implementing a sequencer. I wanted to increase the tempo when I shot a type of tree and decrease when I shot another. 
- I also wanted to increment step size with the collision from a different game object but I ran into issues. 
- I tried adding another ball that would fire with the space bar and play a different chord and ran into trouble with sounds cutting out and not playing even when I version corrected the ray shooter script back to the OG one ball version. For some reason unity did not like another ball prefab with the CsoundUnity component active because when I disarmed and deleted the component all the sounds worked fine again. 

At the end of the day I still feel like this is still not utilizing the full potential of the link between csound and Unity. It feels like its still a little bit both fancy cabbage and 
straightforward enough that I could do it in Wwise. I wanted to do something like RTPC in CsoundUnity and I am very frustrated that it didn’t end up working. Little things like this make me wish I 
had stuck to Wwise for the final but I am honestly glad that I was able to face this challenge and try something new even if it probably won’t be my go to. 
