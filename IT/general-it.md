## 1. Computers and Systems ##

- a computer kernel: the lowest layer of OS just above CPU and memory, the middleware between hardware, OS and apps. Two main design patterns for kernel: monolithic (e.g. linux, android, one bigger program that manages all tasks) and microkernel (e.g. windows, one smaller programs that talks to other tasks like drivers) https://www.youtube.com/watch?v=mycVSMyShk8

- Real-time operating system: A  real-time operating system (RTOS) is an operating system (OS) for real-time applications that processes data and events that have critically defined time constraints. An RTOS is distinct from a time sharing operating system, such as Unix, which manages the sharing of system resources with a scheduler, data buffers, or fixed task prioritization in a multitasking or multiprogramming environment. Processing time requirements need to be fully understood and bound rather than just kept as a minimum. All processing must occur within the defined constraints. Real-time operating systems are event-driven and preemptive, meaning the OS is capable of monitoring the relevant priority of competing tasks, and make changes to the task priority. Event-driven systems switch between tasks based on their priorities, while time-sharing systems switch the task based on clock interrupts. https://en.wikipedia.org/wiki/Real-time_operating_system
    - An RTOS is an operating system in which the time taken to process an input stimulus is less than the time lapsed until the next input stimulus of the same type.
    The most common designs are:
    Event-driven – switches tasks only when an event of higher priority needs servicing; called preemptive priority, or priority scheduling.
    Time-sharing – switches tasks on a regular clocked interrupt, and on events; called round robin.

- Processor register: A processor register is a quickly accessible location available to a computer's processor. Registers usually consist of a small amount of fast storage, although some registers have specific hardware functions, and may be read-only or write-only. In computer architecture, registers are typically addressed by mechanisms other than main memory, but may in some cases be assigned a memory address e.g. DEC PDP-10, ICT 1900. https://en.wikipedia.org/wiki/Processor_register
 
