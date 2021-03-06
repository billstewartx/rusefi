# List of all the board related files.
BOARDCPPSRC =  $(PROJECT_DIR)/config/boards/proteus/board_configuration.cpp \
				$(PROJECT_DIR)/config/boards/proteus/adc_hack.cpp
BOARDINC = $(PROJECT_DIR)/config/boards/proteus

# Target processor details
ifeq ($(PROJECT_CPU),ARCH_STM32F4)
else
  PROTEUS_LEGACY = TRUE
endif

# Override DEFAULT_ENGINE_TYPE
DDEFS += -DEFI_USE_OSC=TRUE
DDEFS += -DLED_CRITICAL_ERROR_BRAIN_PIN=GPIOE_3
DDEFS += -DFIRMWARE_ID=\"proteus\" -DDEFAULT_ENGINE_TYPE=PROTEUS_DEFAULTS
DDEFS += -DEFI_ICU_INPUTS=FALSE -DHAL_TRIGGER_USE_PAL=TRUE
DDEFS += -DEFI_LOGIC_ANALYZER=FALSE
# todo: refactor HAL_VSS_USE_PAL
DDEFS += -DHAL_VSS_USE_PAL=TRUE
DDEFS += -DSTM32_ADC_USE_ADC3=TRUE
DDEFS += -DEFI_SOFTWARE_KNOCK=TRUE
DDEFS += -DEFI_CONSOLE_TX_BRAIN_PIN=GPIO_UNASSIGNED -DEFI_CONSOLE_RX_BRAIN_PIN=GPIO_UNASSIGNED

# USB mass storage support
DDEFS += -DHAL_USE_COMMUNITY=TRUE -DHAL_USE_USB_MSD=TRUE

# We are running on Proteus hardware!
DDEFS += -DHW_PROTEUS=1

# Proteus <=v0.2 needs ADC hack - vbatt is on ADC3
ifeq ($(PROTEUS_LEGACY),TRUE)
	DDEFS +=  -DUSE_ADC3_VBATT_HACK
endif

# Shared variables
ALLCPPSRC += $(BOARDCPPSRC)
ALLINC    += $(BOARDINC)
