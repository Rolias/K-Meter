# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug32)
  OBJDIR     = ../../../bin/intermediate_linux/standalone_surround_debug/x32
  TARGETDIR  = ../../../bin
  TARGET     = $(TARGETDIR)/kmeter_surround_debug
  DEFINES   += -DLINUX=1 -D_DEBUG=1 -DDEBUG=1 -DJUCE_CHECK_MEMORY_LEAKS=1 -DKMETER_SURROUND=1 -DJucePlugin_Build_LV2=0 -DJucePlugin_Build_Standalone=1 -DJucePlugin_Build_VST=0 -DJUCE_ALSA=1 -DJUCE_JACK=1 -DJUCE_ASIO=0 -DJUCE_WASAPI=0 -DJUCE_DIRECTSOUND=0
  INCLUDES  += -I../../../JuceLibraryCode -I../../../libraries/juce/modules -I../../../Source/common -I../../../libraries -I/usr/include -I/usr/include/freetype2
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -m32 -fno-inline -ggdb -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m32 -L/usr/lib32 ../../../libraries/fftw3/bin/linux/i386/libfftw3f.a -Wl,--no-undefined
  LIBS      += -ldl -lfreetype -lpthread -lrt -lX11 -lXext -lasound
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../bin/intermediate_linux/standalone_surround_release/x32
  TARGETDIR  = ../../../bin
  TARGET     = $(TARGETDIR)/kmeter_surround
  DEFINES   += -DLINUX=1 -DNDEBUG=1 -DJUCE_CHECK_MEMORY_LEAKS=0 -DKMETER_SURROUND=1 -DJucePlugin_Build_LV2=0 -DJucePlugin_Build_Standalone=1 -DJucePlugin_Build_VST=0 -DJUCE_ALSA=1 -DJUCE_JACK=1 -DJUCE_ASIO=0 -DJUCE_WASAPI=0 -DJUCE_DIRECTSOUND=0
  INCLUDES  += -I../../../JuceLibraryCode -I../../../libraries/juce/modules -I../../../Source/common -I../../../libraries -I/usr/include -I/usr/include/freetype2
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O3 -fomit-frame-pointer -Wall -m32 -fvisibility=hidden -pipe -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m32 -L/usr/lib32 ../../../libraries/fftw3/bin/linux/i386/libfftw3f.a -Wl,--no-undefined
  LIBS      += -ldl -lfreetype -lpthread -lrt -lX11 -lXext -lasound
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../bin/intermediate_linux/standalone_surround_debug/x64
  TARGETDIR  = ../../../bin
  TARGET     = $(TARGETDIR)/kmeter_surround_debug_x64
  DEFINES   += -DLINUX=1 -D_DEBUG=1 -DDEBUG=1 -DJUCE_CHECK_MEMORY_LEAKS=1 -DKMETER_SURROUND=1 -DJucePlugin_Build_LV2=0 -DJucePlugin_Build_Standalone=1 -DJucePlugin_Build_VST=0 -DJUCE_ALSA=1 -DJUCE_JACK=1 -DJUCE_ASIO=0 -DJUCE_WASAPI=0 -DJUCE_DIRECTSOUND=0
  INCLUDES  += -I../../../JuceLibraryCode -I../../../libraries/juce/modules -I../../../Source/common -I../../../libraries -I/usr/include -I/usr/include/freetype2
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -m64 -fno-inline -ggdb -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m64 -L/usr/lib64 ../../../libraries/fftw3/bin/linux/amd64/libfftw3f.a -Wl,--no-undefined
  LIBS      += -ldl -lfreetype -lpthread -lrt -lX11 -lXext -lasound
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../bin/intermediate_linux/standalone_surround_release/x64
  TARGETDIR  = ../../../bin
  TARGET     = $(TARGETDIR)/kmeter_surround_x64
  DEFINES   += -DLINUX=1 -DNDEBUG=1 -DJUCE_CHECK_MEMORY_LEAKS=0 -DKMETER_SURROUND=1 -DJucePlugin_Build_LV2=0 -DJucePlugin_Build_Standalone=1 -DJucePlugin_Build_VST=0 -DJUCE_ALSA=1 -DJUCE_JACK=1 -DJUCE_ASIO=0 -DJUCE_WASAPI=0 -DJUCE_DIRECTSOUND=0
  INCLUDES  += -I../../../JuceLibraryCode -I../../../libraries/juce/modules -I../../../Source/common -I../../../libraries -I/usr/include -I/usr/include/freetype2
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O3 -fomit-frame-pointer -Wall -m64 -fvisibility=hidden -pipe -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -m64 -L/usr/lib64 ../../../libraries/fftw3/bin/linux/amd64/libfftw3f.a -Wl,--no-undefined
  LIBS      += -ldl -lfreetype -lpthread -lrt -lX11 -lXext -lasound
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/frut_widget.o \
	$(OBJDIR)/frut_math.o \
	$(OBJDIR)/frut_skin.o \
	$(OBJDIR)/frut_parameter.o \
	$(OBJDIR)/frut_audio.o \
	$(OBJDIR)/plugin_editor.o \
	$(OBJDIR)/rate_converter.o \
	$(OBJDIR)/standalone_application.o \
	$(OBJDIR)/plugin_processor.o \
	$(OBJDIR)/peak_label.o \
	$(OBJDIR)/kmeter.o \
	$(OBJDIR)/meter_ballistics.o \
	$(OBJDIR)/average_level_filtered.o \
	$(OBJDIR)/true_peak_meter.o \
	$(OBJDIR)/plugin_parameters.o \
	$(OBJDIR)/overflow_meter.o \
	$(OBJDIR)/audio_file_player.o \
	$(OBJDIR)/meter_bar.o \
	$(OBJDIR)/skin.o \
	$(OBJDIR)/window_validation_content.o \
	$(OBJDIR)/fftw_runner.o \
	$(OBJDIR)/juce_audio_basics.o \
	$(OBJDIR)/juce_audio_devices.o \
	$(OBJDIR)/juce_audio_formats.o \
	$(OBJDIR)/juce_audio_plugin_client_utils.o \
	$(OBJDIR)/juce_audio_processors.o \
	$(OBJDIR)/juce_audio_utils.o \
	$(OBJDIR)/juce_core.o \
	$(OBJDIR)/juce_cryptography.o \
	$(OBJDIR)/juce_data_structures.o \
	$(OBJDIR)/juce_events.o \
	$(OBJDIR)/juce_graphics.o \
	$(OBJDIR)/juce_gui_basics.o \
	$(OBJDIR)/juce_gui_extra.o \
	$(OBJDIR)/juce_video.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking kmeter_standalone_surround
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning kmeter_standalone_surround
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/frut_widget.o: ../../../Source/common/amalgamated/frut_widget.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/frut_math.o: ../../../Source/common/amalgamated/frut_math.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/frut_skin.o: ../../../Source/common/amalgamated/frut_skin.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/frut_parameter.o: ../../../Source/common/amalgamated/frut_parameter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/frut_audio.o: ../../../Source/common/amalgamated/frut_audio.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/plugin_editor.o: ../../../Source/plugin_editor.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/rate_converter.o: ../../../Source/rate_converter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/standalone_application.o: ../../../Source/standalone_application.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/plugin_processor.o: ../../../Source/plugin_processor.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/peak_label.o: ../../../Source/peak_label.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/kmeter.o: ../../../Source/kmeter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/meter_ballistics.o: ../../../Source/meter_ballistics.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/average_level_filtered.o: ../../../Source/average_level_filtered.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/true_peak_meter.o: ../../../Source/true_peak_meter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/plugin_parameters.o: ../../../Source/plugin_parameters.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/overflow_meter.o: ../../../Source/overflow_meter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/audio_file_player.o: ../../../Source/audio_file_player.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/meter_bar.o: ../../../Source/meter_bar.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/skin.o: ../../../Source/skin.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/window_validation_content.o: ../../../Source/window_validation_content.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/fftw_runner.o: ../../../Source/fftw_runner.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_audio_basics.o: ../../../JuceLibraryCode/juce_audio_basics.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_audio_devices.o: ../../../JuceLibraryCode/juce_audio_devices.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_audio_formats.o: ../../../JuceLibraryCode/juce_audio_formats.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_audio_plugin_client_utils.o: ../../../JuceLibraryCode/juce_audio_plugin_client_utils.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_audio_processors.o: ../../../JuceLibraryCode/juce_audio_processors.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_audio_utils.o: ../../../JuceLibraryCode/juce_audio_utils.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_core.o: ../../../JuceLibraryCode/juce_core.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_cryptography.o: ../../../JuceLibraryCode/juce_cryptography.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_data_structures.o: ../../../JuceLibraryCode/juce_data_structures.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_events.o: ../../../JuceLibraryCode/juce_events.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_graphics.o: ../../../JuceLibraryCode/juce_graphics.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_gui_basics.o: ../../../JuceLibraryCode/juce_gui_basics.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_gui_extra.o: ../../../JuceLibraryCode/juce_gui_extra.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/juce_video.o: ../../../JuceLibraryCode/juce_video.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
