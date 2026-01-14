obj-m += samsung-galaxybook.o

KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	rm -f *.o *.ko *.mod.c *.mod *.order *.symvers

install:
	sudo cp samsung-galaxybook.ko /lib/modules/$(shell uname -r)/kernel/drivers/platform/x86/
	sudo depmod -a
	@echo "Driver installed. Load with: sudo modprobe samsung-galaxybook"

load:
	sudo insmod samsung-galaxybook.ko
	@echo "Driver loaded. Check dmesg for messages."

unload:
	sudo rmmod samsung-galaxybook || true

test: load
	@echo "Checking for SAM0430 device..."
	@ls /sys/bus/acpi/devices/ | grep SAM0430 || echo "SAM0430 not found"
	@echo ""
	@echo "Checking for charge threshold attribute..."
	@ls -la /sys/class/power_supply/BAT1/charge_control_end_threshold 2>/dev/null || echo "Attribute not found (driver may not have loaded)"
	@echo ""
	@echo "Kernel messages:"
	@dmesg | grep -i samsung | tail -10

.PHONY: all clean install load unload test
