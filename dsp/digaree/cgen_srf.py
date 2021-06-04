#!/usr/bin/python

# SRF cavity analog state computer
# Takes in cavity field, forward, and reverse vector measurements
# and computes the cavity detune frequency, decay parameter, and
# power imbalance for the purposes of a tuning loop and quench detector.
# Keeps a history of the previous four cavity field mesurements so it
# can get dV/dt.

# Output of this program should be both valid c99 and valid input
# for the scheduler/mapper.
# See the rest of the Digaree infrastructure for details.

from cgen_lib import cgen_init, given, mul, sub, cpx_sub, cpx_mul
from cgen_lib import cpx_scale, cpx_dot, cpx_inv_conj, cpx_mul_conj
from cgen_lib import cpx_mag, set_result, cpx_persist, cpx_copy, cpx_add
cgen_init("cgen_srf.py")

# History of measured cavity voltages, used to compute dV/dt
# Initial value in simulation should be settable from initgen?
# Cut-and-paste for now, until we at least get the right answer.
cpx_persist("v1")
cpx_persist("v2")
cpx_persist("k1")
cpx_persist("r1")

# These lines declare the input variables,
# first six streamed from the radio
given("k_r")  # forward
given("k_i")  # forward
given("r_r")  # reverse
given("r_i")  # reverse
given("v_r")  # cavity
given("v_i")  # cavity
# next eight host-settable
given("beta_r")
given("beta_i")
given("invT")
given("two")  # needed by 1/x macro
given("sclr")
given("sclf")
given("sclv")
given("powt")

# Get (still unscaled) derivative
# Implements [-1 0 1] FIR
cpx_sub("dvxh", "v", "v2", 3)  # note multiply-by-4
cpx_add("dvx", "dvxh", "dvxh", 1)  # stupid scale-up by another factor of 2
# Result is the amount that V will change in 16*T.
# Including the second-order CIC used to generate input samples,
# this computation has a 2*T group delay.
# Forward and reverse signals are internally delayed to match.

# State-variable computation of the complex number a,
# yielding detune frequency and decay rate
cpx_inv_conj("x5", "v", 0, 3)  # XXX fails if we change v to v1
# (because final multiply by v1 happens after the cpx_copy("v1", "v")
# step listed below)
cpx_scale("dvdt", "dvx", "invT", 1)
cpx_mul("x3", "k1", "beta", 1, 1)
cpx_sub("x4", "dvdt", "x3", 2)   # some evidence this shift should be 1
cpx_mul_conj("a", "x4", "x5", 2, 2)
set_result("ab", "a_r", "a_i")

# Power balance measure of cavity dissipation; uses magnitudes only
cpx_mag("magr", "r1", 0)  # reverse
mul("powr", "sclr", "magr", 0)
cpx_mag("magf", "k1", 0)  # forward
mul("powf", "sclf", "magf", 0)
sub("wgnet", "powf", "powr", 1)  # net power transferred by waveguide
cpx_dot("dv2", "v1", "dvx", 2)    # 2 * V * dV/dt = d/dt(V^2)
mul("dudt", "dv2", "sclv", 3)  # dU/dt = power to stored energy
sub("diss", "wgnet", "dudt", 1)  # est. of dissipation in cold cavity
sub("perr", "diss", "powt", 1)  # allow for measurement error
set_result("cd", "diss", "perr")  # trigger quench fault if perr > 0

# Watch these like a hawk:  order of execution matters,
# unlike everything else here
cpx_copy("v2", "v1")
cpx_copy("v1", "v")
cpx_copy("k1", "k")
cpx_copy("r1", "r")
