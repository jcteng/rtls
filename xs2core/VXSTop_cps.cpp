// Verilated -*- C++ -*-
// DESCRIPTION: main() calling loop, created with Verilator --main

#include "verilated.h"
#include "VXSTop.h"
#include <chrono>
#if 1
#include <verilated_fst_c.h>
#endif
//======================

int main(int argc, char** argv, char**) {
    // Setup context, defaults, and parse command line
    Verilated::debug(0);
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    contextp->commandArgs(argc, argv);
    
    // Construct the Verilated model, from Vtop.h generated from Verilating
    const std::unique_ptr<VXSTop> topp{new VXSTop{contextp.get()}};
#if 1       
    VerilatedFstC* tfp = new VerilatedFstC;


    contextp->traceEverOn(true);
    topp->eval();
    topp->trace(tfp, 99);
    tfp->open("simx.fst");
#endif 

    uint64_t count = 0;
    auto start = std::chrono::high_resolution_clock::now();
    // Simulate until $finish
    while (!contextp->gotFinish()) {
        // Evaluate model
        topp->io_clock = 0;
        
        topp->eval();
#if 1               
        if (tfp) tfp->dump(contextp->time());
#endif         // Advance time
        contextp->timeInc(200);
        topp->io_clock = 1;
        topp->eval();
#if 1               
        if (tfp) tfp->dump(contextp->time());
#endif         
        // Advance time
        contextp->timeInc(200);
        count++;

        if(!(count%1000)){
                
                auto end = std::chrono::high_resolution_clock::now();
                auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
                printf("cycle count %ld - %ld ms %ld cps \n",count,duration,(1000*1000)/duration);
                start =std::chrono::high_resolution_clock::now();
                // contextp->statsPrintSummary();
        }
        if(count > 10000){
            break;
        }
    }

    if (!contextp->gotFinish()) {
        VL_DEBUG_IF(VL_PRINTF("+ Exiting without $finish; no events left\n"););
    }

    // Execute 'final' processes
    topp->final();
#if 1               
    if (tfp) tfp->close();
#endif     
    
    // Print statistical summary report
    //contextp->statsPrintSummary();

    return 0;
}
