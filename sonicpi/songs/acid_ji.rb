## acid

use_bpm 120
master = range(0.1, 1, 0.01).mirror
mod_range = range(0, 25, 1).mirror
synth_cutoffs = range(60, 80, 0.5).mirror
room_phase = range(1,4,1).mirror

pis="31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989380952572"
$pi=pis.split("").map { |v| v.to_i }.ring

##| live_loop :m, sync: :foo do
##|   tick
##|   with_synth :dsaw do
##|     n = scale(:c, :phrygian)[$pi.look]
##|     t = $pi[look + 1] > 5 ? 2 : 1
##|     dur = $pi[look + 1] > 5 ? 0.125 : 0.25
##|     oct = $pi[look + 2] > 5 ? 12 : 0
##|     t.times do
##|       play n + oct, release: 0.3, cutoff: cosr(100, 20, 0.5),  amp: 0.25, detune: cosr(0.2, 0.1, cosr(3, 1, 4))
##|       sleep dur
##|     end
##|   end
##| end

## rave
##| with_fx(:reverb, room: 0.75, mix: 0.6, damp: 0.5) do
##|   live_loop :foo do
##|     with_synth :tech_saws do
##|       base = ring(0, 3, 5).tick(:b)
##|       [32, 16, 16].ring.look(:b).times do
##|         play [36, 48, 60, 47].ring.tick + base, amp: 1.0, cutoff: cosr(90, 30, 0.125), release: 0.2
##|         sleep 0.125
##|       end
##|     end
##|   end
##| end

live_loop :drum, sync: :acid do
  tick
  sample :bd_haus
  ##| sample :drum_cymbal_closed, hpf: cosr(100, 10, cosr(2, 1, 3)), amp: 0.75 if spread([11, 13].choose, [13, 15].choose).look
  ##| sample :drum_snare_hard, amp: 0.25, hpf: 90 if (spread 5, 11).look
  sleep 1
end

live_loop :acid2 do
  use_synth :tb303
  ##| play 60, attack: 0.1, release: 0.5, cutoff: rrand(60, 80), res: rrand(0.5, 1.0)
  sleep 0.5
end


live_loop :acid do
  use_synth :tb303
  with_fx :reverb, room: room_phase.tick*0.1, damp: 0.5, pre_amp: 1 do
    ##| with_fx :slicer, phase: (room_phase.tick+1)*0.1, wave: 1, mix: 1.0 do
    with_fx :ixi_techno,  amp: 1 do
      s = scale(:E2, :phrygian)
      t = dice 9 > 5 ? 3 : 1
      
      dur = dice 9 > 5 ? 0.5 : 50
      oct = dice 9 > 5 ? 12 : 0
      t.times do
        play s + oct, attack: 0.05, release: rrand(0.05, 0.3), cutoff: synth_cutoffs.tick, pan: rrand(-0.5, 0.5)
        
        sleep dur
        ##| end
      end
    end
  end
  
end


live_loop :ambi, sync: :acid do
  if rand < 0.25
    sample :ambi_lunar_land
    puts :comet_landing
  end
  sleep 8
end







