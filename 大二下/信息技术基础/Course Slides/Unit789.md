### **ISE 218 Units 7, 8, 9 知识点整理**

---

#### **Unit 07: System Software**

1. **操作系统历史与发展**  
   - **原文**: "In the 1960s, hardware had become powerful enough to accommodate multiprogramming, the concurrent execution of more than one task."  
   - **翻译**: 20世纪60年代，硬件性能足够支持多道程序设计，即同时执行多个任务。  
   - **关键点**:  
     - 多道程序设计（Multiprogramming）通过时间片（time slice）分配CPU时间。  
     - 分时系统（Timesharing）允许多用户通过终端交互使用计算机。  
     - 上下文切换（Context Switch）是进程替换时的状态保存与恢复过程。  

2. **多处理器系统类型**  
   - **原文**: "Tightly coupled multiprocessor systems share a common memory... Loosely coupled multiprocessor systems have physically separate memory."  
   - **翻译**: 紧耦合多处理器系统共享内存，松耦合多处理器系统（分布式系统）内存物理分离。  
   - **关键点**:  
     - 对称多处理器（SMP）是紧耦合且负载均衡的系统。  
     - 网络化系统（Networked System）由协作的工作站组成。  

3. **操作系统设计**  
   - **原文**: "Microkernel systems provide better security... Monolithic systems give faster execution speed."  
   - **翻译**: 微内核系统安全性更高，但单体内核系统执行速度更快。  
   - **关键点**:  
     - 微内核（如MINIX）将服务模块化，单体内核（如Linux）集成所有功能。  
     - Windows采用混合内核设计。  

4. **进程调度算法**  
   - **原文**: "First-come, first-served... Shortest job first... Round robin... Priority scheduling."  
   - **翻译**: 先到先服务、最短作业优先、轮转调度、优先级调度。  
   - **关键点**:  
     - 轮转调度（Round Robin）使用时间量子（time quantum）。  
     - 优先级调度可能导致饥饿（Starvation）。  

5. **虚拟化与保护环境**  
   - **原文**: "Virtual machines are a protected environment that presents an image of itself."  
   - **翻译**: 虚拟机（VM）提供隔离环境，模拟硬件或不同架构。  
   - **关键点**:  
     - 逻辑分区（LPARs）用于服务器整合，隔离开发与生产环境。  

6. **编程工具**  
   - **原文**: "Compilers bridge the semantic gap between the higher level language and the machine’s binary instructions."  
   - **翻译**: 编译器将高级语言转换为机器码，解释器（如Python）逐行实时执行。  
   - **关键点**:  
     - Java通过JVM实现“一次编写，到处运行”，兼具编译与解释特性。  

---

#### **Unit 08: Network Organization and Architecture**

1. **OSI模型分层**  
   - **原文**: "The basic unit of data in the OSI model is the protocol data unit (PDU)."  
   - **翻译**: OSI模型的基本数据单元是协议数据单元（PDU）。  
   - **关键点**:  
     - 物理层（Physical Layer）传输原始比特流。  
     - 数据链路层（Data Link Layer）处理帧（Frame）和流量控制（Flow Control）。  
     - 网络层（Network Layer）负责路由（Routing）和寻址。  

2. **TCP/IP模型**  
   - **原文**: "TCP/IP is the de facto global data communications standard."  
   - **翻译**: TCP/IP是实际上的全球数据通信标准。  
   - **关键点**:  
     - 与OSI模型对应：传输层（TCP）提供端到端可靠性，网络层（IP）处理路由。  

3. **IPv4地址分类**  
   - **原文**: "The IPv4 Address Space is divided into five different classes."  
   - **翻译**: IPv4地址空间分为五类（A-E类）。  
   - **关键点**:  
     - A类网络最大主机数：2²⁴（例：221.15.220.192属于C类）。  

4. **TCP拥塞控制**  
   - **原文**: "TCP uses the congestion control scheme known as additive-increase/multiplicative-decrease (AIMD)."  
   - **翻译**: TCP通过“加性增/乘性减”（AIMD）调整窗口大小。  
   - **关键点**:  
     - 窗口动态调整以避免丢包（例：ACK 1500后发送1500-1599字节）。  

---

#### **Unit 09: Performance Measurement and Analysis**

1. **磁盘调度算法**  
   - **原文**: "Clever disk scheduling algorithms endeavor to minimize seek time."  
   - **翻译**: 磁盘调度算法旨在减少寻道时间。  
   - **关键点**:  
     - **FCFS**：按请求顺序服务（例：23, 95, 44...）。  
     - **SSTF**：最短寻道优先（可能饥饿）。  
     - **SCAN/C-SCAN**：电梯算法（单向或循环扫描）。  
     - **LOOK/C-LOOK**：仅扫描有请求的磁道。  

2. **性能基准测试**  
   - **原文**: "Performance benchmarking is the science of making objective assessments."  
   - **翻译**: 性能基准测试用于客观评估系统性能。  
   - **关键点**:  
     - 无单一指标能完全反映实际应用性能。  

---

### **总结**  
- **Unit 7**: 操作系统核心概念（调度、内核、虚拟化）。  
- **Unit 8**: 网络分层（OSI/TCP/IP）、IPv4、TCP传输控制。  
- **Unit 9**: 磁盘调度算法（FCFS/SSTF/SCAN）与性能评估。