#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-MX450_BASIC_DEMO0.mk)" "nbproject/Makefile-local-MX450_BASIC_DEMO0.mk"
include nbproject/Makefile-local-MX450_BASIC_DEMO0.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=MX450_BASIC_DEMO0
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_static_buffer_model.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_mapping.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/MX450_BASIC_DEMO0/framework/system/clk/src/sys_clk_static.c ../src/system_config/MX450_BASIC_DEMO0/framework/system/ports/src/sys_ports_static.c ../src/system_config/MX450_BASIC_DEMO0/system_init.c ../src/system_config/MX450_BASIC_DEMO0/system_interrupt.c ../src/system_config/MX450_BASIC_DEMO0/system_exceptions.c ../src/system_config/MX450_BASIC_DEMO0/system_tasks.c ../src/app.c ../src/main.c ../bt_application/bt_app.c ../bt_application/bt_data.c ../bt_application/bt_hardware_profile.c ../bt_application/key.c ../bt_application/key_handler.c ../bt_application/led.c ../bt_application/timer.c "../BT Common/bt_a2dp.c" "../BT Common/bt_command_decode.c" "../BT Common/bt_command_send.c" "../BT Common/bt_hfp.c" "../BT Common/bt_line_in.c" "../BT Common/bt_multi_spk.c" "../BT Common/bt_volume.c" ../Codec/sta369bwdsp_handler.c ../../../../../../framework/system/devcon/src/sys_devcon.c ../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c ../../../../../../framework/system/int/src/sys_int_pic32.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o ${OBJECTDIR}/_ext/382828169/drv_usart_static.o ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/195891987/sys_clk_static.o ${OBJECTDIR}/_ext/766220707/sys_ports_static.o ${OBJECTDIR}/_ext/1823359670/system_init.o ${OBJECTDIR}/_ext/1823359670/system_interrupt.o ${OBJECTDIR}/_ext/1823359670/system_exceptions.o ${OBJECTDIR}/_ext/1823359670/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1205520658/bt_app.o ${OBJECTDIR}/_ext/1205520658/bt_data.o ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o ${OBJECTDIR}/_ext/1205520658/key.o ${OBJECTDIR}/_ext/1205520658/key_handler.o ${OBJECTDIR}/_ext/1205520658/led.o ${OBJECTDIR}/_ext/1205520658/timer.o ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o ${OBJECTDIR}/_ext/1634889738/bt_command_send.o ${OBJECTDIR}/_ext/1634889738/bt_hfp.o ${OBJECTDIR}/_ext/1634889738/bt_line_in.o ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o ${OBJECTDIR}/_ext/1634889738/bt_volume.o ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o ${OBJECTDIR}/_ext/912498863/sys_devcon.o ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o.d ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o.d ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o.d ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/382828169/drv_usart_static.o.d ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o.d ${OBJECTDIR}/_ext/195891987/sys_clk_static.o.d ${OBJECTDIR}/_ext/766220707/sys_ports_static.o.d ${OBJECTDIR}/_ext/1823359670/system_init.o.d ${OBJECTDIR}/_ext/1823359670/system_interrupt.o.d ${OBJECTDIR}/_ext/1823359670/system_exceptions.o.d ${OBJECTDIR}/_ext/1823359670/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1205520658/bt_app.o.d ${OBJECTDIR}/_ext/1205520658/bt_data.o.d ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o.d ${OBJECTDIR}/_ext/1205520658/key.o.d ${OBJECTDIR}/_ext/1205520658/key_handler.o.d ${OBJECTDIR}/_ext/1205520658/led.o.d ${OBJECTDIR}/_ext/1205520658/timer.o.d ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o.d ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o.d ${OBJECTDIR}/_ext/1634889738/bt_command_send.o.d ${OBJECTDIR}/_ext/1634889738/bt_hfp.o.d ${OBJECTDIR}/_ext/1634889738/bt_line_in.o.d ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o.d ${OBJECTDIR}/_ext/1634889738/bt_volume.o.d ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o.d ${OBJECTDIR}/_ext/912498863/sys_devcon.o.d ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o ${OBJECTDIR}/_ext/382828169/drv_usart_static.o ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/195891987/sys_clk_static.o ${OBJECTDIR}/_ext/766220707/sys_ports_static.o ${OBJECTDIR}/_ext/1823359670/system_init.o ${OBJECTDIR}/_ext/1823359670/system_interrupt.o ${OBJECTDIR}/_ext/1823359670/system_exceptions.o ${OBJECTDIR}/_ext/1823359670/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1205520658/bt_app.o ${OBJECTDIR}/_ext/1205520658/bt_data.o ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o ${OBJECTDIR}/_ext/1205520658/key.o ${OBJECTDIR}/_ext/1205520658/key_handler.o ${OBJECTDIR}/_ext/1205520658/led.o ${OBJECTDIR}/_ext/1205520658/timer.o ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o ${OBJECTDIR}/_ext/1634889738/bt_command_send.o ${OBJECTDIR}/_ext/1634889738/bt_hfp.o ${OBJECTDIR}/_ext/1634889738/bt_line_in.o ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o ${OBJECTDIR}/_ext/1634889738/bt_volume.o ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o ${OBJECTDIR}/_ext/912498863/sys_devcon.o ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o

# Source Files
SOURCEFILES=../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_static_buffer_model.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_mapping.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static.c ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/MX450_BASIC_DEMO0/framework/system/clk/src/sys_clk_static.c ../src/system_config/MX450_BASIC_DEMO0/framework/system/ports/src/sys_ports_static.c ../src/system_config/MX450_BASIC_DEMO0/system_init.c ../src/system_config/MX450_BASIC_DEMO0/system_interrupt.c ../src/system_config/MX450_BASIC_DEMO0/system_exceptions.c ../src/system_config/MX450_BASIC_DEMO0/system_tasks.c ../src/app.c ../src/main.c ../bt_application/bt_app.c ../bt_application/bt_data.c ../bt_application/bt_hardware_profile.c ../bt_application/key.c ../bt_application/key_handler.c ../bt_application/led.c ../bt_application/timer.c ../BT Common/bt_a2dp.c ../BT Common/bt_command_decode.c ../BT Common/bt_command_send.c ../BT Common/bt_hfp.c ../BT Common/bt_line_in.c ../BT Common/bt_multi_spk.c ../BT Common/bt_volume.c ../Codec/sta369bwdsp_handler.c ../../../../../../framework/system/devcon/src/sys_devcon.c ../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c ../../../../../../framework/system/int/src/sys_int_pic32.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-MX450_BASIC_DEMO0.mk dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX450F256L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_static_buffer_model.c  .generated_files/flags/MX450_BASIC_DEMO0/986d39649be24829b9613d7b103756762b43ca34 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/823550626" 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o.d" -o ${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_static_buffer_model.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_mapping.c  .generated_files/flags/MX450_BASIC_DEMO0/81695462c0b05ae7ec2b873b143abc74c8be82f5 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/823550626" 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o.d" -o ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_mapping.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/MX450_BASIC_DEMO0/9b218dbbf0eb457711af5fd7c37625533eb30863 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/2052027997" 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/MX450_BASIC_DEMO0/a0dd0f3033f990fbc173fafe6b2d733e61b5acf5 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/2052027997" 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/flags/MX450_BASIC_DEMO0/eec755317105125926756e3695e5beeff70bbc5d .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/382828169" 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/382828169/drv_usart_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static.c  .generated_files/flags/MX450_BASIC_DEMO0/95eaaf2779cece0f057559b4717bfc5854686ff1 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/382828169" 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/382828169/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/382828169/drv_usart_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/flags/MX450_BASIC_DEMO0/4a07e5774fc447132adc2a33b3b1ba15b024a038 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/382828169" 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/195891987/sys_clk_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/system/clk/src/sys_clk_static.c  .generated_files/flags/MX450_BASIC_DEMO0/41e868089699566ef446c6726c1f12e128ea117a .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/195891987" 
	@${RM} ${OBJECTDIR}/_ext/195891987/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/195891987/sys_clk_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/195891987/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/195891987/sys_clk_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/system/clk/src/sys_clk_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/766220707/sys_ports_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/MX450_BASIC_DEMO0/9a8f7186c501b96641bdf0eea8926ccb3f8d362d .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/766220707" 
	@${RM} ${OBJECTDIR}/_ext/766220707/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/766220707/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/766220707/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/766220707/sys_ports_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/system/ports/src/sys_ports_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_init.o: ../src/system_config/MX450_BASIC_DEMO0/system_init.c  .generated_files/flags/MX450_BASIC_DEMO0/9ff197b727fbbf7768892e7dc77b92ff7806537d .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_init.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_init.o ../src/system_config/MX450_BASIC_DEMO0/system_init.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_interrupt.o: ../src/system_config/MX450_BASIC_DEMO0/system_interrupt.c  .generated_files/flags/MX450_BASIC_DEMO0/f89f085ff72a8be9e710ce8494f0e628ed5776bb .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_interrupt.o ../src/system_config/MX450_BASIC_DEMO0/system_interrupt.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_exceptions.o: ../src/system_config/MX450_BASIC_DEMO0/system_exceptions.c  .generated_files/flags/MX450_BASIC_DEMO0/c8f1c6e0903f7bd140c7a091702ea37b1ad88d83 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_exceptions.o ../src/system_config/MX450_BASIC_DEMO0/system_exceptions.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_tasks.o: ../src/system_config/MX450_BASIC_DEMO0/system_tasks.c  .generated_files/flags/MX450_BASIC_DEMO0/89be9b69deff1714f84a99319f5984745b358fda .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_tasks.o ../src/system_config/MX450_BASIC_DEMO0/system_tasks.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/MX450_BASIC_DEMO0/2b636bdac7cf07d402c31df2d58c0cab644620f9 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/MX450_BASIC_DEMO0/94bb954c9916d316e9169141485691794c65d505 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/bt_app.o: ../bt_application/bt_app.c  .generated_files/flags/MX450_BASIC_DEMO0/248ff7001192905588c73d28a67fa47ad84da5af .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/bt_app.o.d" -o ${OBJECTDIR}/_ext/1205520658/bt_app.o ../bt_application/bt_app.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/bt_data.o: ../bt_application/bt_data.c  .generated_files/flags/MX450_BASIC_DEMO0/75f8cc11ca384941adcd0e90a349f168e184e900 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/bt_data.o.d" -o ${OBJECTDIR}/_ext/1205520658/bt_data.o ../bt_application/bt_data.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o: ../bt_application/bt_hardware_profile.c  .generated_files/flags/MX450_BASIC_DEMO0/1c764bd347d67133aea25089b7bd2f118c58fcd5 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o.d" -o ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o ../bt_application/bt_hardware_profile.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/key.o: ../bt_application/key.c  .generated_files/flags/MX450_BASIC_DEMO0/aeb0c349f2079274477e22b6352f98be29855c92 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/key.o.d" -o ${OBJECTDIR}/_ext/1205520658/key.o ../bt_application/key.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/key_handler.o: ../bt_application/key_handler.c  .generated_files/flags/MX450_BASIC_DEMO0/ddbf485538f171310726031083974c4e113f4b83 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key_handler.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key_handler.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/key_handler.o.d" -o ${OBJECTDIR}/_ext/1205520658/key_handler.o ../bt_application/key_handler.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/led.o: ../bt_application/led.c  .generated_files/flags/MX450_BASIC_DEMO0/806467303de0d1ba28691bbf720f0002eee8f285 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/led.o.d" -o ${OBJECTDIR}/_ext/1205520658/led.o ../bt_application/led.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/timer.o: ../bt_application/timer.c  .generated_files/flags/MX450_BASIC_DEMO0/359975260c0d6887af4c74f1face4f49c5d82b38 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/timer.o.d" -o ${OBJECTDIR}/_ext/1205520658/timer.o ../bt_application/timer.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_a2dp.o: ../BT\ Common/bt_a2dp.c  .generated_files/flags/MX450_BASIC_DEMO0/7bf8f74662eddcc958a0c20b85ccd1d6e24a8205 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_a2dp.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o "../BT Common/bt_a2dp.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_command_decode.o: ../BT\ Common/bt_command_decode.c  .generated_files/flags/MX450_BASIC_DEMO0/c938baf5b085dc968f695382e54a84e8d35d02d0 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_command_decode.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o "../BT Common/bt_command_decode.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_command_send.o: ../BT\ Common/bt_command_send.c  .generated_files/flags/MX450_BASIC_DEMO0/331b0f9a3e8850fb8bc5e793a5a0e86fe6e6f189 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_send.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_send.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_command_send.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_command_send.o "../BT Common/bt_command_send.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_hfp.o: ../BT\ Common/bt_hfp.c  .generated_files/flags/MX450_BASIC_DEMO0/a17a271ba7507300391a53dc3a5bfd646f709adb .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_hfp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_hfp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_hfp.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_hfp.o "../BT Common/bt_hfp.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_line_in.o: ../BT\ Common/bt_line_in.c  .generated_files/flags/MX450_BASIC_DEMO0/d285015d6b753f51c5df16124247ce26b22e1ffa .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_line_in.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_line_in.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_line_in.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_line_in.o "../BT Common/bt_line_in.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o: ../BT\ Common/bt_multi_spk.c  .generated_files/flags/MX450_BASIC_DEMO0/d35271c682e4c3d869f3bdddea54d72b847096ad .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o "../BT Common/bt_multi_spk.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_volume.o: ../BT\ Common/bt_volume.c  .generated_files/flags/MX450_BASIC_DEMO0/5adf93ddb57f7fa257b31d2511fa45ff8c33b06c .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_volume.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_volume.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_volume.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_volume.o "../BT Common/bt_volume.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o: ../Codec/sta369bwdsp_handler.c  .generated_files/flags/MX450_BASIC_DEMO0/24ed3f8f93e6f00c5e87832999d68b0f47492d3e .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/2146212583" 
	@${RM} ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o.d" -o ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o ../Codec/sta369bwdsp_handler.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/912498863/sys_devcon.o: ../../../../../../framework/system/devcon/src/sys_devcon.c  .generated_files/flags/MX450_BASIC_DEMO0/c903843cbb8dcefddb8f49150fa1a17d809dbacb .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/912498863" 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/912498863/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/912498863/sys_devcon.o ../../../../../../framework/system/devcon/src/sys_devcon.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o: ../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/MX450_BASIC_DEMO0/9ceeb5d0575fd86f0fee08a4d6e69e04800723fa .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/912498863" 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o ../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/MX450_BASIC_DEMO0/10c40279dd624c91a5a657de7ce6c2b40e9ebfbd .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_static_buffer_model.c  .generated_files/flags/MX450_BASIC_DEMO0/670669d883c0f2ce3449d8a3f9091452a5c57935 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/823550626" 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o.d" -o ${OBJECTDIR}/_ext/823550626/drv_i2c_static_buffer_model.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_static_buffer_model.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_mapping.c  .generated_files/flags/MX450_BASIC_DEMO0/5ca8c90c709ff60c6aed3268a4c7cf073d82c157 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/823550626" 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o.d" -o ${OBJECTDIR}/_ext/823550626/drv_i2c_mapping.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/i2c/src/drv_i2c_mapping.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/MX450_BASIC_DEMO0/2512b33797c5f548c710ca638d4091df7e79e409 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/2052027997" 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2052027997/drv_tmr_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/MX450_BASIC_DEMO0/dd5a640bfba70bdf453738fce6b9caaa22bf6511 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/2052027997" 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2052027997/drv_tmr_mapping.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/flags/MX450_BASIC_DEMO0/1fb3ee7489867a7ede0da938581961eeea9d5778 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/382828169" 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/382828169/drv_usart_mapping.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/382828169/drv_usart_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static.c  .generated_files/flags/MX450_BASIC_DEMO0/90307c0ca4827828e5bdcf81de21451a0b40a466 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/382828169" 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/382828169/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/382828169/drv_usart_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o: ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/flags/MX450_BASIC_DEMO0/5f13adceb0e8a143c652f9243ac8aa95e05e80ea .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/382828169" 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/382828169/drv_usart_static_byte_model.o ../src/system_config/MX450_BASIC_DEMO0/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/195891987/sys_clk_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/system/clk/src/sys_clk_static.c  .generated_files/flags/MX450_BASIC_DEMO0/6283afe6e7270badc11737cb7ae58f95f8e56f50 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/195891987" 
	@${RM} ${OBJECTDIR}/_ext/195891987/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/195891987/sys_clk_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/195891987/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/195891987/sys_clk_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/system/clk/src/sys_clk_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/766220707/sys_ports_static.o: ../src/system_config/MX450_BASIC_DEMO0/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/MX450_BASIC_DEMO0/7403b8d522babff6da3497ddc5811907a01aa40a .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/766220707" 
	@${RM} ${OBJECTDIR}/_ext/766220707/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/766220707/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/766220707/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/766220707/sys_ports_static.o ../src/system_config/MX450_BASIC_DEMO0/framework/system/ports/src/sys_ports_static.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_init.o: ../src/system_config/MX450_BASIC_DEMO0/system_init.c  .generated_files/flags/MX450_BASIC_DEMO0/d0897b3c715f7104c13e85ac3987e23b2ac6173a .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_init.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_init.o ../src/system_config/MX450_BASIC_DEMO0/system_init.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_interrupt.o: ../src/system_config/MX450_BASIC_DEMO0/system_interrupt.c  .generated_files/flags/MX450_BASIC_DEMO0/8da3018cc68a010d9a3ab3da1682ca1b61f30c88 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_interrupt.o ../src/system_config/MX450_BASIC_DEMO0/system_interrupt.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_exceptions.o: ../src/system_config/MX450_BASIC_DEMO0/system_exceptions.c  .generated_files/flags/MX450_BASIC_DEMO0/808fd4e8345abc9caefc78c9b5f1d70314962e8e .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_exceptions.o ../src/system_config/MX450_BASIC_DEMO0/system_exceptions.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1823359670/system_tasks.o: ../src/system_config/MX450_BASIC_DEMO0/system_tasks.c  .generated_files/flags/MX450_BASIC_DEMO0/ff738d395c28d7385c0cc32bd52b2762d9456a9c .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1823359670" 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1823359670/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1823359670/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1823359670/system_tasks.o ../src/system_config/MX450_BASIC_DEMO0/system_tasks.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/MX450_BASIC_DEMO0/76ddce439df19a7d4bdbf6f74199db8032e12311 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/MX450_BASIC_DEMO0/43f663628c3df07bba7c0d0c6c1a1e434c5ef6b5 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/bt_app.o: ../bt_application/bt_app.c  .generated_files/flags/MX450_BASIC_DEMO0/a0d1fd92545ab9a3e2f5657414e726e04ccbbc12 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/bt_app.o.d" -o ${OBJECTDIR}/_ext/1205520658/bt_app.o ../bt_application/bt_app.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/bt_data.o: ../bt_application/bt_data.c  .generated_files/flags/MX450_BASIC_DEMO0/e4a6a3c2c29c061a827c4993547c340ffa066403 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/bt_data.o.d" -o ${OBJECTDIR}/_ext/1205520658/bt_data.o ../bt_application/bt_data.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o: ../bt_application/bt_hardware_profile.c  .generated_files/flags/MX450_BASIC_DEMO0/22d5bebd9a6b544a028a02b9f8d6d8b8cb82fad9 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o.d" -o ${OBJECTDIR}/_ext/1205520658/bt_hardware_profile.o ../bt_application/bt_hardware_profile.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/key.o: ../bt_application/key.c  .generated_files/flags/MX450_BASIC_DEMO0/ca2d53c190deefd6c9a2557022dfd6f34c7e94b .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/key.o.d" -o ${OBJECTDIR}/_ext/1205520658/key.o ../bt_application/key.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/key_handler.o: ../bt_application/key_handler.c  .generated_files/flags/MX450_BASIC_DEMO0/87040e0ad4a49d487d10553cc2c18785dea3af8a .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key_handler.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/key_handler.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/key_handler.o.d" -o ${OBJECTDIR}/_ext/1205520658/key_handler.o ../bt_application/key_handler.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/led.o: ../bt_application/led.c  .generated_files/flags/MX450_BASIC_DEMO0/67fa3df3532a714b09c7577d3851008ac467f3f1 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/led.o.d" -o ${OBJECTDIR}/_ext/1205520658/led.o ../bt_application/led.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1205520658/timer.o: ../bt_application/timer.c  .generated_files/flags/MX450_BASIC_DEMO0/debbc4c772cde740c311b61d48e0408c662f4a15 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1205520658" 
	@${RM} ${OBJECTDIR}/_ext/1205520658/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1205520658/timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1205520658/timer.o.d" -o ${OBJECTDIR}/_ext/1205520658/timer.o ../bt_application/timer.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_a2dp.o: ../BT\ Common/bt_a2dp.c  .generated_files/flags/MX450_BASIC_DEMO0/b63a8ae926a27408b0fc8de699747df9f0ee8e40 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_a2dp.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_a2dp.o "../BT Common/bt_a2dp.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_command_decode.o: ../BT\ Common/bt_command_decode.c  .generated_files/flags/MX450_BASIC_DEMO0/ba7a6f7a6d8f081163c8db330e3dec00f60f4837 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_command_decode.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_command_decode.o "../BT Common/bt_command_decode.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_command_send.o: ../BT\ Common/bt_command_send.c  .generated_files/flags/MX450_BASIC_DEMO0/9c1f13ca42bc7277afc614fba0136a1f0b97f003 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_send.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_command_send.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_command_send.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_command_send.o "../BT Common/bt_command_send.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_hfp.o: ../BT\ Common/bt_hfp.c  .generated_files/flags/MX450_BASIC_DEMO0/744b77b8eab4f5be98616ccd1ac9c9b3190e0cc .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_hfp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_hfp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_hfp.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_hfp.o "../BT Common/bt_hfp.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_line_in.o: ../BT\ Common/bt_line_in.c  .generated_files/flags/MX450_BASIC_DEMO0/c244d9d90812e6ef971a77a4e0567fea7d7689a .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_line_in.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_line_in.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_line_in.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_line_in.o "../BT Common/bt_line_in.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o: ../BT\ Common/bt_multi_spk.c  .generated_files/flags/MX450_BASIC_DEMO0/3c0ae2416ef21d7fc3cfcc24ab9a05272a04160f .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_multi_spk.o "../BT Common/bt_multi_spk.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1634889738/bt_volume.o: ../BT\ Common/bt_volume.c  .generated_files/flags/MX450_BASIC_DEMO0/3f2cab788d5583050e7ba40497a87dfc7be48a89 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/1634889738" 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_volume.o.d 
	@${RM} ${OBJECTDIR}/_ext/1634889738/bt_volume.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1634889738/bt_volume.o.d" -o ${OBJECTDIR}/_ext/1634889738/bt_volume.o "../BT Common/bt_volume.c"    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o: ../Codec/sta369bwdsp_handler.c  .generated_files/flags/MX450_BASIC_DEMO0/a78b86bd62a24be0cc6d306e84a1b711a027f22d .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/2146212583" 
	@${RM} ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o.d" -o ${OBJECTDIR}/_ext/2146212583/sta369bwdsp_handler.o ../Codec/sta369bwdsp_handler.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/912498863/sys_devcon.o: ../../../../../../framework/system/devcon/src/sys_devcon.c  .generated_files/flags/MX450_BASIC_DEMO0/a415cb1aa74ea0e38a286b7d682e2db917eeb726 .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/912498863" 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/912498863/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/912498863/sys_devcon.o ../../../../../../framework/system/devcon/src/sys_devcon.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o: ../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/MX450_BASIC_DEMO0/9d5aa2888e559ceac124f52d3dee8a08e345bcae .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/912498863" 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/912498863/sys_devcon_pic32mx.o ../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/MX450_BASIC_DEMO0/6f93b9803030f4b2092b7ec971319cf3a55e12ba .generated_files/flags/MX450_BASIC_DEMO0/ce386552996d2c589e444fe975685bb21954c48c
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Codec" -ffunction-sections -Os -I"../bt_application" -I"../BT Common" -I"../../../codec" -I"../../../../../framework" -I"../src" -I"../src/system_config/MX450_BASIC_DEMO0" -I"../src/MX450_BASIC_DEMO0" -I"../../../../../../framework" -I"../src/system_config/MX450_BASIC_DEMO0/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../bin/framework/peripheral/PIC32MX450F256L_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_REAL_ICE=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\bin\framework\peripheral\PIC32MX450F256L_peripherals.a      -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC0275F  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1,--defsym=_min_heap_size=0,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../bin/framework/peripheral/PIC32MX450F256L_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\bin\framework\peripheral\PIC32MX450F256L_peripherals.a      -DXPRJ_MX450_BASIC_DEMO0=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Bluetooth_Basic_Demo_BM83_EVB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/MX450_BASIC_DEMO0
	${RM} -r dist/MX450_BASIC_DEMO0

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
