pragma solidity ^0.8.0;

contract first{
    uint public first_firstCont=10;
    function firstFunction_FirstCont() payable public returns(uint,uint){
        first_firstCont=first_firstCont+1;
        return (address(this).balance,first_firstCont);
    }
    
}

contract second{
    uint public first_firstCont=10;
    function firstFunction_SecondCont(address first_address) public returns(bool success, bytes memory data){
        (success, data)=first_address.call(abi.encodeWithSignature("firstFunction_FirstCont()"));
    }
    function secondFunction_SecondCont(address payable first_address) payable public returns(bool success){
        (success,)=first_address.call{value: 10 ether}(abi.encodeWithSignature("firstFunction_FirstCont()"));
    }
    function thirdFunction_SecondCont(address first_address) public returns(bool success, bytes memory data){
        (success, data)=first_address.delegatecall{gas: 10000}(abi.encodeWithSignature("firstFunction_FirstCont()"));
    }
    function fourthFunction_SecondCont(address first_address) public returns(bool success, bytes memory data){
        (success, data)=first_address.staticcall(abi.encodeWithSignature("firstFunction_FirstCont()"));
    }
}

