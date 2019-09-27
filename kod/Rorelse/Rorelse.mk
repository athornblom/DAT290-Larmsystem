##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=Rorelse
ConfigurationName      :=Debug
WorkspacePath          :=C:/Users/Erik/Documents/Datateknisktprojekt/kod
ProjectPath            :=C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Erik
Date                   :=27/09/2019
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
ObjectsFileList        :="Rorelse.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostartfiles
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc $(IncludeSwitch)../lib/STM32F4_lib/CMSIS/include $(IncludeSwitch)../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src 
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
Objects0=$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(ObjectSuffix) $(IntermediateDirectory)/main_rorelse.c$(ObjectSuffix) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix) 



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
	arm-none-eabi-objcopy -S -O srec  ./Debug/Rorelse.elf ./Debug/Rorelse.s19
	arm-none-eabi-objdump -D -S ./Debug/Rorelse.elf > ./Debug/Rorelse.dass
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_gpio.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Examples/WWDG/WWDG_Example/system_stm32f4xx.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Examples/WWDG/WWDG_Example/system_stm32f4xx.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Examples/WWDG/WWDG_Example/system_stm32f4xx.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Examples/WWDG/WWDG_Example/system_stm32f4xx.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Examples/WWDG/WWDG_Example/system_stm32f4xx.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Examples_WWDG_WWDG_Example_system_stm32f4xx.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Examples/WWDG/WWDG_Example/system_stm32f4xx.c

$(IntermediateDirectory)/main_rorelse.c$(ObjectSuffix): main_rorelse.c $(IntermediateDirectory)/main_rorelse.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse/main_rorelse.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main_rorelse.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main_rorelse.c$(DependSuffix): main_rorelse.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main_rorelse.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main_rorelse.c$(DependSuffix) -MM main_rorelse.c

$(IntermediateDirectory)/main_rorelse.c$(PreprocessSuffix): main_rorelse.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main_rorelse.c$(PreprocessSuffix) main_rorelse.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(DependSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(DependSuffix) -MM ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c

$(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(PreprocessSuffix): ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_lib_STM32F4_lib_STM32F4xx_StdPeriph_Driver_src_stm32f4xx_rcc.c$(PreprocessSuffix) ../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


