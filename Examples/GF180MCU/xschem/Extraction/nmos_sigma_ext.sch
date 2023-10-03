v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 40 120 550 510 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1


divx=6

xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0





















linewidth_mult=4.0
subdivx=3


x1=0.2
x2=3.4893




y1=0.0011
y2=0.0024
color=4
node=sigma}
N -360 340 -360 430 {
lab=#net1}
N -210 390 -210 460 {
lab=Vg}
N -320 460 -210 460 {
lab=Vg}
N -360 300 -230 300 {
lab=#net1}
N -360 290 -360 340 {
lab=#net1}
N -190 300 -90 300 {
lab=Vd}
N -90 300 -90 400 {
lab=Vd}
N -360 490 -360 510 {
lab=GND}
N -360 510 -90 510 {
lab=GND}
N -90 460 -90 510 {
lab=GND}
N -170 340 -150 340 {
lab=GND}
N -370 460 -360 460 {
lab=GND}
N -370 460 -370 510 {
lab=GND}
N -370 510 -360 510 {
lab=GND}
N -360 210 -360 230 {
lab=#net2}
N -410 210 -360 210 {
lab=#net2}
N -410 210 -410 230 {
lab=#net2}
N -410 290 -410 300 {
lab=GND}
C {devices/launcher.sym} 105 95 0 0 {name=h4 
descr="Ctrl-Left-Click to load/unload" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw dc
"
}
C {devices/code_shown.sym} -440 -30 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code.sym} -450 80 0 0 {name=NGSPICE
only_toplevel=true
value="

.control
save all

dc Vd 0.2 3.5 25.9m

let vd_interp = 3.3/3
let sigma = -deriv(V(vg))/deriv(V(vd))
save sigma

echo
echo
echo


echo Sigma @ VD=$&vd_interp:
meas dc sigma_value FIND sigma WHEN V(vd)=vd_interp

echo
echo
echo
write nmos_sigma_ext.raw

.endc


" }
C {/home/gmaranhao/Desktop/gf180_work/auxLib/ampOp_ideal.sym} -180 260 3 1 {name=x1}
C {symbols/nfet_03v3.sym} -340 460 0 1 {name=M2
L=0.5u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/isource.sym} -360 260 0 0 {name=I0 value=10n}
C {devices/vsource.sym} -90 430 0 0 {name=Vd value=}
C {devices/gnd.sym} -220 510 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -150 340 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -410 260 0 1 {name=Vdd value=3.3}
C {devices/gnd.sym} -410 300 0 1 {name=l3 lab=GND}
C {devices/lab_wire.sym} -250 460 0 0 {name=p1 sig_type=std_logic lab=Vg}
C {devices/lab_wire.sym} -120 300 0 0 {name=p2 sig_type=std_logic lab=Vd}
