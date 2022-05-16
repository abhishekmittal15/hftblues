# HFT in HDL

This repository contains my learnings about creating a High Frequency Trading System in a Hardware Description Language. I will be exploring the following languages
1. Bluespec 
2. SystemVerilog 
3. Verilog

Usually when a system is designed for extremely low latency, people opt for 1 of these 2 solutions:

1. Write C++ Code and then optimise it alot. They achieve some impressive performance but still they have to be at the mercy of the General Purpose Architecture to execute the instructions in their code. Now the GPA is meant for compatibility and not performance. 
2. Construct hardware from scratch based on the requirements directly. This is a time consuming process and does not offer much flexibility when changes need to be made, but the performance reaches its alpha level. 
