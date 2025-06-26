# Fonte principal da placa
BOARDCPPSRC = $(BOARD_DIR)/board_configuration.cpp

# Define o MCU usado (importante para ChibiOS e HAL)
CHIBIOS_MCU_TYPE = STM32H723xx

# Arquivos de board do ChibiOS (usar algo próximo se o H723 não tiver board oficial)
# Caso ainda não tenha suporte direto, comente abaixo e implemente drivers manualmente
# BOARD_C = $(CHIBIOS)/os/hal/boards/ST_STM32H723VG/board.c
# BOARDINC = $(CHIBIOS)/os/hal/boards/ST_STM32H723VG/

# Linker script da sua placa
LDSCRIPT = $(BOARD_DIR)/stm32h723vg.ld

# Flags específicas do processador
BOARD_FLAGS := -mcpu=cortex-m7 -mfloat-abi=hard -mfpu=fpv5-d16

# Desativa módulos pesados por enquanto (opcional)
DDEFS += -DEFI_LUA=FALSE
DDEFS += -DEFI_USB_SERIAL_DM=Gpio::Unassigned
DDEFS += -DEFI_USB_SERIAL_DP=Gpio::Unassigned
DDEFS += -DEFI_DYNO_VIEW=FALSE

# Informação de ID da firmware (para logs/debugs)
DDEFS += -DFIRMWARE_ID=\"h723vg\"
DDEFS += -DSTATIC_BOARD_ID=STATIC_BOARD_ID_H723VG

# Tipo de motor padrão
DDEFS += -DDEFAULT_ENGINE_TYPE=engine_type_e::MINIMAL_PINS

# Se usar OpenOCD para gravação
BUNDLE_OPENOCD = yes

BOARD_C = $(BOARD_DIR)/board.c
BOARDINC = $(BOARD_DIR)
