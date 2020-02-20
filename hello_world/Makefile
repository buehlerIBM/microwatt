ARCH = $(shell uname -m)
ifneq ("$(ARCH)", "ppc64")
ifneq ("$(ARCH)", "ppc64le")
        CROSS_COMPILE = powerpc64le-linux-
        endif
        endif

CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy

CFLAGS = -Os -g -Wall -std=c99 -msoft-float -mno-string -mno-multiple -mno-vsx -mno-altivec -mlittle-endian -fno-stack-protector -mstrict-align -ffreestanding -fdata-sections -ffunction-sections 
ASFLAGS = $(CFLAGS)
LDFLAGS = -T powerpc.lds

all: $(FNAME).hex

$(FNAME).elf: $(FNAME).o head.o
	$(LD) $(LDFLAGS) -o $(FNAME).elf $(FNAME).o head.o

$(FNAME).bin: $(FNAME).elf
	$(OBJCOPY) -O binary $(FNAME).elf $(FNAME).bin

$(FNAME).hex: $(FNAME).bin
	../scripts/bin2hex.py $(FNAME).bin > $(FNAME).hex

clean:
	@rm -f *.o $(FNAME).elf $(FNAME).bin $(FNAME).hex
