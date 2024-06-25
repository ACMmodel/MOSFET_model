# Advanced Compact MOSFET model 2 (ACM2)
 ACM2 is a simple MOSFET model to design and simulate Analog, Mixed-Signal, and RF circuits

As of July 2023, this repository aims to release all future versions and provide technical support for the ACM2 model.


# Current Status
>
> The authors of this repository are treating the current content as a **pre-release**
>

# About ACM2
The ACM2 is a charge-based physical model. All the large signal characteristics (currents and charges) and the small signal parameters ((trans)conductances and (trans)capacitances) are given by single-piece expressions in all regions of operation. It also preserves the structural source-drain symmetry of the transistor.

The model is available for commercial and open-source EDA tools due to the versatility of the Verilog-A language.
This repository presents the Verilog-A code for the NMOS and PMOS transistors, documentation about the model through papers and reports, and a comparison of the model with PDK models or measurements of the three available open-source processes (Sky130, IHPSG13, and GF180MCU).


Researchers are kindly requested to include the following citation if the ACM2 model is used in their research.

D. G. A. Neto et al., "[Design-oriented single-piece 5-DC-parameter MOSFET model](https://ieeexplore.ieee.org/document/10565864)", in IEEE Access, doi: 10.1109/ACCESS.2024.3417316.

[ACM model Report](/docs/ACM_Report_Github.pdf)

More about the ACM2:
[Integrated Circuit laboratory](https://lci.ufsc.br/) @ Universidade Federal de Santa Catarina

## Contact

Requests for more information about ACM2 model or related information can be emailed to acmmodelgit@gmail.com

# License

The ACM model is released under the [ECL-2.0 license](LICENSE).

The copyright details are:
    
        Copyright 2023 Universidade Federal de Santa Catarina Licensed under the
        Educational Community License, Version 2.0 (the "License"); you may
        not use this file except in compliance with the License. You may
        obtain a copy of the License at

http://opensource.org/licenses/ECL-2.0

        Unless required by applicable law or agreed to in writing,
        software distributed under the License is distributed on an "AS IS"
        BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
        or implied. See the License for the specific language governing
        permissions and limitations under the License.
