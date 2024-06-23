/*
	* Fragt übergeben GPIO<IN> Pins ab und schaltet GPIO<OUT> Pin 
	* auf EIN oder AUS. 
	* EIN = 1, wenn mindesten einer der GPIO<IN> Pins ist Ein
	* AUS = 0, wenn alle GPIO<IN> sind Aus
	
	
	* The code can be compiled and run with
	root@pi:~# gcc -o switch_powesupply switch_powesupply.c
	root@pi:~# ./switch_powesupply GPIO<IN1> GPIO<IN2> GPIO<IN3> GPIO<14> GPIO<IN5> GPIO<IN6> GPIO<IN7> GPIO<IN8> GPIO<OUT>
	GPIO 17 is high
	root@pi:~# ./gpio_relay off
	GPIO 17 is low

  */
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>

#define IOBASE   0x20000000

#define GPIO_BASE (IOBASE + 0x200000)

#define GPFSEL0    *(gpio.addr + 0)
#define GPFSEL1    *(gpio.addr + 1)
#define GPFSEL2    *(gpio.addr + 2)
#define GPFSEL3    *(gpio.addr + 3)
#define GPFSEL4    *(gpio.addr + 4)
#define GPFSEL5    *(gpio.addr + 5)
// Reserved @ word offset 6
#define GPSET0    *(gpio.addr + 7)
#define GPSET1    *(gpio.addr + 8)
// Reserved @ word offset 9
#define GPCLR0    *(gpio.addr + 10)
#define GPCLR1    *(gpio.addr + 11)
// Reserved @ word offset 12
#define GPLEV0    *(gpio.addr + 13)
#define GPLEV1    *(gpio.addr + 14)

#define BIT_17 (1 << 17)

#define PAGESIZE 4096
#define BLOCK_SIZE 4096

struct bcm2835_peripheral {
    unsigned long addr_p;
    int mem_fd;
    void *map;
    volatile unsigned int *addr;
};

struct bcm2835_peripheral gpio = {GPIO_BASE};

// Some forward declarations...
int map_peripheral(struct bcm2835_peripheral *p);
void unmap_peripheral(struct bcm2835_peripheral *p);

int gpio_state = -1;

////////////////
//  main()
////////////////
int main(int argc, char *argv[]) {

	int gpio_in_pin[8], 
		gpio_out_pin;
		
    if(argc == 9) {
		
		// Alle IN
		for (int i = 0; i<8; i++)
			gpio_in_pin[i] = atoi(argv[i]);
		
		// OUT 
        gpio_out_pin = atoi(argv[8]);
    } else {
		printf("Wrong Parameters!\n");
		printf("Start with:\n");
		printf("root@pi:~# ./switch_powesupply GPIO<IN1> GPIO<IN2> GPIO<IN3> GPIO<14> GPIO<IN5> GPIO<IN6> GPIO<IN7> GPIO<IN8> GPIO<OUT>\n");
		return -1;
	}

    if(map_peripheral(&gpio) == -1) {
        printf("Failed to map the physical GPIO registers into the virtual memory space.\n");
        return -1;
    }
	
	// Alle IN abfragen
	for (int i = 0; i<8; i++)
		gpio_in_pin[i]
	
		

    /* Set GPIO 17 as an output pin */
    GPFSEL1 &= ~(7 << 21); // Mask out bits 23-21 of GPFSEL1 (i.e. force to zero)
    GPFSEL1 |= (1 << 21);  // Set bits 23-21 of GPFSEL1 to binary '001'

    if(gpio_state == 0)
        GPCLR0 = BIT_17;
    else if(gpio_state == 1)
        GPSET0 = BIT_17;

    usleep(1);    // Delay to allow any change in state to be reflected in the LEVn, register bit.

    printf("GPIO 17 is %s\n", (GPLEV0 & BIT_17) ? "high" : "low");

    unmap_peripheral(&gpio);

    // Done!
}

// Exposes the physical address defined in the passed structure using mmap on /dev/mem
int map_peripheral(struct bcm2835_peripheral *p)
{
   // Open /dev/mem
   if ((p->mem_fd = open("/dev/mem", O_RDWR|O_SYNC) ) < 0) {
      printf("Failed to open /dev/mem, try checking permissions.\n");
      return -1;
   }

   p->map = mmap(
      NULL,
      BLOCK_SIZE,
      PROT_READ|PROT_WRITE,
      MAP_SHARED,
      p->mem_fd,  // File descriptor to physical memory virtual file '/dev/mem'
      p->addr_p      // Address in physical map that we want this memory block to expose
   );

   if (p->map == MAP_FAILED) {
        perror("mmap");
        return -1;
   }

   p->addr = (volatile unsigned int *)p->map;

   return 0;
}

void unmap_peripheral(struct bcm2835_peripheral *p) {

    munmap(p->map, BLOCK_SIZE);
    close(p->mem_fd);
}