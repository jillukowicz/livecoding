use_bpm 60

master = range(1,60).mirror
ambient = scale :d3, :minor

live_loop :ambient do
  use_synth :hollow
  with_fx :gverb, spread: 1 do
    with_fx :flanger do
      play ambient.tick, amp: 0.5, attack: master.tick/10, sustain: 3, release: 0.5
    end
  end
  sleep 3
end

live_loop :sample_loop do
  sample :ambi_choir, amp: 0.5, rate: 0.5
  sleep 4
end

live_loop :disturbance do
  if one_in(3)
    with_fx :octaver do
      sample :glitch_bass_g, amp: 2.25, rate: rrand(-0.1, -0.4), release: 6
    end
  end
  sleep 6
end

live_loop :bass do
  use_synth :dtri
  play 40, amp: 0.5, attack: 0.5, sustain: 2, release: 1
  sleep 2
end

live_loop :highs do
  use_synth :beep
  play 80, amp: 0.2, attack: 0.1, sustain: 0.5, release: 0.5
  sleep 1
end
# Welcome to Sonic Pi

