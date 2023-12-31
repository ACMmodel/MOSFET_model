# Technical Documents 

This section presents selected technical documents about the ACM model:


[2023 - A 5-DC-parameter MOSFET model for circuit simulation in QucsStudio and Spectre](https://ieeexplore.ieee.org/document/10198173)

 Abstract: 
> A minimalist MOSFET model for circuit simulation
> with only five DC parameters written in Verilog-A is presented.
> The five parameters can be extracted from direct and simple
> methods in common circuit simulators. The DC characteristics
> of transistors in both 180-nm bulk CMOS and 28-nm FD-SOI
> technologies generated by the five-parameter model are compared
> with those generated by the BSIM and UTSOI2 models, respectively.
> The simulation of some basic circuits using the proposed
> 5-DC-parameter MOSFET model shows good matching with the
> simulation using the BSIM model, for the benefit of a much
> a simpler set of DC parameters.






[2022 - Bridging the gap between design and simulation of low-voltage CMOS circuits](https://www.mdpi.com/2079-9268/12/2/34)

Abstract: 
> This work proposes a truly compact MOSFET model that contains only four parameters
> to assist an integrated circuits (IC) designer in a design by hand. The four-parameter model (4PM)
> is based on the advanced compact MOSFET (ACM) model and was implemented in Verilog-A to
> simulate different circuits designed with the ACM model in Verilog-compatible simulators. Being
> able to simulate MOS circuits through the same model used in a hand design benefits designers
> in understanding how the main MOSFET parameters affect the design. Herein, the classic CMOS
> inverter, a ring oscillator, a self-biased current source and a common source amplifier were designed
> and simulated using either the 4PM or the BSIM model. The four-parameter model was simulated
> in many sorts of circuits with very satisfactory results in the low-voltage cases. As the ultra-lowvoltage (ULV) domain is expanding due to applications, such as the internet of things and wearable
> circuits, so is the use of a simplified ULV MOSFET model.


[2018 - The compact all-region MOSFET model theory and applications](https://ieeexplore.ieee.org/document/8585657)

Abstract: 
> A compact presentation of the basic theory of the
> MOS transistor is given. Instead of the usual approach of
> furnishing separate analytical formulas for the strong and weak
> inversion regions of the MOS transistor, we provide simple
> formulas which are valid in all operating regions, including
> moderate inversion. We review ultra-low-power circuits
> operating near the threshold condition that allows the automatic
> extraction of the specific current IS and the threshold voltage VT
> of MOS transistors, which are the most fundamental parameters
> for technology characterization, circuit design, and testing.

[2000 - Advanced compact model for short-channel MOS transistors](https://ieeexplore.ieee.org/document/852650)

Abstract: 
> This paper introduces the advanced compact MOSFET (ACM) model, a physically based model of the MOS transistor, derived from the long-channel transistor model presented in (1). The ACM model is composed of very simple expressions, is valid for any inversion level, conserves charge > > and preserves the source-drain symmetry of the transistor. Short-channel effects are included using a compact and physical approach. The performance of the ACM model in benchmark tests demonstrates its suitability for circuit simulation.


