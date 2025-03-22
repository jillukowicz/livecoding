(
SynthDef(\daftPunkSynthFX, { arg freq = 440, amp = 0.5, attack = 0.01, decay = 0.3, sustain = 0.5, release = 1.2;
    var sig, env;
    env = EnvGen.ar(Env.adsr(attack, decay, sustain, release), doneAction: 2);
    sig = Saw.ar(freq) + Pulse.ar(freq * 1.01, 0.5);
    sig = LPF.ar(sig, freq * 2, 0.5);
    sig = sig * env * amp;

    // Adding distortion
    sig = (sig * 2).tanh / 2; // Simple distortion

    // Adding phaser
    sig = Phaser.ar(sig, 4, 0.5, 0.5, 2); // Basic phaser effect

    Out.ar(0, sig ! 2);
}).writeDefFile("/Users/kuba/workspace/processing/sonicpi/synthdefs/")
)
