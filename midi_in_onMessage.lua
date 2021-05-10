-- Receiving MIDI messages
--
-- The callbacks to process incoming MIDI messages. There is one general
-- callback function onMessage and an array of callbacks for specific
-- MIDI messages.
--
-- The midiInput.interface is a string currently. I would like to change
-- it to a numeric identifier.
--
-- The Sysex messages are intentionally trimmed max length of 256 bytes.
--
--
-- Generic midiMessage:
--
-- midiMessage = {
--   channel = 1,
--   type = CONTROL_CHANGE,
--   data1 = 1,
--   data2 = 127
-- }
--
-- Type specific midiMessage:
--
-- midiMessage = {
--   channel = 1,
--   type = CONTROL_CHANGE,
--   controllerNumber = 1,
--   value = 127
-- }
--
-- Sysex midiMessage:
--
-- midiMessage = {
--   type = SYSEX,
--   data = { 67, 32, 0 }
-- }

function midi.onMessage (midiInput, midiMessage)
    if midiMessage.type == SYSEX then
        print ("sysex message received: interface=" .. midiInput.interface ..
               " data=[" .. table.concat (midiMessage.data,", ") .. "]")
    else
        -- generic approach using the data1 and data2
        print ("midi message received: interface=" .. midiInput.interface ..
               " channel=" .. midiMessage.channel ..
               " type=" .. midiMessage.type ..
               " data1=" .. midiMessage.data1 ..
               " data2=" .. midiMessage.data2)

        -- Message type specific attributes
        if midiMessage.type == NOTE_ON then
            print ("noteOn received: interface=" .. midiInput.interface ..
                   " channel=" .. midiMessage.channel ..
                   " noteNumber=" .. midiMessage.noteNumber ..
                   " velocity=" .. midiMessage.velocity)
        end
    end
end
