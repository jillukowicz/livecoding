def cosr(center, range, cycle)
  return (Math.cos(vt*cycle) * range) + center
end

with_fx(:reverb, room: 0.75, mix: 0.6, damp: 0.5) do
  live_loop :ranger do
    with_synth :tech_saws do
      base = ring(0, 3, 5).tick(:base)
      [32, 16, 16].ring.look(:base).times do
        play [36, 48, 60, 47].ring.tick + base, amp: 1.0, cutoff: cosr(90, 30, 0.125), release: 0.2
        sleep 0.125
      end
    end
  end

  live_loop :drums, sync: :foo do
  tick
  sample :bd_haus if spread([4].choose, 16).look
  sample :drum_cymbal_closed, hpf: cosr(100, 10, cosr(2, 1, 3)), amp: 0.75 if spread([11, 13].choose, [13, 15].choose).look
  sample :drum_snare_hard, amp: 0.25, hpf: 90 if (spread 5, 11).look
  sleep 0.125
end
