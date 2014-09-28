/* ----------------------------------------------------------------------------

   K-Meter
   =======
   Implementation of a K-System meter according to Bob Katz' specifications

   Copyright (c) 2010-2014 Martin Zuther (http://www.mzuther.de/)

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Thank you for using free software!

---------------------------------------------------------------------------- */

#ifndef __AUDIO_RING_BUFFER_H__
#define __AUDIO_RING_BUFFER_H__

#define RING_BUFFER_MEM_TEST 255.0f

class AudioRingBuffer;

#include "../JuceLibraryCode/JuceHeader.h"
#include "plugin_processor.h"


//==============================================================================
/**
*/
class AudioRingBuffer
{
public:
    AudioRingBuffer(const String& buffer_name, const unsigned int channels, const unsigned int length, const unsigned int pre_delay, const unsigned int chunk_size);
    ~AudioRingBuffer();

    void clear();
    void setCallbackClass(KmeterAudioProcessor* callback_class);

    String getBufferName();
    unsigned int getCurrentPosition();
    unsigned int getSamplesInBuffer();
    unsigned int getBufferLength();
    unsigned int getTotalLength();
    unsigned int getPreDelay();

    float getSample(const unsigned int channel, const unsigned int relative_position, const unsigned int pre_delay);

    unsigned int addSamples(AudioSampleBuffer& source, const unsigned int sourceStartSample, const unsigned int numSamples);
    void copyToBuffer(AudioSampleBuffer& destination, const unsigned int destStartSample, const unsigned int numSamples, const unsigned int pre_delay);

    float getMagnitude(const unsigned int channel, const unsigned int numSamples, const unsigned int pre_delay);
    float getRMSLevel(const unsigned int channel, const unsigned int numSamples, const unsigned int pre_delay);

private:
    JUCE_LEAK_DETECTOR(AudioRingBuffer);

    void clearCallbackClass();
    void triggerFullBuffer(AudioSampleBuffer& buffer, const unsigned int uChunkSize, const unsigned int uBufferPosition, const unsigned int uProcessedSamples);

    KmeterAudioProcessor* pCallbackClass;
    String strBufferName;

    unsigned int uChannels;
    unsigned int uLength;
    unsigned int uPreDelay;
    unsigned int uTotalLength;
    unsigned int uChunkSize;

    unsigned int uCurrentPosition;
    unsigned int uSamplesInBuffer;
    unsigned int* uChannelOffset;

    float* pAudioData;
};


#endif  // __AUDIO_RING_BUFFER_H__


// Local Variables:
// ispell-local-dictionary: "british"
// End:
