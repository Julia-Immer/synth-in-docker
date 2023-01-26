import synth


print("running synth app - dummy version")

frequency = input("Input a frequency you want to hear. Must be integer : ")

frequency = float(frequency)

synth.play_sound(frequency)

    