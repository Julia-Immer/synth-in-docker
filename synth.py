from synthesizer import Player, Synthesizer, Waveform



def make_wave(frequency):
    synthesizer = Synthesizer(osc1_waveform=Waveform.sine, osc1_volume=1.0, use_osc2=False)
    wave = synthesizer.generate_constant_wave(frequency, 3.0)
    return wave

def play_sound(frequency):
    player = Player()
    player.open_stream()
    player.play_wave(make_wave(frequency))