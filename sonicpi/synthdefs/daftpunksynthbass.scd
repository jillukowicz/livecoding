(
SynthDef(\daftPunkSynthBass, { arg freq = 60, amp = 0.5, attack = 0.01, decay = 0.3, sustain = 0.5, release = 1.2;
    var sig, env, cutoff;
    env = EnvGen.ar(Env.adsr(attack, decay, sustain, release), doneAction: 2);
    sig = Saw.ar(freq);
    cutoff = LFO.ar(freq: 2, mul: 20, add: freq * 2); // Moving filter cutoff for a funky feel
    sig = LPF.ar(sig, cutoff, 0.5);
    sig = sig * env * amp;
    Out.ar(0, sig ! 2);
}).writeDefFile("/Users/kuba/workspace/processing/sonicpi/synthdefs/")
)
