# Advanced Compact MOSFET model (ACM)
 ACM is a simple MOSFET model to design and simulate Analog, Mixed-Signal, and RF circuits

As of July 2023, this repository targets to release all future versions and technical support about the ACM model.


# Current Status
>
> the authors of this repository are treating the current content as a **pre-release**
>

# About ACM
The ACM is a charge-based physical model. All the large signal characteristics (currents and charges) and the small signal parameters ((trans)conductances and (trans)capacitances) are given by single-piece expressions in all regions of operation. It also preserves the structural source-drain symmetry of the transistor.

The model is available for commercial and open-source EDA tools due to the versatility of the Verilog-A language.
This repository presents the Verilog-A code for the NMOS and PMOS transistors, documentation about the model through papers and reports, and comparison of the model with PDK models or measurements of the three available open-source process (Sky130, IHP, and GF180).


If you use the ACM2V0 in your research, please cite the paper.

D. G. Alves Neto, C. M. Adornes, G. Maranhão, et al. "A 5-DC-Parameter MOSFET Model for Circuit Simulation in QucsStudio and Spectre", 2023 21st IEEE Interregional NEWCAS Conference, Edinburgh, Scotland, June 26-28, 2023.


## Contact

Requests for more information about ACM model and other informations can be emailed to [enter email]

# License

The ACM model is released under the [Apache 2.0 license](LICENSE).

The copyright details are:
    
    Copyright 2023 ACM model Authors

    Licensed under the Apache License, Version 2.0 (the "License");
    You may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
