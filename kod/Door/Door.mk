##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=Door
ConfigurationName      :=Debug
WorkspacePath          :="C:/Users/Adamt/OneDrive/Chalmers/EDA482 (Mop)/Moplaborationer"
ProjectPath            :=C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Adamt
Date                   :=20/10/2019
CodeLitePath           :=C:/cseapp/CodeLite
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="Door.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostartfiles
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc $(IncludeSwitch)../lib/STM32F4_lib/CMSIS/include $(IncludeSwitch)../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src $(IncludeSwitch)../lib/ 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar.exe rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc.exe
CXXFLAGS :=  -g -O0 -W $(Preprocessors)
CFLAGS   :=  -Wa,-adhln=test.s -g -O0 -mthumb -march=armv6-m  -mfloat-abi=soft -std=c99 -mthumb -march=armv6-m $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\cseapp\CodeLite
ARM_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/door_can.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(ObjectSuffix) $(IntermediateDirectory)/init.GPIO.c$(ObjectSuffix) $(IntermediateDirectory)/functions.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(ObjectSuffix) $(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_CAN.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix) \
	$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_buffer.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/Door.elf ./Debug/Door.s19
	arm-none-eabi-objdump -D -S ./Debug/Door.elf > ./Debug/Door.dass
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/door_can.c$(ObjectSuffix): door_can.c $(IntermediateDirectory)/door_can.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/door_can.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/door_can.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/door_can.c$(DependSuffix): door_can.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/door_can.c$(ObjectSuffix) -MF$(IntermediateDirectory)/door_can.c$(DependSuffix) -MM door_can.c

$(IntermediateDirectory)/door_can.c$(PreprocessSuffix): door_can.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/door_can.c$(PreprocessSuffix) door_can.c

$(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(ObjectSuffix): ../lib/CANEncodeDecode.c $(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/CANEncodeDecode.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(DependSuffix): ../lib/CANEncodeDecode.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(DependSuffix) -MM ../lib/CANEncodeDecode.c

$(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(PreprocessSuffix): ../lib/CANEncodeDecode.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_CANEncodeDecode.c$(PreprocessSuffix) ../lib/CANEncodeDecode.c

$(IntermediateDirectory)/init.GPIO.c$(ObjectSuffix): init.GPIO.c $(IntermediateDirectory)/init.GPIO.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/init.GPIO.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/init.GPIO.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/init.GPIO.c$(DependSuffix): init.GPIO.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/init.GPIO.c$(ObjectSuffix) -MF$(IntermediateDirectory)/init.GPIO.c$(DependSuffix) -MM init.GPIO.c

$(IntermediateDirectory)/init.GPIO.c$(PreprocessSuffix): init.GPIO.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/init.GPIO.c$(PreprocessSuffix) init.GPIO.c

$(IntermediateDirectory)/functions.c$(ObjectSuffix): functions.c $(IntermediateDirectory)/functions.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/functions.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/functions.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/functions.c$(DependSuffix): functions.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/functions.c$(ObjectSuffix) -MF$(IntermediateDirectory)/functions.c$(DependSuffix) -MM functions.c

$(IntermediateDirectory)/functions.c$(PreprocessSuffix): functions.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/functions.c$(PreprocessSuffix) functions.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/misc.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/misc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/misc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/misc.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/misc.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_misc.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/misc.c

$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rng.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_can.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c

$(IntermediateDirectory)/up_lib_CAN.c$(ObjectSuffix): ../lib/CAN.c $(IntermediateDirectory)/up_lib_CAN.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/CAN.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_CAN.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_CAN.c$(DependSuffix): ../lib/CAN.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_CAN.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_CAN.c$(DependSuffix) -MM ../lib/CAN.c

$(IntermediateDirectory)/up_lib_CAN.c$(PreprocessSuffix): ../lib/CAN.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_CAN.c$(PreprocessSuffix) ../lib/CAN.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c

$(IntermediateDirectory)/up_lib_buffer.c$(ObjectSuffix): ../lib/buffer.c $(IntermediateDirectory)/up_lib_buffer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/buffer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_buffer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_buffer.c$(DependSuffix): ../lib/buffer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_buffer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_buffer.c$(DependSuffix) -MM ../lib/buffer.c

$(IntermediateDirectory)/up_lib_buffer.c$(PreprocessSuffix): ../lib/buffer.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_buffer.c$(PreprocessSuffix) ../lib/buffer.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


