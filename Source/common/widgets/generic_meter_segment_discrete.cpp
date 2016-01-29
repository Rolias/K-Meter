/* ----------------------------------------------------------------------------

   MZ common JUCE
   ==============
   Common classes for use with the JUCE library

   Copyright (c) 2010-2016 Martin Zuther (http://www.mzuther.de/)

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

#include "generic_meter_segment_discrete.h"

/// Create a new discrete meter segment, complete with peak marker.
///
/// > #### Internals
/// >
/// > The meter segment's state depends on two levels, the normal
/// > (usually average) level and the discrete (usually peak) level:
/// >
/// > 1. upper and lower threshold
/// >
/// >    upper threshold = lower threshold + display range
/// >
/// > 2. normal level >= upper threshold
/// >
/// >    segment is fully lit
/// >
/// > 3. lower threshold <= discrete level < upper threshold
/// >
/// >    segment is fully lit
/// >
/// > 4. normal level < lower threshold
/// >
/// >    segment is dark
/// >
/// > 5. otherwise
/// >
/// >    level affects segment's brightness
/// >
/// > The segment's peak marker is lit when any level peak lies
/// > between the upper and lower threshold (or on the lower
/// > threshold).  If **isTopmost** is **true**, however, the
/// > segment's peak marker is lit when any level peak reaches or
/// > exceeds the lower threshold.
///
GenericMeterSegmentDiscrete::GenericMeterSegmentDiscrete()
{
    // initialise meter segment's brightness (0.0 is dark, 1.0 is
    // fully lit)
    segmentBrightness_ = 0.0f;
    outlineBrightness_ = 0.0f;

    // lowest level of a 24-bit-signal in decibels
    float initialLevel = -144.0f;

    // initialise thresholds and whether this segment the topmost
    // segment
    setThresholdAndRange(initialLevel, 1.0f, false);

    // make sure that segment is drawn after initialisation
    setLevels(initialLevel, initialLevel, initialLevel, initialLevel);
}


/// Set lower threshold, display range and whether the segment is the
/// topmost in a meter bar.
///
/// @param lowerThreshold lower threshold level (in decibels)
///
/// @param thresholdRange difference between lower and upper level
///        threshold (in decibels)
///
/// @param isTopmost if set to **true**, the segment has no upper
///        level threshold
///
/// @return return new upper threshold of segment (may be useful for
///         creating continuous meters)
///
float GenericMeterSegmentDiscrete::setThresholdAndRange(
    float lowerThreshold, float thresholdRange, bool isTopmost)

{
    // set lower level threshold (in decibels)
    lowerThreshold_ = lowerThreshold;

    // set level range above lower threshold (in decibels)
    thresholdRange_ = thresholdRange;

    // set upper level threshold (in decibels)
    upperThreshold_ = lowerThreshold_ + thresholdRange_;

    // is there a meter segment beyond this?
    isTopmost_ = isTopmost;

    // peak level marker is currently off
    displayPeakMarker_ = false;

    // return upper threshold (may be useful for creating continuous
    // meters)
    return upperThreshold_;
}


/// Set colours of segment and peak marker.
///
/// @param segmentColour colour of the segment
///
/// @param peakMarkerColour colour of the peak marker
///
void GenericMeterSegmentDiscrete::setColours(
    const Colour &segmentColour, const Colour &peakMarkerColour)

{
    // initialise segment colour
    segmentColour_ = segmentColour;

    // initialise peak marker's colour
    peakMarkerColour_ = peakMarkerColour;

    // redraw meter segment
    repaint();
}


/// Paint segment.
///
/// @param g the graphics context that must be used to do the drawing
///        operations
///
void GenericMeterSegmentDiscrete::paint(
    Graphics &g)

{
    // get meter segment's dimensions
    int tempWidth = getWidth();
    int tempHeight = getHeight();

    // initialise colours from brightness
    Colour segmentColour = segmentColour_.withBrightness(segmentBrightness_);
    Colour outlineColour = segmentColour.withBrightness(outlineBrightness_);

    // set segment colour
    g.setColour(segmentColour);

    // fill meter segment, but leave a border of two pixels for
    // outline and peak marker
    g.fillRect(2, 2, tempWidth - 4, tempHeight - 4);

    // set outline colour
    g.setColour(outlineColour);

    // draw outline, but leave a border of one pixel for peak marker
    g.drawRect(1, 1, tempWidth - 2, tempHeight - 2);

    // if peak marker is lit, draw peak marker around meter segment
    // (width: 1 pixel)
    if (displayPeakMarker_)
    {
        g.setColour(peakMarkerColour_);
        g.drawRect(0, 0, tempWidth, tempHeight);
    }
}


/// Called when this component's visibility changes.
///
/// If this function did not exist, the meter segment wouldn't be
/// drawn until the first level change!
void GenericMeterSegmentDiscrete::visibilityChanged()
{
}


/// Called when this component's size has been changed.
///
void GenericMeterSegmentDiscrete::resized()
{
}


/// Set discrete (peak) and normal (average) levels.
///
/// @param normalLevel new normal level
///
/// @param normalLevelPeak new normal peak level
///
/// @param discreteLevel new discrete level
///
/// @param discreteLevelPeak new discrete peak level
///
void GenericMeterSegmentDiscrete::setLevels(
    float normalLevel, float normalLevelPeak,
    float discreteLevel, float discreteLevelPeak)

{
    // store old brightness and peak marker values
    float segmentBrightnessOld = segmentBrightness_;
    bool displayPeakMarkerOld = displayPeakMarker_;

    // normal level lies on or above upper threshold, so fully light
    // meter segment
    if (normalLevel >= upperThreshold_)
    {
        segmentBrightness_ = 0.97f;
        outlineBrightness_ = 0.90f;
    }
    // discrete level lies within thresholds or on lower threshold, so
    // fully light meter segment
    else if ((discreteLevel >= lowerThreshold_) &&
             (discreteLevel < upperThreshold_))
    {
        segmentBrightness_ = 0.97f;
        outlineBrightness_ = 0.90f;
    }
    // normal level lies below lower threshold, so set meter segment
    // to dark
    else if (normalLevel < lowerThreshold_)
    {
        segmentBrightness_ = 0.25f;
        outlineBrightness_ = 0.30f;
    }
    // normal level lies within thresholds or on lower threshold, so
    // calculate brightness from current level
    else
    {
        segmentBrightness_ = (normalLevel - lowerThreshold_) / thresholdRange_;
        outlineBrightness_ = segmentBrightness_;

        // to look well, meter segments should be left with some
        // colour and not have maximum brightness
        segmentBrightness_ = segmentBrightness_ * 0.72f + 0.25f;
        outlineBrightness_ = outlineBrightness_ * 0.60f + 0.30f;
    }

    // there is no meter segment beyond this; light peak marker if
    // peak level is on or above lower threshold
    if (isTopmost_)
    {
        // light peak marker ("normal" peak level)
        if (normalLevelPeak >= lowerThreshold_)
        {
            displayPeakMarker_ = true;
        }
        // light peak marker ("discrete" peak level)
        else if (discreteLevelPeak >= lowerThreshold_)
        {
            displayPeakMarker_ = true;
        }
        // peak marker is off
        else
        {
            displayPeakMarker_ = false;
        }
    }
    // otherwise, light peak marker if peak level lies within
    // thresholds or on lower threshold
    else
    {
        // light peak marker ("normal" peak level)
        if ((normalLevelPeak >= lowerThreshold_) &&
                (normalLevelPeak < upperThreshold_))
        {
            displayPeakMarker_ = true;
        }
        // light peak marker ("discrete" peak level)
        else if ((discreteLevelPeak >= lowerThreshold_) &&
                 (discreteLevelPeak < upperThreshold_))
        {
            displayPeakMarker_ = true;
        }
        // peak marker is off
        else
        {
            displayPeakMarker_ = false;
        }
    }

    // re-paint meter segment only when brightness or peak marker have
    // changed
    if ((segmentBrightness_ != segmentBrightnessOld) ||
            (displayPeakMarker_ != displayPeakMarkerOld))
    {
        repaint();
    }
}


// Local Variables:
// ispell-local-dictionary: "british"
// End:
