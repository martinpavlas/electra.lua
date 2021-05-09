function onMidiMessageReceived (midiInput, midiMessage)
    print ("midi message received: interface=" .. midiInput.interface ..
           " channel=" .. midiMessage.channel .. " type=" .. midiMessage.type ..
           " data1=" .. midiMessage.data1 .. " data2=" .. midiMessage.data2)
end
