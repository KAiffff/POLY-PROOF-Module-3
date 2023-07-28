pragma circom 2.0.0;

 

template KaifCircuit () {  

   // signal inputs

   signal input a;
   signal input b;



   signal c;
   signal d;


   signal output e;

// component gates used to create custom circuit

   component andGate = AND();
   component notgate = NOT();
   component norGate = NOR();

// circuit logic

   andGate.a <== a;
   andGate.b <== b;
   c <== andGate.out;

   notgate.in <== b;
   d <== notgate.out;

   norGate.c <== c;
   norGate.d <== d;
   e <== norGate.out;

}
// template for AND
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
// template for NOT
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
// template for NOR
template NOR() {
    signal input c;
    signal input d;
    signal output out;

    out <== c*d + 1 - c - d;
}


component main = KaifCircuit();
