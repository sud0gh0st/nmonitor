ifneq ($(KERNELRELEASE),) 
	obj-m += nmonitor.o
else 

KERNELDIR ?= /lib/modules/$(shell uname -r)/build 

PWD := $(shell pwd)

default: 
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
	gcc -o config nmonitor_usr.c -g
install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
	
endif 

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm config
