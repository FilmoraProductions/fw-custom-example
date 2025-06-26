/* Linker script para STM32H723VG - 1MB Flash, 448KB AXI RAM */

MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 1024K
  RAM_AXIRAM (xrw): ORIGIN = 0x30000000, LENGTH = 448K
}

ENTRY(Reset_Handler)

SECTIONS
{
  .text : {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
    *(.glue_7)
    *(.glue_7t)
    _etext = .;
  } > FLASH

  .data : AT(_etext) {
    _sdata = .;
    *(.data*)
    _edata = .;
  } > RAM_AXIRAM

  .bss : {
    _sbss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } > RAM_AXIRAM

  .stack (COPY) : {
    _estack = .;
    . = . + 0x2000; /* 8 KB stack */
  } > RAM_AXIRAM

  . = ALIGN(4);
  end = .;
}
